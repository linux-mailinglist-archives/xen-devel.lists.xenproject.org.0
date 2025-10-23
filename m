Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA7C0025E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148835.1480680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMr-0003oh-QR; Thu, 23 Oct 2025 09:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148835.1480680; Thu, 23 Oct 2025 09:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMr-0003lb-N1; Thu, 23 Oct 2025 09:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1148835;
 Thu, 23 Oct 2025 09:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvni=5A=bounce.vates.tech=bounce-md_30504962.68f9f171.v1-b988a4c6efea49f589ce491a220c8f88@srs-se1.protection.inumbo.net>)
 id 1vBrMq-0003Xf-2j
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:12:20 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f96bea7-aff0-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 11:12:18 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4csgKF26CBzDRJG7p
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 09:12:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b988a4c6efea49f589ce491a220c8f88; Thu, 23 Oct 2025 09:12:17 +0000
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
X-Inumbo-ID: 5f96bea7-aff0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761210737; x=1761480737;
	bh=uphiyDgxiUqnnF1yei7nNrbThGF81zpHRyjV+sbeQH0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QnSxTE3OKLeQDJbkzIV7kdgNdgXZg54/VynYOdUFWCuHEUT2KqvD1kug2IvBpPh/t
	 VXReO9Pqn1sao8S+ueo9Sp5CDfzqppk4lbE6/8Lc7lZ7A+SD83BUCZaI5bAHln8hO5
	 SriND52KSTs8QXudeI/DeUvecfqeA/Rvv4XuEMZTbZGCvQFCaFwB5ZnLuxImV39m86
	 eLSlKErCI7Pm6qKQe9wA4li2p1TXA6bHhIyKxii5azknQ5SH8xoAc2Y+jfFG9aJ44k
	 2V6fN//hxvcBJWJxfDkPyUF5+9Hgqf3qEImwPlXnCvqmBl1fGv+0hl7krE+yI8Wgrd
	 uWrI5Sou13xeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761210737; x=1761471237; i=teddy.astie@vates.tech;
	bh=uphiyDgxiUqnnF1yei7nNrbThGF81zpHRyjV+sbeQH0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cpNgC0oSI+AP8aIrLNViiUoXeCT09aeoGpowyV+lQo0pbmBzLQVQcgFMtKqqW11ho
	 1IpYDwc3td+YN/GOGCl03OHd1tC6T1mvtnRc2f7uitFoXQtAXh7YqWxa3dJkxEMSLj
	 2RP1AHxMQ3iir0EDC2V2peAI/CFHwdgw6tryf5sv0kAUBfLHOxG9JqPEWBZC4Rt77j
	 5sPDjgg1AXW83HXesizhT2ij2l1Oo4vOL3CG99aA50CJ0LDUdoyxNMIpBUHXZOSOma
	 vhcWeAIMq0fO7eoz9FXTmxC4ltnjYhyp6tA9bphameei2kaHK6T1tqywluD1i5D4dF
	 vqgjocnUrFE3w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=202/5]=20vtd:=20Drop=20"iommu=5Finclusive=5Fmapping"=20command-line=20option?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761210736644
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>
Message-Id: <d12854b783c603aec99bbb9209b3b4be1769e5bd.1761209564.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761209564.git.teddy.astie@vates.tech>
References: <cover.1761209564.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b988a4c6efea49f589ce491a220c8f88?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251023:md
Date: Thu, 23 Oct 2025 09:12:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This command-line option is deprecated and super-seeded with
dom0-iommu=map-inclusive. Drop this command-line parameter and
delete vtd/x86/vtd.c which is now empty.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - new

 CHANGELOG.md                             |  2 ++
 docs/misc/xen-command-line.pandoc        |  6 ----
 xen/drivers/passthrough/vtd/x86/Makefile |  3 +-
 xen/drivers/passthrough/vtd/x86/vtd.c    | 38 ------------------------
 4 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/vtd.c

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 0cf9ad2d95..d4a22b8f8b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -50,6 +50,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
      broken.
+   - Intel-specific iommu_inclusive_mapping=<boolean> option: super-seeded
+     by dom0-iommu=map-inclusive since Xen 4.16.
 
  - Support of qemu-traditional has been removed.
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 28a98321c7..0af71e289a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1691,12 +1691,6 @@ Specify the timeout of the device IOTLB invalidation in milliseconds.
 By default, the timeout is 1000 ms. When you see error 'Queue invalidate
 wait descriptor timed out', try increasing this value.
 
-### iommu_inclusive_mapping
-> `= <boolean>`
-
-**WARNING: This command line option is deprecated, and superseded by
-_dom0-iommu=map-inclusive_ - using both options in combination is undefined.**
-
 ### irq-max-guests (x86)
 > `= <integer>`
 
diff --git a/xen/drivers/passthrough/vtd/x86/Makefile b/xen/drivers/passthrough/vtd/x86/Makefile
index fe20a0b019..82b3904a91 100644
--- a/xen/drivers/passthrough/vtd/x86/Makefile
+++ b/xen/drivers/passthrough/vtd/x86/Makefile
@@ -1,2 +1 @@
-obj-y += ats.o
-obj-y += vtd.o
+obj-y += ats.o
\ No newline at end of file
diff --git a/xen/drivers/passthrough/vtd/x86/vtd.c b/xen/drivers/passthrough/vtd/x86/vtd.c
deleted file mode 100644
index b0798dc6a1..0000000000
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * Copyright (c) 2008, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
- * Copyright (C) Allen Kay <allen.m.kay@intel.com>
- * Copyright (C) Weidong Han <weidong.han@intel.com>
- */
-
-#include <xen/param.h>
-#include <xen/sched.h>
-#include <xen/softirq.h>
-#include <xen/domain_page.h>
-#include <asm/paging.h>
-#include <xen/iommu.h>
-#include <xen/irq.h>
-#include <xen/numa.h>
-#include <asm/fixmap.h>
-#include "../iommu.h"
-#include "../dmar.h"
-#include "../vtd.h"
-#include "../extern.h"
-
-/*
- * iommu_inclusive_mapping: when set, all memory below 4GB is included in dom0
- * 1:1 iommu mappings except xen and unusable regions.
- */
-boolean_param("iommu_inclusive_mapping", iommu_hwdom_inclusive);
-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


