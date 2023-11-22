Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA87F5439
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 00:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639291.996455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wLP-0007zK-8R; Wed, 22 Nov 2023 23:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639291.996455; Wed, 22 Nov 2023 23:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wLP-0007xP-5r; Wed, 22 Nov 2023 23:09:19 +0000
Received: by outflank-mailman (input) for mailman id 639291;
 Wed, 22 Nov 2023 23:09:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5wLN-0007xJ-Rj
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 23:09:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 279997a0-898c-11ee-98e1-6d05b1d4d9a1;
 Thu, 23 Nov 2023 00:09:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DEF3ACE2614;
 Wed, 22 Nov 2023 23:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4019C433C7;
 Wed, 22 Nov 2023 23:09:11 +0000 (UTC)
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
X-Inumbo-ID: 279997a0-898c-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700694553;
	bh=jbEf94vZjnt1ft+0DraBckmmhHqyjxnBrsZ3QbKpMmk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BKNXlCBfrsq5dJhimLywsAIzyr0J08eJzpVDZeH+UpDkb5OvDK1LOj6hkYoj3OddH
	 Yhd6NXh1CWzUS5UsxVGDIhyWmR6ssf6TXZ8DcPNABC7Ka0odaXdecZeFPDKmbTrsLT
	 4I2zftEuq2Ii3Us2JIFvUEVM7ldf6sVKVvg8e5x7CkZ6tC2Gx3j9Ypnnr4GqkTl37b
	 J81hU39mOdTbmekbkakWxq+A+6684MAOLEs+PtFk3fEezbdZXz5y3CgN+BJGrduVjN
	 CiwA04Xe8X8CdnSeIkLszgJ70wOcfHTr9G93XQMkOt35Fg1HZh4FTLdHJZyWvByR6s
	 Ah+Ut3C/WtiWA==
Date: Wed, 22 Nov 2023 15:09:10 -0800 (PST)
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
In-Reply-To: <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
Message-ID: <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>  <20231121221023.419901-5-volodymyr_babchuk@epam.com>  <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>  <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, David Woodhouse wrote:
> On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
> > On Wed, 22 Nov 2023, Paul Durrant wrote:
> > > On 21/11/2023 22:10, Volodymyr Babchuk wrote:
> > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > 
> > > > Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER to
> > > > inherit the owner of the directory.
> > > 
> > > Ah... so that's why the previous patch is there.
> > > 
> > > This is not the right way to fix it. The QEMU Xen support is *assuming* that
> > > QEMU is either running in, or emulating, dom0. In the emulation case this is
> > > probably fine, but the 'real Xen' case it should be using the correct domid
> > > for node creation. I guess this could either be supplied on the command line
> > > or discerned by reading the local domain 'domid' node.
> > 
> > yes, it should be passed as command line option to QEMU
> 
> I'm not sure I like the idea of a command line option for something
> which QEMU could discover for itself.

That's fine too. I meant to say "yes, as far as I know the toolstack
passes the domid to QEMU as a command line option today".

