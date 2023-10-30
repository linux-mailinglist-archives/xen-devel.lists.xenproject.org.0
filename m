Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164D7DC298
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 23:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625401.974622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxazs-0002xm-In; Mon, 30 Oct 2023 22:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625401.974622; Mon, 30 Oct 2023 22:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxazs-0002v5-FS; Mon, 30 Oct 2023 22:44:36 +0000
Received: by outflank-mailman (input) for mailman id 625401;
 Mon, 30 Oct 2023 22:44:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxazq-0002uz-E5
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 22:44:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3fc8dbd-7775-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 23:44:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E03D860A5B;
 Mon, 30 Oct 2023 22:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EC8C433C7;
 Mon, 30 Oct 2023 22:44:28 +0000 (UTC)
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
X-Inumbo-ID: e3fc8dbd-7775-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698705870;
	bh=ieH9DJ3zXCskXh4EEPOfDyDs/1BbZu0kzgnHfXSk838=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HRbdpv0xnDtodF5CdXSsnlT6hRqOBQM2D6JnEIXjU05lN+OWWmStm6+gFvefiQqpt
	 seUAf1iy75k1UvEUnV7BTurWTIsXht0/UhiN67cT0bInFFzQ3kEj4TvCj9XAzzeuYY
	 hR7bcOWgF8rCChhKmJLyP8v6U2hDVaNCGmKQsCuXPwHuypNICu6oEjOb0jd5uVj20k
	 WIcz9KGQi5Eyni5uIpXqecmliyvB8tYtkcETXVcs02+9ETA20BEBuyubShhRk1Aw4K
	 eE3Ozjh2fj1XSggJ6RgcVCowxQPl/vwV5CN0PuLrEXbCB0DU7dESTPBdRGjG28gmSD
	 gYlKh1oGYU1bw==
Date: Mon, 30 Oct 2023 15:44:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
In-Reply-To: <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com> <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com> <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Oct 2023, Jan Beulich wrote:
> On 27.10.2023 15:34, Nicola Vetrini wrote:
> > --- a/xen/include/xen/macros.h
> > +++ b/xen/include/xen/macros.h
> > @@ -8,8 +8,14 @@
> >  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
> >  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> >  
> > -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> > -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> > +/*
> > + * Given an unsigned integer argument, expands to a mask where just the least
> > + * significant nonzero bit of the argument is set, or 0 if no bits are set.
> > + */
> > +#define ISOLATE_LOW_BIT(x) ((x) & -(x))
> 
> Not even considering future Misra changes (which aiui may require that
> anyway), this generalization of the macro imo demands that its argument
> now be evaluated only once.

Fur sure that would be an improvement, but I don't see a trivial way to
do it and this issue is also present today before the patch. I think it
would be better to avoid scope-creeping this patch as we are already at
v4 for something that was expected to be a trivial mechanical change. I
would rather review the fix as a separate patch, maybe sent by you as
you probably have a specific implementation in mind?


> Also another thought regarding the name: Would ISOLATE_LSB() be acceptable
> to everyone having voiced a view on the set of proposed names? It would be
> at least a little shorter ...

I would be OK with that

