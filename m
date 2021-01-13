Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBAF2F40F6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 02:06:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66239.117574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzUZa-0005hj-Vq; Wed, 13 Jan 2021 01:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66239.117574; Wed, 13 Jan 2021 01:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzUZa-0005hK-Sh; Wed, 13 Jan 2021 01:03:42 +0000
Received: by outflank-mailman (input) for mailman id 66239;
 Wed, 13 Jan 2021 01:03:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0X6K=GQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kzUZZ-0005hF-5i
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 01:03:41 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e11ed003-176a-43a2-a89a-22598bab0b02;
 Wed, 13 Jan 2021 01:03:40 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10D13Neh024620
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 12 Jan 2021 20:03:29 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10D13MXu024619;
 Tue, 12 Jan 2021 17:03:22 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: e11ed003-176a-43a2-a89a-22598bab0b02
Date: Tue, 12 Jan 2021 17:03:22 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Ian Jackson <iwj@xenproject.org>
Subject: Re: [RESEND] [RFC PATCH] xen/arm: domain_build: Ignore empty memory
 bank
Message-ID: <X/5G2uOb5mu1pZKb@mattapan.m5p.com>
References: <X+DbupqYE3rrFaIM@mattapan.m5p.com>
 <102a361a-a070-185f-c564-8e4c30f96ab6@xen.org>
 <X/OacwfT8/M3P30O@mattapan.m5p.com>
 <alpine.DEB.2.21.2101111649050.2495@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2101111649050.2495@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Jan 11, 2021 at 04:49:57PM -0800, Stefano Stabellini wrote:
> On Mon, 4 Jan 2021, Elliott Mitchell wrote:
> > On Mon, Dec 21, 2020 at 06:28:35PM +0000, Julien Grall wrote:
> > > So I think we first need to figure out what is the offending node and 
> > > why it is dt_device_get_address() is returning an error for it.
> > > 
> > > That said, I agree that we possibly want a check size == 0 (action TBD) 
> > > in map_range_to_domain() as the code would do the wrong thing for 0.
> > 
> > Already stated "/scb/pcie@7d500000/pci@1,0/usb@1,0".
> 
> Can you please post the full node for usb@1,0? I would like to check the
> corresponding device tree binding to see the expected format.
> 
> 
> > Perhaps the code should be ignoring nodes for which
> > which dt_device_get_address() fails, or perhaps this should only be done
> > for Domain 0 (where it results in panic).
> 
> That seems reasonable

What is the best approach to passing it along?  The dtb file is 46KB,
figuring out the right dts file isn't always simple.

I can state it was at commit cff5fa15e5d11758db426eee3524a5dfded3c62b of
https://github.com/raspberrypi/linux.git

No matter one's view on GitHub, this is also viewable online:

https://github.com/raspberrypi/linux/tree/cff5fa15e5d11758db426eee3524a5dfded3c62b/arch/arm/boot/dts


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



