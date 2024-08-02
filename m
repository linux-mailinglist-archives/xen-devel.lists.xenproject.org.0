Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5EC9464F4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 23:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771333.1181941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZzhh-0004P9-1k; Fri, 02 Aug 2024 21:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771333.1181941; Fri, 02 Aug 2024 21:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZzhg-0004Nf-UC; Fri, 02 Aug 2024 21:20:48 +0000
Received: by outflank-mailman (input) for mailman id 771333;
 Fri, 02 Aug 2024 21:20:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZzhe-0004NZ-R6
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 21:20:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13acc28f-5115-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 23:20:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6035B628BC;
 Fri,  2 Aug 2024 21:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2506AC32782;
 Fri,  2 Aug 2024 21:20:42 +0000 (UTC)
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
X-Inumbo-ID: 13acc28f-5115-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722633643;
	bh=gZieMJsogEOuFTWGeMFfv426PVhIQ7ykKlKqIJsIQH8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QFGNZ3WbIAYkIsYR0JkLUWctDvsvU9sCtgeXtMO4M840WNIMPj0jJUI4vZekm5Dx9
	 2HhuuwUtyXRJDB3y/IJbXbllPW7Mq6iexxodUqRwKd9bXaAwLdmrP1peON3li/jOIP
	 6gnx1SGPwWuTcRsMYyQRbzISFDPQLCJRTvxAVPsSnwI2CqSRkxNjt98DYyQzDKy3vc
	 cjovrGpk6BGe20UPE8zdSo2gV+UsSac0tPBgXt5kk4MF551XF2zqGsrTSr32e5t0n7
	 k0zSlj2Tn2n8gkBhjaess6I/yNIuz8L/paul3bY+jANjlLXr8Y95SRscdeGOYco8V/
	 2S2YWWvHi2X0w==
Date: Fri, 2 Aug 2024 14:20:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vITS: add #msi-cells property
In-Reply-To: <20240802182654.8976-1-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2408021420320.114241@ubuntu-linux-20-04-desktop>
References: <20240802182654.8976-1-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 Aug 2024, Stewart Hildebrand wrote:
> Non-PCI platform devices may use the ITS. Dom0 Linux drivers for such
> devices are failing to register IRQs due to a missing #msi-cells
> property. Add the missing #msi-cells property.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> See Linux dc4dae00d82f ("Docs: dt: add #msi-cells to GICv3 ITS binding")
> ---
>  xen/arch/arm/gic-v3-its.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 8afcd9783bc8..55bed3fe87d0 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -951,6 +951,10 @@ int gicv3_its_make_hwdom_dt_nodes(const struct domain *d,
>          if ( res )
>              return res;
>  
> +        res = fdt_property_cell(fdt, "#msi-cells", 1);
> +        if ( res )
> +            return res;
> +
>          if ( its->phandle )
>          {
>              res = fdt_property_cell(fdt, "phandle", its->phandle);
> 
> base-commit: 984cb316cb27b53704c607e640a7dd2763b898ab
> -- 
> 2.45.2
> 

