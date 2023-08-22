Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CFF784A4B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 21:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588691.920264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYWwK-0006Fd-GN; Tue, 22 Aug 2023 19:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588691.920264; Tue, 22 Aug 2023 19:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYWwK-0006Cu-DI; Tue, 22 Aug 2023 19:21:20 +0000
Received: by outflank-mailman (input) for mailman id 588691;
 Tue, 22 Aug 2023 19:21:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYWwJ-0006Co-QM
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 19:21:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYWwJ-0004W0-D4; Tue, 22 Aug 2023 19:21:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYWwJ-0003VD-7r; Tue, 22 Aug 2023 19:21:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=7dlJyCUWxd/FO4FA7hNRogTRseOCS5sG9YhbqorsCpM=; b=J0wE6VBGsNYmolFF7zXyWRgXTV
	xVT/OQyIVacmzpdTY6dKmYD3bMjtrcZW16GB+VxKHukXeQuMYjX+9fATheIaVghw1csS/KXrIRCkX
	t/Mi7QI1R2E2gSohDMZgdnOb3vp+269R9KWElDM/g0cpcVz3yYKQcPNt++AFpcTccsSc=;
Message-ID: <b18ef35f-a4df-4121-9b3c-aa96a8002d87@xen.org>
Date: Tue, 22 Aug 2023 20:21:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-9-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-9-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 19/08/2023 01:28, Vikram Garhwal wrote:
> Add device_tree_find_node_by_path() to find a matching node with path for a
> dt_device_node.
> 
> Reason behind this function:
>      Each time overlay nodes are added using .dtbo, a new fdt(memcpy of

Typo: missing space before (.

>      device_tree_flattened) is created and updated with overlay nodes. This
>      updated fdt is further unflattened to a dt_host_new. Next, we need to find
>      the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
>      and add the nodes as child under their parent in the dt_host. Thus we need
>      this function to search for node in different unflattened device trees.
> 
> Also, make dt_find_node_by_path() static inline.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

> ---
> Changes from v7:
>      Rename device_tree_find_node_by_path() to dt_find_node_by_path_from().
>      Fix indentation.
> ---
> ---
>   xen/common/device_tree.c      |  5 +++--
>   xen/include/xen/device_tree.h | 18 ++++++++++++++++--
>   2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 67e9b6de3e..0f10037745 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>       return np;
>   }
>   
> -struct dt_device_node *dt_find_node_by_path(const char *path)
> +struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
> +                                                 const char *path)

Any change this both 'from' and the return can be const?

>   {
>       struct dt_device_node *np;
>   
> -    dt_for_each_device_node(dt_host, np)
> +    dt_for_each_device_node(from, np)
>           if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
>               break;
>   
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 5941599eff..e507658b23 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -568,13 +568,27 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>   struct dt_device_node *dt_find_node_by_alias(const char *alias);
>   
>   /**
> - * dt_find_node_by_path - Find a node matching a full DT path
> + * dt_find_node_by_path_from - Generic function to find a node matching the
> + * full DT path for any given unflatten device tree
> + * @from: The device tree node to start searching from
>    * @path: The full path to match
>    *
>    * Returns a node pointer.
>    */
> -struct dt_device_node *dt_find_node_by_path(const char *path);
> +struct dt_device_node *
> +                    dt_find_node_by_path_from(struct dt_device_node *from,
> +                                                  const char *path);

Coding style: The indentation look rather odd. I am not sure it will 
render properly here. But one style that is closer to the rest of the 
file and Xen is:

struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node 
*from,
                                                  const char *path);

Where the return type, function name and first parameter is one line and 
the second parameter is on the second line with the type aligned with 
the type of the first parameter.

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
>   /**
>    * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the

Cheers,

-- 
Julien Grall

