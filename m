Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5BAAC23D
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 13:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977058.1364145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGHy-0008QC-1a; Tue, 06 May 2025 11:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977058.1364145; Tue, 06 May 2025 11:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGHx-0008Nb-Uc; Tue, 06 May 2025 11:16:41 +0000
Received: by outflank-mailman (input) for mailman id 977058;
 Tue, 06 May 2025 11:16:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCGHw-0007yc-IX
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 11:16:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 945ea082-2a6b-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 13:16:38 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so47617525e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 04:16:38 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b89ee39esm164579905e9.21.2025.05.06.04.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 04:16:37 -0700 (PDT)
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
X-Inumbo-ID: 945ea082-2a6b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746530198; x=1747134998; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOz+2FH14WmCp86+v7BdR10VKsnfBPcIlT2o9AYI1j8=;
        b=mlJblhf/ISPfib71GxcIJ/Ouu1JDakxZl2vdxYwDrQvAMXFkznpwsww6y+nfek25gH
         HKMIcp+P5R0QpU8k/xJk0tfTKd8bK0KfA/Eo8fes8+aMVQGRotadcBlwCnKvP5qabU+6
         ZvWi4ctkiA8k3ttGxjxZGS2MeASMC2CH2jKKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530198; x=1747134998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOz+2FH14WmCp86+v7BdR10VKsnfBPcIlT2o9AYI1j8=;
        b=cFFM3riibQGYsXbYPqh+S8Yvgy2gvkRaZwQN4aRYJ957f1icbCdXJPJc/DCUEgCLnA
         lUYxu/3sQIIQSBCl9LrzRb4OokHsAbuR+bCZ67vaR+89B/7aVaCipBzxMsrYvmypAJBs
         67uhjEGo52mjiK5SoQnJvD9cxVgWYiBizVpEX0B75SYiikGvIZwnNwQYAtlaPJTKMq9g
         qmqS1AVg4qJsv2FuD1emHMbvg04K5JUllvkN3ZARAE7dWudDxFYvYaQ4LtjJFRSieCad
         jstk9gpm8LHr286BzUkKSATCv63PRg0eweV2A+++HnqeTy8K5MPVUrOrfdsNSnmL3ds6
         0I/A==
X-Gm-Message-State: AOJu0YwDrX6/bSBOjioDXj3msdUPAne6NpZdsB9dIz7pGenJOvY4ZRXi
	K+RBWyT32qk/l9JfVXlbwteoGwNa7XEbhJcYEP+nSGUQXvjy45KFfusS1hx6IW8=
X-Gm-Gg: ASbGncsh8ol5fWX2fASB4E8lDhaSIsBdrbY/YSvIR7xAFTM3BgIPBo3JsjrdJFGGFiz
	yXhkdXGJSN1fE0TEchd331/nDCk5/sVi8oLlhryLp8NhWM7Uzqs3Jg6/uVoR/JKVyEf77veA25B
	U47gGSfKNkdmZB3D4WqYwWiuzj6FuW3WSxYxnt7Px/zty7ff/9UO4CovTyAQ8b1XSJnd+sKNIeL
	eQkAisD07kktcVjHVJseW4W9syf7rmhlidfyf51Fl340erKDKuLTfpLZU6pe4+nW0n5kb+iz2+E
	d1CJSJxnyE8UwmJOqOIkeGF+n9MIX2dTr7j3zANT/kNDAw==
X-Google-Smtp-Source: AGHT+IFwT0GKnkfRq942f0gj0qAW9bTOBr4A1kjgbQpkyZViemGMq9+1XksgvswWPdvJYiZGm0Pxig==
X-Received: by 2002:a05:600c:3d8e:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-441c4919de9mr91549845e9.24.1746530198257;
        Tue, 06 May 2025 04:16:38 -0700 (PDT)
Date: Tue, 6 May 2025 13:16:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: Re: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for
 guests
Message-ID: <aBnvlY3Dfc_Wpljw@macbook.lan>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
 <20250418185840.335816-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418185840.335816-3-stewart.hildebrand@amd.com>

Hello,

Sorry I haven't looked at this before, I was confused with the cover
letter having ARM in the subject and somehow assumed all the code was
ARM related.

On Fri, Apr 18, 2025 at 02:58:37PM -0400, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are two originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 
> In vpci_read(), use the access size to create a mask so as to not set
> any bits above the access size when returning an error.

I see this here, and the code below, yet I'm not following why this is
a requirement for the code added here.  It seems like an unrelated
change?

> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> In v20:
> * call translate_virtual_device() from within locked context of
>   vpci_{read,write}
> * update commit message
> In v19:
> * move locking to pre-patch
> In v18:
> * address warning in vpci test suite
> In v17:
> * move lock to inside vpci_translate_virtual_device()
> * acks were previously given for Arm [0] and vPCI [1], but since it was
>   two releases ago and the patch has changed, I didn't pick them up
> 
> [0] https://lore.kernel.org/xen-devel/4afe33f2-72e6-4755-98ce-d7f9da374e90@xen.org/
> [1] https://lore.kernel.org/xen-devel/Zk70udmiriruMt0r@macbook/
> 
> In v15:
> - base on top of ("arm/vpci: honor access size when returning an error")
> In v11:
> - Fixed format issues
> - Added ASSERT_UNREACHABLE() to the dummy implementation of
> vpci_translate_virtual_device()
> - Moved variable in vpci_sbdf_from_gpa(), now it is easier to follow
> the logic in the function
> Since v9:
> - Commend about required lock replaced with ASSERT()
> - Style fixes
> - call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
> Since v8:
> - locks moved out of vpci_translate_virtual_device()
> Since v6:
> - add pcidevs locking to vpci_translate_virtual_device
> - update wrt to the new locking scheme
> Since v5:
> - add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
>   case to simplify ifdefery
> - add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
> - reset output register on failed virtual SBDF translation
> Since v4:
> - indentation fixes
> - constify struct domain
> - updated commit message
> - updates to the new locking scheme (pdev->vpci_lock)
> Since v3:
> - revisit locking
> - move code to vpci.c
> Since v2:
>  - pass struct domain instead of struct vcpu
>  - constify arguments where possible
>  - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  tools/tests/vpci/emul.h |  2 +-
>  xen/arch/arm/vpci.c     |  4 +++
>  xen/drivers/vpci/vpci.c | 73 +++++++++++++++++++++++++++++++++++++----
>  3 files changed, 71 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
> index da446bba86b4..dd048cffbf9d 100644
> --- a/tools/tests/vpci/emul.h
> +++ b/tools/tests/vpci/emul.h
> @@ -89,7 +89,7 @@ typedef union {
>  
>  #define __hwdom_init
>  
> -#define is_hardware_domain(d) ((void)(d), false)
> +#define is_hardware_domain(d) ((void)(d), true)
>  
>  #define has_vpci(d) true
>  
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index b63a356bb4a8..618ddb7f6547 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -34,6 +34,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      /* data is needed to prevent a pointer cast on 32bit */
>      unsigned long data;
>  
> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
> +
>      if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>                          1U << info->dabt.size, &data) )
>      {
> @@ -52,6 +54,8 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>      struct pci_host_bridge *bridge = p;
>      pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>  
> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
> +
>      return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                             1U << info->dabt.size, r);
>  }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 1e6aa5d799b9..fc409f3fc346 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -174,6 +174,41 @@ int vpci_assign_device(struct pci_dev *pdev)
>  }
>  #endif /* __XEN__ */
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +static const struct pci_dev *translate_virtual_device(const struct domain *d,
> +                                                      pci_sbdf_t *sbdf)
> +{
> +    const struct pci_dev *pdev;
> +
> +    ASSERT(!is_hardware_domain(d));
> +    ASSERT(rw_is_locked(&d->pci_lock));
> +
> +    for_each_pdev ( d, pdev )
> +    {
> +        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
> +        {
> +            /* Replace guest SBDF with the physical one. */
> +            *sbdf = pdev->sbdf;
> +            return pdev;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +#else
> +static const struct pci_dev *translate_virtual_device(const struct domain *d,
> +                                                      pci_sbdf_t *sbdf)
> +{
> +    ASSERT_UNREACHABLE();
> +
> +    return NULL;
> +}
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */

Jan's suggestion avoids having duplicate headers, and results in less
code overall:

static const struct pci_dev *translate_virtual_device(const struct domain *d,
                                                      pci_sbdf_t *sbdf)
{
#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
    const struct pci_dev *pdev;
    ...
#else /* !CONFIG_HAS_VPCI_GUEST_SUPPORT */
    ASSERT_UNREACHABLE()
#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */

    return NULL;
}

I've not overly fuzzed either way, but if changes are required you
might as well change to this form.

>  static int vpci_register_cmp(const struct vpci_register *r1,
>                               const struct vpci_register *r2)
>  {
> @@ -438,7 +473,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> -    uint32_t data = ~(uint32_t)0;
> +    uint32_t data = 0xffffffffU >> (32 - 8 * size);

This seems kind of unrelated to the rest of the code in the patch,
why is this needed?  Isn't it always fine to return all ones, and let
the caller truncate to the required size?

Otherwise the code in vpci_read_hw() also needs to be adjusted.  And
you can likely use GENMASK(size * 8, 0) as it's easier to read.

>  
>      if ( !size )
>      {
> @@ -453,9 +488,21 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>       * pci_lock is sufficient.
>       */
>      read_lock(&d->pci_lock);
> -    pdev = pci_get_pdev(d, sbdf);
> -    if ( !pdev && is_hardware_domain(d) )
> -        pdev = pci_get_pdev(dom_xen, sbdf);
> +    if ( is_hardware_domain(d) )
> +    {
> +        pdev = pci_get_pdev(d, sbdf);
> +        if ( !pdev )
> +            pdev = pci_get_pdev(dom_xen, sbdf);
> +    }
> +    else
> +    {
> +        pdev = translate_virtual_device(d, &sbdf);
> +        if ( !pdev )
> +        {
> +            read_unlock(&d->pci_lock);
> +            return data;
> +        }

You don't need this checking here, as the check below will already be
enough AFAICT, iow:

    if ( is_hardware_domain(d) )
    {
        pdev = pci_get_pdev(d, sbdf);
        if ( !pdev )
            pdev = pci_get_pdev(dom_xen, sbdf);
    }
    else
        pdev = translate_virtual_device(d, &sbdf);

    if ( !pdev || !pdev->vpci )
    {
        read_unlock(&d->pci_lock);
        return vpci_read_hw(sbdf, reg, size);
    }

Achieves the same and is more compact by having a single return for
all the possible cases?  Same for the write case below.

Thanks, Roger.

