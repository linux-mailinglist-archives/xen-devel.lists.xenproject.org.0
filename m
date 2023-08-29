Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9660F78CF82
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 00:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592471.925187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb78p-0006fR-73; Tue, 29 Aug 2023 22:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592471.925187; Tue, 29 Aug 2023 22:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb78p-0006c8-4Q; Tue, 29 Aug 2023 22:24:55 +0000
Received: by outflank-mailman (input) for mailman id 592471;
 Tue, 29 Aug 2023 22:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jw1q=EO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qb78o-0006c2-3k
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 22:24:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deb67e4c-46ba-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 00:24:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 446A361C3C;
 Tue, 29 Aug 2023 22:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3904C433C7;
 Tue, 29 Aug 2023 22:24:48 +0000 (UTC)
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
X-Inumbo-ID: deb67e4c-46ba-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693347889;
	bh=GKqad1DnzRmJh3Y5IMc/cw/xUUeniwRMNGtQTKwrFho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OH+VUHyGw/yVbWS9bBcpMlZWydH+jBajy90X7oCGw2l/Vs36fmlx2IEC7DTmSqB2q
	 JpAqK4cLx6MX47klkypFwZicl1dXB1I73GluP/vWoxJQrrKoW3B3Ljuq1q1Lq1ZExH
	 oY7MHVE8bGJjiY+dXOXtY7qoSbh9wqqXh5AU7gtehC6s7H9iiXvxhO5k9+fmVqpEMb
	 4l6al+HkwmHCVQf+32qdVPyMiCYdhoChl5o4qu73tLTu/8JnU6E3Yu2QFiVjfKau72
	 dffuGvQG7+nTiruOgBkR2WmqY2oRaOLNJooLkN3WH4ylnSjRccyfGK9Wz0WIzBZLpp
	 JXBZAp+COXMwg==
Date: Tue, 29 Aug 2023 15:24:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    sstabellini@kernel.org, julien@xen.org
Subject: Re: [XEN][PATCH v10 02/20] common/device_tree.c: unflatten_device_tree()
 propagate errors
In-Reply-To: <20230825080222.14247-3-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2308291524370.6458@ubuntu-linux-20-04-desktop>
References: <20230825080222.14247-1-vikram.garhwal@amd.com> <20230825080222.14247-3-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Aug 2023, Vikram Garhwal wrote:
> This will be useful in dynamic node programming when new dt nodes are unflattend
> during runtime. Invalid device tree node related errors should be propagated
> back to the caller.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v9:
>     Replace __be64 with void.
> Changes from v7:
>     Free allocated memory in case of errors when calling unflatten_dt_node.
> ---
> ---
>  xen/common/device_tree.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 7c6b41c3b4..b6d9f018c6 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2110,6 +2110,9 @@ static int __init __unflatten_device_tree(const void *fdt,
>      /* First pass, scan for size */
>      start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
>      size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
> +    if ( !size )
> +        return -EINVAL;
> +
>      size = (size | 3) + 1;
>  
>      dt_dprintk("  size is %#lx allocating...\n", size);
> @@ -2127,11 +2130,21 @@ static int __init __unflatten_device_tree(const void *fdt,
>      start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
>      unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
>      if ( be32_to_cpup((__be32 *)start) != FDT_END )
> -        printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
> +    {
> +        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
>                    *((u32 *)start));
> +        xfree((void *)mem);
> +        return -EINVAL;
> +    }
> +
>      if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeefU )
> -        printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
> +    {
> +        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
>                    be32_to_cpu(((__be32 *)mem)[size / 4]));
> +        xfree((void *)mem);
> +        return -EINVAL;
> +    }
> +
>      *allnextp = NULL;
>  
>      dt_dprintk(" <- unflatten_device_tree()\n");
> -- 
> 2.17.1
> 

