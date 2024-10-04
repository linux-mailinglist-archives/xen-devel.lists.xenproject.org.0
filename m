Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66906991115
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 23:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810635.1223355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpRt-0003ef-JX; Fri, 04 Oct 2024 21:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810635.1223355; Fri, 04 Oct 2024 21:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpRt-0003cl-Gu; Fri, 04 Oct 2024 21:02:53 +0000
Received: by outflank-mailman (input) for mailman id 810635;
 Fri, 04 Oct 2024 21:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rX0y=RA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1swpRr-0003cb-AT
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 21:02:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 029500a7-8294-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 23:02:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E2F15C594F;
 Fri,  4 Oct 2024 21:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8769EC4CECC;
 Fri,  4 Oct 2024 21:02:46 +0000 (UTC)
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
X-Inumbo-ID: 029500a7-8294-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728075767;
	bh=99fL6x7aBJpu4R6Wrzg9r1y1JYZN75JTOS2TqT99aAw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sGe85wEDX0iOTdaHGSKvONbuKrP/OQqVofI/6d9r2xY2Y8RyFlLT23xBKVXvh1N/4
	 aoouhUZlJfCF4TRy2Xc5PcM0p1w+rB3MnLTrJErk8QkHUIKZjRCyEAQkLV8mm0Z8jd
	 SCvXfBgqej4/7MNHAiyYIlgY/eygwdv34fFgMt23WAprFcXssjPFHRvB23MbYRclJL
	 ogXvfaFXKByt392NE71cDBPLwFucEVPXZIBI+8ioe1+xl/zdd8WSlih88MZ5H7yZhn
	 vu2wNJtfXLlpDnU4sPtGpBEfJnAoeH/3/5mc2ndOrrQosM1LudkS3GIuuY8NcHIQFn
	 58Wa/DNq8ZxjA==
Date: Fri, 4 Oct 2024 14:02:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 5/6] dt-overlay: Ignore nodes that do not have
 __overlay__ as their subnode
In-Reply-To: <20241004122220.234817-6-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410041402350.1138574@ubuntu-linux-20-04-desktop>
References: <20241004122220.234817-1-michal.orzel@amd.com> <20241004122220.234817-6-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Oct 2024, Michal Orzel wrote:
> Assumption stated in the comments as if fdt_for_each_subnode() checks
> for parent < 0 is utterly wrong. If parent is < 0, node offset is set to
> 0 (i.e. the very first node in the tree) and the loop's body is executed.
> This incorrect assumption causes overlay_node_count() to also count nodes
> that do not have __overlay__ as their subnode. The same story goes for
> overlay_get_nodes_info(), where we end up requiring each node directly
> under root node to have "target-path" set. DTBOs can specify other nodes
> including special ones like __symbols__, __fixups__ that can be left to
> reduce the number of steps a user needs to do to when it comes to invalid
> phandles.
> 
> Fix it by adding checks if overlay < 0 after respective calls to
> fdt_subnode_offset().
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Good catch!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> Changes in v2:
>  - New patch
> ---
>  xen/common/dt-overlay.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index bfa153250922..4d75b5b36a99 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -274,11 +274,9 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
>          int overlay;
>  
>          overlay = fdt_subnode_offset(overlay_fdt, fragment, "__overlay__");
> +        if ( overlay < 0 )
> +            continue;
>  
> -        /*
> -         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
> -         * overlay >= 0. So, no need for a overlay>=0 check here.
> -         */
>          fdt_for_each_subnode(subnode, overlay_fdt, overlay)
>          {
>              num_overlay_nodes++;
> @@ -305,6 +303,10 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
>          int subnode;
>          const char *target_path;
>  
> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> +        if ( overlay < 0 )
> +            continue;
> +
>          target = fdt_overlay_target_offset(device_tree_flattened, fdto,
>                                             fragment, &target_path);
>          if ( target < 0 )
> @@ -313,12 +315,6 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
>          if ( target_path == NULL )
>              return -EINVAL;
>  
> -        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> -
> -        /*
> -         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
> -         * overlay >= 0. So, no need for a overlay>=0 check here.
> -         */
>          fdt_for_each_subnode(subnode, fdto, overlay)
>          {
>              const char *node_name = NULL;
> -- 
> 2.25.1
> 

