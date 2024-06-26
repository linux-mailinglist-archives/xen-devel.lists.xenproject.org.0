Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF61B917579
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 03:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748214.1155810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHED-0005Rd-9K; Wed, 26 Jun 2024 01:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748214.1155810; Wed, 26 Jun 2024 01:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHED-0005PC-6h; Wed, 26 Jun 2024 01:13:41 +0000
Received: by outflank-mailman (input) for mailman id 748214;
 Wed, 26 Jun 2024 01:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMHEB-0005P6-Gc
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 01:13:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 506fc231-3359-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 03:13:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1B7260B5A;
 Wed, 26 Jun 2024 01:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD66C32781;
 Wed, 26 Jun 2024 01:13:34 +0000 (UTC)
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
X-Inumbo-ID: 506fc231-3359-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719364415;
	bh=1vDMBFbep/nJ+2OXb3icg5/JJaWp9QD7KY+cPtqHQVg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Nw3PQgg0EJsEj2tlW6NeLEdOQXPgeQdho9gHpnuAaIMPe+TjMaWBxnKqCgqi05Qtk
	 aOIPiYuxSjgYfuhGiD/CIRk+JnxekDITctkEVBMeZMrHE8TqbgM1V5Nr29utb1xld1
	 tqM+OO1EO6FcZ1GxCzTqB0Yn7xvaYUJkUF/QEIPtN1YailzSIohY+4xbD4UphYIbTf
	 t+Lk21BuMjLUyzT47Xa6byh9Jam4joMwYJFUHnuPjrjTIDIC07BbWsRcE/3NkX1CMa
	 Ug17IAV4W2G2PunhF9UTei9LS7ja4nVPVIE0GtkQ1EWX6jAQ0hxuU31++fCXZlcdqO
	 iFIlbKcvGiQFQ==
Date: Tue, 25 Jun 2024 18:13:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] common/kernel: address violation of MISRA C Rule
 13.6
In-Reply-To: <521767cb-ac08-48c5-bd91-b30c1d192331@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406251812480.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com> <54949b0561263b9f18da500255836d89ca8838ba.1719308599.git.alessandro.zucchelli@bugseng.com> <521767cb-ac08-48c5-bd91-b30c1d192331@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jun 2024, Jan Beulich wrote:
> On 25.06.2024 12:14, Alessandro Zucchelli wrote:
> > --- a/xen/common/kernel.c
> > +++ b/xen/common/kernel.c
> > @@ -660,14 +660,15 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >  
> >      case XENVER_guest_handle:
> >      {
> > +        struct domain *d = current->domain;
> 
> Can a (new) variable thus initialized please be consistently named currd?
> 
> >          xen_domain_handle_t hdl;
> >  
> >          if ( deny )
> >              memset(&hdl, 0, ARRAY_SIZE(hdl));
> >  
> > -        BUILD_BUG_ON(ARRAY_SIZE(current->domain->handle) != ARRAY_SIZE(hdl));
> > +        BUILD_BUG_ON(ARRAY_SIZE(d->handle) != ARRAY_SIZE(hdl));
> 
> Wasn't there the intention to exclude BUILD_BUG_ON() for specifically this
> (and any other similar) rule?

+1

I think if we could do that it would be ideal because those are the
difficult cases are only meant are build checks so there is no point in
applying to MISRA to them.


> > -        if ( copy_to_guest(arg, deny ? hdl : current->domain->handle,
> > +        if ( copy_to_guest(arg, deny ? hdl : d->handle,
> >                             ARRAY_SIZE(hdl) ) )
> >              return -EFAULT;
> >          return 0;
> 

