Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49713226FCD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 22:40:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxcaJ-0006qr-KN; Mon, 20 Jul 2020 20:40:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt7f=A7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jxcaI-0006qm-7m
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 20:40:26 +0000
X-Inumbo-ID: 3cebab7e-cac9-11ea-a014-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cebab7e-cac9-11ea-a014-12813bfff9fa;
 Mon, 20 Jul 2020 20:40:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C89320773;
 Mon, 20 Jul 2020 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595277624;
 bh=sBujR0/o2tldXcRP6P/xpFAxQtgn/vbpQ9/+T2YeIbY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=VzHKr3n7r/a5HuA45R3Ho296xVOwkVQ2PklXCEWpxWb3gjJzie5xQ/x6djZpqW4oZ
 EpCudGoqyEprtxbOEb4e5A0LvD1Q/LWqJ3BCKUliY++z7q7gQ7BmnDC/2LeWcYpNYw
 v22336ccSuZLkFlrqljRVZDD6BpCsd8b47B9XjxE=
Date: Mon, 20 Jul 2020 13:40:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
In-Reply-To: <20200720110950.GJ7191@Air-de-Roger>
Message-ID: <alpine.DEB.2.21.2007201330070.32544@sstabellini-ThinkPad-T480s>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
 <be3fc8de-5582-8fd0-52cd-0cbfbfa96859@gmail.com>
 <20200720110950.GJ7191@Air-de-Roger>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-405729398-1595277306=:32544"
Content-ID: <alpine.DEB.2.21.2007201338140.32544@sstabellini-ThinkPad-T480s>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-405729398-1595277306=:32544
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007201338141.32544@sstabellini-ThinkPad-T480s>

On Mon, 20 Jul 2020, Roger Pau Monné wrote:
> On Mon, Jul 20, 2020 at 01:56:51PM +0300, Oleksandr wrote:
> > On 20.07.20 12:17, Roger Pau Monné wrote:
> > > On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
> > > > On 17.07.20 18:00, Roger Pau Monné wrote:
> > > > > On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
> > > > The other reasons are:
> > > > 
> > > > 1. Automation. With current backend implementation we don't need to pause
> > > > guest right after creating it, then go to the driver domain and spawn
> > > > backend and
> > > > 
> > > > after that go back to the dom0 and unpause the guest.
> > > xl devd should be capable of handling this for you on the driver
> > > domain.
> > > 
> > > > 2. Ability to detect when guest with involved frontend has gone away and
> > > > properly release resource (guest destroy/reboot).
> > > > 
> > > > 3. Ability to (re)connect to the newly created guest with involved frontend
> > > > (guest create/reboot).
> > > > 
> > > > 4. What is more that having Xenstore support the backend is able to detect
> > > > the dom_id it runs into and the guest dom_id, there is no need pass them via
> > > > command line.
> > > > 
> > > > 
> > > > I will be happy to explain in details after publishing backend code).
> > > As I'm not the one doing the work I certainly won't stop you from
> > > using xenstore on the backend. I would certainly prefer if the backend
> > > gets all the information it needs from the command line so that the
> > > configuration data is completely agnostic to the transport layer used
> > > to convey it.
> > > 
> > > Thanks, Roger.
> > 
> > Thank you for pointing another possible way. I feel I need to investigate
> > what is the "xl devd" (+ Argo?) and how it works. If it is able to provide
> > backend with
> 
> That's what x86 at least uses to manage backends on driver domains: xl
> devd will for example launch the QEMU instance required to handle a
> Xen PV disk backend in user-space.
> 
> Note that there's currently no support for Argo or any communication
> channel different than xenstore, but I think it would be cleaner to
> place the fetching of data from xenstore in xl devd and just pass
> those as command line arguments to the VirtIO backend if possible. I
> would prefer the VirtIO backend to be fully decoupled from xenstore.
> 
> Note that for a backend running on dom0 there would be no need to
> pass any data on xenstore, as the backend would be launched directly
> from xl with the appropriate command line arguments.

If I can paraphrase Roger's point, I think we all agree that xenstore is
very convenient to use and great to get something up and running
quickly. But it has several limitations, so it would be fantastic if we
could kill two birds with one stone and find a way to deploy the system
without xenstore, given that with virtio it is not actually needed if not
for very limited initial configurations. It would certainly be a big
win. However, it is fair to say that the xenstore alternative, whatever
that might be, needs work.
--8323329-405729398-1595277306=:32544--

