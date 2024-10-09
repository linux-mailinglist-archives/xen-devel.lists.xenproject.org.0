Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A90996E78
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814680.1228294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXvH-0007w3-AZ; Wed, 09 Oct 2024 14:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814680.1228294; Wed, 09 Oct 2024 14:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXvH-0007uJ-7A; Wed, 09 Oct 2024 14:44:19 +0000
Received: by outflank-mailman (input) for mailman id 814680;
 Wed, 09 Oct 2024 14:44:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syXvF-0007rv-Cs
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:44:17 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3d90e8b-864c-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:44:15 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728485049394266.2361590103077;
 Wed, 9 Oct 2024 07:44:09 -0700 (PDT)
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
X-Inumbo-ID: f3d90e8b-864c-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728485050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NNowu4Seb+tiVurjnbL5f5P9KbRRPzJAHnT50Ps35P+dUyR/A5chY/DrSxTvvE7lnlpuqk5MDjxUjJtn/RBD+lkA+IerJExjzELnyNd3VK1O1Ctxr69nMa/HICcx94f5v1OU5i4HBPGOLOF+SwRS7hAmd62plDopVeelI0bFgxc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728485050; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cOW0L77wR5gRSNQX9YI4k4D4bGyAi2F9uxdtSswKClA=; 
	b=JuctG/hdYKIunJHv298PHagNdjsYPjsvlO1/o9kZ30o3oo7yxL1v3j6OSDRXFJG7zSSWQxERTcyI5a7gecu+fN2odHrcpH8i9PAjeEV8te4c49/m3HTXLaXcwECYu+ypYvAnx5EKyK6XtudN7opr1B05bBf2l1+osKBArEndaY0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728485050;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cOW0L77wR5gRSNQX9YI4k4D4bGyAi2F9uxdtSswKClA=;
	b=ZQbFJ82Hh4lzJZ1P57xNPQEI0gSDMJyJQDRACoyE/Wu13n4PGxBa4Qp7I4rp2CKa
	fpxZCCB7YYui2wq1S04VktukbjqSujw2qvvJTxhcbkJaMuiWVdUtOMpx47R0TsGA0lv
	neIIVXj8/sXysR9HEmw8ryifK9mnuaufliEw+xxM=
Message-ID: <3302bb72-8be5-42a0-9182-43cccbff5969@apertussolutions.com>
Date: Wed, 9 Oct 2024 10:44:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/44] x86/boot: transition relocation calculations to
 struct boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-15-dpsmith@apertussolutions.com>
 <bd0e24a2-dbd5-41d7-a85f-6aa6f90c0e54@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <bd0e24a2-dbd5-41d7-a85f-6aa6f90c0e54@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/7/24 16:44, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Use struct boot_module fields, start and size, when calculating the 
>> relocation
>> address and size. It also ensures that early_mod references are kept 
>> in sync.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c | 36 +++++++++++++++++-------------------
>>   1 file changed, 17 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index f968758048ed..4f540c461b26 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1490,7 +1490,7 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>               struct boot_module *bm = &bi->mods[j];
>>               unsigned long size;
>> -            size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
>> +            size = PAGE_ALIGN(bm->headroom + bm->size);
> 
> Is there a mismatch from mod_end in PFNs to bm->size in bytes?  Or is 
> mod_start in pfns and mod_end in bytes?

The conversion is the latter, mod_start is in PFN and mod_end is in bytes.

>>               if ( bi->mods[j].flags & BOOTMOD_FLAG_X86_RELOCATED )
>>                   continue;
>> @@ -1504,13 +1504,13 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>               if ( s < end &&
>>                    (bm->headroom ||
>> -                  ((end - size) >> PAGE_SHIFT) > bm->mod->mod_start) )
>> +                  paddr_to_pfn(end - size) > paddr_to_pfn(bm->start)) )
> 
> Drop the paddr_to_pfn if both sides are now in bytes?

True, both are in addresses, will drop.

>>               {
>> -                move_memory(end - size + bm->headroom,
>> -                            (uint64_t)bm->mod->mod_start << PAGE_SHIFT,
>> -                            bm->mod->mod_end);
>> -                bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
>> -                bm->mod->mod_end += bm->headroom;
>> +                move_memory(end - size + bm->headroom, bm->start, 
>> bm->size);
>> +                bm->start = (end - size);
>> +                bm->mod->mod_start = paddr_to_pfn(bm->start);
>> +                bm->size += bm->headroom;
>> +                bm->mod->mod_end = bm->size;
>>                   bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
>>               }
>>           }
> 
>> @@ -1700,13 +1698,13 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        set_pdx_range(bi->mods[i].mod->mod_start,
>> -                      bi->mods[i].mod->mod_start +
>> -                      PFN_UP(bi->mods[i].mod->mod_end));
>> +        set_pdx_range(paddr_to_pfn(bi->mods[i].mod->mod_start),
>> +                      paddr_to_pfn(bi->mods[i].mod->mod_start) +
> 
> Shouldn't these be
>      paddr_to_pfn(bi->mods[i].start)
> ?

Correct, will fix.

>> +                      PFN_UP(bi->mods[i].size));
>>           map_pages_to_xen(
>> -            (unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
>> -            _mfn(bi->mods[i].mod->mod_start),
>> -            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
>> +            (unsigned long)maddr_to_virt(bi->mods[i].start),
>> +            maddr_to_mfn(bi->mods[i].start),
>> +            PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);
> 
> First argument should fit on same line as map_pages_to_xen().

If it fits, yes I will move it up.

v/r,
dps

