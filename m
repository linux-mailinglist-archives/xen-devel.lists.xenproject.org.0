Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6D722EFB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 20:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543852.849174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6FLl-0008FG-Q1; Mon, 05 Jun 2023 18:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543852.849174; Mon, 05 Jun 2023 18:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6FLl-0008CL-Mp; Mon, 05 Jun 2023 18:54:41 +0000
Received: by outflank-mailman (input) for mailman id 543852;
 Mon, 05 Jun 2023 18:54:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6FLk-0008CD-8U
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 18:54:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6FLj-0003Gs-Qj; Mon, 05 Jun 2023 18:54:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6FLj-0007iz-Kf; Mon, 05 Jun 2023 18:54:39 +0000
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
	bh=7RdQuv1q0hdQaq+IETpRXqG3ZnyaoXflTXvaYh2775I=; b=Ae7junzg4xNVIHlIixjAZONpsl
	Wb2HJU+k28EzSvlmsm94cEpHkRlewVhDmswpbSEnG6F6gXGUVyVeYfVjwP33Fx38/pqTcITAO/9EV
	jcG3Upbkzl4qQP/FWjwVsD3AC7yLgTgkAgT/K3wnNpyG9oMy0mJq6fIUqwoPYYSp8nE0=;
Message-ID: <05fc6244-18fd-035a-82a2-d637a0171f64@xen.org>
Date: Mon, 5 Jun 2023 19:54:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v7 01/19] common/device_tree: handle memory
 allocation failure in __unflatten_device_tree()
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-2-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230602004824.20731-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2023 01:48, Vikram Garhwal wrote:
> Change __unflatten_device_tree() return type to integer so it can propagate
> memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
> memory allocation failure during boot.
> 
> Fixes: fb97eb614acf ("xen/arm: Create a hierarchical device tree")
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

With Michal's remark handled (it can be done on commit):

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> ---
>   xen/common/device_tree.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 8da1052911..dfdb10e488 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2092,8 +2092,8 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>    * @fdt: The fdt to expand
>    * @mynodes: The device_node tree created by the call
>    */
> -static void __init __unflatten_device_tree(const void *fdt,
> -                                           struct dt_device_node **mynodes)
> +static int __init __unflatten_device_tree(const void *fdt,
> +                                          struct dt_device_node **mynodes)
>   {
>       unsigned long start, mem, size;
>       struct dt_device_node **allnextp = mynodes;
> @@ -2114,6 +2114,8 @@ static void __init __unflatten_device_tree(const void *fdt,
>   
>       /* Allocate memory for the expanded device tree */
>       mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
> +    if ( !mem )
> +        return -ENOMEM;
>   
>       ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
>   
> @@ -2131,6 +2133,8 @@ static void __init __unflatten_device_tree(const void *fdt,
>       *allnextp = NULL;
>   
>       dt_dprintk(" <- unflatten_device_tree()\n");
> +
> +    return 0;
>   }
>   
>   static void dt_alias_add(struct dt_alias_prop *ap,
> @@ -2215,7 +2219,11 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
>   
>   void __init dt_unflatten_host_device_tree(void)
>   {
> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
> +    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
> +
> +    if ( error )
> +        panic("__unflatten_device_tree failed with error %d\n", error);
> +
>       dt_alias_scan();
>   }
>   

-- 
Julien Grall

