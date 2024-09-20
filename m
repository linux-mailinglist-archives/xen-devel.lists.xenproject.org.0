Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01EA97D064
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 05:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800986.1211012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srUjB-0008BA-Ue; Fri, 20 Sep 2024 03:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800986.1211012; Fri, 20 Sep 2024 03:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srUjB-000875-R8; Fri, 20 Sep 2024 03:54:41 +0000
Received: by outflank-mailman (input) for mailman id 800986;
 Fri, 20 Sep 2024 03:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEHU=QS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1srUjA-0007lS-R5
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 03:54:40 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0edf753a-7704-11ef-99a2-01e77a169b0f;
 Fri, 20 Sep 2024 05:54:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3DD13A440CC;
 Fri, 20 Sep 2024 03:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10985C4CEC3;
 Fri, 20 Sep 2024 03:54:36 +0000 (UTC)
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
X-Inumbo-ID: 0edf753a-7704-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726804477;
	bh=1oEgX7H/YuRUlRekxhCONVHa8B8DDOWaK+XeENb7zoA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VTtffezUoU3Wv5ywDrbaVZpI3IFieujW3PkufQl5r00XFYnCNPtcUJF2pNpUv8rsB
	 BKHR4Nvc37QPOkmIo/4c13y0oo04OsD6DZcrfL0tmy4rtEwyp2bvMok1Sb3L9a7Llw
	 hpR8F7IkHbD116YhstBuL7nqO44ARBeDGpvqn3Vd2PMXJyeYE/6qHt802G7dxtD+IC
	 Z2Il+QEtka76qoe0hIDTSJFjiRy/Pn6APTe3e4zIW0FVXbG+OOTRDQ2fF3t8XWI0vI
	 RhSVBAxTl77g+WxM++75efgotYzSzmp7mtw9zxn2wVALd9OpJmNB084xYfAdyEXoPl
	 IXnkyUk/H8ZGQ==
Date: Thu, 19 Sep 2024 20:54:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 3/4] dt-overlay: Remove ASSERT_UNREACHABLE from
 add_nodes()
In-Reply-To: <20240919104238.232704-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2409191500270.1417852@ubuntu-linux-20-04-desktop>
References: <20240919104238.232704-1-michal.orzel@amd.com> <20240919104238.232704-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Sep 2024, Michal Orzel wrote:
> The assumption stated in the comment that the code will never get there
> is incorrect. It's enough for the target-path to be incorrect (i.e. user
> error), which will lead to an incorrect overall node path and we will end
> up in this "unreachable" place causing a failure in debug builds.
> 
> Fixes: 0c0facdab6f5 ("xen/arm: Implement device tree node addition functionalities")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/dt-overlay.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index 8606b14d1e8e..d18bd12bd38d 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -596,11 +596,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
>          overlay_node = dt_find_node_by_path_from(tr->dt_host_new,
>                                                   nodes_full_path[j]);
>          if ( overlay_node == NULL )
> -        {
> -            /* Sanity check. But code will never come here. */
> -            ASSERT_UNREACHABLE();
>              return -EFAULT;
> -        }
>  
>          /*
>           * Find previous and next node to overlay_node in dt_host_new. We will
> -- 
> 2.37.6
> 

