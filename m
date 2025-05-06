Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57955AAC831
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 16:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977450.1364475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJQ3-0003t4-TI; Tue, 06 May 2025 14:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977450.1364475; Tue, 06 May 2025 14:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJQ3-0003qd-QC; Tue, 06 May 2025 14:37:15 +0000
Received: by outflank-mailman (input) for mailman id 977450;
 Tue, 06 May 2025 14:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCJQ2-0003qX-28
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 14:37:14 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b594df-2a87-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 16:37:12 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so23137095e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 07:37:12 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099b17260sm14274359f8f.98.2025.05.06.07.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 07:37:11 -0700 (PDT)
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
X-Inumbo-ID: 98b594df-2a87-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746542231; x=1747147031; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NaPnOl3C/LCF5BaQ8cp69/hEOJ4YJsEJE/eGJQ0AKkE=;
        b=eMwHD2cOGka8plkRk1hPyKWOjoGQVNAPGHHZeIC8xyr2JC2DLIMHaQAiMfjvsor/CX
         tw2RdAuhJ+uIZRhlFYYQuXgZT+4/MhO2uPtjUcI9hbUz8+sfXCWRlR35WfLLHSmeMMNO
         vaa3PE5l7KdTQbQrrBnvLWJDz2rVIvGBvRR+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542231; x=1747147031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NaPnOl3C/LCF5BaQ8cp69/hEOJ4YJsEJE/eGJQ0AKkE=;
        b=uTqqJlFcmEWpizO4elVQBLLRYKhXi0f/2wB63dacuqRc3BoYTt6GFSp8qbnxQ70Z+W
         db+b9ITE+fY2pLrCPRMg2mPwz7gJmVo2LrrsFGqgw0y6DtqqN+0DoLVNt9FP75SEgzoy
         B9QegTcTjX1Epo+REwpyfTEjRTlpHGIrNCFKDH9V1RcOCgeoLviI3K/BN/6WWvplf/Lt
         hOd7P9CBFbeaAkXbBqt5Z5tSNxmnLrqinozY5Nw3BOP7nOCBD6iviIPk7zqL5BCm72Dd
         LXuaas2Dp1ymWdkCtCsDuSXq8ass3aQZe1c2yHPKLhuRxfH3IwSbaw6v+vQe0Dtbw81I
         uyVg==
X-Gm-Message-State: AOJu0Yx0EY2CEUWb4T7HN+9r6wPtuXcF9cJPeMBgtgv1qOx3Tk+t91Sn
	wrbug+F8mTz1f1MdNV7wViwtgIQfsoIxBFFKTyE6GdZZCfvn2BgQneH+cZRMeNw=
X-Gm-Gg: ASbGncuzobGO9DmUT76JUulLrhp/tm+xhoq1JEtRfmrQKrLZ/REUwcBUTQ9UzRun2P0
	jdekW2CuJ4CwK9GWuON1vgITxwPgGOdHJ6eTeScNNxUZhOk6GNJr7mqm9Oit2HcstdY3FeyqAfO
	U8nN36grKk64LYrXfhm9gzqdZ/k/WWWVT+F5CzFR8epTqZuUMBEPG3+MBQYLNiS1nlBy41ntoso
	jejZxFI1g67xv5x2bw8IigW4WOj8dRbbsYcQzEY01xXGk6Xtwl43+YB7TX2o2NtJb4XVEuPAsPl
	N9+yF1yXKaWaHYwBr2tMzuaVF9W5em5ZoQKnlEEjaUrP+g==
X-Google-Smtp-Source: AGHT+IEZ2ehwr9IJ+BeqMFt489WJ6ggqJvhgYMqndf5EAezS7pcvZLjvQKOaBVk6I27nKnDZqWo+ig==
X-Received: by 2002:a05:600c:b99:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-441d04f458emr28299175e9.1.1746542231411;
        Tue, 06 May 2025 07:37:11 -0700 (PDT)
Date: Tue, 6 May 2025 16:37:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aBoelpSu4xmJH2Eo@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-6-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-6-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:18:57PM +0800, Jiqian Chen wrote:
> Refactor REGISTER_VPCI_INIT to contain more capability specific
> information, this is benifit for follow-on changes to hide capability
> which initialization fails.
> 
> What's more, change the definition of init_header() since it is
> not a capability and it is needed for all devices' PCI config space.
> 
> Note:
> Call vpci_make_msix_hole() in the end of init_msix() since the
> change of sequence of init_header() and init_msix().
> The fini hook will be implemented in follow-on changes.

I would maybe add that the cleanup hook is also added in this change,
even if it's still unused.  Further changes will make use of it.

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
>  xen/drivers/vpci/vpci.c   | 48 +++++++++++++++++++++++++++++++--------
>  xen/include/xen/vpci.h    | 28 ++++++++++++++++-------
>  xen/include/xen/xen.lds.h |  2 +-
>  7 files changed, 68 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ee94ad8e5037..afe4bcdfcb30 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -842,7 +842,7 @@ static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>      return 0;
>  }
>  
> -static int cf_check init_header(struct pci_dev *pdev)
> +int vpci_init_header(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
>      uint64_t addr, size;
> @@ -1038,7 +1038,6 @@ static int cf_check init_header(struct pci_dev *pdev)
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>      return rc;
>  }
> -REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 66e5a8a116be..ea7dc0c060ea 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
>  
>  void vpci_dump_msi(void)
>  {
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 6bd8c55bb48e..0228ffd9fda9 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -751,9 +751,13 @@ static int cf_check init_msix(struct pci_dev *pdev)
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
> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> index 793937449af7..026f8f7972d9 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_EXTENDED_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, NULL);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 3349b98389b8..5474b66668c1 100644
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
> @@ -83,6 +83,36 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
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
> +        if ( !is_hardware_domain(pdev->domain) && is_ext )
> +            continue;
> +
> +        if ( !is_ext )
> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +        else
> +            pos = pci_find_ext_capability(pdev->sbdf, cap);
> +
> +        if ( !pos || !capability->init )

Isn't it bogus to have a vpci_capability_t entry with a NULL init
function?

> +            continue;
> +
> +        rc = capability->init(pdev);
> +

I wouldn't add a newline between the function call and checking the
return value, but that's just my taste.

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
> @@ -128,7 +158,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
>  
>  int vpci_assign_device(struct pci_dev *pdev)
>  {
> -    unsigned int i;
>      const unsigned long *ro_map;
>      int rc = 0;
>  
> @@ -159,14 +188,13 @@ int vpci_assign_device(struct pci_dev *pdev)
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
> index 9d47b8c1a50e..8e815b418b7d 100644
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
> +    void (*fini)(struct pci_dev *pdev);
> +} vpci_capability_t;
>  
>  #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
>  
> @@ -29,9 +30,20 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> -#define REGISTER_VPCI_INIT(x, p)                \
> -  static vpci_register_init_t *const x##_entry  \
> -               __used_section(".data.vpci." p) = (x)
> +#define REGISTER_VPCI_CAP(cap, x, y, ext) \

x and y are not very helpful identifier names, better use some more
descriptive naming, init and fini?  Same below.

> +  static vpci_capability_t x##_t = { \
> +        .id = (cap), \
> +        .init = (x), \
> +        .fini = (y), \
> +        .is_ext = (ext), \
> +  }; \
> +  static vpci_capability_t *const x##_entry  \
> +               __used_section(".data.vpci.") = &(x##_t)
> +
> +#define REGISTER_VPCI_LEGACY_CAP(cap, x, y) REGISTER_VPCI_CAP(cap, x, y, false)
> +#define REGISTER_VPCI_EXTENDED_CAP(cap, x, y) REGISTER_VPCI_CAP(cap, x, y, true)
> +
> +int __must_check vpci_init_header(struct pci_dev *pdev);
>  
>  /* Assign vPCI to device by adding handlers. */
>  int __must_check vpci_assign_device(struct pci_dev *pdev);
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index 16a9b1ba03db..c73222112dd3 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -187,7 +187,7 @@
>  #define VPCI_ARRAY               \
>         . = ALIGN(POINTER_ALIGN); \
>         __start_vpci_array = .;   \
> -       *(SORT(.data.vpci.*))     \
> +       *(.data.vpci.*)     \

Aside from Jan comment, please keep the '\' aligned with the others on
the block.

Thanks, Roger.

