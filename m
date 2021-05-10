Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A17377E67
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124971.235341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1U3-0003LF-Rq; Mon, 10 May 2021 08:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124971.235341; Mon, 10 May 2021 08:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1U3-0003Ak-Hz; Mon, 10 May 2021 08:41:47 +0000
Received: by outflank-mailman (input) for mailman id 124971;
 Mon, 10 May 2021 08:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jR2S=KF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lg1U1-0008L0-OB
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:41:45 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 120380b4-d6db-4857-8ba4-6d056083678d;
 Mon, 10 May 2021 08:41:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A29411FB;
 Mon, 10 May 2021 01:41:23 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A3F33F719;
 Mon, 10 May 2021 01:41:22 -0700 (PDT)
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
X-Inumbo-ID: 120380b4-d6db-4857-8ba4-6d056083678d
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 6/9] docs: add doxygen preprocessor and related files
Date: Mon, 10 May 2021 09:41:02 +0100
Message-Id: <20210510084105.17108-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510084105.17108-1-luca.fancellu@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>

Add preprocessor called by doxygen before parsing headers,
it will include in every header a doxygen_include.h file
that provides missing defines and includes that are
usually passed by the compiler.

Add doxy_input.list that is a text file containing the
relative path to the source code file to be parsed by
doxygen. The path sould be relative to the xen folder:
E.g. xen/include/public/grant_table.h

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/xen-doxygen/doxy-preprocessor.py | 110 ++++++++++++++++++++++++++
 docs/xen-doxygen/doxy_input.list      |   0
 docs/xen-doxygen/doxygen_include.h.in |  32 ++++++++
 3 files changed, 142 insertions(+)
 create mode 100755 docs/xen-doxygen/doxy-preprocessor.py
 create mode 100644 docs/xen-doxygen/doxy_input.list
 create mode 100644 docs/xen-doxygen/doxygen_include.h.in

diff --git a/docs/xen-doxygen/doxy-preprocessor.py b/docs/xen-doxygen/doxy-preprocessor.py
new file mode 100755
index 0000000000..496899d8e6
--- /dev/null
+++ b/docs/xen-doxygen/doxy-preprocessor.py
@@ -0,0 +1,110 @@
+#!/usr/bin/python3
+#
+# Copyright (c) 2021, Arm Limited.
+#
+# SPDX-License-Identifier: GPL-2.0
+#
+
+import os, sys, re
+
+
+# Variables that holds the preprocessed header text
+output_text = ""
+header_file_name = ""
+
+# Variables to enumerate the anonymous structs/unions
+anonymous_struct_count = 0
+anonymous_union_count = 0
+
+
+def error(text):
+    sys.stderr.write("{}\n".format(text))
+    sys.exit(1)
+
+
+def write_to_output(text):
+    sys.stdout.write(text)
+
+
+def insert_doxygen_header(text):
+    # Here the strategy is to insert the #include <doxygen_include.h> in the
+    # first line of the header
+    abspath = os.path.dirname(os.path.abspath(__file__))
+    text += "#include \"{}/doxygen_include.h\"\n".format(abspath)
+
+    return text
+
+
+def enumerate_anonymous(match):
+    global anonymous_struct_count
+    global anonymous_union_count
+
+    if "struct" in match.group(1):
+        label = "anonymous_struct_%d" % anonymous_struct_count
+        anonymous_struct_count += 1
+    else:
+        label = "anonymous_union_%d" % anonymous_union_count
+        anonymous_union_count += 1
+
+    return match.group(1) + " " + label + " {"
+
+
+def manage_anonymous_structs_unions(text):
+    # Match anonymous unions/structs with this pattern:
+    # struct/union {
+    #     [...]
+    #
+    # and substitute it in this way:
+    #
+    # struct anonymous_struct_# {
+    #     [...]
+    # or
+    # union anonymous_union_# {
+    #     [...]
+    # where # is a counter starting from zero, different between structs and
+    # unions
+    #
+    # We don't count anonymous union/struct that are part of a typedef because
+    # they don't create any issue for doxygen
+    text = re.sub(
+        "(?<!typedef\s)(struct|union)\s+?\{",
+        enumerate_anonymous,
+        text,
+        flags=re.S
+    )
+
+    return text
+
+
+def main(argv):
+    global output_text
+    global header_file_name
+
+    if len(argv) != 1:
+        error("Script called without arguments!")
+
+    header_file_name = argv[0]
+
+    # Open header file
+    input_header_file = open(header_file_name, 'r')
+    # Read all lines
+    lines = input_header_file.readlines()
+
+    # Inject config.h and some defines in the current header, during compilation
+    # this job is done by the -include argument passed to the compiler.
+    output_text = insert_doxygen_header(output_text)
+
+    # Load file content in a variable
+    for line in lines:
+        output_text += "{}".format(line)
+
+    # Try to get rid of any anonymous union/struct
+    output_text = manage_anonymous_structs_unions(output_text)
+
+    # Final stage of the preprocessor, print the output to stdout
+    write_to_output(output_text)
+
+
+if __name__ == "__main__":
+    main(sys.argv[1:])
+    sys.exit(0)
diff --git a/docs/xen-doxygen/doxy_input.list b/docs/xen-doxygen/doxy_input.list
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/docs/xen-doxygen/doxygen_include.h.in b/docs/xen-doxygen/doxygen_include.h.in
new file mode 100644
index 0000000000..df284f3931
--- /dev/null
+++ b/docs/xen-doxygen/doxygen_include.h.in
@@ -0,0 +1,32 @@
+/*
+ * Doxygen include header
+ * It supplies the xen/include/xen/config.h that is included using the -include
+ * argument of the compiler in Xen Makefile.
+ * Other macros are defined because they are usually provided by the compiler.
+ *
+ * Copyright (C) 2021 ARM Limited
+ *
+ * Author: Luca Fancellu <luca.fancellu@arm.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include "@XEN_BASE@/xen/include/xen/config.h"
+
+#if defined(CONFIG_X86_64)
+
+#define __x86_64__ 1
+
+#elif defined(CONFIG_ARM_64)
+
+#define __aarch64__ 1
+
+#elif defined(CONFIG_ARM_32)
+
+#define __arm__ 1
+
+#else
+
+#error Architecture not supported/recognized.
+
+#endif
-- 
2.17.1


