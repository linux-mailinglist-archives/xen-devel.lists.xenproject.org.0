Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D799110D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 23:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810630.1223346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpPW-00035i-88; Fri, 04 Oct 2024 21:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810630.1223346; Fri, 04 Oct 2024 21:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpPW-00034C-5M; Fri, 04 Oct 2024 21:00:26 +0000
Received: by outflank-mailman (input) for mailman id 810630;
 Fri, 04 Oct 2024 21:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rX0y=RA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1swpPU-000346-NU
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 21:00:24 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab64c39d-8293-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 23:00:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 01C27A4187E;
 Fri,  4 Oct 2024 21:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C33C4CEC6;
 Fri,  4 Oct 2024 21:00:20 +0000 (UTC)
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
X-Inumbo-ID: ab64c39d-8293-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728075621;
	bh=YCqKB4xMI//wg9hUiR3UkGuVmjEvths1jKvjyC8RrIc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qv72VAyN7DwOTGBD3bjppdr4aWyUVOPUEXwH/KdI1/+Ijno/0rtssWSNIvSIPXMXo
	 u0ViwvBcLvGMUau7HBI8yEyhiE2zz+VsFrm3Z3wNf+Esrcyvpo7Xsw0O/h58PzvR0i
	 db6k9UPUd3fbrKmuAJJwKvCluZEHNFdleBTuJFK/paBOpEi+70z6KZzImIzMgm7NQG
	 IbuJr4rX1GlB75G4PQ/YV1BJNE5DDoWOhqrRZZPvFv2FEqIbxbn95uaQIDRKHr/YLq
	 q/LHUDM4BdMq6VMOE31OJvTgCRzEfLB7r+Kr+1RM3GFKQ5QuynX2wQiC/6dC9Pt59w
	 pobni7FLQ9eZw==
Date: Fri, 4 Oct 2024 14:00:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 4/6] dt-overlay: Support target-path being root node
In-Reply-To: <20241004122220.234817-5-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410041400120.1138574@ubuntu-linux-20-04-desktop>
References: <20241004122220.234817-1-michal.orzel@amd.com> <20241004122220.234817-5-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Oct 2024, Michal Orzel wrote:
> Even though in most cases device nodes are not present directly under
> the root node, it's a perfectly valid configuration (e.g. Qemu virt
> machine dtb). At the moment, we don't handle this scenario which leads
> to unconditional addition of extra leading '/' in the node full path.
> This makes the attempt to add such device overlay to fail.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - Use ?: instead of implicit bool->int conversion
> ---
>  xen/common/dt-overlay.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index d18bd12bd38d..bfa153250922 100644
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
> +            extra_len = (target_path_len > 1) ? 2 : 1;
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
> 2.25.1
> 

