Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFAF67F3C1
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 02:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486043.753516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLa9I-0003YY-En; Sat, 28 Jan 2023 01:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486043.753516; Sat, 28 Jan 2023 01:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLa9I-0003VB-93; Sat, 28 Jan 2023 01:36:56 +0000
Received: by outflank-mailman (input) for mailman id 486043;
 Sat, 28 Jan 2023 01:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LM4o=5Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLa9G-0003V5-46
 for xen-devel@lists.xenproject.org; Sat, 28 Jan 2023 01:36:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cb7f2f3-9eac-11ed-b8d1-410ff93cb8f0;
 Sat, 28 Jan 2023 02:36:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A04D61DC8;
 Sat, 28 Jan 2023 01:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C531EC433EF;
 Sat, 28 Jan 2023 01:36:48 +0000 (UTC)
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
X-Inumbo-ID: 3cb7f2f3-9eac-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674869809;
	bh=x6TulpTojwOjmImiJrgcjSXC+kR5Yowcqr37vHpuYQo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h13Ic3ptpv4qwMZ3Vjmi000NlkAa9jSn8bkPHCHW0OgjnDtYhldoItDNvWMMxamyS
	 ebtFX0IwWSR8m8yY3+dtMlX5iAJstOCstuDUt8t/pRTm2w6Xrup5Vslh9QTT8/SDUG
	 hS7x+W/YjUd/RQ8EFShiLSmUvfMY0gPgdQ8jdYcAQXYk09RBmHwRYsRe4oLXsDzWGD
	 lqwbHnXcGQofAZ5WQxylIols77K9F7bvwUcNdQ9VNOzDr8hrBE7Ld0PBSy99evjkfA
	 Aafw8ee/eN+ITUg+Q+dEdWHEiDMoKhdJ9VmQE8+sU9RD6t8I5k7tlKgNJ5hwl2gKLh
	 W/mO0oxW8AtMw==
Date: Fri, 27 Jan 2023 17:36:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, 
    Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 09/10] [RFC only] xen: iommu: remove last  pcidevs_lock()
 calls in iommu
In-Reply-To: <20220831141040.13231-10-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2301271733240.1978264@ubuntu-linux-20-04-desktop>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com> <20220831141040.13231-10-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
> There are number of cases where pcidevs_lock() is used to protect
> something that is not related to PCI devices per se.
> 
> Probably pcidev_lock in these places should be replaced with some
> other lock.
> 
> This patch is not intended to be merged and is present only to discuss
> this use of pcidevs_lock()
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

I wonder if we are being too ambitious: is it necessary to get rid of
pcidevs_lock completely, without replacing all its occurrences with
something else?

Because it would be a lot easier to only replace pcidevs_lock with
pdev->lock, replacing the global lock with a per-device lock. That alone
would be a major improvement and would be far easier to verify its
correctness.

While this patch and the previous patch together remove all occurrences
of pcidevs_lock without adding pdev->lock, which is difficult to prove
correct.


> ---
>  xen/drivers/passthrough/vtd/intremap.c | 2 --
>  xen/drivers/passthrough/vtd/iommu.c    | 5 -----
>  xen/drivers/passthrough/x86/iommu.c    | 5 -----
>  3 files changed, 12 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
> index 1512e4866b..44e3b72f91 100644
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -893,8 +893,6 @@ int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
>  
>      spin_unlock_irq(&desc->lock);
>  
> -    ASSERT(pcidevs_locked());
> -
>      return msi_msg_write_remap_rte(msi_desc, &msi_desc->msg);
>  
>   unlock_out:
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index 87868188b7..9d258d154d 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -127,8 +127,6 @@ static int context_set_domain_id(struct context_entry *context,
>  {
>      unsigned int i;
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( domid_mapping(iommu) )
>      {
>          unsigned int nr_dom = cap_ndoms(iommu->cap);
> @@ -1882,7 +1880,6 @@ int domain_context_unmap_one(
>      int iommu_domid, rc, ret;
>      bool_t flush_dev_iotlb;
>  
> -    ASSERT(pcidevs_locked());
>      spin_lock(&iommu->lock);
>  
>      maddr = bus_to_context_maddr(iommu, bus);
> @@ -2601,7 +2598,6 @@ static void __hwdom_init setup_hwdom_rmrr(struct domain *d)
>      u16 bdf;
>      int ret, i;
>  
> -    pcidevs_lock();
>      for_each_rmrr_device ( rmrr, bdf, i )
>      {
>          /*
> @@ -2616,7 +2612,6 @@ static void __hwdom_init setup_hwdom_rmrr(struct domain *d)
>              dprintk(XENLOG_ERR VTDPREFIX,
>                       "IOMMU: mapping reserved region failed\n");
>      }
> -    pcidevs_unlock();
>  }
>  
>  static struct iommu_state {
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index f671b0f2bb..4e94ad15df 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -207,7 +207,6 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
>      struct identity_map *map;
>      struct domain_iommu *hd = dom_iommu(d);
>  
> -    ASSERT(pcidevs_locked());
>      ASSERT(base < end);
>  
>      /*
> @@ -479,8 +478,6 @@ domid_t iommu_alloc_domid(unsigned long *map)
>      static unsigned int start;
>      unsigned int idx = find_next_zero_bit(map, UINT16_MAX - DOMID_MASK, start);
>  
> -    ASSERT(pcidevs_locked());
> -
>      if ( idx >= UINT16_MAX - DOMID_MASK )
>          idx = find_first_zero_bit(map, UINT16_MAX - DOMID_MASK);
>      if ( idx >= UINT16_MAX - DOMID_MASK )
> @@ -495,8 +492,6 @@ domid_t iommu_alloc_domid(unsigned long *map)
>  
>  void iommu_free_domid(domid_t domid, unsigned long *map)
>  {
> -    ASSERT(pcidevs_locked());
> -
>      if ( domid == DOMID_INVALID )
>          return;
>  
> -- 
> 2.36.1
> 

