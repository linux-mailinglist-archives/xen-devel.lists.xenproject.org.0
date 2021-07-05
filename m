Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255163BBBA3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 12:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150100.277624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0MGG-0005Ku-ET; Mon, 05 Jul 2021 10:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150100.277624; Mon, 05 Jul 2021 10:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0MGG-0005Fe-9V; Mon, 05 Jul 2021 10:55:36 +0000
Received: by outflank-mailman (input) for mailman id 150100;
 Mon, 05 Jul 2021 10:55:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jU53=L5=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1m0MGE-0003rB-Cc
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 10:55:34 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 74206765-7696-408d-bc0e-90cade312c02;
 Mon, 05 Jul 2021 10:55:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1629B12FC;
 Mon,  5 Jul 2021 03:55:24 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 304EA3F5A1;
 Mon,  5 Jul 2021 03:55:23 -0700 (PDT)
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
X-Inumbo-ID: 74206765-7696-408d-bc0e-90cade312c02
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 4/9] m4/python: add function to docs_tool.m4 and new m4 module
Date: Mon,  5 Jul 2021 11:50:58 +0100
Message-Id: <20210705105103.14509-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705105103.14509-1-luca.fancellu@arm.com>
References: <20210705105103.14509-1-luca.fancellu@arm.com>

Add ax_python_module.m4 to have a way to check if
a python module is installed in the system.

Add a function to docs_tool.m4 to throw an error if the
required docs tool is missing.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 m4/ax_python_module.m4 | 56 ++++++++++++++++++++++++++++++++++++++++++
 m4/docs_tool.m4        |  9 +++++++
 2 files changed, 65 insertions(+)
 create mode 100644 m4/ax_python_module.m4

diff --git a/m4/ax_python_module.m4 b/m4/ax_python_module.m4
new file mode 100644
index 0000000000..107d88264a
--- /dev/null
+++ b/m4/ax_python_module.m4
@@ -0,0 +1,56 @@
+# ===========================================================================
+#     https://www.gnu.org/software/autoconf-archive/ax_python_module.html
+# ===========================================================================
+#
+# SYNOPSIS
+#
+#   AX_PYTHON_MODULE(modname[, fatal, python])
+#
+# DESCRIPTION
+#
+#   Checks for Python module.
+#
+#   If fatal is non-empty then absence of a module will trigger an error.
+#   The third parameter can either be "python" for Python 2 or "python3" for
+#   Python 3; defaults to Python 3.
+#
+# LICENSE
+#
+#   Copyright (c) 2008 Andrew Collier
+#
+#   Copying and distribution of this file, with or without modification, are
+#   permitted in any medium without royalty provided the copyright notice
+#   and this notice are preserved. This file is offered as-is, without any
+#   warranty.
+
+#serial 9
+
+AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
+AC_DEFUN([AX_PYTHON_MODULE],[
+    if test -z $PYTHON;
+    then
+        if test -z "$3";
+        then
+            PYTHON="python3"
+        else
+            PYTHON="$3"
+        fi
+    fi
+    PYTHON_NAME=`basename $PYTHON`
+    AC_MSG_CHECKING($PYTHON_NAME module: $1)
+    $PYTHON -c "import $1" 2>/dev/null
+    if test $? -eq 0;
+    then
+        AC_MSG_RESULT(yes)
+        eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
+    else
+        AC_MSG_RESULT(no)
+        eval AS_TR_CPP(HAVE_PYMOD_$1)=no
+        #
+        if test -n "$2"
+        then
+            AC_MSG_ERROR(failed to find required module $1)
+            exit 1
+        fi
+    fi
+])
\ No newline at end of file
diff --git a/m4/docs_tool.m4 b/m4/docs_tool.m4
index 3e8814ac8d..39aa348026 100644
--- a/m4/docs_tool.m4
+++ b/m4/docs_tool.m4
@@ -15,3 +15,12 @@ dnl
         AC_MSG_WARN([$2 is not available so some documentation won't be built])
     ])
 ])
+
+AC_DEFUN([AX_DOCS_TOOL_REQ_PROG], [
+dnl
+    AC_ARG_VAR([$1], [Path to $2 tool])
+    AC_PATH_PROG([$1], [$2])
+    AS_IF([! test -x "$ac_cv_path_$1"], [
+        AC_MSG_ERROR([$2 is needed])
+    ])
+])
\ No newline at end of file
-- 
2.17.1


