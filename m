Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD27491E6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 01:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559561.874638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBzL-0007mx-UP; Wed, 05 Jul 2023 23:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559561.874638; Wed, 05 Jul 2023 23:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBzL-0007jh-Re; Wed, 05 Jul 2023 23:32:47 +0000
Received: by outflank-mailman (input) for mailman id 559561;
 Wed, 05 Jul 2023 23:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHBzK-0007jZ-FO
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 23:32:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3df53aef-1b8c-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 01:32:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2304F61864;
 Wed,  5 Jul 2023 23:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42254C433C7;
 Wed,  5 Jul 2023 23:32:42 +0000 (UTC)
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
X-Inumbo-ID: 3df53aef-1b8c-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688599963;
	bh=wOTkpRt6ujLa6ZjkUKlKZ0ZZRhSVaR6y2nqF3tbav+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MdRZT86OeddAUJupyHQewf1wxsSSV+r9WfgeTI9bEzbACq/aEJL3bWgcg685KAzKt
	 oIagMjMw89wzUgnlGwq6ZqsaSsboptdxlG58eXfHhS91szAV7jcynoshC8Df6WrAmb
	 sLTqTPZKMT8TlHumFKdv73z7qX33Oisj1j+/g/KCgBofUTw/TrXfW4Pyn3de6ShL1d
	 QX2vYWnrk/ten8aImW5lJkniLv6ED5E1fniEK8yor21t5w+CuY1hCUXJtR89Gejqix
	 GYgqw7921SziUmiPSdY8IKGv44O7xAElufdLyb68mAvrxUr1JSACqmbaVzVrG+Lw2R
	 AJh7ZEWFRsgLQ==
Date: Wed, 5 Jul 2023 16:32:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2 05/13] xen/device-tree: fix violations of MISRA
 C:2012 Rule 7.2
In-Reply-To: <da656a93e42e5d04e02f62002b1f5ab357c8c16a.1688559115.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307051632260.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com> <da656a93e42e5d04e02f62002b1f5ab357c8c16a.1688559115.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Jul 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - change commit title to the right one
> - change commit message
> - change maintainers in Cc
> - remove changes in 'libfdt'
> ---
>  xen/common/device_tree.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 8da1052911..0677193ab3 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2115,7 +2115,7 @@ static void __init __unflatten_device_tree(const void *fdt,
>      /* Allocate memory for the expanded device tree */
>      mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
>  
> -    ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
> +    ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeefU);
>  
>      dt_dprintk("  unflattening %lx...\n", mem);
>  
> @@ -2125,7 +2125,7 @@ static void __init __unflatten_device_tree(const void *fdt,
>      if ( be32_to_cpup((__be32 *)start) != FDT_END )
>          printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
>                    *((u32 *)start));
> -    if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef )
> +    if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeefU )
>          printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
>                    be32_to_cpu(((__be32 *)mem)[size / 4]));
>      *allnextp = NULL;
> -- 
> 2.41.0
> 

