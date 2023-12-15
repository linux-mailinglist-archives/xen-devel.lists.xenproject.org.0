Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E18146A9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 12:19:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655032.1022699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6Da-0002lS-1M; Fri, 15 Dec 2023 11:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655032.1022699; Fri, 15 Dec 2023 11:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6DZ-0002ez-TR; Fri, 15 Dec 2023 11:18:57 +0000
Received: by outflank-mailman (input) for mailman id 655032;
 Fri, 15 Dec 2023 11:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE6DY-0002YQ-AE
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 11:18:56 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb6777a3-9b3b-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 12:18:54 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c38e292c8so2717425e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 03:18:54 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 v14-20020a5d4a4e000000b003333541a5bdsm18546891wrs.80.2023.12.15.03.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 03:18:53 -0800 (PST)
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
X-Inumbo-ID: bb6777a3-9b3b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702639134; x=1703243934; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pZ/40IFyhVPhsZHwd4jJR9UQEqZhbtR8GJbwcsXPwM=;
        b=dGKmgbvQHjwTTfbLTDcDoDAbHpTYx07UkR8jWXaFjhdoHa8dHfB3dkde8ovY1BGjr7
         1U7Nab3QlvPllhWk2xEcHnEFt/b+N3dIQr9KmKC26C6snPeLEQT5/GZpR7va93THCJRw
         3FTqWw4i4AamkI2fBEnvTTdWtzR/AIJ36pCE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702639134; x=1703243934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pZ/40IFyhVPhsZHwd4jJR9UQEqZhbtR8GJbwcsXPwM=;
        b=m233xB0XFqtai9MaBSM1Olngb0+O53jLBT01tibj7wwbsF/+HX8eEuxOR8BB0VWELd
         GYGiMJ/DEJhzvtY37NvCYSDIJ5vwSCoj7pW9pqnCxxwPpAs4bhdmVfszwHNcf9Ixshcj
         XWtTMirIZ61LW2IN8MTTDD/w8L3gp713KEkFg6len4wPOlJk2+C4LnCLOXcTbYFOsRHm
         yWlHYeWfACoHskLRT3ZhI3c1QBdaqwTyWdiETftzRtEnrDtgSfDKyQHbrYF/XK13Rz3e
         Ln4GT2/mmEX/tO+l9d/Fn9lZNsALlU1pxS5aeALEMPvp3RmZFokRXWmjRqepyjn/8c+y
         /9mg==
X-Gm-Message-State: AOJu0YxCISA9WZBJGMTMlxMribSI+p3eLYrCXAZLiH1DH6WruXMlSalp
	SSBCaSsKDHvnLiH0Qs1Q27a3IyerzOg0X3/b/wc=
X-Google-Smtp-Source: AGHT+IHM6LyEQJjS5r5wgOMqxTjLBuiwG9g8fGA70gVVpa+M0/gMISIxwNnAsj0O1luVjyHYHVl7jA==
X-Received: by 2002:a05:600c:1503:b0:40c:2c5f:5887 with SMTP id b3-20020a05600c150300b0040c2c5f5887mr5740434wmg.22.1702639133809;
        Fri, 15 Dec 2023 03:18:53 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 3/4] x86/livepatch: introduce a basic live patch test to gitlab CI
Date: Fri, 15 Dec 2023 12:18:41 +0100
Message-ID: <20231215111842.8009-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215111842.8009-1-roger.pau@citrix.com>
References: <20231215111842.8009-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a basic livepatch test using the interface to run self modifying
tests.  The introduced test relies on changing a function from returning false
to returning true.

To simplify the burden of keeping a patch that can be provided to
livepatch-build-tools, introduce two new files: one containing the unpatched
test functions, and another one that contains the patched forms of such
functions.  Note that only the former is linked into the Xen image, the latter
is built but the object file is not consumed afterwards.  Do this to assert
that the file containing the patched functions continues to build.

Since livepatch testing will ensure that the functions are not patched previous
the applying the livepatch, allow the livepatch related tests to fail without
tainting the hypervisor.

Note the livepatch tests are not run as part of the self modifying checks
executed during boot, as they would obviously fail.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Rebase over previous changes.

Changes since v2:
 - Clarify comment about xor vs mov instructions for return false/true
   encodings.

Changes since v1:
 - New interface & test.
---
 tools/misc/xen-livepatch.c      | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/test.h |  9 ++++++++-
 xen/arch/x86/test/Makefile      |  2 ++
 xen/arch/x86/test/smoc-lp-alt.c | 24 ++++++++++++++++++++++++
 xen/arch/x86/test/smoc-lp.c     | 24 ++++++++++++++++++++++++
 xen/arch/x86/test/smoc.c        |  4 ++++
 xen/include/public/sysctl.h     |  6 +++++-
 7 files changed, 96 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/test/smoc-lp-alt.c
 create mode 100644 xen/arch/x86/test/smoc-lp.c

diff --git a/tools/misc/xen-livepatch.c b/tools/misc/xen-livepatch.c
index 5bf9d9a32b65..4ebd1b4e936d 100644
--- a/tools/misc/xen-livepatch.c
+++ b/tools/misc/xen-livepatch.c
@@ -37,6 +37,7 @@ void show_help(void)
             "  replace <name>         apply <name> patch and revert all others.\n"
             "  unload <name>          unload name <name> patch.\n"
             "  load <file> [flags]    upload and apply <file> with name as the <file> name\n"
+            "  test                   execute self modifying code livepatch hypervisor tests\n"
             "    Supported flags:\n"
             "      --nodeps           Disable inter-module buildid dependency check.\n"
             "                         Check only against hypervisor buildid.\n",
@@ -542,6 +543,33 @@ error:
     return rc;
 }
 
+static int test_func(int argc, char *argv[])
+{
+    uint32_t results = 0;
+    int rc;
+
+    if ( argc != 0 )
+    {
+        show_help();
+        return -1;
+    }
+
+    rc = xc_test_smoc(xch, XEN_SYSCTL_TEST_SMOC_LP, &results);
+    if ( rc )
+    {
+        fprintf(stderr, "test operation failed: %s\n", strerror(errno));
+        return -1;
+    }
+    if ( (results & XEN_SYSCTL_TEST_SMOC_LP) != XEN_SYSCTL_TEST_SMOC_LP )
+    {
+        fprintf(stderr, "some tests failed: %#x (expected %#x)\n",
+                results, XEN_SYSCTL_TEST_SMOC_LP);
+        return -1;
+    }
+
+    return 0;
+}
+
 /*
  * These are also functions in action_options that are called in case
  * none of the ones in main_options match.
@@ -554,6 +582,7 @@ struct {
     { "list", list_func },
     { "upload", upload_func },
     { "load", load_func },
+    { "test", test_func },
 };
 
 int main(int argc, char *argv[])
diff --git a/xen/arch/x86/include/asm/test.h b/xen/arch/x86/include/asm/test.h
index e96e709c6a52..951aaaa1f55e 100644
--- a/xen/arch/x86/include/asm/test.h
+++ b/xen/arch/x86/include/asm/test.h
@@ -3,11 +3,18 @@
 
 #include <xen/types.h>
 
+#include <public/sysctl.h>
+
 int test_smoc(uint32_t selection, uint32_t *results);
 
+#ifdef CONFIG_LIVEPATCH
+bool cf_check test_lp_insn_replacement(void);
+#endif
+
 static inline void execute_selftests(void)
 {
-    const uint32_t exec_mask = XEN_SYSCTL_TEST_SMOC_ALL;
+    const uint32_t exec_mask = XEN_SYSCTL_TEST_SMOC_ALL &
+                               ~XEN_SYSCTL_TEST_SMOC_LP;
     uint32_t result;
     int rc;
 
diff --git a/xen/arch/x86/test/Makefile b/xen/arch/x86/test/Makefile
index b504b8196659..3a5a0a98e4db 100644
--- a/xen/arch/x86/test/Makefile
+++ b/xen/arch/x86/test/Makefile
@@ -1 +1,3 @@
 obj-y += smoc.o
+obj-$(CONFIG_LIVEPATCH)   += smoc-lp.o     # for livepatch testing
+extra-$(CONFIG_LIVEPATCH) += smoc-lp-alt.o
diff --git a/xen/arch/x86/test/smoc-lp-alt.c b/xen/arch/x86/test/smoc-lp-alt.c
new file mode 100644
index 000000000000..16cf65dafdc1
--- /dev/null
+++ b/xen/arch/x86/test/smoc-lp-alt.c
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <asm/test.h>
+
+/*
+ * Interesting case because `return false` can be encoded as `xor %eax, %eax`,
+ * which is shorter than `return true` which is encoded as a `mov $1, %eax`
+ * instruction (based on code generated by GCC 13.2 at -O2), and also shorter
+ * than the replacement `jmp` instruction.
+ */
+bool cf_check test_lp_insn_replacement(void)
+{
+    return true;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/test/smoc-lp.c b/xen/arch/x86/test/smoc-lp.c
new file mode 100644
index 000000000000..ac32bce4d464
--- /dev/null
+++ b/xen/arch/x86/test/smoc-lp.c
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <asm/test.h>
+
+/*
+ * Interesting case because `return false` can be encoded as `xor %eax, %eax`,
+ * which is shorter than `return true` which is encoded as a `mov $1, %eax`
+ * instruction (based on code generated by GCC 13.2 at -O2), and also shorter
+ * than the replacement `jmp` instruction.
+ */
+bool cf_check test_lp_insn_replacement(void)
+{
+    return false;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/test/smoc.c b/xen/arch/x86/test/smoc.c
index 09db5cee9ae2..3a6091141fdf 100644
--- a/xen/arch/x86/test/smoc.c
+++ b/xen/arch/x86/test/smoc.c
@@ -27,6 +27,10 @@ int test_smoc(uint32_t selection, uint32_t *results)
     } static const tests[] = {
         { XEN_SYSCTL_TEST_SMOC_INSN_REPL, &test_insn_replacement,
           "alternative instruction replacement" },
+#ifdef CONFIG_LIVEPATCH
+        { XEN_SYSCTL_TEST_SMOC_LP_INSN, &test_lp_insn_replacement,
+          "livepatch instruction replacement" },
+#endif
     };
     unsigned int i;
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index d015a490da38..f12fc1e2f110 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1204,7 +1204,11 @@ struct xen_sysctl_dt_overlay {
 struct xen_sysctl_test_smoc {
     uint32_t tests;     /* IN: bitmap with selected tests to execute. */
 #define XEN_SYSCTL_TEST_SMOC_INSN_REPL   (1U << 0)
-#define XEN_SYSCTL_TEST_SMOC_ALL         (XEN_SYSCTL_TEST_SMOC_INSN_REPL)
+#define XEN_SYSCTL_TEST_SMOC_LP_INSN     (1U << 1)
+#define XEN_SYSCTL_TEST_SMOC_ALL         (XEN_SYSCTL_TEST_SMOC_INSN_REPL | \
+                                         XEN_SYSCTL_TEST_SMOC_LP_INSN)
+#define XEN_SYSCTL_TEST_SMOC_LP          (XEN_SYSCTL_TEST_SMOC_LP_INSN)
+
     uint32_t results;   /* OUT: test result: 1 -> success, 0 -> failure. */
 };
 
-- 
2.43.0


