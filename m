Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDE5722F25
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543857.849185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6FUq-0001Lj-NU; Mon, 05 Jun 2023 19:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543857.849185; Mon, 05 Jun 2023 19:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6FUq-0001Ii-K8; Mon, 05 Jun 2023 19:04:04 +0000
Received: by outflank-mailman (input) for mailman id 543857;
 Mon, 05 Jun 2023 19:04:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6FUo-0001Ic-B2
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 19:04:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6FUn-0003Sr-VA; Mon, 05 Jun 2023 19:04:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6FUn-0000Or-Pd; Mon, 05 Jun 2023 19:04:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=ptu0H6WrAkKIy/b9xGJxdfGXIiKyYr3scISjo0Zqy/0=; b=rqbUfds9tNOzaGoO9SN7oAOUnB
	UJtdWpQ70ZT4IREW8/FAbY3UKQYsdqTZSVhvvoqgW6e2cI26QWuZq0KJaR9EjvaGeeMF1YGa+pbAL
	aHFdFXR7JSeAN/2rzyZp49+IxmtxVOiSSVEKSvyVRoXUqwTW6EUyhJF9GoGQsXr8o1j0=;
Message-ID: <ad9c88a0-bbbb-1ef7-0104-d201468897e0@xen.org>
Date: Mon, 5 Jun 2023 20:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-5-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN][PATCH v7 04/19] common/device_tree: change
 __unflatten_device_tree() type
In-Reply-To: <20230602004824.20731-5-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title:

'type' is a bit confusing here. How about "Export __unflatten_device_tre()"?

On 02/06/2023 01:48, Vikram Garhwal wrote:
> Following changes are done to __unflatten_device_tree():
>      1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>      2. Remove __init and static function type.

As there is no external caller yet, please explain why you want to 
export the function.

Cheers,

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> ---
>   xen/common/device_tree.c      | 9 ++++-----
>   xen/include/xen/device_tree.h | 5 +++++
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index bbdab07596..16b4b4e946 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2083,7 +2083,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
>   }
>   
>   /**
> - * __unflatten_device_tree - create tree of device_nodes from flat blob
> + * unflatten_device_tree - create tree of device_nodes from flat blob
>    *
>    * unflattens a device-tree, creating the
>    * tree of struct device_node. It also fills the "name" and "type"
> @@ -2092,8 +2092,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
>    * @fdt: The fdt to expand
>    * @mynodes: The device_node tree created by the call
>    */
> -static int __init __unflatten_device_tree(const void *fdt,
> -                                          struct dt_device_node **mynodes)
> +int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
>   {
>       unsigned long start, mem, size;
>       struct dt_device_node **allnextp = mynodes;
> @@ -2230,10 +2229,10 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
>   
>   void __init dt_unflatten_host_device_tree(void)
>   {
> -    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
> +    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
>   
>       if ( error )
> -        panic("__unflatten_device_tree failed with error %d\n", error);
> +        panic("unflatten_device_tree failed with error %d\n", error);
>   
>       dt_alias_scan();

This function doesn't seem to be called in the case of the overlay 
device-tree. Does this mean that it will never contain any alias?

>   }
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index c2eada7489..2c35c0d391 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -178,6 +178,11 @@ int device_tree_for_each_node(const void *fdt, int node,
>    */
>   void dt_unflatten_host_device_tree(void);
>   
> +/**
> + * unflatten any device tree.

Most of the exported function in device_tre.h have documentation. Can 
you do the same here?

> + */
> +int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);

NIT: From an external interface perspective, do we actually need to pass 
an extra pointer? Can't we instead, return the pointer?

> +
>   /**
>    * IRQ translation callback
>    * TODO: For the moment we assume that we only have ONE

Cheers,

-- 
Julien Grall

