Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB2B681CCC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 22:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487222.754779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbln-0006tV-GC; Mon, 30 Jan 2023 21:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487222.754779; Mon, 30 Jan 2023 21:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbln-0006rR-CI; Mon, 30 Jan 2023 21:32:55 +0000
Received: by outflank-mailman (input) for mailman id 487222;
 Mon, 30 Jan 2023 21:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fYol=53=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pMblm-0006rL-Lw
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 21:32:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6846ea0-a0e5-11ed-933c-83870f6b2ba8;
 Mon, 30 Jan 2023 22:32:53 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A080661222;
 Mon, 30 Jan 2023 21:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233FBC433D2;
 Mon, 30 Jan 2023 21:32:50 +0000 (UTC)
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
X-Inumbo-ID: a6846ea0-a0e5-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675114371;
	bh=Lq0wV2zvfbmXGHnuUgmYgtrcdOasT7Ug7OK+c9UhsaA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XDZxHwItIASxvUtyQMIaaulAVQudqD62jdBhO00r3C/ohqOGRSZvUP4BqEEGqwZ3u
	 IBGARAf2gKnoKhLCso5eAZwnv04MQNmpxsq41GyWaBgLl/GN+9KD55bLmkpjwuWZVr
	 dkDu9KDPKGpTXQ6m/Vnj2+5D7nJtO1koW1eTkBWo9NrGe94LDj4zePxdrpsPrI7edV
	 XXSqxqMgvigsd1/KFrKzGVT+bClFKmS0PnZQwqYHr28WR6Hy3FT6NlfLfo/oiBetQQ
	 6MZ1k8ZsKQB6Cw0Xvbv07kIxJssAFKuM+RF5bFi10glbcZN81/WF5jBQ6xDiJJgRjy
	 7g6oSG1wlFVvg==
Date: Mon, 30 Jan 2023 13:32:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/3] xen/arm: Extend the memory overlap check to
 include bootmodules
In-Reply-To: <20230130040535.188236-3-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2301301332410.132504@ubuntu-linux-20-04-desktop>
References: <20230130040535.188236-1-Henry.Wang@arm.com> <20230130040535.188236-3-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jan 2023, Henry Wang wrote:
> Similarly as the static regions defined in bootinfo.reserved_mem,
> the bootmodule regions defined in bootinfo.modules should also not
> be overlapping with memory regions in either bootinfo.reserved_mem
> or bootinfo.modules.
> 
> Therefore, this commit introduces a helper `bootmodules_overlap_check()`
> and uses this helper to extend the check in function
> `check_reserved_regions_overlap()` so that memory regions in
> bootinfo.modules are included. Use `check_reserved_regions_overlap()`
> in `add_boot_module()` to return early if any error occurs.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2 -> v3:
> 1. Use "[start, end]" format in printk error message.
> 2. Change the return type of helper functions to bool.
> 3. Use 'start' and 'size' in helper functions to describe a region.
> v1 -> v2:
> 1. Split original `overlap_check()` to `bootmodules_overlap_check()`.
> 2. Rework commit message.
> ---
>  xen/arch/arm/setup.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 636604aafa..98df0baffa 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -287,6 +287,32 @@ static bool __init meminfo_overlap_check(struct meminfo *meminfo,
>      return false;
>  }
>  
> +static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
> +                                             paddr_t region_start,
> +                                             paddr_t region_size)
> +{
> +    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, mod_num = bootmodules->nr_mods;
> +
> +    for ( i = 0; i < mod_num; i++ )
> +    {
> +        mod_start = bootmodules->module[i].start;
> +        mod_end = mod_start + bootmodules->module[i].size;
> +
> +        if ( region_end <= mod_start || region_start >= mod_end )
> +            continue;
> +        else
> +        {
> +            printk("Region: [%#"PRIpaddr", %#"PRIpaddr"] overlapping with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr"]\n",
> +                   region_start, region_end, i, mod_start, mod_end);
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>  void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>                                    void (*cb)(paddr_t, paddr_t),
>                                    unsigned int first)
> @@ -311,6 +337,11 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
>                                 region_start, region_size) )
>          return true;
>  
> +    /* Check if input region is overlapping with bootmodules */
> +    if ( bootmodules_overlap_check(&bootinfo.modules,
> +                                   region_start, region_size) )
> +        return true;
> +
>      return false;
>  }
>  
> @@ -328,6 +359,10 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>                 boot_module_kind_as_string(kind), start, start + size);
>          return NULL;
>      }
> +
> +    if ( check_reserved_regions_overlap(start, size) )
> +        return NULL;
> +
>      for ( i = 0 ; i < mods->nr_mods ; i++ )
>      {
>          mod = &mods->module[i];
> -- 
> 2.25.1
> 

