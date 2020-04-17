Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC6D1AD6DD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 09:06:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPL4c-0001gF-Lz; Fri, 17 Apr 2020 07:06:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sm3=6B=amazon.de=prvs=369b905e4=wipawel@srs-us1.protection.inumbo.net>)
 id 1jPL4b-0001g5-9W
 for xen-devel@lists.xen.org; Fri, 17 Apr 2020 07:06:01 +0000
X-Inumbo-ID: e2279250-8079-11ea-9e09-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2279250-8079-11ea-9e09-bc764e2007e4;
 Fri, 17 Apr 2020 07:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587107156; x=1618643156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=FGq21dZDqlyAQXJxV2xTF6vsjs2rXeIGTVUXZZqRLdA=;
 b=ptbhjimgkFbgqPndDPQ8IHF1jFoLh7ooko+wBKsclEHQr+yHTPPJ50rN
 2L/csHrXyzFBcE16TaKDOb31eBXmmKS2QkhJni3UnlqNli044tuP4dDSZ
 HbX+ir3UBBf1VGyblaqdU5gzrtwhAcwNLSMtw0R0fdLBTlD9nxBXrGDOC U=;
IronPort-SDR: rjJzvLVqtRl3y398/t9DcG0j2Zl+/QEbvLLjmG61nbiR07845Oq27V1MnQL0HXGPPxmBq1ysn2
 LVWhC2MEWvZw==
X-IronPort-AV: E=Sophos;i="5.72,394,1580774400"; d="scan'208";a="26253747"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 17 Apr 2020 07:05:43 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id BD700A225C; Fri, 17 Apr 2020 07:05:42 +0000 (UTC)
Received: from EX13D02EUC002.ant.amazon.com (10.43.164.14) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:42 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D02EUC002.ant.amazon.com (10.43.164.14) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:41 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Apr 2020 07:05:39 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 1/6] time: introduce time managment in xtf
Date: Fri, 17 Apr 2020 07:05:23 +0000
Message-ID: <20200417070528.48329-2-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200417070528.48329-1-wipawel@amazon.de>
References: <20200417070528.48329-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, paul@xen.org, semelpaul@gmail.com,
 andrew.cooper3@citrix.com, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 nmanthey@amazon.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Semel <phentex@amazon.de>

This commit introduces basic time management functionality.
For synchronization purpose, we do really want to be able to
"control" time.

Add since_boot_time() that gets the time in nanoseconds from the
moment the VM has booted.

Signed-off-by: Paul Semel <phentex@amazon.de>
Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 build/files.mk     |  1 +
 common/time.c      | 85 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/xtf/lib.h  | 18 ++++++++++++
 include/xtf/time.h | 28 ++++++++++++++++++
 4 files changed, 132 insertions(+)
 create mode 100644 common/time.c
 create mode 100644 include/xtf/time.h

diff --git a/build/files.mk b/build/files.mk
index dfa27e4..6286317 100644
--- a/build/files.mk
+++ b/build/files.mk
@@ -16,6 +16,7 @@ obj-perarch += $(ROOT)/common/libc/vsnprintf.o
 obj-perarch += $(ROOT)/common/report.o
 obj-perarch += $(ROOT)/common/setup.o
 obj-perarch += $(ROOT)/common/xenbus.o
+obj-perarch += $(ROOT)/common/time.o
 
 obj-perenv += $(ROOT)/arch/x86/decode.o
 obj-perenv += $(ROOT)/arch/x86/desc.o
diff --git a/common/time.c b/common/time.c
new file mode 100644
index 0000000..b9a6531
--- /dev/null
+++ b/common/time.c
@@ -0,0 +1,85 @@
+#include <xtf/types.h>
+#include <xtf/traps.h>
+#include <xtf/time.h>
+#include <xtf/atomic.h>
+
+/* This function was taken from mini-os source code */
+/* It returns ((delta << shift) * mul_frac) >> 32 */
+static inline uint64_t scale_delta(uint64_t delta, uint32_t mul_frac, int shift)
+{
+    uint64_t product;
+#ifdef __i386__
+    uint32_t tmp1, tmp2;
+#endif
+
+    if ( shift < 0 )
+        delta >>= -shift;
+    else
+        delta <<= shift;
+
+#ifdef __i386__
+    __asm__ (
+            "mul  %5       ; "
+            "mov  %4,%%eax ; "
+            "mov  %%edx,%4 ; "
+            "mul  %5       ; "
+            "add  %4,%%eax ; "
+            "xor  %5,%5    ; "
+            "adc  %5,%%edx ; "
+            : "=A" (product), "=r" (tmp1), "=r" (tmp2)
+            : "a" ((uint32_t)delta), "1" ((uint32_t)(delta >> 32)), "2" (mul_frac) );
+#else
+    __asm__ (
+            "mul %%rdx ; shrd $32,%%rdx,%%rax"
+            : "=a" (product) : "0" (delta), "d" ((uint64_t)mul_frac) );
+#endif
+
+    return product;
+}
+
+
+#if defined(__i386__)
+uint32_t since_boot_time(void)
+#else
+uint64_t since_boot_time(void)
+#endif
+{
+    unsigned long old_tsc, tsc;
+#if defined(__i386__)
+    uint32_t system_time;
+#else
+    uint64_t system_time;
+#endif
+    uint32_t ver1, ver2;
+
+    do {
+        do {
+            ver1 = shared_info.vcpu_info[0].time.version;
+            smp_rmb();
+        } while ( (ver1 & 1) == 1 );
+
+        system_time = shared_info.vcpu_info[0].time.system_time;
+        old_tsc = shared_info.vcpu_info[0].time.tsc_timestamp;
+
+        smp_rmb();
+        tsc = rdtscp();
+        ver2 = ACCESS_ONCE(shared_info.vcpu_info[0].time.version);
+        smp_rmb();
+    } while ( ver1 != ver2 );
+
+    system_time += scale_delta(tsc - old_tsc,
+                               shared_info.vcpu_info[0].time.tsc_to_system_mul,
+                               shared_info.vcpu_info[0].time.tsc_shift);
+
+    return system_time;
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
diff --git a/include/xtf/lib.h b/include/xtf/lib.h
index 3348464..c3eb10c 100644
--- a/include/xtf/lib.h
+++ b/include/xtf/lib.h
@@ -54,6 +54,24 @@ void __noreturn panic(const char *fmt, ...) __printf(1, 2);
 
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
 
+#ifdef __GCC_ASM_FLAG_OUTPUTS__
+# define ASM_FLAG_OUT(yes, no) yes
+#else
+# define ASM_FLAG_OUT(yes, no) no
+#endif
+
+static inline uint64_t rdtsc (void) {
+  unsigned int low, high;
+  asm volatile ("rdtsc" : "=a" (low), "=d" (high));
+  return ((uint64_t) high << 32) | low;
+}
+
+static inline uint64_t rdtscp (void) {
+  unsigned int low, high;
+  asm volatile ("rdtscp" : "=a" (low), "=d" (high) :: "ecx");
+  return ((uint64_t) high << 32) | low;
+}
+
 void heapsort(void *base, size_t nmemb, size_t size,
               int (*compar)(const void *, const void *),
               void (*swap)(void *, void *));
diff --git a/include/xtf/time.h b/include/xtf/time.h
new file mode 100644
index 0000000..e30d109
--- /dev/null
+++ b/include/xtf/time.h
@@ -0,0 +1,28 @@
+/**
+ * @file include/xtf/time.h
+ *
+ * Time management
+ */
+#ifndef XTF_TIME_H
+# define XTF_TIME_H
+
+#include <xtf/types.h>
+
+#if defined(__i386__)
+/* Time from boot in nanoseconds */
+uint32_t since_boot_time(void);
+#else
+uint64_t since_boot_time(void);
+#endif
+
+#endif /* XTF_TIME_H */
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
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




