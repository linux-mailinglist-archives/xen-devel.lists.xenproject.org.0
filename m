Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418AB51E2F4
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 03:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323513.545219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn946-000118-JD; Sat, 07 May 2022 01:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323513.545219; Sat, 07 May 2022 01:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn946-0000yV-DA; Sat, 07 May 2022 01:16:58 +0000
Received: by outflank-mailman (input) for mailman id 323513;
 Sat, 07 May 2022 01:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtL8=VP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn8wm-0004gy-TW
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 01:09:24 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 545316b0-cda2-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 03:09:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 79CCECE39B4;
 Sat,  7 May 2022 01:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FD4C385A8;
 Sat,  7 May 2022 01:09:19 +0000 (UTC)
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
X-Inumbo-ID: 545316b0-cda2-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651885759;
	bh=ojvUw6bFrH0aOC5u6kRpyNDbEo2VhzHvbfqSK2MOr38=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A5AEQBsTSd1d32bw/tZxjikFPWhleQrAlvjhYQOyLIyuBiUdV9zRPsWU/2bZBYKaN
	 5DcNRKy6jP+pm6taoIHP5WfQNtC+wDH9wxU/OADDPA4UQA4GJ2dO9YvCT5h1pt1gd5
	 Ik5eYSKYfWUC9No3R0YwCfCUFUeXhZwIvkSD71wWO+5tchqyPY4dCoGfEl8DKnIHeE
	 YNbkTdTZOjXcPDStImTaOjnhtE5Ow8WR3Q6sS8K7ilqX0wfPbLRlV/25qdntEvqMkf
	 tyjFcIyylyA/eIO9092J8uTsKGAGiqh3crfbDgSI3ejgeNBMTtW76XpokmD2ToGcDD
	 nKlyiY8XDQIfQ==
Date: Fri, 6 May 2022 18:09:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/9] xen/arm: set up shared memory foreign mapping
 for borrower domain
In-Reply-To: <20220506072502.2177828-8-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205061806560.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-8-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Penny Zheng wrote:
> This commit sets up shared memory foreign mapping for borrower domain.
> 
> If owner domain is the default dom_io, all shared domain are treated as
> borrower domain.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2 change:
> - remove guest_physmap_add_shm, since for borrower domain, we only
> do P2M foreign memory mapping now.
> ---
>  xen/arch/arm/domain_build.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 089b9e99fc..8d299a3616 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -965,6 +965,16 @@ static int __init process_shm(struct domain *d,
>              if ( ret )
>                  return ret;
>          }
> +
> +        if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
> +        {
> +            /* Set up P2M foreign mapping for borrower domain. */
> +            ret = guest_physmap_add_pages(d, _gfn(PFN_UP(gbase)),
> +                                          _mfn(PFN_UP(pbase)), PFN_DOWN(psize),
> +                                          p2m_map_foreign_rw);
> +            if ( ret )
> +                return ret;
> +        }
>      }
>  
>      return 0;
> -- 
> 2.25.1
> 

