Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668BA97D065
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 05:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800988.1211022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srUjN-0000HX-7y; Fri, 20 Sep 2024 03:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800988.1211022; Fri, 20 Sep 2024 03:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srUjN-0000Do-2b; Fri, 20 Sep 2024 03:54:53 +0000
Received: by outflank-mailman (input) for mailman id 800988;
 Fri, 20 Sep 2024 03:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEHU=QS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1srUjL-0007lS-T5
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 03:54:51 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1580ebfe-7704-11ef-99a2-01e77a169b0f;
 Fri, 20 Sep 2024 05:54:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C57DA4411A;
 Fri, 20 Sep 2024 03:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3D5C4CEC3;
 Fri, 20 Sep 2024 03:54:48 +0000 (UTC)
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
X-Inumbo-ID: 1580ebfe-7704-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726804489;
	bh=GZTdKaczBVAv1RU5yeFOv73OuWXAGjOJAo6YB2IOBQU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cFzsjO7o2NP/grF1VY2LjEX1FhuILNeMfjDLUdcKma63Y2ZmmrXbrm+ilNMRLrjOF
	 DNgfgRNFB5hQUif4XsksBaem1ktCT2IL2nQR5IEH8ZBM7FgEOhR/c71vdYmpRRTPmx
	 WcKMsq71oCfU8DOhGO89/0Qoe4AmGrHjDAm7TFF2QUm4OpBKF1fpoNGtBGP1I7H8rB
	 rK9gfp1DBcbz+L21HzRppW4puVd1RVEjtj6a1MMwkyMf6PF8inxvbHcaNr3eCmYEkU
	 9XQVuiuKlorGuObjwy60PPJgLPOsjeKz9xSv+hnfq8IWy8KrHKKX+cxMafAEYhWxKP
	 95+S8v2bS6tzA==
Date: Thu, 19 Sep 2024 20:54:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 4/4] dt-overlay: Support target-path being root node
In-Reply-To: <20240919104238.232704-5-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2409191503580.1417852@ubuntu-linux-20-04-desktop>
References: <20240919104238.232704-1-michal.orzel@amd.com> <20240919104238.232704-5-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Sep 2024, Michal Orzel wrote:
> Even though in most cases device nodes are not present directly under
> the root node, it's a perfectly valid configuration (e.g. Qemu virt
> machine dtb). At the moment, we don't handle this scenario which leads
> to unconditional addition of extra leading '/' in the node full path.
> This makes the attempt to add such device overlay to fail.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/common/dt-overlay.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index d18bd12bd38d..63b28889de90 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -325,6 +325,7 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
>              int node_name_len;
>              unsigned int target_path_len = strlen(target_path);
>              unsigned int node_full_name_len;
> +            unsigned int extra_len;
>  
>              node_name = fdt_get_name(fdto, subnode, &node_name_len);
>  
> @@ -332,10 +333,13 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
>                  return node_name_len;
>  
>              /*
> -             * Magic number 2 is for adding '/' and '\0'. This is done to keep
> -             * the node_full_path in the correct full node name format.
> +             * Extra length is for adding '/' and '\0' unless the target path is
> +             * root in which case we don't add the '/' at the beginning. This is
> +             * done to keep the node_full_path in the correct full node name
> +             * format.
>               */
> -            node_full_name_len = target_path_len + node_name_len + 2;
> +            extra_len = (target_path_len > 1) + 1;

I'd prefer to avoid the implicit bool to int conversion. I think it is
mandated by MISRA R10.1, we have a bool exception but I don't think it
would cover this type of usage. For instance:

extra_len = ((target_path_len > 1) ? 1 : 0)  + 1;

or

extra_len = (target_path_len > 1) ? 2 : 1;


> +            node_full_name_len = target_path_len + node_name_len + extra_len;
>  
>              nodes_full_path[node_num] = xmalloc_bytes(node_full_name_len);
>  
> @@ -344,9 +348,11 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
>  
>              memcpy(nodes_full_path[node_num], target_path, target_path_len);
>  
> -            nodes_full_path[node_num][target_path_len] = '/';
> +            /* Target is not root - add separator */
> +            if ( target_path_len > 1 )
> +                nodes_full_path[node_num][target_path_len++] = '/';
>  
> -            memcpy(nodes_full_path[node_num] + target_path_len + 1,
> +            memcpy(nodes_full_path[node_num] + target_path_len,
>                      node_name, node_name_len);
>  
>              nodes_full_path[node_num][node_full_name_len - 1] = '\0';
> -- 
> 2.37.6
> 

