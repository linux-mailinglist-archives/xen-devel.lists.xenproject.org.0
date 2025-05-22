Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6CDAC07A9
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993248.1376699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1cV-0005gX-Gz; Thu, 22 May 2025 08:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993248.1376699; Thu, 22 May 2025 08:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1cV-0005dr-BP; Thu, 22 May 2025 08:49:43 +0000
Received: by outflank-mailman (input) for mailman id 993248;
 Thu, 22 May 2025 08:49:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI1cU-0004UT-B9
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:49:42 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3aef5b4-36e9-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 10:49:42 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so83607895e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 01:49:41 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca888fcsm23433058f8f.78.2025.05.22.01.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 01:49:40 -0700 (PDT)
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
X-Inumbo-ID: b3aef5b4-36e9-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747903781; x=1748508581; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbA2N4Sx+9yCupSjz9rtr7Z+UbsRZXxcS06NGIutUUY=;
        b=udcXFWMtRldhtN2jk1oxOGq30P46YeT3j6Qr9goEsqpLYbZDjfwGVmOmPIjGO2+m8Q
         kTzPv76D0n/yJHTAOc4qhPFdwvYva+0aba/tleekZCXS8UzfUm7DPL/d2rCBs89KDHiR
         0HVnax/SQbTgWeBhdWZNoAqk4cAArHWPBlV6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903781; x=1748508581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbA2N4Sx+9yCupSjz9rtr7Z+UbsRZXxcS06NGIutUUY=;
        b=p+A4hLUP77qz3Es2IXD5zXMKDzE56Ewce/upGHRkKVCy+0P6q2xZRmDOi23Xxo4zvX
         j4k5rb93X4H321/Y7zoDsYRgdbn5NXDI9VuOvz57tm343ft+1eIicAcasCk/HwnFe5sz
         618oqiSn95aeD5CBR49YVHNQkjdMPnbvgr+cmF8IApb6ikp2NGGwIHP0JjNozDGd6KxZ
         vsB13/H2BKo+knWF+1jncnmbCxg0hm3xtzIKXXi2zwHkPqMIKwFD/xo+jWG/lkyAt4tU
         24PJv3K8Wl82jLsea3NNE4O2V9N5LwDFfFdct3d3Kdnld/FZ57YLLeGi9r2EQglEDWMt
         BRDA==
X-Gm-Message-State: AOJu0YzhQmFlUs3/EiTcOCU8a6c/jTzUSs1Qg0i+le2C9t57HG91coC0
	s6wd6Y8fACSs6S28FPQLAtUZ4ejeLQmKFJ+0Qc1zkWdyaqGXQ7ATunXezoCqeC8Dor0aAf5lPem
	nPWRU
X-Gm-Gg: ASbGnct5LB47G7V2QxU7B/Q+mULrbrsyHSXwx7petEMzbba1egaMkMyDUEXls72nEJa
	Ulxbl1/uxbXVRB3s44xgdOUGA4AtymJZT0ZTmAHQzki/0C9NaXtXjAsqkRhGUZMP97gs2pJZNtI
	lf6Qi+BEh2SM/kKh4dqVGuzvssoGD3V2XXZ8ZIvaEei6LO2LlgZJcr73QU4FviZzeX5QXZxTcLC
	s4qiD5Am2AAQzcfTUbpChYTaQ+wQROvFcoeFWZzaYa0hqwocR7btPT7JUY7SPGUbxcOGDV/BvLB
	Q6+O1a1S8UQiDaGq+hKbFERsFb8tH8RPATmn6ccGjqnJ4cCY0axyidatJ8ZpRP1f3YV5NR+so37
	yJzIhqHET07X+gmbL7QIQ5Tx/J1YSkg==
X-Google-Smtp-Source: AGHT+IHkRhaunxLXl2soEk1ANBtB65BNTfNZfbNCiHa/VpK9eH15Hdp9wbjWw5ayH1Vdh+dcHL6znQ==
X-Received: by 2002:a05:600c:1d81:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-442fd606b8emr230238295e9.4.1747903780774;
        Thu, 22 May 2025 01:49:40 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] x86/numa: introduce per-NUMA node flush locks
Date: Thu, 22 May 2025 10:48:15 +0200
Message-ID: <20250522084815.825-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522084815.825-1-roger.pau@citrix.com>
References: <20250522084815.825-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Contention around the global flush_lock increases as the amount of physical
CPUs on the host also increases.  Sadly this doesn't scale on big boxes.
However most of the time Xen doesn't require broadcasting flushes to all
CPUs on the system, and hence more fine grained (ie: covering less CPUs)
locks could be used.

A natural boundary to use when splitting the locks are NUMA nodes.  Most
domains will be limited to running on a single node, specifically the one
where the domain memory has been allocated from.  Flushes related to
domains are most likely to be limited to a single NUMA node, and hence
being able to execute per-node flushes allows to reduce the contention
around the global flush_lock, while also allowing to perform concurrent
flushes on different nodes.

This however doesn't come for free.  A new vector must be allocated to be
used for the per-NUMA flushes, and more logic is required in the flush
dispatcher to figure out whether a flush is limited to a single node.

The figures on a 2-node NUMA system are as follows, after having been
running the same XenRT boot storm workload for 90 minutes.

Without the per-NUMA node flush:

Global flush_lock: addr=ffff82d040837340, lockval=d8ded8de, not locked
  lock:21878876(98178042228), block:1603338(6043805110)

So a total block time of ~6s, and average block time of 3.7us.

With the per-node locks:

Global flush_lock: addr=ffff82d040837360, lockval=78e678e6, not locked
  lock:6781028(41032945811), block:583712(2025657239)
NUMA node 1 flush_lock: addr=ffff832fd085b110, lockval=5cd65cd6, not locked
  lock:220374(766500536), block:4091(9933129)
NUMA node 0 flush_lock: addr=ffff8310336a7110, lockval=5c715c71, not locked
  lock:547953(1658170241), block:23856(51266297)

The total block time goes down to ~2s, and the average block time is 3.4us.
The total block time of the per-node locks is much lower compared to the
global flush_lock, 9ms and 51ms respectively.

Note the example here is possibly the system where such split locks don't
make a lot of difference, being a 2 node system, but still there's a
non-trivial difference between the block times.  On a 4 or 9 node system
the figures should likely be even better.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Kind of RFC, had this patch pending for some time on my queue.  Before
working further on this I would like to make sure the approach is OK.
---
 xen/arch/x86/include/asm/irq-vectors.h |  9 ++-
 xen/arch/x86/include/asm/numa.h        |  3 +
 xen/arch/x86/include/asm/smp.h         |  3 +
 xen/arch/x86/numa.c                    | 95 ++++++++++++++++++++++++++
 xen/arch/x86/smp.c                     | 16 +++--
 xen/arch/x86/smpboot.c                 |  3 +
 xen/common/numa.c                      | 23 +++++++
 xen/include/xen/numa.h                 | 13 ++++
 8 files changed, 160 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq-vectors.h b/xen/arch/x86/include/asm/irq-vectors.h
index f546aedd87de..3b8fee7e22cf 100644
--- a/xen/arch/x86/include/asm/irq-vectors.h
+++ b/xen/arch/x86/include/asm/irq-vectors.h
@@ -9,12 +9,19 @@
 #define CALL_FUNCTION_VECTOR	0xfb
 #define LOCAL_TIMER_VECTOR	0xfa
 #define PMU_APIC_VECTOR 	0xf9
+
+#ifdef CONFIG_NUMA
+# define INVALIDATE_NUMA_VECTOR  0xf8
+# define LAST_HIPRIORITY_VECTOR  0xf7
+#else /* !CONFIG_NUMA */
+# define LAST_HIPRIORITY_VECTOR  0xf8
+#endif /* !CONFIG_NUMA */
+
 /*
  * High-priority dynamically-allocated vectors. For interrupts that
  * must be higher priority than any guest-bound interrupt.
  */
 #define FIRST_HIPRIORITY_VECTOR	0xf1
-#define LAST_HIPRIORITY_VECTOR  0xf8
 /* IRQ0 (timer) is statically allocated but must be high priority. */
 #define IRQ0_VECTOR             0xf0
 
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 7866afa40860..e68c2d9d9bea 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -25,4 +25,7 @@ void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 
+bool flush_numa_node(const cpumask_t *mask, const void *va, unsigned int flags);
+void cf_check invalidate_tbl_numa(void);
+
 #endif
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index c8c79601343d..1e6972fd7b39 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -79,6 +79,9 @@ extern bool unaccounted_cpus;
 
 void *cpu_alloc_stack(unsigned int cpu);
 
+void invalidate_tlb_handler(const void *va, unsigned int flags,
+                            cpumask_t *mask);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index ae3cc7a8d060..0139fe5377ba 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -8,8 +8,11 @@
 #include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
+#include <xen/xvmalloc.h>
+
 #include <asm/acpi.h>
 #include <asm/e820.h>
+#include <asm/irq-vectors.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -126,3 +129,95 @@ int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
 
     return 0;
 }
+
+static struct arch_numa_node {
+    const void *flush_va;
+    unsigned int flush_flags;
+    cpumask_t flush_mask;
+    spinlock_t flush_lock;
+    struct lock_profile_qhead profile_head;
+} *node_info[MAX_NUMNODES];
+
+static int __init cf_check arch_numa_init(void)
+{
+    unsigned int i;
+
+    if ( num_online_nodes() == 1 )
+        return 0;
+
+    for_each_online_node ( i )
+    {
+        struct arch_numa_node *node =
+            alloc_xenheap_pages(get_order_from_bytes(sizeof(*node)),
+                                                     MEMF_node(i));
+
+        if ( node )
+            clear_page(node);
+        else
+            node = xvzalloc(typeof(*node));
+
+        if ( !node )
+        {
+            printk(XENLOG_WARNING
+                   "failed to allocate NUMA info struct for node %u\n", i);
+            return 0;
+        }
+
+        spin_lock_init(&node->flush_lock);
+        lock_profile_register_struct(LOCKPROF_TYPE_PERNODE, node, i);
+        spin_lock_init_prof(node, flush_lock);
+        node_info[i] = node;
+    }
+
+    return 0;
+}
+__initcall(arch_numa_init);
+
+void cf_check invalidate_tbl_numa(void)
+{
+    unsigned int cpu = smp_processor_id();
+    nodeid_t node = cpu_to_node[cpu];
+    struct arch_numa_node *info = node_info[node];
+
+    ASSERT(info);
+
+    invalidate_tlb_handler(info->flush_va, info->flush_flags,
+                           &info->flush_mask);
+}
+
+bool flush_numa_node(const cpumask_t *mask, const void *va, unsigned int flags)
+{
+    nodeid_t node = num_online_nodes() > 1 ? cpumask_to_node(mask)
+                                           : NUMA_NO_NODE;
+    struct arch_numa_node *info;
+
+    if ( node == NUMA_NO_NODE )
+        return false;
+
+    info = node_info[node];
+
+    if ( !info )
+        return false;
+
+    spin_lock(&info->flush_lock);
+    cpumask_and(&info->flush_mask, mask, &cpu_online_map);
+    cpumask_clear_cpu(smp_processor_id(), &info->flush_mask);
+    info->flush_va = va;
+    info->flush_flags = flags;
+    send_IPI_mask(&info->flush_mask, INVALIDATE_NUMA_VECTOR);
+    while ( !cpumask_empty(&info->flush_mask) )
+        cpu_relax();
+    spin_unlock(&info->flush_lock);
+
+    return true;
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
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 516dab5528c1..06acc5843f9a 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -247,16 +247,21 @@ static cpumask_t flush_cpumask;
 static const void *flush_va;
 static unsigned int flush_flags;
 
-void cf_check invalidate_interrupt(void)
+void invalidate_tlb_handler(const void *va, unsigned int flags,
+                            cpumask_t *mask)
 {
-    unsigned int flags = flush_flags;
     ack_APIC_irq();
     perfc_incr(ipis);
     if ( (flags & FLUSH_VCPU_STATE) && __sync_local_execstate() )
         flags &= ~(FLUSH_TLB | FLUSH_TLB_GLOBAL | FLUSH_ROOT_PGTBL);
     if ( flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK) )
-        flush_area_local(flush_va, flags);
-    cpumask_clear_cpu(smp_processor_id(), &flush_cpumask);
+        flush_area_local(va, flags);
+    cpumask_clear_cpu(smp_processor_id(), mask);
+}
+
+void cf_check invalidate_interrupt(void)
+{
+    invalidate_tlb_handler(flush_va, flush_flags, &flush_cpumask);
 }
 
 void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
@@ -281,6 +286,9 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
              !hypervisor_flush_tlb(mask, va, flags) )
             return;
 
+        if ( flush_numa_node(mask, va, flags) )
+            return;
+
         spin_lock(&flush_lock);
         cpumask_and(&flush_cpumask, mask, &cpu_online_map);
         cpumask_clear_cpu(cpu, &flush_cpumask);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 50c5674555e4..eb8600eb008f 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1451,4 +1451,7 @@ void __init smp_intr_init(void)
     set_direct_apic_vector(EVENT_CHECK_VECTOR, event_check_interrupt);
     set_direct_apic_vector(INVALIDATE_TLB_VECTOR, invalidate_interrupt);
     set_direct_apic_vector(CALL_FUNCTION_VECTOR, call_function_interrupt);
+#ifdef CONFIG_NUMA
+    set_direct_apic_vector(INVALIDATE_NUMA_VECTOR, invalidate_tbl_numa);
+#endif
 }
diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a1622..b9bb8628fb6b 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -689,6 +689,29 @@ static int __init cf_check numa_setup(const char *opt)
 }
 custom_param("numa", numa_setup);
 
+/*
+ * Return the NUMA node index if all CPUs in the mask belong to the same node,
+ * otherwise return NUMA_NO_NODE.
+ */
+nodeid_t cpumask_to_node(const cpumask_t *mask)
+{
+    unsigned int cpu;
+    nodeid_t node = NUMA_NO_NODE;
+
+    if ( num_online_nodes() == 1 )
+        return cpu_to_node[0];
+
+    for_each_cpu ( cpu, mask )
+    {
+        if ( node == NUMA_NO_NODE )
+            node = cpu_to_node[cpu];
+        else if ( node != cpu_to_node[cpu] )
+            return NUMA_NO_NODE;
+    }
+
+    return node;
+}
+
 static void cf_check dump_numa(unsigned char key)
 {
     s_time_t now = NOW();
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index f6c1f27ca105..256dfbcf85f8 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -128,6 +128,8 @@ extern bool numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
                                      paddr_t start, paddr_t size, bool hotplug);
 extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
+extern nodeid_t cpumask_to_node(const cpumask_t *mask);
+
 #else
 
 /* Fake one node for now. See also node_online_map. */
@@ -148,6 +150,17 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
     return 0;
 }
 
+static inline nodeid_t cpumask_to_node(const cpumask_t *mask)
+{
+    return NUMA_NO_NODE;
+}
+
+#ifdef CONFIG_X86
+static inline bool flush_numa_node(const cpumask_t *mask, const void *va,
+                                   unsigned int flags)
+{ return false; }
+#endif /* CONFIG_X86 */
+
 #endif
 
 #define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
-- 
2.49.0


