Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF4A5F101B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 18:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414328.658548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeJ02-00044T-Cn; Fri, 30 Sep 2022 16:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414328.658548; Fri, 30 Sep 2022 16:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeJ02-00040w-9t; Fri, 30 Sep 2022 16:36:30 +0000
Received: by outflank-mailman (input) for mailman id 414328;
 Fri, 30 Sep 2022 16:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VUOy=2B=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oeJ00-00040q-SV
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 16:36:28 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 076f86c5-40de-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 18:36:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 578D6B8297A
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 16:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA7AC4347C
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 16:36:24 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id u18so7689251lfo.8
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 09:36:24 -0700 (PDT)
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
X-Inumbo-ID: 076f86c5-40de-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664555784;
	bh=d5fbtNueKCYf5qrhI39a/V/E1KUCYIuE45yESH9w0fI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=az3Q7K5BivT3YLm8upnn9kAtlBofJ74pM/wDynsT7Tf08HBKpOxjxZTMuDjT/byHI
	 vgYEGtFl4EyOWHbC6OF5AED9AiNnx5OYQ32fmAlRPcOvHH2LFYQxPrkmYQi8Y0UOxz
	 IlmIvN6KetN7b8MkROEShqggJTJX1lSyyIxMqxxlrzgPmuGqtrBFV8LIH6v+Vlj6cv
	 O0Dmro/Vo4PmvaAaLHuR4/JrdnneFXS1J6xAamcxwVN8tfeQwlJQQISi6tCwjzvMZR
	 q2dhPzWG494v9ghKKOwEld9J7UUhOVAcIAGTDect00ZeB1tvr4UxxuFOhfiH7LkWtF
	 a4xFuKbJP6OnA==
X-Gm-Message-State: ACrzQf2gOIhfpmCoaqTGnrHhX6+sJdZZ/XHcQaeC9Hc6tN9LDVNDmExZ
	RV5N5Gv+ndYqg4+JoTl6CnoBX9CKDQWqAdGTYvk=
X-Google-Smtp-Source: AMsMyM5ve12n8cLZyYpZa8LVcCls8VBD0vJc2Cot7/WlR3erswFDemOYoPS7+eQy3jck7egBvRR0BP8HVox+kYBUJWo=
X-Received: by 2002:a05:6512:c0f:b0:49b:1e8c:59fd with SMTP id
 z15-20020a0565120c0f00b0049b1e8c59fdmr3421440lfu.426.1664555782378; Fri, 30
 Sep 2022 09:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664298147.git.demi@invisiblethingslab.com> <5649176eacda434267f68676f1733d06c572d19e.1664298147.git.demi@invisiblethingslab.com>
In-Reply-To: <5649176eacda434267f68676f1733d06c572d19e.1664298147.git.demi@invisiblethingslab.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 30 Sep 2022 18:36:11 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEs-o8jvNqRiW+Ue2i52RBgg4iktg8UONCACk8-Gx4XXA@mail.gmail.com>
Message-ID: <CAMj1kXEs-o8jvNqRiW+Ue2i52RBgg4iktg8UONCACk8-Gx4XXA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Support ESRT in Xen dom0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Sept 2022 at 01:02, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> fwupd requires access to the EFI System Resource Table (ESRT) to
> discover which firmware can be updated by the OS.  Currently, Linux does
> not expose the ESRT when running as a Xen dom0.  Therefore, it is not
> possible to use fwupd in a Xen dom0, which is a serious problem for e.g.
> Qubes OS.
>
> Before Xen 4.17, this was not fixable due to hypervisor limitations.
> The UEFI specification requires the ESRT to be in EfiBootServicesData
> memory, which Xen will use for whatever purposes it likes.  Therefore,
> Linux cannot safely access the ESRT, as Xen may have overwritten it.
>
> Starting with Xen 4.17, Xen checks if the ESRT is in EfiBootServicesData
> or EfiRuntimeServicesData memory.  If the ESRT is in EfiBootServicesData
> memory, Xen replaces the ESRT with a copy in memory that it has
> reserved.  Such memory is currently of type EFI_RUNTIME_SERVICES_DATA,
> but in the future it will be of type EFI_ACPI_RECLAIM_MEMORY.  This
> ensures that the ESRT can safely be accessed by the OS.
>
> When running as a Xen dom0, use the new
> xen_config_table_memory_region_max() function to determine if Xen has
> reserved the ESRT and, if so, find the end of the memory region
> containing it.  This allows programs such as fwupd which require the
> ESRT to run under Xen, and so makes fwupd support in Qubes OS possible.
>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Why do we need this patch? I'd expect esrt_table_exists() to return
false when patch 1/2 is applied.



> ---
>  drivers/firmware/efi/esrt.c | 43 ++++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
> index 2a2f52b017e736dd995c69e8aeb5fbd7761732e5..a0642bc161b4b1f94f818b8c9f46511fe2424bb2 100644
> --- a/drivers/firmware/efi/esrt.c
> +++ b/drivers/firmware/efi/esrt.c
> @@ -243,27 +243,44 @@ void __init efi_esrt_init(void)
>         void *va;
>         struct efi_system_resource_table tmpesrt;
>         size_t size, max, entry_size, entries_size;
> -       efi_memory_desc_t md;
> -       int rc;
>         phys_addr_t end;
> -
> -       if (!efi_enabled(EFI_MEMMAP))
> -               return;
> +       u32 type;
>
>         pr_debug("esrt-init: loading.\n");
>         if (!esrt_table_exists())
>                 return;
>
> -       rc = efi_mem_desc_lookup(efi.esrt, &md);
> -       if (rc < 0 ||
> -           (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> -            md.type != EFI_BOOT_SERVICES_DATA &&
> -            md.type != EFI_RUNTIME_SERVICES_DATA)) {
> -               pr_warn("ESRT header is not in the memory map.\n");
> +       if (efi_enabled(EFI_MEMMAP)) {
> +               efi_memory_desc_t md;
> +
> +               if (efi_mem_desc_lookup(efi.esrt, &md) < 0 ||
> +                   (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> +                    md.type != EFI_BOOT_SERVICES_DATA &&
> +                    md.type != EFI_RUNTIME_SERVICES_DATA)) {
> +                       pr_warn("ESRT header is not in the memory map.\n");
> +                       return;
> +               }
> +
> +               type = md.type;
> +               max = efi_mem_desc_end(&md);
> +#ifdef CONFIG_XEN_EFI
> +       } else if (efi_enabled(EFI_PARAVIRT)) {
> +               max = xen_config_table_memory_region_max(efi.esrt);
> +               /*
> +                * This might be wrong, but it doesn't matter.
> +                * xen_config_table_memory_region_max() checks the type
> +                * of the memory region, and if it returns 0, the code
> +                * below will fail without looking at the type.  Choose
> +                * a value that will not cause * subsequent code to try
> +                * to reserve the memory containing the ESRT, as either
> +                * Xen or the firmware has done so already.
> +                */
> +               type = EFI_RUNTIME_SERVICES_DATA;
> +#endif
> +       } else {
>                 return;
>         }
>
> -       max = efi_mem_desc_end(&md);
>         if (max < efi.esrt) {
>                 pr_err("EFI memory descriptor is invalid. (esrt: %p max: %p)\n",
>                        (void *)efi.esrt, (void *)max);
> @@ -333,7 +350,7 @@ void __init efi_esrt_init(void)
>
>         end = esrt_data + size;
>         pr_info("Reserving ESRT space from %pa to %pa.\n", &esrt_data, &end);
> -       if (md.type == EFI_BOOT_SERVICES_DATA)
> +       if (type == EFI_BOOT_SERVICES_DATA)
>                 efi_mem_reserve(esrt_data, esrt_data_size);
>
>         pr_debug("esrt-init: loaded.\n");
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab
>

