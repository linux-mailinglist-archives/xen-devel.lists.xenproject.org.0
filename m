Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C47FB69E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:04:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642878.1002685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uws-0003MW-Qp; Tue, 28 Nov 2023 10:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642878.1002685; Tue, 28 Nov 2023 10:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uws-0003ED-N8; Tue, 28 Nov 2023 10:04:10 +0000
Received: by outflank-mailman (input) for mailman id 642878;
 Tue, 28 Nov 2023 10:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uwr-0002NP-9o
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:04:09 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78a63ff1-8dd5-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 11:04:08 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c59a4dd14cso59502321fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 02:04:08 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c45c700b0040b37f1079dsm15402156wmo.29.2023.11.28.02.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 02:04:07 -0800 (PST)
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
X-Inumbo-ID: 78a63ff1-8dd5-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701165847; x=1701770647; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6FykrpCamJbjFK3ebQ5tpnfxbk6kWdBuuLGd0nmB/Q=;
        b=cU86KHKAC3655vnPm5kvBbv4D1E/8iROqxn1tgEgTx/UhIxMx1fzqmRVt/DKkFHHd8
         mg/3HpXWEnVodFWXFzadPXkl3iKIP9SVLbxoly05Y1ACjO1shat1It0e+OdHkf85ljaZ
         iDKYG810qarnbQSK5iwf4IWnfQ0S8N8YYSAgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165847; x=1701770647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6FykrpCamJbjFK3ebQ5tpnfxbk6kWdBuuLGd0nmB/Q=;
        b=dDFsHpzXLD3kroKdOhFUVceXx5HuyhXz164hNLzu0dfP0mESGDesEQ4UWBhuCpDxaw
         UWAzVbFouqeafFl77BqXWY4P6JpNFDu4D+jhDpyoKXHDPGI4k0dNTAwIGIkpVbaudH7L
         yHiymFk2ABcLH/3YZo9gnCBUDMm/d2to0rP5GrtWuAni5JXu9FBE9lwf8NJ8bfWIdB48
         OQuvXY9TWRI9+Apir2W628Pd3nr0JB8GnRI86iilXHKiVkv5yL97SX/2Px7KBo4etAOy
         AAE11beXxi6F3+C37x4y8t6Eo9WE51JeiMUD+Pt8MfARnj3p0fuvCUusQJjkSJkXFrUm
         /XZA==
X-Gm-Message-State: AOJu0YxHSSUlHJmOueMvXjGkvXHvjM45m/dmb3wJBUPx8Zfr+hDZ/R/P
	ET2R5h8MlCtsOu+TTkeUi51Jx50hKjvCOBNNmUs=
X-Google-Smtp-Source: AGHT+IHF2djFkoNstPWyfXNmbJAwb5aYM7dmCbAtf3cyAvrTxaziGV47Fc+srammLi7ku6r/+i/UCA==
X-Received: by 2002:a2e:2245:0:b0:2c9:9fbf:52b1 with SMTP id i66-20020a2e2245000000b002c99fbf52b1mr4865431lji.13.1701165847693;
        Tue, 28 Nov 2023 02:04:07 -0800 (PST)
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
Subject: [PATCH v2 4/5] x86/livepatch: introduce a basic live patch test to gitlab CI
Date: Tue, 28 Nov 2023 11:03:51 +0100
Message-ID: <20231128100352.35430-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128100352.35430-1-roger.pau@citrix.com>
References: <20231128100352.35430-1-roger.pau@citrix.com>
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
Changes since v1:
 - New interface & test.
---
 tools/misc/xen-livepatch.c          | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/Makefile               |  2 ++
 xen/arch/x86/include/asm/test-smc.h |  2 ++
 xen/arch/x86/setup.c                |  2 +-
 xen/arch/x86/test-smc-lp-alt.c      | 23 +++++++++++++++++++++++
 xen/arch/x86/test-smc-lp.c          | 23 +++++++++++++++++++++++
 xen/arch/x86/test-smc.c             | 11 ++++++++++-
 xen/include/public/sysctl.h         |  6 +++++-
 8 files changed, 95 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/x86/test-smc-lp-alt.c
 create mode 100644 xen/arch/x86/test-smc-lp.c

diff --git a/tools/misc/xen-livepatch.c b/tools/misc/xen-livepatch.c
index 5bf9d9a32b65..fb396f46aaac 100644
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
+    rc = xc_test_smc(xch, XEN_SYSCTL_TEST_SMC_LP, &results);
+    if ( rc )
+    {
+        fprintf(stderr, "test operation failed: %s\n", strerror(errno));
+        return -1;
+    }
+    if ( (results & XEN_SYSCTL_TEST_SMC_LP) != XEN_SYSCTL_TEST_SMC_LP )
+    {
+        fprintf(stderr, "some tests failed: %#x (expected %#x)\n",
+                results, XEN_SYSCTL_TEST_SMC_LP);
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
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index bdd2183a2fd7..71cb22e080b8 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -66,6 +66,8 @@ obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
 obj-y += test-smc.o
+obj-$(CONFIG_LIVEPATCH)   += test-smc-lp.o     # for livepatch testing
+extra-$(CONFIG_LIVEPATCH) += test-smc-lp-alt.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += tsx.o
diff --git a/xen/arch/x86/include/asm/test-smc.h b/xen/arch/x86/include/asm/test-smc.h
index 18b23dbdbf2d..6013e4daf7f8 100644
--- a/xen/arch/x86/include/asm/test-smc.h
+++ b/xen/arch/x86/include/asm/test-smc.h
@@ -5,6 +5,8 @@
 
 int test_smc(uint32_t selection, uint32_t *results);
 
+bool cf_check test_lp_insn_replacement(void);
+
 #endif	/* _ASM_X86_TEST_SMC_H_ */
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1f90d30204fe..8bfb394909b4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1953,7 +1953,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     alternative_branches();
 
-    test_smc(XEN_SYSCTL_TEST_SMC_ALL, NULL);
+    test_smc(XEN_SYSCTL_TEST_SMC_ALL & ~XEN_SYSCTL_TEST_SMC_LP, NULL);
 
     /*
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
diff --git a/xen/arch/x86/test-smc-lp-alt.c b/xen/arch/x86/test-smc-lp-alt.c
new file mode 100644
index 000000000000..7bde547a950d
--- /dev/null
+++ b/xen/arch/x86/test-smc-lp-alt.c
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <asm/test-smc.h>
+
+/*
+ * Interesting case because `return false` can be encoded as an xor
+ * instruction, which is shorter than `return true` which is a mov instruction,
+ * and also shorter than a jmp instruction.
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
diff --git a/xen/arch/x86/test-smc-lp.c b/xen/arch/x86/test-smc-lp.c
new file mode 100644
index 000000000000..0ae776053a42
--- /dev/null
+++ b/xen/arch/x86/test-smc-lp.c
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <asm/test-smc.h>
+
+/*
+ * Interesting case because `return false` can be encoded as an xor
+ * instruction, which is shorter than `return true` which is a mov instruction,
+ * and also shorter than a jmp instruction.
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
diff --git a/xen/arch/x86/test-smc.c b/xen/arch/x86/test-smc.c
index 8916c185d60a..1967016a229f 100644
--- a/xen/arch/x86/test-smc.c
+++ b/xen/arch/x86/test-smc.c
@@ -27,6 +27,10 @@ int test_smc(uint32_t selection, uint32_t *results)
     } static const tests[] = {
         { XEN_SYSCTL_TEST_SMC_INSN_REPL, &test_insn_replacement,
           "alternative instruction replacement" },
+#ifdef CONFIG_LIVEPATCH
+        { XEN_SYSCTL_TEST_SMC_LP_INSN, &test_lp_insn_replacement,
+          "livepatch instruction replacement" },
+#endif
     };
     unsigned int i;
 
@@ -50,7 +54,12 @@ int test_smc(uint32_t selection, uint32_t *results)
             continue;
         }
 
-        add_taint(TAINT_ERROR_SMC);
+        /*
+         * livepatch related tests don't taint the hypervisor because we also
+         * want to check the failing case.
+         */
+        if ( !(tests[i].mask & XEN_SYSCTL_TEST_SMC_LP) )
+            add_taint(TAINT_ERROR_SMC);
         printk(XENLOG_ERR "%s test failed\n", tests[i].name);
     }
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 94287009387c..c87878e72a42 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1204,7 +1204,11 @@ struct xen_sysctl_dt_overlay {
 struct xen_sysctl_test_smc {
     uint32_t tests;     /* IN: bitmap with selected tests to execute. */
 #define XEN_SYSCTL_TEST_SMC_INSN_REPL   (1U << 0)
-#define XEN_SYSCTL_TEST_SMC_ALL         (XEN_SYSCTL_TEST_SMC_INSN_REPL)
+#define XEN_SYSCTL_TEST_SMC_LP_INSN     (1U << 1)
+#define XEN_SYSCTL_TEST_SMC_ALL         (XEN_SYSCTL_TEST_SMC_INSN_REPL | \
+                                         XEN_SYSCTL_TEST_SMC_LP_INSN)
+#define XEN_SYSCTL_TEST_SMC_LP          (XEN_SYSCTL_TEST_SMC_LP_INSN)
+
     uint32_t results;   /* OUT: test result: 1 -> success, 0 -> failure. */
 };
 
-- 
2.43.0


