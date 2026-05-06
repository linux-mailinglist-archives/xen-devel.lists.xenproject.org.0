Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFFILI1F+2kFYwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 15:43:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC144DB372
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 15:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301749.1575941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcWs-0002gZ-OC; Wed, 06 May 2026 13:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301749.1575941; Wed, 06 May 2026 13:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcWs-0002eR-Kq; Wed, 06 May 2026 13:43:10 +0000
Received: by outflank-mailman (input) for mailman id 1301749;
 Wed, 06 May 2026 13:43:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKcWr-0002eI-GV
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 13:43:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKcWq-00GJIb-Oy
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 15:43:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb4569-2eae-0a2a0a5409dd-0a2a450bc8cc-16
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 15:43:08 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb456c-212f-0a2a450b0019-d155d0b6c9aa-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 15:43:08 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-39396f873adso37964711fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 06:43:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39361300984sm50506201fa.21.2026.05.06.06.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 06:43:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778074988; x=1778679788; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jG1J/Wlkxocuf2f6MlD3/95/OfgmgBprqMhHz814Kw=;
        b=Um7mv3vYj86TV8HxhCUB3yDjpwxWVvem0G+yaEhUsf87W+kXaevpGoymV+g+z/QLh2
         p58eJSU1mUjaVSg0JNmIA/tNfn+HD/C/4SM1aGI8ZHZ6aPjVOxvHaI8YWlLXTpW+Byzd
         0JtK+J5FZVtsv5dDD4kB4L2PuV2uDPAtrrFDrx6gGs8U5Ruk6kGT69G5E+atvxdCbOP9
         o5ApJh/PoMmk38f0uwe1GjIOAkSstYqPTmaViTadCfR1yYjdO71BniKf2saxfbT9qegj
         h+DibIRGb93OQ8BxPbFTelkxyUPvJe2cMKV4coySV5GxRXLSwt5RYtQb3ras8dhE6Euy
         ROTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778074988; x=1778679788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jG1J/Wlkxocuf2f6MlD3/95/OfgmgBprqMhHz814Kw=;
        b=QL3b3gTOhRqhFluaBhDwJunxBYQz3BAxDkaCTpYRYUe5bTN/UUw3r/yGubKcaC+uqp
         pC5GnQ/cLx3Hl3SCAeXEHRSabuz2i7k4vWm5Z85KNAKfU9MNSAnmkqVxWZIY1KcfymWF
         T30bShzF6/8B5MRA4LKunw/5xNb1gC9tD8fIPtE+Gm9Y4cJzLXrjJ2VjaPnYp5/L60iX
         iMSTRK4QZv1ktEUNoXxeGIsfsqk7w27AUdek6wkXUjWfEqB2DRkgkKQVVc5S1R8osIHV
         8yN2L45SYXxXxpBy2JUwwyusz7Cm1hneOwk/npihIPMCWttlCTAthSSI5RXyW8BU+NGE
         VuNA==
X-Forwarded-Encrypted: i=1; AFNElJ8ydttg9FFpsdByh3lDLBctZQZRpofPD+VFgeEfckUeSM3G5R8pf3AyEN34BVWGtZyyxmGguhhhz8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyqB9N4nUn5Oavtrc5N5WN7yCKDPMHz4bgoHVhtHBzJrHrVALQ
	30AzBWmR+07STZAIMvv0r1pVM8hftI1kM6o7GH8zZYSiFOref8JjAPOF
X-Gm-Gg: AeBDieuS1RLBRNoYL/27VAXp5b1uALGiIca5tvDZB+o0FUY8kCvp4gMiUB9lJmzmi0m
	Lit97Gga5/Mj3cHymHL58ejqVdyOCEV2PyggB/O/Z+K63ko9bTCxSJJAa+4ydSB04V1+C7Tx2ZI
	rM59DnCJ2Szl6kx5bdIC7MEpzc6ZVxWE6dR+J7m4iQZ6J/9XN/zZfaHWfistyIIqMM0hDEJeR4Z
	0/OKAMw10eB7CoQfCkyDKiOFnentBadHq4p3rXQ9I8DHQWw4HrsDv/5J1yMsOH4S3U/gvcZ4XRy
	utIeLT11gP/1EumNF/rSkAEq+3Cm2ByivelEG/rmsQh6+xTapbhBHginnfeRCXe9IFKcIRboVxF
	8SDoducAwcXsPyLvIgqXfP03uTfeesWSKce2ihoLHvZD7LuoTbwTkWZJHeZUFInqLUCaX3o05j2
	TIZ6dhqgAU3og48bv8h+FSV8XFabgHxI1tfwz6Rmecn078BZiAi9a0rLBG45Q2GV7TzKCuUnWbo
	Z+c2ekuY656qA==
X-Received: by 2002:a2e:2c13:0:b0:393:5c4c:c482 with SMTP id 38308e7fff4ca-393c433dcf9mr10895751fa.29.1778074986099;
        Wed, 06 May 2026 06:43:06 -0700 (PDT)
Message-ID: <ecab104c-23a2-4ffc-8de6-44e3969e20ac@gmail.com>
Date: Wed, 6 May 2026 15:43:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] xen/riscv: add Linux kernel loading support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <af89f0b696c5a1ae477dc0903a9a99b84df26f7a.1777303844.git.oleksii.kurochko@gmail.com>
 <f61ddc8f-88a6-4f61-a470-c9c82b8b9b52@suse.com>
 <fa07cdad-81f9-408f-a04d-d9c3b8e1bef1@gmail.com>
 <47609c96-33b0-4b1c-ba6a-60110797cca8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <47609c96-33b0-4b1c-ba6a-60110797cca8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1778074988-1BF7EF3B-A21A0BF3/10/73395122804
X-purgate-type: spam
X-purgate-size: 4718
X-Rspamd-Queue-Id: 0EC144DB372
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]



On 5/6/26 2:45 PM, Jan Beulich wrote:
> On 06.05.2026 13:57, Oleksii Kurochko wrote:
>> On 5/4/26 4:05 PM, Jan Beulich wrote:
>>> On 28.04.2026 16:33, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/kernel.c
>>>> @@ -0,0 +1,242 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#include <xen/bug.h>
>>>> +#include <xen/compiler.h>
>>>> +#include <xen/errno.h>
>>>> +#include <xen/fdt-kernel.h>
>>>> +#include <xen/guest_access.h>
>>>> +#include <xen/init.h>
>>>> +#include <xen/libfdt/libfdt.h>
>>>> +#include <xen/mm.h>
>>>> +#include <xen/types.h>
>>>> +#include <xen/vmap.h>
>>>> +
>>>> +#include <asm/setup.h>
>>>> +
>>>> +#define IMAGE64_MAGIC_V2 0x05435352 /* Magic number 2, le, "RSC\x05" */
>>>> +
>>>> +static void __init place_modules(struct kernel_info *info, paddr_t kernbase,
>>>> +                                 paddr_t kernend)
>>>> +{
>>>> +    const struct boot_module *mod = info->bd.initrd;
>>>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>>>> +    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0,
>>>> +                                       KERNEL_LOAD_ADDR_ALIGNMENT);
>>>> +    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt),
>>>> +                                    KERNEL_LOAD_ADDR_ALIGNMENT);
>>>
>>
>>> Why would modules need to be this strongly aligned?
>> No specific reason except to be aligned with similar alignment below, it
>> could be lesser (PAGE_SIZE or even just unsigned long aligned) or even
>> dropped, I think. It was just easier then to calculate aligned
>> addresses. But I don't see any big issue to have such alignments except
>> maybe that it will waste some memory.
> 
> Or result in there not being enough memory to hold everything.

Do you prefer than not to have alignment at all?

> 
>>>> +    /*
>>>> +     * Place modules as high in RAM as possible, scanning banks from
>>>> +     * last to first so that the end of the last bank is preferred.
>>>> +     */
>>>> +    while ( bi-- > 0 )
>>>> +    {
>>>> +        const struct membank *bank = &banks->bank[bi];
>>>> +        const paddr_t bank_end = bank->start + bank->size;
>>>> +        paddr_t modbase;
>>>> +
>>>> +        if ( modsize > bank->size )
>>>> +            continue;
>>>> +
>>>> +        modbase = ROUNDDOWN(bank_end - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
>>>
>>> Same question here.
>>
>> I used KERNEL_LOAD_ADDR_ALIGNMENT to be sure that big page tables be
>> potentially used in page table.
> 
> I fear I'm lost. All the modules are temporary entities, aren't they?

They are temporary entities but they should be copied to guest memory, 
right?

So ioremap() should be called for paddr where module is located and so 
at least less cycles will be needed to add entries to Xen page tables.

I don't know if it makes sense to have such type of optimizations. If 
not then probably we don't need alignment here too. I don't see at the 
moment any alignment requirements for initrd and dtb.

The only theoretical reason why at least for dtb we need requirement is 
that what Arm mentioned in its booting.rst:

The device tree blob (dtb) must be placed on an 8-byte boundary and must
not exceed 2 megabytes in size. Since the dtb will be mapped cacheable
using blocks of up to 2 megabytes in size, it must not be placed within
any 2M region which must be mapped with any specific attributes.

It likely should be true for RISC-V as I assume this part was copied 
from Arm port. On other side it doesn't mentioned explicitly in boot.rst 
of RISC-V in LK.

> 
>>>> +        if ( (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
>>>> +             (modbase + modsize > kernbase) )
>>>> +        {
>>>> +            modbase = ROUNDDOWN(kernbase - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
>>>
>>> What prevents this subtraction from underflowing?
>>
>> I will put the following check at the start of the place_modules() function:
>> if ( kernbase < modsize )
>>      panic("Underflow could happen between kernbase and modsize\n");
> 
> Wait - why would this be a legitimate condition to panic?

It is legitimate to panic() as common API which leads to place_module() 
has void in its return type (what should be changed in future, I have 
this in TODO) and so if something is going wrong in place_module() there 
is not better option except panic() for now.

But generally i think it was too much to panic and it would be just 
better to put:
   if ( kernbase < modsize )
       continue;
above modbase = ROUNDDOWN(...) so it will just put modules in different 
bank.

Thanks.

~ Oleksii

