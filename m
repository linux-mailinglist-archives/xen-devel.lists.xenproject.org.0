Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188D8ACBD60
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 00:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003844.1383456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDmF-0000ym-GR; Mon, 02 Jun 2025 22:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003844.1383456; Mon, 02 Jun 2025 22:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDmF-0000wT-Dj; Mon, 02 Jun 2025 22:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1003844;
 Mon, 02 Jun 2025 22:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm0f=YR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMDmD-0000wJ-90
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 22:37:05 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a026a33-4002-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 00:37:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A70F14A77F;
 Mon,  2 Jun 2025 22:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF63C4CEEB;
 Mon,  2 Jun 2025 22:37:00 +0000 (UTC)
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
X-Inumbo-ID: 1a026a33-4002-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748903821;
	bh=EeA0Pmye73aHgg3zJyJjPO5SGssOoFQyd/y5MP61psQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HxLvJTTWSz6C0P9gvqQrATCKiczK0YhZtH90rTg5Kb2GpiFc7477ni2GEuKk9qtpj
	 I7xdfU7sFrmeMbevIMAhNKbXYFnNn5YkjRrdw7dvnc2AAZHQ3J3cLTKRYCJRMkJ3jt
	 sho3PtlX5Iv1d7LRmAgMdvZe/tEJqT1VaWOj9cb9i/NWHfTE143EAAKRAY6IeG3AJV
	 S6P3ntCmJGXb+p0eCkHr6+vrtX+uMoBKSTwsK71oPMPwZTVn8l5zcJrUDb6/T8BtCP
	 4gJhckAzBNz51MZevEYzcO5R8FpMxp2RH1h85F7e5sTl4VmfiDGgxuI19E5YtABfsA
	 ++lIFLQUjzt9A==
Date: Mon, 2 Jun 2025 15:36:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v3 2/5] xen/arm: dom0less: Add trap-unmapped-accesses
In-Reply-To: <20250530134559.1434255-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2506021535490.1147082@ubuntu-linux-20-04-desktop>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com> <20250530134559.1434255-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add the trap-unmapped-accesses per-domain fdt property.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  docs/misc/arm/device-tree/booting.txt | 10 ++++++++++
>  xen/arch/arm/dom0less-build.c         |  9 ++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 59fa96a82e..9add6440de 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -225,6 +225,16 @@ with the following properties:
>      option is provided with a non zero value, but the platform doesn't support
>      SVE.
>  
> +- trap-unmapped-accesses
> +
> +    Optional. An integer that configures handling of accesses to unmapped
> +    address ranges.
> +    If set to 0, guest accesses will read all bits as ones, e.g 0xFFFFFFFF
> +    for a 32bit access and writes will be ignored.
> +    If set to 1, guest accesses will trap.
> +
> +    This option is only implemented for ARM where the default is 1.

Please expand it to: "This option is only implemented for ARM where the
default is 1 when trap-unmapped-accesses is absent."

The change could be done on commit:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  - xen,enhanced
>  
>      A string property. Possible property values are:
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index a4e0a33632..69324aa597 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -344,8 +344,15 @@ void __init arch_create_domUs(struct dt_device_node *node,
>  #endif
>      }
>  
> -    /* Trap accesses to unmapped areas. */
> +    /* Trap unmapped accesses by default. */
>      d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> +    if ( dt_property_read_u32(node, "trap-unmapped-accesses", &val) )
> +    {
> +        if ( val > 1 )
> +            panic("trap-unmapped-accesses: supported values are 0 or 1");
> +        if ( !val )
> +            d_cfg->flags &= ~XEN_DOMCTL_CDF_trap_unmapped_accesses;
> +    }
>  }
>  
>  int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
> -- 
> 2.43.0
> 

