Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A1196534
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 11:56:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI950-0005AB-0P; Sat, 28 Mar 2020 10:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eoyf=5N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jI94z-0005A6-1U
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 10:52:41 +0000
X-Inumbo-ID: 3e51221e-70e2-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e51221e-70e2-11ea-bec1-bc764e2007e4;
 Sat, 28 Mar 2020 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QFFms4xgRiZ8YDvv1kYpQQ/6k57TgQtCnyWXJNiRxZk=; b=dvwvjYznZ2h+bVT9dC41XmW+ql
 +13xMuU4jJI5qQuM/r8ADsQnRxYpsyTawbqF36JHG5EUAqcjE6+/5zXxz0jZEEnq6/Bq/k5kvZRTR
 JZ42WOsJSOPpsXBNEutuiYOr4r0kH5x79uLgmIFGfTds49mfMbmHa5Ut5G/DO8KwuSMg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI94q-0007qC-W2; Sat, 28 Mar 2020 10:52:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI94q-0006ds-Kk; Sat, 28 Mar 2020 10:52:32 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-6-julien@xen.org>
 <b0d29ded-f0e8-013b-de43-22788cd8f599@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2be87441-05a6-6b58-23e3-da467230ffe7@xen.org>
Date: Sat, 28 Mar 2020 10:52:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b0d29ded-f0e8-013b-de43-22788cd8f599@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 05/17] xen/x86: Remove the non-typesafe
 version of pagetable_* helpers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 26/03/2020 15:39, Jan Beulich wrote:
> On 22.03.2020 17:14, julien@xen.org wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -952,25 +952,27 @@ int arch_set_info_guest(
>>       }
>>       else
>>       {
>> -        unsigned long pfn = pagetable_get_pfn(v->arch.guest_table);
>> +        mfn_t mfn = pagetable_get_mfn(v->arch.guest_table);
>>           bool fail;
>>   
>>           if ( !compat )
>>           {
>> -            fail = xen_pfn_to_cr3(pfn) != c.nat->ctrlreg[3];
>> +            fail = mfn_to_cr3(mfn) != c.nat->ctrlreg[3];
> 
> The patch, besides a few other comments further down, looks fine
> on its own, but I don't think it can be acked without seeing the
> effects of the adjustments pending to the patch introducing
> mfn_to_cr3() and friends.
> 
>> @@ -3116,24 +3116,24 @@ int vcpu_destroy_pagetables(struct vcpu *v)
>>   
>>       /* Free that page if non-zero */
>>       do {
>> -        if ( mfn )
>> +        if ( !mfn_eq(mfn, _mfn(0)) )
> 
> I admit I'm not fully certain either, but at the first glance
> 
>          if ( mfn_x(mfn) )
> 
> would seem more in line with the original code to me (and then
> also elsewhere).

It is doing *exactly* the same things. The whole point of typesafe is to 
use typesafe helper not open-coding test everywhere.

It is also easier to spot any use of MFN 0 within the code as you know 
could grep "_mfn(0)".

Therefore I will insist to the code as-is.

> 
>> @@ -3560,19 +3561,18 @@ long do_mmuext_op(
>>               if ( unlikely(rc) )
>>                   break;
>>   
>> -            old_mfn = pagetable_get_pfn(curr->arch.guest_table_user);
>> +            old_mfn = pagetable_get_mfn(curr->arch.guest_table_user);
>>               /*
>>                * This is particularly important when getting restarted after the
>>                * previous attempt got preempted in the put-old-MFN phase.
>>                */
>> -            if ( old_mfn == op.arg1.mfn )
>> +            if ( mfn_eq(old_mfn, new_mfn) )
>>                   break;
>>   
>> -            if ( op.arg1.mfn != 0 )
>> +            if ( !mfn_eq(new_mfn, _mfn(0)) )
> 
> At least here I would clearly prefer the old code to be kept.

See above.

> 
>> @@ -3580,19 +3580,19 @@ long do_mmuext_op(
>>                       else if ( rc != -ERESTART )
>>                           gdprintk(XENLOG_WARNING,
>>                                    "Error %d installing new mfn %" PRI_mfn "\n",
>> -                                 rc, op.arg1.mfn);
>> +                                 rc, mfn_x(new_mfn));
> 
> Here I'm also not sure I see the point of the conversion.

op.arg1.mfn and mfn are technically not the same type. The former is a 
xen_pfn_t, whilst the latter is mfn_t.

In practice they are both unsigned long on x86, so it should be fine to 
use PRI_mfn. However, I think this is an abuse and we should aim to use 
the proper PRI_* for a type.

> 
>> @@ -2351,11 +2351,11 @@ int sh_safe_not_to_sync(struct vcpu *v, mfn_t gl1mfn)
>>       ASSERT(mfn_valid(smfn));
>>   #endif
>>   
>> -    if ( pagetable_get_pfn(v->arch.shadow_table[0]) == mfn_x(smfn)
>> +    if ( mfn_eq(pagetable_get_mfn(v->arch.shadow_table[0]), smfn)
>>   #if (SHADOW_PAGING_LEVELS == 3)
>> -         || pagetable_get_pfn(v->arch.shadow_table[1]) == mfn_x(smfn)
>> -         || pagetable_get_pfn(v->arch.shadow_table[2]) == mfn_x(smfn)
>> -         || pagetable_get_pfn(v->arch.shadow_table[3]) == mfn_x(smfn)
>> +         || mfn_eq(pagetable_get_mfn(v->arch.shadow_table[1]), smfn)
>> +         || mfn_eq(pagetable_get_mfn(v->arch.shadow_table[2]), smfn)
>> +         || mfn_eq(pagetable_get_mfn(v->arch.shadow_table[3]), smfn)
>>   #endif
>>           )
> 
> While here moving the || to their designated places would make
> the code look worse overall, ...
> 
>> @@ -3707,7 +3707,7 @@ sh_update_linear_entries(struct vcpu *v)
>>   
>>       /* Don't try to update the monitor table if it doesn't exist */
>>       if ( shadow_mode_external(d)
>> -         && pagetable_get_pfn(v->arch.monitor_table) == 0 )
>> +         && pagetable_is_null(v->arch.monitor_table) )
> 
> ... could I talk you into moving the && here to the end of the
> previous line, as you're touching this anyway?

I will do.

> 
> Also, seeing there's quite a few conversions to pagetable_is_null()
> and also seeing that this patch is quite big - could this
> conversion be split out?

I will have a look.

> 
>> @@ -213,17 +214,17 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
>>   #ifndef __ASSEMBLY__
>>   
>>   /* Page-table type. */
>> -typedef struct { u64 pfn; } pagetable_t;
>> -#define pagetable_get_paddr(x)  ((paddr_t)(x).pfn << PAGE_SHIFT)
>> +typedef struct { mfn_t mfn; } pagetable_t;
>> +#define PAGETABLE_NULL_MFN      _mfn(0)
> 
> I'd prefer to get away without this constant.
I would rather keep the constant as it makes easier to understand what 
_mfn(0) means in the context of the pagetable.

Cheers,

-- 
Julien Grall

