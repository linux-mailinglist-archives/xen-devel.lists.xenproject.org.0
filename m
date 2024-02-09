Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9739284F153
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 09:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678570.1055963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYMCE-0007ob-4f; Fri, 09 Feb 2024 08:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678570.1055963; Fri, 09 Feb 2024 08:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYMCE-0007md-21; Fri, 09 Feb 2024 08:25:18 +0000
Received: by outflank-mailman (input) for mailman id 678570;
 Fri, 09 Feb 2024 08:25:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSO/=JS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rYMCD-0007mV-18
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 08:25:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c062e162-c724-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 09:25:15 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3c00c98d32so7445866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 00:25:15 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 f14-20020a170906494e00b00a3bbf725080sm520411ejt.55.2024.02.09.00.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 00:25:15 -0800 (PST)
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
X-Inumbo-ID: c062e162-c724-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707467115; x=1708071915; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AVOD5/afe6IIiSKaIDkkhptsRiqDV1ABiXu/6o56ZrU=;
        b=ruFuTpiv6Ro4SO1UL1PG5C8aTxDuCzsF5ZVGnn6SgaIiVYLLzTmshwYpJyhN0Y/YcL
         oA7VEBj/2twZ1x5nbQt6ANg/UQH84e4yfPliG9zUwoOU6+KDLeUP2aWx88ckR38aHjRk
         XNIlGSxWJl3J02oyUmDbJVokGGOoMA22tGWxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707467115; x=1708071915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVOD5/afe6IIiSKaIDkkhptsRiqDV1ABiXu/6o56ZrU=;
        b=hr6t8TVOeqeQkjOWtA9OqN6GNGZpTtXft581e2jBGveN7DpexabTUHv8RdD3XOaea2
         Wr7nMhfU1XTWrtgrH2l1unfwU85Exdc2/YGxGK3NxS9l8qiYBuZHOTgFFFENBcc1BICU
         xf7wecgaKygO6eC7jwFkxOzmuDGgZkfYRM5HEqv4kn2WeVLAF9RFEkPEOvKChFuR8xsr
         +uIbs1/aiIQD37Az4LvVdvl4uF8RDhryShDL8aDH4rTt3dI4x9JrsVEXK2xUBvGaQe9A
         9itRBqADPnoY28VxTA7KhOhT9eyTg2Bb7Hyqqp4QzRZWdL92beM1Qbq/XbmqP1IIs3BY
         gWJQ==
X-Gm-Message-State: AOJu0Yz92LqX/cirYTxEHKuffhYSIosulq2cVnkZJgIa01ZI48fUBWX5
	Z2xDKB+will+jVO/DD+8te2rpYBhap3wdmzFUCP/pt2QRwU5hI72SOSSH2GtfLE=
X-Google-Smtp-Source: AGHT+IFhxb1yfazcGUJaoCUDfb8LwXieEVumGRM4fbO7A61brk9PWm6yFfOvfQqNHm8M1xoLXixWFw==
X-Received: by 2002:a17:906:f215:b0:a38:200d:f96 with SMTP id gt21-20020a170906f21500b00a38200d0f96mr599380ejb.59.1707467115418;
        Fri, 09 Feb 2024 00:25:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGVop+SmJ4DPKBtTPViQNfaWL2EolZK/02P4KZRPoExziGhRRTLEfJ8yxYc29ZcbDQgnzGfVCJT3fB62zj+QliFU/ZSNu8DAt5lusSDfwXazCs
Date: Fri, 9 Feb 2024 09:25:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 6/7] VT-d: move dev_invalidate_iotlb() to the sole file
 it's used from
Message-ID: <ZcXhauUax5WHD93J@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <0d14f148-32e0-4dac-b5e8-3230adfc5f9d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d14f148-32e0-4dac-b5e8-3230adfc5f9d@suse.com>

On Mon, Feb 05, 2024 at 02:57:12PM +0100, Jan Beulich wrote:
> ..., thus allowing it and qinval_device_iotlb_sync() to become static.
> There's nothing x86-specific about the function anyway. While moving,
> adjust types to better match ./CODING_STYLE (albeit use of fixed-width
> types for parameters is retained to limit the effective change).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/drivers/passthrough/vtd/extern.h
> +++ b/xen/drivers/passthrough/vtd/extern.h
> @@ -65,12 +65,6 @@ struct acpi_drhd_unit *ioapic_to_drhd(un
>  struct acpi_drhd_unit *hpet_to_drhd(unsigned int hpet_id);
>  struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd);
>  
> -int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
> -                         u64 addr, unsigned int size_order, u64 type);
> -
> -int __must_check qinval_device_iotlb_sync(struct vtd_iommu *iommu,
> -                                          struct pci_dev *pdev,
> -                                          u16 did, u16 size, u64 addr);
>  
>  uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
>  void free_pgtable_maddr(u64 maddr);
> --- a/xen/drivers/passthrough/vtd/qinval.c
> +++ b/xen/drivers/passthrough/vtd/qinval.c
> @@ -251,8 +251,9 @@ static int __must_check dev_invalidate_s
>      return rc;
>  }
>  
> -int qinval_device_iotlb_sync(struct vtd_iommu *iommu, struct pci_dev *pdev,
> -                             u16 did, u16 size, u64 addr)
> +static int qinval_device_iotlb_sync(struct vtd_iommu *iommu,
> +                                    struct pci_dev *pdev, uint16_t did,
> +                                    uint16_t size, paddr_t addr)
>  {
>      unsigned long flags;
>      unsigned int index;
> @@ -282,6 +283,101 @@ int qinval_device_iotlb_sync(struct vtd_
>      return dev_invalidate_sync(iommu, pdev, did);
>  }
>  
> +static bool device_in_domain(const struct vtd_iommu *iommu,
> +                             const struct pci_dev *pdev, uint16_t did)
> +{
> +    struct root_entry *root_entry;
> +    struct context_entry *ctxt_entry = NULL;
> +    unsigned int tt;
> +    bool found = false;
> +
> +    if ( unlikely(!iommu->root_maddr) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return false;
> +    }
> +
> +    root_entry = map_vtd_domain_page(iommu->root_maddr);
> +    if ( !root_present(root_entry[pdev->bus]) )
> +        goto out;
> +
> +    ctxt_entry = map_vtd_domain_page(root_entry[pdev->bus].val);
> +    if ( context_domain_id(ctxt_entry[pdev->devfn]) != did )
> +        goto out;
> +
> +    tt = context_translation_type(ctxt_entry[pdev->devfn]);
> +    if ( tt != CONTEXT_TT_DEV_IOTLB )
> +        goto out;
> +
> +    found = true;
> + out:
> +    if ( root_entry )
> +        unmap_vtd_domain_page(root_entry);
> +
> +    if ( ctxt_entry )
> +        unmap_vtd_domain_page(ctxt_entry);
> +
> +    return found;
> +}
> +
> +static int dev_invalidate_iotlb(struct vtd_iommu *iommu, uint16_t did,
> +                                paddr_t addr, unsigned int size_order,
> +                                uint64_t type)
> +{
> +    struct pci_dev *pdev, *temp;
> +    int ret = 0;
> +
> +    if ( !ecap_dev_iotlb(iommu->ecap) )
> +        return ret;
> +
> +    list_for_each_entry_safe( pdev, temp, &iommu->ats_devices, ats.list )
> +    {
> +        bool sbit;
> +        int rc = 0;
> +
> +        switch ( type )
> +        {
> +        case DMA_TLB_DSI_FLUSH:
> +            if ( !device_in_domain(iommu, pdev, did) )
> +                break;
> +            /* fall through if DSI condition met */
> +        case DMA_TLB_GLOBAL_FLUSH:
> +            /* invalidate all translations: sbit=1,bit_63=0,bit[62:12]=1 */
> +            sbit = 1;
> +            addr = (~0UL << PAGE_SHIFT_4K) & 0x7FFFFFFFFFFFFFFF;

Given the MISRA stuff, won't it be better to append 'UL' here while
moving?

Thanks, Roger.

