Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C8B2861B2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 16:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3549.10155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQAtQ-0000Eg-CT; Wed, 07 Oct 2020 14:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3549.10155; Wed, 07 Oct 2020 14:58:12 +0000
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
	id 1kQAtQ-0000EH-9L; Wed, 07 Oct 2020 14:58:12 +0000
Received: by outflank-mailman (input) for mailman id 3549;
 Wed, 07 Oct 2020 14:58:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQAtO-0000EC-F3
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 14:58:10 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 37f9e5d1-c3bc-4f9c-a7b2-3b36f8c8695d;
 Wed, 07 Oct 2020 14:58:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8044F106F;
 Wed,  7 Oct 2020 07:58:08 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14DAF3F66B;
 Wed,  7 Oct 2020 07:58:06 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQAtO-0000EC-F3
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 14:58:10 +0000
X-Inumbo-ID: 37f9e5d1-c3bc-4f9c-a7b2-3b36f8c8695d
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 37f9e5d1-c3bc-4f9c-a7b2-3b36f8c8695d;
	Wed, 07 Oct 2020 14:58:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8044F106F;
	Wed,  7 Oct 2020 07:58:08 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14DAF3F66B;
	Wed,  7 Oct 2020 07:58:06 -0700 (PDT)
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
Subject: [PATCH v2] build: always use BASEDIR for xen sub-directory
Date: Wed,  7 Oct 2020 15:57:51 +0100
Message-Id: <df2fc83d3a84dd3fc2e58101ded22847fdbaa862.1602082503.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.

This is removing the dependency to xen subdirectory preventing using a
wrong configuration file when xen subdirectory is duplicated for
compilation tests.

BASEDIR is set in xen/lib/x86/Makefile as this Makefile is directly
called from the tools build and install process and BASEDIR is not set
there.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
 Fix tools installation by setting BASEDIR in lib/x86 Makefile.
---
 xen/common/Makefile                | 6 +++---
 xen/include/xen/lib/x86/Makefile   | 6 ++++--
 xen/tools/kconfig/Makefile.kconfig | 2 +-
 xen/xsm/flask/Makefile             | 4 ++--
 4 files changed, 10 insertions(+), 8 deletions(-)

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
index 408d69c99e..c3b9ebe961 100644
--- a/xen/include/xen/lib/x86/Makefile
+++ b/xen/include/xen/lib/x86/Makefile
@@ -1,8 +1,10 @@
 include $(XEN_ROOT)/Config.mk
 
+BASEDIR = $(XEN_ROOT)/xen
+
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


