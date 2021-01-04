Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3442EA020
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61512.108329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYbK-0007sp-Vp; Mon, 04 Jan 2021 22:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61512.108329; Mon, 04 Jan 2021 22:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYbK-0007sQ-SG; Mon, 04 Jan 2021 22:45:22 +0000
Received: by outflank-mailman (input) for mailman id 61512;
 Mon, 04 Jan 2021 22:45:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYbK-0007sL-1K
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:45:22 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d532b290-3457-43e5-9e91-64753de860b5;
 Mon, 04 Jan 2021 22:45:21 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104Mj74g071293
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:45:13 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104Mj7LI071292;
 Mon, 4 Jan 2021 14:45:07 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: d532b290-3457-43e5-9e91-64753de860b5
Date: Mon, 4 Jan 2021 14:45:07 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Ian Jackson <iwj@xenproject.org>
Subject: Re: [RESEND] [RFC PATCH] xen/arm: domain_build: Ignore empty memory
 bank
Message-ID: <X/OacwfT8/M3P30O@mattapan.m5p.com>
References: <X+DbupqYE3rrFaIM@mattapan.m5p.com>
 <102a361a-a070-185f-c564-8e4c30f96ab6@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <102a361a-a070-185f-c564-8e4c30f96ab6@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Dec 21, 2020 at 06:28:35PM +0000, Julien Grall wrote:
> On 21/12/2020 17:30, Elliott Mitchell wrote:
> > I doubt this is the only bug exposed by
> > 5a37207df52066efefe419c677b089a654d37afc.
> 
> Are you saying that with my patch dropped, Xen will boot but with it 
> will not?

I thought that was the cause.  Yet after a bunch of builds trying to
ensure I can cause it to reproduce or not, I wasn't able to.  As such I
now think this is a misattribution.  :-(

Other candidate on my radar is this showed up near the time I started
trying other kernel sources.  I now wonder if this is due to the
device-trees being produced with recent RPF kernels versus those being
produced with pure mainline.  Presently I'm using a 5.10 RPF kernel and
device-tree.


> So I think we first need to figure out what is the offending node and 
> why it is dt_device_get_address() is returning an error for it.
> 
> That said, I agree that we possibly want a check size == 0 (action TBD) 
> in map_range_to_domain() as the code would do the wrong thing for 0.

Already stated "/scb/pcie@7d500000/pci@1,0/usb@1,0".

Perhaps the code should be ignoring nodes for which
which dt_device_get_address() fails, or perhaps this should only be done
for Domain 0 (where it results in panic).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



