Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E956955983B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 12:54:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355445.583106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4gwH-0006KR-9r; Fri, 24 Jun 2022 10:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355445.583106; Fri, 24 Jun 2022 10:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4gwH-0006If-76; Fri, 24 Jun 2022 10:53:25 +0000
Received: by outflank-mailman (input) for mailman id 355445;
 Fri, 24 Jun 2022 10:53:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwSF=W7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1o4gwF-0006IZ-Tj
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 10:53:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ca66d405-f3ab-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 12:52:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01AF323A;
 Fri, 24 Jun 2022 03:53:21 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F0623F792;
 Fri, 24 Jun 2022 03:53:19 -0700 (PDT)
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
X-Inumbo-ID: ca66d405-f3ab-11ec-b725-ed86ccbb4733
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] docs/misra: Add instructions for cppcheck
Date: Fri, 24 Jun 2022 11:53:11 +0100
Message-Id: <20220624105311.21057-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Add instructions on how to build cppcheck, the version currently used
and an example to use the cppcheck integration to run the analysis on
the Xen codebase

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misra/cppcheck.txt | 66 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 docs/misra/cppcheck.txt

diff --git a/docs/misra/cppcheck.txt b/docs/misra/cppcheck.txt
new file mode 100644
index 000000000000..4df0488794aa
--- /dev/null
+++ b/docs/misra/cppcheck.txt
@@ -0,0 +1,66 @@
+Cppcheck for Xen static and MISRA analysis
+==========================================
+
+Xen can be analysed for both static analysis problems and MISRA violation using
+cppcheck, the open source tool allows the creation of a report with all the
+findings. Xen has introduced the support in the Makefile so it's very easy to
+use and in this document we can see how.
+
+First recommendation is to use exactly the same version in this page and provide
+the same option to the build system, so that every Xen developer can reproduce
+the same findings.
+
+Install cppcheck in the system
+==============================
+
+Cppcheck can be retrieved from the github repository or by downloading the
+tarball, the version tested so far is the 2.7:
+
+ - https://github.com/danmar/cppcheck/tree/2.7
+ - https://github.com/danmar/cppcheck/archive/2.7.tar.gz
+
+To compile and install it, here the complete command line:
+
+make MATCHCOMPILER=yes \
+    FILESDIR=/usr/share/cppcheck \
+    CFGDIR=/usr/share/cppcheck/cfg \
+    HAVE_RULES=yes \
+    CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" \
+    install
+
+This will compile and install cppcheck in /usr/bin and all the cppcheck config
+files and addons will be installed in /usr/share/cppcheck folder, please modify
+that path in FILESDIR and CFGDIR if it's not convinient for your system.
+
+If you don't want to overwrite a possible cppcheck binary installed in your
+system, you can omit the "install" target, FILESDIR, CFGDIR and cppcheck will be
+just compiled and the binaries will be available in the same folder.
+If you choose to do that, later in this page it's explained how to use a local
+installation of cppcheck for the Xen analysis.
+
+Dependencies are listed in the Readme.md of the project repository.
+
+Use cppcheck to analyse Xen
+===========================
+
+Using cppcheck integration is very simple, it requires few steps:
+
+ 1) Compile Xen
+ 2) call the cppcheck make target to generate a report in xml format:
+    make CPPCHECK_MISRA=y cppcheck
+ 3) call the cppcheck-html make target to generate a report in xml and html
+    format:
+    make CPPCHECK_MISRA=y cppcheck-html
+
+    In case the cppcheck binaries are not in the PATH, CPPCHECK and
+    CPPCHECK_HTMLREPORT variables can be overridden with the full path to the
+    binaries:
+
+    make -C xen \
+        CPPCHECK=/path/to/cppcheck \
+        CPPCHECK_HTMLREPORT=/path/to/cppcheck-htmlreport \
+        CPPCHECK_MISRA=y \
+        cppcheck-html
+
+The output is by default in a folder named cppcheck-htmlreport, but the name
+can be changed by passing it in the CPPCHECK_HTMLREPORT_OUTDIR variable.
-- 
2.17.1


