Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C42DDF80
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 09:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56379.98701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqB6o-0008QT-Rm; Fri, 18 Dec 2020 08:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56379.98701; Fri, 18 Dec 2020 08:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqB6o-0008Q4-O0; Fri, 18 Dec 2020 08:27:30 +0000
Received: by outflank-mailman (input) for mailman id 56379;
 Fri, 18 Dec 2020 08:27:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ets7=FW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kqB6m-0008Pz-PH
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 08:27:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51ff92f1-5ae2-4bcf-a004-262658c7d973;
 Fri, 18 Dec 2020 08:27:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86E71ACC4;
 Fri, 18 Dec 2020 08:27:26 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 51ff92f1-5ae2-4bcf-a004-262658c7d973
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608280046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6moIg9ArN4Y+PEYC9f+3+7ugZX6EBBqarTBEIg1Rn8=;
	b=U3cFEsB1FkmIsImROYSit1Ow2pC+A5gfqD3eERVHUVaE8xO/HngT7nPVhcyp/DPYrMpZ79
	dZPD1hsuCtsTwR6asqY520BZBd98HIUxeVnynKnBdOc/ESmVVLPf/8/58aoU/4jaUMXbKy
	61qrXOOhPzs8ynNU967mAzr+k9Ew/Cw=
Subject: Re: [PATCH] xen/x86: Fix memory leak in vcpu_create() error path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>
References: <20200928154741.2366-1-andrew.cooper3@citrix.com>
 <33331c3a-1fd5-1ef6-16a3-21d2a6672e90@suse.com>
 <9556aeb3-2a7c-7aea-4386-6e561dd9ef6e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e652863-5ada-0327-5817-cdb2e652e066@suse.com>
Date: Fri, 18 Dec 2020 09:27:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9556aeb3-2a7c-7aea-4386-6e561dd9ef6e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.12.2020 22:46, Andrew Cooper wrote:
> On 29/09/2020 07:18, Jan Beulich wrote:
>> On 28.09.2020 17:47, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -563,30 +563,37 @@ void hap_final_teardown(struct domain *d)
>>>      paging_unlock(d);
>>>  }
>>>  
>>> +void hap_vcpu_teardown(struct vcpu *v)
>>> +{
>>> +    struct domain *d = v->domain;
>>> +    mfn_t mfn;
>>> +
>>> +    paging_lock(d);
>>> +
>>> +    if ( !paging_mode_hap(d) || !v->arch.paging.mode )
>>> +        goto out;
>> Any particular reason you don't use paging_get_hostmode() (as the
>> original code did) here? Any particular reason for the seemingly
>> redundant (and hence somewhat in conflict with the description's
>> "with the minimum number of safety checks possible")
>> paging_mode_hap()?
> 
> Yes to both.  As you spotted, I converted the shadow side first, and
> made the two consistent.
> 
> The paging_mode_{shadow,hap})() is necessary for idempotency.  These
> functions really might get called before paging is set up, for an early
> failure in domain_create().

In which case how would v->arch.paging.mode be non-NULL already?
They get set in {hap,shadow}_vcpu_init() only.

> The paging mode has nothing really to do with hostmode/guestmode/etc. 
> It is the only way of expressing the logic where it is clear that the
> lower pointer dereferences are trivially safe.

Well, yes and no - the other uses of course should then also use
paging_get_hostmode(), like various of the wrappers in paging.h
do. Or else I question why we have paging_get_hostmode() in the
first place. There are more examples in shadow code where this
gets open-coded when it probably shouldn't be. There haven't been
any such cases in HAP code so far ...

Additionally (noticing only now) in the shadow case you may now
loop over all vCPU-s in shadow_teardown() just for
shadow_vcpu_teardown() to bail right away. Wouldn't it make sense
to retain the "if ( shadow_mode_enabled(d) )" there around the
loop?

Jan

