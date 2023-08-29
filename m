Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED15C78CF85
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 00:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592477.925196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb7Bd-0007EX-Kc; Tue, 29 Aug 2023 22:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592477.925196; Tue, 29 Aug 2023 22:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb7Bd-0007BW-Hx; Tue, 29 Aug 2023 22:27:49 +0000
Received: by outflank-mailman (input) for mailman id 592477;
 Tue, 29 Aug 2023 22:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jw1q=EO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qb7Bc-0007BO-HD
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 22:27:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46b9d3b9-46bb-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 00:27:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2376460FB6;
 Tue, 29 Aug 2023 22:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E37C433C7;
 Tue, 29 Aug 2023 22:27:43 +0000 (UTC)
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
X-Inumbo-ID: 46b9d3b9-46bb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693348064;
	bh=xon4TWzIfy79dV5EBufO+AE6FB8msDtSdAeA3UMIsE8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bnOx26iz/O72RA8DJKA7j01iIo9tCPvMMZPPd8y35X+82nN+EUP4PO5BiASeims2/
	 Lhk6ZylIwa0nNBFVRDNO+ZOwC/0p5jkjD8IhQpxsreXnTYi3gdkIyclGDgsKQWwe6o
	 bg5edA2FeXvZA2btB0dL/xenvuJ9mcpS80TZ++wgXsFPHqnSJOw/aYinYXjAkphU4+
	 6ba+f97nObi/Zx4gNxKoAa/QjyFi9OA/HsGZ1Vk4LgP1Oqa1IXMNAl3uluCEXNwflp
	 nYf52YITVc+yljMhDtau+2qjzpOIHgJppctYG/Jw81sIlabgxSCHhWT2EEZXIE0a68
	 IhwZozo9uakKw==
Date: Tue, 29 Aug 2023 15:27:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    sstabellini@kernel.org, julien@xen.org
Subject: Re: [XEN][PATCH v10 08/20] xen/device-tree: Add device_tree_find_node_by_path()
 to find nodes in device tree
In-Reply-To: <20230825080222.14247-9-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2308291527350.6458@ubuntu-linux-20-04-desktop>
References: <20230825080222.14247-1-vikram.garhwal@amd.com> <20230825080222.14247-9-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Aug 2023, Vikram Garhwal wrote:
> Add device_tree_find_node_by_path() to find a matching node with path for a
> dt_device_node.
> 
> Reason behind this function:
>     Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>     device_tree_flattened) is created and updated with overlay nodes. This
>     updated fdt is further unflattened to a dt_host_new. Next, we need to find
>     the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
>     and add the nodes as child under their parent in the dt_host. Thus we need
>     this function to search for node in different unflattened device trees.
> 
> Also, make dt_find_node_by_path() static inline.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v9:
>     Fix indentation issues.
> 
> Changes from v7:
>     Rename device_tree_find_node_by_path() to dt_find_node_by_path_from().
>     Fix indentation.
> ---
> ---
>  xen/common/device_tree.c      |  5 +++--
>  xen/include/xen/device_tree.h | 17 +++++++++++++++--
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index b8ef1c7ae2..f38f51ec0b 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>      return np;
>  }
>  
> -struct dt_device_node *dt_find_node_by_path(const char *path)
> +struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
> +                                                 const char *path)
>  {
>      struct dt_device_node *np;
>  
> -    dt_for_each_device_node(dt_host, np)
> +    dt_for_each_device_node(from, np)
>          if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
>              break;
>  
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index a518310a62..44d315c8ba 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -570,13 +570,26 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>  struct dt_device_node *dt_find_node_by_alias(const char *alias);
>  
>  /**
> - * dt_find_node_by_path - Find a node matching a full DT path
> + * dt_find_node_by_path_from - Generic function to find a node matching the
> + * full DT path for any given unflatten device tree
> + * @from: The device tree node to start searching from
>   * @path: The full path to match
>   *
>   * Returns a node pointer.
>   */
> -struct dt_device_node *dt_find_node_by_path(const char *path);
> +struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
> +                                                 const char *path);
>  
> +/**
> + * dt_find_node_by_path - Find a node matching a full DT path in dt_host
> + * @path: The full path to match
> + *
> + * Returns a node pointer.
> + */
> +static inline struct dt_device_node *dt_find_node_by_path(const char *path)
> +{
> +    return dt_find_node_by_path_from(dt_host, path);
> +}
>  
>  /**
>   * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
> -- 
> 2.17.1
> 

