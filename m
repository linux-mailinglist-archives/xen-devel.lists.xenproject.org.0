Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD92F553F21
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 01:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353359.580289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nXx-0002rR-OX; Tue, 21 Jun 2022 23:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353359.580289; Tue, 21 Jun 2022 23:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nXx-0002p4-LL; Tue, 21 Jun 2022 23:44:37 +0000
Received: by outflank-mailman (input) for mailman id 353359;
 Tue, 21 Jun 2022 23:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D44s=W4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o3nXv-0002oI-Jv
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 23:44:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 189dbd11-f1bc-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 01:44:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B684EB81B80;
 Tue, 21 Jun 2022 23:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7D1C3411C;
 Tue, 21 Jun 2022 23:44:29 +0000 (UTC)
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
X-Inumbo-ID: 189dbd11-f1bc-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655855069;
	bh=ZwuyshTN2DegwgRqLLCi7PSc5TuAIg0JJ5t8fSiwduw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Te/elY0eIYeQ6kK8TP1l6rWfJcIDwTMeG4yspUyohrVO/OPfbKCnuVtICcfCYumY/
	 6ADf896wDhtN6Sm/ayioi7Z/P88qeol2CIpqZCskQfNUiAnO746MaZHdCRdFnPuQGi
	 E6V+aUtjvnBZSEZu99/U5tz6AQjtb9SaAMcq8CtT9XzRZQ5bZmP2Bcq+89Y0LIu4Pt
	 30vrpBpy60jmpwYHXVm0U77dj26wzQTnYrCEs7lu0zGdY06VQe19POjUeN+J45rRmr
	 Gno/5ivHcNllB74i6F00x6RSNCH2h31QIAl7BnOa2GW1fo5JrQQqjNsfxQSMmS2tol
	 7yCH028YW045g==
Date: Tue, 21 Jun 2022 16:44:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: vtimer: Fix MISRA C 2012 Rule 8.4
 violation
In-Reply-To: <20220621154402.482857-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206211644210.788376@ubuntu-linux-20-04-desktop>
References: <20220621154402.482857-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Jun 2022, Xenia Ragiadakou wrote:
> Include vtimer.h so that the declarations of vtimer functions with external
> linkage are visible before the function definitions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/vtimer.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index 5bb5970f58..5f26463354 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -29,6 +29,7 @@
>  #include <asm/time.h>
>  #include <asm/vgic.h>
>  #include <asm/vreg.h>
> +#include <asm/vtimer.h>
>  #include <asm/regs.h>
>  
>  /*
> -- 
> 2.34.1
> 

