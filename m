Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7BB12099
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058058.1425749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK10-00035K-66; Fri, 25 Jul 2025 15:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058058.1425749; Fri, 25 Jul 2025 15:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK10-000324-2E; Fri, 25 Jul 2025 15:07:18 +0000
Received: by outflank-mailman (input) for mailman id 1058058;
 Fri, 25 Jul 2025 15:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK0y-0002MW-Ca
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:16 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ce78d46-6969-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 17:07:15 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-606b58241c9so3427598a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:15 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:14 -0700 (PDT)
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
X-Inumbo-ID: 0ce78d46-6969-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456035; x=1754060835; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QchLTL4pNHawbG2hL22qtH22Q+AVTiF/+XhlKzTWvl4=;
        b=Sm6u2MlLavfMPWOyafDWR1KISJLR3uXACbGN9JZ6YlxrDtXZYZpGnimnQBTJaSwyls
         IRhGWGzG+HicM0yGBcdGjd4dq6bpnxu44Blzz35dnmscz2JhmEgYfIJNifMkNHXl8y5z
         yKelbSL0fOzGn7pvAN6/7eYxw1s64QtfXRoa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456035; x=1754060835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QchLTL4pNHawbG2hL22qtH22Q+AVTiF/+XhlKzTWvl4=;
        b=PnLab73gqq03TYV0CvP8rWEnHN/SGE9/prKo+4ujme71NT1Tk4zB66UiXKAgWASEJD
         QvodA7ohRYVqDgjaJuzI3y4Xzu3Yx7k4XNqorUqGWSCaanyjynesJvxUh49kHmGU3+AU
         DG9jtlK6TrO8y20426MD/xBJttx9j+8afKilwZcNMIj7QtwgItNzRfzdr7tKxliJ9jPS
         2QGPmy7/yjWahGSXDu4PHQI9c+V3sMnuJyz5yfMaPY2s+xAM2Zy0bjR+OV+l2jM9VuFT
         TR0O8zqkUENI6BDDv5rYRDueMvwalSouDmd6GhS3Oc8aU5sU2xaBFoAQU82txlMxgKri
         qbiw==
X-Gm-Message-State: AOJu0YwejXLAJPhYabtxN6WfK3gmaBPYbmbKppZ8TQnWj3wbni/nsj5G
	0MGR10RU7UdJe4WjgWR3+O5Ys9XUpj60Hoop1jqk2Zv66iAylAx9EtT91tUGxrtUzHQmJC1+Cg7
	dVLDezf4=
X-Gm-Gg: ASbGncsWt+h6iTiN4gEl7U6RaLA+s68w3unNFsPZd4VL0CeKTUC1wcmDMVazM5iLfkH
	GWhz9E+AthUO0K5V89PiD26hb0DNije6I8baefYs9KNjdgr8DQVJpLFv1th1G9SLofpJwzEdZWw
	ZaE+pw4Pxe4hk7MemYVEiMnqXMHiQ8kw2uUN+b9FjkO/txhE/E1ShF1JGOXrFcfJUXUkqbwacQw
	qYGM/VEoWakAzxbkA8scevt9OfYTQmC/QuVFQx7fMja8xy14CFEZgSrXuzwJihhvHU0BvhH97hP
	jUZwx0wURbH1ygIuXfX/m3RiZpe67xOsbBqhL6tJsd+ibdNPLqE7nrU507nFyjoHCZuHEIOfo5V
	qdIsCwJCG01D5GLu9o/PSVRP7RNycxabNujIQoIZ+th0LbKc=
X-Google-Smtp-Source: AGHT+IHu8VTmucitzUR40DJT/UDeQs8TsDr5/S7Y/ciVHP8v1ipD+71BH2x3Du7DmNBzTVzDO3TC4Q==
X-Received: by 2002:a05:6402:50ce:b0:5f7:f55a:e5e1 with SMTP id 4fb4d7f45d1cf-614f1d84518mr1987743a12.24.1753456035118;
        Fri, 25 Jul 2025 08:07:15 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 05/10] pmu.h: introduce a stacktrace area
Date: Fri, 25 Jul 2025 16:06:41 +0100
Message-ID: <49cbbacdc5f4fec624ae164a01eaa574aa771854.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The guest always allocates a full page that is mapped for 'struct
xen_pmu_data' (there is no smaller mapping granularity).

The existing struct contains a flexible array member that is used to
store architectural performance counters on Intel (their number is
dynamically determined from CPUID).

AFAICT their number is currently limited to 32 due to the bitmap in the
CPUID only having 32 bits defined for this, although the cpuid has 8
bits reserved to specify the number of these counters, so this may grow.

For backwards compatibility and to leave as much room for future growth
in these counters as possible: the newly introduced hypervisor
stacktrace area will be stored at the end of the page.

Conceptually this would've been:
```
struct xen_pmu_data_v2 {
    union {
        struct xen_pmu_data v1;
        uint8_t pad[PAGE_SIZE - sizeof(struct xen_pmu_hv_stacktrace)];
    };
    struct xen_pmu_hv_stacktrace pmu_stack;
};
```

But that is not valid C due to the flexible array member in v1.

127 is chosen as the stacktrace limit to match the default stacktrace
limit in Linux.

This is also compatible with old hypervisors, where stacktrace_nr would
be left at 0 (the entire page is zeroed at allocation), and would just
never return a stacktrace (compatible behaviour).

Even on hypervisors that support the stacktrace struct, the stacktrace
may only be available in certain configurations for now (e.g.
CONFIG_FRAME_POINTER on x86-64 only for now).

The guest registers however will be available whenever domain_id ==
DOMID_XEN, to enable guest kernels to profile themselves.

There is code duplication in 'struct xen_pmu_arch_guest',
but xlat.h checker fails if I try to reuse that in the definition of
xen_pmu_arch_t.

There is padding at the end of `xen_pmu_hv_stacktrace` for
future-proofing.

No functional change.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/arch/x86/cpu/vpmu.c           |   2 +-
 xen/arch/x86/cpu/vpmu_amd.c       |   2 +-
 xen/arch/x86/cpu/vpmu_intel.c     |   2 +-
 xen/include/public/arch-arm.h     |   1 +
 xen/include/public/arch-ppc.h     |   1 +
 xen/include/public/arch-riscv.h   |   1 +
 xen/include/public/arch-x86/pmu.h | 157 ++++++++++++++++++------------
 xen/include/public/pmu.h          |  36 ++++++-
 8 files changed, 137 insertions(+), 65 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 713311a1ac..286dc2af5f 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -404,7 +404,7 @@ static int vpmu_arch_initialise(struct vcpu *v)
     uint8_t vendor = current_cpu_data.x86_vendor;
     int ret;
 
-    BUILD_BUG_ON(sizeof(struct xen_pmu_data) > PAGE_SIZE);
+    BUILD_BUG_ON(sizeof(struct xen_pmu_data) > MAX_XEN_PMU_DATA_SIZE);
     BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
     BUILD_BUG_ON(sizeof(struct xen_pmu_amd_ctxt) > XENPMU_CTXT_PAD_SZ);
     BUILD_BUG_ON(sizeof(struct xen_pmu_regs) > XENPMU_REGS_PAD_SZ);
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index a6117dfebf..024d0c1eb7 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -543,7 +543,7 @@ static const struct arch_vpmu_ops *__init common_init(void)
     }
 
     if ( sizeof(struct xen_pmu_data) +
-         2 * sizeof(uint64_t) * num_counters > PAGE_SIZE )
+         2 * sizeof(uint64_t) * num_counters > MAX_XEN_PMU_DATA_SIZE)
     {
         printk(XENLOG_WARNING
                "VPMU: Register bank does not fit into VPMU shared page\n");
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 7ce98ee42e..9c8b5c1907 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -967,7 +967,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
     pmc_quirk = current_cpu_data.x86 == 6;
 
     if ( sizeof(struct xen_pmu_data) + sizeof(uint64_t) * fixed_pmc_cnt +
-         sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt > PAGE_SIZE )
+         sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt > MAX_XEN_PMU_DATA_SIZE)
     {
         printk(XENLOG_WARNING
                "VPMU: Register bank does not fit into VPMU share page\n");
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a1747..3d61337fda 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -540,6 +540,7 @@ typedef uint64_t xen_callback_t;
 #ifndef __ASSEMBLY__
 /* Stub definition of PMU structure */
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
+struct xen_pmu_arch_guest { uint8_t dummy; };
 #endif
 
 #endif /*  __XEN_PUBLIC_ARCH_ARM_H__ */
diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
index 4ca453a284..5e019ac8d5 100644
--- a/xen/include/public/arch-ppc.h
+++ b/xen/include/public/arch-ppc.h
@@ -101,6 +101,7 @@ struct xen_arch_domainconfig {
 };
 
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
+struct xen_pmu_arch_guest { uint8_t dummy; };
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
index 168263b920..30f9ec609a 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -78,6 +78,7 @@ typedef struct arch_shared_info arch_shared_info_t;
 
 /* Stub definition of PMU structure */
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
+struct xen_pmu_arch_guest { uint8_t dummy; };
 #endif
 
 #endif /*  __XEN_PUBLIC_ARCH_RISCV_H__ */
diff --git a/xen/include/public/arch-x86/pmu.h b/xen/include/public/arch-x86/pmu.h
index 5bd0aa6f77..bdc8218cbe 100644
--- a/xen/include/public/arch-x86/pmu.h
+++ b/xen/include/public/arch-x86/pmu.h
@@ -74,6 +74,23 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_regs_t);
 #define PMU_SAMPLE_REAL    (1<<2) /* Sample is from realmode */
 #define PMU_SAMPLE_PV      (1<<3) /* Sample from a PV guest */
 
+/*
+ * Architecture-specific information describing the state of the guest at
+ * the time of a PMU interrupt.
+ */
+struct xen_pmu_arch_guest {
+    union {
+        /*
+         * Processor's registers at the time of interrupt.
+         * WO for hypervisor, RO for guests.
+         */
+        xen_pmu_regs_t regs;
+        /* Padding for adding new registers to xen_pmu_regs in the future */
+#define XENPMU_REGS_PAD_SZ  64
+        uint8_t pad[XENPMU_REGS_PAD_SZ];
+    } r;
+};
+
 /*
  * Architecture-specific information describing state of the processor at
  * the time of PMU interrupt.
@@ -129,67 +146,86 @@ struct xen_pmu_arch {
 typedef struct xen_pmu_arch xen_pmu_arch_t;
 DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
 
+
 /* Memory layout:
-*                ╭─────────────────────╮
-*                │ struct xen_pmu_data │
-* ╒══════════════╧═════════════════════╧═══════════════════════╕ ◁╮
-* │ vcpu_id                                                    │  │
-* ├────────────────────────────────────────────────────────────┤  │
-* │ pcpu_id                                                    │  │
-* ├────────────────────────────────────────────────────────────┤  │
-* │ domain_id                                                  │  │
-* ├────────────────────────────────────────────────────────────┤  │
-* │██pad███████████████████████████████████████████████████████│  │
-* ╞════╤═╤═══╤══════════════════╤══════════════════════════════╡  │
-* │ pmu│ │ r │ regs             │██pad█████████████████████████│  │
-* ├────╯ ├───╯ (xen or guest)   │██████████████████████████████│  │
-* │      ╞══════════════════════╧══════════════════════════════╡  │
-* │      │ pmu_flags                                           │  │
-* │      ╞═══╤════════════════════╤════════════════════════════╡  │
-* │      │ l │ lapic_lvtpc        │████████████████████████████│  │
-* │      ├───╯ ███████████████████│██pad███████████████████████│  │
-* │      │     ███████████████████│████████████████████████████│  │
-* │      ╞═══╤═╤═══════╤═════╤════╪════╤═══════╤═══════════════╡  │
-* │      │ c │ │       │ amd │    │    │ intel │         │█████│  │
-* │      ├───┘ │       ╰─────╯    │    ╰───────╯         │█████│  │
-* │      │     │ counter          │ fixed_counters       │█████│  │
-* │      │     ├──────────────────┼──────────────────────┤█████│  │
-* │      │     │ ctrls            │ arch_counters        │█████│  │
-* │      │     ╞═════╤════════╤═══├──────────────────────┤█████│  │
-* │      │     │     │ regs[] │  ┆│ global_ctrl          │█████│  │
-* │      │     │     └────────╯  ┆├──────────────────────┤█████│  │
-* │      │     │struct           ┆│ global_ovf_ctrl      │█████│  │
-* │      │     │xen_pmu_cntr_pair┆├──────────────────────┤█████│  │
-* │      │     │[counters]       ┆│ global_status        │█████│  │
-* │      │     │                 ┆├──────────────────────┤█████│  │
-* │      │     │                 ┆│ fixed_ctrl           │█████│  │
-* │      │     │                 ┆├──────────────────────┤█████│  │
-* │      │     │                 ┆│ ds_area              │█████│  │
-* │      │     │                 ┆├──────────────────────┤█████│  │
-* │      │     │                 ┆│ pebs_enable          │█pad█│  │
-* │      │     │                 ┆├──────────────────────┤█████│  │
-* │      │     │                 ▽│ debugctl             │█████│  │
-* │      │     │██████████████████╞═══════╤════════╤═════╡█████│  │
-* │      │     │██████████████████│       │ regs[] │ ┆[0]│█████│  │
-* │      │     │██████████████████│       └────────╯ ┆   │█████│  │
-* │      │     │██████████████████│ uint64_t         ┆   │█████│  │
-* │      │     │██████████████████│ [fixed_counters] ┆   │█████│  │
-* │      │     │██████████████████│                  ┆   │█████│  │
-* │      │     │██████████████████│                  ┆   │█████│  │
-* │      │     │██████████████████│ ─────────────────┆   │█████│  │
-* │      │     │██████████████████│  struct          ┆   │█████│  │
-* │      │     │██████████████████│ xen_pmu_cntr_pair┆   │█████│  │
-* │      │     ╘══════════════════╡ [arch_counters]  ┆   ╞═════╡  │
-* │      │                        │                  ┆   │     │  │
-* │      │                        │                  ▽   │     │  │
-* │      │                        ╘══════════════════════╛     │  │
-* │      ╘═════════════════════════════════════════════════════╡  │
-* ╞════════════════════════════════════════════════════════════╡  │
-* │████████████████████████████████████████████████████████████│  │
-* ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
-* ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
-* │████████████████████████████████████████████████████████████│  │ PAGE_SIZE
-* ╘════════════════════════════════════════════════════════════╛ ◁╯
+ *                ╭─────────────────────╮
+ *                │ struct xen_pmu_data │
+ * ╒══════════════╧═════════════════════╧═══════════════════════╕ ◁╮
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
+ * |############################################################|  |
+ * |##########.------------------------------.##################|  |
+ * |##########| struct xen_pmu_hv_stacktrace |##################|  |
+ * +==========+==============================+==================+  |
+ * |                              ^ [stacktrace_nr-1]           |  |
+ * |                              :                             |  |
+ * | stacktrace[stacktrace_nr]    : [0]                         |  |
+ * +------------------------------------------------------------+  |
+ * | stacktrace_nr                                              |  |
+ * +------------------------------------------------------------+  |
+ * | guest_domain_id                                            |  |
+ * +------------------------------------------------------------+  |
+ * |##pad#######################################################|  |
+ * +=======+=+===+==================+===========================+  |
+ * | guest | | r | regs             |##pad######################|  |
+ * +-------. +---. (xen or guest)   |###########################|  |
+ * |         +======================+===========================+  |
+ * |         |##pad2############################################|  | PAGE_SIZE
+ * +=========+==================================================+ <.
 */
 
 #endif /* __XEN_PUBLIC_ARCH_X86_PMU_H__ */
@@ -202,4 +238,3 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
  * indent-tabs-mode: nil
  * End:
  */
-
diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
index 15decc024d..1879914ea6 100644
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -20,7 +20,7 @@
 #endif
 
 #define XENPMU_VER_MAJ    0
-#define XENPMU_VER_MIN    1
+#define XENPMU_VER_MIN    2
 
 /*
  * ` enum neg_errnoval
@@ -120,6 +120,40 @@ struct xen_pmu_data {
     xen_pmu_arch_t pmu;
 };
 
+/* stacktrace entry populated from the end,
+ * so stacktrace_nr == 1, means that stacktrace[PMU_MAX_STACKTRCE-1] is valid.
+ * This is done, so that PMU_MAX_STACKTRACE can be changed in the future, without breaking the ABI.
+ * The struct itself (and thus the stacktrace_nr field) will always be placed at the end of a page.
+ *
+ * See arch-x86/pmu.h for an example memory layout on x86.
+ *
+ * */
+#define PMU_MAX_STACKTRACE 127
+
+/* WO for hypervisor, RO for guest */
+struct xen_pmu_hv_stacktrace {
+    uint64_t stacktrace[PMU_MAX_STACKTRACE];
+    uint64_t stacktrace_nr;
+
+    /* Like xen_pmu_data.domain_id, but instead of DOMID_XEN always contains the
+     * domain that was interrupted (DOMID_SELF if it matches the sampling
+     * domain).
+     */
+    domid_t guest_domain_id;
+    uint8_t pad[6];
+
+    /* When xen_pmu_data.domain_id == DOMID_XEN, this will contain
+    * the registers of the guest that was interrupted.
+    * This is useful for Dom0 kernel stacktraces, even if the interrupt
+    * arrives while in Xen.
+    * */
+    struct xen_pmu_arch_guest guest;
+#define XEN_PMU_STACKTRACE_PAD 48
+    uint8_t pad2[XEN_PMU_STACKTRACE_PAD];
+};
+
+#define MAX_XEN_PMU_DATA_SIZE (PAGE_SIZE - sizeof(struct xen_pmu_hv_stacktrace))
+
 #endif /* __XEN_PUBLIC_PMU_H__ */
 
 /*
-- 
2.47.1


