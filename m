Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579C7B0820F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 03:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046005.1416259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucD5G-0000yc-Us; Thu, 17 Jul 2025 01:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046005.1416259; Thu, 17 Jul 2025 01:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucD5G-0000vl-RN; Thu, 17 Jul 2025 01:06:50 +0000
Received: by outflank-mailman (input) for mailman id 1046005;
 Thu, 17 Jul 2025 01:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R98P=Z6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucD5F-0000ve-4a
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 01:06:49 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f24032e-62aa-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 03:06:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60902442C5;
 Thu, 17 Jul 2025 01:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D55C4CEE7;
 Thu, 17 Jul 2025 01:06:44 +0000 (UTC)
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
X-Inumbo-ID: 4f24032e-62aa-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752714405;
	bh=DgMIDRQjRxWPCQu6viWttWYGislXAY/WsHDELNH4VhM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UevocF/nV0NicByHmHIxq4UACpu3PZ40OtNmYmR1l3EuqkXXzA2ukWqN7z8Dm5H+r
	 MucQxVYL5G9vW0wC3Xcv4uyStv6TfDGj4CCxhfrlB7odSv2UHAqedleCG6Wa5tcjoq
	 yKZvxBEUx4U7wvfrI39ujgHin2qoFWR9Y1ga69j4Xg1Vrl8ZUafM4UwqTw4yy4yh+N
	 2OdcEzab7eK743R2ODuSuNwNfkrWBNoS2rPguIg8zduamSMnH+ilXZs2Z8WXKmcbxX
	 KvqLk0cVSIs/goZcZWKyprSK66JmXkF1P+SpSacnhkQZ6lloGVmDb0Rh4umN86djy5
	 IMVruN8KAdMwA==
Date: Wed, 16 Jul 2025 18:06:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] dom0less: Fix LLC coloring when mixing colored and
 non-colored domains
In-Reply-To: <aHf2Xdd1RYuHvJuZ@kraken>
Message-ID: <alpine.DEB.2.22.394.2507161806300.15546@ubuntu-linux-20-04-desktop>
References: <20250716153504.77542-1-alejandro.garciavallejo@amd.com> <aHf2Xdd1RYuHvJuZ@kraken>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, dmkhn@proton.me wrote:
> On Wed, Jul 16, 2025 at 05:35:03PM +0200, Alejandro Vallejo wrote:
> > llc_colors_str being outside the main loop makes domains without
> > explicit coloring inherit the colors of the last colored domain parsed.
> > 
> > Move it inside so that's no longer the case.
> > 
> > Fixes: 5948dc16759c("xen/arm: add support for cache coloring...")
> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> 
> Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1930276681
> > ---
> >  xen/common/device-tree/dom0less-build.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> > index 221b875a2f..87828d4d9d 100644
> > --- a/xen/common/device-tree/dom0less-build.c
> > +++ b/xen/common/device-tree/dom0less-build.c
> > @@ -829,11 +829,11 @@ void __init create_domUs(void)
> >      bool iommu = false;
> >      const struct dt_device_node *cpupool_node,
> >                                  *chosen = dt_find_node_by_path("/chosen");
> > -    const char *llc_colors_str = NULL;
> > 
> >      BUG_ON(chosen == NULL);
> >      dt_for_each_child_node(chosen, node)
> >      {
> > +        const char *llc_colors_str = NULL;
> >          struct domain *d;
> >          struct xen_domctl_createdomain d_cfg = {0};
> >          unsigned int flags = 0U;
> > 
> > base-commit: dff462313fe0bfa273c54ffc9bff71f054c365af
> > --
> > 2.43.0
> > 
> > 
> 

