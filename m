Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9693D638
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765570.1176257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN0T-0007i1-1f; Fri, 26 Jul 2024 15:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765570.1176257; Fri, 26 Jul 2024 15:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN0S-0007bJ-TB; Fri, 26 Jul 2024 15:37:20 +0000
Received: by outflank-mailman (input) for mailman id 765570;
 Fri, 26 Jul 2024 15:37:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvN-00084T-UO
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:05 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34934c3e-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:32:02 +0200 (CEST)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6b7b28442f9so9058466d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:32:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8d82a1sm17586896d6.8.2024.07.26.08.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:32:00 -0700 (PDT)
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
X-Inumbo-ID: 34934c3e-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007921; x=1722612721; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcKEcIFuRVzpYWYIIO7wusSFWSLDiglqIhdKhUx/dZ0=;
        b=pIliK6jM8ikuchh9GUCPAVsgDp3CyuTuzPpJqEQMb8N8yfXSLvlRmaF66XGpEew/rB
         3Fbjo4QE3HHSD1vAk97HDXVJ+UNynJx1UkouwUrJmLtOm+ymTZ3kh8mav2Z6DxCPOQxQ
         Rh1n6q9ueE84GmXJFHz548PzofuMr78MRRG9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007921; x=1722612721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcKEcIFuRVzpYWYIIO7wusSFWSLDiglqIhdKhUx/dZ0=;
        b=igFZNNUdwaInFFuZ7aF6wmGHTnN6Us/SihjebS2JrvdiqyPqv5JGRRkXS1qLRj1+0O
         p0rEt6rXlDzjNWJoqmKq1S7cSqqHE0xb7aFq2fWa+gjmL8IY310oUS35XO8Uw7oj2PId
         4piMIwQ14sWISiQXlHXwlMaFtZgrpvzGH13qehqamExVcdHeg1YN4/KStNi1coLkoe4u
         p9phZtvbrqLZVnBPqqmwirTmb85AsWm97HP0sUB7Es5xOV0gfBvPfrNoNJ54g9Q0lWBK
         Z6agMNvmIZrUKp7Pxl5wlWj1LUkil18VzgcvY1x+eLN8eew4nLS+7f/VAfxA3gJr08KQ
         XIew==
X-Gm-Message-State: AOJu0YzoQSEOqoBu+TMh6vvsrTA1XpuZJfnUrgT9YbZAW6fKSjTt9AXY
	FdqIU8P5Ifl4am8N5MQwM87OOEA7VH9khYNuDnoMXNEwl2UB3S+ZYKD/cs+3L8yioPcaoIzsJm0
	9
X-Google-Smtp-Source: AGHT+IHqAu8Qz1BY8yZmp87C+3Fu28qPJ50Yvmj36fS5QokP/EOXTjLUGudnvfM7GSui/Mp4Dy/a3g==
X-Received: by 2002:ad4:5e85:0:b0:6b0:90b4:1cb3 with SMTP id 6a1803df08f44-6bb55a7eef3mr1897296d6.32.1722007921198;
        Fri, 26 Jul 2024 08:32:01 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 16/22] x86/mm: introduce a per-CPU L3 table for the per-domain slot
Date: Fri, 26 Jul 2024 17:22:00 +0200
Message-ID: <20240726152206.28411-17-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

So far L4 slot 260 has always been per-domain, in other words: all vCPUs of a
domain share the same L3 entry.  Currently only 3 slots are used in that L3
table, which leaves plenty of room.

Introduce a per-CPU L3 that's used the the domain has Address Space Isolation
enabled.  Such per-CPU L3 gets currently populated using the same L3 entries
present on the per-domain L3 (d->arch.perdomain_l3_pg).

No functional change expected, as the per-CPU L3 is always a copy of the
contents of d->arch.perdomain_l3_pg.

Note that all the per-domain L3 entries are populated at domain create, and
hence there's no need to sync the state of the per-CPU L3 as the domain won't
yet be running when the L3 is modified.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/domain.h |  2 +
 xen/arch/x86/include/asm/mm.h     |  4 ++
 xen/arch/x86/mm.c                 | 80 +++++++++++++++++++++++++++++--
 xen/arch/x86/setup.c              |  8 ++++
 xen/arch/x86/smpboot.c            |  4 ++
 5 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 8c366be8c75f..7620a352b9e3 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -313,6 +313,8 @@ struct arch_domain
 {
     struct page_info *perdomain_l3_pg;
 
+    struct page_info *perdomain_l2_pgs[PERDOMAIN_SLOTS];
+
 #ifdef CONFIG_PV32
     unsigned int hv_compat_vstart;
 #endif
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 2c309f7b1444..34407fb0af06 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -633,4 +633,8 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 /* Setup the per-domain slot in the root page table pointer. */
 void setup_perdomain_slot(const struct vcpu *v, root_pgentry_t *root_pgt);
 
+/* Allocate a per-CPU local L3 table to use in the per-domain slot. */
+int allocate_perdomain_local_l3(unsigned int cpu);
+void free_perdomain_local_l3(unsigned int cpu);
+
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 13aa15f4db22..1367f3361ffe 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6079,6 +6079,12 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
         l2tab = __map_domain_page(pg);
         clear_page(l2tab);
         l3tab[l3_table_offset(va)] = l3e_from_page(pg, __PAGE_HYPERVISOR_RW);
+        /*
+         * Keep a reference to the per-domain L3 entries in case a per-CPU L3
+         * is in use (as opposed to using perdomain_l3_pg).
+         */
+        ASSERT(!d->creation_finished);
+        d->arch.perdomain_l2_pgs[l3_table_offset(va)] = pg;
     }
     else
         l2tab = map_l2t_from_l3e(l3tab[l3_table_offset(va)]);
@@ -6368,11 +6374,79 @@ unsigned long get_upper_mfn_bound(void)
     return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
 }
 
+static DEFINE_PER_CPU(l3_pgentry_t *, local_l3);
+
+static void populate_perdomain(const struct domain *d, l4_pgentry_t *l4,
+                               l3_pgentry_t *l3)
+{
+    unsigned int i;
+
+    /* Populate the per-CPU L3 with the per-domain entries. */
+    for ( i = 0; i < ARRAY_SIZE(d->arch.perdomain_l2_pgs); i++ )
+    {
+        const struct page_info *pg = d->arch.perdomain_l2_pgs[i];
+
+        BUILD_BUG_ON(ARRAY_SIZE(d->arch.perdomain_l2_pgs) >
+                     L3_PAGETABLE_ENTRIES);
+        l3e_write(&l3[i], pg ? l3e_from_page(pg, __PAGE_HYPERVISOR_RW)
+                             : l3e_empty());
+    }
+
+    l4e_write(&l4[l4_table_offset(PERDOMAIN_VIRT_START)],
+              l4e_from_mfn(virt_to_mfn(l3), __PAGE_HYPERVISOR_RW));
+}
+
+int allocate_perdomain_local_l3(unsigned int cpu)
+{
+    const struct domain *d = idle_vcpu[cpu]->domain;
+    l3_pgentry_t *l3;
+    root_pgentry_t *root_pgt = maddr_to_virt(idle_vcpu[cpu]->arch.cr3);
+
+    ASSERT(!per_cpu(local_l3, cpu));
+
+    if ( !opt_asi_pv && !opt_asi_hvm )
+        return 0;
+
+    l3 = alloc_xenheap_page();
+    if ( !l3 )
+        return -ENOMEM;
+
+    clear_page(l3);
+
+    /* Setup the idle domain slots (current domain) in the L3. */
+    populate_perdomain(d, root_pgt, l3);
+
+    per_cpu(local_l3, cpu) = l3;
+
+    return 0;
+}
+
+void free_perdomain_local_l3(unsigned int cpu)
+{
+    l3_pgentry_t *l3 = per_cpu(local_l3, cpu);
+
+    if ( !l3 )
+        return;
+
+    per_cpu(local_l3, cpu) = NULL;
+    free_xenheap_page(l3);
+}
+
 void setup_perdomain_slot(const struct vcpu *v, root_pgentry_t *root_pgt)
 {
-    l4e_write(&root_pgt[root_table_offset(PERDOMAIN_VIRT_START)],
-              l4e_from_page(v->domain->arch.perdomain_l3_pg,
-                            __PAGE_HYPERVISOR_RW));
+    const struct domain *d = v->domain;
+
+    if ( d->arch.asi )
+    {
+        l3_pgentry_t *l3 = this_cpu(local_l3);
+
+        ASSERT(l3);
+        populate_perdomain(d, root_pgt, l3);
+    }
+    else if ( is_hvm_domain(d) || d->arch.pv.xpti )
+        l4e_write(&root_pgt[root_table_offset(PERDOMAIN_VIRT_START)],
+                  l4e_from_page(v->domain->arch.perdomain_l3_pg,
+                                __PAGE_HYPERVISOR_RW));
 
     if ( !is_pv_64bit_vcpu(v) )
         /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c5a13b30daf4..5bf81b81b46f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1961,6 +1961,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     alternative_branches();
 
+    /*
+     * Setup the local per-domain L3 for the BSP also, so it matches the state
+     * of the APs.
+     */
+    ret = allocate_perdomain_local_l3(0);
+    if ( ret )
+        panic("Error %d setting up local per-domain L3\n", ret);
+
     /*
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
      * physical cpu_add/remove functions, so launch the guest with only
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index e07add36b1b6..40cc14799252 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -986,6 +986,7 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     }
 
     cleanup_cpu_root_pgt(cpu);
+    free_perdomain_local_l3(cpu);
 
     if ( per_cpu(stubs.addr, cpu) )
     {
@@ -1100,6 +1101,9 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     per_cpu(stubs.addr, cpu) = stub_page + STUB_BUF_CPU_OFFS(cpu);
 
     rc = setup_cpu_root_pgt(cpu);
+    if ( rc )
+        goto out;
+    rc = allocate_perdomain_local_l3(cpu);
     if ( rc )
         goto out;
     rc = -ENOMEM;
-- 
2.45.2


