Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA413F5C68
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170913.311979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1f-0004pI-Ls; Tue, 24 Aug 2021 10:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170913.311979; Tue, 24 Aug 2021 10:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1f-0004m5-Fu; Tue, 24 Aug 2021 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 170913;
 Tue, 24 Aug 2021 10:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1d-0001EC-8p
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddfb5660-2b70-4538-b3e4-29642c14e627;
 Tue, 24 Aug 2021 10:51:02 +0000 (UTC)
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
X-Inumbo-ID: ddfb5660-2b70-4538-b3e4-29642c14e627
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VYSylFgL3OrKmloanpbNZC7EqqdXJeoQnSFUl8Se9ag=;
  b=A5y0TZ2T9G8hGP4o4DlCV9idx0P/naEZtsVVgEHPbs1PGhYTHi0lbC8x
   +ryRBlB3vDZFennQC3jbGBddbo0ST6ner6xHe90wWVGKI5zpjPl7BFuvh
   VORP9oFpRDVSk303fbdspGChPiLBGeQUmuGhSdCQMAE1FIlscY8Pyb1Y+
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ndfau1ELZ/b//XxcvHRBqBwrrlEUcpQF1l+UJe5JQuF8WArUHl7/GO50A/5WWZiilPWmQnLc8u
 jfkxdy/+hd2pxrdoYV2+/Wn8lGZY3M9N8s9yhCgsVkLURO7BuTAPAUWsXgXR9S+3xESitOsQM1
 pThWyBGW4SimBQ9wKmDPYFRZOq/YCk4J2qAbQ6yLxAMydDDNuo/sI3DRjSc9bFxRh3zbai/Pom
 hOgYxHjaswJSLy/8aEEXNMV82kC35ZISesARRi2QuXnqA8QTb8XJ7l0/zwT+5PfJp7rXvQ2Jnn
 8mWX1fXxxcdQNnE3Y24Mi6Sh
X-SBRS: 5.1
X-MesageID: 51166340
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6xLTBaGXYTMjgWa6pLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51166340"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 08/51] build: fix clean targets when subdir-y is used
Date: Tue, 24 Aug 2021 11:49:55 +0100
Message-ID: <20210824105038.1257926-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The make variable $(subdir-y) isn't used yet but will be in a
following patch. Anything in $(subdir-y) doesn't to have a '/' as
suffix as we already now it's a directory.

Rework the rules so that it doesn't matter whether there is a '/' or
not. It also mimic more closely to the way Linux's Kbuild descend in
subdirectories.

FORCE phony target isn't needed anymore running clean, so it can be
removed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/scripts/Makefile.clean | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index 53379e6102cc..027c200c0efc 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -12,19 +12,18 @@ include Makefile
 # Figure out what we need to clean from the various variables
 # ==========================================================================
 subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
-              $(filter %/, $(obj-y) $(obj-n) $(obj-))
+              $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
 
 DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
 .PHONY: clean
-clean:: $(addprefix _clean_, $(subdir-all))
+clean:: $(subdir-all)
 	rm -f *.o .*.o.tmp *~ core $(DEPS_RM)
 
 # Descending
 # ---------------------------------------------------------------------------
 
-_clean_%/: FORCE
-	$(MAKE) $(clean) $*
+PHONY += $(subdir-all)
+$(subdir-all):
+	$(MAKE) $(clean) $@
 
-# Force execution of pattern rules (for which PHONY cannot be directly used).
-.PHONY: FORCE
-FORCE:
+.PHONY: $(PHONY)
-- 
Anthony PERARD


