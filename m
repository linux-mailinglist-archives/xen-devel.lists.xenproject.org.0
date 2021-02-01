Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D9330A01E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 03:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79501.144701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6OVG-0001Ql-II; Mon, 01 Feb 2021 01:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79501.144701; Mon, 01 Feb 2021 01:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6OVG-0001QT-Ba; Mon, 01 Feb 2021 01:59:46 +0000
Received: by outflank-mailman (input) for mailman id 79501;
 Mon, 01 Feb 2021 01:59:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ttS=HD=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l6OVE-0001QO-H0
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 01:59:44 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc2b2e3b-772d-412b-a42f-f70154f38a30;
 Mon, 01 Feb 2021 01:59:42 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 1111xRtb011604
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 31 Jan 2021 20:59:33 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 1111xR67011603;
 Sun, 31 Jan 2021 17:59:27 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: cc2b2e3b-772d-412b-a42f-f70154f38a30
Date: Sun, 31 Jan 2021 17:59:27 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
Message-ID: <YBdgf4KKcDn0SCOw@mattapan.m5p.com>
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com>
 <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> >
> > On Sun, Jan 31, 2021 at 02:06:17PM -0500, Tamas K Lengyel wrote:
> > > (XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
> > > (XEN) Device tree generation failed (-22).
> >
> > > Does anyone have an idea what might be going wrong here? I tried
> > > building the dtb without using the dtb overlay but it didn't seem to
> > > do anything.
> >
> > If you go to line 1412 of the file xen/arch/arm/domain_build.c and
> > replace the "return res;" with "continue;" that will bypass the issue.
> > The 3 people I'm copying on this message though may wish to ask questions
> > about the state of your build tree.
> 
> I'll try that but it's a pretty hacky work-around ;)

Actually no, it simply causes Xen to ignore these entries.  The patch
I've got ready to submit to this list also adjusts the error message to
avoid misinterpretation, but does pretty well exactly this.

My only concern is whether it should ignore the entries only for Domain 0
or should always ignore them.


> > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > point to that last being touched last year.  Their tree is at
> > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> 
> I've moved the Linux branch up to 5.10 because there had been a fair
> amount of work that went into fixing Xen on RPI4, which got merged
> into 5.9 and I would like to be able to build upstream everything
> without the custom patches coming with the rpixen script repo.

Please keep track of where your kernel source is checked out at since
there was a desire to figure out what was going on with the device-trees.


Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
kernel command-line should ensure you get output from the kernel if it
manages to start (yes, Linux does support having multiple consoles at the
same time).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



