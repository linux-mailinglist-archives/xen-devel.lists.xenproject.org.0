Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07B170E1EF
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538552.838572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1q-0006Ll-Eb; Tue, 23 May 2023 16:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538552.838572; Tue, 23 May 2023 16:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1q-0006Fz-AG; Tue, 23 May 2023 16:38:30 +0000
Received: by outflank-mailman (input) for mailman id 538552;
 Tue, 23 May 2023 16:38:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V1o-0006Dr-2J
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c14679e-f988-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:38:25 +0200 (CEST)
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
X-Inumbo-ID: 3c14679e-f988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ufpNHiN8OYSwXkEse8X/FKw/mqXv9HClfgFsxNyVIRY=;
  b=equVlQO6SOBlBialkLEL+65Z23Fhq6nlIMoGvfhVkOCK5kQBu4j1iAF/
   NPUi12Ath/hbK/1vZMUhz5x47SthJavkLBoq771rzwZFD7t1r9LBTBEaZ
   mhy67+j2H+4oBwGQznj20EsTaMedoEfEt9ikNVuPZ2sKnxHMXPwsgLvWg
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110501175
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tcMeqanrWvY+NtgZ0nDXRGTo5gy7JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYCGjXMv2MZTHxLdtwOYu//UNSuMSHz9QyTwNr+y4wQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgW5gSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dMVJzcDPg+Dvs2ZxpeXW8Y1oNQ4Eca+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/B/
 j+epj2mX3n2MvS5xj2HyC6Bq9bRgCHKdJ0TH+O7tft11Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspQN47sM47QxQ62
 1nPmMnmbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJSMa5/HzrYd1iQjAJuuPC4bs0IezQ2uph
 WnX8m5n3e57YdM3O7uT0l3IhDz8uZjwYSEzwynGcTuD/hhEa9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yT7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfqqMBjatSsIrHONiwM2JTRD44owVuBJw+ZzTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1lnxhlTuPHsGil0jPPV+iiJm9EO1tDbdzRrphsPPsTPv9q
 L6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOK0aX/d/L7bZSiI/QTFJNhMk6e95E6R/gb9vn/vFl
 lnkHBcwJKzX2SeWdm1nqxlLNNvSYHqIhSljZ31zYg74iiRLjETGxP53SqbbtIIPrIRLpcOYh
 dFcEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:QBWQ86BMY0QaU/nlHenP55DYdb4zR+YMi2TDtnoQdfUxSKelfq
 +V8cjzuSWftN9zYhAdcK67V5VoKEm0naKdirN8AV7NZmfbhFc=
X-Talos-CUID: 9a23:ii66Rm2k+/7t96EQWhLX37xfNc0qdXON03fpDGC+LEp4Z+SzWUSt9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3A2WhmcQ/33Dqs4r4wFMr/YOeQf+Fn5KaUVG0gqIs?=
 =?us-ascii?q?bufioKi17ZTTeiSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="110501175"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 02/15] build: rework asm-offsets.* build step to use kbuild
Date: Tue, 23 May 2023 17:37:58 +0100
Message-ID: <20230523163811.30792-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use $(if_changed_dep, ) macro to generate "asm-offsets.s" and remove
the use of $(move-if-changes,). That mean that "asm-offset.s" will be
changed even when the output doesn't change.

But "asm-offsets.s" is only used to generated "asm-offsets.h". So
instead of regenerating "asm-offsets.h" every time "asm-offsets.s"
change, we will use "$(filechk, )" to only update the ".h" when the
output change. Also, with "$(filechk, )", the file does get
regenerated when the rule change in the makefile.

This changes also result in a cleaner build log.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Instead of having a special $(cmd_asm-offsets.s) command, we could
probably reuse $(cmd_cc_s_c) from Rules.mk, but that would mean that
an hypothetical additional flags "-flto" in CFLAGS would not be
removed anymore, not sure if that matter here.

But then we could write this:

targets += arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s
arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s: CFLAGS-y += -g0
arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s FORCE

instead of having to write a rule for asm-offsets.s
---
 xen/build.mk | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/build.mk b/xen/build.mk
index 758590c68e..e2a78aa806 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -40,13 +40,15 @@ include/xen/compile.h: include/xen/compile.h.in .banner FORCE
 
 targets += include/xen/compile.h
 
--include $(wildcard .asm-offsets.s.d)
-asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
-	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
-	$(call move-if-changed,$@.new,$@)
+quiet_cmd_asm-offsets.s = CC      $@
+cmd_asm-offsets.s = $(CC) $(call cpp_flags,$(c_flags)) -S -g0 $< -o $@
 
-arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
-	@(set -e; \
+asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c FORCE
+	$(call if_changed_dep,asm-offsets.s)
+
+targets += asm-offsets.s
+
+define filechk_asm-offsets.h
 	  echo "/*"; \
 	  echo " * DO NOT MODIFY."; \
 	  echo " *"; \
@@ -57,9 +59,13 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
 	  echo "#ifndef __ASM_OFFSETS_H__"; \
 	  echo "#define __ASM_OFFSETS_H__"; \
 	  echo ""; \
-	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
+	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}" $<; \
 	  echo ""; \
-	  echo "#endif") <$< >$@
+	  echo "#endif"
+endef
+
+arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s FORCE
+	$(call filechk,asm-offsets.h)
 
 build-dirs := $(patsubst %/built_in.o,%,$(filter %/built_in.o,$(ALL_OBJS) $(ALL_LIBS)))
 
-- 
Anthony PERARD


