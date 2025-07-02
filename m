Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D440AF5B5D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031266.1405069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeU-0000F4-OD; Wed, 02 Jul 2025 14:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031266.1405069; Wed, 02 Jul 2025 14:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeU-00008X-Gt; Wed, 02 Jul 2025 14:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1031266;
 Wed, 02 Jul 2025 14:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T1d=ZP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWyeS-0007qI-CI
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:41:32 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4781bba-5752-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:41:30 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso3846355f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:41:30 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad20bsm230946905e9.20.2025.07.02.07.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 07:41:29 -0700 (PDT)
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
X-Inumbo-ID: a4781bba-5752-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751467290; x=1752072090; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzppBlV46dVW+8Pf+ysgv4D4sf/8Ax0fEdwCrQArIh0=;
        b=NZzZdyVMLDAPd4irL91kHxDSRaDcr+FMxg/fBZ3gi8lLIcXO6Ow0IoRFhUK5nf2KfD
         Paxtg6Aqmk5gU8QDVHR09oCXF3jOI+dhCqSZNj8XJlV6W/N/m4xw/P+l0coLV+Yb05Ah
         Gy0T1bZqNfKUXEa3tFxqiGjAnr+E0G0UsSt44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467290; x=1752072090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzppBlV46dVW+8Pf+ysgv4D4sf/8Ax0fEdwCrQArIh0=;
        b=Xip9QuPpbYJvaMIqp8urRTvRdGP3vFnIGpqx2DgZcuXEnfoj6SCEKc7IAsdyyrdTs6
         67/Zns73+Dr+Bdj6cWMImmXcGxiASXZzS39w3SU90WQRjZtMU0c0yw40pAfN76vQYam+
         c+s1RX3mjg4D9Urd4cWysXk7awNz2NfKVJNsAeV7/V110/yvu9efBP2Ya0E9m8GgNnpy
         mYIsq5H5b9cD62HXO4HG4VxpuR3TouJsYr1W2Ve+q6vxAWA5AArdPBfV/KWMhWnvElpJ
         J4vOv3pAsSpgGbfbxICG/bqBeorKyBNN/jW+25fOXBWnRVykKBUC/nPLv30M3WJSRrTJ
         yBsA==
X-Gm-Message-State: AOJu0YxV5gwsIEH5TNvPRQ/vHNZQRnCPZbST+bRmvQQQDLHvHVwBjY+J
	6NyXu/ksKR6BZGzRDCNsHe8M0PKb6m4GhidL1mDY9zf2VfUYGkDs1/6L2W1/qEvwV+vepyvgqsD
	Ui+OIU/7zsg==
X-Gm-Gg: ASbGnct2VwFye9/wt1c0wNbfkMdEfJQjP67PkMKIcsiw/4ggjsEF2/HCoVJUeQXAekM
	eJpZnXfLSlHy8sarl6dKafdwjZF4+JDnR2qRDQG3Yf40xcr0HGJtWClFNkqps2VRTQeRvFEP9So
	ebqi8npkwDVF/vvgLefZrov9I9New3FIBM9ZpYsqngirVP3Sfq7LG6k8w92NBlUyG68QncNb0KO
	8Qrz9HVngviWRTqYyMBC1rq/o1AQNeFlzNutPS0TBj7cXIOcEmh3ZJvrrosPgwGvtc+PEOQV3DL
	6y3PheFqaHywC6PWf2DHl7TcvNVrihXRbmYrmi5eL/kmz/GFypUkNMGenb7XvXIxS+q0gSbj044
	FV1//cAfMTQHdSkrd5D1Xu+WamipkoOUF0Zk=
X-Google-Smtp-Source: AGHT+IEnzXIn+0MqJayMOtG02cyaJCA2PQ9QF7Qz1u3JINoT9MnD91Uzo4J6kaGi59hHeUrD0EpjxA==
X-Received: by 2002:a5d:64c4:0:b0:3a4:e502:81e1 with SMTP id ffacd0b85a97d-3b2018c241bmr2665185f8f.52.1751467289832;
        Wed, 02 Jul 2025 07:41:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
Date: Wed,  2 Jul 2025 15:41:19 +0100
Message-Id: <20250702144121.1096448-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order elide IPIs, we must be able to identify whether a target CPU is in
MWAIT at the point it is woken up.  i.e. the store to wake it up must also
identify the state.

Create a new in_mwait variable beside __softirq_pending, so we can use a
CMPXCHG to set the softirq while also observing the status safely.  Implement
an x86 version of arch_pend_softirq() which does this.

In mwait_idle_with_hints(), advertise in_mwait, with an explanation of
precisely what it means.  X86_BUG_MONITOR can be accounted for simply by not
advertising in_mwait.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>

This is modelled after Linux's TIF_NEED_RESCHED (single bit equivelent of all
of __softirq_pending), and TIF_POLLING_NRFLAG (arch-neutral "in_mwait").

In Linux, they're both in the same flags field, which adds complexity.  In
Xen, __softirq_pending is already unsigned long for everything other than x86,
so adding an arch-neutral "in_mwait" would need wider changes.
---
 xen/arch/x86/acpi/cpu_idle.c       | 20 +++++++++++++++++-
 xen/arch/x86/include/asm/hardirq.h | 14 +++++++++++-
 xen/arch/x86/include/asm/softirq.h | 34 ++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index caa0fef0b3b1..13040ef467a0 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -439,7 +439,21 @@ __initcall(cpu_idle_key_init);
 void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
 {
     unsigned int cpu = smp_processor_id();
-    const unsigned int *this_softirq_pending = &softirq_pending(cpu);
+    irq_cpustat_t *stat = &irq_stat[cpu];
+    const unsigned int *this_softirq_pending = &stat->__softirq_pending;
+
+    /*
+     * By setting in_mwait, we promise to other CPUs that we'll notice changes
+     * to __softirq_pending without being sent an IPI.  We achieve this by
+     * either not going to sleep, or by having hardware notice on our behalf.
+     *
+     * Some errata exist where MONITOR doesn't work properly, and the
+     * workaround is to force the use of an IPI.  Cause this to happen by
+     * simply not advertising outselves as being in_mwait.
+     */
+    alternative_io("movb $1, %[in_mwait]",
+                   "", X86_BUG_MONITOR,
+                   [in_mwait] "=m" (stat->in_mwait));
 
     monitor(this_softirq_pending, 0, 0);
     smp_mb();
@@ -452,6 +466,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
         mwait(eax, ecx);
         spec_ctrl_exit_idle(info);
     }
+
+    alternative_io("movb $0, %[in_mwait]",
+                   "", X86_BUG_MONITOR,
+                   [in_mwait] "=m" (stat->in_mwait));
 }
 
 static void acpi_processor_ffh_cstate_enter(struct acpi_processor_cx *cx)
diff --git a/xen/arch/x86/include/asm/hardirq.h b/xen/arch/x86/include/asm/hardirq.h
index f3e93cc9b507..1647cff04dc8 100644
--- a/xen/arch/x86/include/asm/hardirq.h
+++ b/xen/arch/x86/include/asm/hardirq.h
@@ -5,7 +5,19 @@
 #include <xen/types.h>
 
 typedef struct {
-    unsigned int __softirq_pending;
+    /*
+     * The layout is important.  Any CPU can set bits in __softirq_pending,
+     * but in_mwait is a status bit owned by the CPU.  softirq_mwait_raw must
+     * cover both, and must be in a single cacheline.
+     */
+    union {
+        struct {
+            unsigned int __softirq_pending;
+            bool in_mwait;
+        };
+        uint64_t softirq_mwait_raw;
+    };
+
     unsigned int __local_irq_count;
     unsigned int nmi_count;
     unsigned int mce_count;
diff --git a/xen/arch/x86/include/asm/softirq.h b/xen/arch/x86/include/asm/softirq.h
index e4b194f069fb..069e5716a68d 100644
--- a/xen/arch/x86/include/asm/softirq.h
+++ b/xen/arch/x86/include/asm/softirq.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_SOFTIRQ_H__
 #define __ASM_SOFTIRQ_H__
 
+#include <asm/system.h>
+
 #define NMI_SOFTIRQ            (NR_COMMON_SOFTIRQS + 0)
 #define TIME_CALIBRATE_SOFTIRQ (NR_COMMON_SOFTIRQS + 1)
 #define VCPU_KICK_SOFTIRQ      (NR_COMMON_SOFTIRQS + 2)
@@ -9,4 +11,36 @@
 #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
 #define NR_ARCH_SOFTIRQS       5
 
+/*
+ * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
+ * skipped, false if the IPI cannot be skipped.
+ *
+ * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
+ * set softirq @nr while also observing in_mwait in a race-free way.
+ */
+static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
+{
+    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
+    uint64_t old, new;
+    unsigned int softirq = 1U << nr;
+
+    old = ACCESS_ONCE(*ptr);
+
+    do {
+        if ( old & softirq )
+            /* Softirq already pending, nothing to do. */
+            return true;
+
+        new = old | softirq;
+
+    } while ( (old = cmpxchg(ptr, old, new)) != new );
+
+    /*
+     * We have caused the softirq to become pending.  If in_mwait was set, the
+     * target CPU will notice the modification and act on it.
+     */
+    return new & (1UL << 32);
+}
+#define arch_pend_softirq arch_pend_softirq
+
 #endif /* __ASM_SOFTIRQ_H__ */
-- 
2.39.5


