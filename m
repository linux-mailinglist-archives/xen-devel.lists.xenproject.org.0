Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF192C7043
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 19:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40106.73169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kj4ku-0006gX-VX; Sat, 28 Nov 2020 18:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40106.73169; Sat, 28 Nov 2020 18:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kj4ku-0006g8-SC; Sat, 28 Nov 2020 18:15:32 +0000
Received: by outflank-mailman (input) for mailman id 40106;
 Sat, 28 Nov 2020 18:15:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3d2o=FC=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kj4kt-0006g1-Cd
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 18:15:31 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 423c1e8e-983b-47ea-9180-8cbdcde1e5f9;
 Sat, 28 Nov 2020 18:15:30 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0ASIFJCL053956
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 28 Nov 2020 13:15:25 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0ASIFIBd053955;
 Sat, 28 Nov 2020 10:15:18 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 423c1e8e-983b-47ea-9180-8cbdcde1e5f9
Date: Sat, 28 Nov 2020 10:15:17 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen on RP4
Message-ID: <X8KTtS99DDj8L2Zh@mattapan.m5p.com>
References: <X73RfHfRfBRLKkvB@mattapan.m5p.com>
 <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com>
 <X73ghKgQEXLv2z2p@mattapan.m5p.com>
 <CAMmSBy-Qdpj+6FAk9D15=+87_=68T80Y1NGnvyAB=tOFveifiQ@mail.gmail.com>
 <X73owDP0UXx+lvJd@mattapan.m5p.com>
 <alpine.DEB.2.21.2011251051240.7979@sstabellini-ThinkPad-T480s>
 <X78irfLB6DQhkPvd@mattapan.m5p.com>
 <CAMmSBy_4ry2DwMNT1Ai1-11wBHHuO71muvkfEWLRV=h0QiKyoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy_4ry2DwMNT1Ai1-11wBHHuO71muvkfEWLRV=h0QiKyoA@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Fri, Nov 27, 2020 at 11:59:10PM -0800, Roman Shaposhnik wrote:
> On Wed, Nov 25, 2020 at 7:36 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > Well, I've now got everything together for a "proper" Debian Raspberry PI
> > installation.  Apparently since 5.2 (perhaps earlier, but 5.2 is
> > confirmed), Debian's kernel source packages have had their Raspberry PI
> > device-trees garbled.  I do have full untouched Linux kernel source
> > handy, but I tend to stick with the distribution until that proves
> > untenable.
> 
> Yup. Same here. I started with upstream kernel, wasted a lot of time,
> threw in the towel
> and imported all of the RPi Foundation patches wholesale :-(

Any chance you could send e-mail to 939633@bugs.debian.org and state you
have also observed corrupt device-trees with Debian's kernel somewhere
in the >=5.2 range?

I'm a half step away from marking that bug "critical" (breaks most/all
Raspberry PI variants, this breaks Debian's Xen build).  I just tend to
be reluctant...

I can almost believe Intel/Tianocore are trying to create a FUD situation
for device-trees in order to push UEFI.  Debian has been cited by the
Tianocore folks as an example of a Linux distribution which can readily
install without modification.  Just a small push to kill device-trees.

Presently I have no evidence of this, just a niggling suspicion.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



