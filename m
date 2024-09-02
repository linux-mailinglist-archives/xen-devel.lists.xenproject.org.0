Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE696891F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 15:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787998.1197445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Oh-0006Ut-9F; Mon, 02 Sep 2024 13:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787998.1197445; Mon, 02 Sep 2024 13:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Oh-0006S7-6Y; Mon, 02 Sep 2024 13:47:11 +0000
Received: by outflank-mailman (input) for mailman id 787998;
 Mon, 02 Sep 2024 13:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vUE=QA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sl7Og-0006S0-Fj
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 13:47:10 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8a7f384-6931-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 15:47:08 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bf009cf4c0so4309859a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 06:47:08 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6ab6asm5254072a12.10.2024.09.02.06.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 06:47:06 -0700 (PDT)
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
X-Inumbo-ID: d8a7f384-6931-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725284828; x=1725889628; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeyzQXmPxRuQS1tm22hVZj4N9UFvkuWDTxTJcjvE2Vw=;
        b=Wb63QIHsaXRuuq5h4c3OXDBOCzXLfXWu4zg2PYQnqksX1HhugN6sdWEP25EGInLSOJ
         ra/+DQWSF8aEr5zcW8RqhNDfYZFtji+uv2Toqq+CsUglVXXdm9axOILRVjhUgUBM/FRb
         pfygbVPdRk6cw3vSbJmIqWGvEn94SbtQdL3GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725284828; x=1725889628;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CeyzQXmPxRuQS1tm22hVZj4N9UFvkuWDTxTJcjvE2Vw=;
        b=X+0f1kehP1J3V3gXYeN/JhYAeT+7fKhjrVGgam4qPqCNnHBdBGcjk+1dQ5Kdrgs0V5
         OQEb0Wvdjhf9MzEUYNT8y3e9tnAuIwGnQWjkUqJvG6BqU7GK8GaLwDejPUXNBMeSjf3n
         QKFq84Xjok30hZAxo2tYFGqm7c2kNJbcgn24NjTXyzvs4c4iKYhj+I/WW+FdBH8MEYUx
         QdRZ9b4uXdRxZz1hu6wcW5oI2GQrHTtaXE8/pfKemW8HdNCuYRoXAcDl+CZUpS54p+YT
         N9NOTUPQU8uy0rQapMxG94Ag/ZcJUITP64RjxJx9Y9d1MWEv5YUGEHcJpmnGH+ht5y+Z
         gI/A==
X-Forwarded-Encrypted: i=1; AJvYcCVLkcgDyM/XZZQ6175l0ocIqpJAs3aWi+96/tqntEe/qAPXVxZUZppGPUBB+j0SV+Vks/GBKDjElFA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyP2+PqOCvGme2fiRLoZhEVDmRr6vjaqu7xx0jSmTfMDFzXYc24
	MdbIPhBvtVagXsQxPGLErutkvMKvfFbCJEHVtMnjd8l1u934eYH9f9G/tANLFDkGwDdIot6RUWH
	EBpk=
X-Google-Smtp-Source: AGHT+IEUFjg3JiRxHFrtqevOhV92emAa/OQ030EhSdzXl/xqKvtVwkuIYt9LOggRtf8iiR4KBb9SyQ==
X-Received: by 2002:a05:6402:2116:b0:5be:d63a:4608 with SMTP id 4fb4d7f45d1cf-5c21ed34dd3mr12346466a12.3.1725284827514;
        Mon, 02 Sep 2024 06:47:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Sep 2024 14:47:04 +0100
Message-Id: <D3VUFEINDZZJ.3OHX2CEG4T0JU@cloud.com>
Cc: "Christopher Clark" <christopher.w.clark@gmail.com>,
 <jason.andryuk@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v4 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-2-dpsmith@apertussolutions.com>
In-Reply-To: <20240830214730.1621-2-dpsmith@apertussolutions.com>

I haven't read the entire series yet, but here's my .02 so far

On Fri Aug 30, 2024 at 10:46 PM BST, Daniel P. Smith wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> An initial step towards a non-multiboot internal representation of boot
> modules for common code, starting with x86 setup and converting the field=
s
> that are accessed for the startup calculations.
>
> Introduce a new header, <xen/asm/bootinfo.h>, and populate it with a new
> boot_info structure initially containing a count of the number of boot
> modules.
>
> No functional change intended.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/arch/x86/include/asm/bootinfo.h | 25 +++++++++++++
>  xen/arch/x86/setup.c                | 58 +++++++++++++++++------------
>  2 files changed, 59 insertions(+), 24 deletions(-)
>  create mode 100644 xen/arch/x86/include/asm/bootinfo.h
>
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/a=
sm/bootinfo.h
> new file mode 100644
> index 000000000000..e850f80d26a7
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
> + * Copyright (c) 2024 Apertus Solutions, LLC
> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
> + */
> +
> +#ifndef __XEN_X86_BOOTINFO_H__
> +#define __XEN_X86_BOOTINFO_H__
> +

This struct would benefit from a comment stating what it's for and how it's
meant to be used. At a glance it seems like it's meant to be serve as a
boot-protocol agnostic representation of boot-parameters, used as a generic
means of information handover. Which would imply multiboot_info is parsed o=
nto
it when booting from multiboot and is synthesised from scratch in other cas=
es
(e.g: direct EFI?).

> +struct boot_info {
> +    unsigned int nr_mods;

It's imo better to treat this as an ABI. That would allow using this layer =
as a
boot protocol in itself (which I'm guessing is the objective? I haven't got=
ten
that far in the series). If so, this would need to be a fixed-width uintN_t=
.

Same with other fields in follow-up patches.

> +};
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index eee20bb1753c..dd94ee2e736b 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -32,6 +32,7 @@
>  #include <compat/xen.h>
>  #endif
>  #include <xen/bitops.h>
> +#include <asm/bootinfo.h>
>  #include <asm/smp.h>
>  #include <asm/processor.h>
>  #include <asm/mpspec.h>
> @@ -276,7 +277,16 @@ static int __init cf_check parse_acpi_param(const ch=
ar *s)
>  custom_param("acpi", parse_acpi_param);
> =20
>  static const module_t *__initdata initial_images;
> -static unsigned int __initdata nr_initial_images;
> +static struct boot_info __initdata *boot_info;
> +
> +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)

If this function returned boot_info instead and the caller made the
assignment then it would be possible to unit-test/fuzz it.

It also fits a bit more nicely with the usual implications of that function
name pattern, I think.

> +{
> +    static struct boot_info __initdata info;
> +
> +    info.nr_mods =3D mbi->mods_count;

Shouldn't this be gated on MBI_MODULES being set?

   info.nr_mods =3D (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;

> +
> +    boot_info =3D &info;
> +}
> =20
>  unsigned long __init initial_images_nrpages(nodeid_t node)
>  {
> @@ -285,7 +295,7 @@ unsigned long __init initial_images_nrpages(nodeid_t =
node)
>      unsigned long nr;
>      unsigned int i;
> =20
> -    for ( nr =3D i =3D 0; i < nr_initial_images; ++i )
> +    for ( nr =3D i =3D 0; i < boot_info->nr_mods; ++i )
>      {
>          unsigned long start =3D initial_images[i].mod_start;
>          unsigned long end =3D start + PFN_UP(initial_images[i].mod_end);
> @@ -301,7 +311,7 @@ void __init discard_initial_images(void)
>  {
>      unsigned int i;
> =20
> -    for ( i =3D 0; i < nr_initial_images; ++i )
> +    for ( i =3D 0; i < boot_info->nr_mods; ++i )
>      {
>          uint64_t start =3D (uint64_t)initial_images[i].mod_start << PAGE=
_SHIFT;
> =20
> @@ -309,7 +319,7 @@ void __init discard_initial_images(void)
>                             start + PAGE_ALIGN(initial_images[i].mod_end)=
);
>      }
> =20
> -    nr_initial_images =3D 0;
> +    boot_info->nr_mods =3D 0;

Out of curiosity, why is this required?

>      initial_images =3D NULL;
>  }
> =20
> @@ -1034,9 +1044,10 @@ void asmlinkage __init noreturn __start_xen(unsign=
ed long mbi_p)
>          mod =3D __va(mbi->mods_addr);
>      }
> =20
> +    multiboot_to_bootinfo(mbi);
> +
>      loader =3D (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_nam=
e)
>                                             : "unknown";
> -

Stray newline removal?

>      /* Parse the command-line options. */
>      if ( mbi->flags & MBI_CMDLINE )
>          cmdline =3D cmdline_cook(__va(mbi->cmdline), loader);
> @@ -1141,18 +1152,18 @@ void asmlinkage __init noreturn __start_xen(unsig=
ned long mbi_p)
>             bootsym(boot_edd_info_nr));
> =20
>      /* Check that we have at least one Multiboot module. */
> -    if ( !(mbi->flags & MBI_MODULES) || (mbi->mods_count =3D=3D 0) )
> +    if ( !(mbi->flags & MBI_MODULES) || (boot_info->nr_mods =3D=3D 0) )

With MBI_MODULES accounted for during conversion, the first part of the
conditional can be ellided and you could simply do:

    if ( !boot_info->nr_mods )
        panic(...)

Also, could we move this to multiboot_to_bootinfo()? It'd contain these sor=
ts
of boot argument checks to a much more self contained function and help che=
ck
at the point of assignment, preventing misuse.

>          panic("dom0 kernel not specified. Check bootloader configuration=
\n");
> =20
>      /* Check that we don't have a silly number of modules. */

> -    if ( mbi->mods_count > sizeof(module_map) * 8 )
> +    if ( boot_info->nr_mods > sizeof(module_map) * 8 )

Like above, this check would be much more neatly contained where boot_info
is created, imo.

>      {
> -        mbi->mods_count =3D sizeof(module_map) * 8;
> +        boot_info->nr_mods =3D sizeof(module_map) * 8;
>          printk("Excessive multiboot modules - using the first %u only\n"=
,

Does the comment need adjusting too to make it more general? As in
s/multiboot/boot.

> -               mbi->mods_count);
> +               boot_info->nr_mods);
>      }
> =20
> -    bitmap_fill(module_map, mbi->mods_count);
> +    bitmap_fill(module_map, boot_info->nr_mods);
>      __clear_bit(0, module_map); /* Dom0 kernel is always first */
> =20
>      if ( pvh_boot )

Cheers,
Alejandro

