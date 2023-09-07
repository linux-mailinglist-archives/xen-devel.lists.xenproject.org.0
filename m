Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B47797561
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 17:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597506.931747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeHEi-0003ry-CG; Thu, 07 Sep 2023 15:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597506.931747; Thu, 07 Sep 2023 15:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeHEi-0003pG-9N; Thu, 07 Sep 2023 15:48:04 +0000
Received: by outflank-mailman (input) for mailman id 597506;
 Thu, 07 Sep 2023 15:48:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lI39=EX=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qeHEh-0003nu-C0
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 15:48:03 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb67b2a5-4d95-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 17:48:00 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 387FljpI015003
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 7 Sep 2023 11:47:50 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 387FliFX015002;
 Thu, 7 Sep 2023 08:47:44 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: eb67b2a5-4d95-11ee-9b0d-b553b5be7939
Date: Thu, 7 Sep 2023 08:47:44 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Development <D@dlsemc.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xens handling of MCE
Message-ID: <ZPnwoITV24yMXxzH@mattapan.m5p.com>
References: <521ab5aef01a4c64bef65435e7c284bd@dlsemc.com>
 <ZPjxOTRipQ6sEqF5@mattapan.m5p.com>
 <d5c9ae9c-af78-05a7-52ca-7ae487c0d2bd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5c9ae9c-af78-05a7-52ca-7ae487c0d2bd@suse.com>
X-Spam-Status: No, score=2.4 required=10.0 tests=KHOP_HELO_FCRDNS,URI_DOTEDU
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Sep 07, 2023 at 08:56:51AM +0200, Jan Beulich wrote:
> On 06.09.2023 23:38, Elliott Mitchell wrote:
> > On Thu, Aug 31, 2023 at 07:52:05PM +0000, Development wrote:
> >>
> >>     However, in 2009-02, "cegger" wrote MCA/MCE_in_Xen, a proposal for having xen start checking the information
> >>     Xen started accessing the EDAC information (now called "MCE") at some point after that, which blocks the linux kernel in dom0 from accessing it.
> >>     (I also found what appears to be related sides from a presentation from 2012 at: https://lkml.iu.edu/hypermail/linux/kernel/1206.3/01304/xen_vMCE_design_%28v0_2%29.pdf )
> >>
> > 
> > I hadn't seen that before.  Clearly shows someone who had no idea what
> > they were doing designed it.  The author was thinking "virtualize 
> > everything!", whereas MCE is a perfect situation for paravirtualization.
> > Let Dom0 process MCE events (which allows use of Linux's more up to date
> > MCE drivers), then let Dom0 notify Xen if action is needed (a page was
> > corrupted, tell the effected domain).
> > 
> > There was a recent proposal to simply import Linux's rather more recent
> > MCE/EDAC source.  This hasn't happened yet.  For people using Xen this
> > has been a very concerning issue for some time.
> 
> I'm unaware of such a proposal; do you have a reference? EDAC drivers
> typically are vendor- or even chipset-specific aiui. At least the latter
> wouldn't make them a good fit to import into Xen. Along of what you say
> earlier, they instead want to become Xen-aware (to deal with address
> translation as necessary). That'll also have better chances of things
> staying up-to-date.

I don't recall who wrote the message, I think it was less than 6 months
ago though.  I read it as $person had been pondering the idea of simply
ripping out Xen's MCE implementation and replacing it with minimally
adjusted Linux MCE implementation.

What you describe matches my thinking.  Even though the EDAC hardware is
fully attached to processors now, it doesn't need virtualization similar
to page tables.  Instead EDAC should be handled similar to most hardware
devices and go through Domain 0.

The approach for Xen should also differ.  Instead of first telling the
OS, it might be better to immediately unmap the page and trigger a page
fault if it is accessed.  Then notify the OS a page has disappeared.
Mainly immitate how Linux handles MCE events for a userspace process,
rather than the usual paravirtualization.

I'm not on sufficiently intimate terms with the drivers or hardware to
try this right now.  Yet the number of complaints about this is rather
substantial (okay, I'm aware since this is no small concern for me too).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



