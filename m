Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19143D8B7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 03:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217597.377703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfuOs-0001JX-DW; Thu, 28 Oct 2021 01:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217597.377703; Thu, 28 Oct 2021 01:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfuOs-0001HQ-7E; Thu, 28 Oct 2021 01:40:14 +0000
Received: by outflank-mailman (input) for mailman id 217597;
 Thu, 28 Oct 2021 01:40:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TkaK=PQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfuOq-0001H1-K4
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 01:40:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd3dfeac-378f-11ec-8493-12813bfff9fa;
 Thu, 28 Oct 2021 01:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6090461100;
 Thu, 28 Oct 2021 01:40:10 +0000 (UTC)
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
X-Inumbo-ID: fd3dfeac-378f-11ec-8493-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635385210;
	bh=X288Vb/CllN4w89yrsjxckKoO24AoOFwTC+Y1bZLW54=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dLx+k5vKHRPbn9SEh146uGicFOvuXY5hlgq84dMgd0XlKDUkNwmGh745Eyvj4Tlkx
	 pHv0CQlLN2Fidfqzl0WpeQDhbO/RBotviUoP2VDpTIdNCIX7X8A4m4X08HkZJALyWI
	 7ivVD1MqmiC1bJTRItBaeEKM+7Nk8Ko5TgySx/QtN4O1PvNkY/keYwy69+VKQ1sATC
	 arysC86WNTzxHzO7S/sZSF6w+99XpzZQPSoGRAf1TTPnCRy06usB4DGmBn7YSNCElT
	 k1qmQvsrlO6vu7CUGNmLhuL+jRnU1WkrW0f8w540sMVT99qapAMoKKqkrpxrjQjV1B
	 cAKl+pORy1r9A==
Date: Wed, 27 Oct 2021 18:40:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V2 4/4] arm/xen: Read extended regions from DT and init
 Xen resource
In-Reply-To: <1635264312-3796-5-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2110271803060.20134@sstabellini-ThinkPad-T480s>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com> <1635264312-3796-5-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-800219594-1635384450=:20134"
Content-ID: <alpine.DEB.2.21.2110271827430.20134@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-800219594-1635384450=:20134
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110271827431.20134@sstabellini-ThinkPad-T480s>

On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch implements arch_xen_unpopulated_init() on Arm where
> the extended regions (if any) are gathered from DT and inserted
> into passed Xen resource to be used as unused address space
> for Xen scratch pages by unpopulated-alloc code.
> 
> The extended region (safe range) is a region of guest physical
> address space which is unused and could be safely used to create
> grant/foreign mappings instead of wasting real RAM pages from
> the domain memory for establishing these mappings.
> 
> The extended regions are chosen by the hypervisor at the domain
> creation time and advertised to it via "reg" property under
> hypervisor node in the guest device-tree. As region 0 is reserved
> for grant table space (always present), the indexes for extended
> regions are 1...N.
> 
> If arch_xen_unpopulated_init() fails for some reason the default
> behaviour will be restored (allocate xenballooned pages).
> 
> This patch also removes XEN_UNPOPULATED_ALLOC dependency on x86.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes RFC -> V2:
>    - new patch, instead of
>     "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide unallocated space"
> ---
>  arch/arm/xen/enlighten.c | 112 +++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/xen/Kconfig      |   2 +-
>  2 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index dea46ec..1a1e0d3 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -62,6 +62,7 @@ static __read_mostly unsigned int xen_events_irq;
>  static phys_addr_t xen_grant_frames;
>  
>  #define GRANT_TABLE_INDEX   0
> +#define EXT_REGION_INDEX    1
>  
>  uint32_t xen_start_flags;
>  EXPORT_SYMBOL(xen_start_flags);
> @@ -303,6 +304,117 @@ static void __init xen_acpi_guest_init(void)
>  #endif
>  }
>  
> +#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
> +int arch_xen_unpopulated_init(struct resource *res)
> +{
> +	struct device_node *np;
> +	struct resource *regs, *tmp_res;
> +	uint64_t min_gpaddr = -1, max_gpaddr = 0;
> +	unsigned int i, nr_reg = 0;
> +	struct range mhp_range;
> +	int rc;
> +
> +	if (!xen_domain())
> +		return -ENODEV;
> +
> +	np = of_find_compatible_node(NULL, NULL, "xen,xen");
> +	if (WARN_ON(!np))
> +		return -ENODEV;
> +
> +	/* Skip region 0 which is reserved for grant table space */
> +	while (of_get_address(np, nr_reg + EXT_REGION_INDEX, NULL, NULL))
> +		nr_reg++;
> +	if (!nr_reg) {
> +		pr_err("No extended regions are found\n");
> +		return -EINVAL;
> +	}
> +
> +	regs = kcalloc(nr_reg, sizeof(*regs), GFP_KERNEL);
> +	if (!regs)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Create resource from extended regions provided by the hypervisor to be
> +	 * used as unused address space for Xen scratch pages.
> +	 */
> +	for (i = 0; i < nr_reg; i++) {
> +		rc = of_address_to_resource(np, i + EXT_REGION_INDEX, &regs[i]);
> +		if (rc)
> +			goto err;
> +
> +		if (max_gpaddr < regs[i].end)
> +			max_gpaddr = regs[i].end;
> +		if (min_gpaddr > regs[i].start)
> +			min_gpaddr = regs[i].start;
> +	}
> +
> +	/* Check whether the resource range is within the hotpluggable range */
> +	mhp_range = mhp_get_pluggable_range(true);
> +	if (min_gpaddr < mhp_range.start)
> +		min_gpaddr = mhp_range.start;
> +	if (max_gpaddr > mhp_range.end)
> +		max_gpaddr = mhp_range.end;
> +
> +	res->start = min_gpaddr;
> +	res->end = max_gpaddr;
> +
> +	/*
> +	 * Mark holes between extended regions as unavailable. The rest of that
> +	 * address space will be available for the allocation.
> +	 */
> +	for (i = 1; i < nr_reg; i++) {
> +		resource_size_t start, end;
> +
> +		start = regs[i - 1].end + 1;
> +		end = regs[i].start - 1;
> +
> +		if (start > (end + 1)) {

Should this be:

if (start >= end)

?


> +			rc = -EINVAL;
> +			goto err;
> +		}
> +
> +		/* There is no hole between regions */
> +		if (start == (end + 1))

Also here, shouldn't it be:

if (start == end)

?

I think I am missing again something in termination accounting :-)


> +			continue;
> +
> +		/* Check whether the hole range is within the resource range */
> +		if (start < res->start || end > res->end) {

By definition I don't think this check is necessary as either condition
is impossible?


> +			if (start < res->start)
> +				start = res->start;
> +			if (end > res->end)
> +				end = res->end;
> +
> +			if (start >= (end + 1))
> +				continue;
> +		}
> +
> +		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
> +		if (!tmp_res) {
> +			rc = -ENOMEM;
> +			goto err;
> +		}
> +
> +		tmp_res->name = "Unavailable space";
> +		tmp_res->start = start;
> +		tmp_res->end = end;

Do we need to set any flags so that the system can reuse the memory in
the hole, e.g. IORESOURCE_MEM? Or is it not necessary?


> +		rc = insert_resource(res, tmp_res);
> +		if (rc) {
> +			pr_err("Cannot insert resource [%llx - %llx] %d\n",
> +					tmp_res->start, tmp_res->end, rc);

Although it is impossible to enable XEN_UNPOPULATED_ALLOC on arm32 due
to unmet dependencies, I would like to keep the implementation of
arch_xen_unpopulated_init 32bit clean.

I am getting build errors like (by forcing arch_xen_unpopulated_init to
compile on arm32):

./include/linux/kern_levels.h:5:18: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 3 has type ‘resource_size_t {aka unsigned int}’ [-Wformat=]


> +			kfree(tmp_res);
> +			goto err;
> +		}
> +	}
> +
> +err:
> +	kfree(regs);
> +
> +	return rc;
> +}
> +#endif
> +
>  static void __init xen_dt_guest_init(void)
>  {
>  	struct device_node *xen_node;
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 1b2c3ac..e6031fc 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -297,7 +297,7 @@ config XEN_FRONT_PGDIR_SHBUF
>  
>  config XEN_UNPOPULATED_ALLOC
>  	bool "Use unpopulated memory ranges for guest mappings"
> -	depends on X86 && ZONE_DEVICE
> +	depends on ZONE_DEVICE
>  	default XEN_BACKEND || XEN_GNTDEV || XEN_DOM0
>  	help
>  	  Use unpopulated memory ranges in order to create mappings for guest
--8323329-800219594-1635384450=:20134--

