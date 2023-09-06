Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B85794535
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 23:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596882.930972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe0E8-0005tu-0s; Wed, 06 Sep 2023 21:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596882.930972; Wed, 06 Sep 2023 21:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe0E7-0005sE-U7; Wed, 06 Sep 2023 21:38:19 +0000
Received: by outflank-mailman (input) for mailman id 596882;
 Wed, 06 Sep 2023 21:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TIJF=EW=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qe0E6-0005s8-Gk
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 21:38:18 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af7c2668-4cfd-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 23:38:16 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 386Lc3YN011085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 6 Sep 2023 17:38:08 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 386Lc1v5011084;
 Wed, 6 Sep 2023 14:38:01 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: af7c2668-4cfd-11ee-8783-cb3800f73035
Date: Wed, 6 Sep 2023 14:38:01 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Development <D@dlsemc.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xens handling of MCE
Message-ID: <ZPjxOTRipQ6sEqF5@mattapan.m5p.com>
References: <521ab5aef01a4c64bef65435e7c284bd@dlsemc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <521ab5aef01a4c64bef65435e7c284bd@dlsemc.com>
X-Spam-Status: No, score=2.4 required=10.0 tests=KHOP_HELO_FCRDNS,URI_DOTEDU
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Aug 31, 2023 at 07:52:05PM +0000, Development wrote:
> 
>     However, in 2009-02, "cegger" wrote MCA/MCE_in_Xen, a proposal for having xen start checking the information
>     Xen started accessing the EDAC information (now called "MCE") at some point after that, which blocks the linux kernel in dom0 from accessing it.
>     (I also found what appears to be related sides from a presentation from 2012 at: https://lkml.iu.edu/hypermail/linux/kernel/1206.3/01304/xen_vMCE_design_%28v0_2%29.pdf )
> 

I hadn't seen that before.  Clearly shows someone who had no idea what
they were doing designed it.  The author was thinking "virtualize 
everything!", whereas MCE is a perfect situation for paravirtualization.
Let Dom0 process MCE events (which allows use of Linux's more up to date
MCE drivers), then let Dom0 notify Xen if action is needed (a page was
corrupted, tell the effected domain).

There was a recent proposal to simply import Linux's rather more recent
MCE/EDAC source.  This hasn't happened yet.  For people using Xen this
has been a very concerning issue for some time.

This seems a combination of not enough people using Xen not yet having
gotten quite noisy enough (I think the threshold is being approached),
plus the people with the right development skills being out of touch.

Commit 767f4b620edadac579c9b8b6660761d4285fa6f9 to the Linux kernel yet
again shows someone *REALLY* out of touch!


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



