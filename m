Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D6C665B03
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 13:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475258.736867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZsB-0004gN-0d; Wed, 11 Jan 2023 12:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475258.736867; Wed, 11 Jan 2023 12:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZsA-0004e4-UG; Wed, 11 Jan 2023 12:06:26 +0000
Received: by outflank-mailman (input) for mailman id 475258;
 Wed, 11 Jan 2023 12:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ktLh=5I=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pFZs9-0004dy-0D
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 12:06:25 +0000
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ddb441d-91a8-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 13:06:24 +0100 (CET)
Received: by mail-vs1-xe2d.google.com with SMTP id n190so11571631vsc.11
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jan 2023 04:06:23 -0800 (PST)
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
X-Inumbo-ID: 5ddb441d-91a8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8jzO6WX6QmQF0cHfaz5VH2e/upxcA5uDmPtPD+mE8yM=;
        b=JrcRNYFE0uDC2Xu5K9OIsHIAZ14u1jygNIehEYnKypuMbMX7eOtVym54dbN95+iPkw
         cSUTQ71OzNX+sDMOJ2fN6FY2dMBawehNB/67DwZ9gqdEGki2V8BrvIomo97X+8ilBF+C
         pcluFd0Q6SuhvJl+MFXaT7YIoN4dSTKW5IwVhpTnfvdBqq8XwyjX1fKWHA45zt8Jhu3B
         zKIs0tx5TuAJzAwMpj9d1LVDavSXIgcxxJ4nivMJPYOK7D24Thl6Sumb/IOKa84YcXwy
         meTIVk02XxVomJSqLL4R04vOk8YQE37KdrNqrjgLF0nVYruCEv7ZYpVbqNgWv+owR5yr
         hfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jzO6WX6QmQF0cHfaz5VH2e/upxcA5uDmPtPD+mE8yM=;
        b=0SE1POvDeQxHKiNVDt9hNlKPa8WwWLjxZFv5wKpI1fm0TeZgfg9Rs5ELQe8U1D8w9L
         Iaqm0+Zcv9UzTbwu2qlcRNMR+l+ied0HUo5/9XUQKN8oNB8QcLJo4uIvwdvFUR/mkV/j
         37Tx4fXGpU3BpfgmpfID812OZS4GKZeocCxuIOIooSmiDPDWYvabLkSPYTNQQddeuQPq
         HNbJ/mFM2EmddXl/5bd6UnpNuX1oiOkrdTm+pnD3dYdgekGXrHfgt0GwQgGDAqIJ3U3K
         4PULFbixj1hbcQbYSjFZl6hGynB/VVbnzw1mzbSSCd0dFRzbDLgm0Z0NCc66SHoBKvpc
         n8OQ==
X-Gm-Message-State: AFqh2kp43x1uxAlhKqL611+NNJ3qo7Wl/ne0CtthCtGGCNDjDDS8WZPk
	s/pAI7QR9Yhz5W2ctZiQ2/UmOz01SK/2f6GeZsg=
X-Google-Smtp-Source: AMrXdXuW5oH7qCrf783SkWF+5Un00TFGbLY1x6jvHqrYZaHBs81C3ZwH8qykQGGpb/VF4zT3NPTLuYN3PX0w5aGyxwI=
X-Received: by 2002:a67:6582:0:b0:3d0:d7ce:b383 with SMTP id
 z124-20020a676582000000b003d0d7ceb383mr376193vsb.72.1673438782800; Wed, 11
 Jan 2023 04:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20230111114409.7495-1-julien@xen.org>
In-Reply-To: <20230111114409.7495-1-julien@xen.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 22:05:56 +1000
Message-ID: <CAKmqyKO9v9PhHFtkemg7Ta9ReCzP=Ozr2q=3zVjfY+dKE38XAQ@mail.gmail.com>
Subject: Re: [PATCH] xen: Remove the arch specific header init.h
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 9:44 PM Julien Grall <julien@xen.org> wrote:
>
> From: Julien Grall <jgrall@amazon.com>
>
> Both x86 and (soon) RISC-V version of init.h are empty. On Arm, it contains
> a structure that should not be used by any common code.
>
> The structure init_info is used to store information to setup the CPU
> currently being brought-up. setup.h seems to be more suitable even though
> the header is getting quite crowded.
>
> Looking through the history, <asm/init.h> was introduced at the same
> time as the ia64 port because for some reasons most of the macros
> where duplicated. This was changed in 72c07f413879 and I don't
> foresee any reason to require arch specific definition for init.h
> in the near future.
>
> Therefore remove asm/init.h for both x86 and arm (the only definition
> is moved in setup.h). With that RISC-V will not need to introduce
> an empty header.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
> cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/arm/arm32/asm-offsets.c |  1 +
>  xen/arch/arm/arm64/asm-offsets.c |  1 +
>  xen/arch/arm/include/asm/init.h  | 20 --------------------
>  xen/arch/arm/include/asm/setup.h |  8 ++++++++
>  xen/arch/x86/acpi/power.c        |  1 -
>  xen/arch/x86/include/asm/init.h  |  4 ----
>  xen/include/xen/init.h           |  2 --
>  7 files changed, 10 insertions(+), 27 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/init.h
>  delete mode 100644 xen/arch/x86/include/asm/init.h
>
> diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
> index 2116ba5b95bf..05c692bb2822 100644
> --- a/xen/arch/arm/arm32/asm-offsets.c
> +++ b/xen/arch/arm/arm32/asm-offsets.c
> @@ -11,6 +11,7 @@
>  #include <public/xen.h>
>  #include <asm/current.h>
>  #include <asm/procinfo.h>
> +#include <asm/setup.h>
>
>  #define DEFINE(_sym, _val)                                                 \
>      asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
> diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
> index 280ddb55bfd4..7226cd9b2eb0 100644
> --- a/xen/arch/arm/arm64/asm-offsets.c
> +++ b/xen/arch/arm/arm64/asm-offsets.c
> @@ -10,6 +10,7 @@
>  #include <xen/bitops.h>
>  #include <public/xen.h>
>  #include <asm/current.h>
> +#include <asm/setup.h>
>  #include <asm/smccc.h>
>
>  #define DEFINE(_sym, _val)                                                 \
> diff --git a/xen/arch/arm/include/asm/init.h b/xen/arch/arm/include/asm/init.h
> deleted file mode 100644
> index 5ac8cf8797d6..000000000000
> --- a/xen/arch/arm/include/asm/init.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#ifndef _XEN_ASM_INIT_H
> -#define _XEN_ASM_INIT_H
> -
> -struct init_info
> -{
> -    /* Pointer to the stack, used by head.S when entering in C */
> -    unsigned char *stack;
> -    /* Logical CPU ID, used by start_secondary */
> -    unsigned int cpuid;
> -};
> -
> -#endif /* _XEN_ASM_INIT_H */
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index fdbf68aadcaa..a926f30a2be4 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -168,6 +168,14 @@ int map_range_to_domain(const struct dt_device_node *dev,
>
>  extern const char __ro_after_init_start[], __ro_after_init_end[];
>
> +struct init_info
> +{
> +    /* Pointer to the stack, used by head.S when entering in C */
> +    unsigned char *stack;
> +    /* Logical CPU ID, used by start_secondary */
> +    unsigned int cpuid;
> +};
> +
>  #endif
>  /*
>   * Local variables:
> diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
> index b76f673acb1a..d23335391c67 100644
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -17,7 +17,6 @@
>  #include <xen/sched.h>
>  #include <asm/acpi.h>
>  #include <asm/irq.h>
> -#include <asm/init.h>
>  #include <xen/spinlock.h>
>  #include <xen/sched.h>
>  #include <xen/domain.h>
> diff --git a/xen/arch/x86/include/asm/init.h b/xen/arch/x86/include/asm/init.h
> deleted file mode 100644
> index 5295b35e6337..000000000000
> --- a/xen/arch/x86/include/asm/init.h
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -#ifndef _XEN_ASM_INIT_H
> -#define _XEN_ASM_INIT_H
> -
> -#endif /* _XEN_ASM_INIT_H */
> diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
> index 0af0e234ec80..1d7c0216bc80 100644
> --- a/xen/include/xen/init.h
> +++ b/xen/include/xen/init.h
> @@ -1,8 +1,6 @@
>  #ifndef _LINUX_INIT_H
>  #define _LINUX_INIT_H
>
> -#include <asm/init.h>
> -
>  /*
>   * Mark functions and data as being only used at initialization
>   * or exit time.
> --
> 2.38.1
>
>

