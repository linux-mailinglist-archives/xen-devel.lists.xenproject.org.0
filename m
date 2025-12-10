Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA0CCB38DA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 18:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183104.1505884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNbQ-0008SE-B4; Wed, 10 Dec 2025 17:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183104.1505884; Wed, 10 Dec 2025 17:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNbQ-0008QY-8U; Wed, 10 Dec 2025 17:03:48 +0000
Received: by outflank-mailman (input) for mailman id 1183104;
 Wed, 10 Dec 2025 17:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTNbP-0008QS-3L
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 17:03:47 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 300e671e-d5ea-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 18:03:45 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so1444960166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 09:03:45 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64982040e2bsm72804a12.6.2025.12.10.09.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 09:03:44 -0800 (PST)
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
X-Inumbo-ID: 300e671e-d5ea-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765386225; x=1765991025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDty72hcYyiibH87TqbPlise8L/YjpZ5f2bIDgdPjoc=;
        b=VH6tjRNl4pRh1XquPg9CKotZj3x5EXpE6TQt69s473eGJv+fZExjYY6ecBbPOqHhLa
         wcWQ6v1EOdZaK++y8vcoaRhtJRB1oRtYd+8eVyRFSTQLjht+wj5J2/0fcTD5bKAGiBqq
         a4dSrkJLXCzuEctNuMPVqG0zPxKWCgbM0w848SfS4IyHYWKjE27tLlGjumJi1bzCgUCI
         Vp/S7Q0xkddXuBen04+KXhdr1S4wNIjuQYsQpyOsXxquNmEmuNoFk9NqbiGJUwfkzslb
         efGMlWGT5S6TTwvA4x7QAVpsOHzKxXMF9BcnViLIkhyJ//FYSdBexpnAbNbFxXAb0Hc/
         qsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765386225; x=1765991025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDty72hcYyiibH87TqbPlise8L/YjpZ5f2bIDgdPjoc=;
        b=HAFaoZ6bXwDuLhN++NIDqnuC9MtLikQiDFpgC8UUNs9LqvB8EjIsWiNVckn55JV+wZ
         9Hy4I8auVbIv8/qtY9koaNxI8EnXyS8MT41/8zON2C44EuKajLZf99hyqNakEESeeBFD
         4JfaiMDmR7bwbya39KOfyH494sC+cx7r9ljNOcATXpmnG6NjGuOR8GcT3PUBD167585g
         EY5uk8/C2SWb3AERVvpMGVHcpzTzIBLbze9kWCxhpRsM0G2kTFYmF7MsfrOHkyc8nPlu
         UKc1Sw9y++3PAiZqk1YdZwJlglwNM2NnlFgCJDNfq50D/W9O1779y94t0L8Q8aZEtZSU
         IIog==
X-Forwarded-Encrypted: i=1; AJvYcCVAqAPCsA5P19J+cXJXSlFYYxmojGS/tqJECP7eWWgas7a7k9iiQTpGbw13huI1YZyL2qcyCDJ0Njo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0ObGE0+x+yQdEGf2agPdMSBhpeObuA+mPohd+Ph9ewzy091hV
	/Ew/y+zIAxvUZO2A6rzVeJTA6zB6gTW49Dyn93nJ1p3/Mc+ZRJBF2nyc
X-Gm-Gg: ASbGncvnWF3hcKqQ1YB6PDzZPkAXiUWxr89nHd9fDpxyT+g5pURCJR3+Na02nUzRHcR
	crvQKqpxJbSChZ9gD3hbhSg6NqmlQtmWQsXAGXzg6GW4Ipy8N4nBkTFG06gTPDS3U5StB4b9QSJ
	zA+nOX1MZBYauBf8hUJVnHmsynwF0nvm6C74NiuDH7XrMeh4dkKmBosJycke19on0LSjQgGut/Z
	JpC2Nf27aHuTADpcQSsI1rxGFDUiJ2Stqu132ZGgL0C5uBPQMo0bXWuddo6dQYG/+AbmCN1yy6z
	yNFRh0eGPtqHIcxTERpe7DmtT9juReNIP+zZTzewxbQ9BbvEs/ER+xlyEfQPq062lgHqV3RGShq
	T43E1+xHWqD0sFFx62qxdUmWuL8Wbw1pPUtmCDjeY2sGGavuaHaHZRaBzNFc4UqqWRnsXuOppuM
	8rW+Ezva1RV1d9DfBUWrrKyTfZRM1y4/eAK1eYu5ma4JKWA7MKCjjkgp1sp+ai
X-Google-Smtp-Source: AGHT+IE5ijayu3JjqjEj3IcbtNR0EQUeWkX6ToS9yU28PsPNEZrYWw7pVyNoK2r0nIRZJIgfl87jog==
X-Received: by 2002:a17:907:1c07:b0:b4c:137d:89bb with SMTP id a640c23a62f3a-b7ce8317ee9mr321498166b.29.1765386224574;
        Wed, 10 Dec 2025 09:03:44 -0800 (PST)
Message-ID: <02b72d6f-d95b-4caf-825a-15280902af27@gmail.com>
Date: Wed, 10 Dec 2025 18:03:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce vSBI extension framework
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <3b67330dc4c1aa053eb15261a559e7b4eac3f493.1764582112.git.oleksii.kurochko@gmail.com>
 <df316e2f-9eb0-4bb8-96cd-e5e0c42d123e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <df316e2f-9eb0-4bb8-96cd-e5e0c42d123e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/8/25 3:25 PM, Jan Beulich wrote:
> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>> This commit introduces support for handling virtual SBI extensions in Xen.
>>
>> The changes include:
>> - Added new vsbi.c and vsbi.h files to implement virtual SBI extension
>>    handling.
>> - Modified traps.c to handle CAUSE_VIRTUAL_SUPERVISOR_ECALL by calling
>>    vsbi_handle_ecall() when the trap originates from VS-mode.
>> - Updated xen.lds.S to include a new .vsbi.exts section for virtual SBI
>>    extension data.
>> - Updated Makefile to include the new vsbi/ directory in the build.
>> - Add hstatus register to struct cpu_user_regs as it is needed for
>>    a check that CAUSE_VIRTUAL_SUPERVISOR_ECALL happens from VS-mode.
> I can spot the check, yes, but without the field ever being set how is one
> to determine whether that check actually makes sense?

But hstatus is set automatically when a trap occurs and will be copied in
handle_trap() in entry.S. The HSTATUS_SPV bit in hstatus will be set only
when a trap originates from a guest, which is not the case now since we do not
have any guest running yet. This is why hstatus is not currently saved or
restored.

Probably, you meant that it would be better to introduce csr init function
now, something like:
static void vcpu_csr_init(struct vcpu *v)
{
     unsigned long hedeleg, hideleg, hstatus;

     hstatus = HSTATUS_SPV | HSTATUS_SPVP | HSTATUS_VTW;
     guest_regs(v)->hstatus = hstatus;
     
     ....
}
But it also make sense only for a guest, which isn't ran now.

If you think it is better to introduce saving and restoring of hstatus in
handle_trap() now, or instead drop the handling of
“case CAUSE_VIRTUAL_SUPERVISOR_ECALL:” in do_trap(), please let me know.

>
>> The implementation allows for registration and handling of SBI
>> extensions via a new vsbi_ext structure and ".vsbi.exts" section,
>> enabling extensible virtual SBI support for RISC-V guests.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/riscv/Makefile                |  1 +
>>   xen/arch/riscv/include/asm/processor.h |  1 +
>>   xen/arch/riscv/include/asm/vsbi.h      | 31 +++++++++++++++++
>>   xen/arch/riscv/traps.c                 |  8 +++++
>>   xen/arch/riscv/vsbi/Makefile           |  1 +
>>   xen/arch/riscv/vsbi/vsbi.c             | 46 ++++++++++++++++++++++++++
> A file named identical to the directory it lives in raises the question of
> why there is such a new sub-directory. Are you expecting moree files to
> appear there?

Yes, I'm expecting that and it is done in the next patches of this patch
series.

>   How's vsbi.c then be "special" compared to the others? Do
> you perhaps mean someling like "core.c" or "common.c" here?

Agree, this is more appropriate for either “core.c” or “common.c”. Both options
are fine with me. I slightly prefer using the prefix “vsbi-{core/common}.c”, but
if you think it is better to omit the prefix since the folder name already
provides that context, I’m fine with dropping it.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/vsbi.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier:  GPL-2.0-only */
>> +
>> +#ifndef ASM_RISCV_VSBI_H
>> +#define ASM_RISCV_VSBI_H
>> +
>> +struct regs;
> DYM struct cpu_user_regs?

Should be struct cpu_user_regs.

>
>> +struct vcpu;
>> +
>> +struct vsbi_ext {
>> +    const char *name;
>> +    unsigned long eid_start;
>> +    unsigned long eid_end;
>> +    int (*handle)(struct vcpu *vcpu, unsigned long eid,
>> +                  unsigned long fid, struct cpu_user_regs *regs);
> Nit: Maybe better "handler", as this isn't really a handle?

It could be handler, I am okay with that.

>
>> +};
>> +
>> +#define VSBI_EXT_START(ext, extid_start, extid_end, extid_handle)   \
> The extid_ prefixes aren't adding much value here, are they?

Agree, not to much sense to have extid_ prefix here, lets drop it.

>
>> +static const struct vsbi_ext vsbi_ext_##ext __used                  \
>> +__section(".vsbi.exts") = {                                         \
>> +    .name = #ext,                                                   \
>> +    .eid_start = extid_start,                                       \
>> +    .eid_end = extid_end,                                           \
>> +    .handle = extid_handle,
>> +
>> +#define VSBI_EXT_END                                                \
>> +};
> There's no use here, and peeking ahead at the other two patches shows
> no use where this odd split of the macros would be necessary. What is
> this about?

I thought this was the common approach, similar to DT_DEVICE, where we have
DT_DEVICE_START and DT_DEVICE_END. There may be no need for it right now, but
perhaps we will eventually want similar behavior for VSBI_EXT_START.

If you think it is better to drop VSBI_EXT_END for now, I’m okay with that,
and can just use VSBI_EXT instead of VSBI_EXT_START.

>
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -15,6 +15,7 @@
>>   #include <asm/processor.h>
>>   #include <asm/riscv_encoding.h>
>>   #include <asm/traps.h>
>> +#include <asm/vsbi.h>
>>   
>>   /*
>>    * Initialize the trap handling.
>> @@ -114,6 +115,13 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>   
>>       switch ( cause )
>>       {
>> +    case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
>> +        if ( !(cpu_regs->hstatus & HSTATUS_SPV) )
>> +            panic("CAUSE_VIRTUAL_SUPERVISOR_ECALL came not from VS-mode\n");
> This might more naturally want to be BUG_ON()? Assuming of course the value
> in question is exclusively under hypervisor control. Otherwise panic() would
> also be wrong to use here.

Only hypervisor can access ->hstatus (of course, hart is changing it when a trap
happens, for example).
BUG_ON() is a good option for me.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/vsbi/vsbi.c
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/sched.h>
>> +
>> +#include <asm/processor.h>
>> +#include <asm/sbi.h>
>> +#include <asm/vsbi.h>
>> +
>> +extern const struct vsbi_ext _svsbi_exts[], _evsbi_exts[];
>> +
>> +const struct vsbi_ext *vsbi_find_extension(unsigned long ext_id)
> static?

It could be use not in vsbi.c (for example, in the next patches it is used for
SBI_EXT_BASE_PROBE_EXT), so it shouldn't be static.

>
> Also, again - is the ext_ prefix adding any value here?

Not really, I guess.

>
>> +{
>> +    const struct vsbi_ext *vsbi_ext;
>> +
>> +    for ( vsbi_ext = _svsbi_exts; vsbi_ext != _evsbi_exts; vsbi_ext++ )
>> +        if ( ext_id >= vsbi_ext->eid_start &&
>> +             ext_id <= vsbi_ext->eid_end )
>> +            return vsbi_ext;
> What if multiple entries have overlapping EID ranges?

Good question, I wasn't able to find that EID is always unique in SBI spec,
but, at the same time, if to look at all available extensions and their id(s),
they are always unique, so I expect that they will be always unique, otherwise,
it won't be possible which extension should be used.

>
> Also at the macro definition site please clarify (by way of a comment)
> that these ramnges are inclusive (especially at the upper end).

I will add the following above VSBI_EXT_START:
   /* Ranges (start and end) are inclusive within an extension */

>
>> +void vsbi_handle_ecall(struct vcpu *vcpu, struct cpu_user_regs *regs)
>> +{
>> +    const unsigned long eid = regs->a7;
>> +    const unsigned long fid = regs->a6;
>> +    const struct vsbi_ext *ext = vsbi_find_extension(eid);
>> +    int ret;
>> +
>> +    if ( ext && ext->handle )
>> +        ret = ext->handle(vcpu, eid, fid, regs);
> Is a registration record NULL handler pointer actually legitimate / useful?
> (If there was range overlap checking I could see a reason to permit such.)

it is a good question, I think ext->handle = NULL should be impossible. At
least, at the moment I can't come up with the case where it is possible and
what will be a use case. I will drop ext->handle check.

>
>> +    else
>> +    {
>> +        printk("Unsupported Guest SBI EID #%#lx, FID #%lu\n", eid, regs->a1);
> Are the #-es ahead of the %-s adding value here?

It is how SBI spec writes them. For example,
  9. Hart State Management Extension (EID #0x48534D "HSM") . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
  9.1. Function: Hart start (FID #0) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27

So I thought that it would help to find stuff faster.

>   Is printing an ID as
> decimal going to be useful, when the value is pretty much arbitrary?

It seems like FID (in comparison with EID) is always in sequence and
start from 0, but I don't see that SBI spec guarantees that.

But in the same side for old extension they used hexdecimal for FID, but
again it is in sequence:
5. Legacy Extensions (EIDs #0x00 - #0x0F) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
5.1. Extension: Set Timer (EID #0x00) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
5.2. Extension: Console Putchar (EID #0x01) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16

>
>> +        ret = SBI_ERR_NOT_SUPPORTED;
>> +    }
>> +
>> +    /*
>> +     * The ecall instruction is not part of the RISC-V C extension (compressed
>> +     * instructions), so it is always 4 bytes long. Therefore, it is safe to
>> +     * use a fixed length of 4 bytes instead of reading guest memory to
>> +     * determine the instruction length.
>> +     */
> And ECALL is also the sole possible cause of CAUSE_VIRTUAL_SUPERVISOR_ECALL?

I think yes, in Trap Cause Codes paragraph in RISC-V spec is mentioned the following:
   Furthermore, environment calls from VS-mode are assigned cause 10,
   whereas those from HS-mode or S-mode use cause 9 as usual.

So it is explicitly tells that environemt calls, so ECALL.

>
>> --- a/xen/arch/riscv/xen.lds.S
>> +++ b/xen/arch/riscv/xen.lds.S
>> @@ -91,6 +91,13 @@ SECTIONS
>>   
>>       DT_DEV_INFO                       /* Devicetree based device info */
>>   
>> +    . = ALIGN(POINTER_ALIGN);
>> +    DECL_SECTION(.vsbi.exts) {
>> +        _svsbi_exts = .;
>> +        *(.vsbi.exts)
>> +        _evsbi_exts = .;
>> +    } :text
> Isn't this read-only data? In which case it wants to move up ahead of _erodata?

It is. I will move it to recommended place.

Thanks.

~ Oleksii


