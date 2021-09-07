Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CEE402B4B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 17:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181162.328203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNcdZ-0007AZ-E5; Tue, 07 Sep 2021 15:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181162.328203; Tue, 07 Sep 2021 15:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNcdZ-00077j-96; Tue, 07 Sep 2021 15:03:49 +0000
Received: by outflank-mailman (input) for mailman id 181162;
 Tue, 07 Sep 2021 15:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zymF=N5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mNcdX-00077d-VY
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 15:03:48 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31753929-94cc-4732-8916-55f8d079c637;
 Tue, 07 Sep 2021 15:03:46 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 187F3a2o070616
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 7 Sep 2021 11:03:42 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 187F3asv070615;
 Tue, 7 Sep 2021 08:03:36 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 31753929-94cc-4732-8916-55f8d079c637
Date: Tue, 7 Sep 2021 08:03:36 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HVM/PVH Balloon crash
Message-ID: <YTd/SFtvuzejeiik@mattapan.m5p.com>
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Tue, Sep 07, 2021 at 10:03:51AM +0200, Jan Beulich wrote:
> On 06.09.2021 22:47, Elliott Mitchell wrote:
> > On Mon, Sep 06, 2021 at 09:52:17AM +0200, Jan Beulich wrote:
> >> On 06.09.2021 00:10, Elliott Mitchell wrote:
> >>> I brought this up a while back, but it still appears to be present and
> >>> the latest observations appear rather serious.
> >>>
> >>> I'm unsure of the entire set of conditions for reproduction.
> >>>
> >>> Domain 0 on this machine is PV (I think the BIOS enables the IOMMU, but
> >>> this is an older AMD IOMMU).
> >>>
> >>> This has been confirmed with Xen 4.11 and Xen 4.14.  This includes
> >>> Debian's patches, but those are mostly backports or environment
> >>> adjustments.
> >>>
> >>> Domain 0 is presently using a 4.19 kernel.
> >>>
> >>> The trigger is creating a HVM or PVH domain where memory does not equal
> >>> maxmem.
> >>
> >> I take it you refer to "[PATCH] x86/pod: Do not fragment PoD memory
> >> allocations" submitted very early this year? There you said the issue
> >> was with a guest's maxmem exceeding host memory size. Here you seem to
> >> be talking of PoD in its normal form of use. Personally I uses this
> >> all the time (unless enabling PCI pass-through for a guest, for being
> >> incompatible). I've not observed any badness as severe as you've
> >> described.
> > 
> > I've got very little idea what is occurring as I'm expecting to be doing
> > ARM debugging, not x86 debugging.
> > 
> > I was starting to wonder whether this was widespread or not.  As such I
> > was reporting the factors which might be different in my environment.
> > 
> > The one which sticks out is the computer has an older AMD processor (you
> > a 100% Intel shop?).
> 
> No, AMD is as relevant to us as is Intel.
> 
> >  The processor has the AMD NPT feature, but a very
> > early/limited IOMMU (according to Linux "AMD IOMMUv2 functionality not
> > available").
> > 
> > Xen 4.14 refused to load the Domain 0 kernel as PVH (not enough of an
> > IOMMU).
> 
> That sounds odd at the first glance - PVH simply requires that there be
> an (enabled) IOMMU. Hence the only thing I could imagine is that Xen
> doesn't enable the IOMMU in the first place for some reason.

Doesn't seem that odd to me.  I don't know the differences between the
first and second versions of the AMD IOMMU, but could well be v1 was
judged not to have enough functionality to bother with.

What this does make me wonder is, how much testing was done on systems
with functioning NPT, but disabled IOMMU?  Could be this system is in an
intergenerational hole, and some spot in the PVH/HVM code makes an
assumption of the presence of NPT guarantees presence of an operational
IOMMU.  Otherwise if there was some copy and paste while writing IOMMU
code, some portion of the IOMMU code might be checking for presence of
NPT instead of presence of IOMMU.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



