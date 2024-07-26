Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9128593D639
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765568.1176250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN0S-0007ao-Mi; Fri, 26 Jul 2024 15:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765568.1176250; Fri, 26 Jul 2024 15:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN0S-0007Yi-JX; Fri, 26 Jul 2024 15:37:20 +0000
Received: by outflank-mailman (input) for mailman id 765568;
 Fri, 26 Jul 2024 15:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvL-00084T-UE
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:03 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33486385-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:32:00 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3db157d3bb9so641892b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:32:00 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8fb75esm17647636d6.37.2024.07.26.08.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:58 -0700 (PDT)
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
X-Inumbo-ID: 33486385-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007919; x=1722612719; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYXdVkLLNIS4KtspHlJSKYzWQbuXp954bdTpVDbEoAM=;
        b=rNx1e2VONFwODEt63rW9CKplpEYgHObqHmkaK5EEUaKiXi+oJ/UlFo6wVetymujbXV
         dAw0e5uhdUZX+Mxt+Z2y8SQ9F4usadtehGX01H0AOMNQHOngK+/Lqxs3X75pHfgct8N8
         eRAct8FyWP5rqqNV8UCGWIbSD1ljuxgJWmrCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007919; x=1722612719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYXdVkLLNIS4KtspHlJSKYzWQbuXp954bdTpVDbEoAM=;
        b=EzCif13BYp/1aPpzCNfUpj77ElztRDK+q7ym3IxJv2OajoX+Oj+N9PHKXdXYLrtIXW
         szDOblZiiUuOrSk7v9OWB0b3b5Nhz7MeP44iDDgr+0U6bCSyOgkxX/YOHwZubrBEHs4q
         0B4OTwFpEKM8PVyjkmCedK14ZU1bhz0pPTlFrpRoM8NcyqkLRplyauIXsggQa/bbDDle
         uDYMHvtDThqxyIab0tfuPcH8HGs2uF5FdE3G5QkmusDSSY2gohtTt7xru/TEz+6E4wOK
         LVEl++3jWBpjfSi0YBPcX8Koa7QmV8rbZeiB3TudiZ5RB/A92P/GiE5gK9hWdx2sKyIs
         TSIA==
X-Gm-Message-State: AOJu0YxxeMy6YbAbDDNtGKBnYTnBxy0ElnADDX0Tx6ZaL+QC12YhlNVE
	dBQsX/s1X3P53OyYjpPG5g8koOtKoTwelvBBK21o7DHhf6f9Tk2kTbN1teKrOEEhIiViZLQxJbd
	z
X-Google-Smtp-Source: AGHT+IELQuiKg0dTrgg6mKY/L8iQGU8ZCA7DqdUymXnvFtIjJNaHMTKjAvlY61OEYN4a/0/7vnN8Cg==
X-Received: by 2002:a05:6808:16a7:b0:3d9:37cf:3cad with SMTP id 5614622812f47-3db23a812a4mr37700b6e.49.1722007919026;
        Fri, 26 Jul 2024 08:31:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 15/22] x86/idle: allow using a per-pCPU L4
Date: Fri, 26 Jul 2024 17:21:59 +0200
Message-ID: <20240726152206.28411-16-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce support for possibly using a different L4 across the idle vCPUs.

This change only introduces support for loading a per-pPCU idle L4, but even
with the per-CPU idle page-table enabled it should still be a clone of
idle_pg_table, hence no functional change expected.

Note the idle L4 is not changed after Xen has reached the SYS_STATE_smp_boot
state, hence there are no need to synchronize the contents of the L4 once the
CPUs are started.

Using a per-CPU idle page-table is not strictly required for the Address Space
Isolation work, as idle page tables are never used when running guests.
However it simplifies memory management of the per-CPU mappings, as creating
per-CPU mappings only require using the idle page-table of the CPU where the
mappings should be created.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/x86_64.S       | 11 +++++++++++
 xen/arch/x86/domain.c            | 20 +++++++++++++++++++-
 xen/arch/x86/domain_page.c       |  2 +-
 xen/arch/x86/include/asm/setup.h |  1 +
 xen/arch/x86/setup.c             |  3 +++
 xen/arch/x86/smpboot.c           |  7 +++++++
 6 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 04bb62ae8680..af7854820185 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -15,6 +15,17 @@ ENTRY(__high_start)
         mov     $XEN_MINIMAL_CR4,%rcx
         mov     %rcx,%cr4
 
+        /*
+         * Possibly switch to the per-CPU idle page-tables. Note we cannot
+         * switch earlier as the per-CPU page-tables might be above 4G, and
+         * hence need to load them from 64bit code.
+         */
+        mov     ap_cr3(%rip), %rax
+        test    %rax, %rax
+        jz      .L_skip_cr3
+        mov     %rax, %cr3
+.L_skip_cr3:
+
         mov     stack_start(%rip),%rsp
 
         /* Reset EFLAGS (subsumes CLI and CLD). */
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 9cfcf0dc63f3..b62c4311da6c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -555,6 +555,7 @@ void arch_vcpu_regs_init(struct vcpu *v)
 int arch_vcpu_create(struct vcpu *v)
 {
     struct domain *d = v->domain;
+    root_pgentry_t *pgt = NULL;
     int rc;
 
     v->arch.flags = TF_kernel_mode;
@@ -589,7 +590,23 @@ int arch_vcpu_create(struct vcpu *v)
     else
     {
         /* Idle domain */
-        v->arch.cr3 = __pa(idle_pg_table);
+        if ( (opt_asi_pv || opt_asi_hvm) && v->vcpu_id )
+        {
+            pgt = alloc_xenheap_page();
+
+            /*
+             * For the idle vCPU 0 (the BSP idle vCPU) use idle_pg_table
+             * directly, there's no need to create yet another copy.
+             */
+            rc = -ENOMEM;
+            if ( !pgt )
+                goto fail;
+
+            copy_page(pgt, idle_pg_table);
+            v->arch.cr3 = __pa(pgt);
+        }
+        else
+            v->arch.cr3 = __pa(idle_pg_table);
         rc = 0;
         v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
     }
@@ -611,6 +628,7 @@ int arch_vcpu_create(struct vcpu *v)
     vcpu_destroy_fpu(v);
     xfree(v->arch.msrs);
     v->arch.msrs = NULL;
+    free_xenheap_page(pgt);
 
     return rc;
 }
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index eac5e3304fb8..99b78af90fd3 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -51,7 +51,7 @@ static inline struct vcpu *mapcache_current_vcpu(void)
         if ( (v = idle_vcpu[smp_processor_id()]) == current )
             sync_local_execstate();
         /* We must now be running on the idle page table. */
-        ASSERT(cr3_pa(read_cr3()) == __pa(idle_pg_table));
+        ASSERT(cr3_pa(read_cr3()) == cr3_pa(v->arch.cr3));
     }
 
     return v;
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index d75589178b91..a8452fce8f05 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -14,6 +14,7 @@ extern unsigned long xenheap_initial_phys_start;
 extern uint64_t boot_tsc_stamp;
 
 extern void *stack_start;
+extern unsigned long ap_cr3;
 
 void early_cpu_init(bool verbose);
 void early_time_init(void);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index bc387d96b519..c5a13b30daf4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -158,6 +158,9 @@ char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
 /* Used by the BSP/AP paths to find the higher half stack mapping to use. */
 void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);
 
+/* cr3 value for the AP to load on boot. */
+unsigned long ap_cr3;
+
 /* Used by the boot asm to stash the relocated multiboot info pointer. */
 unsigned int asmlinkage __initdata multiboot_ptr;
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 8aa621533f3d..e07add36b1b6 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -581,6 +581,13 @@ static int do_boot_cpu(int apicid, int cpu)
 
     stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
 
+    /*
+     * If per-CPU idle root page table has been allocated, switch to it as
+     * part of the AP bringup trampoline.
+     */
+    ap_cr3 = idle_vcpu[cpu]->arch.cr3 != __pa(idle_pg_table) ?
+             idle_vcpu[cpu]->arch.cr3 : 0;
+
     /* This grunge runs the startup process for the targeted processor. */
 
     set_cpu_state(CPU_STATE_INIT);
-- 
2.45.2


