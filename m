Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472933A40D
	for <lists+xen-devel@lfdr.de>; Sun, 14 Mar 2021 11:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97688.185465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLNbl-0007fc-0W; Sun, 14 Mar 2021 10:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97688.185465; Sun, 14 Mar 2021 10:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLNbk-0007fD-Sv; Sun, 14 Mar 2021 10:04:24 +0000
Received: by outflank-mailman (input) for mailman id 97688;
 Sun, 14 Mar 2021 10:04:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L0Kb=IM=kernel.org=leon@srs-us1.protection.inumbo.net>)
 id 1lLNbk-0007f8-11
 for xen-devel@lists.xenproject.org; Sun, 14 Mar 2021 10:04:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0142cc59-12d2-488e-a6a1-fc18e208b0f4;
 Sun, 14 Mar 2021 10:04:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72A5B64EC6;
 Sun, 14 Mar 2021 10:04:21 +0000 (UTC)
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
X-Inumbo-ID: 0142cc59-12d2-488e-a6a1-fc18e208b0f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615716262;
	bh=YaBvDkHUpVHgz7IeG1nFxa4iaw8l+effxELbw6xjnSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9YaaxkaUJC+S1azF/+EVhOe/Lsd3o7jbq4JOjr3/2DQ6MhgN9b59MDqcefZZsdKg
	 6jP871VcuNH1rT616IsxvMjOXZbZC6tFGVQB7r9KoIyJusI40pMgHxlaHBROWaZkBt
	 cXn7MylmRqRpBsgDR40EfziTbjSNq4a+kNLjoZsEYGUn1KqLLj8YGINoZ6QPQpSng0
	 xCvyfxE2aTO2draiJuQtp2Qo08K303pVPUmIOsKjqaL953lovzlHLAc+poc6yHQz96
	 PnQ+52gWBxkJ+p7IoX8p1gGCUelyP2/7a2SsDQFdStJ2v+mIkD0Eip6flduJgjCcRz
	 DY4pge6ieA9cQ==
Date: Sun, 14 Mar 2021 12:04:18 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Hsu, Chiahao" <andyhsu@amazon.com>, netdev@vger.kernel.org,
	wei.liu@kernel.org, paul@xen.org, davem@davemloft.net,
	kuba@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Message-ID: <YE3foiFJ4sfiFex2@unreal>
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch>
 <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
 <YEvQ6z5WFf+F4mdc@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEvQ6z5WFf+F4mdc@lunn.ch>

On Fri, Mar 12, 2021 at 09:36:59PM +0100, Andrew Lunn wrote:
> On Fri, Mar 12, 2021 at 04:18:02PM +0100, Hsu, Chiahao wrote:
> >
> > Andrew Lunn 於 2021/3/12 15:52 寫道:
> > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > >
> > >
> > >
> > > On Thu, Mar 11, 2021 at 10:59:44PM +0000, ChiaHao Hsu wrote:
> > > > In order to support live migration of guests between kernels
> > > > that do and do not support 'feature-ctrl-ring', we add a
> > > > module parameter that allows the feature to be disabled
> > > > at run time, instead of using hardcode value.
> > > > The default value is enable.
> > > Hi ChiaHao
> > >
> > > There is a general dislike for module parameters. What other mechanisms
> > > have you looked at? Would an ethtool private flag work?
> > >
> > >       Andrew
> >
> >
> > Hi Andrew,
> >
> > I can survey other mechanisms, however before I start doing that,
> >
> > could you share more details about what the problem is with using module
> > parameters? thanks.
>
> It is not very user friendly. No two kernel modules use the same
> module parameters. Often you see the same name, but different
> meaning. There is poor documentation, you often need to read the
> kernel sources it figure out what it does, etc.

+1, It is also global parameter to whole system/devices that use this
module, which is rarely what users want.

Thanks

