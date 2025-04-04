Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D69A7B566
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 03:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937738.1338640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Vm1-0005CT-GK; Fri, 04 Apr 2025 01:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937738.1338640; Fri, 04 Apr 2025 01:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Vm1-0005AS-Dc; Fri, 04 Apr 2025 01:23:09 +0000
Received: by outflank-mailman (input) for mailman id 937738;
 Fri, 04 Apr 2025 01:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0Vlz-0005AM-NE
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 01:23:07 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58c903a1-10f3-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 03:23:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B955EA46AB0;
 Fri,  4 Apr 2025 01:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA467C4CEE3;
 Fri,  4 Apr 2025 01:22:58 +0000 (UTC)
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
X-Inumbo-ID: 58c903a1-10f3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743729779;
	bh=IYeIRCjN8ZjnQ+Gdx6fT4/vM2ILYoUAr+TTz97347uU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=twto0d/CrnVAO/pFj2I2ZrHoZMBzWNEhXnVVmUH9j5aDf+lUMjaOGTt1fctvlDNuq
	 +APFhotr+w57+b6Z2MOnXxLV92/gtb5VlOjYGz9BkcVM/DgWf//b9FrwYCzxNXFAgL
	 idTKyI67F1zMjDikeD/ns/0KXY/Pwv0o7WYato+YiVQ877p2dHKd91zD8le9EV6M+f
	 Qnj9aZnMGpBrGeaR46WnZXNiNcESP4NgHu815ospG+UeHUnHQKRTc8OpFbkjKWz+Tn
	 XbQ/HK5CIXbs9qDnh0NFNYVoqh46KbDlxVIjNsUzEYaYxzgs5pvoarOdLcZTqsZCiF
	 abKxrfTyXeRQw==
Date: Thu, 3 Apr 2025 18:22:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v3 5/7] tools/init-dom0less: Only seed legacy xenstore
 grants
In-Reply-To: <20250403214608.152954-6-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504031811190.3529306@ubuntu-linux-20-04-desktop>
References: <20250403214608.152954-1-jason.andryuk@amd.com> <20250403214608.152954-6-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, Jason Andryuk wrote:
> The hardware domain is unable to seed a control domain, but we want the
> control domain to use xenstore.  Rely on the hypervisor to seed dom0less
> grant table entries for Xenstore, so this seeding is unnecessary.
> 
> However, that only works for the new xenstore late init.  The legacy
> protocol which uses init-dom0less to populate the page still needs to
> seed the grant.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

I was thinking whether it is an issue that we change behavior of
init-dom0less for the new protocol. I convinced myself it is not an
issue because init-dom0less is supposed to be a matched set with the Xen
hypervisor version. I also thought whether we could check if the call to
xc_dom_gnttab_seed is needed and only do it if it is, so that
init-dom0less.c could be less depedent on the specific Xen behavior.

Overall I thought it is not worth it, so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  tools/helpers/init-dom0less.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> index 17579fe2e8..91edf17b6c 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -286,12 +286,12 @@ static int init_domain(struct xs_handle *xsh,
>                  xenstore_pfn);
>          if (rc < 0)
>              return rc;
> -    }
>  
> -    rc = xc_dom_gnttab_seed(xch, info->domid, true,
> -                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
> -    if (rc)
> -        err(1, "xc_dom_gnttab_seed");
> +        rc = xc_dom_gnttab_seed(xch, info->domid, true,
> +                                (xen_pfn_t)-1, xenstore_pfn, 0, 0);
> +        if (rc)
> +               err(1, "xc_dom_gnttab_seed");
> +    }
>  
>      libxl_uuid_generate(&uuid);
>      xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
> -- 
> 2.49.0
> 
> 

