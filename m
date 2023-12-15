Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6117F8146A5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 12:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655031.1022693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6DZ-0002cr-HM; Fri, 15 Dec 2023 11:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655031.1022693; Fri, 15 Dec 2023 11:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6DZ-0002Zr-Cb; Fri, 15 Dec 2023 11:18:57 +0000
Received: by outflank-mailman (input) for mailman id 655031;
 Fri, 15 Dec 2023 11:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE6DX-0002YQ-KJ
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 11:18:55 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bacae79c-9b3b-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 12:18:53 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3333074512bso935334f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 03:18:53 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b0040c411da99csm23156935wmq.48.2023.12.15.03.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 03:18:51 -0800 (PST)
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
X-Inumbo-ID: bacae79c-9b3b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702639132; x=1703243932; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJ4YPQXNY4qR0RRVt6L4swFAHn2UjNCHVeT7LC23VgE=;
        b=AXr7RXjid2TlJ9EA5EBdQp8ZworaGzRbkNAtGM6B89EUcTsx4ApvOINBczd+Yuh5+x
         RWE7YRzU8cu3SqVF9sxHdDHm/p/D5sbBTvD7DDUnDEa5eBBtqSc0h5Y0/tUGqT1/PGiA
         XXzgib7qi/w4UuKCkuiS2C1MNvvHv5Qy5mwBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702639132; x=1703243932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJ4YPQXNY4qR0RRVt6L4swFAHn2UjNCHVeT7LC23VgE=;
        b=szvZFN9zn8mTaS5cI21CNJrQRdiCZn1l1ncZJqGdJlXXkgAi0GVM3P28rUvHxXC+iP
         lGpXx0rgW0p+WoNdSi0p3guFGaZavGLZsDmO2pxAyEfhn/jxIa1zfq4dBreWMr8gibhV
         G5B9/x+f+bS040m+Na+t6wZYgFGS/BHuwTHCOQGHTjOyUIO+1bPd6MhVDBu7ngWatd2v
         RB7Rt52uHIOR9Qoqkcu2HZ4FVCajhEmy3peA5urERXzxdkI19Y0XDgukor81JOToAV9b
         Un4v/shdzKiaD/EsfLXngaBLz9pisBhYT9TwA/6XRZHh1Svdh9MS2OPV9FKTj6WAC61M
         Ud8g==
X-Gm-Message-State: AOJu0Yx7MdbyDn7kbPbOXi/UTLhyLsE/psa7eiPkGswxrgNRMfPemdgi
	AvfFPsHzh5PW+twO4SkUPIy7Y0ysnLkT6ZyRPZQ=
X-Google-Smtp-Source: AGHT+IH5PNz/24/bP8VTc+j65gdAELWDZpYAGHFgO/QA947980Z1wu/Y9/3QUmVawihD/uomRJLkug==
X-Received: by 2002:a05:600c:54c4:b0:40c:3984:4983 with SMTP id iw4-20020a05600c54c400b0040c39844983mr6213574wmb.76.1702639132200;
        Fri, 15 Dec 2023 03:18:52 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/4] xen/x86: introduce self modifying code test
Date: Fri, 15 Dec 2023 12:18:40 +0100
Message-ID: <20231215111842.8009-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215111842.8009-1-roger.pau@citrix.com>
References: <20231215111842.8009-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a helper to perform checks related to self modifying code, and start
by creating a simple test to check that alternatives have been applied.

Such test is hooked into the boot process and called just after alternatives
have been applied.  In case of failure a message is printed, and the hypervisor
is tainted as not having passed the tests, this does require introducing a new
taint bit (printed as 'T').

A new sysctl is also introduced to run the tests on demand.  While there are no
current users introduced here, further changes will introduce those, and it's
helpful to have the interface defined in the sysctl header from the start.

Note the sysctl visibility is not limited to x86, albeit the only
implementation is for x86.  It's expected that other architectures can reuse
the same sysctl and structure, with possibly different tests.  Leave adjusting
those to when support for a different architecture is introduced, as the
sysctl interface is not stable anyway.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Rename taint variable.
 - Introduce a wrapper to run all selftests.
 - Only print messages and taint the hypervisor when tests are executed on
   boot.

Changes since v2:
 - Rename to smoc and place in test/smoc*
 - fix inline assembly.

Changes since v1:
 - Rework test and interface.
---
 tools/include/xenctrl.h         |  2 +
 tools/libs/ctrl/xc_misc.c       | 14 +++++++
 xen/arch/x86/Makefile           |  1 +
 xen/arch/x86/include/asm/test.h | 30 +++++++++++++++
 xen/arch/x86/setup.c            |  3 ++
 xen/arch/x86/sysctl.c           |  9 +++++
 xen/arch/x86/test/Makefile      |  1 +
 xen/arch/x86/test/smoc.c        | 66 +++++++++++++++++++++++++++++++++
 xen/common/kernel.c             |  5 ++-
 xen/include/public/sysctl.h     |  9 +++++
 xen/include/xen/lib.h           |  1 +
 11 files changed, 139 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/test.h
 create mode 100644 xen/arch/x86/test/Makefile
 create mode 100644 xen/arch/x86/test/smoc.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e05422..0af796ae84e8 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2658,6 +2658,8 @@ int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
 #endif
 
+int xc_test_smoc(xc_interface *xch, uint32_t tests, uint32_t *result);
+
 /* Compat shims */
 #include "xenctrl_compat.h"
 
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 5ecdfa2c7934..1d3d5929cf96 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -1021,6 +1021,20 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
     return _xc_livepatch_action(xch, name, LIVEPATCH_ACTION_REPLACE, timeout, flags);
 }
 
+int xc_test_smoc(xc_interface *xch, uint32_t tests, uint32_t *result)
+{
+    struct xen_sysctl sysctl = {
+        .cmd = XEN_SYSCTL_test_smoc,
+        .u.test_smoc.tests = tests,
+    };
+    int rc = do_sysctl(xch, &sysctl);
+
+    if ( !rc )
+        *result = sysctl.u.test_smoc.results;
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f3abdf9cd111..ad5112b03c64 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_HVM) += hvm/
 obj-y += mm/
 obj-$(CONFIG_XENOPROF) += oprofile/
 obj-$(CONFIG_PV) += pv/
+obj-y += test/
 obj-y += x86_64/
 obj-y += x86_emulate/
 
diff --git a/xen/arch/x86/include/asm/test.h b/xen/arch/x86/include/asm/test.h
new file mode 100644
index 000000000000..e96e709c6a52
--- /dev/null
+++ b/xen/arch/x86/include/asm/test.h
@@ -0,0 +1,30 @@
+#ifndef _ASM_X86_TEST_H_
+#define _ASM_X86_TEST_H_
+
+#include <xen/types.h>
+
+int test_smoc(uint32_t selection, uint32_t *results);
+
+static inline void execute_selftests(void)
+{
+    const uint32_t exec_mask = XEN_SYSCTL_TEST_SMOC_ALL;
+    uint32_t result;
+    int rc;
+
+    printk(XENLOG_INFO "Checking Self Modify Code\n");
+    rc = test_smoc(exec_mask, &result);
+    if ( rc || (result & exec_mask) != exec_mask )
+        add_taint(TAINT_ERROR_SELFTEST);
+}
+
+#endif	/* _ASM_X86_TEST_H_ */
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
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3cba2be0af6c..e974a8f8d725 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -58,6 +58,7 @@
 #include <asm/microcode.h>
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
+#include <asm/test.h>
 
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
@@ -1951,6 +1952,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     alternative_branches();
 
+    execute_selftests();
+
     /*
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
      * physical cpu_add/remove functions, so launch the guest with only
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1d40d82c5ad2..a61a99f8696a 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -25,6 +25,7 @@
 #include <asm/processor.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
+#include <asm/test.h>
 #include <asm/numa.h>
 #include <xen/nodemask.h>
 #include <xen/cpu.h>
@@ -423,6 +424,14 @@ long arch_do_sysctl(
         break;
     }
 
+    case XEN_SYSCTL_test_smoc:
+        ret = test_smoc(sysctl->u.test_smoc.tests,
+                        &sysctl->u.test_smoc.results);
+        if ( !ret && __copy_field_to_guest(u_sysctl, sysctl,
+                                           u.test_smoc.results) )
+            ret = -EFAULT;
+        break;
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/arch/x86/test/Makefile b/xen/arch/x86/test/Makefile
new file mode 100644
index 000000000000..b504b8196659
--- /dev/null
+++ b/xen/arch/x86/test/Makefile
@@ -0,0 +1 @@
+obj-y += smoc.o
diff --git a/xen/arch/x86/test/smoc.c b/xen/arch/x86/test/smoc.c
new file mode 100644
index 000000000000..09db5cee9ae2
--- /dev/null
+++ b/xen/arch/x86/test/smoc.c
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <xen/errno.h>
+
+#include <asm/alternative.h>
+#include <asm/cpufeature.h>
+#include <asm/test.h>
+
+static bool cf_check test_insn_replacement(void)
+{
+#define EXPECTED_VALUE 2
+    unsigned int r = ~EXPECTED_VALUE;
+
+    alternative_io("", "mov %1, %0", X86_FEATURE_ALWAYS,
+                   "+r" (r), "i" (EXPECTED_VALUE));
+
+    return r == EXPECTED_VALUE;
+#undef EXPECTED_VALUE
+}
+
+int test_smoc(uint32_t selection, uint32_t *results)
+{
+    struct {
+        unsigned int mask;
+        bool (*test)(void);
+        const char *name;
+    } static const tests[] = {
+        { XEN_SYSCTL_TEST_SMOC_INSN_REPL, &test_insn_replacement,
+          "alternative instruction replacement" },
+    };
+    unsigned int i;
+
+    if ( selection & ~XEN_SYSCTL_TEST_SMOC_ALL )
+        return -EINVAL;
+
+    if ( results )
+        *results = 0;
+
+    for ( i = 0; i < ARRAY_SIZE(tests); i++ )
+    {
+        if ( !(selection & tests[i].mask) )
+            continue;
+
+        if ( tests[i].test() )
+        {
+            if ( results )
+                *results |= tests[i].mask;
+            continue;
+        }
+
+        if ( system_state < SYS_STATE_active )
+            printk(XENLOG_ERR "%s test failed\n", tests[i].name);
+    }
+
+    return 0;
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
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 08dbaa2a054c..77f93f137cac 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -386,13 +386,14 @@ char *print_tainted(char *str)
 {
     if ( tainted )
     {
-        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c",
+        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c%c",
                  tainted & TAINT_MACHINE_INSECURE ? 'I' : ' ',
                  tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
                  tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
                  tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
                  tainted & TAINT_HVM_FEP ? 'H' : ' ',
-                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ');
+                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ',
+                 tainted & TAINT_ERROR_SELFTEST ? 'T' : ' ');
     }
     else
     {
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9b19679caeb1..d015a490da38 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1201,6 +1201,13 @@ struct xen_sysctl_dt_overlay {
 };
 #endif
 
+struct xen_sysctl_test_smoc {
+    uint32_t tests;     /* IN: bitmap with selected tests to execute. */
+#define XEN_SYSCTL_TEST_SMOC_INSN_REPL   (1U << 0)
+#define XEN_SYSCTL_TEST_SMOC_ALL         (XEN_SYSCTL_TEST_SMOC_INSN_REPL)
+    uint32_t results;   /* OUT: test result: 1 -> success, 0 -> failure. */
+};
+
 struct xen_sysctl {
     uint32_t cmd;
 #define XEN_SYSCTL_readconsole                    1
@@ -1232,6 +1239,7 @@ struct xen_sysctl {
 /* #define XEN_SYSCTL_set_parameter              28 */
 #define XEN_SYSCTL_get_cpu_policy                29
 #define XEN_SYSCTL_dt_overlay                    30
+#define XEN_SYSCTL_test_smoc                     31
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1259,6 +1267,7 @@ struct xen_sysctl {
         struct xen_sysctl_cpu_levelling_caps cpu_levelling_caps;
         struct xen_sysctl_cpu_featureset    cpu_featureset;
         struct xen_sysctl_livepatch_op      livepatch;
+        struct xen_sysctl_test_smoc         test_smoc;
 #if defined(__i386__) || defined(__x86_64__)
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 1793be5b6b89..dcb42a5b64c9 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -167,6 +167,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
 #define TAINT_HVM_FEP                   (1u << 3)
 #define TAINT_MACHINE_INSECURE          (1u << 4)
 #define TAINT_CPU_OUT_OF_SPEC           (1u << 5)
+#define TAINT_ERROR_SELFTEST            (1U << 6)
 extern unsigned int tainted;
 #define TAINT_STRING_MAX_LEN            20
 extern char *print_tainted(char *str);
-- 
2.43.0


