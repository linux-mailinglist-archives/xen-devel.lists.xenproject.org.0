Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9370E929F1D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755254.1163563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkjH-0006uW-LG; Mon, 08 Jul 2024 09:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755254.1163563; Mon, 08 Jul 2024 09:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkjH-0006sV-Ie; Mon, 08 Jul 2024 09:32:15 +0000
Received: by outflank-mailman (input) for mailman id 755254;
 Mon, 08 Jul 2024 09:32:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sQkjG-0006sP-5h
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:32:14 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3a776a8-3d0c-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 11:32:10 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so49253031fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:32:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb4c2b29c3sm54808855ad.38.2024.07.08.02.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 02:32:09 -0700 (PDT)
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
X-Inumbo-ID: f3a776a8-3d0c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720431130; x=1721035930; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SDAZAqRCsxONZj39fRJPVOq1kyQD/Qz5zfRAD3kowU8=;
        b=bibJRgNcPPtNm2+0SZ6wP9HvPgyjSpqgTD3VSjl2BzaUnV1Qh4MMFjA4iTZvQKX8bD
         SN4KF99kKLrZXptPH0eS28cnn5vGvpPMS3Jza4yQ3zUkgy99rZWCqusTLeM2DTKgJS7D
         gBKJ13C6JWrC1/EGEWFOkJoHviQ1O/A2vZgBK1ht1+AgvOYw3TU41qfrbQnATg6oJIlU
         N1OD7X1R6B1eDRzJObKxiRhCiKEWludPF+307uyJN96+cd83tyhW+8e5pADYlymCvnAS
         hKv/BqUGpmNYJGs7Xrtj4VBC7UYVA0xDTWLuTB5vjkmOD46/YU9DkF1LUElzaA0jVJQr
         IqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720431130; x=1721035930;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDAZAqRCsxONZj39fRJPVOq1kyQD/Qz5zfRAD3kowU8=;
        b=UQD4KN82QfOsgeZKBas/rot6fUONpd3BwZtwicMHyNSiiWatj17JqFbH8aQd5/bOU4
         QC72Str3r4eBu8KthFYWBWPYMx3ODYIzsnIFKUHRAi0h7egCZALYGr/ew+jEH4m/lAxc
         aVqeRj/hOCCjD0rwPb+QUkerDDPgTa0tUQY+RXZny4YIT67esktWtpSbyW4V1W1dg5Sk
         7HtobQAZM7VRPuyMnsTE3J/eWlCcyyjMSsdMLRcznvovYTA6QNDoYmpyC3TvRrYDunQH
         gu0ETD9tiRoRRtz5eRTvYKscoA82OEDLV86NikQTR9arwu1LJzsmKDpKJTt86eGflmfj
         7Bew==
X-Forwarded-Encrypted: i=1; AJvYcCXXOH7JCEQFrXR/PS6bCWOCfFV7/Y6p7wcCp1j7LP9QSFIvu+WCVDc8L/OoNYgfSNst9SHdXIMbQ+5i/mZ76QE6QIoLEF2Sw/0RLWTepIc=
X-Gm-Message-State: AOJu0YwCpk+/bRCyFpNvwJtE+lvUOCDVQI3dw8mIlmQKXhZ2qE2t4paP
	MUxvSH2sDiHtDGL4Kez12y/WM9O+5Yb7B1ljbpR7QUlFz0OGAS/HFPjc3OTAzg==
X-Google-Smtp-Source: AGHT+IG32YKdCYL7GBkrgipIPkhgc3S/K0rrGzs989pCBoAEGk54iOtARxGDtt9D1WJTmuWI2zqvYQ==
X-Received: by 2002:a2e:9e94:0:b0:2ee:8db7:47b7 with SMTP id 38308e7fff4ca-2ee8ed87aaemr71644251fa.26.1720431130241;
        Mon, 08 Jul 2024 02:32:10 -0700 (PDT)
Message-ID: <f8cc1555-7689-49ff-9114-13354f1553cd@suse.com>
Date: Mon, 8 Jul 2024 11:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: PE/COFF image header for RISC-V target
To: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Cc: milan.djokic@rt-rk.com, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Nikola Jelic <nikola.jelic@rt-rk.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bbb65fcda57f2609f0967f9050a91415059026c.1719942341.git.milan.djokic@rt-rk.com>
 <21a1bbe9308b72eac6d218235f5211c7a1c90454.1719964980.git.milan.djokic@rt-rk.com>
 <0481c78f-ccad-4c65-b104-6b787b79f1d8@suse.com>
 <CAKp59VHkEpKMNpA18xjHp4n_XxA4Fbo121v5ApoTseyhirkM+g@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CAKp59VHkEpKMNpA18xjHp4n_XxA4Fbo121v5ApoTseyhirkM+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.07.2024 19:21, Milan Đokić wrote:
> On Wed, Jul 3, 2024 at 5:55 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 03.07.2024 02:04, Milan Djokic wrote:
>>> +#ifdef CONFIG_RISCV_EFI
>>> +        /*
>>> +         * This instruction decodes to "MZ" ASCII required by UEFI.
>>> +         */
>>> +        c.li s4,-13
>>> +        c.j xen_start
>>> +#else
>>> +        /* jump to start kernel */
>>> +        jal xen_start
>>
>> JAL, not J? Why?
>>
> We use jal explicitly here to highlight that we want to occupy 32 bits
> in order to align with header format (and EFI case where we use two
> 16-bits instructions). Although it will also work by using "j"
> directly, it could be implicitly compressed to 16 bits (if C extension
> is available) which would make header layout less obvious imo.

According to e.g. ...

>>> +#endif
>>> +        .balign 8
>>
>> This won't do what you want unless "start" itself is also suitably aligned.
>> It'll be as long as it's first in the section, but better make such explicit.
>>
> I understand, we'll also explicitly align "start"
> 
>>> +#ifdef CONFIG_RISCV_64
>>> +        /* Image load offset(2MB) from start of RAM */
>>> +        .quad 0x200000
>>> +#else
>>> +        /* Image load offset(4MB) from start of RAM */
>>> +        .quad 0x400000
>>> +#endif

... the #ifdef here, you aim at having code be suitable for RV32, too.
However, JAL has a compressed form there, so its use would make things
"less obvious" there as well. I'm inclined to say that since the
subsequent ".balign 8" adds padding NOPs anyway, there's no real
difference whether that adds 32 bits worth of NOPs or 48 bits. If you
really wanted to "hide" the difference, imo ".balign 4" would be the
way to go.

In any event, if there would still be a reason to stick to JAL, you'd
want to name the reason(s) in a code comment.

>> What these constants derive from? I expect they aren't really "magic" .
>>
> These offsets are commonly used for RISCV SOCs. In general, these can
> have different values, depending on memory layout, but in order to be
> compatible with
> linux bootloaders we just followed the common practice.

So entirely magic, really. Such imo needs commenting on.

>>> @@ -60,6 +100,7 @@ FUNC(start)
>>>          mv      a1, s1
>>>
>>>          tail    start_xen
>>> +
>>>  END(start)
>>>
>>>          .section .text, "ax", %progbits
>>
>> What is this hunk about?
>>
> Not sure which part of the code you refer to here. This section is
> part of the original riscv implementation. We only grouped this
> section under the new, xen_start label since we have different
> handling for EFI and ELF formats  in the beginning of "start" function
> before jumping to xen_start.

"Hunk" is common term for a single piece of "diff" output, starting at
the @@ line. To word it differently: What reason is there to insert a
blank line in this very patch?

>>> --- /dev/null
>>> +++ b/xen/include/efi/pe.h
>>> @@ -0,0 +1,458 @@
>>> +#ifndef __PE_H
>>
>> This probably wants (needs?) to gain an SPDX line.
>>
> Yes, it was originally taken over from the linux kernel (with some
> modifications from our side), but we omitted the SPDX line by mistake.
> 
>>> +#define __PE_H
>>> +
>>> +/*
>>> + * Linux EFI stub v1.0 adds the following functionality:
>>> + * - Loading initrd from the LINUX_EFI_INITRD_MEDIA_GUID device path,
>>> + * - Loading/starting the kernel from firmware that targets a different
>>> + *   machine type, via the entrypoint exposed in the .compat PE/COFF section.
>>> + *
>>> + * The recommended way of loading and starting v1.0 or later kernels is to use
>>> + * the LoadImage() and StartImage() EFI boot services, and expose the initrd
>>> + * via the LINUX_EFI_INITRD_MEDIA_GUID device path.
>>> + *
>>> + * Versions older than v1.0 support initrd loading via the image load options
>>> + * (using initrd=, limited to the volume from which the kernel itself was
>>> + * loaded), or via arch specific means (bootparams, DT, etc).
>>> + *
>>> + * On x86, LoadImage() and StartImage() can be omitted if the EFI handover
>>> + * protocol is implemented, which can be inferred from the version,
>>> + * handover_offset and xloadflags fields in the bootparams structure.
>>> + */
>>> +#define LINUX_EFISTUB_MAJOR_VERSION 0x1
>>> +#define LINUX_EFISTUB_MINOR_VERSION 0x0
>>> +
>>> +#define MZ_MAGIC 0x5a4d /* "MZ" */
>>> +
>>> +#define PE_MAGIC              0x00004550 /* "PE\0\0" */
>>> +#define PE_OPT_MAGIC_PE32     0x010b
>>> +#define PE_OPT_MAGIC_PE32_ROM 0x0107
>>> +#define PE_OPT_MAGIC_PE32PLUS 0x020b
>>> +
>>> +/* machine type */
>>> +#define IMAGE_FILE_MACHINE_UNKNOWN   0x0000
>>> +#define IMAGE_FILE_MACHINE_AM33      0x01d3
>>> +#define IMAGE_FILE_MACHINE_AMD64     0x8664
>>> +#define IMAGE_FILE_MACHINE_ARM       0x01c0
>>> +#define IMAGE_FILE_MACHINE_ARMV7     0x01c4
>>> +#define IMAGE_FILE_MACHINE_ARM64     0xaa64
>>> +#define IMAGE_FILE_MACHINE_EBC       0x0ebc
>>> +#define IMAGE_FILE_MACHINE_I386      0x014c
>>> +#define IMAGE_FILE_MACHINE_IA64      0x0200
>>> +#define IMAGE_FILE_MACHINE_M32R      0x9041
>>> +#define IMAGE_FILE_MACHINE_MIPS16    0x0266
>>> +#define IMAGE_FILE_MACHINE_MIPSFPU   0x0366
>>> +#define IMAGE_FILE_MACHINE_MIPSFPU16 0x0466
>>> +#define IMAGE_FILE_MACHINE_POWERPC   0x01f0
>>> +#define IMAGE_FILE_MACHINE_POWERPCFP 0x01f1
>>> +#define IMAGE_FILE_MACHINE_R4000     0x0166
>>> +#define IMAGE_FILE_MACHINE_RISCV32   0x5032
>>> +#define IMAGE_FILE_MACHINE_RISCV64   0x5064
>>> +#define IMAGE_FILE_MACHINE_RISCV128  0x5128
>>> +#define IMAGE_FILE_MACHINE_SH3       0x01a2
>>> +#define IMAGE_FILE_MACHINE_SH3DSP    0x01a3
>>> +#define IMAGE_FILE_MACHINE_SH3E      0x01a4
>>> +#define IMAGE_FILE_MACHINE_SH4       0x01a6
>>> +#define IMAGE_FILE_MACHINE_SH5       0x01a8
>>> +#define IMAGE_FILE_MACHINE_THUMB     0x01c2
>>> +#define IMAGE_FILE_MACHINE_WCEMIPSV2 0x0169
>>> +
>>> +/* flags */
>>> +#define IMAGE_FILE_RELOCS_STRIPPED         0x0001
>>> +#define IMAGE_FILE_EXECUTABLE_IMAGE        0x0002
>>> +#define IMAGE_FILE_LINE_NUMS_STRIPPED      0x0004
>>> +#define IMAGE_FILE_LOCAL_SYMS_STRIPPED     0x0008
>>> +#define IMAGE_FILE_AGGRESSIVE_WS_TRIM      0x0010
>>> +#define IMAGE_FILE_LARGE_ADDRESS_AWARE     0x0020
>>> +#define IMAGE_FILE_16BIT_MACHINE           0x0040
>>> +#define IMAGE_FILE_BYTES_REVERSED_LO       0x0080
>>> +#define IMAGE_FILE_32BIT_MACHINE           0x0100
>>> +#define IMAGE_FILE_DEBUG_STRIPPED          0x0200
>>> +#define IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP 0x0400
>>> +#define IMAGE_FILE_NET_RUN_FROM_SWAP       0x0800
>>> +#define IMAGE_FILE_SYSTEM                  0x1000
>>> +#define IMAGE_FILE_DLL                     0x2000
>>> +#define IMAGE_FILE_UP_SYSTEM_ONLY          0x4000
>>> +#define IMAGE_FILE_BYTES_REVERSED_HI       0x8000
>>> +
>>> +#define IMAGE_FILE_OPT_ROM_MAGIC       0x107
>>> +#define IMAGE_FILE_OPT_PE32_MAGIC      0x10b
>>> +#define IMAGE_FILE_OPT_PE32_PLUS_MAGIC 0x20b
>>> +
>>> +#define IMAGE_SUBSYSTEM_UNKNOWN                 0
>>> +#define IMAGE_SUBSYSTEM_NATIVE                  1
>>> +#define IMAGE_SUBSYSTEM_WINDOWS_GUI             2
>>> +#define IMAGE_SUBSYSTEM_WINDOWS_CUI             3
>>> +#define IMAGE_SUBSYSTEM_POSIX_CUI               7
>>> +#define IMAGE_SUBSYSTEM_WINDOWS_CE_GUI          9
>>> +#define IMAGE_SUBSYSTEM_EFI_APPLICATION         10
>>> +#define IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER 11
>>> +#define IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER      12
>>> +#define IMAGE_SUBSYSTEM_EFI_ROM_IMAGE           13
>>> +#define IMAGE_SUBSYSTEM_XBOX                    14
>>> +
>>> +#define IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE         0x0040
>>> +#define IMAGE_DLL_CHARACTERISTICS_FORCE_INTEGRITY      0x0080
>>> +#define IMAGE_DLL_CHARACTERISTICS_NX_COMPAT            0x0100
>>> +#define IMAGE_DLLCHARACTERISTICS_NO_ISOLATION          0x0200
>>> +#define IMAGE_DLLCHARACTERISTICS_NO_SEH                0x0400
>>> +#define IMAGE_DLLCHARACTERISTICS_NO_BIND               0x0800
>>> +#define IMAGE_DLLCHARACTERISTICS_WDM_DRIVER            0x2000
>>> +#define IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE 0x8000
>>> +
>>> +/* they actually defined 0x00000000 as well, but I think we'll skip that one. */
>>> +#define IMAGE_SCN_RESERVED_0             0x00000001
>>> +#define IMAGE_SCN_RESERVED_1             0x00000002
>>> +#define IMAGE_SCN_RESERVED_2             0x00000004
>>> +#define IMAGE_SCN_TYPE_NO_PAD            0x00000008 /* don't pad - obsolete */
>>> +#define IMAGE_SCN_RESERVED_3             0x00000010
>>> +#define IMAGE_SCN_CNT_CODE               0x00000020 /* .text */
>>> +#define IMAGE_SCN_CNT_INITIALIZED_DATA   0x00000040 /* .data */
>>> +#define IMAGE_SCN_CNT_UNINITIALIZED_DATA 0x00000080 /* .bss */
>>> +#define IMAGE_SCN_LNK_OTHER              0x00000100 /* reserved */
>>> +#define IMAGE_SCN_LNK_INFO               0x00000200 /* .drectve comments */
>>> +#define IMAGE_SCN_RESERVED_4             0x00000400
>>> +#define IMAGE_SCN_LNK_REMOVE             0x00000800 /* .o only - scn to be rm'd*/
>>> +#define IMAGE_SCN_LNK_COMDAT             0x00001000 /* .o only - COMDAT data */
>>> +#define IMAGE_SCN_RESERVED_5             0x00002000 /* spec omits this */
>>> +#define IMAGE_SCN_RESERVED_6             0x00004000 /* spec omits this */
>>> +#define IMAGE_SCN_GPREL                  0x00008000 /* global pointer referenced data */
>>> +/* spec lists 0x20000 twice, I suspect they meant 0x10000 for one of them */
>>> +#define IMAGE_SCN_MEM_PURGEABLE 0x00010000 /* reserved for "future" use */
>>> +#define IMAGE_SCN_16BIT         0x00020000 /* reserved for "future" use */
>>> +#define IMAGE_SCN_LOCKED        0x00040000 /* reserved for "future" use */
>>> +#define IMAGE_SCN_PRELOAD       0x00080000 /* reserved for "future" use */
>>> +/* and here they just stuck a 1-byte integer in the middle of a bitfield */
>>> +#define IMAGE_SCN_ALIGN_1BYTES    0x00100000 /* it does what it says on the box */
>>> +#define IMAGE_SCN_ALIGN_2BYTES    0x00200000
>>> +#define IMAGE_SCN_ALIGN_4BYTES    0x00300000
>>> +#define IMAGE_SCN_ALIGN_8BYTES    0x00400000
>>> +#define IMAGE_SCN_ALIGN_16BYTES   0x00500000
>>> +#define IMAGE_SCN_ALIGN_32BYTES   0x00600000
>>> +#define IMAGE_SCN_ALIGN_64BYTES   0x00700000
>>> +#define IMAGE_SCN_ALIGN_128BYTES  0x00800000
>>> +#define IMAGE_SCN_ALIGN_256BYTES  0x00900000
>>> +#define IMAGE_SCN_ALIGN_512BYTES  0x00a00000
>>> +#define IMAGE_SCN_ALIGN_1024BYTES 0x00b00000
>>> +#define IMAGE_SCN_ALIGN_2048BYTES 0x00c00000
>>> +#define IMAGE_SCN_ALIGN_4096BYTES 0x00d00000
>>> +#define IMAGE_SCN_ALIGN_8192BYTES 0x00e00000
>>> +#define IMAGE_SCN_LNK_NRELOC_OVFL 0x01000000 /* extended relocations */
>>> +#define IMAGE_SCN_MEM_DISCARDABLE 0x02000000 /* scn can be discarded */
>>> +#define IMAGE_SCN_MEM_NOT_CACHED  0x04000000 /* cannot be cached */
>>> +#define IMAGE_SCN_MEM_NOT_PAGED   0x08000000 /* not pageable */
>>> +#define IMAGE_SCN_MEM_SHARED      0x10000000 /* can be shared */
>>> +#define IMAGE_SCN_MEM_EXECUTE     0x20000000 /* can be executed as code */
>>> +#define IMAGE_SCN_MEM_READ        0x40000000 /* readable */
>>> +#define IMAGE_SCN_MEM_WRITE       0x80000000 /* writeable */
>>> +
>>> +#define IMAGE_DEBUG_TYPE_CODEVIEW 2
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +struct mz_hdr {
>>> +    uint16_t magic;              /* MZ_MAGIC */
>>> +    uint16_t lbsize;             /* size of last used block */
>>> +    uint16_t blocks;             /* pages in file, 0x3 */
>>> +    uint16_t relocs;             /* relocations */
>>> +    uint16_t hdrsize;            /* header size in "paragraphs" */
>>> +    uint16_t min_extra_pps;      /* .bss */
>>> +    uint16_t max_extra_pps;      /* runtime limit for the arena size */
>>> +    uint16_t ss;                 /* relative stack segment */
>>> +    uint16_t sp;                 /* initial %sp register */
>>> +    uint16_t checksum;           /* word checksum */
>>> +    uint16_t ip;                 /* initial %ip register */
>>> +    uint16_t cs;                 /* initial %cs relative to load segment */
>>> +    uint16_t reloc_table_offset; /* offset of the first relocation */
>>> +    uint16_t overlay_num;        /* overlay number.  set to 0. */
>>> +    uint16_t reserved0[4];       /* reserved */
>>> +    uint16_t oem_id;             /* oem identifier */
>>> +    uint16_t oem_info;           /* oem specific */
>>> +    uint16_t reserved1[10];      /* reserved */
>>> +    uint32_t peaddr;             /* address of pe header */
>>> +    char     message[];          /* message to print */
>>> +};
>>
>> We already have an instance of this struct in common/efi/pe.c. I think
>> it wouldn't be very desirable to have two (different) instances.
>>
>>> +struct mz_reloc {
>>> +    uint16_t offset;
>>> +    uint16_t segment;
>>> +};
>>
>> We aren't going to need this anywhere, are we?
>>
>>> +struct pe_hdr {
>>> +    uint32_t magic;        /* PE magic */
>>> +    uint16_t machine;      /* machine type */
>>> +    uint16_t sections;     /* number of sections */
>>> +    uint32_t timestamp;    /* time_t */
>>> +    uint32_t symbol_table; /* symbol table offset */
>>> +    uint32_t symbols;      /* number of symbols */
>>> +    uint16_t opt_hdr_size; /* size of optional header */
>>> +    uint16_t flags;        /* flags */
>>> +};
>>
>> And again another (different) instance of this and further struct-s
>> already exists. Same for the section header further down.
>>
>>> +/* the fact that pe32 isn't padded where pe32+ is 64-bit means union won't
>>> + * work right.  vomit. */
>>
>> Noticing here in particular, but being an issue elsewhere as well:
>> Unless this file is to be a verbatim copy taken from somewhere (in
>> which case it should probably be introduced in a separate commit
>> with an Origin: tag), comments want to adhere of ./CODING_STYLE.
>>
>>> +struct pe32_opt_hdr {
>>> +    /* "standard" header */
>>> +    uint16_t magic;       /* file type */
>>> +    uint8_t  ld_major;    /* linker major version */
>>> +    uint8_t  ld_minor;    /* linker minor version */
>>> +    uint32_t text_size;   /* size of text section(s) */
>>> +    uint32_t data_size;   /* size of data section(s) */
>>> +    uint32_t bss_size;    /* size of bss section(s) */
>>> +    uint32_t entry_point; /* file offset of entry point */
>>> +    uint32_t code_base;   /* relative code addr in ram */
>>> +    uint32_t data_base;   /* relative data addr in ram */
>>> +    /* "windows" header */
>>> +    uint32_t image_base;     /* preferred load address */
>>> +    uint32_t section_align;  /* alignment in bytes */
>>> +    uint32_t file_align;     /* file alignment in bytes */
>>> +    uint16_t os_major;       /* major OS version */
>>> +    uint16_t os_minor;       /* minor OS version */
>>> +    uint16_t image_major;    /* major image version */
>>> +    uint16_t image_minor;    /* minor image version */
>>> +    uint16_t subsys_major;   /* major subsystem version */
>>> +    uint16_t subsys_minor;   /* minor subsystem version */
>>> +    uint32_t win32_version;  /* reserved, must be 0 */
>>> +    uint32_t image_size;     /* image size */
>>> +    uint32_t header_size;    /* header size rounded up to file_align */
>>> +    uint32_t csum;           /* checksum */
>>> +    uint16_t subsys;         /* subsystem */
>>> +    uint16_t dll_flags;      /* executable characteristics */
>>> +    uint32_t stack_size_req; /* amt of stack requested */
>>> +    uint32_t stack_size;     /* amt of stack required */
>>> +    uint32_t heap_size_req;  /* amt of heap requested */
>>> +    uint32_t heap_size;      /* amt of heap required */
>>> +    uint32_t loader_flags;   /* reserved, must be 0 */
>>> +    uint32_t data_dirs;      /* number of data dir entries */
>>> +};
>>> +
>>> +struct pe32plus_opt_hdr {
>>> +    uint16_t magic;       /* file type */
>>> +    uint8_t  ld_major;    /* linker major version */
>>> +    uint8_t  ld_minor;    /* linker minor version */
>>> +    uint32_t text_size;   /* size of text section(s) */
>>> +    uint32_t data_size;   /* size of data section(s) */
>>> +    uint32_t bss_size;    /* size of bss section(s) */
>>> +    uint32_t entry_point; /* file offset of entry point */
>>> +    uint32_t code_base;   /* relative code addr in ram */
>>> +    /* "windows" header */
>>> +    uint64_t image_base;     /* preferred load address */
>>> +    uint32_t section_align;  /* alignment in bytes */
>>> +    uint32_t file_align;     /* file alignment in bytes */
>>> +    uint16_t os_major;       /* major OS version */
>>> +    uint16_t os_minor;       /* minor OS version */
>>> +    uint16_t image_major;    /* major image version */
>>> +    uint16_t image_minor;    /* minor image version */
>>> +    uint16_t subsys_major;   /* major subsystem version */
>>> +    uint16_t subsys_minor;   /* minor subsystem version */
>>> +    uint32_t win32_version;  /* reserved, must be 0 */
>>> +    uint32_t image_size;     /* image size */
>>> +    uint32_t header_size;    /* header size rounded up to file_align */
>>> +    uint32_t csum;           /* checksum */
>>> +    uint16_t subsys;         /* subsystem */
>>> +    uint16_t dll_flags;      /* executable characteristics */
>>> +    uint64_t stack_size_req; /* amt of stack requested */
>>> +    uint64_t stack_size;     /* amt of stack required */
>>> +    uint64_t heap_size_req;  /* amt of heap requested */
>>> +    uint64_t heap_size;      /* amt of heap required */
>>> +    uint32_t loader_flags;   /* reserved, must be 0 */
>>> +    uint32_t data_dirs;      /* number of data dir entries */
>>> +};
>>> +
>>> +struct data_dirent {
>>> +    uint32_t virtual_address; /* relative to load address */
>>> +    uint32_t size;
>>> +};
>>
>> Will we need this and ...
>>
>>> +struct data_directory {
>>> +    struct data_dirent exports;          /* .edata */
>>> +    struct data_dirent imports;          /* .idata */
>>> +    struct data_dirent resources;        /* .rsrc */
>>> +    struct data_dirent exceptions;       /* .pdata */
>>> +    struct data_dirent certs;            /* certs */
>>> +    struct data_dirent base_relocations; /* .reloc */
>>> +    struct data_dirent debug;            /* .debug */
>>> +    struct data_dirent arch;             /* reservered */
>>> +    struct data_dirent global_ptr;       /* global pointer reg. Size=0 */
>>> +    struct data_dirent tls;              /* .tls */
>>> +    struct data_dirent load_config;      /* load configuration structure */
>>> +    struct data_dirent bound_imports;    /* no idea */
>>> +    struct data_dirent import_addrs;     /* import address table */
>>> +    struct data_dirent delay_imports;    /* delay-load import table */
>>> +    struct data_dirent clr_runtime_hdr;  /* .cor (object only) */
>>> +    struct data_dirent reserved;
>>> +};
>>
>> ... this?
>>
>>> +struct section_header {
>>> +    char     name[8];         /* name or string tbl offset */
>>> +    uint32_t virtual_size;    /* size of loaded section in ram */
>>> +    uint32_t virtual_address; /* relative virtual address */
>>> +    uint32_t raw_data_size;   /* size of the section */
>>> +    uint32_t data_addr;       /* file pointer to first page of sec */
>>> +    uint32_t relocs;          /* file pointer to relocation entries */
>>> +    uint32_t line_numbers;    /* line numbers */
>>> +    uint16_t num_relocs;      /* number of relocations */
>>> +    uint16_t num_lin_numbers; /* COFF line count. */
>>> +    uint32_t flags;
>>> +};
>>> +
>>> +enum x64_coff_reloc_type {
>>> +    IMAGE_REL_AMD64_ABSOLUTE = 0,
>>> +    IMAGE_REL_AMD64_ADDR64,
>>> +    IMAGE_REL_AMD64_ADDR32,
>>> +    IMAGE_REL_AMD64_ADDR32N,
>>> +    IMAGE_REL_AMD64_REL32,
>>> +    IMAGE_REL_AMD64_REL32_1,
>>> +    IMAGE_REL_AMD64_REL32_2,
>>> +    IMAGE_REL_AMD64_REL32_3,
>>> +    IMAGE_REL_AMD64_REL32_4,
>>> +    IMAGE_REL_AMD64_REL32_5,
>>> +    IMAGE_REL_AMD64_SECTION,
>>> +    IMAGE_REL_AMD64_SECREL,
>>> +    IMAGE_REL_AMD64_SECREL7,
>>> +    IMAGE_REL_AMD64_TOKEN,
>>> +    IMAGE_REL_AMD64_SREL32,
>>> +    IMAGE_REL_AMD64_PAIR,
>>> +    IMAGE_REL_AMD64_SSPAN32,
>>> +};
>>> +
>>> +enum arm_coff_reloc_type {
>>> +    IMAGE_REL_ARM_ABSOLUTE,
>>> +    IMAGE_REL_ARM_ADDR32,
>>> +    IMAGE_REL_ARM_ADDR32N,
>>> +    IMAGE_REL_ARM_BRANCH2,
>>> +    IMAGE_REL_ARM_BRANCH1,
>>> +    IMAGE_REL_ARM_SECTION,
>>> +    IMAGE_REL_ARM_SECREL,
>>> +};
>>> +
>>> +enum sh_coff_reloc_type {
>>> +    IMAGE_REL_SH3_ABSOLUTE,
>>> +    IMAGE_REL_SH3_DIRECT16,
>>> +    IMAGE_REL_SH3_DIRECT32,
>>> +    IMAGE_REL_SH3_DIRECT8,
>>> +    IMAGE_REL_SH3_DIRECT8_WORD,
>>> +    IMAGE_REL_SH3_DIRECT8_LONG,
>>> +    IMAGE_REL_SH3_DIRECT4,
>>> +    IMAGE_REL_SH3_DIRECT4_WORD,
>>> +    IMAGE_REL_SH3_DIRECT4_LONG,
>>> +    IMAGE_REL_SH3_PCREL8_WORD,
>>> +    IMAGE_REL_SH3_PCREL8_LONG,
>>> +    IMAGE_REL_SH3_PCREL12_WORD,
>>> +    IMAGE_REL_SH3_STARTOF_SECTION,
>>> +    IMAGE_REL_SH3_SIZEOF_SECTION,
>>> +    IMAGE_REL_SH3_SECTION,
>>> +    IMAGE_REL_SH3_SECREL,
>>> +    IMAGE_REL_SH3_DIRECT32_NB,
>>> +    IMAGE_REL_SH3_GPREL4_LONG,
>>> +    IMAGE_REL_SH3_TOKEN,
>>> +    IMAGE_REL_SHM_PCRELPT,
>>> +    IMAGE_REL_SHM_REFLO,
>>> +    IMAGE_REL_SHM_REFHALF,
>>> +    IMAGE_REL_SHM_RELLO,
>>> +    IMAGE_REL_SHM_RELHALF,
>>> +    IMAGE_REL_SHM_PAIR,
>>> +    IMAGE_REL_SHM_NOMODE,
>>> +};
>>> +
>>> +enum ppc_coff_reloc_type {
>>> +    IMAGE_REL_PPC_ABSOLUTE,
>>> +    IMAGE_REL_PPC_ADDR64,
>>> +    IMAGE_REL_PPC_ADDR32,
>>> +    IMAGE_REL_PPC_ADDR24,
>>> +    IMAGE_REL_PPC_ADDR16,
>>> +    IMAGE_REL_PPC_ADDR14,
>>> +    IMAGE_REL_PPC_REL24,
>>> +    IMAGE_REL_PPC_REL14,
>>> +    IMAGE_REL_PPC_ADDR32N,
>>> +    IMAGE_REL_PPC_SECREL,
>>> +    IMAGE_REL_PPC_SECTION,
>>> +    IMAGE_REL_PPC_SECREL16,
>>> +    IMAGE_REL_PPC_REFHI,
>>> +    IMAGE_REL_PPC_REFLO,
>>> +    IMAGE_REL_PPC_PAIR,
>>> +    IMAGE_REL_PPC_SECRELLO,
>>> +    IMAGE_REL_PPC_GPREL,
>>> +    IMAGE_REL_PPC_TOKEN,
>>> +};
>>> +
>>> +enum x86_coff_reloc_type {
>>> +    IMAGE_REL_I386_ABSOLUTE,
>>> +    IMAGE_REL_I386_DIR16,
>>> +    IMAGE_REL_I386_REL16,
>>> +    IMAGE_REL_I386_DIR32,
>>> +    IMAGE_REL_I386_DIR32NB,
>>> +    IMAGE_REL_I386_SEG12,
>>> +    IMAGE_REL_I386_SECTION,
>>> +    IMAGE_REL_I386_SECREL,
>>> +    IMAGE_REL_I386_TOKEN,
>>> +    IMAGE_REL_I386_SECREL7,
>>> +    IMAGE_REL_I386_REL32,
>>> +};
>>> +
>>> +enum ia64_coff_reloc_type {
>>> +    IMAGE_REL_IA64_ABSOLUTE,
>>> +    IMAGE_REL_IA64_IMM14,
>>> +    IMAGE_REL_IA64_IMM22,
>>> +    IMAGE_REL_IA64_IMM64,
>>> +    IMAGE_REL_IA64_DIR32,
>>> +    IMAGE_REL_IA64_DIR64,
>>> +    IMAGE_REL_IA64_PCREL21B,
>>> +    IMAGE_REL_IA64_PCREL21M,
>>> +    IMAGE_REL_IA64_PCREL21F,
>>> +    IMAGE_REL_IA64_GPREL22,
>>> +    IMAGE_REL_IA64_LTOFF22,
>>> +    IMAGE_REL_IA64_SECTION,
>>> +    IMAGE_REL_IA64_SECREL22,
>>> +    IMAGE_REL_IA64_SECREL64I,
>>> +    IMAGE_REL_IA64_SECREL32,
>>> +    IMAGE_REL_IA64_DIR32NB,
>>> +    IMAGE_REL_IA64_SREL14,
>>> +    IMAGE_REL_IA64_SREL22,
>>> +    IMAGE_REL_IA64_SREL32,
>>> +    IMAGE_REL_IA64_UREL32,
>>> +    IMAGE_REL_IA64_PCREL60X,
>>> +    IMAGE_REL_IA64_PCREL60B,
>>> +    IMAGE_REL_IA64_PCREL60F,
>>> +    IMAGE_REL_IA64_PCREL60I,
>>> +    IMAGE_REL_IA64_PCREL60M,
>>> +    IMAGE_REL_IA64_IMMGPREL6,
>>> +    IMAGE_REL_IA64_TOKEN,
>>> +    IMAGE_REL_IA64_GPREL32,
>>> +    IMAGE_REL_IA64_ADDEND,
>>> +};
>>
>> All sorts of relocation types, but none for RISC-V? Are we going to need
>> any of this?
>>
>>> +struct coff_reloc {
>>> +    uint32_t virtual_address;
>>> +    uint32_t symbol_table_index;
>>> +
>>> +    union {
>>> +        enum x64_coff_reloc_type  x64_type;
>>> +        enum arm_coff_reloc_type  arm_type;
>>> +        enum sh_coff_reloc_type   sh_type;
>>> +        enum ppc_coff_reloc_type  ppc_type;
>>> +        enum x86_coff_reloc_type  x86_type;
>>> +        enum ia64_coff_reloc_type ia64_type;
>>> +        uint16_t                  data;
>>> +    };
>>> +};
>>> +
>>> +/*
>>> + * Definitions for the contents of the certs data block
>>> + */
>>> +#define WIN_CERT_TYPE_PKCS_SIGNED_DATA 0x0002
>>> +#define WIN_CERT_TYPE_EFI_OKCS115      0x0EF0
>>> +#define WIN_CERT_TYPE_EFI_GUID         0x0EF1
>>> +
>>> +#define WIN_CERT_REVISION_1_0 0x0100
>>> +#define WIN_CERT_REVISION_2_0 0x0200
>>> +
>>> +struct win_certificate {
>>> +    uint32_t length;
>>> +    uint16_t revision;
>>> +    uint16_t cert_type;
>>> +};
>>
>> Or any of this?
>>
> Regarding pe.h file content, we wanted to keep it as generic as
> possible (structures definition according to PE format which can be
> used for multiple architectures). Specifically for RISC-V as you
> noticed, we are not using lots of structures (data directories,
> relocation structures, certificates, etc.). Therefore, we can reduce
> it to only those used atm, but in that case we won't have a generic PE
> header definition anymore. Regarding structures which are already
> defined in common/efi/pe.c, meaning that with our change we have two
> versions of same structures, we can remove those, but in that case it
> could be confusing for someone who is trying to map fields from pe.h
> to actual image header in assembly code. Summary I would keep this
> header with its original content, but if you think that it contains
> too much overhead we can reduce it to relevant structures only.

Actually I not only don't mind this header, but would consider it
superior to the present state of things. Just that then imo it would
want introducing in a separate commit, with suitable description /
justification. That could (should) then be followed by a patch using
this header's struct-s / definitions in pre-existing code, purging
any duplication from there.

Jan

