Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833933A469C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 18:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140556.259711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9c-0001r9-0Z; Fri, 11 Jun 2021 16:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140556.259711; Fri, 11 Jun 2021 16:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9b-0001n5-Qj; Fri, 11 Jun 2021 16:37:07 +0000
Received: by outflank-mailman (input) for mailman id 140556;
 Fri, 11 Jun 2021 16:37:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pdcj=LF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lrk9a-0008Of-6J
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 16:37:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a8627c0-347f-40e2-ae5d-ec513bc0a140;
 Fri, 11 Jun 2021 16:36:42 +0000 (UTC)
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
X-Inumbo-ID: 4a8627c0-347f-40e2-ae5d-ec513bc0a140
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623429402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SumFpR+oY+hds6iIruCSqHSplJXSvo3V45dPCKzNM9s=;
  b=YHk0ZrugOQljfMuEviKgBZUaXVnObaKbU2o4FQlT2UUPBcsgX8weZD6u
   l/vI9PzL386w8DZy+DgUoxTjRbq/HQjiqWqcPsew3MuK18R0IPV6JvPH7
   KryQSiX+WNMB6/Yj/dRdc2WmRtYjgcsXmFcUwOVVQRWgau239LXgibRVR
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MdZ0hv6Rnx6nFYzpWf79xr1ooGPl9paJq9x07BdZ32fjjTBGHYCgCMvE4CCdlrh4fYLoWjB+ue
 9BzEbHUDpmcwVv+oTt5psYGh8ElbhM8GL9Md1Vvrh+bR+DOloM+A6w93DOH7NeKz1eF+tArmRl
 7PYxtCEVyLsKx3sUbjoAkNPZBvp12nc7BGfo6RvuiWNA/bXMoctHmhhFRyLH8X+I0XbMoyqx8Z
 biISeW4nAITWTjTfoB9IjKxC5A+9uSSkCzZmB+X+zDa2yRkjo3YMRcAUtpBAqGs0IX2r1lTTkt
 DgE=
X-SBRS: 5.1
X-MesageID: 45958357
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:B1fo8KzIEkVSU3WJsJIUKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.83,265,1616472000"; 
   d="scan'208";a="45958357"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] tests: Introduce a TSX test
Date: Fri, 11 Jun 2021 17:36:27 +0100
Message-ID: <20210611163627.4878-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210611163627.4878-1-andrew.cooper3@citrix.com>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See the comment at the top of test-tsx.c for details.

This covers various complexities encountered while trying to address the
recent TSX deprecation on client parts.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/tests/Makefile       |   1 +
 tools/tests/tsx/.gitignore |   1 +
 tools/tests/tsx/Makefile   |  43 ++++
 tools/tests/tsx/test-tsx.c | 474 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 519 insertions(+)
 create mode 100644 tools/tests/tsx/.gitignore
 create mode 100644 tools/tests/tsx/Makefile
 create mode 100644 tools/tests/tsx/test-tsx.c

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 8746aabe6b..25531a984a 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -5,6 +5,7 @@ SUBDIRS-y :=
 SUBDIRS-y += resource
 SUBDIRS-$(CONFIG_X86) += cpu-policy
 SUBDIRS-$(CONFIG_X86) += mce-test
+SUBDIRS-$(CONFIG_X86) += tsx
 ifneq ($(clang),y)
 SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
diff --git a/tools/tests/tsx/.gitignore b/tools/tests/tsx/.gitignore
new file mode 100644
index 0000000000..97ec4db7ff
--- /dev/null
+++ b/tools/tests/tsx/.gitignore
@@ -0,0 +1 @@
+test-tsx
diff --git a/tools/tests/tsx/Makefile b/tools/tests/tsx/Makefile
new file mode 100644
index 0000000000..7381a4f5a4
--- /dev/null
+++ b/tools/tests/tsx/Makefile
@@ -0,0 +1,43 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGET := test-tsx
+
+.PHONY: all
+all: $(TARGET)
+
+.PHONY: run
+run: $(TARGET)
+	./$(TARGET)
+
+.PHONY: clean
+clean:
+	$(RM) -f -- *.o $(TARGET) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -f -- *~
+
+.PHONY: install
+install: all
+
+.PHONY: uninstall
+uninstall:
+
+CFLAGS += -Werror -std=gnu11
+CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenguest)
+CFLAGS += -I$(XEN_ROOT)/tools/libs/ctrl -I$(XEN_ROOT)/tools/libs/guest
+CFLAGS += $(APPEND_CFLAGS)
+
+LDFLAGS += $(LDLIBS_libxenctrl)
+LDFLAGS += $(LDLIBS_libxenguest)
+LDFLAGS += $(APPEND_LDFLAGS)
+
+test-tsx.o: Makefile
+
+test-tsx: test-tsx.o
+	$(CC) -o $@ $< $(LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
new file mode 100644
index 0000000000..2bf22cea81
--- /dev/null
+++ b/tools/tests/tsx/test-tsx.c
@@ -0,0 +1,474 @@
+/*
+ * TSX settings and consistency tests
+ *
+ * This tests various behaviours and invariants with regards to TSX.  It
+ * ideally wants running for several microcode versions, and all applicable
+ * tsx= commandline settings, on a single CPU, including after an S3
+ * suspend/resume event.
+ *
+ * It tests specifically:
+ *  - The consistency of MSR_TSX_CTRL/MSR_TSX_FORCE_ABORT values across the
+ *    system, and their accessibility WRT data in the host CPU policy.
+ *  - The actual behaviour of RTM on the system.
+ *
+ *  - 
+ */
+
+#define _GNU_SOURCE
+
+#include <err.h>
+#include <errno.h>
+#include <inttypes.h>
+#include <signal.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/ucontext.h>
+
+#include <xenctrl.h>
+#include <xenguest.h>
+#include <xen-tools/libs.h>
+
+#include "xg_private.h"
+
+enum {
+#define XEN_CPUFEATURE(name, value) X86_FEATURE_##name = value,
+#include <xen/arch-x86/cpufeatureset.h>
+};
+#define bitmaskof(idx)      (1u << ((idx) & 31))
+
+#define MSR_ARCH_CAPABILITIES               0x0000010a
+#define  ARCH_CAPS_TSX_CTRL                 (1 <<  7)
+#define MSR_TSX_FORCE_ABORT                 0x0000010f
+#define MSR_TSX_CTRL                        0x00000122
+
+static unsigned int nr_failures;
+#define fail(fmt, ...)                          \
+({                                              \
+    nr_failures++;                              \
+    (void)printf(fmt, ##__VA_ARGS__);           \
+})
+
+static xc_interface *xch;
+
+/*
+ * Policies, arranged as an array for easy collection of all of them.  We
+ * don't care about the raw policy (index 0) so reuse that for the guest
+ * policy.
+ */
+static struct xc_cpu_policy policies[6];
+#define guest_policy policies[0]
+#define host         policies[XEN_SYSCTL_cpu_policy_host]
+#define pv_max       policies[XEN_SYSCTL_cpu_policy_pv_max]
+#define hvm_max      policies[XEN_SYSCTL_cpu_policy_hvm_max]
+#define pv_default   policies[XEN_SYSCTL_cpu_policy_pv_default]
+#define hvm_default  policies[XEN_SYSCTL_cpu_policy_hvm_default]
+
+static bool xen_has_pv = true, xen_has_hvm = true;
+
+static unsigned int nr_cpus;
+static enum rtm_behaviour {
+    RTM_UD,
+    RTM_OK,
+    RTM_ABORT,
+} rtm_behaviour;
+
+/*
+ * Test a specific TSX MSR for consistency across the system, taking into
+ * account whether it ought to be accessable or not.
+ *
+ * We can't query offline CPUs, so skip those if encountered.  We don't care
+ * particularly for the exact MSR value, but we do care that it is the same
+ * everywhere.
+ */
+static void test_tsx_msr_consistency(unsigned int msr, bool accessable)
+{
+    uint64_t cpu0_val = ~0;
+
+    for ( unsigned int cpu = 0; cpu < nr_cpus; ++cpu )
+    {
+        xc_resource_entry_t ent = {
+            .u.cmd = XEN_RESOURCE_OP_MSR_READ,
+            .idx = msr,
+        };
+        xc_resource_op_t op = {
+            .cpu = cpu,
+            .entries = &ent,
+            .nr_entries = 1,
+        };
+        int rc = xc_resource_op(xch, 1, &op);
+
+        if ( rc < 0 )
+        {
+            /* Don't emit a message for offline CPUs */
+            if ( errno != ENODEV )
+                fail("  xc_resource_op() for CPU%u failed: rc %d, errno %d - %s\n",
+                     cpu, rc, errno, strerror(errno));
+            continue;
+        }
+
+        if ( accessable )
+        {
+            if ( rc != 1 )
+            {
+                fail("  Expected 1 result, got %u\n", rc);
+                continue;
+            }
+            if ( ent.u.ret != 0 )
+            {
+                fail("  Expected ok, got %d\n", ent.u.ret);
+                continue;
+            }
+        }
+        else
+        {
+            if ( rc != 0 )
+                fail("  Expected 0 results, got %u\n", rc);
+            else if ( ent.u.ret != -EPERM )
+                fail("  Expected -EPERM, got %d\n", ent.u.ret);
+            continue;
+        }
+
+        if ( cpu == 0 )
+        {
+            cpu0_val = ent.val;
+            printf("  CPU0 val %#"PRIx64"\n", cpu0_val);
+        }
+        else if ( ent.val != cpu0_val )
+            fail("  CPU%u val %#"PRIx64" differes from CPU0 %#"PRIx64"\n",
+                 cpu, ent.val, cpu0_val);
+    }
+}
+
+/*
+ * Check all TSX MSRs, and in particular that their accessibility matches what
+ * is expressed in the host CPU policy.
+ */
+static void test_tsx_msrs(void)
+{
+    printf("Testing MSR_TSX_FORCE_ABORT consistency\n");
+    test_tsx_msr_consistency(
+        MSR_TSX_FORCE_ABORT, host.cpuid.feat.tsx_force_abort);
+
+    printf("Testing MSR_TSX_CTRL consistency\n");
+    test_tsx_msr_consistency(
+        MSR_TSX_CTRL, host.msr.arch_caps.tsx_ctrl);
+}
+
+/*
+ * Probe for how RTM behaves, deliberately not inspecting CPUID.
+ * Distinguishes between "no support at all" (i.e. XBEGIN suffers #UD),
+ * working ok, and appearing to always abort.
+ */
+static enum rtm_behaviour probe_rtm_behaviour(void)
+{
+    for ( int i = 0; i < 1000; ++i )
+    {
+        /*
+         * Opencoding the RTM infrastructure from immintrin.h, because we
+         * still support older versions of GCC.  ALso so we can include #UD
+         * detection logic.
+         */
+#define XBEGIN_STARTED -1
+#define XBEGIN_UD      -2
+        unsigned int status = XBEGIN_STARTED;
+
+        asm volatile (".Lxbegin: .byte 0xc7,0xf8,0,0,0,0" /* XBEGIN 1f; 1: */
+                      : "+a" (status) :: "memory");
+        if ( status == XBEGIN_STARTED )
+        {
+            asm volatile (".byte 0x0f,0x01,0xd5" ::: "memory"); /* XEND */
+            return RTM_OK;
+        }
+        else if ( status == XBEGIN_UD )
+            return RTM_UD;
+    }
+
+    return RTM_ABORT;
+}
+
+static struct sigaction old_sigill;
+
+static void sigill_handler(int signo, siginfo_t *info, void *extra)
+{
+    extern char xbegin_label[] asm(".Lxbegin");
+
+    if ( info->si_addr == xbegin_label ||
+         memcmp(info->si_addr, "\xc7\xf8\x00\x00\x00\x00", 6) == 0 )
+    {
+        ucontext_t *context = extra;
+
+        /*
+         * Found the XBEGIN instruction.  Step over it, and update `status` to
+         * signal #UD.
+         */
+#ifdef __x86_64__
+        context->uc_mcontext.gregs[REG_RIP] += 6;
+        context->uc_mcontext.gregs[REG_RAX] = XBEGIN_UD;
+#else
+        context->uc_mcontext.gregs[REG_EIP] += 6;
+        context->uc_mcontext.gregs[REG_EAX] = XBEGIN_UD;
+#endif
+    }
+    else
+    {
+        /*
+         * Not the SIGILL we're looking for...  Restore the old handler and
+         * try again.  Will likely coredump as a result.
+         */
+        sigaction(SIGILL, &old_sigill, NULL);
+    }
+}
+
+static void test_rtm_behaviour(void)
+{
+    struct sigaction new_sigill = {
+        .sa_flags = SA_SIGINFO,
+        .sa_sigaction = sigill_handler,
+    };
+    const char *str;
+
+    printf("Testing RTM behaviour\n");
+
+    /*
+     * Install a custom SIGILL handler while probing for RTM behaviour, as the
+     * XBEGIN instruction might suffer #UD.
+     */
+    sigaction(SIGILL, &new_sigill, &old_sigill);
+    rtm_behaviour = probe_rtm_behaviour();
+    sigaction(SIGILL, &old_sigill, NULL);
+
+    switch ( rtm_behaviour )
+    {
+    case RTM_UD:    str = "#UD";   break;
+    case RTM_OK:    str = "OK";    break;
+    case RTM_ABORT: str = "Abort"; break;
+    default:        str = NULL;    break;
+    }
+
+    if ( str )
+        printf("  Got %s\n", str);
+    else
+        return fail("  Got unexpected behaviour %d\n", rtm_behaviour);
+
+    if ( host.cpuid.feat.rtm )
+    {
+        if ( rtm_behaviour == RTM_UD )
+            fail("  Host reports RTM, but appears unavailable\n");
+    }
+    else
+    {
+        if ( rtm_behaviour != RTM_UD )
+            fail("  Host reports no RTM, but appears available\n");
+    }
+}
+
+static void dump_tsx_details(const struct xc_cpu_policy *p, const char *pref)
+{
+    printf("  %s RTM %u, HLE %u, TSX_FORCE_ABORT %u, RTM_ALWAYS_ABORT %u, TSX_CTRL %u\n",
+           pref,
+           p->cpuid.feat.rtm,
+           p->cpuid.feat.hle,
+           p->cpuid.feat.tsx_force_abort,
+           p->cpuid.feat.rtm_always_abort,
+           p->msr.arch_caps.tsx_ctrl
+        );
+}
+
+/*
+ * Sanity test various invariants we expect in the default/max policies.
+ */
+static void test_guest_policies(const struct xc_cpu_policy *max,
+                                const struct xc_cpu_policy *def)
+{
+    const struct cpuid_policy *cm = &max->cpuid;
+    const struct cpuid_policy *cd = &def->cpuid;
+    const struct msr_policy *mm = &max->msr;
+    const struct msr_policy *md = &def->msr;
+
+    dump_tsx_details(max, "Max:");
+    dump_tsx_details(def, "Def:");
+
+    if ( ((cm->feat.raw[0].d | cd->feat.raw[0].d) &
+          (bitmaskof(X86_FEATURE_TSX_FORCE_ABORT) |
+           bitmaskof(X86_FEATURE_RTM_ALWAYS_ABORT))) ||
+         ((mm->arch_caps.raw | md->arch_caps.raw) & ARCH_CAPS_TSX_CTRL) )
+        fail("  Xen-only TSX controls offered to guest\n");
+
+    switch ( rtm_behaviour )
+    {
+    case RTM_UD:
+        if ( (cm->feat.raw[0].b | cd->feat.raw[0].b) &
+             (bitmaskof(X86_FEATURE_HLE) | bitmaskof(X86_FEATURE_RTM)) )
+             fail("  HLE/RTM offered to guests despite not being available\n");
+        break;
+
+    case RTM_ABORT:
+        if ( cd->feat.raw[0].b &
+             (bitmaskof(X86_FEATURE_HLE) | bitmaskof(X86_FEATURE_RTM)) )
+             fail("  HLE/RTM offered to guests by default despite not being usable\n");
+        break;
+
+    case RTM_OK:
+        if ( !cm->feat.rtm || !cd->feat.rtm )
+             fail("  RTM not offered to guests despite being available\n");
+        break;
+    }
+
+    if ( cd->feat.hle )
+        fail("  Fail: HLE offered in default policy\n");
+}
+
+static void test_def_max_policies(void)
+{
+    if ( xen_has_pv )
+    {
+        printf("Testing PV default/max policies\n");
+        test_guest_policies(&pv_max, &pv_default);
+    }
+
+    if ( xen_has_hvm )
+    {
+        printf("Testing HVM default/max policies\n");
+        test_guest_policies(&hvm_max, &hvm_default);
+    }
+}
+
+static void test_guest(struct xen_domctl_createdomain *c)
+{
+    uint32_t domid = 0;
+    int rc;
+
+    rc = xc_domain_create(xch, &domid, c);
+    if ( rc )
+        return fail("  Domain create failure: %d - %s\n",
+                    errno, strerror(errno));
+
+    printf("  Created d%u\n", domid);
+
+    rc = xc_cpu_policy_get_domain(xch, domid, &guest_policy);
+    if ( rc )
+    {
+        fail("  Failed to obtain domain policy: %d - %s\n",
+             errno, strerror(errno));
+        goto out;
+    }
+
+    dump_tsx_details(&guest_policy, "Cur:");
+
+    /*
+     * Check defaults given to the guest.
+     */
+    if ( guest_policy.cpuid.feat.rtm != (rtm_behaviour == RTM_OK) )
+        fail("  RTM %u in guest, despite rtm behaviour\n",
+             guest_policy.cpuid.feat.rtm);
+
+    if ( guest_policy.cpuid.feat.hle ||
+         guest_policy.cpuid.feat.tsx_force_abort ||
+         guest_policy.cpuid.feat.rtm_always_abort ||
+         guest_policy.msr.arch_caps.tsx_ctrl )
+        fail("  Unexpected features advertised\n");
+
+ out:
+    rc = xc_domain_destroy(xch, domid);
+    if ( rc )
+        fail("  Failed to destroy domain: %d - %s\n",
+             errno, strerror(errno));
+}
+
+static void test_guests(void)
+{
+    if ( xen_has_pv )
+    {
+        struct xen_domctl_createdomain c = {
+            .max_vcpus = 1,
+            .max_grant_frames = 1,
+        };
+
+        printf("Testing PV guest\n");
+        test_guest(&c);
+    }
+
+    if ( xen_has_hvm )
+    {
+        struct xen_domctl_createdomain c = {
+            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+            .max_vcpus = 1,
+            .max_grant_frames = 1,
+            .arch = {
+                .emulation_flags = XEN_X86_EMU_LAPIC,
+            },
+        };
+
+        printf("Testing HVM guest\n");
+        test_guest(&c);
+    }
+}
+
+/* Obtain some general data, then run the tests. */
+static void test_tsx(void)
+{
+    int rc;
+    xc_physinfo_t info = {};
+
+    /* Read all policies except raw. */
+    for ( int i = XEN_SYSCTL_cpu_policy_host;
+          i <= XEN_SYSCTL_cpu_policy_hvm_default; ++i )
+    {
+        rc = xc_cpu_policy_get_system(xch, i, &policies[i]);
+
+        if ( rc == -1 && errno == EOPNOTSUPP )
+        {
+            /*
+             * Use EOPNOTSUPP to spot Xen missing CONFIG_{PV,HVM}, and adjust
+             * later testing accordingly.
+             */
+            switch ( i )
+            {
+            case XEN_SYSCTL_cpu_policy_pv_max:
+            case XEN_SYSCTL_cpu_policy_pv_default:
+                if ( xen_has_pv )
+                    printf("  Xen doesn't support PV\n");
+                xen_has_pv = false;
+                continue;
+
+            case XEN_SYSCTL_cpu_policy_hvm_max:
+            case XEN_SYSCTL_cpu_policy_hvm_default:
+                if ( xen_has_hvm )
+                    printf("  Xen doesn't support HVM\n");
+                xen_has_hvm = false;
+                continue;
+            }
+        }
+        if ( rc )
+            return fail("Failed to obtain policy[%u]: %d - %s\n",
+                        i, errno, strerror(errno));
+    }
+
+    rc = xc_physinfo(xch, &info);
+    if ( rc )
+        return fail("Failed to obtain physinfo: %d - %s\n",
+                    errno, strerror(errno));
+
+    nr_cpus = info.max_cpu_id + 1;
+    printf("  Got %u CPUs\n", nr_cpus);
+
+    test_tsx_msrs();
+    test_rtm_behaviour();
+    test_def_max_policies();
+    test_guests();
+}
+
+int main(int argc, char **argv)
+{
+    printf("TSX tests\n");
+
+    xch = xc_interface_open(NULL, NULL, 0);
+
+    if ( !xch )
+        err(1, "xc_interface_open");
+
+    test_tsx();
+
+    return !!nr_failures;
+}
-- 
2.11.0


