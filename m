Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C418043D889
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 03:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217585.377693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfuDG-0007HK-7m; Thu, 28 Oct 2021 01:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217585.377693; Thu, 28 Oct 2021 01:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfuDG-0007F9-4Q; Thu, 28 Oct 2021 01:28:14 +0000
Received: by outflank-mailman (input) for mailman id 217585;
 Thu, 28 Oct 2021 01:28:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TkaK=PQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfuDE-0007DF-Fq
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 01:28:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 500f2842-378e-11ec-8493-12813bfff9fa;
 Thu, 28 Oct 2021 01:28:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63C0E60F56;
 Thu, 28 Oct 2021 01:28:10 +0000 (UTC)
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
X-Inumbo-ID: 500f2842-378e-11ec-8493-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635384490;
	bh=/SSWR3C7/EFbNOMT4a7VbNksXhwttXyDyCOgW8/+9o4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uTLG0uLy2rMhIXZATdlVQ02SNddE8n59TcHIess2YsKlSp957d4y/uv0vqufOTM4k
	 rErWJE2paJcCoPn9jTtHjgxsEkwHDzRnFxQ1PvR9JDZX2Z4aKLX0V5Bzf97n6ydWTr
	 32y08ShXCj/uVPtH1ffJ4lTZo5mW/IzYl6NqVsuWa2ntNDtOh7pC+lpizsDlXAlfnZ
	 GMc4z+7ffJV7xXy+QSDnabq90mk50KVk8qLDP2jPan47OBKqyhZECc2dZ4+qE+GorY
	 77njjyVKAC920D1pemGJPKzlLIrJ/h2G5VSyWeuXB3fkyKpM9SBN6y0YRvWr9qCu/G
	 hIGYfbA9ger8Q==
Date: Wed, 27 Oct 2021 18:28:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V2 2/4] arm/xen: Switch to use gnttab_setup_auto_xlat_frames()
 for DT
In-Reply-To: <1635264312-3796-3-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2110271754400.20134@sstabellini-ThinkPad-T480s>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com> <1635264312-3796-3-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Read the start address of the grant table space from DT
> (region 0).
> 
> This patch mostly restores behaviour before commit 3cf4095d7446
> ("arm/xen: Use xen_xlate_map_ballooned_pages to setup grant table")
> but trying not to break the ACPI support added after that commit.
> So the patch touches DT part only and leaves the ACPI part with
> xen_xlate_map_ballooned_pages().
> 
> This is a preparation for using Xen extended region feature
> where unused regions of guest physical address space (provided
> by the hypervisor) will be used to create grant/foreign/whatever
> mappings instead of wasting real RAM pages from the domain memory
> for establishing these mappings.
> 
> The immediate benefit of this change:
> - Avoid superpage shattering in Xen P2M when establishing
>   stage-2 mapping (GFN <-> MFN) for the grant table space
> - Avoid wasting real RAM pages (reducing the amount of memory
>   usuable) for mapping grant table space
> - The grant table space is always mapped at the exact
>   same place (region 0 is reserved for the grant table)
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes RFC -> V2:
>    - new patch
> ---
>  arch/arm/xen/enlighten.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 7f1c106b..dea46ec 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -59,6 +59,9 @@ unsigned long xen_released_pages;
>  struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __initdata;
>  
>  static __read_mostly unsigned int xen_events_irq;
> +static phys_addr_t xen_grant_frames;

__read_mostly


> +#define GRANT_TABLE_INDEX   0
>  
>  uint32_t xen_start_flags;
>  EXPORT_SYMBOL(xen_start_flags);
> @@ -303,6 +306,7 @@ static void __init xen_acpi_guest_init(void)
>  static void __init xen_dt_guest_init(void)
>  {
>  	struct device_node *xen_node;
> +	struct resource res;
>  
>  	xen_node = of_find_compatible_node(NULL, NULL, "xen,xen");
>  	if (!xen_node) {
> @@ -310,6 +314,12 @@ static void __init xen_dt_guest_init(void)
>  		return;
>  	}
>  
> +	if (of_address_to_resource(xen_node, GRANT_TABLE_INDEX, &res)) {
> +		pr_err("Xen grant table region is not found\n");
> +		return;
> +	}
> +	xen_grant_frames = res.start;
> +
>  	xen_events_irq = irq_of_parse_and_map(xen_node, 0);
>  }
>  
> @@ -317,16 +327,20 @@ static int __init xen_guest_init(void)
>  {
>  	struct xen_add_to_physmap xatp;
>  	struct shared_info *shared_info_page = NULL;
> -	int cpu;
> +	int rc, cpu;
>  
>  	if (!xen_domain())
>  		return 0;
>  
>  	if (!acpi_disabled)
>  		xen_acpi_guest_init();
> -	else
> +	else {
>  		xen_dt_guest_init();
>  
> +		if (!xen_grant_frames)
> +			return -ENODEV;

maybe we can avoid this, see below


> +	}
> +
>  	if (!xen_events_irq) {
>  		pr_err("Xen event channel interrupt not found\n");
>  		return -ENODEV;
> @@ -370,12 +384,16 @@ static int __init xen_guest_init(void)
>  	for_each_possible_cpu(cpu)
>  		per_cpu(xen_vcpu_id, cpu) = cpu;
>  
> -	xen_auto_xlat_grant_frames.count = gnttab_max_grant_frames();
> -	if (xen_xlate_map_ballooned_pages(&xen_auto_xlat_grant_frames.pfn,
> -					  &xen_auto_xlat_grant_frames.vaddr,
> -					  xen_auto_xlat_grant_frames.count)) {
> +	if (!acpi_disabled) {

To make the code more resilient couldn't we do:

if (!acpi_disabled || !xen_grant_frames) {


> +		xen_auto_xlat_grant_frames.count = gnttab_max_grant_frames();
> +		rc = xen_xlate_map_ballooned_pages(&xen_auto_xlat_grant_frames.pfn,
> +										   &xen_auto_xlat_grant_frames.vaddr,
> +										   xen_auto_xlat_grant_frames.count);
> +	} else
> +		rc = gnttab_setup_auto_xlat_frames(xen_grant_frames);
> +	if (rc) {
>  		free_percpu(xen_vcpu_info);
> -		return -ENOMEM;
> +		return rc;
>  	}
>  	gnttab_init();


