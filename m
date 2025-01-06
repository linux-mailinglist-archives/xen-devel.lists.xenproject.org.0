Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27BEA0310B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865902.1277206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJn-0003EA-RD; Mon, 06 Jan 2025 20:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865902.1277206; Mon, 06 Jan 2025 20:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJn-0003Bd-Ny; Mon, 06 Jan 2025 20:03:19 +0000
Received: by outflank-mailman (input) for mailman id 865902;
 Mon, 06 Jan 2025 20:03:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH3c=T6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tUtJl-0002e6-QF
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:03:17 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 443e5027-cc69-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 21:03:16 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43635796b48so89318005e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:03:16 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366128a353sm577748615e9.42.2025.01.06.12.03.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Jan 2025 12:03:15 -0800 (PST)
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
X-Inumbo-ID: 443e5027-cc69-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736193795; x=1736798595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xubr80DdDK1TQnuEw657hT2ILmCSL1Bi/K/I0ME5hpI=;
        b=Z4/zdLcV/crESVhVabhQYBni+lmsiCCndmM88y5yJ7hPu4aaG2wSoyGhbEMxbpk7bv
         zEE2kpVpJ86cOf+1uUEaKotVnwcu2M7+GlgzUbj9JU1D9h9me+Waw+rMona96fEcvFL/
         EtSyKviN0YTJ+CIwKQqEmaIC8xQFCEVFEZxVQ2FgRBTXFYwzhKRtG1VMh5ySR0ThV8J2
         6Ap2ZJEDXsx3LetuLd5o5PfmQow3lusntyt3ku55vRWFI47XibE1Mt4ukwp8lSGpKXH8
         c8MaK875hig5itxqrhB3Av4tZC8D0QRAVk6BPYdEmkXuMu+tU4dbaJr3P0y4Bbc6QjUr
         hHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193795; x=1736798595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xubr80DdDK1TQnuEw657hT2ILmCSL1Bi/K/I0ME5hpI=;
        b=n0jfWCwazboGTCtrEOQkNjZGVPu1bKEYy9ISmsiIFZxS6DIsmRWjN/PPW7FuZU8uTh
         LTGqdWyDu+/ykwrr1k9wiJIAsDfb0FVCI+bzxNV+BuLhY7VnkbjqViJl/OAe+9KhUBNF
         WeuKsi+EN2eybn7mmQEVOgDpEuqUZLY44h5n+WirB2fm3GLUpjb76bock1+emLL+RZoO
         2B4vche5B/IgRB1UEBT1ywGoDLWA4RvXzjPYZouBZ1sCroIR8XtPZOfie7MXzOku/ntK
         mjg2ppRuuKPUnZ6jJge522e0i5L5EarrGRP/Azn84Fp4pAUx0raEvETIZ2PmI+I68bdp
         LPtg==
X-Forwarded-Encrypted: i=1; AJvYcCX/UModMtUrRF/D/9YkghwB/k2PaaE9aP0GAqrHaT5BcHh482B85TI4DKs4W1m4Fhq5MfgSz3Edp+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze56e0eCoxQNwGXUKVDXSRqcEWj0CvDUCSlqCaY9v9zzk5THq7
	GCyLG4u5T85aeJl8r0RoDR9NdjJhJK5+UKBzWR5Ab1Xy8SSQBmAfybluUNjq/MA=
X-Gm-Gg: ASbGncvvXgWxcVVDcPuPAjGDsWx3z2hGM/G2NLBbqhDKAPcwUR3FrJBTpljIuY4cHkk
	pmfNqR52f4Jp765SFXmEqznHUFQXq6iHoxpV1M716BYY8lTWbOAOBKH1kL77SdN/p2a6Rv87fgc
	J9fKEo6utw+XnqtDAa8TY4TZaRqBcP7KnVWRB6afWXONMUSsZTabVVX3Wo/lgLZ0c1Fd0qrimWw
	efYH1lnt3NrJvQzFTs8MvrRLOsN1B8ixlwursEHjJ84ccjpjAR8E+bcKoyPLlY7xxG8k0bJ/Blh
	sUyNbPlogzB07G7NYXAHNAv924CCAfs=
X-Google-Smtp-Source: AGHT+IG6hn6gQ1rEDpo0RUo5rK6HsOddWfOpcS85mXtVNMxlfkCCUdnnKaA6rQB2Q6OTZ5JLDkEevw==
X-Received: by 2002:a05:600c:1d12:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-436dc20b0c1mr4405765e9.11.1736193795597;
        Mon, 06 Jan 2025 12:03:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Alexander Graf <agraf@csgraf.de>,
	Paul Durrant <paul@xen.org>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Anthony PERARD <anthony@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>
Subject: [RFC PATCH 2/7] cpus: Introduce AccelOpsClass::get_cpus_queue()
Date: Mon,  6 Jan 2025 21:02:53 +0100
Message-ID: <20250106200258.37008-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106200258.37008-1-philmd@linaro.org>
References: <20250106200258.37008-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We want the ability to iterate over vCPUs of a specific
accelerator.  Introduce cpus_get_accel_cpus_queue() to
be used by accelerator common code, and expose the
get_cpus_queue() in AccelOpsClass, so each accelerator
can register its own queue of vCPUs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h      |  8 ++++++++
 include/system/accel-ops.h |  6 ++++++
 accel/tcg/user-exec-stub.c |  5 +++++
 cpu-common.c               | 10 ++++++++++
 system/cpus.c              |  5 +++++
 5 files changed, 34 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 48d90f50a71..5ae9bb64d6e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -591,6 +591,14 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
 typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
 extern CPUTailQ cpus_queue;
 
+/**
+ * cpus_get_accel_cpus_queue:
+ * @cpu: The vCPU to get the accelerator #CPUTailQ.
+ *
+ * Returns the #CPUTailQ associated with the accelerator of the vCPU.
+ */
+CPUTailQ *cpus_get_accel_cpus_queue(CPUState *cpu);
+
 #define first_cpu        QTAILQ_FIRST_RCU(&cpus_queue)
 #define CPU_NEXT(cpu)    QTAILQ_NEXT_RCU(cpu, node)
 #define CPU_FOREACH(cpu) QTAILQ_FOREACH_RCU(cpu, &cpus_queue, node)
diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 137fb96d444..fe59f728bfc 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -12,6 +12,7 @@
 
 #include "exec/vaddr.h"
 #include "qom/object.h"
+#include "hw/core/cpu.h"
 
 #define ACCEL_OPS_SUFFIX "-ops"
 #define TYPE_ACCEL_OPS "accel" ACCEL_OPS_SUFFIX
@@ -37,6 +38,11 @@ struct AccelOpsClass {
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
 
+    /**
+     * get_cpus_queue:
+     * Returns the #CPUTailQ maintained by this accelerator.
+     */
+    CPUTailQ *(*get_cpus_queue)(void);
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
diff --git a/accel/tcg/user-exec-stub.c b/accel/tcg/user-exec-stub.c
index 4fbe2dbdc88..cb76cec76be 100644
--- a/accel/tcg/user-exec-stub.c
+++ b/accel/tcg/user-exec-stub.c
@@ -18,6 +18,11 @@ void cpu_exec_reset_hold(CPUState *cpu)
 {
 }
 
+CPUTailQ *cpus_get_accel_cpus_queue(CPUState *cpu)
+{
+    return NULL;
+}
+
 /* User mode emulation does not support record/replay yet.  */
 
 bool replay_exception(void)
diff --git a/cpu-common.c b/cpu-common.c
index 4248b2d727e..ff8db9c7f9d 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -82,6 +82,7 @@ unsigned int cpu_list_generation_id_get(void)
 void cpu_list_add(CPUState *cpu)
 {
     static bool cpu_index_auto_assigned;
+    CPUTailQ *accel_cpus_queue = cpus_get_accel_cpus_queue(cpu);
 
     QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
     if (cpu->cpu_index == UNASSIGNED_CPU_INDEX) {
@@ -92,17 +93,26 @@ void cpu_list_add(CPUState *cpu)
         assert(!cpu_index_auto_assigned);
     }
     QTAILQ_INSERT_TAIL_RCU(&cpus_queue, cpu, node);
+    if (accel_cpus_queue) {
+        QTAILQ_INSERT_TAIL_RCU(accel_cpus_queue, cpu, node);
+    }
+
     cpu_list_generation_id++;
 }
 
 void cpu_list_remove(CPUState *cpu)
 {
+    CPUTailQ *accel_cpus_queue = cpus_get_accel_cpus_queue(cpu);
+
     QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
     if (!QTAILQ_IN_USE(cpu, node)) {
         /* there is nothing to undo since cpu_exec_init() hasn't been called */
         return;
     }
 
+    if (accel_cpus_queue) {
+        QTAILQ_REMOVE_RCU(accel_cpus_queue, cpu, node);
+    }
     QTAILQ_REMOVE_RCU(&cpus_queue, cpu, node);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu_list_generation_id++;
diff --git a/system/cpus.c b/system/cpus.c
index 99f83806c16..972df6ab061 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -209,6 +209,11 @@ void cpu_exec_reset_hold(CPUState *cpu)
     }
 }
 
+CPUTailQ *cpus_get_accel_cpus_queue(CPUState *cpu)
+{
+    return cpus_accel ? cpus_accel->get_cpus_queue() : NULL;
+}
+
 int64_t cpus_get_virtual_clock(void)
 {
     /*
-- 
2.47.1


