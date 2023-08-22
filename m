Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 399237849E9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 21:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588675.920244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYWiS-0002u5-Ud; Tue, 22 Aug 2023 19:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588675.920244; Tue, 22 Aug 2023 19:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYWiS-0002rh-R6; Tue, 22 Aug 2023 19:07:00 +0000
Received: by outflank-mailman (input) for mailman id 588675;
 Tue, 22 Aug 2023 19:06:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYWiQ-0002rZ-WD
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 19:06:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYWiQ-00044d-RN; Tue, 22 Aug 2023 19:06:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYWiQ-0002mm-ME; Tue, 22 Aug 2023 19:06:58 +0000
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
	bh=yaFW+7PoDIYTu6VLmzp6R7ykz53NCbyzrjMTuxeg2OY=; b=x4QKj6sFJpi+WT2lUrTFiFdoG3
	e45Kr8ZuhpZczamZTPr//62C8m9Teyg1CSwSrjSp3MnxXjrm2tSYG8MA7q5S7M4nToZFWEZU4FT3a
	LVvpn3OJL3LX2i36eIH1H1x5AysfLr8kv1SXfdkmq2KMleT8/YdKksAhpZIIi4kGP7Jo=;
Message-ID: <5453df68-b2a6-4801-8d09-cafbd1d805fe@xen.org>
Date: Tue, 22 Aug 2023 20:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 01/19] common/device_tree: handle memory
 allocation failure in __unflatten_device_tree()
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-2-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 19/08/2023 01:28, Vikram Garhwal wrote:
> Change __unflatten_device_tree() return type to integer so it can propagate
> memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
> memory allocation failure during boot.
> 
> Fixes: fb97eb614acf ("xen/arm: Create a hierarchical device tree")
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
>   xen/common/device_tree.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 0522fdf976..c91d54c493 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2092,8 +2092,8 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>    * @fdt: The fdt to expand
>    * @mynodes: The device_node tree created by the call
>    */

While looking at patch #4, I noticed that the comment wasn't updated to 
mention the meaning of the return value. Can this be done?

If you propose a new comment on the ML, I can update it while committing 
patch. IOW no need to resend a new version for this patch.

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
>       ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeefU);
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

Cheers,

-- 
Julien Grall

