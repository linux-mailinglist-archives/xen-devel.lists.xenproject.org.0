Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 243EB59A83D
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390509.628002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAJF-0000cO-Do; Fri, 19 Aug 2022 22:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390509.628002; Fri, 19 Aug 2022 22:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAJF-0000a5-A6; Fri, 19 Aug 2022 22:17:45 +0000
Received: by outflank-mailman (input) for mailman id 390509;
 Fri, 19 Aug 2022 22:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAJD-0000Zx-Nd
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:17:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be469ebc-200c-11ed-bd2e-47488cf2e6aa;
 Sat, 20 Aug 2022 00:17:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CFF57B8274A;
 Fri, 19 Aug 2022 22:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145ACC433B5;
 Fri, 19 Aug 2022 22:17:40 +0000 (UTC)
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
X-Inumbo-ID: be469ebc-200c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660947460;
	bh=fmSPVZHONzk8qI1uSSNU1VUFzBfoRADjbZ9+Eb9zolk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WqugRxzA1hgGkoDKxw1rz71cN73iVPmqJmqmebSZwHHbk9yLKPJnh1FGhOZSbzj0Q
	 4xEmiR5Jp8z3UnuJA7h8n2Pzpc0EfXqhK6DsTKSOSY6Jkqd5/ACL3AeS6scA/sSsiE
	 qtCfGc8ffBoOV2Yr9WdN2bTMZyxcyYdV/+dkB+7OoI41ZtETWf32uN3xZwtWWwOIQK
	 zZ3YYkvXVUFOHE83vkFcPwnY9Uysup9JMb2PTEQKUZXkQuykqjTyYfYxKjHZE3fJOC
	 a9Y6EVCb3jCn327BA3YHbElOXGyD7RnmLNx1sK4FlgJSNBWAB5buISQil2EymToNKp
	 GR836g7QVl1Ug==
Date: Fri, 19 Aug 2022 15:17:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/7] xen/rbtree: Fix MISRA C 2012 Rule 20.7 violation
In-Reply-To: <20220819194359.1196539-6-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208191517230.3790@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <20220819194359.1196539-6-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
> In macro __rb_parent(), add parentheses around the macro parameter to prevent
> against unintended expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/lib/rbtree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/lib/rbtree.c b/xen/lib/rbtree.c
> index 85a4f20313..eb418baabb 100644
> --- a/xen/lib/rbtree.c
> +++ b/xen/lib/rbtree.c
> @@ -46,7 +46,7 @@
>  #define		RB_RED		0
>  #define		RB_BLACK	1
>  
> -#define __rb_parent(pc)    ((struct rb_node *)(pc & ~3))
> +#define __rb_parent(pc)    ((struct rb_node *)((pc) & ~3))
>  
>  #define __rb_color(pc)     ((pc) & 1)
>  #define __rb_is_black(pc)  __rb_color(pc)
> -- 
> 2.34.1
> 

