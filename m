Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6E2810AE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1865.5650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIWR-0006Of-UM; Fri, 02 Oct 2020 10:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1865.5650; Fri, 02 Oct 2020 10:42:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIWR-0006OG-RL; Fri, 02 Oct 2020 10:42:43 +0000
Received: by outflank-mailman (input) for mailman id 1865;
 Fri, 02 Oct 2020 10:42:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOIWQ-0006OB-76
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:42:42 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7c2da763-13a7-4efd-bd07-f7bf653027ec;
 Fri, 02 Oct 2020 10:42:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABA9231B;
 Fri,  2 Oct 2020 03:42:40 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 351803F73B;
 Fri,  2 Oct 2020 03:42:39 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOIWQ-0006OB-76
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:42:42 +0000
X-Inumbo-ID: 7c2da763-13a7-4efd-bd07-f7bf653027ec
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 7c2da763-13a7-4efd-bd07-f7bf653027ec;
	Fri, 02 Oct 2020 10:42:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABA9231B;
	Fri,  2 Oct 2020 03:42:40 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 351803F73B;
	Fri,  2 Oct 2020 03:42:39 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH] build: always use BASEDIR for xen sub-directory
Date: Fri,  2 Oct 2020 11:42:09 +0100
Message-Id: <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.

This is removing the dependency to xen subdirectory preventing using a
wrong configuration file when xen subdirectory is duplicated for
compilation tests.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/common/Makefile                | 6 +++---
 xen/include/xen/lib/x86/Makefile   | 4 ++--
 xen/tools/kconfig/Makefile.kconfig | 2 +-
 xen/xsm/flask/Makefile             | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index b3b60a1ba2..083f62acb6 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -78,14 +78,14 @@ obj-$(CONFIG_UBSAN) += ubsan/
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
 
-CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(XEN_ROOT)/xen/)$(KCONFIG_CONFIG)
+CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(BASEDIR)/)$(KCONFIG_CONFIG)
 config.gz: $(CONF_FILE)
 	gzip -c $< >$@
 
 config_data.o: config.gz
 
-config_data.S: $(XEN_ROOT)/xen/tools/binfile
-	$(SHELL) $(XEN_ROOT)/xen/tools/binfile $@ config.gz xen_config_data
+config_data.S: $(BASEDIR)/tools/binfile
+	$(SHELL) $(BASEDIR)/tools/binfile $@ config.gz xen_config_data
 
 clean::
 	rm -f config_data.S config.gz 2>/dev/null
diff --git a/xen/include/xen/lib/x86/Makefile b/xen/include/xen/lib/x86/Makefile
index 408d69c99e..f1229b9bc8 100644
--- a/xen/include/xen/lib/x86/Makefile
+++ b/xen/include/xen/lib/x86/Makefile
@@ -3,6 +3,6 @@ include $(XEN_ROOT)/Config.mk
 .PHONY: all
 all: cpuid-autogen.h
 
-cpuid-autogen.h: $(XEN_ROOT)/xen/include/public/arch-x86/cpufeatureset.h $(XEN_ROOT)/xen/tools/gen-cpuid.py
-	$(PYTHON) $(XEN_ROOT)/xen/tools/gen-cpuid.py -i $< -o $@.new
+cpuid-autogen.h: $(BASEDIR)/include/public/arch-x86/cpufeatureset.h $(BASEDIR)/tools/gen-cpuid.py
+	$(PYTHON) $(BASEDIR)/tools/gen-cpuid.py -i $< -o $@.new
 	$(call move-if-changed,$@.new,$@)
diff --git a/xen/tools/kconfig/Makefile.kconfig b/xen/tools/kconfig/Makefile.kconfig
index 065f4b8471..799321ec4d 100644
--- a/xen/tools/kconfig/Makefile.kconfig
+++ b/xen/tools/kconfig/Makefile.kconfig
@@ -9,7 +9,7 @@ Q :=
 kecho := :
 
 # eventually you'll want to do out of tree builds
-srctree := $(XEN_ROOT)/xen
+srctree := $(BASEDIR)
 objtree := $(srctree)
 src := tools/kconfig
 obj := $(src)
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 50bec20a1e..637159ad82 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -35,8 +35,8 @@ $(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
 obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
 flask-policy.o: policy.bin
 
-flask-policy.S: $(XEN_ROOT)/xen/tools/binfile
-	$(SHELL) $(XEN_ROOT)/xen/tools/binfile -i $@ policy.bin xsm_flask_init_policy
+flask-policy.S: $(BASEDIR)/tools/binfile
+	$(SHELL) $(BASEDIR)/tools/binfile -i $@ policy.bin xsm_flask_init_policy
 
 FLASK_BUILD_DIR := $(CURDIR)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
-- 
2.17.1


