Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED299AE0A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 23:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817392.1231421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szNBx-0004uZ-FA; Fri, 11 Oct 2024 21:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817392.1231421; Fri, 11 Oct 2024 21:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szNBx-0004t4-CU; Fri, 11 Oct 2024 21:28:57 +0000
Received: by outflank-mailman (input) for mailman id 817392;
 Fri, 11 Oct 2024 21:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cjjf=RH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1szNBv-0004sx-HW
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 21:28:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d019b0f8-8817-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 23:28:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0C2F5C3A78;
 Fri, 11 Oct 2024 21:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A92C4CEC3;
 Fri, 11 Oct 2024 21:28:50 +0000 (UTC)
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
X-Inumbo-ID: d019b0f8-8817-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728682131;
	bh=NS4UDwdyZemeeefXRUfL3egym5I7xcbX12BXPfVR0ds=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lwNREFNVge7xS8DvC8BuPW2tfC52ZEOgvipGqT+SzN6/aBZs8LRgJG2P+9J1ntarG
	 3fRaVuJzvDp/2oTTP4XvlLbJ6RFEvxkKusbyhSmONQwhEa0DdPMtS4M3RSlFSROX5P
	 brGRxyWumxEQPLDzU40t/W9WFuYCfSeMJl0lnCJ1DhEuyT+sz2KLSjEmM7xoJVH2xQ
	 fQA9SMu6USwLBVXBl4YeMA5yVmtBSJUm7tiGlgr4YOZpYaXaS8GJ5pPQR96zPs61Nm
	 1mhPZA2QkaHmU08k96dOmpVbxk/KAwu257YZ5gvbO1mtMQ2lErdl5ZWy97kST0ZwzW
	 kjkLyTL7/scWg==
Date: Fri, 11 Oct 2024 14:28:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: dom0less: cope with missing /gic phandle
In-Reply-To: <20241011211957.447290-1-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410111428450.471028@ubuntu-linux-20-04-desktop>
References: <20241011211957.447290-1-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Oct 2024, Stewart Hildebrand wrote:
> If a partial DT has a /gic node, but no references to it, dtc may omit
> the phandle property. With the phandle property missing,
> fdt_get_phandle() returns 0, leading Xen to generate a malformed domU
> dtb due to invalid interrupt-parent phandle references. 0 is an invalid
> phandle value. Add a zero check, and fall back to GUEST_PHANDLE_GIC.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/dom0less-build.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 09b65e44aed3..f328a044e9d3 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -554,7 +554,10 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
>           */
>          if ( dt_node_cmp(name, "gic") == 0 )
>          {
> -            kinfo->phandle_gic = fdt_get_phandle(pfdt, node_next);
> +            uint32_t phandle_gic = fdt_get_phandle(pfdt, node_next);
> +
> +            if ( phandle_gic != 0 )
> +                kinfo->phandle_gic = phandle_gic;
>              continue;
>          }
>  
> 
> base-commit: 76a54badf890f56ff72644593c0fbc72138e13aa
> -- 
> 2.47.0
> 

