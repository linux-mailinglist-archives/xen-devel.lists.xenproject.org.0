Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8B04011D5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 00:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179195.325400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN0LT-0004wq-1L; Sun, 05 Sep 2021 22:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179195.325400; Sun, 05 Sep 2021 22:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN0LS-0004uC-Tq; Sun, 05 Sep 2021 22:10:34 +0000
Received: by outflank-mailman (input) for mailman id 179195;
 Sun, 05 Sep 2021 22:10:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vhsZ=N3=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mN0LR-0004u6-Bi
 for xen-devel@lists.xenproject.org; Sun, 05 Sep 2021 22:10:33 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 162f4d44-0e96-11ec-b06d-12813bfff9fa;
 Sun, 05 Sep 2021 22:10:32 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 185MANtd061312
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Sun, 5 Sep 2021 18:10:29 -0400 (EDT)
 (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 185MANaZ061311
 for xen-devel@lists.xenproject.org; Sun, 5 Sep 2021 15:10:23 -0700 (PDT)
 (envelope-from ehem)
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
X-Inumbo-ID: 162f4d44-0e96-11ec-b06d-12813bfff9fa
Date: Sun, 5 Sep 2021 15:10:23 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Subject: HVM/PVH Ballon crash
Message-ID: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

I brought this up a while back, but it still appears to be present and
the latest observations appear rather serious.

I'm unsure of the entire set of conditions for reproduction.

Domain 0 on this machine is PV (I think the BIOS enables the IOMMU, but
this is an older AMD IOMMU).

This has been confirmed with Xen 4.11 and Xen 4.14.  This includes
Debian's patches, but those are mostly backports or environment
adjustments.

Domain 0 is presently using a 4.19 kernel.

The trigger is creating a HVM or PVH domain where memory does not equal
maxmem.


New observations:

I discovered this occurs with PVH domains in addition to HVM ones.

I got PVH GRUB operational.  PVH GRUB appeared at to operate normally
and not trigger the crash/panic.

The crash/panic occurred some number of seconds after the Linux kernel
was loaded.


Mitigation by not using ballooning with HVM/PVH is workable, but this is
quite a large mine in the configuration.

I'm wondering if perhaps it is actually the Linux kernel in Domain 0
which is panicing.

The crash/panic occurring AFTER the main kernel loads suggests some
action by the user domain is doing is the actual trigger of the
crash/panic.


That last point is actually rather worrisome.  There might be a security
hole lurking here.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



