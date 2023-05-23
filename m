Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5944E70E1F4
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538559.838647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V28-0000WN-2l; Tue, 23 May 2023 16:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538559.838647; Tue, 23 May 2023 16:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V27-0000QP-Qo; Tue, 23 May 2023 16:38:47 +0000
Received: by outflank-mailman (input) for mailman id 538559;
 Tue, 23 May 2023 16:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V26-0006Dr-AB
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47ad06e7-f988-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:38:44 +0200 (CEST)
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
X-Inumbo-ID: 47ad06e7-f988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/+AxULjDy0vT+JPl4g0BCJbfJV4FPatkg8JwDT25Ydw=;
  b=DYnhq5Jza+CZ0hGLVqwuGqwyIJqcaQqdXPWzO4G2bWRCbrnsYLfmJkNj
   NGqS2VDLcykKwD1vLVSbmbMU9Gjy6H14M40WGjat3yXTiMEdLj2Z5ZuQc
   X9/qTxWPUpSLq8Gq0q8g6DuhSFEtcZMqHBiJplSznMFNEMmUqcEWA4rPx
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112568330
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ln3pEaLH4atIe/nkFE+RHZUlxSXFcZb7ZxGr2PjKsXjdYENS3jIFx
 2MaX2nSa/7cMzT8c9wgaNuwpk5U6p6HnNYxQAVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5tWDkX7
 cYAdAkJbynbiM+kx7PgbPVF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJ8IwBbD/
 TquE2LRHj5CZNmhzRm/63eJr+nVkSn6BLITLejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAGUzpAZdoOpMIwAzsw2
 TehhMj1DDZitLmUT3O19bqOqz62fy8PIgcqeissXQYDpd75r+kbhRvVQtFuOKW8lNHyFHf7x
 DXikcQlr+xN14hRjfz9pA2ZxWv2/fAlUzLZ+C3NBzr89jlhOLehZrXw5nXJ6vcbCpqwGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMNGPxb4M4PFyhJEfUQD1
 XCzL66R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+dZbwvWMrtotfvYyOkwz
 zq4H5LQoyizrcWkOnWHmWLtBQtiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY4cl3het/0NzI/gp
 yjtMnK0PXKj3RUr3y3WMCE8AF4uNL4jxU8G0dsEZg7yiid8Odb+sM/ytfIfJNEayQCq9tYsJ
 9FtRilKKq4npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:uSD24KF/IQNWRkV4pLqEi8eALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppkmPHPP4gr5O0tApTn/Asa9qBrnnPZICOIqUYtKMjOJhFeV
X-Talos-CUID: 9a23:7Y4ldm2+MZ6lVhgh5kdFTrxfAJl9K2Xn1CvpJ06BUWlEWrqUEnmM0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3Ajk0GIw3Msg/vtmLxBl65XDvjKTUj/4v2WEUzlbY?=
 =?us-ascii?q?8osyhHCpqNz2c0AS2e9py?=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="112568330"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 09/15] build: hide commands run for kconfig
Date: Tue, 23 May 2023 17:38:05 +0100
Message-ID: <20230523163811.30792-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

but still show a log entry for syncconfig. We have to use kecho
instead of $(cmd,) to avoid issue with prompt from kconfig.

linux commits for reference:
    23cd88c91343 ("kbuild: hide commands to run Kconfig, and show short log for syncconfig")
    d952cfaf0cff ("kbuild: do not suppress Kconfig prompts for silent build")

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile               |  1 +
 xen/tools/kconfig/Makefile | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 4dc960df2c..127c0e40b5 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -382,6 +382,7 @@ $(KCONFIG_CONFIG): tools_fixdep
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
 include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
+	$(Q)$(kecho) "  SYNC    $@"
 	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
 
 ifeq ($(CONFIG_DEBUG),y)
diff --git a/xen/tools/kconfig/Makefile b/xen/tools/kconfig/Makefile
index b7b9a419ad..18c0f5d4f1 100644
--- a/xen/tools/kconfig/Makefile
+++ b/xen/tools/kconfig/Makefile
@@ -24,19 +24,19 @@ endif
 unexport CONFIG_
 
 xconfig: $(obj)/qconf
-	$< $(silent) $(Kconfig)
+	$(Q)$< $(silent) $(Kconfig)
 
 gconfig: $(obj)/gconf
-	$< $(silent) $(Kconfig)
+	$(Q)$< $(silent) $(Kconfig)
 
 menuconfig: $(obj)/mconf
-	$< $(silent) $(Kconfig)
+	$(Q)$< $(silent) $(Kconfig)
 
 config: $(obj)/conf
-	$< $(silent) --oldaskconfig $(Kconfig)
+	$(Q)$< $(silent) --oldaskconfig $(Kconfig)
 
 nconfig: $(obj)/nconf
-	$< $(silent) $(Kconfig)
+	$(Q)$< $(silent) $(Kconfig)
 
 build_menuconfig: $(obj)/mconf
 
@@ -70,12 +70,12 @@ simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
 PHONY += $(simple-targets)
 
 $(simple-targets): $(obj)/conf
-	$< $(silent) --$@ $(Kconfig)
+	$(Q)$< $(silent) --$@ $(Kconfig)
 
 PHONY += savedefconfig defconfig
 
 savedefconfig: $(obj)/conf
-	$< $(silent) --$@=defconfig $(Kconfig)
+	$(Q)$< $(silent) --$@=defconfig $(Kconfig)
 
 defconfig: $(obj)/conf
 ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
-- 
Anthony PERARD


