Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C2812CBD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654403.1021305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDimo-0006js-Vx; Thu, 14 Dec 2023 10:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654403.1021305; Thu, 14 Dec 2023 10:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDimo-0006ZQ-SG; Thu, 14 Dec 2023 10:17:46 +0000
Received: by outflank-mailman (input) for mailman id 654403;
 Thu, 14 Dec 2023 10:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDimn-0006Da-CH
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:17:45 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0554b220-9a6a-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 11:17:44 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c2db2ee28so84621525e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:17:44 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 gw18-20020a05600c851200b004053e9276easm26276280wmb.32.2023.12.14.02.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 02:17:43 -0800 (PST)
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
X-Inumbo-ID: 0554b220-9a6a-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702549063; x=1703153863; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uem9HU9IMtRwRD4U1/+rZK9QwDDjIx6C/QW5H+G6tU=;
        b=eoScLbzCAlE+/+SQ0LdM0UkCB0eQ2O+YnyhC7mM9Rqbdyo3X8Lv1gqdPOiaNhOWTqJ
         i2460U2w7yh7UZssuOM1jDG4JhmmWZK23Au25im76OUWlU0a+xuZj4wOlDmH8JRYcVv+
         V/zKnK1xl2sPyyV0bmqxoO+1DmQF40unQnNKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702549063; x=1703153863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uem9HU9IMtRwRD4U1/+rZK9QwDDjIx6C/QW5H+G6tU=;
        b=PGCrmr8I5nyNZlIkCni8RvlFAjOF723rLJd4oGpLlyxKt+Oy7sS1Mct0h/Heok1mBj
         32EGKtlpDZdbboaehWHS4JaBHvbUuJXf2/M/U9+tHfiinWmdMeXnI5Im3QnZJokGtFCC
         zYXyHcH0UZ/UV7r4YvEsBIyMnxZyFZJOxmBePFfjEJHllFZRRWy1q1fmwGT92BZv0G5w
         4SP60al2K7/aAVl4eYAfM7cF8km7CoeSpQKdPqDSSt8ghIHHqKJJT+cnA1L2VlC67MvR
         MUF2xKaq3NZbQXGWwG/wiJc9E3Yt/KRHByCxILsFO4yrTHKKrBIsiQHY8Pa85WgH1dj2
         pQDg==
X-Gm-Message-State: AOJu0YzeKOUWVNShqHywYrkAg7IYbCAuqyxsrvjojJVMGqDepKpcqxEP
	WG32we7J0SV07BnpG97ONJH6ezyGiWeBcCLfB2w=
X-Google-Smtp-Source: AGHT+IHCqH8ZUtNHk8Qx/sLuLfjtYkIYiJVgPji27dkFRJbFYjadLYaWNCkNyWDQXfD28fkQVvzpFw==
X-Received: by 2002:a05:600c:1705:b0:40c:36ed:c5c6 with SMTP id c5-20020a05600c170500b0040c36edc5c6mr5405038wmn.29.1702549063621;
        Thu, 14 Dec 2023 02:17:43 -0800 (PST)
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
Subject: [PATCH v3 3/4] x86/livepatch: introduce a basic live patch test to gitlab CI
Date: Thu, 14 Dec 2023 11:17:18 +0100
Message-ID: <20231214101719.18770-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101719.18770-1-roger.pau@citrix.com>
References: <20231214101719.18770-1-roger.pau@citrix.com>
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
---
Changes since v2:
 - Clarify comment about xor vs mov instructions for return false/true
   encodings.

Changes since v1:
 - New interface & test.
---
 tools/misc/xen-livepatch.c           | 29 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/test-smoc.h |  4 ++++
 xen/arch/x86/setup.c                 |  2 +-
 xen/arch/x86/test/Makefile           |  2 ++
 xen/arch/x86/test/smoc-lp-alt.c      | 24 +++++++++++++++++++++++
 xen/arch/x86/test/smoc-lp.c          | 24 +++++++++++++++++++++++
 xen/arch/x86/test/smoc.c             | 11 ++++++++++-
 xen/include/public/sysctl.h          |  6 +++++-
 8 files changed, 99 insertions(+), 3 deletions(-)
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
diff --git a/xen/arch/x86/include/asm/test-smoc.h b/xen/arch/x86/include/asm/test-smoc.h
index 2547b925d291..d369cf39687c 100644
--- a/xen/arch/x86/include/asm/test-smoc.h
+++ b/xen/arch/x86/include/asm/test-smoc.h
@@ -5,6 +5,10 @@
 
 int test_smoc(uint32_t selection, uint32_t *results);
 
+#ifdef CONFIG_LIVEPATCH
+bool cf_check test_lp_insn_replacement(void);
+#endif
+
 #endif	/* _ASM_X86_TEST_SMC_H_ */
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e026b0ea5adc..b97faa7a3e97 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1952,7 +1952,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     alternative_branches();
 
-    test_smoc(XEN_SYSCTL_TEST_SMOC_ALL, NULL);
+    test_smoc(XEN_SYSCTL_TEST_SMOC_ALL & ~XEN_SYSCTL_TEST_SMOC_LP, NULL);
 
     /*
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
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
index 000000000000..d054e9bedc51
--- /dev/null
+++ b/xen/arch/x86/test/smoc-lp-alt.c
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <asm/test-smoc.h>
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
index 000000000000..e972791480b5
--- /dev/null
+++ b/xen/arch/x86/test/smoc-lp.c
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <asm/test-smoc.h>
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
index e7529f937a5a..8e74d26432ee 100644
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
 
@@ -50,7 +54,12 @@ int test_smoc(uint32_t selection, uint32_t *results)
             continue;
         }
 
-        add_taint(TAINT_ERROR_SMOC);
+        /*
+         * livepatch related tests don't taint the hypervisor because we also
+         * want to check the failing case.
+         */
+        if ( !(tests[i].mask & XEN_SYSCTL_TEST_SMOC_LP) )
+            add_taint(TAINT_ERROR_SMOC);
         printk(XENLOG_ERR "%s test failed\n", tests[i].name);
     }
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 4b17f1344732..aa4068d6996b 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1205,7 +1205,11 @@ struct xen_sysctl_dt_overlay {
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


