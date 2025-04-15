Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B646EA89AD8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952652.1348041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dpA-0002FC-LX; Tue, 15 Apr 2025 10:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952652.1348041; Tue, 15 Apr 2025 10:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dpA-0002Dg-IN; Tue, 15 Apr 2025 10:47:28 +0000
Received: by outflank-mailman (input) for mailman id 952652;
 Tue, 15 Apr 2025 10:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4dp9-0002Da-1B
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:47:27 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0456f1ee-19e7-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 12:47:25 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2295d78b45cso75278255ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:47:26 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22ac7b8b2ccsm114491095ad.70.2025.04.15.03.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 03:47:23 -0700 (PDT)
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
X-Inumbo-ID: 0456f1ee-19e7-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744714044; x=1745318844; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i8ggSNG4Ain+nVBtLmQKrY6ENfgBxO5nmTN1kEbu23I=;
        b=UiiIkrBcMUXWsdNrLKnejdtQWzHoGaYt1x1YQAF9/hVv7+OLWFvJsbWN4Ma9nrQgBO
         ruYM7+a7NdibwPMB7GRHISN9IIZI8F/OoW0FWzynOBZVGHRVxGZZtko0PLbp6N+HDkWM
         PM27v2i+qg1dmWH1lhgHXMNUqpKBv8TPU0iwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714044; x=1745318844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8ggSNG4Ain+nVBtLmQKrY6ENfgBxO5nmTN1kEbu23I=;
        b=cE+eMzI+j9Q539C13i3ylDlPNVrsnCpK0FKYiEanYBy4F2/oG67VOdwNhBxb7v3beg
         f2C5KmCxHCHgXNFBE6j7ymRhab/1Cf7dF8d5B2Hj2oEFTwQAeiVCvc6yVR4sH02NKdA0
         n8CLiLsI64JnK3rQqJoKJ51q66mcla/ou9UILzwmjqVAb2djD99ZFlMscKYrahyfWjNu
         aCn9/Kg78h4qXGW/gf+fJyBcjI4P+cgfsG42Vmme+exIzGSicYU/hC2xGZ5vG83HNBZ8
         QNzuwA5gy6znx5AyCZQ2hZ31tzwGBEQy6L/aTM/YKKgCU36213w5WgfWHNyACl0y2J8L
         l28Q==
X-Gm-Message-State: AOJu0YwKkVgnbtuV9tTqR1Meyv+hlADoNin9O82nIYTCh/DscEVniPcy
	2hRdpdqUtgzeOYkdiSCReacdAvo/pguLMCCg8QxzgG6mVStyz3Xwi4x3BAigvuQ=
X-Gm-Gg: ASbGncvAeujL+bL5JrWmGTY2LhdG+MvwluEhcEDbDXaIrqDx/w0vFGlcOjCCpFOKtE7
	bxSHgnswppmFtMiDofphtyQeYS2TCSUknnSQflAApSpnmr76FoobXqdLq00hVvW+HY3+7q9C6vF
	2l/eSPOIeB7BOkroROIzcGIyPhI3PZMRlMf9sljOVOa4s7/svVZ1/oyCU6/9j9WtkB9jEWIMz9K
	MlMIC1+BTqoJMULdKIPNmr5aKKKkcdh2OeGJtHr/FM6xCrbal3WT4p96qpcZUmsVrRxQMf5xUrx
	oyi4bzIUtqiKDc+n0MQJCXfy4dbKrJiWVrWT+wIks+lQyQ==
X-Google-Smtp-Source: AGHT+IEmLbh5IDTYF/5LL7fOBUg3vJkRKdxLbaa1/KSmhEKsTRCtAYbEnu20kQKns6gKSIT61sNd1A==
X-Received: by 2002:a17:903:1a2b:b0:21f:c67:a68a with SMTP id d9443c01a7336-22bea4c6c69mr239420195ad.31.1744714044464;
        Tue, 15 Apr 2025 03:47:24 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:47:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 4/8] vpci: Hide capability when it fails to initialize
Message-ID: <Z_45NzpRLkfLveug@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409064528.405573-5-Jiqian.Chen@amd.com>

On Wed, Apr 09, 2025 at 02:45:24PM +0800, Jiqian Chen wrote:
> When vpci fails to initialize a capability of a device, it just
> return error instead of catching and processing exception. That
> makes the entire device unusable.
> 
> So, refactor REGISTER_VPCI_INIT to contain more capability specific
> information, and use new functions to hide capability when
> initialization fails in vpci_assign_device().
> 
> Those new functions remove the failed legacy/extended capability
> from the emulated legacy/extended capability list.

I think this needs to be at least 2 different changes.

First change adds the usage of REGISTER_VPCI_{LEGACY,EXTENDED}_CAP()
helpers, while second change introduces the masking of capabilities on
initialization failure.

Otherwise review is a bit complicated.

> What's more, change the definition of init_header() since it is
> not a capability and it is needed for all devices' PCI config space.
> 
> Note: call vpci_make_msix_hole() in the end of init_msix() since the
> change of sequence of init_header() and init_msix().
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
> v1->v2 changes:
> * Removed the "priorities" of initializing capabilities since it isn't used anymore.
> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to remove failed capability from list.
> * Called vpci_make_msix_hole() in the end of init_msix().
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/header.c  |   3 +-
>  xen/drivers/vpci/msi.c     |   2 +-
>  xen/drivers/vpci/msix.c    |   8 +-
>  xen/drivers/vpci/rebar.c   |   2 +-
>  xen/drivers/vpci/vpci.c    | 175 +++++++++++++++++++++++++++++++------
>  xen/include/xen/pci_regs.h |   1 +
>  xen/include/xen/vpci.h     |  26 ++++--
>  xen/include/xen/xen.lds.h  |   2 +-
>  8 files changed, 179 insertions(+), 40 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 6833d456566b..51a67d76ad8a 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -848,7 +848,7 @@ static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>      return 0;
>  }
>  
> -static int cf_check init_header(struct pci_dev *pdev)
> +int vpci_init_header(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
>      uint64_t addr, size;
> @@ -1044,7 +1044,6 @@ static int cf_check init_header(struct pci_dev *pdev)
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>      return rc;
>  }
> -REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 66e5a8a116be..ca89ae9b9c22 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi);
>  
>  void vpci_dump_msi(void)
>  {
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 6bd8c55bb48e..6537374c79a0 100644
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
> +    return rc
>  }
> -REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> index 793937449af7..79858e5dc92f 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_EXTEND_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 1e6aa5d799b9..f1f125bfdab1 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -35,9 +35,25 @@ struct vpci_register {
>      uint32_t rsvdz_mask;
>  };
>  
> +static int vpci_register_cmp(const struct vpci_register *r1,
> +                             const struct vpci_register *r2)
> +{
> +    /* Return 0 if registers overlap. */
> +    if ( r1->offset < r2->offset + r2->size &&
> +         r2->offset < r1->offset + r1->size )
> +        return 0;
> +    if ( r1->offset < r2->offset )
> +        return -1;
> +    if ( r1->offset > r2->offset )
> +        return 1;
> +
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +
>  #ifdef __XEN__
> -extern vpci_register_init_t *const __start_vpci_array[];
> -extern vpci_register_init_t *const __end_vpci_array[];
> +extern vpci_capability_t *const __start_vpci_array[];
> +extern vpci_capability_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> @@ -83,6 +99,133 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static void vpci_capability_mask(struct pci_dev *pdev,
> +                                 const unsigned int cap)
> +{
> +    const unsigned int size = 1;
> +    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
> +    const struct vpci_register r = { .offset = offset, .size = size };
> +    struct vpci_register *rm;
> +    struct vpci *vpci = pdev->vpci;
> +
> +    spin_lock(&vpci->lock);
> +    list_for_each_entry ( rm, &vpci->handlers, node )
> +    {
> +        int cmp = vpci_register_cmp(&r, rm);
> +
> +        if ( !cmp && rm->offset == offset && rm->size == size )
> +        {
> +            struct vpci_register *pre = list_entry(rm->node.prev,
> +                                                   struct vpci_register,
> +                                                   node);
> +            struct vpci_register *next = list_entry(rm->node.next,
> +                                                    struct vpci_register,
> +                                                    node);
> +
> +            pre->private = next->private;
> +
> +            /* PCI_CAP_LIST_ID register of current capability */
> +            list_del(&rm->node);
> +            /* PCI_CAP_LIST_NEXT register of current capability */
> +            list_del(&next->node);
> +            spin_unlock(&vpci->lock);

Are you sure this works as intended?  The list is sorted, so if there
further handlers in between the two capabilities, like when handling
MSI capability, the next handler in the list won't point to the next
capability list handler.

> +
> +            xfree(rm);
> +            xfree(next);
> +            return;
> +        }
> +        if ( cmp <= 0 )
> +            break;
> +    }
> +    spin_unlock(&vpci->lock);
> +}
> +
> +static void vpci_ext_capability_mask(struct pci_dev *pdev,
> +                                     const unsigned int cap)
> +{
> +    const unsigned int size = 4;
> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
> +    const struct vpci_register r = { .offset = offset, .size = size };
> +    struct vpci_register *rm;
> +    struct vpci *vpci = pdev->vpci;
> +
> +    spin_lock(&vpci->lock);
> +    list_for_each_entry ( rm, &vpci->handlers, node )
> +    {
> +        int cmp = vpci_register_cmp(&r, rm);
> +
> +        if ( !cmp && rm->offset == offset && rm->size == size )
> +        {
> +            struct vpci_register *pre;
> +            u32 pre_header, header = (u32)(uintptr_t)rm->private;
> +
> +            if ( offset == 0x100U && PCI_EXT_CAP_NEXT(header) == 0 )

It would be safer to check for next < 0x100 rather than explicitly
0.

> +            {
> +                rm->private = (void *)(uintptr_t)0;
> +                spin_unlock(&vpci->lock);
> +                return;
> +            }
> +            else if ( offset == 0x100U )

There's no need for the else branch, as the previous if has a return.

> +            {
> +                pre = rm;
> +                rm = list_entry(rm->node.next, struct vpci_register, node);
> +                pre->private = rm->private;
> +            }
> +            else
> +            {
> +                pre = list_entry(rm->node.prev, struct vpci_register, node);
> +                pre_header = (u32)(uintptr_t)pre->private;
> +                pre->private =
> +                    (void *)(uintptr_t)((pre_header & !PCI_EXT_CAP_NEXT_MASK) |

I think you want ~PCI_EXT_CAP_NEXT_MASK rather than !PCI_EXT_CAP_NEXT_MASK?

> +                                        (header & PCI_EXT_CAP_NEXT_MASK));
> +            }
> +            list_del(&rm->node);
> +            spin_unlock(&vpci->lock);
> +            xfree(rm);
> +            return;

Kind of the same complaint I had on the previous patch, this seems to
assume that capability handlers are always consecutive in the list of
handlers, which I don't think it's the case.

> +        }
> +        if ( cmp <= 0 )
> +            break;
> +    }
> +    spin_unlock(&vpci->lock);
> +}
> +
> +static void vpci_init_capabilities(struct pci_dev *pdev)
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
> +        if ( is_ext )
> +            pos = pci_find_ext_capability(pdev->sbdf, cap);
> +        else
> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +
> +        if ( !pos )
> +            continue;
> +
> +        rc = capability->init(pdev);
> +
> +        if ( rc )
> +        {
> +            printk(XENLOG_WARNING "%pd %pp: %s cap %u init fail rc=%d, mask it\n",
> +                   pdev->domain, &pdev->sbdf,
> +                   is_ext ? "extended" : "legacy", cap, rc);
> +            if ( is_ext )
> +                vpci_ext_capability_mask(pdev, cap);
> +            else
> +                vpci_capability_mask(pdev, cap);
> +        }
> +    }
> +}
> +
>  void vpci_deassign_device(struct pci_dev *pdev)
>  {
>      unsigned int i;
> @@ -128,7 +271,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
>  
>  int vpci_assign_device(struct pci_dev *pdev)
>  {
> -    unsigned int i;
>      const unsigned long *ro_map;
>      int rc = 0;
>  
> @@ -159,12 +301,11 @@ int vpci_assign_device(struct pci_dev *pdev)
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

If you use the out label here you can remove the __maybe_unused
attribute from it.

> +
> +    vpci_init_capabilities(pdev);
>  
>   out: __maybe_unused;
>      if ( rc )
> @@ -174,22 +315,6 @@ int vpci_assign_device(struct pci_dev *pdev)
>  }
>  #endif /* __XEN__ */
>  
> -static int vpci_register_cmp(const struct vpci_register *r1,
> -                             const struct vpci_register *r2)
> -{
> -    /* Return 0 if registers overlap. */
> -    if ( r1->offset < r2->offset + r2->size &&
> -         r2->offset < r1->offset + r1->size )
> -        return 0;
> -    if ( r1->offset < r2->offset )
> -        return -1;
> -    if ( r1->offset > r2->offset )
> -        return 1;
> -
> -    ASSERT_UNREACHABLE();
> -    return 0;
> -}
> -
>  /* Dummy hooks, writes are ignored, reads return 1's */
>  static uint32_t cf_check vpci_ignored_read(
>      const struct pci_dev *pdev, unsigned int reg, void *data)
> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> index 27b4f44eedf3..5fe6653fded4 100644
> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -449,6 +449,7 @@
>  #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
>  #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
>  #define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
> +#define PCI_EXT_CAP_NEXT_MASK		0xFFC00000U
>  
>  #define PCI_EXT_CAP_ID_ERR	1
>  #define PCI_EXT_CAP_ID_VC	2
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 807401b2eaa2..5016ded64d89 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -13,11 +13,11 @@ typedef uint32_t vpci_read_t(const struct pci_dev *pdev, unsigned int reg,
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
> +} vpci_capability_t;
>  
>  #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
>  
> @@ -29,9 +29,19 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> -#define REGISTER_VPCI_INIT(x, p)                \
> -  static vpci_register_init_t *const x##_entry  \
> -               __used_section(".data.vpci." p) = (x)
> +#define REGISTER_VPCI_CAP(cap, x, ext) \
> +  static vpci_capability_t x##_t = { \
> +        .id = (cap), \
> +        .init = (x), \
> +        .is_ext = (ext), \
> +  }; \
> +  static vpci_capability_t *const x##_entry  \
> +               __used_section(".data.vpci.") = &(x##_t)
> +
> +#define REGISTER_VPCI_LEGACY_CAP(cap, x) REGISTER_VPCI_CAP(cap, x, false)
> +#define REGISTER_VPCI_EXTEND_CAP(cap, x) REGISTER_VPCI_CAP(cap, x, true)

Nit: I would use EXTENDED here, there's no need to keep both defines
the same length.

Thanks, Roger.

