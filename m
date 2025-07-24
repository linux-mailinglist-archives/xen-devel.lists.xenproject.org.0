Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940CB10D83
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056184.1424367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewvX-0004VZ-26; Thu, 24 Jul 2025 14:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056184.1424367; Thu, 24 Jul 2025 14:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewvW-0004TI-VP; Thu, 24 Jul 2025 14:28:06 +0000
Received: by outflank-mailman (input) for mailman id 1056184;
 Thu, 24 Jul 2025 14:28:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uewvV-0004TC-IP
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:28:05 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6908d85c-689a-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:28:04 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b611665b96so643236f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 07:28:04 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fcbb21asm2362455f8f.70.2025.07.24.07.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 07:28:03 -0700 (PDT)
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
X-Inumbo-ID: 6908d85c-689a-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753367284; x=1753972084; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x/dFmbi8j8O8EykBti2gjgxJkMegmYTneyar5+dgYTU=;
        b=EYqqHBmfkzRlCMX1yvMj3IL2UdlCWYcPm6tpjHozvRzeGyhMRbnbiMhvUl2GVVyJaB
         cOOapFXqi0mY/EUeQMrGvRSU3pnGmBkR+zzc8af4s/M9kSlCwRLu1Plf+iHxLHi+LI3k
         0D4os592Nkx3bPuI3xHh0MuAXv6MTzXHpEwhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367284; x=1753972084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/dFmbi8j8O8EykBti2gjgxJkMegmYTneyar5+dgYTU=;
        b=kxxm4vXMmNRqGKVssgylbUm4uUPbZvNQAsJLH3wEC+oZZ3rhxRtnADbzTrq6NQsWha
         sZp3esM7hwFcxVknpvImblL3khRTwSQmQKvrMpMKR4mbZACO5JbwoxDfnYvKSD/ZQ+3O
         1AiR+IXaDgong1jWn78tJEukoQsdGMMICpmMowKLushOD4HUXUHJVmxWc3xAU76xD/vW
         KKo09zthF5dxUhkvQ0UZeVMYz/NfwTPYECqfVDu4P9fk2n9NX4DuE98Jxl/NRtXuqISE
         53QKA90CdMg/4ta7hrp7HHGO8NLFW2RVKVZrkbnKtuhFOkbPUdH05Vkpe39Z+iHxwgU8
         Ahvg==
X-Gm-Message-State: AOJu0YzkuLyFy6wVCiRxlGHxrt27gLIupVxl2uvg1AEgFskvhr/Z1UpG
	ZUg4C7wQOChZNdmFF3rMdk7gDzwlu7BY+n5/3pkF4rBOSgzEAG0XptC6n6HufgI4v1A=
X-Gm-Gg: ASbGncsbciMTyvLzw5Zx1HY6lC9RdLEPByXwCfOHIzkV6Gt3uSKPCeAQebURP8LgYo5
	49+semyH5dQTsIb0nq8rH/MdnW7QXlkIU5mn0l/pWgfmqc1n87XOlo7dY5qoIAdIU+mvLGR2ovD
	w1Xl4bRX9cdstqLhc+4wdB06IXxtuV6SlxNb+WEAUoJrH+x7tYV/DbRmVC+Ous5lT7pwqJxaGsw
	3T/Jno4N67dnYmgm4zfPKkKXzo8hMpIisY05yPDqe7e9ek4OyJuEIgfISlrwH5zW7gLfCaGTIEs
	ZCPk2A/gyybFlrbZ6Jjtg7yYTBYFLrzjGM9Bt44nZz4M9d95fawdZzt+W5Wbx0ZxFcNsIK9yfcI
	iwNubE+fzn0vsdGNQnAmQLBO0gRCZtR/pZPesBL/jNmuchP0e0x66byNlWo3QGYDwSQ==
X-Google-Smtp-Source: AGHT+IF5apC0cQJSfL4fILsMzPAFp0QrSgMNBZUZtyV2LleHpSqerODqEzVnNqduyJVK5LXIxMtFzg==
X-Received: by 2002:a5d:5f42:0:b0:3a5:3b93:be4b with SMTP id ffacd0b85a97d-3b768eb2a59mr5903262f8f.25.1753367283768;
        Thu, 24 Jul 2025 07:28:03 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:28:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v8 2/8] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aIJC8qqJM_P-hEAb@macbook.local>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
 <20250724055006.29843-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724055006.29843-3-Jiqian.Chen@amd.com>

On Thu, Jul 24, 2025 at 01:50:00PM +0800, Jiqian Chen wrote:
> Refactor REGISTER_VPCI_INIT to contain more capability specific
> information, this will benefit further follow-on changes to hide
> capability when initialization fails.
> 
> What's more, change the definition of init_header() since it is
> not a capability and it is needed for all devices' PCI config space.
> 
> After refactor, the "priority" of initializing capabilities isn't
> needed anymore, so delete its related codes.
> 
> Note:
> Call vpci_make_msix_hole() in the end of init_msix() since the change
> of sequence of init_header() and init_msix().
> 
> The cleanup hook is also added in this change, even if it's still
> unused. Further changes will make use of it.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> cc: Andrew Cooper <andrew.cooper3@citrix.com>
> cc: Anthony PERARD <anthony.perard@vates.tech>
> cc: Michal Orzel <michal.orzel@amd.com>
> cc: Jan Beulich <jbeulich@suse.com>
> cc: Julien Grall <julien@xen.org>
> cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v7->v8 changes:
> * Recover vpci_make_msix_hole() call in modify_decoding(), which was  deleted by wrong.
> * Add some comment to describe why need to add vpci_make_msix_hole() in init_msix().
> 
> v6->v7 changes:
> * Change the pointer parameter of cleanup hook of vpci_capability_t to be const.
>   If change parameter of init hook to be const will affect init_msix, and it assigns pdev
>   to struct vpci_msix, so keep no const to expanding the impact.
> * Delete the vpci_make_msix_hole() call in modify_decoding().
> * Change __start_vpci_array from vpci_capability_t* array to vpci_capability_t array.
> * Change the name "finit##_t" to be "name##_entry" and add a "name" parameter to macro
>   REGISTER_VPCI_CAPABILITY.
> 
> v5->v6 changes:
> * Rename REGISTER_PCI_CAPABILITY to REGISTER_VPCI_CAPABILITY.
> * Move vpci_capability_t entry from ".data.vpci" to ".data.rel.ro.vpci" and
>   move the instances of VPCI_ARRAY in the linker scripts before *(.data.rel.ro).
> * Change _start/end_vpci_array[] to be const pointer array.
> 
> v4->v5 changes:
> * Rename REGISTER_VPCI_CAP to REGISTER_PCI_CAPABILITY, rename REGISTER_VPCI_LEGACY_CAP to
>   REGISTER_VPCI_CAP, rename REGISTER_VPCI_EXTENDED_CAP to REGISTER_VPCI_EXTCAP.
> * Change cleanup hook of vpci_capability_t from void to int.
> 
> v3->v4 changes
> * Delete the useless trailing dot of section ".data.vpci".
> * Add description about priority since this patch removes the initializing priority of
>   capabilities and priority is not needed anymore.
> * Change the hook name from fini to cleanup.
> * Change the name x and y to be finit and fclean.
> * Remove the unnecessary check "!capability->init"
> 
> v2->v3 changes:
> * This is separated from patch "vpci: Hide capability when it fails to initialize" of v2.
> * Delete __maybe_unused attribute of "out" in function vpci_assign_devic().
> * Rename REGISTER_VPCI_EXTEND_CAP to REGISTER_VPCI_EXTENDED_CAP.
> 
> v1->v2 changes:
> * Removed the "priorities" of initializing capabilities since it isn't used anymore.
> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove
>   failed capability from list.
> * Called vpci_make_msix_hole() in the end of init_msix().
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/arch/arm/xen.lds.S    |  3 +--
>  xen/arch/ppc/xen.lds.S    |  3 +--
>  xen/arch/riscv/xen.lds.S  |  3 +--
>  xen/arch/x86/xen.lds.S    |  2 +-
>  xen/drivers/vpci/header.c |  3 +--
>  xen/drivers/vpci/msi.c    |  2 +-
>  xen/drivers/vpci/msix.c   | 13 ++++++++++--
>  xen/drivers/vpci/rebar.c  |  2 +-
>  xen/drivers/vpci/vpci.c   | 44 ++++++++++++++++++++++++++++++---------
>  xen/include/xen/vpci.h    | 29 +++++++++++++++++++-------
>  xen/include/xen/xen.lds.h |  2 +-
>  11 files changed, 74 insertions(+), 32 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 5bfbe1e92c1e..9f30c3a13ed1 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -57,6 +57,7 @@ SECTIONS
>  
>         *(.rodata)
>         *(.rodata.*)
> +       VPCI_ARRAY
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
>  
> @@ -64,8 +65,6 @@ SECTIONS
>         __proc_info_start = .;
>         *(.proc.info)
>         __proc_info_end = .;
> -
> -       VPCI_ARRAY
>    } :text
>  
>  #if defined(BUILD_ID)
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 1366e2819eed..1de0b77fc6b9 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -51,11 +51,10 @@ SECTIONS
>  
>          *(.rodata)
>          *(.rodata.*)
> +        VPCI_ARRAY
>          *(.data.rel.ro)
>          *(.data.rel.ro.*)
>  
> -        VPCI_ARRAY
> -
>          . = ALIGN(POINTER_ALIGN);
>      } :text
>  
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index 8c3c06de01f6..edcadff90bfe 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -46,11 +46,10 @@ SECTIONS
>  
>          *(.rodata)
>          *(.rodata.*)
> +        VPCI_ARRAY
>          *(.data.rel.ro)
>          *(.data.rel.ro.*)
>  
> -        VPCI_ARRAY
> -
>          . = ALIGN(POINTER_ALIGN);
>      } :text
>  
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 636c7768aa3c..8e9cac75b09e 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -135,6 +135,7 @@ SECTIONS
>  
>         *(.rodata)
>         *(.rodata.*)
> +       VPCI_ARRAY
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
>  
> @@ -148,7 +149,6 @@ SECTIONS
>         *(.note.gnu.build-id)
>         __note_gnu_build_id_end = .;
>  #endif
> -       VPCI_ARRAY
>    } PHDR(text)
>  
>  #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f537f3f25d2a..469f4977441a 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -858,7 +858,7 @@ static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> -static int cf_check init_header(struct pci_dev *pdev)
> +int vpci_init_header(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
>      uint64_t addr, size;
> @@ -1054,7 +1054,6 @@ static int cf_check init_header(struct pci_dev *pdev)
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>      return rc;
>  }
> -REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 66e5a8a116be..c3eba4e14870 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_CAP(MSI, init_msi, NULL);
>  
>  void vpci_dump_msi(void)
>  {
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 74211301ba10..eb3e7dcd1068 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -703,9 +703,18 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      pdev->vpci->msix = msix;
>      list_add(&msix->next, &d->arch.hvm.msix_tables);
>  
> -    return 0;
> +    /*
> +     * vPCI header initialization will have mapped the whole BAR into the
> +     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
> +     * the MSI-X table here, so that Xen can trap accesses.
> +     */
> +    spin_lock(&pdev->vpci->lock);
> +    rc = vpci_make_msix_hole(pdev);
> +    spin_unlock(&pdev->vpci->lock);

I should have asked in the last version, but why do you take the vPCI
lock here?

The path that ASSERTs the lock is held should never be taken when
called from init_msix().  Is there some path I'm missing in
vpci_make_msix_hole() that requires the vCPI lock to be held?

The rest LGTM.

Thanks, Roger.

