Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB849996D93
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814603.1228193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXbm-0004Uu-NR; Wed, 09 Oct 2024 14:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814603.1228193; Wed, 09 Oct 2024 14:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXbm-0004SB-KL; Wed, 09 Oct 2024 14:24:10 +0000
Received: by outflank-mailman (input) for mailman id 814603;
 Wed, 09 Oct 2024 14:24:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syXbl-0004S5-Fb
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:24:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24452b72-864a-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 16:24:08 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728483841096941.1036631949369;
 Wed, 9 Oct 2024 07:24:01 -0700 (PDT)
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
X-Inumbo-ID: 24452b72-864a-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728483842; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H7fNf/VgRza/UWiqcicfNJQtHQ4EVVEmNgHP7VFZk0VR/lpy35R8/VocXYI+qm56kEUHnVPQ/iqp88s3t5xfymWLQl0B0LYeaLiSpawSCnGLp+Y4ZU593czOZPw//oUXsiLZrRuHZMOCbmXNhInemUSypXqCrGmU51R3cDBnZ/0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728483842; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eV8lDH55z7Y7RlEHO7pHY7SnY8hRfCYAaxvkVmR4z1o=; 
	b=QyLjHfGuMy5DcEtWpVq81oCCW4V6sIwwzwlsg4sHpDQqD8PyU4GZSwUbTXDkdqQ1bfr4LwVMbUIDyCrI0/oDFrLANIh95n/CalJ7GZ+PvUiTkViZaZ1SztGEByCwehi3dkVx+RXWt30EmDOyGMpdO1hhKVEeELRiPZUDSBvJyiY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728483842;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eV8lDH55z7Y7RlEHO7pHY7SnY8hRfCYAaxvkVmR4z1o=;
	b=SQOyarD++AL9szC24MjMxQ6GpkwFGskIotKz4tKCRaFkzs0N9xzWrKJtsDuRXvQE
	Z08f07VXEoCYgE2pOmI9h9BnNRweTvARkxDWmMKKv1ZB5267/in6WFPKVc9Vy15Mf4v
	zbF+lWA5PqK5btXiWfV0w1YqymGsY9tO7JwIC504=
Message-ID: <f715e69c-928a-49c4-ae72-49c8444b0a9c@apertussolutions.com>
Date: Wed, 9 Oct 2024 10:23:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/44] x86/boot: convert setup.c mod refs to early_mod
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-9-dpsmith@apertussolutions.com>
 <a2346abb-e332-40a3-88bb-0159f6a359e8@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a2346abb-e332-40a3-88bb-0159f6a359e8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/7/24 15:34, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> To allow a slow conversion of x86 over to struct boot_module, start with
>> replacing all references to struct mod to the early_mod element of struct
>> boot_module. These serves twofold, first to allow the incremental 
>> transition
>> from struct mod fields to struct boot_module fields. The second is to 
>> allow
>> the conversion of function definitions from taking struct mod 
>> parameters to
>> accepting struct boot_module as needed when a transitioned field will be
>> accessed.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c | 61 ++++++++++++++++++++++++--------------------
>>   1 file changed, 34 insertions(+), 27 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index dd82ca3d43e2..ba4bee6b93af 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1341,15 +1341,15 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
>>       kexec_reserve_area();
>> -    initial_images = mod;
>> +    initial_images = bi->mods[0].mod;
> 
> Isn't this wrong?
> mod is the array of module_t * of *all* modules, but bi->mods[0].mod is 
> a single module_t *?

No it is not wrong:
   bi->mods[0].mod == __va(mbi->mods_addr)[0]

While the modules themselves get relocated, the location of the array of 
module_t never change.

The question does give me pause to double check the patch ordering, just 
to be sure that mod_start and mod_end are correct up until we transition
to using the boot_module fields.

>>       for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
>>       {
>> -        if ( mod[i].mod_start & (PAGE_SIZE - 1) )
>> +        if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
>>               panic("Bootloader didn't honor module alignment 
>> request\n");
>> -        mod[i].mod_end -= mod[i].mod_start;
>> -        mod[i].mod_start >>= PAGE_SHIFT;
>> -        mod[i].reserved = 0;
>> +        bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
>> +        bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
>> +        bi->mods[i].mod->reserved = 0;
>>       }
>>       /*
> 
>> @@ -1509,13 +1510,15 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>   #endif
>>       }
>> -    if ( bi->mods[0].headroom && !mod->reserved )
>> +    if ( bi->mods[0].headroom && !bi->mods[0].mod->reserved )
>>           panic("Not enough memory to relocate the dom0 kernel image\n");
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
>> +        uint64_t s = (uint64_t)bi->mods[i].mod->mod_start
>> +                        << PAGE_SHIFT;
> 
> pfn_to_paddr() ?

Yep, missed one ( ._.)

>> -        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(mod[i].mod_end));
>> +        reserve_e820_ram(&boot_e820, s,
>> +                         s + PAGE_ALIGN(bi->mods[i].mod->mod_end));
>>       }
>>       if ( !xen_phys_start )
>> @@ -1593,8 +1596,9 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>                   map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
>>                   for ( j = 0; j < bi->nr_modules; ++j )
>>                   {
>> -                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
>> -                                   mod[j].mod_end;
>> +                    uint64_t end = pfn_to_paddr(
>> +                                   bi->mods[j].mod->mod_start) +
>> +                                   bi->mods[j].mod->mod_end;
> 
> I think you want a different indent.  I think
>      uint64_t end = pfn_to_paddr(bi->mods[j].mod->mod_start)
> 
> will all fit on one line (indented all the way).  (Thunderbird makes it 
> difficult me to send indented.)

Yes, it will fit on one line without the '+', but I believe one of the 
many unwritten coding style rules is that the '+' stays with the LHS, so 
I wrapped the LHS with the '+'.

>>                       if ( map_e < end )
>>                           map_e = end;
>> @@ -1668,11 +1672,13 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        set_pdx_range(mod[i].mod_start,
>> -                      mod[i].mod_start + PFN_UP(mod[i].mod_end));
>> -        map_pages_to_xen((unsigned long)mfn_to_virt(mod[i].mod_start),
>> -                         _mfn(mod[i].mod_start),
>> -                         PFN_UP(mod[i].mod_end), PAGE_HYPERVISOR);
>> +        set_pdx_range(bi->mods[i].mod->mod_start,
>> +                      bi->mods[i].mod->mod_start +
>> +                      PFN_UP(bi->mods[i].mod->mod_end));
>> +        map_pages_to_xen(
>> +            (unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
> 
> map_pages_to_xen((unsigned long)maddr_to_virt(bi->mods[i].start),
> 
> All fits on one line.

If it does, I will bring it back up.

v/r,
dps

