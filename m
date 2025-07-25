Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAEDB1209C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058066.1425821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK16-0004ou-Lt; Fri, 25 Jul 2025 15:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058066.1425821; Fri, 25 Jul 2025 15:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK16-0004aa-B1; Fri, 25 Jul 2025 15:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1058066;
 Fri, 25 Jul 2025 15:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK14-0002MW-1A
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:22 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 105dff62-6969-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 17:07:21 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so4469227a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:21 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:20 -0700 (PDT)
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
X-Inumbo-ID: 105dff62-6969-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456041; x=1754060841; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjLnX+fH5gil9prH4kBa9sfut1mpPWzceTrfUuPtI2E=;
        b=J3L8E7Nwe/vDv1Eno8H4HIQjFqjvkzyKcPF1/dX0RrROey6Sn2qV7d5+1fY8kf157Y
         ic6sI9GkduWC7z/zlWpePH40LwTTCDEzRZ0mIoAaQWvT9ZoBoxgZSy7FaZ+N4pzPtRfm
         sysa0wB0R0t1AULntltU8bbAjcHpx2mMAjKBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456041; x=1754060841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjLnX+fH5gil9prH4kBa9sfut1mpPWzceTrfUuPtI2E=;
        b=Bubk1PrPRmAvTDquI967Ff1Sy40HQszmgchqsxeZ6Nbyx/7pYOD/ZFhIpi5n21Saiq
         Lywzz7yF4AYFDPd619T6RZ2bptD8/r9896QcQOCLWmBvXXBjoSco4L//THTGyH16luqt
         PhlYgbe7FiIaS+d6DgIwsbHnbsoc5GKXrYgH8SZOE8iaQ+ROODN1qjiNjeswzmKPlgBG
         xmv3rSmdhM9rp8h6TbHQUUodAdp25GoJmyvtIw5NPlGkYA53mbd+ZtWYxE3jx2fM4f82
         fTRRvIKp5GJrYUBNhUtZ1Vxku12NBKUgIgcrwiAMDlh++eiIGYNS+1MI+jFliEjo2ArW
         guFw==
X-Gm-Message-State: AOJu0YwVg3zgPo8sEL2ntw8vBJkpWZ5ykKhRXzM0nto3BICzMaHEB9t9
	7XIeW5pd0vfytvD1UFFo7/cl+DrsSl2y7p6FeT4plSTgltbExC8I/5VE4KDcudsmleSlvK0YHvX
	yDydqjB4=
X-Gm-Gg: ASbGnct2/WGq1ZcqaJdf6bPJrWlN4rPpglI2NkBdkd42bRPU3LSBgDZR/E+2FKHs7Lx
	MzaSnFVrK1kjBQb4r2U3mRTfMdVoa3Ms3g0BDvQOO8C2kLET5StSU5TJxYTa9Yl+h88tdcHL/4a
	SciGO9dSJIP83xeKbiO8BFuMXxj3faN+E6HqC+8SmrukLioQizjPhGxAjdaDJiZHzGq0hbw4h/r
	cCSoiN+LbDbyY0UZCwK4UHr1mAGidYhVWKwNJqnY39JAu8jYAE0d0adzMXbNHOfSfMBBq0+NwVO
	raYYMg1okk8hMLPWRAf/xoYpiYnckEmBvkqPVbIqL4p+geC63/8ulli8yuYaenedvB9+4TX+Bw8
	tDN6nH879Xoflzaeq7mXEXlgOmWte4U+R6nFc
X-Google-Smtp-Source: AGHT+IF5gs9N23kxw49YxqZRd7WNq3oUh6TRbwBrMbt0qYB0CkPBnAUsIdeLbuSHuKOiQO7z9FxKvg==
X-Received: by 2002:a05:6402:1d4b:b0:612:d3cf:d1e4 with SMTP id 4fb4d7f45d1cf-614f1d042a5mr2350340a12.8.1753456040862;
        Fri, 25 Jul 2025 08:07:20 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [RFC LINUX PATCH v1 2/3] xen/{interface,xenpmu}.h: update with VPMU 0.2 from Xen
Date: Fri, 25 Jul 2025 16:06:48 +0100
Message-ID: <20250725150719.472782-2-edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 arch/x86/include/asm/xen/interface.h | 100 +++++++++++++++++++++++++++
 include/xen/interface/xenpmu.h       |  56 +++++++++++++--
 2 files changed, 152 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/xen/interface.h b/arch/x86/include/asm/xen/interface.h
index baca0b00ef76..f3667831573f 100644
--- a/arch/x86/include/asm/xen/interface.h
+++ b/arch/x86/include/asm/xen/interface.h
@@ -320,6 +320,25 @@ struct xen_pmu_regs {
 #define PMU_SAMPLE_REAL	   (1<<2) /* Sample is from realmode */
 #define PMU_SAMPLE_PV	   (1<<3) /* Sample from a PV guest */
 
+/*
+ * Architecture-specific information describing state of the guest at
+ * the time of PMU interrupt.
+ * Even if the interrupt arrived while inside Xen, this will always contain
+ * the guest's state.
+ */
+struct xen_pmu_arch_guest {
+	union {
+		/*
+		 * Processor's registers at the time of interrupt.
+		 * WO for hypervisor, RO for guests.
+		 */
+		struct xen_pmu_regs regs;
+		/* Padding for adding new registers to xen_pmu_regs in the future */
+#define XENPMU_REGS_PAD_SZ 64
+		uint8_t pad[XENPMU_REGS_PAD_SZ];
+	} r;
+};
+
 /*
  * Architecture-specific information describing state of the processor at
  * the time of PMU interrupt.
@@ -376,6 +395,87 @@ struct xen_pmu_arch {
 	} c;
 };
 
+/* Memory layout:
+ *                ╭─────────────────────╮
+ *                │ struct xen_pmu_data │
+ * ╒══════════════╧═════════════════════╧═══════════════════════╕ ◁│
+ * │ vcpu_id                                                    │  │
+ * ├────────────────────────────────────────────────────────────┤  │
+ * │ pcpu_id                                                    │  │
+ * ├────────────────────────────────────────────────────────────┤  │
+ * │ domain_id                                                  │  │
+ * ├────────────────────────────────────────────────────────────┤  │
+ * │██pad███████████████████████████████████████████████████████│  │
+ * ╞════╤═╤═══╤══════════════════╤══════════════════════════════╡  │
+ * │ pmu│ │ r │ regs             │██pad█████████████████████████│  │
+ * ├────╯ ├───╯ (xen or guest)   │██████████████████████████████│  │
+ * │      ╞══════════════════════╧══════════════════════════════╡  │
+ * │      │ pmu_flags                                           │  │
+ * │      ╞═══╤════════════════════╤════════════════════════════╡  │
+ * │      │ l │ lapic_lvtpc        │████████████████████████████│  │
+ * │      ├───╯ ███████████████████│██pad███████████████████████│  │
+ * │      │     ███████████████████│████████████████████████████│  │
+ * │      ╞═══╤═╤═══════╤═════╤════╪════╤═══════╤═══════════════╡  │
+ * │      │ c │ │       │ amd │    │    │ intel │         │█████│  │
+ * │      ├───┘ │       ╰─────╯    │    ╰───────╯         │█████│  │
+ * │      │     │ counter          │ fixed_counters       │█████│  │
+ * │      │     ├──────────────────┼──────────────────────┤█████│  │
+ * │      │     │ ctrls            │ arch_counters        │█████│  │
+ * │      │     ╞═════╤════════╤═══├──────────────────────┤█████│  │
+ * │      │     │     │ regs[] │  ┆│ global_ctrl          │█████│  │
+ * │      │     │     └────────╯  ┆├──────────────────────┤█████│  │
+ * │      │     │struct           ┆│ global_ovf_ctrl      │█████│  │
+ * │      │     │xen_pmu_cntr_pair┆├──────────────────────┤█████│  │
+ * │      │     │[counters]       ┆│ global_status        │█████│  │
+ * │      │     │                 ┆├──────────────────────┤█████│  │
+ * │      │     │                 ┆│ fixed_ctrl           │█████│  │
+ * │      │     │                 ┆├──────────────────────┤█████│  │
+ * │      │     │                 ┆│ ds_area              │█████│  │
+ * │      │     │                 ┆├──────────────────────┤█████│  │
+ * │      │     │                 ┆│ pebs_enable          │█pad█│  │
+ * │      │     │                 ┆├──────────────────────┤█████│  │
+ * │      │     │                 ▽│ debugctl             │█████│  │
+ * │      │     │██████████████████╞═══════╤════════╤═════╡█████│  │
+ * │      │     │██████████████████│       │ regs[] │ ┆[0]│█████│  │
+ * │      │     │██████████████████│       └────────╯ ┆   │█████│  │
+ * │      │     │██████████████████│ uint64_t         ┆   │█████│  │
+ * │      │     │██████████████████│ [fixed_counters] ┆   │█████│  │
+ * │      │     │██████████████████│                  ┆   │█████│  │
+ * │      │     │██████████████████│                  ┆   │█████│  │
+ * │      │     │██████████████████│ ─────────────────┆   │█████│  │
+ * │      │     │██████████████████│  struct          ┆   │█████│  │
+ * │      │     │██████████████████│ xen_pmu_cntr_pair┆   │█████│  │
+ * │      │     ╘══════════════════╡ [arch_counters]  ┆   ╞═════╡  │
+ * │      │                        │                  ┆   │     │  │
+ * │      │                        │                  ▽   │     │  │
+ * │      │                        ╘══════════════════════╛     │  │
+ * │      ╘═════════════════════════════════════════════════════╡  │
+ * ╞════════════════════════════════════════════════════════════╡  │
+ * │████████████████████████████████████████████████████████████│  │
+ * ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
+ * ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
+ * │████████████████████████████████████████████████████████████│  │
+ * │████████████████████████████████████████████████████████████│  │
+ * │██████████╭──────────────────────────────╮██████████████████│  │
+ * │██████████│ struct xen_pmu_hv_stacktrace │██████████████████│  │
+ * ╞══════════╧══════════════════════════════╧══════════════════╡  │
+ * │                              △ [stacktrace_nr-1]           │  │
+ * │                              ┆                             │  │
+ * │ stacktrace[stacktrace_nr]    ┆ [0]                         │  │
+ * ├────────────────────────────────────────────────────────────┤  │
+ * │ stacktrace_nr                                              │  │
+ * ├────────────────────────────────────────────────────────────┤  │
+ * │ guest_domain_id                                            │  │
+ * ├────────────────────────────────────────────────────────────┤  │
+ * │██pad███████████████████████████████████████████████████████│  │
+ * ╞═══════╤═╤═══╤══════════════════╤═══════════════════════════╡  │
+ * │ guest │ │ r │ regs             │██pad██████████████████████│  │
+ * ├───────╯ ├───╯ (xen or guest)   │███████████████████████████│  │
+ * │         ╞══════════════════════╧═══════════════════════════╡  │
+ * │         │██pad2████████████████████████████████████████████│  │ PAGE_SIZE
+ * ╘═════════╧══════════════════════════════════════════════════╛ ◁╯
+ */
+
 #endif	/* !__ASSEMBLY__ */
 
 /*
diff --git a/include/xen/interface/xenpmu.h b/include/xen/interface/xenpmu.h
index e2ee73d91bd6..c4dfa8e349f7 100644
--- a/include/xen/interface/xenpmu.h
+++ b/include/xen/interface/xenpmu.h
@@ -5,7 +5,7 @@
 #include "xen.h"
 
 #define XENPMU_VER_MAJ    0
-#define XENPMU_VER_MIN    1
+#define XENPMU_VER_MIN    2
 
 /*
  * ` enum neg_errnoval
@@ -22,8 +22,7 @@
 #define XENPMU_init            4
 #define XENPMU_finish          5
 #define XENPMU_lvtpc_set       6
-#define XENPMU_flush           7
-
+#define XENPMU_flush           7 /* Write cached MSR values to HW     */
 /* ` } */
 
 /* Parameters structure for HYPERVISOR_xenpmu_op call */
@@ -56,8 +55,20 @@ struct xen_pmu_params {
 /*
  * PMU features:
  * - XENPMU_FEATURE_INTEL_BTS: Intel BTS support (ignored on AMD)
+ * - XENPMU_FEATURE_IPC_ONLY:   Restrict PMCs to the most minimum set possible.
+ *                              Instructions, cycles, and ref cycles. Can be
+ *                              used to calculate instructions-per-cycle (IPC)
+ *                              (ignored on AMD).
+ * - XENPMU_FEATURE_ARCH_ONLY:  Restrict PMCs to the Intel Pre-Defined
+ *                              Architectural Performance Events exposed by
+ *                              cpuid and listed in the Intel developer's manual
+ *                              (ignored on AMD).
+ * - XENPMU_FEATURE_HV_STACKTRACE: Hypervisor stacktraces (when compiled with frame pointers)
  */
-#define XENPMU_FEATURE_INTEL_BTS  1
+#define XENPMU_FEATURE_INTEL_BTS  (1<<0)
+#define XENPMU_FEATURE_IPC_ONLY   (1<<1)
+#define XENPMU_FEATURE_ARCH_ONLY  (1<<2)
+#define XENPMU_FEATURE_HV_STACKTRACE (1<<3)
 
 /*
  * Shared PMU data between hypervisor and PV(H) domains.
@@ -67,6 +78,9 @@ struct xen_pmu_params {
  * Architecture-independent fields of xen_pmu_data are WO for the hypervisor
  * and RO for the guest but some fields in xen_pmu_arch can be writable
  * by both the hypervisor and the guest (see arch-$arch/pmu.h).
+ *
+ * PAGE_SIZE bytes of memory are allocated.
+ * This struct cannot be larger than PAGE_SIZE.
  */
 struct xen_pmu_data {
 	/* Interrupted VCPU */
@@ -92,4 +106,38 @@ struct xen_pmu_data {
 	struct xen_pmu_arch pmu;
 };
 
+/* stacktrace entry populated from the end,
+ * so stacktrace_nr == 1, means that stacktrace[PMU_MAX_STACKTRCE-1] is valid.
+ * This is done, so that PMU_MAX_STACKTRACE can be changed in the future, without breaking the ABI.
+ * The struct itself (and thus the stacktrace_nr field) will always be placed at the end of a page.
+ *
+ * See arch-x86/pmu.h for an example memory layout on x86.
+ *
+ */
+#define PMU_MAX_STACKTRACE 127
+
+/* WO for hypervisor, RO for guest */
+struct xen_pmu_hv_stacktrace {
+	uint64_t stacktrace[PMU_MAX_STACKTRACE];
+	uint64_t stacktrace_nr;
+
+	/* Like xen_pmu_data.domain_id, but instead of DOMID_XEN always contains the
+	 * domain that was interrupted (DOMID_SELF if it matches the sampling
+	 * domain).
+	 */
+	domid_t guest_domain_id;
+	uint8_t pad[6];
+
+	/* When xen_pmu_data.domain_id == DOMID_XEN, this will contain
+	 * the registers of the guest that was interrupted.
+	 * This is useful for Dom0 kernel stacktraces, even if the interrupt
+	 * arrives while in Xen.
+	 */
+	struct xen_pmu_arch_guest guest;
+#define XEN_PMU_STACKTRACE_PAD 56
+	uint8_t pad2[XEN_PMU_STACKTRACE_PAD];
+};
+
+#define MAX_XEN_PMU_DATA_SIZE (PAGE_SIZE - sizeof(struct xen_pmu_hv_stacktrace))
+
 #endif /* __XEN_PUBLIC_XENPMU_H__ */
-- 
2.47.1


