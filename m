Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815FD26DF7D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 17:21:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIvio-0001am-C6; Thu, 17 Sep 2020 15:21:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIvin-0001ab-2U
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 15:21:17 +0000
X-Inumbo-ID: e5371a7c-8ed1-45dd-94ac-acbb616867c8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5371a7c-8ed1-45dd-94ac-acbb616867c8;
 Thu, 17 Sep 2020 15:21:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600356075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZ/sOxRMDNstINq0XGfph2L0vk4XvYFR4HD8yTFGPFA=;
 b=iFseQZzAmzgk6vM6jOF95FvRR2DwBPPgLXjBZ4Omd89OBSsKKwyCbzSx58mVuzk0yEkIMl
 r85bdsDBKE3PUi9Hy+hE2gEzY66bU2SM5eqJe1RB9GmNf/p33S4eqCbmUBqxVgaHCAgQLV
 Gvx1aJGUypPZWcL++pfTPl5O0gmP4b8NIzbo2KubSsBcHwXFnrdoY2bhivPxYEuq1weFUC
 JpQqRJZHNZtUnpw9hpJPwC1LtQK9FUhY0dRX1tfD+OkiO/Ymjwzcwm2nUV1Mc+SO6eDj86
 VJdcKHw7cer4vgd0qFA7cyv66WGt94FiQAGoqxn3OWxpEHmqa/Zy1dMGWoQ5BQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0504AC8C;
 Thu, 17 Sep 2020 15:21:48 +0000 (UTC)
Subject: Re: [PATCH v4 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-4-hudson@trmm.net>
 <bce3b96d-8e40-0f46-81a8-1cffb464dbd6@suse.com>
 <f77dk3H4FvbqMm9PBWKLDGxWMhJA8Hb9ClafHpPOzZZ5kYgUBVHaa4nUi_m2FY74cS8pV9m6tBy50oWG5TD2u0R-nVIh6S7lqDqjX21ZeEc=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0d916d7-efc5-6b76-0c32-70b59c579f13@suse.com>
Date: Thu, 17 Sep 2020 17:21:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f77dk3H4FvbqMm9PBWKLDGxWMhJA8Hb9ClafHpPOzZZ5kYgUBVHaa4nUi_m2FY74cS8pV9m6tBy50oWG5TD2u0R-nVIh6S7lqDqjX21ZeEc=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.09.2020 15:04, Trammell Hudson wrote:
> On Thursday, September 17, 2020 8:33 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.09.2020 13:50, Trammell Hudson wrote:
>> [...]
>>> +For all the examples the `.pad` section ended at 0xffff82d041000000.
>>> +All the sections are optional (`.config`, `.kernel`, `.ramdisk`, `.xsm`,
>>> +`.ucode` (x86) and `.dtb` (ARM)) and the order does not matter.
>>> +The virtual addresses do not need to be contiguous, although they should not
>>> +be overlapping and should all be greater than the last virtual address of the
>>> +hypervisor components.
>>
>> The .pad section is there really only for padding the image. Its space
>> could in principle be used for placing useful stuff (and hence to limit
>> overall in-memory image size). That said, there is a plan for a change
>> which may involve using the initial part of .pad, but that's not certain
>> yet. I'm pointing this out to clarify that there may be a valid reason
>> to avoid re-using the .pad space, at least for now.
> 
> The instructions show how to append after the .pad region, so there is
> no reuse of that space.  I wish objcopy had an --append-region option
> so that the user didn't have to do this extra math and adjust sizes.

Well, I've been trying to point out that the .pad space could be made
use of, but there are constraints.

>>> --- a/xen/arch/arm/efi/efi-boot.h
>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>> @@ -375,27 +375,36 @@ static void __init noreturn efi_arch_post_exit_boot(void)
>>> efi_xen_start(fdt, fdt_totalsize(fdt));
>>> }
>>> -static void __init efi_arch_cfg_file_early(EFI_FILE_HANDLE dir_handle, char *section)
>>> +static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
>>>
>>> -                                             EFI_FILE_HANDLE dir_handle,
>>>
>>>
>>> -                                             char *section)
>>>
>>>
>>
>> Could I talk you into constifying "section" at this occasion - afaics
>> there should be no fallout here or in the other three places where
>> the same would apply.
> 
> I'm always in favor of adding more constness.  Is it ok to have that
> as part of this patch since we're changing the signature on the function?

Yes, if there's no further fallout from it. Please just mention such
"on the side" changes in half a sentence in the description, so it's
clear they're intentional.

>>> -          if ( !read_section(loaded_image, ".kernel", &kernel, option_str) )
>>> -              read_file(dir_handle, s2w(&name), &ramdisk, NULL);
>>> -              read_file(dir_handle, s2w(&name), &kernel, option_str);
>>
>> As before, I disagree with the idea of taking pieces from disk and
>> pieces from the unified image. If you continue to think this is a
>> reasonable thing to do, may I ask that you add a rationale of this
>> model to the description?
> 
> It allows distributions to continue with the status quo if they want a
> signed kernel + config, but allow a user provided initrd (which is what
> the shim protocol does today).  Qubes, for instance, has discussed that
> as a path forward to allow a trusted kernel, while also allowing users
> to rebuild their own initrd since it contains machine specific data.
> 
> The config is signed, so an attacker can not add any new lines to it.
> So if the config file has no "ramdisk" or "xsm" line then get_value()
> will return NULL and the read_file() will not be attempted.
> If, however, the config file has an "ramdisk /boot/initrd.gz",
> but not ".ramdisk" PE section, then that is an explicit statement
> from the signer that they want to load that file from disk, even
> though the initrd.gz is not included in the signature.

Ah yes, I can follow these arguments. Please put this or an abridged
version of it in the description. It'll help me not re-asking the
same question in a couple of week's time, at the very least.

>>> --- /dev/null
>>> +++ b/xen/common/efi/pe.c
>>> +#define PE_HEADER_MACHINE_ARM64 0xaa64
>>> +#define PE_HEADER_MACHINE_X64 0x8664
>>> +#define PE_HEADER_MACHINE_I386 0x014c
>>
>> This list isn't meant to be a complete one anyway, so please omit
>> the I386 item as it's not needed anywhere.
> 
> Sure.  This file is almost verbatim from systemd-boot, so it has
> a few things like that which are not relevant.

Please zap full entities we don't need (and by this I mean please
don't zap e.g. structure members because we only need some of them).

>>> +struct PeFileHeader {
>>> -   UINT16 Machine;
>>> -   UINT16 NumberOfSections;
>>> -   UINT32 TimeDateStamp;
>>> -   UINT32 PointerToSymbolTable;
>>> -   UINT32 NumberOfSymbols;
>>> -   UINT16 SizeOfOptionalHeader;
>>> -   UINT16 Characteristics;
>>>     +} attribute((packed));
>>>
>>> +struct PeHeader {
>>> -   UINT8 Magic[4];
>>> -   struct PeFileHeader FileHeader;
>>>     +} attribute((packed));
>>
>> At the example of these two (i.e. may extend to others): When the
>> packed attribute doesn't really have any impact on structure layout
>> (and will just adversely affect alignof() when applied to the struct
>> or any of the fields), please omit it.
> 
> In this case the packed does not affect the layout, but if PeFileHeader
> started with a UINT64, for instance, then padding would be added to
> PeHeader to align it without the packed.

Of course, in such a case the "packed" would be warranted. But quite
often structures have already got laid out to optimally pack them, in
which case the attribute is pointless, yet still often gets added in
a purely mechanical manner by people. As said - we had to deal with
fallout from the practice in the not so distant past.

>>> +struct PeSectionHeader {
>>> -   UINT8 Name[8];
>>
>> Better char?
> 
> Maybe? I've heard that some programs use non-7bit ascii in there for things
> that are not normal sections (and the names are compared with memcp()).

Which memcmp() is going to happily deal with afaict.

>>> +const void *__init pe_find_section(const CHAR8 *image, const UINTN image_size,
>>> -                                     const char *section_name, UINTN *size_out)
>>> -   const struct DosFileHeader dos = (const void)image;
>>
>> If the type of "image" was "const void *", there wouldn't be any cast
>> needed here (and again further down). And I don't think you actually
>> need "image" to be a pointer to a particular type?
> 
> I don't think it needs to be any particular type (and CHAR* is a holdover
> from the systemd-boot code).  However, there is quite a bit of pointer
> math done on it that avoids casts:
> 
> pe = (const void *) &image[offset];
> 
> If image were void*, then this would have to be written as something like:
> 
> pe = (const void *)((uintptr_t)image + offset);
> 
> (unless the gnu extension that allows void* math is enabled)

We use this extension all over the place.

>>> -   for ( i = 0; i < pe->FileHeader.NumberOfSections; i++ )
>>> -   {
>>> -          sect = (const void *)&image[offset];
>>>
>>>
>>
>> Please limit the scope of sect to the body of this loop, at which
>> point this assignment can become the initializer.
> 
> sect was used earlier for sizeof math to validate the name.
> 
> It's also a little odd that the style guide calls for declaring variable
> in limited scopes, while also disallowing for loop scoped variables.

Because the latter are a newer language feature, originally
coming from C++, which we haven't settled on yet to allow for
general use.

Jan

