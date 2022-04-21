Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D0950ABF4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 01:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310518.527404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhgCM-0007y0-2A; Thu, 21 Apr 2022 23:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310518.527404; Thu, 21 Apr 2022 23:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhgCL-0007vB-Up; Thu, 21 Apr 2022 23:26:53 +0000
Received: by outflank-mailman (input) for mailman id 310518;
 Thu, 21 Apr 2022 23:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhgCJ-0007v5-Pc
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 23:26:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84f621d5-c1ca-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 01:26:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C710B82978;
 Thu, 21 Apr 2022 23:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD181C385A5;
 Thu, 21 Apr 2022 23:26:47 +0000 (UTC)
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
X-Inumbo-ID: 84f621d5-c1ca-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650583608;
	bh=JszuH5Z2k/2vz2+ErU6pnEK+7BLb3wyHYrzClhfUa7o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NE045yV2p921GdSZktWkB76oY1IOXecvnwKO+O61wzqJd4jzd8LGfMr+4U5D1kOLb
	 J1UzlOkR2kEGRWycHdNCenBEuVvFeltmfRdlL1t7QEg3usOj7jpVPpBxF0HA3e6Bxn
	 m1fLoXTWBoSbRHmpqMP0mVLD+yB1+7mLc8ygaAJjpK/AFnJMsSJocIhvaQ4uilvXgf
	 laNqgYiBDHkqzfXXLTIMPhEUCx2j5KG0J5Ei7uW9/iCLN09s/aRgCfpq52994tlcDq
	 uTiWWbcCQoC1QiuCmlXTUDIADFKHEJz8rJdVS15zB2wTxG2g6GwRGJxkVpBQ0eyzKK
	 oIJuoVlirCtaA==
Date: Thu, 21 Apr 2022 16:26:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Paran Lee <p4ranlee@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, austindh.kim@gmail.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/arm: p2m_set_entry duplicate calculation.
In-Reply-To: <20220421151755.GA4718@DESKTOP-NK4TH6S.localdomain>
Message-ID: <alpine.DEB.2.22.394.2204211626400.915916@ubuntu-linux-20-04-desktop>
References: <20220421151755.GA4718@DESKTOP-NK4TH6S.localdomain>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Apr 2022, Paran Lee wrote:
> It doesn't seem necessary to do that calculation of order shift again.
> 
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/p2m.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 1d1059f7d2..533afc830a 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1092,7 +1092,7 @@ int p2m_set_entry(struct p2m_domain *p2m,
>      while ( nr )
>      {
>          unsigned long mask;
> -        unsigned long order;
> +        unsigned long order, pages;
>  
>          /*
>           * Don't take into account the MFN when removing mapping (i.e
> @@ -1118,11 +1118,12 @@ int p2m_set_entry(struct p2m_domain *p2m,
>          if ( rc )
>              break;
>  
> -        sgfn = gfn_add(sgfn, (1 << order));
> +        pages = 1 << order;
> +        sgfn = gfn_add(sgfn, pages);
>          if ( !mfn_eq(smfn, INVALID_MFN) )
> -           smfn = mfn_add(smfn, (1 << order));
> +           smfn = mfn_add(smfn, pages);
>  
> -        nr -= (1 << order);
> +        nr -= pages;
>      }
>  
>      return rc;
> -- 
> 2.25.1
> 

