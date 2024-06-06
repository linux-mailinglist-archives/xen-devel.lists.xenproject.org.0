Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FAB8FDF26
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 08:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735916.1142036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF6zb-0000DT-8Z; Thu, 06 Jun 2024 06:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735916.1142036; Thu, 06 Jun 2024 06:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF6zb-0000BM-4n; Thu, 06 Jun 2024 06:52:59 +0000
Received: by outflank-mailman (input) for mailman id 735916;
 Thu, 06 Jun 2024 06:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sF6zZ-0000BG-Qj
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 06:52:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6772c8b1-23d1-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 08:52:56 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-35dc36b107fso640762f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2024 23:52:56 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e98b0fsm716632f8f.72.2024.06.05.23.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 23:52:55 -0700 (PDT)
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
X-Inumbo-ID: 6772c8b1-23d1-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717656776; x=1718261576; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+MVxC/nZqC5UrbUucVWosnkii0meRc5NzeEzYI0F+Bs=;
        b=bO0ul5fNGLIQS9OlX6mAlnRz+mKvhkMs+SZUBpMP4kM0m3Ts/dAM8yUYg+ioFWgDhW
         smlEdGAE663Ck5CgOKqgSU2wacm4o5BbLrAvFZ0rzzP8io8g4Y6Ugqd/u6l531pehWdz
         fQqOqRs1x6ULCYKbO/Eq0dID2U2BcuVXlxVLLydaYBpDc98ixN/sJZzKFqQ81ac4dS+d
         yu8Ve3eg+Fonk6hT1Vih8BpZVF967dop+mNaWioKAYEfGbgo5+RVXpLhB6RSCpaNAyhe
         00pELBRHMmtKN2Zehl98OoGjHTGex8ec2yZgl6cRFpF4DunUBZeYMxqYiiaisdwNG7j+
         euPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717656776; x=1718261576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MVxC/nZqC5UrbUucVWosnkii0meRc5NzeEzYI0F+Bs=;
        b=hNMDidUn71M1TL07VOzfUFv05caL/+Bnxe2WQ5JoM9f6kou3A87Rv6i2BKCZCgCpRO
         t22x85xdwKAxN2a/BuO3LGP0tw/cnj1qVwItG/uhCcmHXfv16NuNODKNSp5gNo6AnUVA
         iLY6nq2zfFdh8BBuLqgTlYTjJl4zq93fLrvm4ns29peDS/Am+iTKxFREjNNhyhtOlgqR
         QoW2EkueuXKXsMNPtZvVcjktKn4iMs1mLwdwL+NlxBoitABpjTxZtD6JkQdKVfPxtsvz
         ByrNfuUVExVNgcapvyP+RD0A5rqNmwdR6zu3ULhDR8pRlZn3lqo4EIpEVio0dL5OS134
         E6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWzrwGsmBYPBziR51/BAvxjyZ/YOwLTxC0ktSw2ilNe5qdu8gYRAX92P3ZR9W4s7sJvcFB5yebAOZRiIEv3Lw8AO/v6JevRALH1zHkJYpM=
X-Gm-Message-State: AOJu0YwffQx/IUNEs1eDd+R2yWL17AE/qJSI3cueveGyIH2jCpjY+xFj
	PhUto+3zfsH2Am1aiSJg9Od3mjkb21OVAQRil8R/5o3Venfg9lRvBilVkwh2Dw==
X-Google-Smtp-Source: AGHT+IH/3T92HokCXPs3pX2e6M4X9PKLybkMVdIZSCucz/4AXa4FWyJho66RCZWTtaZSB/7dCoHxAA==
X-Received: by 2002:a05:6000:b82:b0:356:4cfa:b4b9 with SMTP id ffacd0b85a97d-35e84058666mr3683902f8f.2.1717656775681;
        Wed, 05 Jun 2024 23:52:55 -0700 (PDT)
Message-ID: <abe801a1-dba7-487b-91c6-3a97cb8523ca@suse.com>
Date: Thu, 6 Jun 2024 08:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: PE/COFF image header for RISC-V target
To: milandjokic1995@gmail.com
Cc: milan.djokic@rt-rk.com, Nikola Jelic <nikola.jelic@rt-rk.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <87b5e458498bbff2e54ac011a50ff1f9555c3613.1717354932.git.milan.djokic@rt-rk.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87b5e458498bbff2e54ac011a50ff1f9555c3613.1717354932.git.milan.djokic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2024 18:54, milandjokic1995@gmail.com wrote:
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -9,6 +9,15 @@ config ARCH_DEFCONFIG
>  	string
>  	default "arch/riscv/configs/tiny64_defconfig"
>  
> +config RISCV_EFI
> +	bool "UEFI boot service support"
> +	depends on RISCV_64
> +	default n
> +	help
> +	  This option provides support for boot services through
> +	  UEFI firmware. A UEFI stub is provided to allow Xen to
> +	  be booted as an EFI application.

Hmm, all of this promises quite a bit more than you actually add. If
there are future plans, please clarify in the description. Otherwise
please consider adjusting name, prompt, and help text to actually
cover just what's actually done.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/image.h

This is pretty generic a name for something pretty specific.

> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +
> +#ifndef _ASM_RISCV_IMAGE_H
> +#define _ASM_RISCV_IMAGE_H
> +
> +#define RISCV_IMAGE_MAGIC	"RISCV\0\0\0"
> +#define RISCV_IMAGE_MAGIC2	"RSC\x05"
> +
> +#define RISCV_IMAGE_FLAG_BE_SHIFT	0
> +#define RISCV_IMAGE_FLAG_BE_MASK	0x1
> +
> +#define RISCV_IMAGE_FLAG_LE		0
> +#define RISCV_IMAGE_FLAG_BE		1
> +
> +#ifdef CONFIG_CPU_BIG_ENDIAN

I don't think we have such a Kconfig control.

> +#error conversion of header fields to LE not yet implemented
> +#else
> +#define __HEAD_FLAG_BE		RISCV_IMAGE_FLAG_LE
> +#endif
> +
> +#define __HEAD_FLAG(field)	(__HEAD_FLAG_##field << \
> +				RISCV_IMAGE_FLAG_##field##_SHIFT)
> +
> +#define __HEAD_FLAGS		(__HEAD_FLAG(BE))
> +
> +#define RISCV_HEADER_VERSION_MAJOR 0
> +#define RISCV_HEADER_VERSION_MINOR 2
> +
> +#define RISCV_HEADER_VERSION (RISCV_HEADER_VERSION_MAJOR << 16 | \
> +			      RISCV_HEADER_VERSION_MINOR)

Nit: Indentation of this 2nd line wants to result in the two RISCV_
to be properly aligned.

> +#ifndef __ASSEMBLY__
> +/*
> + * struct riscv_image_header - riscv xen image header
> + *
> + * @code0:		Executable code
> + * @code1:		Executable code
> + * @text_offset:	Image load offset
> + * @image_size:		Effective Image size
> + * @reserved:		reserved
> + * @reserved:		reserved
> + * @reserved:		reserved
> + * @magic:		Magic number
> + * @reserved:		reserved
> + * @reserved:		reserved (will be used for PE COFF offset)
> + */
> +
> +struct riscv_image_header {
> +	u32 code0;
> +	u32 code1;
> +	u64 text_offset;
> +	u64 image_size;
> +	u64 res1;
> +	u64 res2;
> +	u64 res3;
> +	u64 magic;
> +	u32 res4;
> +	u32 res5;

No new uses of u32 / u64 anymore, please. We're in the process of fully
moving to uint<N>_t.

> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,14 +1,40 @@
>  #include <asm/asm.h>
>  #include <asm/riscv_encoding.h>
> +#include <asm/image.h>
>  
>          .section .text.header, "ax", %progbits
>  
>          /*
>           * OpenSBI pass to start():
>           *   a0 -> hart_id ( bootcpu_id )
> -         *   a1 -> dtb_base 
> +         *   a1 -> dtb_base
>           */
>  FUNC(start)
> +#ifdef CONFIG_RISCV_EFI
> +        j xen_start

Comparing with what Arm does, shouldn't this similarly resolve to
the MZ pattern in the binary? In which case likely it needs to be
an entirely different insn, if such an insn even exists on RISC-V?
Otherwise the lack of MZ would clearly need explaining in the
description.

> +        /* -----------  Header -------------- */
> +	.word 0

Nit: Please use consistent indentation - either always tabs or
always blanks (matching what existing code uses).

> +	.balign 8
> +#if __riscv_xlen == 64

Wouldn't this better be CONFIG_RISCV_64? We do have #if-s like
this, but in different contexts. Even there I wonder of the
mix - Cc-ing Oleksii to possible comment (you probably should
have Cc-ed him anyway).

> +	/* Image load offset(2MB) from start of RAM */
> +	.dword 0x200000
> +#else
> +	/* Image load offset(4MB) from start of RAM */
> +	.dword 0x400000
> +#endif
> +	/* Effective size of xen image */
> +	.dword _end - _start
> +	.dword __HEAD_FLAGS
> +	.word RISCV_HEADER_VERSION
> +	.word 0
> +	.dword 0
> +	.ascii RISCV_IMAGE_MAGIC
> +	.balign 4
> +	.ascii RISCV_IMAGE_MAGIC2

There's only one "magic" in the struct further up.

This also isn't quite enough for a PE/COFF image, see again Arm
code. If the other header parts aren't needed, that too would
want mentioning / explaining in the description.

> +FUNC(xen_start)
> +#endif
>          /* Mask all interrupts */
>          csrw    CSR_SIE, zero
>  
> @@ -60,6 +86,11 @@ FUNC(start)
>          mv      a1, s1
>  
>          tail    start_xen
> +
> +#ifdef CONFIG_RISCV_EFI
> +END(xen_start)
> +#endif
> +
>  END(start)

I'm not convinced it is a good idea to have two functions nested
within one another, ELF-annotation-wise.

Jan

