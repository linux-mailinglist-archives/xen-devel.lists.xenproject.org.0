Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEF2F886C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68659.122952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbL-00063q-GZ; Fri, 15 Jan 2021 22:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68659.122952; Fri, 15 Jan 2021 22:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbL-000636-Ci; Fri, 15 Jan 2021 22:29:51 +0000
Received: by outflank-mailman (input) for mailman id 68659;
 Fri, 15 Jan 2021 22:29:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XbJ-00062b-RB
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:29:49 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcbc4171-777d-4f1f-899b-05b569a5d2ce;
 Fri, 15 Jan 2021 22:29:48 +0000 (UTC)
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
X-Inumbo-ID: fcbc4171-777d-4f1f-899b-05b569a5d2ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610749788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7FtxhcFGXeixISaf1MY+GwKw/DMXVUnwabrQqvgoO5Q=;
  b=JWykYM3BmBX5IBiuz56DqPvpLrKLT+EzNXwo46XlMeX0j5gRjs7hGWD5
   7u0YWVK+TILlIx0w8/VQ/u/p5ej8cZe0Bys65kIIB11D+JEWypWmjTOCE
   eT6tuFi3gusno1Re0h/Rn7FJtFzfPiyeP1lEcCKSIsB2AKqf2FJL+w6Sk
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6PkBYPMIMklNQNl7Ds1iT2gy7F+DBMRbPnrr4njv5lnHg56aoXgovURdpyVmdROMbTHKoVUHzb
 RKzFV9/teGPcCKMwRaUig7/jO8HBGhleNCc77DTfpZ13oex8t2Aot2YH0f9xut16Ft4qG5l8V0
 3KBXcHKUkVryQoF2LjYIpuMObqa9hl0wBuH34RNh/xv/utNKLIIwlUoWhgQavVIWlfkP3/Fz1D
 j0UwlTIe1F8dhytXFt6Vq87PJbqrQeEcXO4yxWJN3FWT1jeXSHjO7kCOlMMKltH/hVnap4doXZ
 xT0=
X-SBRS: 5.1
X-MesageID: 35216600
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35216600"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [PATCH v2 2/2] Makefile: add build-tools-oxenstored
Date: Fri, 15 Jan 2021 22:28:41 +0000
Message-ID: <5805ac238f841a18e86e5a396ce7446f4914cf04.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As a convenience so that oxenstored patches can be compile-tested
using upstream's build-system before submitting upstream.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changed since V1:
* repost after XSA to avoid conflicts
---
 Makefile             | 6 ++++++
 tools/ocaml/Makefile | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/Makefile b/Makefile
index 9ad2602f63..96d32cfd50 100644
--- a/Makefile
+++ b/Makefile
@@ -62,6 +62,12 @@ build-xen:
 build-tools: build-tools-public-headers
 	$(MAKE) -C tools build
 
+.PHONY: build-tools-oxenstored
+build-tools-oxenstored: build-tools-public-headers
+	$(MAKE) -s -C tools/ocaml clean
+	$(MAKE) -s -C tools/libs
+	$(MAKE) -C tools/ocaml build-tools-oxenstored
+
 .PHONY: build-stubdom
 build-stubdom: mini-os-dir build-tools-public-headers
 	$(MAKE) -C stubdom build
diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
index 66f2d6b131..a7c04b6546 100644
--- a/tools/ocaml/Makefile
+++ b/tools/ocaml/Makefile
@@ -26,3 +26,11 @@ clean: subdirs-clean
 
 .PHONY: distclean
 distclean: subdirs-distclean
+
+.PHONY: build-tools-oxenstored
+build-tools-oxenstored:
+	$(MAKE) -s -C libs/eventchn
+	$(MAKE) -s -C libs/mmap
+	$(MAKE) -s -C libs/xb
+	$(MAKE) -s -C libs/xc
+	$(MAKE) -C xenstored
-- 
2.29.2


