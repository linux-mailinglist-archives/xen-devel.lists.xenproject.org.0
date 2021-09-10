Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0F640648B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 03:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183811.332157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUuF-0003WN-Dr; Fri, 10 Sep 2021 01:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183811.332157; Fri, 10 Sep 2021 01:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUuF-0003RO-AY; Fri, 10 Sep 2021 01:00:39 +0000
Received: by outflank-mailman (input) for mailman id 183811;
 Fri, 10 Sep 2021 01:00:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOUuD-0002nF-IV
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 01:00:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81f0d8ce-11d2-11ec-b206-12813bfff9fa;
 Fri, 10 Sep 2021 01:00:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8D5F610C9;
 Fri, 10 Sep 2021 01:00:35 +0000 (UTC)
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
X-Inumbo-ID: 81f0d8ce-11d2-11ec-b206-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631235635;
	bh=ijbpxVEv2WqN6U7QSvEPX/gA8Hrre+cnWPsQKbMPbxE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qjwp1h+uEAie4pfQh0jQiw2tOs+4vmQfugGcegniEN4Ybr1+EgSNlkrHgIeALz6Ba
	 3y4hqE8DhSgO084XehcFOuA1ICUCMSRoFnGcqoPDqbNPAU3pNZ5GKxk2Dl8uvG4fvL
	 J3u8ESfJuweXdhCjBye7RwsKT3CIsQiKmkhxKkH3KWGrJTKnP3uz8Ue9pioT6D64Zz
	 qYCmX757iyR0ThuB/IERkm28MNoWD+HwxuWio4YFvz+0hcViMeBwrayuHJjhy/dz7i
	 n+j2exdRA7MVRT2oHAnvuE6JmwQbIqGs5QVfKXadNoH4qaiwwlsMjBg/JXz1v1YjK/
	 qrUNTL3v98fNw==
Date: Thu, 9 Sep 2021 18:00:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 14/14] xen/arm: Add linux,pci-domain property for
 hwdom if not available.
In-Reply-To: <0b979ccab6a4c9b2070748709f737f41fa108a42.1629366665.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109091758290.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <0b979ccab6a4c9b2070748709f737f41fa108a42.1629366665.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Aug 2021, Rahul Singh wrote:
> If the property is not present in the device tree node for host bridge,
> XEN while creating the dtb for hwdom will create this property and
> assigns the already allocated segment to the host bridge
> so that XEN and linux will have the same segment for the host bridges.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/domain_build.c        | 18 ++++++++++++++++++
>  xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
>  xen/include/asm-arm/pci.h          |  3 +++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6c86d52781..e0cf2ff19d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -581,6 +581,24 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>              return res;
>      }
>  
> +#ifdef CONFIG_HAS_PCI
> +    if ( dt_device_type_is_equal(node, "pci") )
> +    {
> +        if ( !dt_find_property(node, "linux,pci-domain", NULL) )
> +        {
> +            uint16_t segment;
> +
> +            res = pci_get_host_bridge_segment(node, &segment);
> +            if ( res < 0 )
> +                return res;
> +
> +            res = fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
> +            if ( res )
> +                return res;
> +        }
> +    }
> +#endif

If param_pci_enable is false it might be possible that Xen didn't
allocate a segment. In that case, we should just let Linux do whatever
it wants in terms of segment allocation. So I think the code here should
not return error if param_pci_enable is false.
returning an error instead.

