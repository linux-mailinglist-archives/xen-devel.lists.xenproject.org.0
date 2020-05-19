Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B78E1D90E2
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:21:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawYs-0004mL-SA; Tue, 19 May 2020 07:21:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jawYq-0004mF-NG
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:21:12 +0000
X-Inumbo-ID: 501f5d5c-99a1-11ea-a8e2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 501f5d5c-99a1-11ea-a8e2-12813bfff9fa;
 Tue, 19 May 2020 07:21:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09CCBB209;
 Tue, 19 May 2020 07:21:11 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v10 02/12] xen: add a generic way to include binary files as
 variables
Date: Tue, 19 May 2020 09:20:56 +0200
Message-Id: <20200519072106.26894-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200519072106.26894-1-jgross@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a new script xen/tools/binfile for including a binary file at build
time being usable via a pointer and a size variable in the hypervisor.

Make use of that generic tool in xsm.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Wei Liu <wl@xen.org>
---
V3:
- new patch

V4:
- add alignment parameter (Jan Beulich)
- use .Lend instead of . (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                   |  1 +
 xen/tools/binfile            | 43 ++++++++++++++++++++++++++++++++++++
 xen/xsm/flask/Makefile       |  5 ++++-
 xen/xsm/flask/flask-policy.S | 16 --------------
 4 files changed, 48 insertions(+), 17 deletions(-)
 create mode 100755 xen/tools/binfile
 delete mode 100644 xen/xsm/flask/flask-policy.S

diff --git a/.gitignore b/.gitignore
index bfa53723b3..034f44b21b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -314,6 +314,7 @@ xen/test/livepatch/*.livepatch
 xen/tools/kconfig/.tmp_gtkcheck
 xen/tools/kconfig/.tmp_qtcheck
 xen/tools/symbols
+xen/xsm/flask/flask-policy.S
 xen/xsm/flask/include/av_perm_to_string.h
 xen/xsm/flask/include/av_permissions.h
 xen/xsm/flask/include/class_to_string.h
diff --git a/xen/tools/binfile b/xen/tools/binfile
new file mode 100755
index 0000000000..df0301183f
--- /dev/null
+++ b/xen/tools/binfile
@@ -0,0 +1,43 @@
+#!/bin/sh
+# usage: binfile [-i] [-a <align>] <target-src.S> <binary-file> <varname>
+# -a <align>  align data at 2^<align> boundary (default: byte alignment)
+# -i          add to .init.rodata (default: .rodata) section
+
+section=""
+align=0
+
+OPTIND=1
+while getopts "ia:" opt; do
+    case "$opt" in
+    i)
+        section=".init"
+        ;;
+    a)
+        align=$OPTARG
+        ;;
+    esac
+done
+let "SHIFT=$OPTIND-1"
+shift $SHIFT
+
+target=$1
+binsource=$2
+varname=$3
+
+cat <<EOF >$target
+#include <asm/asm_defns.h>
+
+        .section $section.rodata, "a", %progbits
+
+        .p2align $align
+        .global $varname
+$varname:
+        .incbin "$binsource"
+.Lend:
+
+        .type $varname, %object
+        .size $varname, .Lend - $varname
+
+        .global ${varname}_size
+        ASM_INT(${varname}_size, .Lend - $varname)
+EOF
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index eebfceecc5..d8486fc7e4 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -39,6 +39,9 @@ $(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
 obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
 flask-policy.o: policy.bin
 
+flask-policy.S: $(XEN_ROOT)/xen/tools/binfile
+	$(XEN_ROOT)/xen/tools/binfile -i $@ policy.bin xsm_flask_init_policy
+
 FLASK_BUILD_DIR := $(CURDIR)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
 
@@ -48,4 +51,4 @@ policy.bin: FORCE
 
 .PHONY: clean
 clean::
-	rm -f $(ALL_H_FILES) *.o $(DEPS_RM) policy.* $(POLICY_SRC)
+	rm -f $(ALL_H_FILES) *.o $(DEPS_RM) policy.* $(POLICY_SRC) flask-policy.S
diff --git a/xen/xsm/flask/flask-policy.S b/xen/xsm/flask/flask-policy.S
deleted file mode 100644
index d38aa39964..0000000000
--- a/xen/xsm/flask/flask-policy.S
+++ /dev/null
@@ -1,16 +0,0 @@
-#include <asm/asm_defns.h>
-
-        .section .init.rodata, "a", %progbits
-
-/* const unsigned char xsm_flask_init_policy[] __initconst */
-        .global xsm_flask_init_policy
-xsm_flask_init_policy:
-        .incbin "policy.bin"
-.Lend:
-
-        .type xsm_flask_init_policy, %object
-        .size xsm_flask_init_policy, . - xsm_flask_init_policy
-
-/* const unsigned int __initconst xsm_flask_init_policy_size */
-        .global xsm_flask_init_policy_size
-        ASM_INT(xsm_flask_init_policy_size, .Lend - xsm_flask_init_policy)
-- 
2.26.1


