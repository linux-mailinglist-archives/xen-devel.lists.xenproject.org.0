Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E0E9A4D76
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 13:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822463.1236432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t281t-0008UH-B2; Sat, 19 Oct 2024 11:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822463.1236432; Sat, 19 Oct 2024 11:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t281t-0008R9-81; Sat, 19 Oct 2024 11:53:57 +0000
Received: by outflank-mailman (input) for mailman id 822463;
 Sat, 19 Oct 2024 11:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdF/=RP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t281s-0008R3-2B
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 11:53:56 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf2807ad-8e10-11ef-99a3-01e77a169b0f;
 Sat, 19 Oct 2024 13:53:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729338825079915.4567732383301;
 Sat, 19 Oct 2024 04:53:45 -0700 (PDT)
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
X-Inumbo-ID: cf2807ad-8e10-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729338825; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XC9RcMqfJ4bRoUbR/6dC2pxetCRD61Ndq6X4TNK4Jzl7uJn72FlAntNBcyqm9p/JvsnJrnQIKrCDv6CZ6rhAdH3UuSQEs8toVj4T27JMGhxktCkJ2ndiHXtbFLdAADZ5/T2szAGOUq6aoQu621ZJnjf9x1ZyO4k4HSIZVM1DIsY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729338825; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+nwo/g0/7mc+QxvvEVssTnbGRa1xfLYka6GFaBMxdVI=; 
	b=GVlf06eDp8ZQBHSezlLdpMAw5+etmzX9gqSiZSrcqLqJr5E69kE2M6x6vXP6xDQHUP/NScNRMbcVzQ7qqznV1StEKNhB9ACDDbNZuCP7OEgm5Ft5Y4XpwfWTKaMuOOZwNJESwfafpVLs8WH+UpUbT6TO1LrSE4mojZCnJBXTzHA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729338825;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+nwo/g0/7mc+QxvvEVssTnbGRa1xfLYka6GFaBMxdVI=;
	b=gnvhiWM1rQrqnvv3SlZ7AqgrKsj9F/s3uubaBs4BUNygEQQAt58s0cgdyWj5tClL
	EH++ANs9julTzzE2S36uaJILhpPB8pBr83UhG6mzPy7PGOju9SFrnGXnuZU6rlnoUki
	Lkq23bqffosLDyi8eO/rTCYv9hsi1SMIL/ewZQYc=
Message-ID: <ccc34697-170f-4e5a-ac58-3c36e53e55b4@apertussolutions.com>
Date: Sat, 19 Oct 2024 07:53:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/44] x86/boot: add start and size fields to struct
 boot_module
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-12-dpsmith@apertussolutions.com>
 <0c342b3a-f66e-44a6-a87a-5553f4f7ba7d@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <0c342b3a-f66e-44a6-a87a-5553f4f7ba7d@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/17/24 20:23, Andrew Cooper wrote:
> On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
>> This commit introduces the start and size fields to struct boot_module and
>> assigns their value during boot_info construction.
>>
>> The EFI entry point special cased itself, and pre-converted mod_start and
>> mod_end to mfn and size respectively. This required an additional test
>> in the coversion loop to not convert mod_start and mod_end when the conversion
>> was done for both the multiboot and PVH boot entry points. To simplify the
>> logic populating the start and size fields, the EFI module population logic
>> was coverted to using start and end addresses.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v5:
>> - switched EFI population of mod_start/mod_end to addresses
>> ---
>>   xen/arch/x86/efi/efi-boot.h         | 4 ++--
>>   xen/arch/x86/include/asm/bootinfo.h | 3 +++
>>   xen/arch/x86/setup.c                | 7 ++++++-
>>   3 files changed, 11 insertions(+), 3 deletions(-)
> 
> Despite being small already, I'd still prefer to split this into two
> patches.

I was going to agree with you but thinking about your point that in EFI 
the addr could legitimately be >4G and thus the conversion to pfn and 
size will need to stay. Therefore this will cause the efi changes to 
drop back out and require the introduction of EFI test and alternative 
path for setting start/size by converting back. If I were to break up it 
up, what will result is there will be a patch that introduces straight 
assignment for MB and PVH boot. The second commit would introduce the 
EFI test and alternate branch to assign start using the shift 
conversion. I think this all probably should stay in a single patch, but 
if you still would like to see it separate than I will do so.

> One changing the EFI path, and a separate one adding in the new (real)
> start/size fields.
> 
> Sods law would says that if we don't, bisection is going to end up here,
> except it doesn't need to...
> 
>> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
>> index 94f34433640f..779f101c3de7 100644
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -732,8 +732,8 @@ static void __init efi_arch_handle_module(const struct file *file,
>>       if ( options )
>>           place_string(&mb_modules[mbi.mods_count].string, options);
>>       place_string(&mb_modules[mbi.mods_count].string, local_name.s);
>> -    mb_modules[mbi.mods_count].mod_start = file->addr >> PAGE_SHIFT;
>> -    mb_modules[mbi.mods_count].mod_end = file->size;
>> +    mb_modules[mbi.mods_count].mod_start = file->addr;
>> +    mb_modules[mbi.mods_count].mod_end = file->addr + file->size;
> 
> ... because you can't drop this shift until you have a full-width start
> field to use.   file->addr might exceed 4G, and truncate with this patch
> in place.
> 
> You're going to need to keep the old semantics here, fill in all 4
> fields, and keep the EFI special case in the final hunk until you can
> remove the ->mod_{start,end} narrow fields.

While in testing I did not see it occur, you are correct that it is 
possible that the EFI allocator may choose to do so. I will drop the 
change in the efi code and handle with a condition in the 
multiboot_fill_boot_info() funciton for the time being.

>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index f87faa31a2cf..6ee352fc0cde 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -309,8 +309,13 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
>>        * reserved for Xen itself
>>        */
>>       for ( i = 0; i <= bi->nr_modules; i++ )
>> +    {
>>           bi->mods[i].mod = &mods[i];
>>   
>> +        bi->mods[i].start = (paddr_t)mods[i].mod_start;
> 
> This cast isn't needed, but don't we need a shift in here?

Only for EFI.

v/r,
dps

