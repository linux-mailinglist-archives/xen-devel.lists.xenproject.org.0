Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80F83CD62
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 21:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671766.1045294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT6Hc-00084R-Js; Thu, 25 Jan 2024 20:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671766.1045294; Thu, 25 Jan 2024 20:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT6Hc-00082s-GQ; Thu, 25 Jan 2024 20:25:08 +0000
Received: by outflank-mailman (input) for mailman id 671766;
 Thu, 25 Jan 2024 20:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oGM9=JD=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rT6Ha-00082g-Pf
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 20:25:06 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1aede21-bbbf-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 21:25:04 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 40PKOr43077921
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 25 Jan 2024 15:24:59 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 40PKOrMA077920;
 Thu, 25 Jan 2024 12:24:53 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: d1aede21-bbbf-11ee-98f5-efadbce2ee36
Date: Thu, 25 Jan 2024 12:24:53 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Serious AMD-Vi issue
Message-ID: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

Apparently this was first noticed with 4.14, but more recently I've been
able to reproduce the issue:

https://bugs.debian.org/988477

The original observation features MD-RAID1 using a pair of Samsung
SATA-attached flash devices.  The main line shows up in `xl dmesg`:

(XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flags 0x8 I

Where the device points at the SATA controller.  I've ended up
reproducing this with some noticable differences.

A major goal of RAID is to have different devices fail at different
times.  Hence my initial run had a Samsung device plus a device from
another reputable flash manufacturer.

I initially noticed this due to messages in domain 0's dmesg about
errors from the SATA device.  Wasn't until rather later that I noticed
the IOMMU warnings in Xen's dmesg (perhaps post-domain 0 messages should
be duplicated into domain 0's dmesg?).

All of the failures consistently pointed at the Samsung device.  Due to
the expectation it would fail first (lower quality offering with
lesser guarantees), I proceeded to replace it with a NVMe device.

With some monitoring I discovered the NVMe device was now triggering
IOMMU errors, though not nearly as many as the Samsung SATA device did.
As such looks like AMD-Vi plus MD-RAID1 appears to be exposing some sort
of IOMMU issue with Xen.


All I can do is offer speculation about the underlying cause.  There
does seem to be a pattern of higher-performance flash storage devices
being more severely effected.

I was speculating about the issue being the MD-RAID1 driver abusing
Linux's DMA infrastructure in some fashion.

Upon further consideration, I'm wondering if this is perhaps a latency
issue.  I imagine there is some sort of flush after the IOMMU tables are
modified.  Perhaps the Samsung SATA (and all NVMe) devices were trying to
execute commands before reloading the IOMMU tables is complete.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



