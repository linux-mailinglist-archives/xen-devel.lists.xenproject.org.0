Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF77FB69F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642877.1002677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uws-0003Cx-8n; Tue, 28 Nov 2023 10:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642877.1002677; Tue, 28 Nov 2023 10:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uws-0003A7-2z; Tue, 28 Nov 2023 10:04:10 +0000
Received: by outflank-mailman (input) for mailman id 642877;
 Tue, 28 Nov 2023 10:04:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uwq-0002NP-9A
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:04:08 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f89934-8dd5-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 11:04:07 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9b5b72983so4151171fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 02:04:07 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c510700b0040b36ad5413sm16784552wms.46.2023.11.28.02.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 02:04:06 -0800 (PST)
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
X-Inumbo-ID: 77f89934-8dd5-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701165846; x=1701770646; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3yKV/RFZSYIusyATo8RxWzm7Bfr63u910kNQKsr5wU=;
        b=OppS1gb/idvKi6zG2UoTdtxquNDadKMPiBJHV5UO2LzZBfjyv+pIIqClBWykfpPmst
         Gx5HbEUzPOmLGNVmPkxYIAXgeWZaFLfIhBzELVrmzbojiU1kqxAWY4iQc14AJuUdW0rW
         O2ZDHwbgLKtYjC3NcuADjQjTbqR19soL1dquM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165846; x=1701770646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3yKV/RFZSYIusyATo8RxWzm7Bfr63u910kNQKsr5wU=;
        b=Vceb7xnvAYUSp9zXRYziV6aYF7PschBWcRaPkzDFIcmw/wtPc+trX8NA/pcyr8Ti2x
         IHXC3/lilTGcU0Wp+U58JuJD/I/wGL9cvZiSyoXYuUZS6R7Rc4iPzyw+xJ6l5NRK8P+w
         WgLqHcok4KtRdm1+0MRsVtIh/BYaWIlD/al7sfQRicR5STf4/IU1ofQsNgyOQiV0IZ9Q
         bIe0xlKijtUuVie76PuIros/sY67E0CpWTVUeFkrWEKQYUvkITt3q7lL/rej4nNWibAB
         VgtNW5OahX1vjcyB33wCnY55smvs1h4Suin30UPMXQjOXwiiE7FMSI3OFkH+vbbOPXSM
         Ro9Q==
X-Gm-Message-State: AOJu0YyH2UzLOUaLiWWCzv9K6FKx48ykYzgdM39YKnqUoIFCE4QIORuS
	r1hHXgs01RrVhbu6NoufiNPlrdz2L+CVAvPJ0IE=
X-Google-Smtp-Source: AGHT+IGUr4ORQZi+oIxzqruDPiO803YUuddIpmkAqngLT3LpdjlpHf0BiBh0Sx7bAd60OcacEiNMAw==
X-Received: by 2002:ac2:504f:0:b0:50b:bf06:ea0b with SMTP id a15-20020ac2504f000000b0050bbf06ea0bmr405848lfm.53.1701165846522;
        Tue, 28 Nov 2023 02:04:06 -0800 (PST)
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
Subject: [PATCH v2 3/5] xen/x86: introduce self modifying code test
Date: Tue, 28 Nov 2023 11:03:50 +0100
Message-ID: <20231128100352.35430-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128100352.35430-1-roger.pau@citrix.com>
References: <20231128100352.35430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a helper to perform checks related to self modifying code, and start
by creating a simple test to check that alternatives have been applied.

Such test is hooked into the boot process and called just after alternatives
have been applied.  In case of failure a message is printed, and the hypervisor
is tainted as not having passed the tests, this does require introducing a new
taint bit (printed as 'A').

A new sysctl is also introduced to run the tests on demand.  While there are no
current users introduced here, further changes will introduce those, and it's
helpful to have the interface defined in the sysctl header from the start.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Rework test and interface.
---
 tools/include/xenctrl.h             |  2 +
 tools/libs/ctrl/xc_misc.c           | 14 ++++++
 xen/arch/x86/Makefile               |  1 +
 xen/arch/x86/include/asm/test-smc.h | 18 ++++++++
 xen/arch/x86/setup.c                |  3 ++
 xen/arch/x86/sysctl.c               |  7 +++
 xen/arch/x86/test-smc.c             | 68 +++++++++++++++++++++++++++++
 xen/common/kernel.c                 |  5 ++-
 xen/include/public/sysctl.h         |  9 ++++
 xen/include/xen/lib.h               |  1 +
 10 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/test-smc.h
 create mode 100644 xen/arch/x86/test-smc.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e05422..0f87ffa4affd 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2658,6 +2658,8 @@ int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
 #endif
 
+int xc_test_smc(xc_interface *xch, uint32_t tests, uint32_t *result);
+
 /* Compat shims */
 #include "xenctrl_compat.h"
 
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 5ecdfa2c7934..7f7ece589cc2 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -1021,6 +1021,20 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
     return _xc_livepatch_action(xch, name, LIVEPATCH_ACTION_REPLACE, timeout, flags);
 }
 
+int xc_test_smc(xc_interface *xch, uint32_t tests, uint32_t *result)
+{
+    struct xen_sysctl sysctl = {
+        .cmd = XEN_SYSCTL_test_smc,
+        .u.smc.tests = tests,
+    };
+    int rc = do_sysctl(xch, &sysctl);
+
+    if ( !rc )
+        *result = sysctl.u.smc.results;
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f629157086d0..bdd2183a2fd7 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -65,6 +65,7 @@ obj-y += smpboot.o
 obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
+obj-y += test-smc.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += tsx.o
diff --git a/xen/arch/x86/include/asm/test-smc.h b/xen/arch/x86/include/asm/test-smc.h
new file mode 100644
index 000000000000..18b23dbdbf2d
--- /dev/null
+++ b/xen/arch/x86/include/asm/test-smc.h
@@ -0,0 +1,18 @@
+#ifndef _ASM_X86_TEST_SMC_H_
+#define _ASM_X86_TEST_SMC_H_
+
+#include <xen/types.h>
+
+int test_smc(uint32_t selection, uint32_t *results);
+
+#endif	/* _ASM_X86_TEST_SMC_H_ */
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
index f6b8a3efd752..1f90d30204fe 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -58,6 +58,7 @@
 #include <asm/microcode.h>
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
+#include <asm/test-smc.h>
 
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
@@ -1952,6 +1953,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     alternative_branches();
 
+    test_smc(XEN_SYSCTL_TEST_SMC_ALL, NULL);
+
     /*
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
      * physical cpu_add/remove functions, so launch the guest with only
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1d40d82c5ad2..77d091f4bd59 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -25,6 +25,7 @@
 #include <asm/processor.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
+#include <asm/test-smc.h>
 #include <asm/numa.h>
 #include <xen/nodemask.h>
 #include <xen/cpu.h>
@@ -423,6 +424,12 @@ long arch_do_sysctl(
         break;
     }
 
+    case XEN_SYSCTL_test_smc:
+        ret = test_smc(sysctl->u.smc.tests, &sysctl->u.smc.results);
+        if ( !ret && __copy_field_to_guest(u_sysctl, sysctl, u.smc.results) )
+            ret = -EFAULT;
+        break;
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/arch/x86/test-smc.c b/xen/arch/x86/test-smc.c
new file mode 100644
index 000000000000..8916c185d60a
--- /dev/null
+++ b/xen/arch/x86/test-smc.c
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <xen/errno.h>
+
+#include <asm/alternative.h>
+#include <asm/cpufeature.h>
+#include <asm/test-smc.h>
+
+static bool cf_check test_insn_replacement(void)
+{
+#define EXPECTED_VALUE 2
+    unsigned int r = ~EXPECTED_VALUE;
+
+    alternative_io("", "mov $" STR(EXPECTED_VALUE) ", %0",
+                   X86_FEATURE_ALWAYS, "=r"(r));
+
+    return r == EXPECTED_VALUE;
+#undef EXPECTED_VALUE
+}
+
+int test_smc(uint32_t selection, uint32_t *results)
+{
+    struct {
+        unsigned int mask;
+        bool (*test)(void);
+        const char *name;
+    } static const tests[] = {
+        { XEN_SYSCTL_TEST_SMC_INSN_REPL, &test_insn_replacement,
+          "alternative instruction replacement" },
+    };
+    unsigned int i;
+
+    if ( selection & ~XEN_SYSCTL_TEST_SMC_ALL )
+        return -EINVAL;
+
+    if ( results )
+        *results = 0;
+
+    printk(XENLOG_INFO "Checking Self Modify Code\n");
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
+        add_taint(TAINT_ERROR_SMC);
+        printk(XENLOG_ERR "%s test failed\n", tests[i].name);
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
index 08dbaa2a054c..fed7ed0d587f 100644
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
+                 tainted & TAINT_ERROR_SMC ? 'A' : ' ');
     }
     else
     {
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9b19679caeb1..94287009387c 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1201,6 +1201,13 @@ struct xen_sysctl_dt_overlay {
 };
 #endif
 
+struct xen_sysctl_test_smc {
+    uint32_t tests;     /* IN: bitmap with selected tests to execute. */
+#define XEN_SYSCTL_TEST_SMC_INSN_REPL   (1U << 0)
+#define XEN_SYSCTL_TEST_SMC_ALL         (XEN_SYSCTL_TEST_SMC_INSN_REPL)
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
+#define XEN_SYSCTL_test_smc                      31
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1261,6 +1269,7 @@ struct xen_sysctl {
         struct xen_sysctl_livepatch_op      livepatch;
 #if defined(__i386__) || defined(__x86_64__)
         struct xen_sysctl_cpu_policy        cpu_policy;
+        struct xen_sysctl_test_smc          smc;
 #endif
 
 #if defined(__arm__) || defined (__aarch64__)
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 1793be5b6b89..1bec6a01b18a 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -167,6 +167,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
 #define TAINT_HVM_FEP                   (1u << 3)
 #define TAINT_MACHINE_INSECURE          (1u << 4)
 #define TAINT_CPU_OUT_OF_SPEC           (1u << 5)
+#define TAINT_ERROR_SMC                 (1U << 6)
 extern unsigned int tainted;
 #define TAINT_STRING_MAX_LEN            20
 extern char *print_tainted(char *str);
-- 
2.43.0


