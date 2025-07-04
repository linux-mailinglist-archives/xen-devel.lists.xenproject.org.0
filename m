Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700EAF986A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 18:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033543.1406907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMj-00062x-QG; Fri, 04 Jul 2025 16:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033543.1406907; Fri, 04 Jul 2025 16:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMj-0005tv-JL; Fri, 04 Jul 2025 16:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1033543;
 Fri, 04 Jul 2025 16:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXjMh-0005FA-TG
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 16:34:19 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baaa5a50-58f4-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 18:34:17 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so1459899f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 09:34:17 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9989fcesm59199345e9.16.2025.07.04.09.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:34:16 -0700 (PDT)
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
X-Inumbo-ID: baaa5a50-58f4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751646857; x=1752251657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEIMY77XlHNrZg7VYSte2iM/TK0ot478AJ0j8XeENak=;
        b=KGeXL3Oy6ahDyaHm/mMLRB46/hL9/sX+IPgLUJl/uePqqHceGCzx2DnF2celfh99go
         B4lghzIZ+iaksAD4gXnVi8oaK+apXcPytpZqA36Xft8NDVNeLOmKfGW89RixLWsiSA2q
         EHHU6XbVU28AwjwM9+d4UMWUsO+L+637ZHIVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646857; x=1752251657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEIMY77XlHNrZg7VYSte2iM/TK0ot478AJ0j8XeENak=;
        b=ltmKJb40iK8eVYkSYLiTESNM+KxWofubrOJSdlzDy3dPWbvU2Hks0DtzSAHA9L2wWv
         LNEOAU5jP2Akkerw9XIm60mT+sGE4J1t2w9VS62TuESZ0Uc8XBq+TzsWCpW8v/A3m3Vm
         r6+Nt2NYHPZXHyep+Hljxgqy2QbOc93boNDWTpkC58sNMnpDuwVelckbaDn8Jnrq2Ujp
         7QpeaqDBGPDGHlolkW5vTQRej6JN9NBlYk4NHfkDt3xSQjTLoQ/uPmkZO7kB3jq8v936
         1P0baGR0lB2pjgAS3IlQ82IUYyRUaq2zSHD9NG3d2YflUgC2ooVxXTphibEryFFVocP8
         9hhg==
X-Gm-Message-State: AOJu0YzzWQUvWZvdWfIev23AP8VqEUKPy9ZTY7LMCrN+N6mc9YdEaE8G
	qt3gFWb1eX8w0aBB3bi4UQxNMDhUgJY8YAkZPDa6J7it8VxrK/XMyMOB5g54hZgyakZC6e7F+n9
	+k+QGUhpW1Q==
X-Gm-Gg: ASbGnctcvujItHbTXRzGrer6G9M9f/idX5nIljgE8o2xm8/alRfS62RUk1zzco/fdNS
	FFK1vxlvexephH8bIqiu8oVv/ztSlop1m+/SZO66Ustt+sON5gn/HuDLyuFtMZ88+qr4hHnpA+f
	IhnjrJT6an11zctR/HFaavoifwtsAuceVIHNAYhyd71sr0yDHpoaJsN34HDoKtDVqEXiikQ+jSR
	svEMl8biwwYfu4/+y96g/SnrTnNiHNmHoXSbXKX84q9gSTifPeh8hxoEzAXgOR+8ip8myw/pZRJ
	vw6CJwNO8hiicPH4DrKP5k4KZTPHkGTWmcGpHgz/Rfbft1LzfX2AfCU2KAb0Ubt6/fgW3ytUkGL
	z71cT9ciqWq/jEkBN8zucjItRD6URK2ptSE0=
X-Google-Smtp-Source: AGHT+IG45D0AN4G/SGXixEV06FQbvAvWSyVuh3ig7WEuWYHAvIREVbV++swpxV44w5A0x0m0Gzzyyg==
X-Received: by 2002:a05:6000:2a86:b0:3b2:e0ad:758c with SMTP id ffacd0b85a97d-3b492584666mr2266089f8f.3.1751646856779;
        Fri, 04 Jul 2025 09:34:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 5/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
Date: Fri,  4 Jul 2025 17:34:09 +0100
Message-Id: <20250704163410.1412367-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
References: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
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

v2:
 * Fix cmpxchg() expression.
 * Use BUILD_BUG_ON()s to check opencoding of in_mwait.

TODO: We want to introduce try_cmpxchg() which is better at the C and code-gen
level.
---
 xen/arch/x86/acpi/cpu_idle.c       | 20 ++++++++++++-
 xen/arch/x86/include/asm/hardirq.h | 14 ++++++++-
 xen/arch/x86/include/asm/softirq.h | 48 ++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 4f69df5a7438..c5d7a6c6fe2a 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -443,7 +443,21 @@ __initcall(cpu_idle_key_init);
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
+     * simply not advertising ourselves as being in_mwait.
+     */
+    alternative_io("movb $1, %[in_mwait]",
+                   "", X86_BUG_MONITOR,
+                   [in_mwait] "=m" (stat->in_mwait));
 
     monitor(this_softirq_pending, 0, 0);
 
@@ -455,6 +469,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
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
index e4b194f069fb..55b65c9747b1 100644
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
@@ -9,4 +11,50 @@
 #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
 #define NR_ARCH_SOFTIRQS       5
 
+/*
+ * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
+ * skipped, false if the IPI cannot be skipped.
+ *
+ * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
+ * set softirq @nr while also observing in_mwait in a race-free way.
+ */
+static always_inline bool arch_set_softirq(unsigned int nr, unsigned int cpu)
+{
+    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
+    uint64_t prev, old, new;
+    unsigned int softirq = 1U << nr;
+
+    old = ACCESS_ONCE(*ptr);
+
+    for ( ;; )
+    {
+        if ( old & softirq )
+            /* Softirq already pending, nothing to do. */
+            return true;
+
+        new = old | softirq;
+
+        prev = cmpxchg(ptr, old, new);
+        if ( prev == old )
+            break;
+
+        old = prev;
+    }
+
+    /*
+     * We have caused the softirq to become pending.  If in_mwait was set, the
+     * target CPU will notice the modification and act on it.
+     *
+     * We can't access the in_mwait field nicely, so use some BUILD_BUG_ON()'s
+     * to cross-check the (1UL << 32) opencoding.
+     */
+    BUILD_BUG_ON(sizeof(irq_stat[0].softirq_mwait_raw) != 8);
+    BUILD_BUG_ON((offsetof(irq_cpustat_t, in_mwait) -
+                  offsetof(irq_cpustat_t, softirq_mwait_raw)) != 4);
+
+    return new & (1UL << 32) /* in_mwait */;
+
+}
+#define arch_set_softirq arch_set_softirq
+
 #endif /* __ASM_SOFTIRQ_H__ */
-- 
2.39.5


