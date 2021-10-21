Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030DC435D85
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 11:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214239.372730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdTzd-00032m-VK; Thu, 21 Oct 2021 09:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214239.372730; Thu, 21 Oct 2021 09:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdTzd-00030y-SG; Thu, 21 Oct 2021 09:04:09 +0000
Received: by outflank-mailman (input) for mailman id 214239;
 Thu, 21 Oct 2021 09:04:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdTzc-00030s-Cb
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 09:04:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdTzc-0004rI-6l; Thu, 21 Oct 2021 09:04:08 +0000
Received: from [54.239.6.190] (helo=[192.168.27.91])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdTzb-0004DA-Tq; Thu, 21 Oct 2021 09:04:08 +0000
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
	bh=pA3pLUX/ci53s4QZwrl4pI8flMnEBB8vw0/4zipkqjo=; b=e4zhraTNxMFPjkNxbdsqwzHB4H
	1VeGrWABwOxBglG4Wbp42hcLRBmpSuilWT3eW67gbZIwNCJstg8L36pRLIiXTQ3+eALr1EER4tIKq
	Quddt/TY4Z6otV9GHyqmaryOQxrW6VKIoYpdQzJtpyLiV3OVDTuc3k8jf1CL+ReOHR6I=;
Message-ID: <6a32f269-57cb-111a-16a0-bcbabc208b4a@xen.org>
Date: Thu, 21 Oct 2021 10:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [XEN][RFC PATCH 06/13] device tree: Add dt_print_node_names()
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
 <1630562763-390068-7-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1630562763-390068-7-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 02/09/2021 07:05, Vikram Garhwal wrote:
> Add dt_print_node_names() to print all nodes under a dt_device_node.
> dt_print_node_names() takes a dt_device_node type input and prints the node name
> of all the subsequent nodes. This is added for debugging purpose for device tree
> overlays.

I can't find any use of this function in the rest of series. While I 
understand it was helpful for you, I am not entirely convinced that we 
should add it in Xen with no-use. The code is simple enough for anyone 
to re-implement it if needed.

Cheers,

> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/common/device_tree.c      | 10 ++++++++++
>   xen/include/xen/device_tree.h |  5 +++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index cda21be..bfe3191 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -308,6 +308,16 @@ struct dt_device_node *dt_find_node_by_path(const char *path)
>       return np;
>   }
>   
> +void dt_print_node_names(struct dt_device_node *dt)
> +{
> +    struct dt_device_node *np;
> +
> +    dt_for_each_device_node(dt, np)
> +        dt_dprintk("Node name: %s Full name %s\n", np->name, np->full_name);
> +
> +    return;
> +}
> +
>   int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
>                             struct dt_device_node **node)
>   {
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index a4e98a7..dcd96b4 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -483,6 +483,11 @@ struct dt_device_node *dt_find_node_by_path(const char *path);
>   int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
>                             struct dt_device_node **node);
>   
> +/*
> + * Prints all node names.
> + */
> +void dt_print_node_names(struct dt_device_node *dt);
> +
>   /**
>    * dt_get_parent - Get a node's parent if any
>    * @node: Node to get parent
> 

-- 
Julien Grall

