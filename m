Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA098403065
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 23:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181370.328454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNipe-0006B3-87; Tue, 07 Sep 2021 21:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181370.328454; Tue, 07 Sep 2021 21:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNipe-00069G-51; Tue, 07 Sep 2021 21:40:42 +0000
Received: by outflank-mailman (input) for mailman id 181370;
 Tue, 07 Sep 2021 21:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zymF=N5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mNipc-00069A-N9
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 21:40:40 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0f389cb-a8c4-4acf-b99a-78afcad85853;
 Tue, 07 Sep 2021 21:40:39 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 187LeWHK073357
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 7 Sep 2021 17:40:37 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 187LeW1h073356;
 Tue, 7 Sep 2021 14:40:32 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c0f389cb-a8c4-4acf-b99a-78afcad85853
Date: Tue, 7 Sep 2021 14:40:31 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HVM/PVH Balloon crash
Message-ID: <YTfcTztxXdGmM2Ym@mattapan.m5p.com>
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Tue, Sep 07, 2021 at 05:57:10PM +0200, Jan Beulich wrote:
> On 07.09.2021 17:03, Elliott Mitchell wrote:
> > On Tue, Sep 07, 2021 at 10:03:51AM +0200, Jan Beulich wrote:
> >>
> >> That sounds odd at the first glance - PVH simply requires that there be
> >> an (enabled) IOMMU. Hence the only thing I could imagine is that Xen
> >> doesn't enable the IOMMU in the first place for some reason.
> > 
> > Doesn't seem that odd to me.  I don't know the differences between the
> > first and second versions of the AMD IOMMU, but could well be v1 was
> > judged not to have enough functionality to bother with.
> > 
> > What this does make me wonder is, how much testing was done on systems
> > with functioning NPT, but disabled IOMMU?
> 
> No idea. During development is may happen (rarely) that one disables
> the IOMMU on purpose. Beyond that - can't tell.

Thus this processor having an early and not too capable IOMMU seems
worthy of note.

> >  Could be this system is in an
> > intergenerational hole, and some spot in the PVH/HVM code makes an
> > assumption of the presence of NPT guarantees presence of an operational
> > IOMMU.  Otherwise if there was some copy and paste while writing IOMMU
> > code, some portion of the IOMMU code might be checking for presence of
> > NPT instead of presence of IOMMU.
> 
> This is all very speculative; I consider what you suspect not very likely,
> but also not entirely impossible. This is not the least because for a
> long time we've been running without shared page tables on AMD.
> 
> I'm afraid without technical data and without knowing how to repro, I
> don't see a way forward here.

I cannot report things which do not exist.  This occurs very quickly and
no warning or error messages have ever been observed on the main console
(VGA).

Happens during user domain kernel boot.  The configuration:
builder = "hvm"
name = "kr45h"
memory = 1024
maxmem = 16384
vcpus = 2
vif = [ '' ]
disk = [ 'vdev=sdc,format=raw,access=r,devtype=cdrom,target=/tmp/boot.iso', ]
sdl = 1

has been tested and confirmed to reproduce.  Looks like this was last
examined with a FreeBSD 12.2 AMD64 ISO, but Linux ISOs (un)happily work
too.  It is less than 40 seconds from `xl create` to indications of
hardware boot process starting.

Since there don't appear to be too many reports, the one factor which
now stands out is this machine has an AMD processor.  Xen confirms
presence of NPT support, but reports "I/O virtualisation disabled"
(older, less capable IOMMU).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



