Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5362A299A8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 20:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882305.1292461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfke2-00069A-42; Wed, 05 Feb 2025 19:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882305.1292461; Wed, 05 Feb 2025 19:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfke2-00066R-1E; Wed, 05 Feb 2025 19:01:06 +0000
Received: by outflank-mailman (input) for mailman id 882305;
 Wed, 05 Feb 2025 19:01:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnKU=U4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tfke0-00066H-DO
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 19:01:04 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ae502ca-e3f3-11ef-a0e7-8be0dac302b0;
 Wed, 05 Feb 2025 20:01:02 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38dada77686so73024f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 11:01:02 -0800 (PST)
Received: from [192.168.201.60] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d27aesm1158094866b.60.2025.02.05.11.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 11:01:00 -0800 (PST)
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
X-Inumbo-ID: 8ae502ca-e3f3-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738782061; x=1739386861; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4e4K8dI+sxG1l1rTxi98wDv7KUifNllFE/OHxMk76R8=;
        b=bTkbplr8IFDWaw0IBHZKEJ0k4v7hWnNLO78qnSbySzGyXax9AFCBnJwrqajgQFTHH1
         IV+cnGRdxBGWG++xPjlcjooJ3yisJu8RXRR/Q1R0/gUAvxrBUTl7TOSlBbf1KJJZk5Fw
         wU9p6qzDFHV7U4ISOhFMoMhT3J2vxCr4mVNPzQErDmqtrlpyNOMqrqaN49zTJXSLHEQS
         9GJVv9kmfa6SaEl0Ls5wUtKGvGd37ePtM6DXsBAHvkmfLLdQNduBEIdFtb7xIQsAtR0y
         vNVkYKc9xcYUrT4yFjsVKRsEUJKF9Z5BQD+yCddiBzDXdsLd4Fxe/Dyqv+zNoaHLfh0D
         cdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782061; x=1739386861;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4e4K8dI+sxG1l1rTxi98wDv7KUifNllFE/OHxMk76R8=;
        b=ROPe+KgmpWSeyiIRZpDoD+LQBs2nQxobHPLmuI9+aHWeTCZwbI7ivSrXUAscd8FrNP
         IwL6oXFNpFAmzdcVqKgXbO03C5vBy6j+1Ng0Zq4nN5+6PaUBXowjLRtk4/b+YjfQUW/T
         q8xHyUY0trDL8U2im/UhUrtVRFFzaUwRNI6vpKKpAiTShlV6jVghJPkVMx9GgkOEzN9I
         bVCypKNyXgMkmWEvDxvc5HFYFD40IoFaKnOOcS8YDTiVYMkYVYaBbT5cDoQo9wf5KUJY
         DJIuqk6AIKNT8PJL/umEScRxDhtvFXybZgg7tFQkezSO5n+491vl24Rk8DuqqlJUWOdu
         AZTg==
X-Forwarded-Encrypted: i=1; AJvYcCVJlnUo3jVuzHNz/0Z7h+w3gOBk1NLxTeGAgeKhWv75r0F/Sgh5bp263emSs656wvbjUU0uKHH22Uw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDrsHXkKgWF7t4rGv7Lsx6qOfIluveeumbh0CXmNIggdxxxINw
	VHuceOJ1vCSiA/qnedF3CN2JJCncZwwWefb2ntaIZed0WpjZL5Qc
X-Gm-Gg: ASbGncu/ljQBC9PES310KIZaL0fAq+pzceXOnnfCZa5KcCj8j3kAhadhXHVxteSeztx
	uHnjAh5QpZyRzL6Glf2yrBXhLF4F6KjKd0MiKm6z1+lW6Ew0Top4nZxZhZuWBSOdQK2GH6xnXOK
	q2J8x/5dZrDyEA7RYHeayGbs4ySQKIL9yOvK+ksLynZEo55JplbeZbkktl3xeeQuJNeAtebytrZ
	CQrvUtcyAJvDuzJhC6aH2VLksKyIbdbZx3F+TSejAAOdkx5mt3Ngvc5RH+dupLXRt91eoqADv0B
	v07d4BoiGgng9UK8atOqsrdP0No=
X-Google-Smtp-Source: AGHT+IG4R5Oq8jR5k3kChFIWG1XNp6UyvI+JJSKPwwhwGF4HBSsoMmeGLvN4rNhGpNE3sV5gf9DW4Q==
X-Received: by 2002:a5d:6d8b:0:b0:38c:5bc1:1f03 with SMTP id ffacd0b85a97d-38db4869a2bmr3973777f8f.7.1738782060620;
        Wed, 05 Feb 2025 11:01:00 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------LLWhShT61Mml13iC4izudkAo"
Message-ID: <6c9baf46-bc0b-49a7-9cdd-bebb0fc71ee7@gmail.com>
Date: Wed, 5 Feb 2025 20:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4-21 v4] xen/riscv: identify specific ISA supported by
 cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <a63c60c7a97a2b361e3a41f57bed61c0c9a0a89f.1738653407.git.oleksii.kurochko@gmail.com>
 <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>

This is a multi-part message in MIME format.
--------------LLWhShT61Mml13iC4izudkAo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/4/25 12:47 PM, Jan Beulich wrote:
> On 04.02.2025 08:20, Oleksii Kurochko wrote:
>> +/*
>> + * The canonical order of ISA extension names in the ISA string is defined in
>> + * chapter 27 of the unprivileged specification.
>> + *
>> + * The specification uses vague wording, such as should, when it comes to
>> + * ordering, so for our purposes the following rules apply:
>> + *
>> + * 1. All multi-letter extensions must be separated from other extensions by an
>> + *    underscore.
>> + *
>> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
>> + *    single-letter extensions and before any higher-privileged extensions.
>> + *
>> + * 3. The first letter following the 'Z' conventionally indicates the most
>> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
>> + *    If multiple 'Z' extensions are named, they must be ordered first by
>> + *    category, then alphabetically within a category.
>> + *
>> + * 4. Standard supervisor-level extensions (starting with 'S') must be listed
>> + *    after standard unprivileged extensions.  If multiple supervisor-level
>> + *    extensions are listed, they must be ordered alphabetically.
>> + *
>> + * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
>> + *    after any lower-privileged, standard extensions.  If multiple
>> + *    machine-level extensions are listed, they must be ordered
>> + *    alphabetically.
>> + *
>> + * 6. Non-standard extensions (starting with 'X') must be listed after all
>> + *    standard extensions. If multiple non-standard extensions are listed, they
>> + *    must be ordered alphabetically.
>> + *
>> + * An example string following the order is:
>> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>> + *
>> + * New entries to this struct should follow the ordering rules described above.
>> + *
>> + * Extension name must be all lowercase (according to device-tree binding)
>> + * and strncmp() is used in match_isa_ext() to compare extension names instead
>> + * of strncasecmp().
>> + */
>> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>> +};
>> +
>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>> +};
> Coming back to my earlier question regarding the B (pseudo-)extension:
> Since riscv_isa_ext[] only contains Zbb, is it precluded anywhere in
> the spec that DT may mention just B when all of its constituents are
> supported?

According to the device tree binding there is no such option just to mention B for riscv,extensions property:
   https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L246

but if look at pattern for riscv,isa property:
pattern:^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$ 


"B" could be set.
But it doesn't mentioned in device tree binding what is included when "B" is mentioned in riscv,isa property, so I
assume that it is following B Standard Extension doc [https://github.com/riscv/riscv-b/blob/main/b.adoc#11-privileged-architecture-implications ]
and will do the same as for misa register:
   Misa.B=1 then it means that Zba, Zbb, Zbc are all supported.


Regarding "G" extensions it isn't used in device tree binding and is explicitly unfolded in "IMAFDZicsr_Zifencei". I will add them to required_extensions[] for
consistency.

>> +        {
>> +            __set_bit(ext->id, bitmap);
>> +            break;
>> +        }
>> +    }
>> +}
>> +
>> +static int __init riscv_isa_parse_string(const char *isa,
>> +                                         unsigned long *out_bitmap)
>> +{
>> +    if ( (isa[0] != 'r') && (isa[1] != 'v') )
>> +        return -EINVAL;
>> +
>> +#if defined(CONFIG_RISCV_32)
>> +    if ( isa[2] != '3' && isa[3] != '2' )
>> +        return -EINVAL;
>> +#elif defined(CONFIG_RISCV_64)
>> +    if ( isa[2] != '6' && isa[3] != '4' )
>> +        return -EINVAL;
>> +#else
>> +# error "unsupported RISC-V bitness"
>> +#endif
>> +
>> +    isa += 4;
>> +
>> +    while ( *isa )
>> +    {
>> +        const char *ext = isa++;
>> +        const char *ext_end = isa;
>> +        bool ext_err = false;
>> +
>> +        switch ( *ext )
>> +        {
>> +        case 'x':
>> +            printk_once("Vendor extensions are ignored in riscv,isa\n");
>> +            /*
>> +             * To skip an extension, we find its end.
>> +             * As multi-letter extensions must be split from other multi-letter
>> +             * extensions with an "_", the end of a multi-letter extension will
>> +             * either be the null character or the "_" at the start of the next
>> +             * multi-letter extension.
>> +             */
>> +            for ( ; *isa && *isa != '_'; ++isa )
>> +                ;
>> +            ext_err = true;
>> +            break;
> I was wondering why ext_end isn't updated here. Looks like that's because
> ext_err is set to true, and the checking below the switch looks at ext_err
> first. That's technically fine, but - to me at least - a little confusing.
> Could setting ext_end to NULL take the role of ext_err? For the code here
> this would then immediately clarify why ext_end isn't otherwise maintained.
> (The "err" in the name is also somewhat odd: The log message above says
> "ignored", and that's what the code below also does. There's nothing
> error-ish in here; in fact there may be nothing wrong about the specific
> vendor extension we're ignoring.)

IIUC, your suggestion is to use instead of "ext_err = true" -> "ext_end = NULL". If my understanding
is correct then we can really do in this way (of course, with some updates as you mentioned below).

>
>> +        case 's':
>> +            /*
>> +             * Workaround for invalid single-letter 's' & 'u' (QEMU):
>> +             *   Before QEMU 7.1 it was an issue with misa to ISA string
>> +             *   conversion:
>> +             *https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
>> +             *   Additional details of the workaround on Linux kernel side:
>> +             *https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
>> +             *
>> +             * No need to set the bit in riscv_isa as 's' & 'u' are
>> +             * not valid ISA extensions. It works unless the first
>> +             * multi-letter extension in the ISA string begins with
>> +             * "Su" and is not prefixed with an underscore.
>> +             */
>> +            if ( ext[-1] != '_' && ext[1] == 'u' )
>> +            {
>> +                ++isa;
>> +                ext_err = true;
>> +                break;
>> +            }
>> +            fallthrough;
>> +        case 'z':
>> +            /*
>> +             * Before attempting to parse the extension itself, we find its end.
>> +             * As multi-letter extensions must be split from other multi-letter
>> +             * extensions with an "_", the end of a multi-letter extension will
>> +             * either be the null character or the "_" at the start of the next
>> +             * multi-letter extension.
>> +             *
>> +             * Next, as the extensions version is currently ignored, we
>> +             * eliminate that portion. This is done by parsing backwards from
>> +             * the end of the extension, removing any numbers. This may be a
>> +             * major or minor number however, so the process is repeated if a
>> +             * minor number was found.
>> +             *
>> +             * ext_end is intended to represent the first character *after* the
>> +             * name portion of an extension, but will be decremented to the last
>> +             * character itself while eliminating the extensions version number.
>> +             * A simple re-increment solves this problem.
>> +             */
>> +            for ( ; *isa && *isa != '_'; ++isa )
>> +                if ( unlikely(!isalnum(*isa)) )
>> +                    ext_err = true;
>> +
>> +            ext_end = isa;
>> +            if ( unlikely(ext_err) )
>> +                break;
> This, otoh, is an error. Which probably shouldn't go silently.

It is actually not an error, what it means that if version is mentioned or not, so
(1) rv32..._zbb_zbc
(2) rv32..._zbb1p2_zbc

For (1), ext_err = true and it means that version isn't mentioned for _zbb and after it
immediately another extension name is going, so there is no any sense in ignoring (or parsing) version
numbers.
For (2), ext_err = false (because it ends on number ) so we have to ignore (or parse) version nubmers.

>
> Considering the earlier remark, ext_end would then perhaps also be more
> logical to update after the above if().
>
>> +            if ( !isdigit(ext_end[-1]) )
>> +                break;
>> +
>> +            while ( isdigit(*--ext_end) )
>> +                ;
>> +
>> +            if ( tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1]) )
> Leftover tolower()?

Agree, it should be dropped as we have a check that riscv,isa comes all in lowercase letters.

>
>> +            {
>> +                ++ext_end;
>> +                break;
>> +            }
>> +
>> +            while ( isdigit(*--ext_end) )
>> +                ;
>> +
>> +            ++ext_end;
>> +            break;
>> +
>> +        default:
>> +            /*
>> +             * Things are a little easier for single-letter extensions, as they
>> +             * are parsed forwards.
>> +             *
>> +             * After checking that our starting position is valid, we need to
>> +             * ensure that, when isa was incremented at the start of the loop,
>> +             * that it arrived at the start of the next extension.
>> +             *
>> +             * If we are already on a non-digit, there is nothing to do. Either
>> +             * we have a multi-letter extension's _, or the start of an
>> +             * extension.
>> +             *
>> +             * Otherwise we have found the current extension's major version
>> +             * number. Parse past it, and a subsequent p/minor version number
>> +             * if present. The `p` extension must not appear immediately after
>> +             * a number, so there is no fear of missing it.
>> +             */
>> +            if ( unlikely(!isalpha(*ext)) )
>> +            {
>> +                ext_err = true;
>> +                break;
>> +            }
> Like above this also looks to be a situation that maybe better would be
> left go entirely silently. I even wonder whether you can safely continue
> the parsing in that case: How do you know whether what follows is indeed
> the start of an extension name?

Lets consider examples:
(1) riscv,isa=im
(2) riscv,isa=i1p2m
(3) riscv,isa=i1m

(4) riscv,isa=i1_m1

Note: Underscores "_" may be used to separate ISA extensions to improve readability
and to provide disambiguation, e.g., "RV32I2_M2_A2".

(1) isa="i" so ext = "m" => no minor and major version between "i" and "m" => `ext` contains the name
     of the next extension name, thereby we will break a loop and go for parsing of the next extension
     which is "m" in this example
(2) isa="i" => ext="1" => algorithm will go further and will just skip minor and major version for
     this extension (1p2 => 1.2 version of extension "i")
(3) just the same as (2) but will stop earlier as minor version isn't set.

Note: having "_" is legal from specification point of view, but it is illegal to use it between single letter
       extension from device tree binding point of view.
(4) just the same as (2) and (3) but using "_" separator, so the if above will just skip "_" and the next
     after "_" is an extension name again.

Considering that "_" is illegal from device tree point of view between single letter extensions we should have
ASSERT(*ext != "_") and then only cases (1) - (3) will be possible to have.
Probably it also will make a sense to have an array with legal single letter extensions and check that *ext is
in this array.

Interesting that device tree binding doesn't cover this case:
```
Because the "P" extension for Packed SIMD can be confused for the decimal point in a version number,
it must be preceded by an underscore if it follows a number. For example, "rv32i2p2" means version
2.2 of RV32I, whereas "rv32i2_p2" means version 2.0 of RV32I with version 2.0 of the P extension.
```
if I correctly interpreted the pattern:pattern:^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$
And it also doesn't support versions for single letter extensions.
So "rv32i2_m2_a2" or with using "p" is impossible?
Then riscv_isa_parse_string() could be simplified ( probably when it was implemented in Linux kernel they don't have the binding for riscv,isa and they
just tried to follow RISC-V specification ) for the case of single letter extensions (or just keep it as is to be in sync with Linux kernel).

>
>> +static void __init riscv_fill_hwcap_from_isa_string(void)
>> +{
>> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>> +    const struct dt_device_node *cpu;
>> +
>> +    if ( !cpus )
>> +    {
>> +        printk("Missing /cpus node in the device tree?\n");
>> +        return;
>> +    }
>> +
>> +    dt_for_each_child_node(cpus, cpu)
>> +    {
>> +        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>> +        const char *isa;
>> +        unsigned long cpuid;
>> +
>> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
>> +            continue;
>> +
>> +        if ( dt_get_cpuid_from_node(cpu, &cpuid) < 0 )
>> +            continue;
>> +
>> +        if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
>> +        {
>> +            printk("Unable to find \"riscv,isa\" devicetree entry "
>> +                   "for DT's cpu%ld node\n", cpuid);
>> +            continue;
>> +        }
>> +
>> +        for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
>> +            if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
>> +                panic("According to DT binding riscv,isa must be lowercase\n");
>> +
>> +        riscv_isa_parse_string(isa, this_isa);
>> +
>> +        /*
>> +         * In the unpriv. spec is mentioned:
>> +         *   A RISC-V ISA is defined as a base integer ISA, which must be
>> +         *   present in any implementation, plus optional extensions to
>> +         *   the base ISA.
>> +         * What means that isa should contain, at least, I or E thereby
>> +         * this_isa can't be empty too.
>> +         *
>> +         * Ensure that this_isa is not empty, so riscv_isa won't be empty
>> +         * during initialization. This prevents ending up with extensions
>> +         * not supported by one of the CPUs.
>> +         */
>> +        ASSERT(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX));
> This is again an assertion on input we consume. Afaict it would actually
> trigger not only on all kinds of invalid inputs, but on something valid
> like "rv32e".

In the case of "rv32e" I think it is fine that it will be asserted as in riscv_isa_ext[] we don't
have 'E' extension and thereby riscv_isa_ext[] should be updated properly.

 From the unpriv. spec then "i" ( a base integer ISA ) must be present ( the comment above should be
updated a little bit ). And if I am reading riscv,isa's pattern ( mentioned above ) properly "ima" should be present
too.
Probably I have to update the code, at the start of riscv_isa_parsing() where "rv{32,64}" is checked.

Could you please explain me again what is wrong with having ASSERT() itself for input we consume? If to change that
to 'if ()' would it be better? Or it should be just moved to riscv_isa_parse_string() where this bitmap is filled?

Thanks.

~ Oleksii

--------------LLWhShT61Mml13iC4izudkAo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/4/25 12:47 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ab7077b3-6bef-4025-9389-345a345a141c@suse.com">
      <pre wrap="" class="moz-quote-pre">On 04.02.2025 08:20, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * The canonical order of ISA extension names in the ISA string is defined in
+ * chapter 27 of the unprivileged specification.
+ *
+ * The specification uses vague wording, such as should, when it comes to
+ * ordering, so for our purposes the following rules apply:
+ *
+ * 1. All multi-letter extensions must be separated from other extensions by an
+ *    underscore.
+ *
+ * 2. Additional standard extensions (starting with 'Z') must be sorted after
+ *    single-letter extensions and before any higher-privileged extensions.
+ *
+ * 3. The first letter following the 'Z' conventionally indicates the most
+ *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+ *    If multiple 'Z' extensions are named, they must be ordered first by
+ *    category, then alphabetically within a category.
+ *
+ * 4. Standard supervisor-level extensions (starting with 'S') must be listed
+ *    after standard unprivileged extensions.  If multiple supervisor-level
+ *    extensions are listed, they must be ordered alphabetically.
+ *
+ * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
+ *    after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they must be ordered
+ *    alphabetically.
+ *
+ * 6. Non-standard extensions (starting with 'X') must be listed after all
+ *    standard extensions. If multiple non-standard extensions are listed, they
+ *    must be ordered alphabetically.
+ *
+ * An example string following the order is:
+ *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+ *
+ * New entries to this struct should follow the ordering rules described above.
+ *
+ * Extension name must be all lowercase (according to device-tree binding)
+ * and strncmp() is used in match_isa_ext() to compare extension names instead
+ * of strncasecmp().
+ */
+const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
+    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
+    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
+    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
+    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
+    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
+    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+};
+
+static const struct riscv_isa_ext_data __initconst required_extensions[] = {
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Coming back to my earlier question regarding the B (pseudo-)extension:
Since riscv_isa_ext[] only contains Zbb, is it precluded anywhere in
the spec that DT may mention just B when all of its constituents are
supported?</pre>
    </blockquote>
    <pre>According to the device tree binding there is no such option just to mention B for riscv,extensions property:
  <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L246">https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L246</a>

but if look at pattern for riscv,isa property:
<span class="nt"
style="box-sizing: inherit; vertical-align: top; color: rgb(0, 119, 0); font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">  pattern</span><span
    class="p"
style="box-sizing: inherit; vertical-align: top; color: rgb(102, 102, 102); font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">:</span><span
    class="w"
style="box-sizing: inherit; vertical-align: top; color: rgb(187, 187, 187); font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"> </span><span
    class="l l-Scalar l-Scalar-Plain"
style="box-sizing: inherit; vertical-align: top; color: rgb(0, 0, 0); font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$
</span><pre>"B" could be set.
But it doesn't mentioned in device tree binding what is included when "B" is mentioned in riscv,isa property, so I
assume that it is following B Standard Extension doc [ <a class="moz-txt-link-freetext" href="https://github.com/riscv/riscv-b/blob/main/b.adoc#11-privileged-architecture-implications">https://github.com/riscv/riscv-b/blob/main/b.adoc#11-privileged-architecture-implications</a> ]
and will do the same as for misa register:
  Misa.B=1 then it means that Zba, Zbb, Zbc are all supported.</pre>
Regarding "G" extensions it isn't used in device tree binding and is explicitly unfolded in "IMAFDZicsr_Zifencei". I will add them to required_extensions[] for
consistency.
</pre>
    <blockquote type="cite"
      cite="mid:ab7077b3-6bef-4025-9389-345a345a141c@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        {
+            __set_bit(ext-&gt;id, bitmap);
+            break;
+        }
+    }
+}
+
+static int __init riscv_isa_parse_string(const char *isa,
+                                         unsigned long *out_bitmap)
+{
+    if ( (isa[0] != 'r') &amp;&amp; (isa[1] != 'v') )
+        return -EINVAL;
+
+#if defined(CONFIG_RISCV_32)
+    if ( isa[2] != '3' &amp;&amp; isa[3] != '2' )
+        return -EINVAL;
+#elif defined(CONFIG_RISCV_64)
+    if ( isa[2] != '6' &amp;&amp; isa[3] != '4' )
+        return -EINVAL;
+#else
+# error "unsupported RISC-V bitness"
+#endif
+
+    isa += 4;
+
+    while ( *isa )
+    {
+        const char *ext = isa++;
+        const char *ext_end = isa;
+        bool ext_err = false;
+
+        switch ( *ext )
+        {
+        case 'x':
+            printk_once("Vendor extensions are ignored in riscv,isa\n");
+            /*
+             * To skip an extension, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             */
+            for ( ; *isa &amp;&amp; *isa != '_'; ++isa )
+                ;
+            ext_err = true;
+            break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I was wondering why ext_end isn't updated here. Looks like that's because
ext_err is set to true, and the checking below the switch looks at ext_err
first. That's technically fine, but - to me at least - a little confusing.
Could setting ext_end to NULL take the role of ext_err? For the code here
this would then immediately clarify why ext_end isn't otherwise maintained.
(The "err" in the name is also somewhat odd: The log message above says
"ignored", and that's what the code below also does. There's nothing
error-ish in here; in fact there may be nothing wrong about the specific
vendor extension we're ignoring.)</pre>
    </blockquote>
    <pre>IIUC, your suggestion is to use instead of "ext_err = true" -&gt; "ext_end = NULL". If my understanding
is correct then we can really do in this way (of course, with some updates as you mentioned below).
</pre>
    <blockquote type="cite"
      cite="mid:ab7077b3-6bef-4025-9389-345a345a141c@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        case 's':
+            /*
+             * Workaround for invalid single-letter 's' &amp; 'u' (QEMU):
+             *   Before QEMU 7.1 it was an issue with misa to ISA string
+             *   conversion:
+             *     <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587">https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587</a>
+             *   Additional details of the workaround on Linux kernel side:
+             *     <a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t">https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t</a>
+             *
+             * No need to set the bit in riscv_isa as 's' &amp; 'u' are
+             * not valid ISA extensions. It works unless the first
+             * multi-letter extension in the ISA string begins with
+             * "Su" and is not prefixed with an underscore.
+             */
+            if ( ext[-1] != '_' &amp;&amp; ext[1] == 'u' )
+            {
+                ++isa;
+                ext_err = true;
+                break;
+            }
+            fallthrough;
+        case 'z':
+            /*
+             * Before attempting to parse the extension itself, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             *
+             * Next, as the extensions version is currently ignored, we
+             * eliminate that portion. This is done by parsing backwards from
+             * the end of the extension, removing any numbers. This may be a
+             * major or minor number however, so the process is repeated if a
+             * minor number was found.
+             *
+             * ext_end is intended to represent the first character *after* the
+             * name portion of an extension, but will be decremented to the last
+             * character itself while eliminating the extensions version number.
+             * A simple re-increment solves this problem.
+             */
+            for ( ; *isa &amp;&amp; *isa != '_'; ++isa )
+                if ( unlikely(!isalnum(*isa)) )
+                    ext_err = true;
+
+            ext_end = isa;
+            if ( unlikely(ext_err) )
+                break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This, otoh, is an error. Which probably shouldn't go silently.</pre>
    </blockquote>
    <pre>It is actually not an error, what it means that if version is mentioned or not, so
(1) rv32..._zbb_zbc
(2) rv32..._zbb1p2_zbc

For (1), ext_err = true and it means that version isn't mentioned for _zbb and after it
immediately another extension name is going, so there is no any sense in ignoring (or parsing) version
numbers.
For (2), ext_err = false (because it ends on number ) so we have to ignore (or parse) version nubmers.

</pre>
    <blockquote type="cite"
      cite="mid:ab7077b3-6bef-4025-9389-345a345a141c@suse.com">
      <pre wrap="" class="moz-quote-pre">

Considering the earlier remark, ext_end would then perhaps also be more
logical to update after the above if().

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            if ( !isdigit(ext_end[-1]) )
+                break;
+
+            while ( isdigit(*--ext_end) )
+                ;
+
+            if ( tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1]) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Leftover tolower()?</pre>
    </blockquote>
    <pre>Agree, it should be dropped as we have a check that riscv,isa comes all in lowercase letters.
</pre>
    <blockquote type="cite"
      cite="mid:ab7077b3-6bef-4025-9389-345a345a141c@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            {
+                ++ext_end;
+                break;
+            }
+
+            while ( isdigit(*--ext_end) )
+                ;
+
+            ++ext_end;
+            break;
+
+        default:
+            /*
+             * Things are a little easier for single-letter extensions, as they
+             * are parsed forwards.
+             *
+             * After checking that our starting position is valid, we need to
+             * ensure that, when isa was incremented at the start of the loop,
+             * that it arrived at the start of the next extension.
+             *
+             * If we are already on a non-digit, there is nothing to do. Either
+             * we have a multi-letter extension's _, or the start of an
+             * extension.
+             *
+             * Otherwise we have found the current extension's major version
+             * number. Parse past it, and a subsequent p/minor version number
+             * if present. The `p` extension must not appear immediately after
+             * a number, so there is no fear of missing it.
+             */
+            if ( unlikely(!isalpha(*ext)) )
+            {
+                ext_err = true;
+                break;
+            }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Like above this also looks to be a situation that maybe better would be
left go entirely silently. I even wonder whether you can safely continue
the parsing in that case: How do you know whether what follows is indeed
the start of an extension name?</pre>
    </blockquote>
    <pre>Lets consider examples:
(1) riscv,isa=im
(2) riscv,isa=i1p2m
(3) riscv,isa=i1m

(4) riscv,isa=i1_m1

Note: Underscores "_" may be used to separate ISA extensions to improve readability
and to provide disambiguation, e.g., "RV32I2_M2_A2".

(1) isa="i" so ext = "m" =&gt; no minor and major version between "i" and "m" =&gt; `ext` contains the name
    of the next extension name, thereby we will break a loop and go for parsing of the next extension
    which is "m" in this example
(2) isa="i" =&gt; ext="1" =&gt; algorithm will go further and will just skip minor and major version for
    this extension (1p2 =&gt; 1.2 version of extension "i") 
(3) just the same as (2) but will stop earlier as minor version isn't set.

Note: having "_" is legal from specification point of view, but it is illegal to use it between single letter
      extension from device tree binding point of view.
(4) just the same as (2) and (3) but using "_" separator, so the if above will just skip "_" and the next
    after "_" is an extension name again.

Considering that "_" is illegal from device tree point of view between single letter extensions we should have
ASSERT(*ext != "_") and then only cases (1) - (3) will be possible to have.
Probably it also will make a sense to have an array with legal single letter extensions and check that *ext is
in this array.

Interesting that device tree binding doesn't cover this case:
```
Because the "P" extension for Packed SIMD can be confused for the decimal point in a version number,
it must be preceded by an underscore if it follows a number. For example, "rv32i2p2" means version
2.2 of RV32I, whereas "rv32i2_p2" means version 2.0 of RV32I with version 2.0 of the P extension.
```
if I correctly interpreted the pattern: <span class="nt"
style="box-sizing: inherit; vertical-align: top; color: rgb(0, 119, 0); font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">pattern</span><span
    class="p"
style="box-sizing: inherit; vertical-align: top; color: rgb(102, 102, 102); font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">:</span><span
    class="w"
style="box-sizing: inherit; vertical-align: top; color: rgb(187, 187, 187); font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"> </span><span
    class="l l-Scalar l-Scalar-Plain"
style="box-sizing: inherit; vertical-align: top; color: rgb(0, 0, 0); font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$</span>
And it also doesn't support versions for single letter extensions.
So "rv32i2_m2_a2" or with using "p" is impossible?
Then riscv_isa_parse_string() could be simplified ( probably when it was implemented in Linux kernel they don't have the binding for riscv,isa and they
just tried to follow RISC-V specification ) for the case of single letter extensions (or just keep it as is to be in sync with Linux kernel).

</pre>
    <blockquote type="cite"
      cite="mid:ab7077b3-6bef-4025-9389-345a345a141c@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void __init riscv_fill_hwcap_from_isa_string(void)
+{
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    const struct dt_device_node *cpu;
+
+    if ( !cpus )
+    {
+        printk("Missing /cpus node in the device tree?\n");
+        return;
+    }
+
+    dt_for_each_child_node(cpus, cpu)
+    {
+        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+        const char *isa;
+        unsigned long cpuid;
+
+        if ( !dt_device_type_is_equal(cpu, "cpu") )
+            continue;
+
+        if ( dt_get_cpuid_from_node(cpu, &amp;cpuid) &lt; 0 )
+            continue;
+
+        if ( dt_property_read_string(cpu, "riscv,isa", &amp;isa) )
+        {
+            printk("Unable to find \"riscv,isa\" devicetree entry "
+                   "for DT's cpu%ld node\n", cpuid);
+            continue;
+        }
+
+        for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
+            if ( !isdigit(isa[i]) &amp;&amp; (isa[i] != '_') &amp;&amp; !islower(isa[i]) )
+                panic("According to DT binding riscv,isa must be lowercase\n");
+
+        riscv_isa_parse_string(isa, this_isa);
+
+        /*
+         * In the unpriv. spec is mentioned:
+         *   A RISC-V ISA is defined as a base integer ISA, which must be
+         *   present in any implementation, plus optional extensions to
+         *   the base ISA.
+         * What means that isa should contain, at least, I or E thereby
+         * this_isa can't be empty too.
+         *
+         * Ensure that this_isa is not empty, so riscv_isa won't be empty
+         * during initialization. This prevents ending up with extensions
+         * not supported by one of the CPUs.
+         */
+        ASSERT(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is again an assertion on input we consume. Afaict it would actually
trigger not only on all kinds of invalid inputs, but on something valid
like "rv32e".</pre>
    </blockquote>
    <pre>In the case of "rv32e" I think it is fine that it will be asserted as in riscv_isa_ext[] we don't
have 'E' extension and thereby riscv_isa_ext[] should be updated properly.

From the unpriv. spec then "i" ( a base integer ISA ) must be present ( the comment above should be
updated a little bit ). And if I am reading riscv,isa's pattern ( mentioned above ) properly "ima" should be present
too.
Probably I have to update the code, at the start of riscv_isa_parsing() where "rv{32,64}" is checked.

Could you please explain me again what is wrong with having ASSERT() itself for input we consume? If to change that
to 'if ()' would it be better? Or it should be just moved to riscv_isa_parse_string() where this bitmap is filled?

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------LLWhShT61Mml13iC4izudkAo--

