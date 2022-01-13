Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE248E0AB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 23:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257432.442290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n88zP-0005Hs-AB; Thu, 13 Jan 2022 22:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257432.442290; Thu, 13 Jan 2022 22:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n88zP-0005Em-76; Thu, 13 Jan 2022 22:54:39 +0000
Received: by outflank-mailman (input) for mailman id 257432;
 Thu, 13 Jan 2022 22:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n88zN-0005Ec-1n
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 22:54:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7c90674-74c3-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 23:54:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9FA1CB8239D;
 Thu, 13 Jan 2022 22:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B03C36AE3;
 Thu, 13 Jan 2022 22:54:34 +0000 (UTC)
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
X-Inumbo-ID: c7c90674-74c3-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642114474;
	bh=YsYtSktuA2Wc1gCeb0/XytTqns0eXZKR/L5bUcYFrrA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l7QwzNoMtq8IG+7X7M5x6npjrvLKfq33UWNkwK35UMdBWWBrghtJt3pBSCjL/PI2J
	 rhlbvp1abkaH7Tmpd9PgYZkzgf8pZ01fkwfh9l1D9exHqyXG/DwII8bqUl+Vza7D0L
	 KyeM3LRij2FVfnI9EAyzrTbxtnrsjQAz98zAvvJQ/UA6SeWHSjjC/XUvI4u1ZQ8ZRw
	 yFTBjhlE20MeUBv8qLApd4IXyfhop3ZqRAhmQtei0MAQPOF0y42iZjw42c0Rv9T5eA
	 Jq8d2pQWJA46HHh/byfX/K2xrwWORRa/kUc8W2DE9V/jIMYpn71qVp+YPuEAMW0PME
	 Tm4d9f+mPqgdA==
Date: Thu, 13 Jan 2022 14:54:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com
Subject: Re: [PATCH v4 08/11] xen/arm: gate make_gicv3_domU_node with
 CONFIG_GICV3
In-Reply-To: <20211220052123.969876-9-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2201131453540.19362@ubuntu-linux-20-04-desktop>
References: <20211220052123.969876-1-penny.zheng@arm.com> <20211220052123.969876-9-penny.zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Dec 2021, Penny Zheng wrote:
> This commit gates function make_gicv3_domU_node with CONFIG_GICV3.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v4 changes:
> - remove ASSERT_UNREACHABLE() to avoid breaking compilation on prod build with
> CONFIG_GICV3=n
> ---
>  xen/arch/arm/domain_build.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 4788b03d8b..139d428524 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2322,6 +2322,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>      return res;
>  }
>  
> +#ifdef CONFIG_GICV3
>  static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>  {
>      void *fdt = kinfo->fdt;
> @@ -2371,13 +2372,16 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>  
>      return res;
>  }
> +#endif
>  
>  static int __init make_gic_domU_node(struct kernel_info *kinfo)
>  {
>      switch ( kinfo->d->arch.vgic.version )
>      {
> +#ifdef CONFIG_GICV3
>      case GIC_V3:
>          return make_gicv3_domU_node(kinfo);
> +#endif
>      case GIC_V2:
>          return make_gicv2_domU_node(kinfo);
>      default:
> -- 
> 2.25.1
> 

