Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2932008CE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 14:37:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGGw-0003vn-Ft; Fri, 19 Jun 2020 12:37:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jmGGv-0003vi-I9
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:37:29 +0000
X-Inumbo-ID: a2b21280-b229-11ea-bb79-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2b21280-b229-11ea-bb79-12813bfff9fa;
 Fri, 19 Jun 2020 12:37:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EF96AAEBF;
 Fri, 19 Jun 2020 12:37:26 +0000 (UTC)
Subject: Re: [PATCH for-4.14 6/8] x86/vpt: fix injection to remote vCPU
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-7-roger.pau@citrix.com>
 <57b6f9fd-4cbc-abc9-09e3-6493eba6c377@suse.com>
 <20200618171413.GX735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <164b1af6-a1e0-c25d-0d79-062803cc7c77@suse.com>
Date: Fri, 19 Jun 2020 14:37:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618171413.GX735@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 19:14, Roger Pau Monné wrote:
> On Thu, Jun 18, 2020 at 05:12:17PM +0200, Jan Beulich wrote:
>> On 12.06.2020 17:56, Roger Pau Monne wrote:
>>>      case PTSRC_ioapic:
>>>          pt_vector = hvm_ioapic_assert(v->domain, irq, level);
>>> -        if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
>>> -        {
>>> -            pt_vector = -1;
>>> -            if ( level )
>>> +        if ( pt_vector < 0 )
>>> +            return pt_vector;
>>> +
>>> +        break;
>>> +    }
>>> +
>>> +    ASSERT(pt_vector >= 0);
>>> +    if ( !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
>>> +    {
>>> +        time_cb *cb = NULL;
>>> +        void *cb_priv;
>>> +
>>> +        /*
>>> +         * Vector has been injected to a different vCPU, call pt_irq_fired and
>>> +         * execute the callback, since the destination vCPU(s) won't call
>>> +         * pt_intr_post for it.
>>
>> ... this isn't the only reason to come here. Beyond what the comment
>> says there is the hvm_domain_use_pirq() check in assert_gsi() which
>> would similarly result in the IRR bit not observed set here. At the
>> very least these cases want mentioning; I have to admit that I'm not
>> entirely clear yet whether your handling is correct for both, or
>> whether the information needs to be propagated into here.
> 
> I always forget about that weird pirq stuff (and I'm refraining from
> using other adjectives) that we have for HVM.
> 
> AFAICT vpt is already broken when trying to inject interrupts
> generated from it over an event channel. hvm_ioapic_assert will return
> whatever garbage is in the IO-APIC entry, which will likely not be
> initialized because the GSI is routed over an event channel.
> 
> I really have no idea what hvm_ioapic_assert should return in that
> case, the event channel callback vector maybe?
> 
> Maybe just returning -1 would be fine, a guest using this routing of
> pirqs over event channels shouldn't be using any of the emulated
> timers, and hence vpt is not required to be functional in that case?

I would guess(!) that -1 ought to be fine. But this whole thing
escapes me as well, so let's ask Stefano, who iirc was who
introduced this.

Jan

