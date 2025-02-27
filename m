Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF56A47287
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897477.1306207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTay-0007Ob-KH; Thu, 27 Feb 2025 02:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897477.1306207; Thu, 27 Feb 2025 02:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTay-0007KI-Bv; Thu, 27 Feb 2025 02:25:52 +0000
Received: by outflank-mailman (input) for mailman id 897477;
 Thu, 27 Feb 2025 02:25:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m1FD=VS=flex--seanjc.bounces.google.com=3rcu_ZwYKCYg4qmzvos00sxq.o0y9qz-pq7qxxu454.9qz130vqo5.03s@srs-se1.protection.inumbo.net>)
 id 1tnTUl-0005qU-SQ
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:27 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4446e037-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:27 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-22112e86501so7658465ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:27 -0800 (PST)
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
X-Inumbo-ID: 4446e037-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622766; x=1741227566; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UfxMQF/rYWh5wJy03aYqaPrcV7f4BOaa6HmKd5c/EfY=;
        b=EFMtJS4FYa7sIRalJDUuePo0Imt2KKiYnomvPyDuhLo3o+a8JQUg665986TocuBNmd
         Xd8wFAaXyLujDLDnHGbBMav6mjooMvDq1Gz8ADTWKCy33RCxztTp/7lfQrrEpvU5VdR+
         H/QGfXbxNnuVU87qns3fZt7fISZiiIztnnDUnNMUaVSPrVDrej30qoJy0IUY7vupKOA9
         yibf23VW55iU1QJbDTOy0PT+GZYGnXcgEDd59Ofe01Tb7aQNbZSAXigstG8CK2IYnGzM
         aBm2wcXKvX6j72Y7SN0DthAlq+P+ex69KRg4JRzLa6PjNOGz1sslS4fOpcj33r5LMaJ3
         TCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622766; x=1741227566;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfxMQF/rYWh5wJy03aYqaPrcV7f4BOaa6HmKd5c/EfY=;
        b=LcAeien9mQe3Hr/M1n1FAnnhj94kt6YlnJ28j3R/TWU0ngv2Kn2dtcvX1RT7bYiQcu
         womvNbSLwPJyM/HIDHY/7PV0lEJ2EjMMcUVRZJ2t3sj5ZyJgxlIvL2oENLk0dtjuK497
         AVeEywGn0mbA00KLrj8UG1a28WpOF6CmoNZEKPcjYbQYbOwloYpABHbnHjj9LOvjIkqL
         bKdtYw0BNqirU4Vo4UUGpcaIx7OFzpi+9uKLPGAUy4HJF8nhFhjft9MroL7vEanDgmvC
         u3M6db0wNYmJj0wRyOlVXfigu/dWLogdip3v6hgWH7NZ38q8qqUH5ggkiJcFZ+L40hvR
         qb1A==
X-Forwarded-Encrypted: i=1; AJvYcCVKs91PEu47u6OVUoxFOSgrsbKDz12SBoxuTv0SgKPF+dlI80Wdw3nGgp1juvIeQmFX4h9+Vu+N5h8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxvirgjXl6y1d4oGIfxnNBfv6PtXsZoFhsViOz32MgSaF1oGUE
	W5DaJq0ITiBdJjSqShh7/jWIIMrZecyqpiWcsBb61lgHK3AOWghyq9mJsq2NW5ytZhEzUv2/m4a
	PkA==
X-Google-Smtp-Source: AGHT+IE7Xj/t7ND33DY7WpQVYCStd1wMVi/xBc5OTLhEqC2e0MCFeJOTyP9t5m80ApVOgGC3SmRws/tVvjE=
X-Received: from pjuw3.prod.google.com ([2002:a17:90a:d603:b0:2fc:2b27:9d35])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec8c:b0:21f:3e2d:7d2e
 with SMTP id d9443c01a7336-2219ffb8b65mr337766155ad.27.1740622765716; Wed, 26
 Feb 2025 18:19:25 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:29 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-14-seanjc@google.com>
Subject: [PATCH v2 13/38] x86/paravirt: Move handling of unstable PV clocks
 into paravirt_set_sched_clock()
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

Move the handling of unstable PV clocks, of which kvmclock is the only
example, into paravirt_set_sched_clock().  This will allow modifying
paravirt_set_sched_clock() to keep using the TSC for sched_clock in
certain scenarios without unintentionally marking the TSC-based clock as
unstable.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/paravirt.h | 7 ++++++-
 arch/x86/kernel/kvmclock.c      | 5 +----
 arch/x86/kernel/paravirt.c      | 6 +++++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 041aff51eb50..cfceabd5f7e1 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -28,7 +28,12 @@ u64 dummy_sched_clock(void);
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
 
-void paravirt_set_sched_clock(u64 (*func)(void));
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable);
+
+static inline void paravirt_set_sched_clock(u64 (*func)(void))
+{
+	__paravirt_set_sched_clock(func, true);
+}
 
 static __always_inline u64 paravirt_sched_clock(void)
 {
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 223e5297f5ee..aae6fba21331 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -12,7 +12,6 @@
 #include <linux/hardirq.h>
 #include <linux/cpuhotplug.h>
 #include <linux/sched.h>
-#include <linux/sched/clock.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/set_memory.h>
@@ -93,10 +92,8 @@ static noinstr u64 kvm_sched_clock_read(void)
 
 static inline void kvm_sched_clock_init(bool stable)
 {
-	if (!stable)
-		clear_sched_clock_stable();
 	kvm_sched_clock_offset = kvm_clock_read();
-	paravirt_set_sched_clock(kvm_sched_clock_read);
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 1ccaa3397a67..55c819673a9d 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -14,6 +14,7 @@
 #include <linux/highmem.h>
 #include <linux/kprobes.h>
 #include <linux/pgtable.h>
+#include <linux/sched/clock.h>
 #include <linux/static_call.h>
 
 #include <asm/bug.h>
@@ -85,8 +86,11 @@ static u64 native_steal_clock(int cpu)
 DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 
-void paravirt_set_sched_clock(u64 (*func)(void))
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable)
 {
+	if (!stable)
+		clear_sched_clock_stable();
+
 	static_call_update(pv_sched_clock, func);
 }
 
-- 
2.48.1.711.g2feabab25a-goog


