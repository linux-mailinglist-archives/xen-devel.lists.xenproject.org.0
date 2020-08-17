Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C9245F18
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 10:18:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7aJa-0004Tq-GL; Mon, 17 Aug 2020 08:16:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tbh=B3=kernel.org=ardb@srs-us1.protection.inumbo.net>)
 id 1k7aJZ-0004Tl-3h
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 08:16:21 +0000
X-Inumbo-ID: 12f4b0ba-d74a-4363-9fc2-239ce7dc5f8c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12f4b0ba-d74a-4363-9fc2-239ce7dc5f8c;
 Mon, 17 Aug 2020 08:16:20 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C8E32078D
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2020 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597652179;
 bh=REU3lKNM+epiJ6ZpgKTv0/LLGWDdzPEKrZr2K4sNVMk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=REAqyC6iAVEsUXag770uIcewmuII3cBhCCYrwSe0y9RvpiATOl5bGzaFWh+F5UvDH
 8j+Gkku5TWwcgTegc02ZFEb/AdmLYVKQpbHO5xJumjKQvQxt0Q80ynPRv+ZcIHnlaL
 MGkB9W4SwFMrlPZWLNJJhZbGzJkPzR1nXICqBrw0=
Received: by mail-oi1-f170.google.com with SMTP id n128so10257660oif.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2020 01:16:19 -0700 (PDT)
X-Gm-Message-State: AOAM533dK8MH3DsZU+ngI40xatKBMoxzpVIHSsciKLDlpbMEvkISXUNH
 8I9+Pa2ucmx2OKE1i50yqb4GSQs0gZFO+rjFOfg=
X-Google-Smtp-Source: ABdhPJxGqt74QmpoPJrLwN/NcdAB/mHbqYjY+F7QjwsUheKXe0RJtP0HPm6m8FJYHB/IkR5JEaFL7Wwu+US/MH2y9KM=
X-Received: by 2002:a05:6808:b37:: with SMTP id
 t23mr9137631oij.174.1597652178567; 
 Mon, 17 Aug 2020 01:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200816001949.595424-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20200816001949.595424-1-marmarek@invisiblethingslab.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 17 Aug 2020 10:16:07 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEQ2mpmcNke0K2MZPAAo9wGZ4h3pCmMg9Hm7CPXOCV7fQ@mail.gmail.com>
Message-ID: <CAMj1kXEQ2mpmcNke0K2MZPAAo9wGZ4h3pCmMg9Hm7CPXOCV7fQ@mail.gmail.com>
Subject: Re: [PATCH] efi: discover ESRT table on Xen PV too
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: linux-efi <linux-efi@vger.kernel.org>, norbert.kaminski@3mdeb.com, 
 xen-devel@lists.xenproject.org, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Marek,

On Sun, 16 Aug 2020 at 02:20, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> In case of Xen PV dom0, Xen passes along info about system tables (see
> arch/x86/xen/efi.c), but not the memory map from EFI. This makes sense
> as it is Xen responsible for managing physical memory address space.
> In this case, it doesn't make sense to condition using ESRT table on
> availability of EFI memory map, as it isn't Linux kernel responsible for
> it. Skip this part on Xen PV (let Xen do the right thing if it deems
> necessary) and use ESRT table normally.
>
> This is a requirement for using fwupd in PV dom0 to update UEFI using
> capsules.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
>  drivers/firmware/efi/esrt.c | 47 ++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
> index d5915272141f..5c49f2aaa4b1 100644
> --- a/drivers/firmware/efi/esrt.c
> +++ b/drivers/firmware/efi/esrt.c
> @@ -245,36 +245,38 @@ void __init efi_esrt_init(void)
>         int rc;
>         phys_addr_t end;
>
> -       if (!efi_enabled(EFI_MEMMAP))
> +       if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
>                 return;
>
>         pr_debug("esrt-init: loading.\n");
>         if (!esrt_table_exists())
>                 return;
>
> -       rc =3D efi_mem_desc_lookup(efi.esrt, &md);
> -       if (rc < 0 ||
> -           (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> -            md.type !=3D EFI_BOOT_SERVICES_DATA &&
> -            md.type !=3D EFI_RUNTIME_SERVICES_DATA)) {
> -               pr_warn("ESRT header is not in the memory map.\n");
> -               return;
> -       }
> +       if (efi_enabled(EFI_MEMMAP)) {
> +               rc =3D efi_mem_desc_lookup(efi.esrt, &md);
> +               if (rc < 0 ||
> +                   (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> +                    md.type !=3D EFI_BOOT_SERVICES_DATA &&
> +                    md.type !=3D EFI_RUNTIME_SERVICES_DATA)) {
> +                       pr_warn("ESRT header is not in the memory map.\n"=
);
> +                       return;
> +               }
>
> -       max =3D efi_mem_desc_end(&md);
> -       if (max < efi.esrt) {
> -               pr_err("EFI memory descriptor is invalid. (esrt: %p max: =
%p)\n",
> -                      (void *)efi.esrt, (void *)max);
> -               return;
> -       }
> +               max =3D efi_mem_desc_end(&md);
> +               if (max < efi.esrt) {
> +                       pr_err("EFI memory descriptor is invalid. (esrt: =
%p max: %p)\n",
> +                              (void *)efi.esrt, (void *)max);
> +                       return;
> +               }
>
> -       size =3D sizeof(*esrt);
> -       max -=3D efi.esrt;
> +               size =3D sizeof(*esrt);
> +               max -=3D efi.esrt;
>
> -       if (max < size) {
> -               pr_err("ESRT header doesn't fit on single memory map entr=
y. (size: %zu max: %zu)\n",
> -                      size, max);
> -               return;
> +               if (max < size) {
> +                       pr_err("ESRT header doesn't fit on single memory =
map entry. (size: %zu max: %zu)\n",
> +                              size, max);
> +                       return;
> +               }
>         }
>
>         va =3D early_memremap(efi.esrt, size);
> @@ -331,7 +333,8 @@ void __init efi_esrt_init(void)
>
>         end =3D esrt_data + size;
>         pr_info("Reserving ESRT space from %pa to %pa.\n", &esrt_data, &e=
nd);
> -       if (md.type =3D=3D EFI_BOOT_SERVICES_DATA)
> +
> +       if (efi_enabled(EFI_MEMMAP) && md.type =3D=3D EFI_BOOT_SERVICES_D=
ATA)
>                 efi_mem_reserve(esrt_data, esrt_data_size);
>

This does not look correct to me. Why doesn't the region need to be
reserved on a Xen boot? The OS may overwrite it otherwise.


>         pr_debug("esrt-init: loaded.\n");
> --
> 2.25.4
>

