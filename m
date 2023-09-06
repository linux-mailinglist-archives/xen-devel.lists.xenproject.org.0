Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAE779447B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 22:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596856.930928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdz6N-0000mi-8u; Wed, 06 Sep 2023 20:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596856.930928; Wed, 06 Sep 2023 20:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdz6N-0000kn-3s; Wed, 06 Sep 2023 20:26:15 +0000
Received: by outflank-mailman (input) for mailman id 596856;
 Wed, 06 Sep 2023 20:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdz6L-0000kI-Ot
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 20:26:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e1aca1c-4cf3-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 22:26:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 767DAB81C22;
 Wed,  6 Sep 2023 20:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5706FC433C7;
 Wed,  6 Sep 2023 20:26:08 +0000 (UTC)
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
X-Inumbo-ID: 9e1aca1c-4cf3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694031969;
	bh=iDL2glLCGqmIqCjYXgPASikdmyuk+pR1zspWlFJWfp4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tQuSe2gDXyh6NzqG3QuPG0K1ox1y6rq7cIJHqbe8AqBNcYXUGTFItbioP0pkit6Mz
	 e5ykVZeYxqamoz2bF+nUV3EVj+oDOdF8sAVLIMTkxCQh1Bm21xirUAEjNMs/WMC7cW
	 0Csu/NNAUv/PAgdAbiEoUsTKEHH/he9O6n6DNomSnGRD8eYPWfaXqhWb2IATRXD/aX
	 czo/wCPSZlr5zrON7QHBJNZyw+LY/tsJObT5GI5qWh9BsJyxRP/3OBZWrsjot2g68j
	 N1lgPnVFrnVrZiPhoOuN+WLerSJ9Yx0ecuaDXAvky3wubycx7q+ucXla9dRnl63C9M
	 sOa34lVxkfuBg==
Date: Wed, 6 Sep 2023 13:26:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: Fix printk specifiers and arguments in
 iomem_remove_cb()
In-Reply-To: <ZPjW3LT9S5af_1Im@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309061326000.6458@ubuntu-linux-20-04-desktop>
References: <20230906103014.19574-1-michal.orzel@amd.com> <ZPjW3LT9S5af_1Im@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1370908706-1694031968=:6458"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1370908706-1694031968=:6458
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 6 Sep 2023, Vikram Garhwal wrote:
> On Wed, Sep 06, 2023 at 12:30:14PM +0200, Michal Orzel wrote:
> > When building Xen for arm32 with CONFIG_DTB_OVERLAY, the following
> > error is printed:
> > 
> > common/dt-overlay.c: In function ‘iomem_remove_cb’:
> > ././include/xen/config.h:55:24: error: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 3 has type ‘long unsigned int’ [-Werror=format=]
> > 
> > Function parameters s and e (denoting MMIO region) are of type unsigned
> > long and indicate frame numbers and not addresses. This also means that
> > the arguments passed to printk() are incorrect (using PAGE_ALIGN() or
> > PAGE_MASK ANDed with a frame number results in unwanted output). Fix it.
> > 
> > Take the opportunity to switch to %pd specifier to print domain id in
> > a consolidated way.
> > 
> > Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Vikram Garhwal <vikram.garhwal@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > After this patch (and the one for xl), we are left with one issue breaking CI:
> > https://gitlab.com/xen-project/patchew/xen/-/jobs/5026938514
> > ---
> >  xen/common/dt-overlay.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> > index b07a6128dc99..5663a049e90a 100644
> > --- a/xen/common/dt-overlay.c
> > +++ b/xen/common/dt-overlay.c
> > @@ -251,10 +251,8 @@ static int iomem_remove_cb(unsigned long s, unsigned long e, void *dom,
> >      rc = iomem_deny_access(d, s, e);
> >      if ( rc )
> >      {
> > -        printk(XENLOG_ERR "Unable to remove dom%d access to"
> > -               " 0x%"PRIx64" - 0x%"PRIx64"\n",
> > -               d->domain_id,
> > -               s & PAGE_MASK, PAGE_ALIGN(e) - 1);
> > +        printk(XENLOG_ERR "Unable to remove %pd access to %#lx - %#lx\n",
> > +               d, s, e);
> >      }
> >      else
> >          *c += e - s + 1;
> > -- 
> > 2.25.1
> > 
> 
--8323329-1370908706-1694031968=:6458--

