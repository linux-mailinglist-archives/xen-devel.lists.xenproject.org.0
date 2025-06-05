Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BA6ACEF8A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006795.1386043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNA3X-0007G8-Co; Thu, 05 Jun 2025 12:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006795.1386043; Thu, 05 Jun 2025 12:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNA3X-0007E5-A0; Thu, 05 Jun 2025 12:50:51 +0000
Received: by outflank-mailman (input) for mailman id 1006795;
 Thu, 05 Jun 2025 12:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNA3W-0007Bf-3x
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:50:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b493d9cc-420b-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 14:50:49 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so7916255e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 05:50:49 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe6cd15sm24849976f8f.39.2025.06.05.05.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:50:48 -0700 (PDT)
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
X-Inumbo-ID: b493d9cc-420b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749127848; x=1749732648; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7oTjjGy5q2ugLjjyV9NtIRXcE4JeMaUhyWLYzqAiDRg=;
        b=DbrcPMebzyNWXJlcElhwgp4yoqyeJz13EsIiRSeZgB1JLHNNsY1uyoiHwvvHVh8qM/
         rJVIK7m9dmJV2N5/BWvvDt9aBBRPmogDleMFh92ZogVHYIhktyE45473QMWwlauyV/a9
         IdUJGUHqtwOdMHK8yU7Br5O8C9X9s6/73PqXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127848; x=1749732648;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7oTjjGy5q2ugLjjyV9NtIRXcE4JeMaUhyWLYzqAiDRg=;
        b=EcDo4hUrLcivjvw7ydssGNGwoAf4gEGs7efpjd5vLndV9gQMqmX6w6qQc4GRn4GXVL
         LfcpFe0mgeguoBIZIsaQ/vda5SbmWuoWOlY1NAvxUhwQ4IemyPnTIhC9QW9lwq9r9mH2
         5n9IKT0bomKISlBDgh2OcfTM0UvM+Klz2TYlnz25rqUxtr3gidfDtGMOaow24lxvrcGW
         MROFBO8D4gB4heDdjg+/HCvzzGzxAAHGoziyiyE1CMByenfj3XD8wSS59JKgJ1Bj6nUI
         u1opOQ59Q4lJuNkT7SW3jXxp9VIc8TYhqfvkx4NFQN37qnY9oVfLheq7/hMBIPjUWnOy
         wjdA==
X-Gm-Message-State: AOJu0YxNCELOH3ItIFGkf2f0yMYV+LRqUaTfeHnzj/+oVBYw/Y1SHqgF
	hwGgUKqVX7bsOwnnXH/pgKP+0g6IXonprDlYL+J78hART4cknHukaAKEg5h9Ny4LG5g=
X-Gm-Gg: ASbGncsNjyIyORmpujEN0J1jT2wo19FoII9ypR5XLiYdgC29GeVdMqPwM/tVE/Ml2RU
	Jzbfl0SEfxvF6qhjYzyOiC3OZhWko0Hr1RW8oy6ewvvWV64pEECHJF8ahT6mNChiifV3XzpjDAm
	BDVo4QtfZoThmFckdcoSh04pAmioEMxHiWZp3hzP9Anl+98pQdjtiubwCxPZ0BV6QYXa/f8zOZl
	oANCv7oNMfFBMk/7Ew7x3PCZILQ+9eTFoPeQG5CdqCwrRG5SBCHwmhkfqrAVH9AeINPrgO98EeH
	HziVkNsCGCuwBjtFjd5sNY4ddMJUpEzyvwPl6bphxfG1IFyI8hVtV8+Da9a+/TrzJWjGeB7gFqy
	n0JvyksnEJ1o9uP9LzqYrj+RDGwAAQw==
X-Google-Smtp-Source: AGHT+IEgK1DMh4qVPESCe7WjipD04ghbwg2FsxBzuOS1nDy64DFs3qBQrkR8jDBCn6ANk+iL3NDd0A==
X-Received: by 2002:a05:600c:458a:b0:450:d3a1:95e2 with SMTP id 5b1f17b1804b1-451f8855f11mr29321965e9.9.1749127848405;
        Thu, 05 Jun 2025 05:50:48 -0700 (PDT)
Date: Thu, 5 Jun 2025 14:50:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aEGSp-LKerGb-wIW@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526094559.140423-5-Jiqian.Chen@amd.com>

On Mon, May 26, 2025 at 05:45:53PM +0800, Jiqian Chen wrote:
> Refactor REGISTER_VPCI_INIT to contain more capability specific
> information, this is benefit for follow-on changes to hide capability

"this will benefit further follow-on..."

I think it's clearer.

> when initialization fails.
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
> v4->v5 changes:
> * Rename REGISTER_VPCI_CAP to REGISTER_PCI_CAPABILITY, rename REGISTER_VPCI_LEGACY_CAP to REGISTER_VPCI_CAP, rename REGISTER_VPCI_EXTENDED_CAP to REGISTER_VPCI_EXTCAP.
> * Change cleanup hook of vpci_capability_t from void to int.
> 
> v3->v4 changes
> * Delete the useless trailing dot of section ".data.vpci".
> * Add description about priority since this patch removes the initializing priority of capabilities and priority is not needed anymore.
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
> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove failed capability from list.
> * Called vpci_make_msix_hole() in the end of init_msix().
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/header.c |  3 +--
>  xen/drivers/vpci/msi.c    |  2 +-
>  xen/drivers/vpci/msix.c   |  8 +++++--
>  xen/drivers/vpci/rebar.c  |  2 +-
>  xen/drivers/vpci/vpci.c   | 46 ++++++++++++++++++++++++++++++---------
>  xen/include/xen/vpci.h    | 30 ++++++++++++++++++-------
>  xen/include/xen/xen.lds.h |  2 +-
>  7 files changed, 68 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 4b2f761c9c24..9fa1cda23151 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -872,7 +872,7 @@ static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>      return 0;
>  }
>  
> -static int cf_check init_header(struct pci_dev *pdev)
> +int vpci_init_header(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
>      uint64_t addr, size;
> @@ -1068,7 +1068,6 @@ static int cf_check init_header(struct pci_dev *pdev)
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>      return rc;
>  }
> -REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 66e5a8a116be..2d45c7867de7 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
>  
>  void vpci_dump_msi(void)
>  {
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 74211301ba10..674815ead025 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -703,9 +703,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
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
> +REGISTER_VPCI_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> index 793937449af7..9cafd80ca2c9 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_EXTCAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 8474c0e3b995..2861557e06d2 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -36,8 +36,8 @@ struct vpci_register {
>  };
>  
>  #ifdef __XEN__
> -extern vpci_register_init_t *const __start_vpci_array[];
> -extern vpci_register_init_t *const __end_vpci_array[];
> +extern vpci_capability_t *const __start_vpci_array[];
> +extern vpci_capability_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> @@ -83,6 +83,34 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static int vpci_init_capabilities(struct pci_dev *pdev)
> +{
> +    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
> +    {
> +        const vpci_capability_t *capability = __start_vpci_array[i];
> +        const unsigned int cap = capability->id;
> +        const bool is_ext = capability->is_ext;
> +        unsigned int pos;
> +        int rc;
> +
> +        if ( !is_ext )
> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +        else if ( !is_hardware_domain(pdev->domain) )
> +            continue;
> +        else
> +            pos = pci_find_ext_capability(pdev->sbdf, cap);

Nit: it's more compact if you do something like:

        unsigned int pos = 0;

        if ( !is_ext )
            pos = pci_find_cap_offset(pdev->sbdf, cap);
        else if ( is_hardware_domain(pdev->domain) )
            pos = pci_find_ext_capability(pdev->sbdf, cap);

        if ( !pos )
            continue;

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
> @@ -128,7 +156,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
>  
>  int vpci_assign_device(struct pci_dev *pdev)
>  {
> -    unsigned int i;
>      const unsigned long *ro_map;
>      int rc = 0;
>  
> @@ -159,14 +186,13 @@ int vpci_assign_device(struct pci_dev *pdev)
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
> index 61d16cc8b897..e5e3f23ca39c 100644
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
> +    int (*init)(struct pci_dev *pdev);
> +    int (*cleanup)(struct pci_dev *pdev);
> +} vpci_capability_t;
>  
>  #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
>  
> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> -#define REGISTER_VPCI_INIT(x, p)                \
> -  static vpci_register_init_t *const x##_entry  \
> -               __used_section(".data.vpci." p) = (x)
> +#define REGISTER_PCI_CAPABILITY(cap, finit, fclean, ext) \

REGISTER_VPCI_CAPABILITY() if possible (note the added V).

> +  static vpci_capability_t finit##_t = { \

static const?

> +        .id = (cap), \
> +        .init = (finit), \
> +        .cleanup = (fclean), \
> +        .is_ext = (ext), \

Indent should be 4 spaces here I think.

> +  }; \
> +  static vpci_capability_t *const finit##_entry  \
> +               __used_section(".data.vpci") = &finit##_t

IMO this should better use .rodata instead of .data.  Not that it
matters much in practice, as we place it in .rodata anyway.  Note
however you will have to move the placement of the VPCI_ARRAY in the
linker script ahead of *(.rodata.*), otherwise that section match will
consume the vPCI data.

> +
> +#define REGISTER_VPCI_CAP(cap, finit, fclean) \
> +                REGISTER_PCI_CAPABILITY(cap, finit, fclean, false)
> +#define REGISTER_VPCI_EXTCAP(cap, finit, fclean) \
> +                REGISTER_PCI_CAPABILITY(cap, finit, fclean, true)

Since you are modifying those, can use 4 spaces as indentation?
There's no need to have such padding.

Thanks, Roger.

