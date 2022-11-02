Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F008616F53
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 22:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436057.690105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqKt6-0004lT-5Y; Wed, 02 Nov 2022 21:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436057.690105; Wed, 02 Nov 2022 21:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqKt6-0004ix-2T; Wed, 02 Nov 2022 21:03:04 +0000
Received: by outflank-mailman (input) for mailman id 436057;
 Wed, 02 Nov 2022 21:03:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4vUW=3C=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1oqKt4-0004ip-Ju
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 21:03:02 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb045e9e-5af1-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 22:03:00 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 2A2L2QDf045183
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Nov 2022 17:02:32 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 2A2L2PVA045182;
 Wed, 2 Nov 2022 14:02:25 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: bb045e9e-5af1-11ed-8fd0-01056ac49cbb
Date: Wed, 2 Nov 2022 14:02:25 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Rahul Singh <Rahul.Singh@arm.com>,
        Xen developer discussion <xen-devel@lists.xenproject.org>,
        Michal Orzel <Michal.Orzel@arm.com>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Message-ID: <Y2La4fxtcjl2f14x@mattapan.m5p.com>
References: <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
 <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
 <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop>
 <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
 <Y2E05RLmXRIR6heO@mattapan.m5p.com>
 <947E315E-6537-48DC-8AC6-5218C12B604C@arm.com>
 <Y2GAwKsmx9f39p+Y@mattapan.m5p.com>
 <FB140BBA-B27D-413D-84C6-B75D66218413@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FB140BBA-B27D-413D-84C6-B75D66218413@arm.com>
X-Spam-Status: No, score=-0.0 required=10.0 tests=KHOP_HELO_FCRDNS,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Wed, Nov 02, 2022 at 08:50:58AM +0000, Bertrand Marquis wrote:
> 
> > On 1 Nov 2022, at 20:25, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > 
> > Allocate a domain Id to each IOMMU domain and this very much seems quite
> > similar to Xen's grant tables.  I'm unsure the two can be unified, but
> > they appear to have many common aspects.
> 
> >From an high level point of view it might but from the guest point of view the
> IOMMU is something used with or without Xen where grant tables are very
> specific to Xen. I do not see anything that could be unified there.
> 
> Maybe I am missing something here that other could see though :-)

Imagine a SoC design which has a bunch of cores, memory and 48 IOMMUs.
On a particular board, the designer finds they only need 16 of the IOMMUs
for devices.

Since nothing needs to be done, the designer leaves IOMMUs 16-47 wired
together as loopback.  ie a write to IOMMU 16 will show up as a DMA write
on IOMMU 17 and vice versa, similar situation with 18/19 and all the
remaining IOMMUs.

Imagine running Xen on such a hypothetical board.  If there were less
than 16 DomUs and all I/O went through Dom0, the loopback pairs could do
a job very similar to the grant tables.  Adjustments would be needed to
make use of this, but it seems an interesting thought experiment.

This requires hardware support with the hardware setup in a particular
way, but doesn't really seem like that much of a stretch.  Virtualization
support has been increasing, so perhaps something akin to a
next-generation IOMMU would include the needed functionality.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



