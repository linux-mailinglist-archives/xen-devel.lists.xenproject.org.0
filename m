Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94016674817
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 01:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481422.746290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIfOi-00047V-0P; Fri, 20 Jan 2023 00:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481422.746290; Fri, 20 Jan 2023 00:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIfOh-00044j-U1; Fri, 20 Jan 2023 00:36:47 +0000
Received: by outflank-mailman (input) for mailman id 481422;
 Fri, 20 Jan 2023 00:36:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eVq4=5R=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pIfOg-00044d-KK
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 00:36:46 +0000
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [2607:f8b0:4864:20::e35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 835818d8-985a-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 01:36:44 +0100 (CET)
Received: by mail-vs1-xe35.google.com with SMTP id i188so4075237vsi.8
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 16:36:44 -0800 (PST)
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
X-Inumbo-ID: 835818d8-985a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kLKdhTQ7zRzllwMqlN4r5Gt2lqy+3yExc6+oZpPskyI=;
        b=P2P6ImeKpVY5Lvw7IjzmIi86fCF9UGHzVq2Sj6aaGhi+cNkt0Sz7aCjjkAMlIy2aOe
         JzBumEzk1rHsO3WZ6VTKnowbWhixPPntRmaI3ExkCMRl2GDVjU7e6n7LzPtv/D+9VG1G
         8+ouEh7cZXT3uZkjDXxHMSXwNJgh08kWD1WRYPtELMLR+JhMJ8EnHfV8CVsGVm5AKNJU
         hu7BHrzLFtAhuZtMAnTmXI5cajuHyzUl+PzVta7OB3mhkA4rzXCaOfn6pFAskpVoaXSe
         YXV+0qDrTFwQPw5WD5yAnCbIUZgrm1ivInZv1a2qivA/Wh/mp33re8MG7Wzr0rsNqeCX
         FA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLKdhTQ7zRzllwMqlN4r5Gt2lqy+3yExc6+oZpPskyI=;
        b=VDzRYltIdFI08cjTtUbdArrYMplYtqVxKvCdEOVTrxVsGcQ+Jp41x5DRsPN+v/taa8
         q/jwOyMx76k/NRCQg/X/oX4Fvref06pATRzG2dVTZHrI2/f2oeD4uc9IOlraXdtr6PRe
         Gb0Zp0Knc/rmufeF3/BGxrskgFqk1SgKyRvew9mkrF0kmbHl8JUOKnHbLrf5Cbigugin
         2wpJJv84l0+Iq5o4sI9AqMFw1rPE984Z20MVJE4ddu4uqFpn+QhWDcJNdX6Kksu6XTuf
         sdj2wLy9s0YvyG/VdCNu2PUCieHQ0tUoI06Uks487ZNvg/ummHpu7A2OjDfkfevHCPzT
         7iUg==
X-Gm-Message-State: AFqh2kqFQ8AfgDhDn0EoQBlRCZln3Da8Il6UI7DGjuskEvbyzf23s0BV
	b0ZVqEPpGNZSrYWKOw8stMCDsSiUZbCyRAD1M1Y=
X-Google-Smtp-Source: AMrXdXtO3J/0TS4bVZwZ4mC1sBtN45OKl6tDwjh1XNMWEh4xzEfuJ/zwnu2lgWmncKaZE+rMJY8+x+erLW4VY7vqEL0=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr1702713vst.54.1674175003178; Thu, 19
 Jan 2023 16:36:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674131459.git.oleksii.kurochko@gmail.com> <851a3fa74defe5174335646e2a79096bd8d432f8.1674131459.git.oleksii.kurochko@gmail.com>
In-Reply-To: <851a3fa74defe5174335646e2a79096bd8d432f8.1674131459.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Jan 2023 10:36:17 +1000
Message-ID: <CAKmqyKN6Prtqg_TSvxtGT-Vd53wxDycWpMEsV+J5HLePskjevQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] xen/riscv: introduce asm/types.h header file
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 20, 2023 at 12:07 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V5:
>     - Remove size_t from asm/types after rebase on top of the patch
>           "include/types: move stddef.h-kind types to common header" [1].
>         - All other types were back as they are used in <xen/types.h> and
>       in xen/common.
> ---
> Changes in V4:
>     - Clean up types in <asm/types.h> and remain only necessary.
>       The following types was removed as they are defined in <xen/types.h>:
>       {__|}{u|s}{8|16|32|64}
> ---
> Changes in V3:
>     - Nothing changed
> ---
> Changes in V2:
>     - Remove unneeded now types from <asm/types.h>
> ---
>  xen/arch/riscv/include/asm/types.h | 70 ++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/types.h
>
> diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
> new file mode 100644
> index 0000000000..64976f118d
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/types.h
> @@ -0,0 +1,70 @@
> +#ifndef __RISCV_TYPES_H__
> +#define __RISCV_TYPES_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +typedef __signed__ char __s8;
> +typedef unsigned char __u8;
> +
> +typedef __signed__ short __s16;
> +typedef unsigned short __u16;
> +
> +typedef __signed__ int __s32;
> +typedef unsigned int __u32;
> +
> +#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> +#if defined(CONFIG_RISCV_32)
> +typedef __signed__ long long __s64;
> +typedef unsigned long long __u64;
> +#elif defined (CONFIG_RISCV_64)
> +typedef __signed__ long __s64;
> +typedef unsigned long __u64;
> +#endif
> +#endif
> +
> +typedef signed char s8;
> +typedef unsigned char u8;
> +
> +typedef signed short s16;
> +typedef unsigned short u16;
> +
> +typedef signed int s32;
> +typedef unsigned int u32;
> +
> +#if defined(CONFIG_RISCV_32)
> +
> +typedef signed long long s64;
> +typedef unsigned long long u64;
> +typedef u32 vaddr_t;
> +#define PRIvaddr PRIx32
> +typedef u64 paddr_t;
> +#define INVALID_PADDR (~0ULL)
> +#define PRIpaddr "016llx"
> +typedef u32 register_t;
> +#define PRIregister "x"
> +
> +#elif defined (CONFIG_RISCV_64)
> +
> +typedef signed long s64;
> +typedef unsigned long u64;
> +typedef u64 vaddr_t;
> +#define PRIvaddr PRIx64
> +typedef u64 paddr_t;
> +#define INVALID_PADDR (~0UL)
> +#define PRIpaddr "016lx"
> +typedef u64 register_t;
> +#define PRIregister "lx"
> +
> +#endif
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __RISCV_TYPES_H__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.39.0
>
>

