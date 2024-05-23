Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AF18CCD4B
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728132.1132973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3BN-0007fe-Uk; Thu, 23 May 2024 07:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728132.1132973; Thu, 23 May 2024 07:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3BN-0007d4-Rp; Thu, 23 May 2024 07:48:13 +0000
Received: by outflank-mailman (input) for mailman id 728132;
 Thu, 23 May 2024 07:48:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA3BM-00074k-Sm
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:48:12 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd517669-18d8-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 09:48:11 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-420298ff5b1so68226185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 00:48:11 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad037sm35879240f8f.71.2024.05.23.00.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 00:48:10 -0700 (PDT)
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
X-Inumbo-ID: cd517669-18d8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716450490; x=1717055290; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q9My7+QtGWydpbmgsayo6RoJGxa1O7HSU/jPdnD4aTY=;
        b=rGJfVkisUexLlLu6KqnUJNflpVW8TJogvjtgSMtJ+H+yoYeje7R9OryBjWQ98v5z8f
         JacU53fm5KDR5L9q50APUserea5ib6oQbwn2EjawTTIIRs3m4GSC/JK/GqOxPCTjwDS6
         8NE+cP6O4GnilW4jT33rUfTU2r0LByyP6NXE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716450490; x=1717055290;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q9My7+QtGWydpbmgsayo6RoJGxa1O7HSU/jPdnD4aTY=;
        b=Vd9xcoQqQQ50equIbCGkS/BIFOcFMaQxgc1fZkTNxuu/8K0NEpBqd/ggh8Xr+IVewr
         FppwEj/NkYVTflQu4+RGMLU9BekjfO6M0zFXOFUt1IqlmkKBriezXbpNnq7nP9TCEcu4
         hU7V8Tf8+qgE7d1V4uFkDuU2A4y6yFuhVDyUEMtxBouCdziqWNxuAetU53a/PQ4F3/ly
         NQQ18D1jvreRMUNZ7PZWwwkES3uyr0FeC5Hn0fdnK+VEHtaUzbD1CStzgIh4jjUpJui3
         DdBnro7Xnc/ud592onyEqqUcNmqOdyn/IaIX7HrDhHHQY1ZNYrM8FTFur6KcIsnlk25t
         5Xig==
X-Gm-Message-State: AOJu0Yyf3G7BLDSWfMYRrHcGgDsbKrPYUzDod0X2lSrffVN08CA3b4Uw
	dhsI8sANkEDp9VUbBFt2C5j/azsE+746P2zM75u1E3UDkEc/9FGoe01MWO1SWOXESmspD13Mygy
	K
X-Google-Smtp-Source: AGHT+IHtWneH+zu/faamtrwyw2Wq4EhN9vOTIYrP0EAaHWSvdOMxmNnnceRBUL+bonHSPZ8YPo67CQ==
X-Received: by 2002:a5d:5447:0:b0:354:d098:8d67 with SMTP id ffacd0b85a97d-354d8da2372mr3411276f8f.57.1716450490485;
        Thu, 23 May 2024 00:48:10 -0700 (PDT)
Date: Thu, 23 May 2024 09:48:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v16 4/5] xen/arm: translate virtual PCI bus topology for
 guests
Message-ID: <Zk70udmiriruMt0r@macbook>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-5-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240522225927.77398-5-stewart.hildebrand@amd.com>

On Wed, May 22, 2024 at 06:59:23PM -0400, Stewart Hildebrand wrote:
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
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One unrelated question below.

> ---
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
>  xen/arch/arm/vpci.c     | 45 ++++++++++++++++++++++++++++++++---------
>  xen/drivers/vpci/vpci.c | 24 ++++++++++++++++++++++
>  xen/include/xen/vpci.h  | 12 +++++++++++
>  3 files changed, 71 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index b63a356bb4a8..516933bebfb3 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -7,33 +7,53 @@
>  
>  #include <asm/mmio.h>
>  
> -static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
> -                                     paddr_t gpa)
> +static bool vpci_sbdf_from_gpa(struct domain *d,
> +                               const struct pci_host_bridge *bridge,
> +                               paddr_t gpa, pci_sbdf_t *sbdf)
>  {
> -    pci_sbdf_t sbdf;
> +    bool translated = true;
> +
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
> +    {
> +        /*
> +         * For the passed through devices we need to map their virtual SBDF
> +         * to the physical PCI device being passed through.
> +         */
> +        sbdf->sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
> +        read_lock(&d->pci_lock);
> +        translated = vpci_translate_virtual_device(d, sbdf);
> +        read_unlock(&d->pci_lock);

I would consider moving the read_{,un}lock() calls inside
vpci_translate_virtual_device(), if that's the only caller of
vpci_translate_virtual_device().  Maybe further patches add other
instances that call from an already locked context.

> +    }
>  
> -    return sbdf;
> +    return translated;
>  }
>  
>  static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>                            register_t *r, void *p)
>  {
>      struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf;
>      const unsigned int access_size = (1U << info->dabt.size) * 8;
>      const register_t invalid = GENMASK_ULL(access_size - 1, 0);

Do you know why the invalid value is truncated to the access size.
Won't it be simpler to just set the whole variable to 1s? (~0)

TBH, you could just set:

*r = ~(register_t)0;

At the top of the function and get rid of the local invalid variable
plus having to set r on all error paths.

Thanks, Roger.

