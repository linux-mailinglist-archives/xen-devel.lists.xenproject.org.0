Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B38A04D8B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 00:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866809.1278167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVJ2B-0003tC-8c; Tue, 07 Jan 2025 23:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866809.1278167; Tue, 07 Jan 2025 23:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVJ2B-0003qd-5G; Tue, 07 Jan 2025 23:30:51 +0000
Received: by outflank-mailman (input) for mailman id 866809;
 Tue, 07 Jan 2025 23:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5H8=T7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tVJ29-0003qV-81
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 23:30:49 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b6a5a8b-cd4f-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 00:30:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D446CA41EFC;
 Tue,  7 Jan 2025 23:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED0DC4CEDF;
 Tue,  7 Jan 2025 23:30:44 +0000 (UTC)
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
X-Inumbo-ID: 6b6a5a8b-cd4f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736292645;
	bh=Eq/ZJH/Wx1Vd9ZPPYTJ0z6ozQ+faeWET3TOExZ9toYM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jRzff5MM7VdEfOmkNT/MIILo91P3xrkOdvUMgCrZZmLDi35+kQyiJy/nf/53yEXQH
	 AzxO6xv+j9UqSpQ5dfmFAnt8Zz0J8UoWPvrHA9G935sVzrxYQzW+uZz2Nti9zU0Wkm
	 FHGsm8PgeULeu9NwEfa0rM8ssrLXhD5irgY1hIClanC2WqOCHovqTv0KTQi9YF9xkm
	 i7VWJBzkoQuSldmVVrt6sbdTx7EeEgeafHXlCnlhR9FWDIk82/EvUljt6LPRuD2rr1
	 Dl4jyv+5UIGtX7ML3ylEaRtjSZ3xeCgjOgakZotu5sykjCcgz70EZt91SA3VdI1fQ3
	 9TDfBXS9lVStw==
Date: Tue, 7 Jan 2025 15:30:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xen: update pvcalls_front_accept prototype
In-Reply-To: <0f8fc348-14f5-40ac-912a-1785caedb675@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501071530180.133435@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2501061335161.133435@ubuntu-linux-20-04-desktop> <0f8fc348-14f5-40ac-912a-1785caedb675@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jan 2025, Jan Beulich wrote:
> On 06.01.2025 22:36, Stefano Stabellini wrote:
> > xen: update pvcalls_front_accept prototype
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > 
> > Changes in v2:
> > - also update pvcalls-front.c
> 
> The patch still gives the impression of being incomplete: There's no
> caller of the function that you update. However, there's no such caller
> in the first place. Why don't you just delete the function then?

It is meant to be called from an out-of-tree module, which has not been
upstreamed yet


> > diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
> > index b72ee9379d77..cab480059731 100644
> > --- a/drivers/xen/pvcalls-front.c
> > +++ b/drivers/xen/pvcalls-front.c
> > @@ -769,7 +769,8 @@ int pvcalls_front_listen(struct socket *sock, int backlog)
> >  	return ret;
> >  }
> >  
> > -int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
> > +int pvcalls_front_accept(struct socket *sock, struct socket *newsock,
> > +			 struct proto_accept_arg *arg)
> >  {
> >  	struct pvcalls_bedata *bedata;
> >  	struct sock_mapping *map;
> > @@ -788,7 +789,7 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
> >  		return -EINVAL;
> >  	}
> >  
> > -	nonblock = flags & SOCK_NONBLOCK;
> > +	nonblock = arg->flags & SOCK_NONBLOCK;
> >  	/*
> >  	 * Backend only supports 1 inflight accept request, will return
> >  	 * errors for the others
> > diff --git a/drivers/xen/pvcalls-front.h b/drivers/xen/pvcalls-front.h
> > index f694ad77379f..881ef14660bc 100644
> > --- a/drivers/xen/pvcalls-front.h
> > +++ b/drivers/xen/pvcalls-front.h
> > @@ -12,7 +12,7 @@ int pvcalls_front_bind(struct socket *sock,
> >  int pvcalls_front_listen(struct socket *sock, int backlog);
> >  int pvcalls_front_accept(struct socket *sock,
> >  			 struct socket *newsock,
> > -			 int flags);
> > +			 struct proto_accept_arg *arg);
> >  int pvcalls_front_sendmsg(struct socket *sock,
> >  			  struct msghdr *msg,
> >  			  size_t len);
> > 
> 

