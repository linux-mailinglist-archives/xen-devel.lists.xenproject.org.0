Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865334465ED
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 16:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222499.384727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1LF-0002gx-Q7; Fri, 05 Nov 2021 15:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222499.384727; Fri, 05 Nov 2021 15:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1LF-0002eq-Mh; Fri, 05 Nov 2021 15:41:21 +0000
Received: by outflank-mailman (input) for mailman id 222499;
 Fri, 05 Nov 2021 15:41:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvBC=PY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mj1LE-0002ei-Md
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 15:41:20 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1698c69-3e4e-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 16:41:19 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1FE56125F;
 Fri,  5 Nov 2021 15:41:17 +0000 (UTC)
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
X-Inumbo-ID: d1698c69-3e4e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636126877;
	bh=HnhtG5FvSyIA75ZwEw1CvVr/rFaWgLWI6dajxsws5m4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iDjSQZSIAbrpVa/Hrym65um/PCCdVIGOuHr7yTP9Z6QR8cYfbr7jRCfbnvGHcesRp
	 C5YuDx/hQP5mpm/bwAh1w+YYW5bhxwjF1i3oshmHeEXqvU8qqnW6yKxbGmKd8vvMki
	 4QcEMMoLluqoTsgjlUenphKYrsRnAyIAobVL3/+iOAzJUYurZtF9Qj+8Mov5EVSmF5
	 QMIgajrw3dRZfNDoVNOh1ROCiAVfQM+7d7J9jVqE4jfae38leR6K9s0Q93VTi/QmTN
	 zBMTLj7/fnWkLCYM8Y3MsX41W+uSzY/+zyi3QN5hgQgBKC7z2avUfxFqzFExen3eTE
	 nQnxCN8o3iv7Q==
Date: Fri, 5 Nov 2021 08:41:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>
Subject: RE: static-mem preventing dom0 from booting
In-Reply-To: <DU2PR08MB7325A7A5658B1EB7C6EB4DECF78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2111050836580.284830@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop> <DU2PR08MB73256624607E7624CAAD38E5F78E9@DU2PR08MB7325.eurprd08.prod.outlook.com> <DU2PR08MB7325A7A5658B1EB7C6EB4DECF78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Nov 2021, Penny Zheng wrote:
> > -----Original Message-----
> > From: Penny Zheng
> > Sent: Friday, November 5, 2021 11:23 AM
> > To: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>
> > Subject: RE: static-mem preventing dom0 from booting
> > 
> > Hi Stefano
> > 
> > > -----Original Message-----
> > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > Sent: Friday, November 5, 2021 9:36 AM
> > > To: Penny Zheng <Penny.Zheng@arm.com>
> > > Cc: sstabellini@kernel.org; xen-devel@lists.xenproject.org
> > > Subject: static-mem preventing dom0 from booting
> > >
> > > Hi Penny,
> > >
> > > I am trying to test the static-mem feature in Xen 4.16 but I am having
> > > some issues. I can boot a dom0less domU with static-mem configured
> > > correctly, but when I do so, dom0 doesn't boot any longer.
> > >
> > 
> > Hmm, In our first intention, dom0less is a mandatory option for static
> > allocation.
> > domU on static allocation shall boot when dom0 doesn't boot there.
> > 
> > We think that, nevertheless, dom0 memory range is allocated by Xen
> > automatically, and it leads to the unpredictability. Static allocation through
> > device tree configuration prefers the total static environment to avoid
> > unpredictability.
> > 
> > > In the same configuration, if I remove the static-mem related lines
> > > from the domU node on device tree, both dom0 and domU boot successfully.
> > >
> > > I am sure the dom0 memory range, allocated by Xen automatically, and
> > > the domU memory range, hand-picked by me, do not clash as you can see
> > > from the boot logs (appended).
> > >
> > > Am I missing anything in the configuration? I am using a ZCU102 board,
> > > the memory node on the host device tree is:
> > >
> > 
> > Are you suggesting one scenario where dom0 with static-mem domU?
> > 
> > Hmmm, one quick thought, it may not be working with vpl011 emulation.
> > When dom0 exists, vpl011 will take dom0 as backend, which requests event
> > channel, xen store, etc, involved to communicate. but static-mem domU
> > without CONFIG_XEN shall not handle it.
> > 
> 
> Digging on this, and my misunderstanding. Domain created through device tree
> shall use xen as backend, not dom0. I guess that only the one created by xl is using
> dom0 as backend.
> 
> Nevertheless, if this is your scenario, where dom0 and static-mem domU(NO CONFIG_XEN) co-exists,
> I'll test for you.

The scenario is extremely simple; you can see the full device tree
configuration in the attachment to my previous email.

- dom0
- dom0less domU with static-mem

That's it! So basically it is just a normal dom0 + dom0less domU
configuration, which already works fine, where I added static-mem to the
domU and suddenly dom0 (not the domU!) stopped working.

