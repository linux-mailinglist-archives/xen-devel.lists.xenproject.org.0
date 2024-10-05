Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4E9916FD
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 15:21:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810922.1223604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx4ie-0007Gm-Lc; Sat, 05 Oct 2024 13:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810922.1223604; Sat, 05 Oct 2024 13:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx4ie-0007FN-Hk; Sat, 05 Oct 2024 13:21:12 +0000
Received: by outflank-mailman (input) for mailman id 810922;
 Sat, 05 Oct 2024 13:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AzXh=RB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sx4id-0007FH-7g
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 13:21:11 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae9d8375-831c-11ef-99a2-01e77a169b0f;
 Sat, 05 Oct 2024 15:21:08 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c718bb04a3so3881266a12.3
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2024 06:21:08 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99415b7c1fsm45724566b.151.2024.10.05.06.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Oct 2024 06:21:07 -0700 (PDT)
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
X-Inumbo-ID: ae9d8375-831c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728134468; x=1728739268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HiIIHAdB1XedhyZ1e8F4e+xWW7ESmRfp6pujg6xSSgM=;
        b=aKKP/a4id7EaUTy+j+3mcsYXWzzsm+nUMc4aMNer1mRmCLyJya+0scgc8To74asDQ6
         nvRbf9DEHANMuHBcLWEpWJ1LU59M2YBB08pSBQPYnreMHYLud8JS3FkkMgsx2i32ZDK/
         1YF5rgFuSGKfSmYeanxn1G16QV75u+94RSp/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728134468; x=1728739268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiIIHAdB1XedhyZ1e8F4e+xWW7ESmRfp6pujg6xSSgM=;
        b=XyPlKJ+UQRr0d5GX2xfK3zlxk0X0ydSq9jUbfkLdFWL4vsm9OMytPnTgyAXy5iWk11
         RtGktMLtpucSmhzKjiwfGnM/gkzbq1EajGug6+y8N5ySIf8MsyH2g0OtNkXwaNNoUu1g
         GtqPe3z2QbCXBO1G93kefUnEpn5jiPFaz5UX+sw/iALRnd/+FGnqF2iF4rheytx8zcKm
         hN6pidAWkNnMhBKEQ9RC0VblDfxcI6GhKxJXXyF5iYw5qF3B4fXZ0RIz8qfYSOsizXMq
         eNAyVVOcMtkAgxrSFNqTNCAoWERcZQJ+taaO6fK/GJF8p5qIbqCWff9MW/ALS3YMWm0x
         +vQA==
X-Forwarded-Encrypted: i=1; AJvYcCXvKdKI232Ex961g4Mdf0ZX1FU9gK0wQfz1xqncr4HXMDGNFg2J6egiyaoCG+j8DIGHqwG43YZZ8Y0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoYhvkur9MBTltJfZ8U8wi8bMkVAcbveGG5Hb6wht9Osf6L+R+
	CR+FSiCCvKe1GJqzfukJkOhkB/hXzgE3nVMyen8v91pfVSmaJovL9HMgEZxcunU=
X-Google-Smtp-Source: AGHT+IH66oh26ORV8Sh+meM2rMo3VP16aPsqDXODffmpPaNDqmziXPQY7a86/Y1S+s25VnfAj47CTA==
X-Received: by 2002:a17:907:2d90:b0:a93:c2ae:ec5 with SMTP id a640c23a62f3a-a991bd71c64mr609720566b.31.1728134467773;
        Sat, 05 Oct 2024 06:21:07 -0700 (PDT)
Message-ID: <e7e5200e-4577-4f67-bb3e-6f71086fc663@citrix.com>
Date: Sat, 5 Oct 2024 14:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Reuse code to relocate trampoline
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-3-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241005080233.1248850-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/10/2024 9:02 am, Frediano Ziglio wrote:
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/Makefile           |  6 +++---
>  xen/arch/x86/boot/build32.lds.S      |  5 +++++
>  xen/arch/x86/boot/head.S             | 23 +--------------------
>  xen/arch/x86/boot/reloc-trampoline.c | 30 ++++++++++++++++++++++++++++
>  xen/arch/x86/efi/efi-boot.h          | 15 ++------------
>  5 files changed, 41 insertions(+), 38 deletions(-)
>  create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
>
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index da87179fef..c16c4a8595 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,6 +1,6 @@
> -obj-bin-y += head.o cbundle.o
> +obj-bin-y += head.o cbundle.o reloc-trampoline.x64.o

Ah.  I think the $(obj)/%.x64.o rule you had in the previous patch wants
introducing here.

That said, x64 is the one name for 64bit that we reliably don't use. 
Also...

> -head-bin-objs := cmdline.o reloc.o
> +head-bin-objs := cmdline.o reloc.o reloc-trampoline.o

... head-bin-objs isn't really correct now seeing as they're not
binaries in head.S.  Also ...

>  nocov-y   += $(head-bin-objs)
>  noubsan-y += $(head-bin-objs)

The no$(foo)'s needs extending to the 64bit objects too.  They're also
used early enough to explode.

In Xen, 64bit objects are the norm, and it's 32bit ones which are the
exception, so how about we special case *.i386.o instead.  Then

obj32 := cmdline.i386.o
obj32 += reloc.i386.o
obj32 += reloc-trampoline.i386.o

and apply no$(foo) over everything.

> @@ -43,7 +43,7 @@ $(obj)/cbundle.o: $(head-bin-objs) $(obj)/build32.other.lds $(obj)/build32.final
>  	$(PYTHON) $(srctree)/tools/combine_two_binaries \
>  		--script $(obj)/build32.final.lds \
>  		--bin1 $@.1.bin --bin2 $@.2.bin \
> -		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc \
> +		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc,reloc_trampoline32 \
>  		--section-header '.section .init.text, "ax", @progbits' \
>  		--output $(obj)/cbundle.s
>  	$(CC) -c $(obj)/cbundle.s -o $@.tmp
> diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
> index fe422e3d25..2d10a75fb1 100644
> --- a/xen/arch/x86/boot/build32.lds.S
> +++ b/xen/arch/x86/boot/build32.lds.S
> @@ -43,6 +43,11 @@ SECTIONS
>           * Potentially they should be all variables. */
>          DECLARE_IMPORT(__base_relocs_start);
>          DECLARE_IMPORT(__base_relocs_end);
> +        DECLARE_IMPORT(__trampoline_rel_start);
> +        DECLARE_IMPORT(__trampoline_rel_stop);
> +        DECLARE_IMPORT(__trampoline_seg_start);
> +        DECLARE_IMPORT(__trampoline_seg_stop);
> +        DECLARE_IMPORT(trampoline_phys);
>          . = . + GAP;
>          *(.text)
>          *(.text.*)
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index e0776e3896..ade2c5c43d 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -706,28 +706,7 @@ trampoline_setup:
>          mov     %edx, sym_offs(l1_bootmap)(%esi, %ecx, 8)
>  
>          /* Apply relocations to bootstrap trampoline. */
> -        mov     sym_esi(trampoline_phys), %edx
> -        lea     sym_esi(__trampoline_rel_start), %edi
> -        lea     sym_esi(__trampoline_rel_stop), %ecx
> -1:
> -        mov     (%edi), %eax
> -        add     %edx, (%edi, %eax)
> -        add     $4,%edi
> -
> -        cmp     %ecx, %edi
> -        jb      1b
> -
> -        /* Patch in the trampoline segment. */
> -        shr     $4,%edx
> -        lea     sym_esi(__trampoline_seg_start), %edi
> -        lea     sym_esi(__trampoline_seg_stop), %ecx
> -1:
> -        mov     (%edi), %eax
> -        mov     %dx, (%edi, %eax)
> -        add     $4,%edi
> -
> -        cmp     %ecx, %edi
> -        jb      1b
> +        call    reloc_trampoline32
>  
>          /* Do not parse command line on EFI platform here. */
>          cmpb    $0, sym_esi(efi_platform)
> diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/reloc-trampoline.c
> new file mode 100644
> index 0000000000..9509dfa28a
> --- /dev/null
> +++ b/xen/arch/x86/boot/reloc-trampoline.c
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/compiler.h>
> +#include <xen/stdint.h>
> +#include <asm/trampoline.h>
> +
> +extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
> +extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
> +
> +#if defined(__i386__)
> +void reloc_trampoline32(void)
> +#elif defined (__x86_64__)
> +void reloc_trampoline64(void)
> +#else
> +#error Unknow architecture
> +#endif
> +{
> +    unsigned long phys = trampoline_phys;
> +    const int32_t *trampoline_ptr;
> +
> +    /* Apply relocations to trampoline. */

Please take the opportunity to expand on this.

/*
 * Apply relocations to trampoline.
 *
 * This modifies the trampoline in place within Xen, so that it will
 * operate correctly when copied into place.
 */

This property is entirely non-obvious, and what is is hurting us trying
to make R^X work.

But - it also makes it clean how to fix the problem (later, after you've
unified the relocation paths with this patch).

> +    for ( trampoline_ptr = __trampoline_rel_start;
> +          trampoline_ptr < __trampoline_rel_stop;
> +          ++trampoline_ptr )
> +        *(uint32_t *)(*trampoline_ptr + (long)trampoline_ptr) += phys;

Newline here please.

> +    for ( trampoline_ptr = __trampoline_seg_start;
> +          trampoline_ptr < __trampoline_seg_stop;
> +          ++trampoline_ptr )
> +        *(uint16_t *)(*trampoline_ptr + (long)trampoline_ptr) = phys >> 4;
> +}

I was looking at the code generation.  32bit looks fine, but 64bit is
outragous.

It turns out I have ubsan enabled in this build, and the code generation
is much better with nocov-y extended to cover reloc-trampoline.x64.o

~Andrew

