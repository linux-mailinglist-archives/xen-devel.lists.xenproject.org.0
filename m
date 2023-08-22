Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70D784948
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 20:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588646.920204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYVqo-0003pW-5S; Tue, 22 Aug 2023 18:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588646.920204; Tue, 22 Aug 2023 18:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYVqo-0003ni-1x; Tue, 22 Aug 2023 18:11:34 +0000
Received: by outflank-mailman (input) for mailman id 588646;
 Tue, 22 Aug 2023 18:11:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYVql-0003nc-Og
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 18:11:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYVql-0002uV-Ea; Tue, 22 Aug 2023 18:11:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYVql-0000bN-9Y; Tue, 22 Aug 2023 18:11:31 +0000
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
	bh=3wUSgsV7i3tFMHletwRMdkCO43PEeh+5KzdeLQWpuZA=; b=vuT6yaPKoJuo2znZCQuE3YBC1r
	6duB68YZhbWUMWDXIzAbNzO7WzFjcETDOrVpa0lrkSzZz+HDEIPb7gYABe3rBd8yEIhGwRlMx+7Op
	5Rd8hGDlVpbzpDowYwXRpUolY9MJGf7xDJJrHkBdCppAAi4Pa3vyIurgeiDx2A+baQbQ=;
Message-ID: <e1b45a1f-321d-4107-9f8b-97a0da596d63@xen.org>
Date: Tue, 22 Aug 2023 19:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 02/19] common/device_tree.c:
 unflatten_device_tree() propagate errors
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-3-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 19/08/2023 01:28, Vikram Garhwal wrote:
> This will be useful in dynamic node programming when new dt nodes are unflattend
> during runtime. Invalid device tree node related errors should be propagated
> back to the caller.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v7:
>      Free allocated memory in case of errors when calling unflatten_dt_node.
> ---
> ---
>   xen/common/device_tree.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index c91d54c493..cd9a6a5c93 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2108,6 +2108,9 @@ static int __init __unflatten_device_tree(const void *fdt,
>       /* First pass, scan for size */
>       start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
>       size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
> +    if ( !size )
> +        return -EINVAL;
> +
>       size = (size | 3) + 1;
>   
>       dt_dprintk("  size is %#lx allocating...\n", size);
> @@ -2125,11 +2128,21 @@ static int __init __unflatten_device_tree(const void *fdt,
>       start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
>       unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
>       if ( be32_to_cpup((__be32 *)start) != FDT_END )
> -        printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
> +    {
> +        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
>                     *((u32 *)start));
> +        xfree((__be64 *)mem);

I know that 'mem' is an 'unsigned long' so you need to cast it to a 
pointer. But '__be64 *' seems a rather odd choice. Why not using 'void *'?

Better would be to convert 'mem' to a 'void *' as we allow pointer 
arithmetic in Xen. But that can be dealt separately.

> +        return -EINVAL;
> +    }
> +
>       if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeefU )
> -        printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
> +    {
> +        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
>                     be32_to_cpu(((__be32 *)mem)[size / 4]));
> +        xfree((__be64 *)mem);

Same remark here.

> +        return -EINVAL;
> +    }
> +
>       *allnextp = NULL;
>   
>       dt_dprintk(" <- unflatten_device_tree()\n");

Cheers,

-- 
Julien Grall

