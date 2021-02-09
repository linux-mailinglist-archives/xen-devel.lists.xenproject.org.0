Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0C3157C1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 21:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83422.155239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Zkk-0006vv-Kz; Tue, 09 Feb 2021 20:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83422.155239; Tue, 09 Feb 2021 20:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Zkk-0006vX-Gh; Tue, 09 Feb 2021 20:36:54 +0000
Received: by outflank-mailman (input) for mailman id 83422;
 Tue, 09 Feb 2021 20:36:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p39W=HL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l9Zkj-0006vR-IE
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 20:36:53 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21741177-5897-419b-bb2c-49b86dadd9e4;
 Tue, 09 Feb 2021 20:36:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l12so23713625wry.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 12:36:51 -0800 (PST)
Received: from CBGR90WXYV0 (host86-180-176-157.range86-180.btcentralplus.com.
 [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id m2sm5955539wml.34.2021.02.09.12.36.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2021 12:36:50 -0800 (PST)
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
X-Inumbo-ID: 21741177-5897-419b-bb2c-49b86dadd9e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=NHBCiO4S/77uJJWibt68h7ZUEYfILKGtx3HqlnXBhAM=;
        b=XEJjXR6d28ogiagL9pPCuvGp5Tr4U3kWb1QY/ohyQAlCY93tssc3XFrarbFP+p44lH
         44KJVCEtTwFD2fnR1MBA5wez54BIaI37R/nh7UG20mHKPG+S2lTsEWCHaab90L3LQFTW
         noCP/d+ShAJzlGLfP4HfmxDPSmu2oHPDRUL1uJcaalPDnU632C363jz9fjMgOn+JYOMd
         kvKAVUoB2tlqsMmfS5C5iR7rVmyH/vVsI1s9hlymlQmg4C3oUU7CweVbC+G42/bphcfQ
         yODJjmC4GvE5JQSiDrwgBRA/MG3W92wXy+0tpiHkdSnKw1QW6atUtvALSdZQxKVM4lR4
         lFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=NHBCiO4S/77uJJWibt68h7ZUEYfILKGtx3HqlnXBhAM=;
        b=m1RfOQLHTd6sul2ipvdV+yeCSjtd21w5me/Y5GEfUzRN4eym6LFv9leugMmBA4VatQ
         Py20GVA/1EBD52yIN3lw/MaraP0/neZWEjoWM5j3HBrC8amHRIJvOo7+q4j6TOQHzPw0
         ZBK2NQPONmX5J425lECIvXa6lsKQUHCOUilmsy90Mi0UNAe5esyC6mifUi+B1Ko+3VSn
         N9dqe2NttM3SXi6h3urqIjYWJ50ljVoJl3VFgTz3vp+4kZBokt2TS3e1JfynAFuOsiei
         C6D+ONB7f2RfgaNRgOmd1A9mwmaDSSiThzE56RVEii8z1h5PgQt0he8SEOsr0AC/A4Cd
         5YvA==
X-Gm-Message-State: AOAM531UBxIQJlMiknieIAxl94PP2H4dNfyRKrqLVi35uFtn8sjH5z2x
	XHJbHAcW9hRa0N4vHn3zm48=
X-Google-Smtp-Source: ABdhPJx29HclS2DQMOe9rm+PqjkaeMOQ0V0ZRaS08FWSA0UOpMeJmooPXC4BdZNSQqAPo+Gf/Y4XNA==
X-Received: by 2002:adf:edcd:: with SMTP id v13mr1523759wro.336.1612903010935;
        Tue, 09 Feb 2021 12:36:50 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: <hongyxia@amazon.co.uk>,
	<iwj@xenproject.org>,
	"'Julien Grall'" <jgrall@amazon.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>
References: <20210209152816.15792-1-julien@xen.org> <20210209152816.15792-6-julien@xen.org>
In-Reply-To: <20210209152816.15792-6-julien@xen.org>
Subject: RE: [for-4.15][PATCH v2 5/5] xen/iommu: x86: Clear the root page-table before freeing the page-tables
Date: Tue, 9 Feb 2021 20:36:49 -0000
Message-ID: <04f901d6ff23$4b2b5e80$e1821b80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJkA3sfHUQVO5jg8t87X8qwyW0VowISFH3OqSWqV1A=
Content-Language: en-gb

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 09 February 2021 15:28
> To: xen-devel@lists.xenproject.org
> Cc: hongyxia@amazon.co.uk; iwj@xenproject.org; Julien Grall <jgrall@amazon.com>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Kevin Tian <kevin.tian@intel.com>;
> Paul Durrant <paul@xen.org>
> Subject: [for-4.15][PATCH v2 5/5] xen/iommu: x86: Clear the root page-table before freeing the page-
> tables
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The new per-domain IOMMU page-table allocator will now free the
> page-tables when domain's resources are relinquished. However, the root
> page-table (i.e. hd->arch.pg_maddr) will not be cleared.
> 
> Xen may access the IOMMU page-tables afterwards at least in the case of
> PV domain:
> 
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04025b4b2>] R iommu.c#addr_to_dma_page_maddr+0x12e/0x1d8
> (XEN)    [<ffff82d04025b695>] F iommu.c#intel_iommu_unmap_page+0x5d/0xf8
> (XEN)    [<ffff82d0402695f3>] F iommu_unmap+0x9c/0x129
> (XEN)    [<ffff82d0402696a6>] F iommu_legacy_unmap+0x26/0x63
> (XEN)    [<ffff82d04033c5c7>] F mm.c#cleanup_page_mappings+0x139/0x144
> (XEN)    [<ffff82d04033c61d>] F put_page+0x4b/0xb3
> (XEN)    [<ffff82d04033c87f>] F put_page_from_l1e+0x136/0x13b
> (XEN)    [<ffff82d04033cada>] F devalidate_page+0x256/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
> (XEN)    [<ffff82d04033d8d6>] F mm.c#put_page_from_l2e+0x8a/0xcf
> (XEN)    [<ffff82d04033cc27>] F devalidate_page+0x3a3/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
> (XEN)    [<ffff82d04033d807>] F mm.c#put_page_from_l3e+0x8a/0xcf
> (XEN)    [<ffff82d04033cdf0>] F devalidate_page+0x56c/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
> (XEN)    [<ffff82d04033d6c7>] F mm.c#put_page_from_l4e+0x69/0x6d
> (XEN)    [<ffff82d04033cf24>] F devalidate_page+0x6a0/0x8dc
> (XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
> (XEN)    [<ffff82d04033d92e>] F put_page_type_preemptible+0x13/0x15
> (XEN)    [<ffff82d04032598a>] F domain.c#relinquish_memory+0x1ff/0x4e9
> (XEN)    [<ffff82d0403295f2>] F domain_relinquish_resources+0x2b6/0x36a
> (XEN)    [<ffff82d040205cdf>] F domain_kill+0xb8/0x141
> (XEN)    [<ffff82d040236cac>] F do_domctl+0xb6f/0x18e5
> (XEN)    [<ffff82d04031d098>] F pv_hypercall+0x2f0/0x55f
> (XEN)    [<ffff82d04039b432>] F lstar_enter+0x112/0x120
> 
> This will result to a use after-free and possibly an host crash or
> memory corruption.
> 
> Freeing the page-tables further down in domain_relinquish_resources()
> would not work because pages may not be released until later if another
> domain hold a reference on them.
> 
> Once all the PCI devices have been de-assigned, it is actually pointless
> to access modify the IOMMU page-tables. So we can simply clear the root
> page-table address.
> 
> Fixes: 3eef6d07d722 ("x86/iommu: convert VT-d code to use new page table allocator")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - Introduce clear_root_pgtable()
>         - Move the patch later in the series
> ---
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 +++++++++++-
>  xen/drivers/passthrough/vtd/iommu.c         | 12 +++++++++++-
>  xen/drivers/passthrough/x86/iommu.c         |  6 ++++++
>  xen/include/xen/iommu.h                     |  1 +
>  4 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 42b5a5a9bec4..81add0ba26b4 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -381,9 +381,18 @@ static int amd_iommu_assign_device(struct domain *d, u8 devfn,
>      return reassign_device(pdev->domain, d, devfn, pdev);
>  }
> 
> +static void iommu_clear_root_pgtable(struct domain *d)
> +{
> +    struct domain_iommu *hd = dom_iommu(d);
> +
> +    spin_lock(&hd->arch.mapping_lock);
> +    hd->arch.amd.root_table = NULL;
> +    spin_unlock(&hd->arch.mapping_lock);
> +}
> +
>  static void amd_iommu_domain_destroy(struct domain *d)
>  {
> -    dom_iommu(d)->arch.amd.root_table = NULL;
> +    ASSERT(!dom_iommu(d)->arch.amd.root_table);
>  }
> 
>  static int amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
> @@ -565,6 +574,7 @@ static const struct iommu_ops __initconstrel _iommu_ops = {
>      .remove_device = amd_iommu_remove_device,
>      .assign_device  = amd_iommu_assign_device,
>      .teardown = amd_iommu_domain_destroy,
> +    .clear_root_pgtable = iommu_clear_root_pgtable,
>      .map_page = amd_iommu_map_page,
>      .unmap_page = amd_iommu_unmap_page,
>      .iotlb_flush = amd_iommu_flush_iotlb_pages,
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index d136fe36883b..e1871f6c2bc1 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1726,6 +1726,15 @@ out:
>      return ret;
>  }
> 
> +static void iommu_clear_root_pgtable(struct domain *d)
> +{
> +    struct domain_iommu *hd = dom_iommu(d);
> +
> +    spin_lock(&hd->arch.mapping_lock);
> +    hd->arch.vtd.pgd_maddr = 0;
> +    spin_unlock(&hd->arch.mapping_lock);
> +}
> +
>  static void iommu_domain_teardown(struct domain *d)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
> @@ -1740,7 +1749,7 @@ static void iommu_domain_teardown(struct domain *d)
>          xfree(mrmrr);
>      }
> 
> -    hd->arch.vtd.pgd_maddr = 0;
> +    ASSERT(!hd->arch.vtd.pgd_maddr);
>  }
> 
>  static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
> @@ -2719,6 +2728,7 @@ static struct iommu_ops __initdata vtd_ops = {
>      .remove_device = intel_iommu_remove_device,
>      .assign_device  = intel_iommu_assign_device,
>      .teardown = iommu_domain_teardown,
> +    .clear_root_pgtable = iommu_clear_root_pgtable,
>      .map_page = intel_iommu_map_page,
>      .unmap_page = intel_iommu_unmap_page,
>      .lookup_page = intel_iommu_lookup_page,
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index 82d770107a47..d3cdec6ee83f 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -280,6 +280,12 @@ int iommu_free_pgtables(struct domain *d)
>      /* After this barrier no new page allocations can occur. */
>      spin_barrier(&hd->arch.pgtables.lock);
> 
> +    /*
> +     * Pages will be moved to the free list in a bit. So we want to

'in a bit' sounds a little odd. I think you could just say 'below'. The code looks fine though so...

Reviewed-by: Paul Durrant <paul@xen.org>

> +     * clear the root page-table to avoid any potential use after-free.
> +     */
> +    hd->platform_ops->clear_root_pgtable(d);
> +
>      while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
>      {
>          free_domheap_page(pg);
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 863a68fe1622..d59ed7cbad43 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -272,6 +272,7 @@ struct iommu_ops {
> 
>      int (*adjust_irq_affinities)(void);
>      void (*sync_cache)(const void *addr, unsigned int size);
> +    void (*clear_root_pgtable)(struct domain *d);
>  #endif /* CONFIG_X86 */
> 
>      int __must_check (*suspend)(void);
> --
> 2.17.1



