Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DFB732E2C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 12:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550084.858976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA6i9-0004Oo-BB; Fri, 16 Jun 2023 10:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550084.858976; Fri, 16 Jun 2023 10:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA6i9-0004NA-8O; Fri, 16 Jun 2023 10:29:45 +0000
Received: by outflank-mailman (input) for mailman id 550084;
 Fri, 16 Jun 2023 10:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH7x=CE=citrix.com=prvs=524e3cb9a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qA6i7-0004N4-Aa
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 10:29:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3120b49-0c30-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 12:29:41 +0200 (CEST)
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
X-Inumbo-ID: b3120b49-0c30-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686911381;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+VmkU5tvzVeHOy2hjZpX01rGc7gzXP7d+I90b9zWBac=;
  b=BQ2UkNsKYu6ifvLcSqbUv4Vcjd0KLNb4hEbYhnc5JMqP2LBoWSkp1xct
   mIs+TEbdE5917eX0VQKLo2xvP3SDY4PzgJVvvHHUk1SxIlLPnb58qiW1s
   y3yOtqDnkVbcgg3n+pSpqsNDwHq80OmCLYgSLkGwO2m7DaT3kfLwEfWer
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113069243
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+Iv53KyHQgZw0dJhgaB6t+cfxirEfRIJ4+MujC+fZmUNrF6WrkUHx
 jAfWjqGPKuPZWqkedEnaY2/pxwEuJSEzYRqGVNpriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPK4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWtey
 fhJBjUjVS3Zlr6v/JLkeMlA3dt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMxR7G9
 ziapAwVBDlCc4Gf2SSGzknr2MHWogjpXqg0PbyBo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZjxcbN0rsucmSDps0
 UWG9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDQcbSSMV7t+lp5s85i8jVf46TvTz1IesX2itn
 XbT9nNWa6gvYdAj3bWH+QHphhyXm8LYEhcJxlrlfk7+8VYsDGK6XLBE+WQ3/N4ZctbHHgTZ5
 CVc8ySNxLtQVM/QzURhVM1IRej0vKjdbVUwlHY1R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6Oxwl8AM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FIZj8UCxGU/s5nWfeqwIhPVkDnHhWKYT7H8qT8vha+eDGOC79pUktbjNikdzVHIvb+V6Io
 r6zxuOByglFUf2WX8Uk2dd7ELz+FlBiXcqeg5UOJoa+zv9ORDlJ5wn5nelwJOSIXs19yo/1w
 51KchYHlwWh3ieccF3ih7IKQOqHYKuTZEkTZUQEVWtEEVB6CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:ZTgx6arb1LQIKGzqJUxuCnEaV5omeYIsimQD101hICG9E/b5qy
 nKpp9w6faaskd1ZJheo6HlBEDtex7hHOdOkOss1O6ZLWrbUQiTTb2Kj7GM/9SIIUSXygc378
 ldmsZFZOEYBGIK6vrH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3AhsID8GoorhFcsaGKRU84PcbmUco1TnmM4nL+GHL?=
 =?us-ascii?q?iGDpwdJ3Ke3+8o7wxxg=3D=3D?=
X-Talos-MUID: 9a23:a6OEwAZnJ0LHV+BT73ixhCF8N/tTpPqAEX8mg5MsneCFDHkl
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="113069243"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] Config.mk: update OVMF to edk2-stable202305
Date: Fri, 16 Jun 2023 11:29:08 +0100
Message-ID: <20230616102908.59109-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update to OVMF's latest stable tag.

This is been prompt by trying to build Xen on Debian Bookworm,
where edk2-stable202108 doesn't build. Also, it's been too long since
the last update.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

I've tested it in osstest, so the update should be fine:
http://logs.test-lab.xenproject.org/osstest/logs/181458/
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index d12d4c2b8f..c529b1ba19 100644
--- a/Config.mk
+++ b/Config.mk
@@ -216,7 +216,7 @@ QEMU_TRADITIONAL_REVISION ?= $(QEMU_TAG)
 endif
 
 OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
-OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
+OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
 QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
 QEMU_UPSTREAM_REVISION ?= master
-- 
Anthony PERARD


