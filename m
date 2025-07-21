Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D6B0C689
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 16:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051585.1419943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udrdl-00038c-IL; Mon, 21 Jul 2025 14:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051585.1419943; Mon, 21 Jul 2025 14:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udrdl-00036T-Fk; Mon, 21 Jul 2025 14:37:17 +0000
Received: by outflank-mailman (input) for mailman id 1051585;
 Mon, 21 Jul 2025 14:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udrdk-00036N-88
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 14:37:16 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ecbdddf-6640-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 16:37:09 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso2015200f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 07:37:09 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4563b5b7e6fsm104591885e9.10.2025.07.21.07.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 07:37:08 -0700 (PDT)
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
X-Inumbo-ID: 2ecbdddf-6640-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753108629; x=1753713429; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vjaOu6KoX97zqgZw8RAxoTNvngJb2Y39SRwMpwm0+qY=;
        b=peUIJbgJbeOU2i7vzGFxW7FOGtofHvL/GN2hH7bQ46dhRNYEsQaDSmau9WtjKqOuKR
         BUgGUjxSF3HBr7H1KoNpIhxyCArI7+AT2LLaKnduAFUfNGkaeQbQaV/y/y6QGUYODXZS
         lXi+0J948PVzE7LMPNazVej8y6RZXzsq7KXOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753108629; x=1753713429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjaOu6KoX97zqgZw8RAxoTNvngJb2Y39SRwMpwm0+qY=;
        b=SlSJw8GR+PfL+eGBLv4JBcNTIcwwrkGEs9rELvNMqMyBfnzAD5RuZf13BEEgLPjJT+
         m7H4BVqxycxk2JpFTkVs0iH1skAtwr4sMCUnp13Z1a24IjcOe7Ohh55YrRprH2ZDMcwl
         iwAIUGQ4CwWf2pXY9CmdsStXeHq5XRsyb1j5dMAwKdXRVTcGlu+LCM9gx5pvdf0BilpQ
         tvAk4X2t2wigKIpfPoINOi+swiipfEZZ4PGQfhanpMJM25b4ygyk2ugQ+8dbRoAjRMTo
         Dkjn5FuX6xjRWdXFgH+k3laWVomQH+ILUD7FIAi09hDmWeswGIG93Jf2ekP1FqfS5yzB
         k5ng==
X-Gm-Message-State: AOJu0Ywq6muo4VqV81pfWmJEpLGXHrq6ftN9TH5QK7sYGRQA+7eYR2FO
	CqDH1L+693jY45kicIXGCoxfzHu0bSnvW3uAPs1CstkKLgcltUF7Wz9QRuvBcp49XeRCWprKcxj
	Nh4jx
X-Gm-Gg: ASbGncswYrjTn4fzLED+RbZi6gxilqdNrYRxXs1hNqh6UAw5EPX/kwPiPePBU4pVepb
	PhPJpiILHnEH2qa/IynPRhqEeAGPJjNmo2pGYv46jerBZKuhXqrdO3UpbA2qJUGNMLDCyhu981V
	s5B4QOJ85x7wOQ3kW2nlCb65uCaOVXdvrQooMwNObAIgo5O3X/UPPpcRYy+zdcWSFQmqmsOpPqT
	dVNzKGrmQMgrK1aY+ntuWXtuJNuqkXdGJiu9NfKPKBzS8Q51GpQI+etGXv3lxA6QefB5hXw+/4G
	fJ/7iQWuSlrQOFRRhR+TsrYxWV6HzuPXGsjisVgTOMdFCwJQTPXysmySW/Q3lvZ6jjpBPGjNCgh
	s28Uwts21+le9kYtZynpVfopaLPk0xBLheE/pHbJzmF7uxKLvZbl9JwxjDYv9YKiXzg==
X-Google-Smtp-Source: AGHT+IEVUWLjtHaiNY/QLWysozlSCldRoKIFr3h4B8G4r6qlRBGzG/V6TMeKUoYvVrxFBsMwvNGCsQ==
X-Received: by 2002:a05:6000:4022:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3b613ea2606mr13768215f8f.39.1753108629082;
        Mon, 21 Jul 2025 07:37:09 -0700 (PDT)
Date: Mon, 21 Jul 2025 16:37:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 2/8] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aH5Qk0xRHh5NhErA@macbook.local>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704070803.314366-3-Jiqian.Chen@amd.com>

On Fri, Jul 04, 2025 at 03:07:57PM +0800, Jiqian Chen wrote:
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
> of sequence of init_header() and init_msix(). And delete the call of
> vpci_make_msix_hole() in modify_decoding() since it is not needed.
> 
> The cleanup hook is also added in this change, even if it's still
> unused. Further changes will make use of it.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> There is a byte alignment problem in the array __start_vpci_array, which can be solved after
> "[PATCH] x86: don't have gcc over-align data" is merged.
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> cc: Andrew Cooper <andrew.cooper3@citrix.com>
> cc: Anthony PERARD <anthony.perard@vates.tech>
> cc: Michal Orzel <michal.orzel@amd.com>
> cc: Jan Beulich <jbeulich@suse.com>
> cc: Julien Grall <julien@xen.org>
> cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
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
>  xen/drivers/vpci/header.c | 16 +-------------
>  xen/drivers/vpci/msi.c    |  2 +-
>  xen/drivers/vpci/msix.c   | 11 +++++++---
>  xen/drivers/vpci/rebar.c  |  2 +-
>  xen/drivers/vpci/vpci.c   | 44 ++++++++++++++++++++++++++++++---------
>  xen/include/xen/vpci.h    | 32 ++++++++++++++++++----------
>  xen/include/xen/xen.lds.h |  2 +-
>  11 files changed, 71 insertions(+), 49 deletions(-)
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
> index 8ee8052cd4a3..069253b5f721 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -122,19 +122,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>      bool map = cmd & PCI_COMMAND_MEMORY;
>      unsigned int i;
>  
> -    /*
> -     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
> -     * can be trapped (and emulated) by Xen when the memory decoding bit is
> -     * enabled.
> -     *
> -     * FIXME: punching holes after the p2m has been set up might be racy for
> -     * DomU usage, needs to be revisited.
> -     */
> -#ifdef CONFIG_HAS_PCI_MSI
> -    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
> -        return;
> -#endif

I think you need to keep this.  What about BARs being repositioned by
dom0 over reserved region(s), and thus needing the MSI-X hole to be
craved out there?  It's not a common use-case, but we should support
dom0 moving BARs around.

I think you need both the added chunk in init_msix(), plus the code
above to not regress the current functionality.

>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> @@ -869,7 +856,7 @@ static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> -static int cf_check init_header(struct pci_dev *pdev)
> +int vpci_init_header(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
>      uint64_t addr, size;
> @@ -1065,7 +1052,6 @@ static int cf_check init_header(struct pci_dev *pdev)
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
> index 74211301ba10..a1692b9d9f6a 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -589,7 +589,8 @@ static const struct hvm_mmio_ops vpci_msix_table_ops = {
>      .write = msix_write,
>  };
>  
> -int vpci_make_msix_hole(const struct pci_dev *pdev)
> +/* Make sure there's a hole in the p2m for the MSIX mmio areas. */
> +static int vpci_make_msix_hole(const struct pci_dev *pdev)
>  {
>      struct domain *d = pdev->domain;
>      unsigned int i;
> @@ -703,9 +704,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      pdev->vpci->msix = msix;
>      list_add(&msix->next, &d->arch.hvm.msix_tables);
>  
> -    return 0;
> +    spin_lock(&pdev->vpci->lock);
> +    rc = vpci_make_msix_hole(pdev);
> +    spin_unlock(&pdev->vpci->lock);
> +
> +    return rc;
>  }
> -REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
> +REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> index 793937449af7..3c18792d9bcd 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_EXTCAP(REBAR, init_rebar, NULL);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 8474c0e3b995..e7e5b64f1be4 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -36,8 +36,8 @@ struct vpci_register {
>  };
>  
>  #ifdef __XEN__
> -extern vpci_register_init_t *const __start_vpci_array[];
> -extern vpci_register_init_t *const __end_vpci_array[];
> +extern const vpci_capability_t __start_vpci_array[];
> +extern const vpci_capability_t __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> @@ -83,6 +83,32 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static int vpci_init_capabilities(struct pci_dev *pdev)
> +{
> +    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
> +    {
> +        const vpci_capability_t *capability = &__start_vpci_array[i];
> +        const unsigned int cap = capability->id;
> +        const bool is_ext = capability->is_ext;
> +        unsigned int pos = 0;
> +        int rc;
> +
> +        if ( !is_ext )
> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +        else if ( is_hardware_domain(pdev->domain) )
> +            pos = pci_find_ext_capability(pdev->sbdf, cap);
> +
> +        if ( !pos )
> +            continue;
> +
> +        rc = capability->init(pdev);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
>  void vpci_deassign_device(struct pci_dev *pdev)
>  {
>      unsigned int i;
> @@ -128,7 +154,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
>  
>  int vpci_assign_device(struct pci_dev *pdev)
>  {
> -    unsigned int i;
>      const unsigned long *ro_map;
>      int rc = 0;
>  
> @@ -159,14 +184,13 @@ int vpci_assign_device(struct pci_dev *pdev)
>          goto out;
>  #endif
>  
> -    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> -    {
> -        rc = __start_vpci_array[i](pdev);
> -        if ( rc )
> -            break;
> -    }
> +    rc = vpci_init_header(pdev);
> +    if ( rc )
> +        goto out;
> +
> +    rc = vpci_init_capabilities(pdev);
>  
> - out: __maybe_unused;
> + out:
>      if ( rc )
>          vpci_deassign_device(pdev);
>  
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 61d16cc8b897..61287e5d2e12 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -13,11 +13,12 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
>  typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
>                            uint32_t val, void *data);
>  
> -typedef int vpci_register_init_t(struct pci_dev *dev);
> -
> -#define VPCI_PRIORITY_HIGH      "1"
> -#define VPCI_PRIORITY_MIDDLE    "5"
> -#define VPCI_PRIORITY_LOW       "9"
> +typedef struct {
> +    unsigned int id;
> +    bool is_ext;
> +    int (* init)(struct pci_dev *pdev);
> +    int (* cleanup)(const struct pci_dev *pdev);
> +} vpci_capability_t;
>  
>  #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
>  
> @@ -29,9 +30,21 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> -#define REGISTER_VPCI_INIT(x, p)                \
> -  static vpci_register_init_t *const x##_entry  \
> -               __used_section(".data.vpci." p) = (x)
> +#define REGISTER_VPCI_CAPABILITY(cap, name, finit, fclean, ext) \
> +    static const vpci_capability_t name##_entry \
> +        __used_section(".data.rel.ro.vpci") = { \
> +        .id = (cap), \
> +        .init = (finit), \
> +        .cleanup = (fclean), \
> +        .is_ext = (ext), \
> +    }
> +
> +#define REGISTER_VPCI_CAP(name, finit, fclean) \
> +    REGISTER_VPCI_CAPABILITY(PCI_CAP_ID_##name, name, finit, fclean, false)
> +#define REGISTER_VPCI_EXTCAP(name, finit, fclean) \
> +    REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
> +
> +int __must_check vpci_init_header(struct pci_dev *pdev);
>  
>  /* Assign vPCI to device by adding handlers. */
>  int __must_check vpci_assign_device(struct pci_dev *pdev);
> @@ -206,9 +219,6 @@ struct vpci_vcpu {
>  #ifdef __XEN__
>  void vpci_dump_msi(void);
>  
> -/* Make sure there's a hole in the p2m for the MSIX mmio areas. */
> -int vpci_make_msix_hole(const struct pci_dev *pdev);
> -
>  /* Arch-specific vPCI MSI helpers. */
>  void vpci_msi_arch_mask(struct vpci_msi *msi, const struct pci_dev *pdev,
>                          unsigned int entry, bool mask);
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index 793d0e11450c..eb86305c11c7 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -188,7 +188,7 @@
>  #define VPCI_ARRAY               \
>         . = ALIGN(POINTER_ALIGN); \
>         __start_vpci_array = .;   \
> -       *(SORT(.data.vpci.*))     \
> +       *(.data.rel.ro.vpci)           \

Indentation of the trailing '\' seems to be off?

Thanks, Roger.

