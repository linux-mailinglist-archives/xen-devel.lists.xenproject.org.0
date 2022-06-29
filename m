Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F3560091
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 14:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357860.586703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6XEJ-0007Z2-EV; Wed, 29 Jun 2022 12:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357860.586703; Wed, 29 Jun 2022 12:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6XEJ-0007Vu-A2; Wed, 29 Jun 2022 12:55:39 +0000
Received: by outflank-mailman (input) for mailman id 357860;
 Wed, 29 Jun 2022 12:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYaO=XE=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1o6XEH-0007Vo-RC
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 12:55:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c45e385f-f7aa-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 14:55:36 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 043F1152B;
 Wed, 29 Jun 2022 05:55:35 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9811A3F792;
 Wed, 29 Jun 2022 05:55:33 -0700 (PDT)
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
X-Inumbo-ID: c45e385f-f7aa-11ec-bd2d-47488cf2e6aa
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
Subject: [PATCH v2] docs/misra: Add instructions for cppcheck
Date: Wed, 29 Jun 2022 13:55:26 +0100
Message-Id: <20220629125526.28190-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Add instructions on how to build cppcheck, the version currently used
and an example to use the cppcheck integration to run the analysis on
the Xen codebase

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v2:
- typo fixes, removed build command line, rephrasing (Julien)
---
 docs/misra/cppcheck.txt | 64 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 docs/misra/cppcheck.txt

diff --git a/docs/misra/cppcheck.txt b/docs/misra/cppcheck.txt
new file mode 100644
index 000000000000..25d8c3050b72
--- /dev/null
+++ b/docs/misra/cppcheck.txt
@@ -0,0 +1,64 @@
+Cppcheck for Xen static and MISRA analysis
+==========================================
+
+Xen can be analysed for both static analysis problems and MISRA violation using
+cppcheck, the open source tool allows the creation of a report with all the
+findings. Xen has introduced the support in the Makefile so it's very easy to
+use and in this document we can see how.
+
+The minimum version required for cppcheck is 2.7. Note that at the time of
+writing (June 2022), the version 2.8 is known to be broken [1].
+
+Install cppcheck on the system
+==============================
+
+Cppcheck can be retrieved from the github repository or by downloading the
+tarball, the version tested so far is the 2.7:
+
+ - https://github.com/danmar/cppcheck/tree/2.7
+ - https://github.com/danmar/cppcheck/archive/2.7.tar.gz
+
+To compile and install it, the complete command line can be found in readme.md,
+section "GNU make", please add the "install" target to that line and use every
+argument as it is in the documentation of the tool, so that every Xen developer
+following this page can reproduce the same findings.
+
+This will compile and install cppcheck in /usr/bin and all the cppcheck config
+files and addons will be installed in /usr/share/cppcheck folder, please modify
+that path in FILESDIR if it's not convinient for your system.
+
+If you don't want to overwrite a possible cppcheck binary installed in your
+system, you can omit the "install" target and FILESDIR, cppcheck will be just
+compiled and the binaries will be available in the same folder.
+If you choose to do that, later in this page it's explained how to use a local
+installation of cppcheck for the Xen analysis.
+
+Dependencies are listed in the readme.md of the project repository.
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
+
+
+[1] https://sourceforge.net/p/cppcheck/discussion/general/thread/bfc3ab6c41/?limit=25
-- 
2.17.1


