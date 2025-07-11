Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5409B02657
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 23:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041520.1412278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaLCU-0002Tl-HC; Fri, 11 Jul 2025 21:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041520.1412278; Fri, 11 Jul 2025 21:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaLCU-0002SJ-EL; Fri, 11 Jul 2025 21:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1041520;
 Fri, 11 Jul 2025 21:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SAtj=ZY=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1uaLCT-0002SD-6D
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 21:22:33 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2622c9b8-5e9d-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 23:22:30 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 56BLMLMk017742
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 11 Jul 2025 17:22:26 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 56BLMK0x017741;
 Fri, 11 Jul 2025 14:22:20 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 2622c9b8-5e9d-11f0-a318-13f23c93f187
Date: Fri, 11 Jul 2025 14:22:20 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Andrei Semenov <andrei.semenov@vates.tech>
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
Message-ID: <aHGAjJtz66pRBWsM@mattapan.m5p.com>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
 <aHAdG-vhZqdLeOpg@mattapan.m5p.com>
 <aHDAC3mvysH-0vit@mail.vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHDAC3mvysH-0vit@mail.vates.tech>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Fri, Jul 11, 2025 at 07:41:02AM +0000, Anthoine Bourgeois wrote:
> On Thu, Jul 10, 2025 at 01:05:47PM -0700, Elliott Mitchell wrote:
> >On Thu, Jul 10, 2025 at 04:11:15PM +0000, Anthoine Bourgeois wrote:
> >> We found at Vates that there are lot of spurious interrupts when
> >> benchmarking the PV drivers of Xen. This issue appeared with a patch
> >> that addresses security issue XSA-391 (see Fixes below). On an iperf
> >> benchmark, spurious interrupts can represent up to 50% of the
> >> interrupts.
> >
> >If this is the correct fix, near-identical fixes are needed for *all*
> >of the Xen front-ends.  Xen virtual block-devices and Xen PCI-passthrough
> >devices are also effected by a similar issue.
> >
> blkfront doesn't call the response handle from multiple places. It
> doesn't seem to be affected by this problem.
> And pcifront neither.

Ick.  I had hope it might be a single bug, or at worst a group of
highly similar bugs.  This may be several distinct bugs then.  :-(

When this bug was first reportted to xen-devel@, I noticed reports of
spurious interrupts on the block backend.  Due to a piece of hardware
intended for pass-through, I now know it manifests on the PCI backend
too.

Perhaps you hadn't noticed due to caching lessening the impact of
spurious events on virtual block devices?  Whatever the case
`ls /sys/devices/??*-[0-9]*-[0-9]*/xenbus/spurious_events` shows
spurious interrupts on pretty well every virtual device for me (I plan to
test the fix for net-front in the near future).


> >Thanks for finding a candidate fix, this effects many other people who
> >have been troubled by this performance issue.
> >
> >FreeBSD will also need a similar fix.
> 
> In FreeBSD, netfront may also be affected.
> xn_assemble_tx_request calls xn_txeof.
> blkfront and pcifront seems good.

Interestingly the problem doesn't seem nearly as severe on ARM.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



