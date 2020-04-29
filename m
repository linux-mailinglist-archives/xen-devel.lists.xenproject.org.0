Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE91BD75B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 10:35:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTiBq-0003fI-4G; Wed, 29 Apr 2020 08:35:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTiBp-0003fC-8u
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 08:35:33 +0000
X-Inumbo-ID: 637db996-89f4-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 637db996-89f4-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 08:35:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD6F6AB3D;
 Wed, 29 Apr 2020 08:35:30 +0000 (UTC)
Subject: Re: [PATCH] x86/pass-through: avoid double IRQ unbind during domain
 cleanup
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6fddc420-b582-cb2f-92ce-b3e067c420c4@suse.com>
 <20200428161412.GU28601@Air-de-Roger>
 <c0f222dc-2b7a-be54-29a1-75bcc5686dde@suse.com>
 <20200429082616.GX28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33a52f15-caff-a0f8-8387-b0c552c80c26@suse.com>
Date: Wed, 29 Apr 2020 10:35:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429082616.GX28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Varad Gautam <vrd@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 10:26, Roger Pau Monné wrote:
> On Wed, Apr 29, 2020 at 09:37:11AM +0200, Jan Beulich wrote:
>> On 28.04.2020 18:14, Roger Pau Monné wrote:
>>> On Tue, Apr 28, 2020 at 02:21:48PM +0200, Jan Beulich wrote:
>>>> XEN_DOMCTL_destroydomain creates a continuation if domain_kill -ERESTARTs.
>>>> In that scenario, it is possible to receive multiple _pirq_guest_unbind
>>>> calls for the same pirq from domain_kill, if the pirq has not yet been
>>>> removed from the domain's pirq_tree, as:
>>>>   domain_kill()
>>>>     -> domain_relinquish_resources()
>>>>       -> pci_release_devices()
>>>>         -> pci_clean_dpci_irq()
>>>>           -> pirq_guest_unbind()
>>>>             -> __pirq_guest_unbind()
>>>>
>>>> Avoid recurring invocations of pirq_guest_unbind() by removing the pIRQ
>>>> from the tree being iterated after the first call there. In case such a
>>>> removed entry still has a softirq outstanding, record it and re-check
>>>> upon re-invocation.
>>>>
>>>> Reported-by: Varad Gautam <vrd@amazon.de>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> Tested-by: Varad Gautam <vrd@amazon.de>
>>>>
>>>> --- a/xen/arch/x86/irq.c
>>>> +++ b/xen/arch/x86/irq.c
>>>> @@ -1323,7 +1323,7 @@ void (pirq_cleanup_check)(struct pirq *p
>>>>      }
>>>>  
>>>>      if ( radix_tree_delete(&d->pirq_tree, pirq->pirq) != pirq )
>>>> -        BUG();
>>>> +        BUG_ON(!d->is_dying);
>>>
>>> I think to keep the previous behavior this should be:
>>>
>>> BUG_ON(!is_hvm_domain(d) || !d->is_dying);
>>>
>>> Since the pirqs will only be removed elsewhere if the domain is HVM?
>>
>> pirq_cleanup_check() is a generic hook, and hence I consider it more
>> correct to not have it behave differently in this regard for different
>> types of guests. IOW while it _may_ (didn't check) not be the case
>> today that this can be called multiple times even for PV guests, I'd
>> view this as legitimate behavior.
> 
> Previous to this patch pirq_cleanup_check couldn't be called multiple
> times, as it would result in the BUG triggering, that was true for
> both PV and HVM. Now that the removal of PIRQs from the tree is done
> elsewhere for HVM when the domain is dying the check needs to be
> relaxed for HVM at least. I would prefer if it was kept as-is for PV
> (since there's been no change in behavior for PV that could allow for
> multiple calls to pirq_cleanup_check), or else a small comment in the
> commit message would help clarify this is done on purpose.

I've added

"Note that pirq_cleanup_check() gets relaxed beyond what's strictly
 needed here, to avoid introducing an asymmetry there between HVM and PV
 guests."

Does this sound suitable to you?

Jan

