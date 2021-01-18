Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307272F9BD9
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69488.124382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QmC-0005J0-G0; Mon, 18 Jan 2021 09:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69488.124382; Mon, 18 Jan 2021 09:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QmC-0005Ib-CX; Mon, 18 Jan 2021 09:24:44 +0000
Received: by outflank-mailman (input) for mailman id 69488;
 Mon, 18 Jan 2021 09:24:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skM3=GV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l1QmA-0005I7-Fy
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:24:42 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec63f5e7-02ca-424a-8d11-1956077a1999;
 Mon, 18 Jan 2021 09:24:41 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10I9OYD8016356;
 Mon, 18 Jan 2021 10:24:34 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 9ACE2281D; Mon, 18 Jan 2021 10:24:34 +0100 (CET)
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
X-Inumbo-ID: ec63f5e7-02ca-424a-8d11-1956077a1999
Date: Mon, 18 Jan 2021 10:24:34 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: pass some infos to qemu
Message-ID: <20210118092434.GC859@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-17-bouyer@antioche.eu.org>
 <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
 <20210116112502.GA1133@antioche.eu.org>
 <20210118083642.deozyeo5o6yziba7@Air-de-Roger>
 <20210118085214.GB859@antioche.eu.org>
 <20210118090722.jlf5j324mfeylp6t@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118090722.jlf5j324mfeylp6t@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Mon, 18 Jan 2021 10:24:35 +0100 (MET)

On Mon, Jan 18, 2021 at 10:07:22AM +0100, Roger Pau Monné wrote:
> On Mon, Jan 18, 2021 at 09:52:14AM +0100, Manuel Bouyer wrote:
> > On Mon, Jan 18, 2021 at 09:36:42AM +0100, Roger Pau Monné wrote:
> > > I also wonder why NetBSD needs to add the tap interface to the bridge
> > > in the QEMU script instead of doing it from the hotplug script called
> > > by libxl, like Linux and FreeBSD do.
> > 
> > the tap interface is created by qemu itself, its name is not known outside
> > of qemu. Also, is there guarantee that qemu has created the tap before
> > the hotplug script is called ?
> 
> Yes, the toolstack will wait for QEMU to be initialized at which point
> the tap interface has been created.
> 
> I think I remember now why this didn't work on NetBSD. We ask QEMU to
> create the tap interface with a specific name (using the vifname=
> parameter), but NetBSD doesn't have the ioctl to rename network
> interfaces implemented, and thus cannot rename the interface from tapX
> to vifX.Y-emu, and hence you need to use the QEMU script from QEMU
> itself because it's the only entity that knows the name of the tap
> interface created.

Yes; at some point I proposed to support name aliases to interface
name in NetBSD but it got rejected ... so we have to use the
name the kernel did choose for us.

> 
> If you agree, can you add something along the lines to the commit
> message? So that we remember why NetBSD needs to use the QEMU scripts.

Will do.
thanks 

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

