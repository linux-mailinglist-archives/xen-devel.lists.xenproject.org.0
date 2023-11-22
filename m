Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F15997F5466
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 00:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639303.996485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wWd-0006UW-OX; Wed, 22 Nov 2023 23:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639303.996485; Wed, 22 Nov 2023 23:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wWd-0006SH-Lp; Wed, 22 Nov 2023 23:20:55 +0000
Received: by outflank-mailman (input) for mailman id 639303;
 Wed, 22 Nov 2023 23:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5wWc-0006Dj-Ah
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 23:20:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7885cfa-898d-11ee-98e1-6d05b1d4d9a1;
 Thu, 23 Nov 2023 00:20:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4BB9361F9F;
 Wed, 22 Nov 2023 23:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40DCC433C7;
 Wed, 22 Nov 2023 23:20:50 +0000 (UTC)
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
X-Inumbo-ID: c7885cfa-898d-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700695251;
	bh=EEYtzj0+nfya6v3Kw0qnMvZAxTcazaLCuWPCEcjlLPY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rHVdGQ4wIyQ1gJmV1l6jIxdqDIjm5h/cE6Hh6LupBd0MoaFVdnGSNJk4ZtF3m0jni
	 85Xhpt+zYqAzv6rxZxryJJunTi0TwOWSb+IhuZaVrKZKXUJhpiSI5eiUxJ3wE/7Ai3
	 rDXS/Jju2sX4XhLTf41gzwAkSq8iGzw/cj1jmdC4COyYRuV3D1srDyk/utpmgUL17A
	 2p3qqgk3dzKfls73MVzKoB2/ibz+azxcc0OklLjo6wiI5wqpWDWcoNz8VIWiScFxGD
	 qf62PwSqFFmkXMUuM9ErRu4ZOQ+ZDkHQSWGzeTkRKotnx654x/0vp74t/Nd05uLdCa
	 YY+cuXRzZonAg==
Date: Wed, 22 Nov 2023 15:20:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: David Woodhouse <dwmw2@infradead.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, paul@xen.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
    Julien Grall <julien@xen.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
In-Reply-To: <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
Message-ID: <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>   <20231121221023.419901-5-volodymyr_babchuk@epam.com>   <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>   <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop> 
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>  <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop> <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, David Woodhouse wrote:
> On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
> > On Wed, 22 Nov 2023, David Woodhouse wrote:
> > > On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
> > > > On Wed, 22 Nov 2023, Paul Durrant wrote:
> > > > > On 21/11/2023 22:10, Volodymyr Babchuk wrote:
> > > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > > 
> > > > > > Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER to
> > > > > > inherit the owner of the directory.
> > > > > 
> > > > > Ah... so that's why the previous patch is there.
> > > > > 
> > > > > This is not the right way to fix it. The QEMU Xen support is *assuming* that
> > > > > QEMU is either running in, or emulating, dom0. In the emulation case this is
> > > > > probably fine, but the 'real Xen' case it should be using the correct domid
> > > > > for node creation. I guess this could either be supplied on the command line
> > > > > or discerned by reading the local domain 'domid' node.
> > > > 
> > > > yes, it should be passed as command line option to QEMU
> > > 
> > > I'm not sure I like the idea of a command line option for something
> > > which QEMU could discover for itself.
> > 
> > That's fine too. I meant to say "yes, as far as I know the toolstack
> > passes the domid to QEMU as a command line option today".
> 
> The -xen-domid argument on the QEMU command line today is the *guest*
> domain ID, not the domain ID in which QEMU itself is running.
> 
> Or were you thinking of something different?

Ops, you are right and I understand your comment better now. The backend
domid is not on the command line but it should be discoverable (on
xenstore if I remember right).

