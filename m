Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAA2722F66
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543867.849204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Fd4-0003NS-Oe; Mon, 05 Jun 2023 19:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543867.849204; Mon, 05 Jun 2023 19:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Fd4-0003Kj-Ll; Mon, 05 Jun 2023 19:12:34 +0000
Received: by outflank-mailman (input) for mailman id 543867;
 Mon, 05 Jun 2023 19:12:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6Fd3-0003Kd-Ns
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 19:12:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6Fd3-0003kU-AI; Mon, 05 Jun 2023 19:12:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6Fd3-0000sg-4o; Mon, 05 Jun 2023 19:12:33 +0000
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
	bh=JDluLy/D4RlIUp5mDnyV7RrRJ75T8ZX9dc9iMWzz+x8=; b=E4lfOzXyXsAs3bk2QRGPNzt3HT
	D2n9Jh62pPui41Ga7T29AbSGtDdIXDksSbog1sTP4IQZVqJbQARhRGJ9O2BpPgrzxsdIX/9lwblhg
	vdqhLHpOXY5X2rgnkujSTgP8l8bHdpBwu29FG3/GpgNsBb8yy/jMNIIsy/rFAX69Xc6Q=;
Message-ID: <d6a40e00-e2e3-81d9-b596-45dcfb2becd6@xen.org>
Date: Mon, 5 Jun 2023 20:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-9-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230602004824.20731-9-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2023 01:48, Vikram Garhwal wrote:
> Add device_tree_find_node_by_path() to find a matching node with path for a

AFAICT, the only difference in name between the new function and the 
existing one is "device_tree" vs "dt". The latter is just a shorthand of 
"device tree", so it feels to me the name are a bit too similar.

 From my understanding, the main difference between the two functions 
are that the current one is starting from root whereas the current one 
is starting from a given node. So how about "dt_find_node_by_path_from()"?

> dt_device_node.
> 
> Reason behind this function:
>      Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>      device_tree_flattened) is created and updated with overlay nodes. This
>      updated fdt is further unflattened to a dt_host_new. Next, we need to find
>      the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
>      and add the nodes as child under their parent in the dt_host. Thus we need
>      this function to search for node in different unflattened device trees.
> 
> Also, make dt_find_node_by_path() static inline.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v6:
>      Rename "dt_node" to "from"
> ---
>   xen/common/device_tree.c      |  6 ++++--
>   xen/include/xen/device_tree.h | 18 ++++++++++++++++--
>   2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 16b4b4e946..c5250a1644 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -358,11 +358,13 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>       return np;
>   }
>   
> -struct dt_device_node *dt_find_node_by_path(const char *path)
> +struct dt_device_node *
> +                    device_tree_find_node_by_path(struct dt_device_node *from,
> +                                                  const char *path)
>   {
>       struct dt_device_node *np;
>   
> -    dt_for_each_device_node(dt_host, np)
> +    dt_for_each_device_node(from, np)
>           if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
>               break;
>   
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 2c35c0d391..e239f7de26 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -561,13 +561,27 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>   struct dt_device_node *dt_find_node_by_alias(const char *alias);
>   
>   /**
> - * dt_find_node_by_path - Find a node matching a full DT path
> + * device_tree_find_node_by_path - Generic function to find a node matching the
> + * full DT path for any given unflatten device tree
> + * @from: The device tree node to start searching from
>    * @path: The full path to match
>    *
>    * Returns a node pointer.
>    */
> -struct dt_device_node *dt_find_node_by_path(const char *path);
> +struct dt_device_node *
> +                    device_tree_find_node_by_path(struct dt_device_node *from,
> +                                                  const char *path);

The indentation looks slightly odd. In general, if the return type is on 
its own line, then the function name is not indented on the new line.

>   
> +/**
> + * dt_find_node_by_path - Find a node matching a full DT path in dt_host
> + * @path: The full path to match
> + *
> + * Returns a node pointer.
> + */
> +static inline struct dt_device_node *dt_find_node_by_path(const char *path)
> +{
> +    return device_tree_find_node_by_path(dt_host, path);
> +}
>   
>   /**
>    * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the

Cheers,

-- 
Julien Grall

