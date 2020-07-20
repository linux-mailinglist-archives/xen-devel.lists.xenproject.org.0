Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB2C225D20
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:10:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxTgY-0005u2-6s; Mon, 20 Jul 2020 11:10:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxTgX-0005tx-29
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:10:17 +0000
X-Inumbo-ID: 96897620-ca79-11ea-9f84-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96897620-ca79-11ea-9f84-12813bfff9fa;
 Mon, 20 Jul 2020 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595243417;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0uY2iAGgQD/jTVNZ02tjyg9+PVJ6iVv1+aMXh5h7mv4=;
 b=G2oLYpaiKtgu8nq2PNqXJhIkR4SZVuinh/bqfn7hF5AR96+1VSCHeoEu
 B8fGYj5YMlBM2IZKWba5pEQldUPiqZZHtkaolMpecs35wlhnbzqYGfscW
 b15G2LQPkKfj9gvHZOyLLA5Lqon4TEvyCKMowU22LZhuDSADxuJPKMXaT I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: d/9RX8s/l3kWpPI01lNkPjuqD1aCI7h9a+pqnZQ6piT5cn3wv5f75X4vtxfd2b9ILqf4TEcWTA
 GR4Cs59sV7u/5O64zLToBz8IjvueaLL7j8JL5Nvsk/lqmdnDAbhDh/uVrxZz4ZvcNjqBNvKBCX
 NkjyUruM3YGVy1QzqcxvNBk6ggOTWWRtFMGr1xJtOe3S1y0OnYif5sv9GRdpRqBAAXJQ2xZCNY
 NhyIRm1BLWJOpxioMDUn/5Gj9rhtP5KiQAdOcCpAlW07CpV5aPOXgfxbA+3t6CWzgyUWu6zkjf
 Z3c=
X-SBRS: 2.7
X-MesageID: 23066242
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="23066242"
Date: Mon, 20 Jul 2020 13:09:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
Message-ID: <20200720110950.GJ7191@Air-de-Roger>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
 <be3fc8de-5582-8fd0-52cd-0cbfbfa96859@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be3fc8de-5582-8fd0-52cd-0cbfbfa96859@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 20, 2020 at 01:56:51PM +0300, Oleksandr wrote:
> On 20.07.20 12:17, Roger Pau Monné wrote:
> > On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
> > > On 17.07.20 18:00, Roger Pau Monné wrote:
> > > > On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
> > > The other reasons are:
> > > 
> > > 1. Automation. With current backend implementation we don't need to pause
> > > guest right after creating it, then go to the driver domain and spawn
> > > backend and
> > > 
> > > after that go back to the dom0 and unpause the guest.
> > xl devd should be capable of handling this for you on the driver
> > domain.
> > 
> > > 2. Ability to detect when guest with involved frontend has gone away and
> > > properly release resource (guest destroy/reboot).
> > > 
> > > 3. Ability to (re)connect to the newly created guest with involved frontend
> > > (guest create/reboot).
> > > 
> > > 4. What is more that having Xenstore support the backend is able to detect
> > > the dom_id it runs into and the guest dom_id, there is no need pass them via
> > > command line.
> > > 
> > > 
> > > I will be happy to explain in details after publishing backend code).
> > As I'm not the one doing the work I certainly won't stop you from
> > using xenstore on the backend. I would certainly prefer if the backend
> > gets all the information it needs from the command line so that the
> > configuration data is completely agnostic to the transport layer used
> > to convey it.
> > 
> > Thanks, Roger.
> 
> Thank you for pointing another possible way. I feel I need to investigate
> what is the "xl devd" (+ Argo?) and how it works. If it is able to provide
> backend with

That's what x86 at least uses to manage backends on driver domains: xl
devd will for example launch the QEMU instance required to handle a
Xen PV disk backend in user-space.

Note that there's currently no support for Argo or any communication
channel different than xenstore, but I think it would be cleaner to
place the fetching of data from xenstore in xl devd and just pass
those as command line arguments to the VirtIO backend if possible. I
would prefer the VirtIO backend to be fully decoupled from xenstore.

Note that for a backend running on dom0 there would be no need to
pass any data on xenstore, as the backend would be launched directly
from xl with the appropriate command line arguments.

> the support/information it needs and xenstore is not welcome then I would be
> absolutely ok to consider using other solution.
> 
> I propose to get back to that discussion after I prepare and send out the
> proper IOREQ series.

Sure, that's fine.

Roger.

