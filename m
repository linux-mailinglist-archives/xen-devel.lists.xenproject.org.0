Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3140EA3CF57
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 03:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893497.1302373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkwHL-0006nd-4K; Thu, 20 Feb 2025 02:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893497.1302373; Thu, 20 Feb 2025 02:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkwHL-0006l7-1N; Thu, 20 Feb 2025 02:27:07 +0000
Received: by outflank-mailman (input) for mailman id 893497;
 Thu, 20 Feb 2025 02:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkwHJ-0006l1-9T
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 02:27:05 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b9d7e90-ef32-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 03:27:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EDF3E61293;
 Thu, 20 Feb 2025 02:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7ABC4CED1;
 Thu, 20 Feb 2025 02:27:01 +0000 (UTC)
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
X-Inumbo-ID: 2b9d7e90-ef32-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740018422;
	bh=f84/9/uWuBGzCG/MZKiRyDn/KHwHnz3TREzDZvbgWV8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a44kizdwrAyaKbbX/t2yS8Ph20Q6rLFko41L/I5bHJn7KMiHBtXdKwVAkPtnHC74p
	 2OuJ1lv3ZyHfEdgSWO8j0ROSEtnncZoIaEoL7At6Z790fFwxFI+80tXsoHCSOIbjZc
	 mmlz49yTzsIGnDLb4Az3KVWNd3spHG97ZJ/IDrba5WX2TMcUrOyXdPln0ZDKjA2lxJ
	 qAv/w9B6X3Lv/Zt7wtX46Mk4BH/Wv5wD7sphvW5vSR3YQ1T0oJ9e7HoMJlJaNbvZvh
	 mUAxKrDwpFZ9AeekAw/iEepYacUx6A7dm6cdievDvZCsWSGQm3Z2DzApqbZwyBjmoH
	 LHeCkAECHna3g==
Date: Wed, 19 Feb 2025 18:26:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, oleksii.kurochko@gmail.com
Subject: Re: [PATCH] xen/arm: Create GIC node using the node name from host
 dt
In-Reply-To: <20250219172946.359234-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2502191825060.1791669@ubuntu-linux-20-04-desktop>
References: <20250219172946.359234-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Feb 2025, Michal Orzel wrote:
> At the moment the GIC node we create for hwdom has a name
> "interrupt-controller". Change it so that we use the same name as the
> GIC node from host device tree. This is done for at least 2 purposes:
> 1) The convention in DT spec is that a node name with "reg" property
> is formed "node-name@unit-address".
> 2) With DT overlay feature, many overlays refer to the GIC node using
> the symbol under __symbols__ that we copy to hwdom 1:1. With the name
> changed, the symbol is no longer valid and requires error prone manual
> change by the user.
> 
> The unit-address part of the node name always refers to the first
> address in the "reg" property which in case of GIC, always refers to
> GICD and hwdom uses host memory layout.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

While this fix changes behavior for everyone, so it is risky at RC5, it
also fixes bugs with DT overlays, but that is an experimental feature. I
am in two minds whether it should go in right now or not. Maybe I would
wait until 4.20 is out and commit when the tree reopens.


> ---
>  xen/arch/arm/domain_build.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7b47abade196..e760198d8609 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1615,6 +1615,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
>      int res = 0;
>      const void *addrcells, *sizecells;
>      u32 addrcells_len, sizecells_len;
> +    const char *name;
>  
>      /*
>       * Xen currently supports only a single GIC. Discard any secondary
> @@ -1628,7 +1629,11 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
>  
>      dt_dprintk("Create gic node\n");
>  
> -    res = fdt_begin_node(fdt, "interrupt-controller");
> +    /* Use the same name as the GIC node in host device tree */
> +    name = strrchr(gic->full_name, '/');
> +    name = name ? name + 1 : gic->full_name;
> +
> +    res = fdt_begin_node(fdt, name);
>      if ( res )
>          return res;
>  
> -- 
> 2.25.1
> 

