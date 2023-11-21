Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B397F3205
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637893.993964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SPw-0000nK-0O; Tue, 21 Nov 2023 15:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637893.993964; Tue, 21 Nov 2023 15:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SPv-0000ks-Td; Tue, 21 Nov 2023 15:11:59 +0000
Received: by outflank-mailman (input) for mailman id 637893;
 Tue, 21 Nov 2023 15:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5SPu-0000jf-PH
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:11:58 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f727012-8880-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:11:56 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b27726369so7311535e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 07:11:56 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p11-20020adfcc8b000000b0032d9337e7d1sm14702466wrj.11.2023.11.21.07.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 07:11:55 -0800 (PST)
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
X-Inumbo-ID: 4f727012-8880-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700579516; x=1701184316; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fqL8gzSxI5AUNBfi2ag+AXUm45VP8GmQPWCZvSXfysU=;
        b=NRPO+pHumBlhGiThZnc7Lrcu8E3rSiYHmnLWhCIpYpNPsQcelgDpZAVDSORspUzdBV
         3StkqnMXQKtPiLY2L4QE7NQzrW5UIljmGyN6H/s/HOuUWulm/h7EQ6Yzz46Vs1wxn7DN
         f0S7tHjIepLbXVG+9mnLATjpD9hEhKQhmIU04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700579516; x=1701184316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqL8gzSxI5AUNBfi2ag+AXUm45VP8GmQPWCZvSXfysU=;
        b=fTXWTgNZ/TSAPeSiiCPYUto3+7bGKsojinJ5yU4CdgPlkhKTizqRBDCBMVG5cSDEdN
         uXha00nc3eIgMoEhwyVb3RaDFET2ipeiqTrL96bmguDesJRJpo77U/UEkMVI5pcjUtvL
         ovauNZgoxPKdQHm7SgYQSVYb5az/BKA2zdaZYZDvZdgRsWjrwR2qrGeeuUOOGFcZTISu
         x4zAWMfKkXM6RSEC91KtDhwaWaRpikVuo5/k9Y0Plo+22xuiPz2xyVEbUwl5WAnU0PoG
         Eks+4+V6Lau1/yiib7gfOgdfh9btMTIL133qKLjI49I7173XWS2tkd3ZaJYM+DukueJP
         401A==
X-Gm-Message-State: AOJu0YzYD5vGLYQ9zayS5l+VjJt/dL40csWO1B5kOpSjWZxKFIA7RHKd
	cXB++fGWP9YbV6Qauy1Xe3XqHQ==
X-Google-Smtp-Source: AGHT+IEGR9SuOzmpUb6Mftzv09Hh1tdN4gUhRXU70GDQalhdJup5sofYz7LsMp5wTAnJRrn15TsIww==
X-Received: by 2002:a5d:47cf:0:b0:32f:99f4:ebb5 with SMTP id o15-20020a5d47cf000000b0032f99f4ebb5mr8841586wrc.19.1700579516071;
        Tue, 21 Nov 2023 07:11:56 -0800 (PST)
Date: Tue, 21 Nov 2023 16:11:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v10 14/17] xen/arm: translate virtual PCI bus topology
 for guests
Message-ID: <ZVzIul9HbSMbWkXW@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-15-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012220854.2736994-15-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:18PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are three  originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 3. Emulated host PCI bridge access. It doesn't exist in the physical
> topology, e.g. it can't be mapped to some physical host bridge.
> So, all access to the host bridge itself needs to be trapped and
> emulated.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
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
>  xen/arch/arm/vpci.c     | 51 ++++++++++++++++++++++++++++++++---------
>  xen/drivers/vpci/vpci.c | 25 +++++++++++++++++++-
>  xen/include/xen/vpci.h  | 10 ++++++++
>  3 files changed, 74 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 3bc4bb5508..58e2a20135 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -7,31 +7,55 @@
>  
>  #include <asm/mmio.h>
>  
> -static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
> -                                     paddr_t gpa)
> +static bool_t vpci_sbdf_from_gpa(struct domain *d,

s/bool_t/bool/

> +                                 const struct pci_host_bridge *bridge,
> +                                 paddr_t gpa, pci_sbdf_t *sbdf)
>  {
> -    pci_sbdf_t sbdf;
> +    ASSERT(sbdf);
>  
>      if ( bridge )
>      {
> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
> -        sbdf.seg = bridge->segment;
> -        sbdf.bus += bridge->cfg->busn_start;
> +        sbdf->sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
> +        sbdf->seg = bridge->segment;
> +        sbdf->bus += bridge->cfg->busn_start;
>      }
>      else
> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
> -
> -    return sbdf;
> +    {
> +        bool translated;
> +
> +        /*
> +         * For the passed through devices we need to map their virtual SBDF
> +         * to the physical PCI device being passed through.
> +         */
> +        sbdf->sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
> +        read_lock(&d->pci_lock);
> +        translated = vpci_translate_virtual_device(d, sbdf);
> +        read_unlock(&d->pci_lock);
> +
> +        if ( !translated )
> +        {
> +            return false;
> +        }
> +    }
> +    return true;
>  }

I would make translated a top-level variable:

{
    bool translated = true;

    if ( bridge )
        ...
    else
        ...
        translated = vpci_translate_virtual_device(d, sbdf);
        ....

    return translated;
}

As that IMO makes the logic easier to follow.

>  
>  static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>                            register_t *r, void *p)
>  {
>      struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf;
>      /* data is needed to prevent a pointer cast on 32bit */
>      unsigned long data;
>  
> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
> +
> +    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
> +    {
> +        *r = ~0ul;

Uppercase suffixes.

> +        return 1;
> +    }
> +
>      if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>                          1U << info->dabt.size, &data) )
>      {
> @@ -48,7 +72,12 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>                             register_t r, void *p)
>  {
>      struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf;
> +
> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
> +
> +    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
> +        return 1;
>  
>      return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                             1U << info->dabt.size, r);
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 7c46a2d3f4..0dee5118d6 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -80,6 +80,30 @@ static int add_virtual_device(struct pci_dev *pdev)
>      return 0;
>  }
>  
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
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
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
>  void vpci_deassign_device(struct pci_dev *pdev)
> @@ -175,7 +199,6 @@ int vpci_assign_device(struct pci_dev *pdev)
>  
>      return rc;
>  }
> -
>  #endif /* __XEN__ */
>  
>  static int vpci_register_cmp(const struct vpci_register *r1,
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 4a53936447..e9269b37ac 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -282,6 +282,16 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
>  }
>  #endif
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf);
> +#else
> +static inline bool vpci_translate_virtual_device(const struct domain *d,
> +                                                 pci_sbdf_t *sbdf)
> +{

I think you want to add an ASSERT_UÇNREACHABLE() here, as I would
expect if there's no build in vPCI guest support we would never get
here?

Thanks, Roger.

