Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C4B9A319F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 02:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821454.1235276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1aeD-0006wt-P0; Fri, 18 Oct 2024 00:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821454.1235276; Fri, 18 Oct 2024 00:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1aeD-0006uQ-MM; Fri, 18 Oct 2024 00:15:17 +0000
Received: by outflank-mailman (input) for mailman id 821454;
 Fri, 18 Oct 2024 00:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xu+L=RO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1aeD-0006uK-0M
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 00:15:17 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b28485e-8ce6-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 02:15:14 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729210508585206.93971905076296;
 Thu, 17 Oct 2024 17:15:08 -0700 (PDT)
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
X-Inumbo-ID: 0b28485e-8ce6-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729210509; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S04kpg88lILvWbNs1dVe9R8mwkeIL1TJb3O4IQtHjZMIhVLVil64DUd0DuOKYP+q87GbhOI0y/N7L5UCR5yNIhygXtVS6V2wpmHeotCS73+zBfn8zG3p9IbYg0gKrHUgwpZoFQ+wJggBIuk06t5oiafGtM24a4LSJmod6OVVqJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729210509; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2WBY1d784sRwXYzUn8u8sRCxIsLl8d/a1Fy5wqmbP/w=; 
	b=UdN2ZxMNMoWSpDO76qjAf6t3zyWb9SOq1VYJD1G2mtuGupZYG+wXICQ2GjV2RIm5k8JqgZ8hpYyrlfOeFN90drbrT+Th30EQTwyhcKzJ+rhiRDaHE4aczGsfQCXn9zGaXdk5KGUMpSQp0ijkAKpD1mi9IAsmZ/tpiol5KmTc4bU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729210509;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2WBY1d784sRwXYzUn8u8sRCxIsLl8d/a1Fy5wqmbP/w=;
	b=rIDKeouzjtMalC6lrJo74l7+sALDKWJ2mfsVec2L5BhF6i8pwGAcsKOLdqImgEDU
	LpBucpOgm0yAmXMjckhCwGIobYLRAhfMzoi+raZC7T8eoraEfenpZc22fJnRrcSOvgu
	31H04drAN4khssrtlcni5qmy09WYUUNrnuX/RqY4=
Message-ID: <1f409e81-7137-43ac-9616-4e18d1ec0817@apertussolutions.com>
Date: Thu, 17 Oct 2024 20:15:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/44] x86/boot: introduce struct boot_module
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-6-dpsmith@apertussolutions.com>
 <766eaa46-fc8c-4069-a3bc-116dac23ca53@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <766eaa46-fc8c-4069-a3bc-116dac23ca53@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/17/24 17:02, Andrew Cooper wrote:
> On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index f7ea482920ef..d8ee5741740a 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -284,6 +284,8 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
>>   {
>>       struct boot_info *bi = &xen_boot_info;
>>       const multiboot_info_t *mbi = __va(mbi_p);
>> +    module_t *mods = __va(mbi->mods_addr);
>> +    unsigned int i;
>>   
>>       bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;
>>   
>> @@ -302,6 +304,13 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
>>           bi->memmap_length = mbi->mmap_length;
>>       }
>>   
>> +    /*
>> +     * Iterate over all modules, including the extra one which should have been
>> +     * reserved for Xen itself
>> +     */
>> +    for ( i = 0; i <= bi->nr_modules; i++ )
>> +        bi->mods[i].mod = &mods[i];
> 
> I'm afraid you've got a bug here.  bi->nr_modules is unsanitised from
> firmware at this point.
> 
> It's checked/clamped later in __start_xen(), but not before you've
> potentially scribbled past the end of bi->mod[] in this loop.
> 
> I think we want to retain the warning from clamping (which needs to be
> after printk() is set up, so after parsing the cmdline), so to
> compensate I think you want:
> 
>      i < ARRAY_SIZE(bi->mods) && i <= bi->nr_modules
> 
> as the loop condition here, and a note to this effect.  I'm not sure
> what I think about passing exactly 64 modules, and this interacting with
> the Xen slot.

Completely agree. I think Alejandro was trying to call that out and I 
missed his point. Will fix.

> However, you also want to move part of "x86/boot: convert create_dom0 to
> use boot info" into this patch.
> 
> Specifically, the conversion from sizeof(module_map)*8 to
> MAX_NR_BOOTMODS, or there's also a latent bug that depends Xen being
> compiled as 64bit (unsigned long vs MAX_NR_BOOTMODS).

You are right, we should truncate to MAX_NR_BOOTMODS at this point and 
not later.

v/r,
dps

