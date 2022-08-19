Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28CC59A817
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390490.627969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAGT-0007Fz-FI; Fri, 19 Aug 2022 22:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390490.627969; Fri, 19 Aug 2022 22:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAGT-0007D0-A4; Fri, 19 Aug 2022 22:14:53 +0000
Received: by outflank-mailman (input) for mailman id 390490;
 Fri, 19 Aug 2022 22:14:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAGR-0007Co-9A
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:14:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56c25304-200c-11ed-bd2e-47488cf2e6aa;
 Sat, 20 Aug 2022 00:14:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33A27617AE;
 Fri, 19 Aug 2022 22:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3C1C433D6;
 Fri, 19 Aug 2022 22:14:47 +0000 (UTC)
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
X-Inumbo-ID: 56c25304-200c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660947287;
	bh=LGP/OmUQL/2Ti3NEExt5i/HkoNPzQjIJuZC2aCPBmTU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MXlx4LkObua5dTL3w9jTrJQv/ZL+CctnYNz+H5nTnmcQYMUwI81hDtGDRs/eYsusC
	 wabSb+dPpZX/6Vsy8kRJZ8w3luHXBzyeq5TuDa4HAz1CBBOB9at7J9BlhGcFvQx4Yp
	 snr15RnlhRSIEJRRLdFzEcoTZUAo0l0wPDFRfwcF4xqb0Fl5WH/RnpHsNwj6/EE8li
	 JFFvUQHF07mLpqg3PJ+y79OhFYpguc9Qzf9Lb/aJu/ZPajH9zhkJ0610ZhW+j3UbVR
	 yJWvcjWCF5hik9laQhT3mqNsXVBJ18w4q3wiWCxAhbmkrrs0xbJYEFiVgejcCxcDcI
	 AILwTxAd0bY0g==
Date: Fri, 19 Aug 2022 15:14:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/7] xsm/flask: sidtab: Fix MISRA C 2012 Rule 20.7
 violations
In-Reply-To: <20220819194359.1196539-3-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208191513350.3790@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <20220819194359.1196539-3-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
> In macros SIDTAB_HASH(), INIT_SIDTAB_LOCK(), SIDTAB_LOCK() and SIDTAB_UNLOCK(),
> add parentheses around the macro parameter to prevent against unintended
> expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/xsm/flask/ss/sidtab.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
> index 74babfac9c..69fc3389b3 100644
> --- a/xen/xsm/flask/ss/sidtab.c
> +++ b/xen/xsm/flask/ss/sidtab.c
> @@ -14,11 +14,11 @@
>  #include "security.h"
>  #include "sidtab.h"
>  
> -#define SIDTAB_HASH(sid) (sid & SIDTAB_HASH_MASK)
> +#define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
>  
> -#define INIT_SIDTAB_LOCK(s) spin_lock_init(&s->lock)
> -#define SIDTAB_LOCK(s) spin_lock(&s->lock)
> -#define SIDTAB_UNLOCK(s) spin_unlock(&s->lock)
> +#define INIT_SIDTAB_LOCK(s) spin_lock_init(&(s)->lock)
> +#define SIDTAB_LOCK(s) spin_lock(&(s)->lock)
> +#define SIDTAB_UNLOCK(s) spin_unlock(&(s)->lock)
>  
>  int sidtab_init(struct sidtab *s)
>  {
> -- 
> 2.34.1
> 
> 

