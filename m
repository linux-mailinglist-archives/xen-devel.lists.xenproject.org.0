Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D371BB1F5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 01:22:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTD4C-0001IY-C6; Mon, 27 Apr 2020 23:21:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HlLs=6L=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jTD4B-0001IN-Ph
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 23:21:35 +0000
X-Inumbo-ID: d6388a0a-88dd-11ea-ae69-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6388a0a-88dd-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 23:21:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA3072075E;
 Mon, 27 Apr 2020 23:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588029694;
 bh=nx/nmVldIYIOy9rsYk4VVkSu6iXjMMKfmu5BQ+ZhcWw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=QmRbRaSsPI74rTpOqE00WGqPkL5WZDa9yawhH0qThzIvAMBSDrsFB5A3MqmaKy7RH
 yti1KTxfKEnR0hnKK0ZnVtHeTZ+oVz0VmmouYM8URZfshs2UB0BbiwkNxd/o4odZWI
 EPhnof4TE+5fHtGALqfV6JTfNY944+Nlfu7aEtc0=
Date: Mon, 27 Apr 2020 16:21:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: arm: DomU Networking enable leads to Dom0 kernel oops
In-Reply-To: <CAJ=z9a0s-KGyP--kFzBdohzf509toZBq6qHrnt8JQEaLAaQ7=Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2004271620190.29217@sstabellini-ThinkPad-T480s>
References: <VI1PR04MB505620B32C8289C6106D0B2AF9D00@VI1PR04MB5056.eurprd04.prod.outlook.com>
 <alpine.DEB.2.21.2004241443570.7982@sstabellini-ThinkPad-T480s>
 <CAJ=z9a284froER_-dNQKWwzXkPJ5S0yodY1vyqukqDywxWtCXg@mail.gmail.com>
 <CAJ=z9a0s-KGyP--kFzBdohzf509toZBq6qHrnt8JQEaLAaQ7=Q@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 25 Apr 2020, Julien Grall wrote:
> On Sat, 25 Apr 2020 at 10:49, Julien Grall <julien.grall.oss@gmail.com> wrote:
> >
> > On Sat, 25 Apr 2020 at 03:01, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > [   86.900974] ------------[ cut here ]------------
> > > [   86.905134] Interrupt for port 6, but apparently not enabled; per-user (____ptrval____)
> > > [   86.913228] WARNING: CPU: 0 PID: 2437 at drivers/xen/evtchn.c:167 evtchn_interrupt+0xfc/0x108
> >
> > The implementation of the evtchn_interrupt() is relying to be called
> > in the top-half. On RT, interrupts handlers are forced to be threaded
> > and use the IRQF_ONESHOT semantics if they were not threaded before.
> >
> > However, IRQF_ONESHOT is completely broken for event channels (this is
> > not RT's fault) and hence why you see the warning here.
> >
> > Note that you can't force to run evtchn_interrupt() in the top-half
> > because it relies on functions that may sleep.
> >
> > See https://lkml.org/lkml/2019/2/19/642.
> 
> Here at better link with the full conversation:
> 
> https://lore.kernel.org/lkml/5e256d9a-572c-e01e-7706-407f99245b00@arm.com/

Many thanks for pointing it out to me. I think I know what the problem
is. I replied to that thread with a patch that fixes my LinuxRT issue on ARM:

https://marc.info/?l=xen-devel&m=158802965821440&w=2

