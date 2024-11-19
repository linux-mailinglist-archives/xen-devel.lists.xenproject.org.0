Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73789D223B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 10:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839826.1255610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKGZ-0004Vi-VY; Tue, 19 Nov 2024 09:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839826.1255610; Tue, 19 Nov 2024 09:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKGZ-0004TH-SO; Tue, 19 Nov 2024 09:11:23 +0000
Received: by outflank-mailman (input) for mailman id 839826;
 Tue, 19 Nov 2024 09:11:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Kxf=SO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tDKGY-0004TB-9j
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 09:11:22 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b383c35-a656-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 10:11:17 +0100 (CET)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5ee9dbf1b47so2548161eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 01:11:17 -0800 (PST)
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
X-Inumbo-ID: 3b383c35-a656-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMzYiLCJoZWxvIjoibWFpbC1vbzEteGMzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNiMzgzYzM1LWE2NTYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDA3NDc3LjExNjA1OCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732007475; x=1732612275; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+wyjy6S4Vk/7+Z8rVEFDxGh+R27I+DILsppFFGtcHI=;
        b=BZw5CYstkz2cS+zz3JFW3+AJX8Zwl5RyuJxvG2YTL9I6j5RxdZ2TNNHmuDyFPSrYbi
         1VvMISA4biH78h098cJKbTEUKJBs9WlnyQyeZ+sVeE09nm24fDNmSHGc462O/HfqbWVq
         uOrRAZjVIDxuBzGel4c5HpRoLJbzj7mSI1Sqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732007476; x=1732612276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+wyjy6S4Vk/7+Z8rVEFDxGh+R27I+DILsppFFGtcHI=;
        b=Fkh5hMvLaUWwhQAKOLn6e+7A00xNdak1NXdJzjeJNPIFEaFjDHB9eIacetxHC9IYfV
         44UwMLAF9zdsfKNjKtDuQRfI9mgPBi6x5gYLEmwz7HH/EYK2ooOOV41I9Byq+L6CH31e
         mXb3WPYWxIBB4Gk+zZGJu6qomUV1OT0CYTU75ryXRcS181f5quiXMSWPb0pJM+Vh4Q+L
         taiLmeday7bE8Dds82YMbP7JIeGDA9seRT5ta06QVCjhtWHwzv7zKS7BsSyZgowfELCf
         L/lGnTd1LWqj7GUKsq9P2I/0qvv83fQ4V4fr8U6NaylTOoqdQdgFHoS/Nwg0fMvi/L7f
         JFbg==
X-Gm-Message-State: AOJu0YwE22EoK2CXiOwue8X42SYVtO0hDiFI4KYNLS+FpoGwE7YAqvP6
	V/GRIqBveGqvtXdc+9cAzysanDmPZTP+MBZkZXGgLsQWVof63EzPfP3qKteU7hUHcIS7gxwMPoL
	cOc3ciX4BhjLH6HwFIl7jYF3rfFlw1alqIdsAGw==
X-Google-Smtp-Source: AGHT+IHiBXfthwAgRQIpe9nbofcyXAAWPPIET9wfoD2ltgFnO9tqm6sWdnOIP7FTBoL67iQApDzaGk+w2083PDc4byM=
X-Received: by 2002:a9d:6a57:0:b0:710:f22b:c825 with SMTP id
 46e09a7af769-71aa693087amr1265236a34.1.1732007475680; Tue, 19 Nov 2024
 01:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20241118171809.2447714-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241118171809.2447714-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 19 Nov 2024 09:11:04 +0000
Message-ID: <CACHz=ZjJRmreESuVOFf_z_G-d47Xayik1Rp4zW4OqL=X1mbrxw@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Introduce boot-helpers.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 5:18=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Eclair complains that neither reloc_trampoline{32,64}() can see their
> declarations.
>
> reloc_trampoline32() needs to become asmlinkage, while reloc_trampoline64=
()
> needs declaring properly in a way that both efi-boot.h and reloc-trampoli=
ne.c
> can see.
>
> Introduce boot-helpers.h for the purpose.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
>
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1549438881
> ---
>  xen/arch/x86/boot/reloc-trampoline.c    |  4 +++-
>  xen/arch/x86/efi/efi-boot.h             |  4 ++--
>  xen/arch/x86/include/asm/boot-helpers.h | 13 +++++++++++++
>  3 files changed, 18 insertions(+), 3 deletions(-)
>  create mode 100644 xen/arch/x86/include/asm/boot-helpers.h
>
> diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/rel=
oc-trampoline.c
> index d5548eb08f85..e35e7c78aa86 100644
> --- a/xen/arch/x86/boot/reloc-trampoline.c
> +++ b/xen/arch/x86/boot/reloc-trampoline.c
> @@ -2,13 +2,15 @@
>
>  #include <xen/compiler.h>
>  #include <xen/stdint.h>
> +
> +#include <asm/boot-helpers.h>
>  #include <asm/trampoline.h>
>
>  extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
>  extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
>
>  #if defined(__i386__)
> -void reloc_trampoline32(void)
> +void asmlinkage reloc_trampoline32(void)
>  #elif defined (__x86_64__)
>  void reloc_trampoline64(void)
>  #else
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 9d3f2b71447e..1d8902a9a724 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -4,6 +4,8 @@
>   * therefore can define arch specific global variables.
>   */
>  #include <xen/vga.h>
> +
> +#include <asm/boot-helpers.h>
>  #include <asm/e820.h>
>  #include <asm/edd.h>
>  #include <asm/microcode.h>
> @@ -103,8 +105,6 @@ static void __init efi_arch_relocate_image(unsigned l=
ong delta)
>      }
>  }
>
> -void reloc_trampoline64(void);
> -
>  static void __init relocate_trampoline(unsigned long phys)
>  {
>      trampoline_phys =3D phys;
> diff --git a/xen/arch/x86/include/asm/boot-helpers.h b/xen/arch/x86/inclu=
de/asm/boot-helpers.h
> new file mode 100644
> index 000000000000..166f49b4da01
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/boot-helpers.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Declarations for helper functions compiled for both 32bit and 64bit.
> + *
> + * The 32bit forms are called only from assembly, so no declaration is p=
rovide
> + * here.
> + */
> +#ifndef X86_BOOT_HELPERS_H
> +#define X86_BOOT_HELPERS_H

Why not follow the coding style ? IMHO if we don't agree on coding
style we should update it, otherwise we should follow coding style.

Maybe considering this
https://lists.xenproject.org/archives/html/xen-devel/2024-11/msg00658.html
move the file into the boot include directory instead?

> +
> +void reloc_trampoline64(void);
> +
> +#endif /* X86_BOOT_HELPERS_H */

Frediano

