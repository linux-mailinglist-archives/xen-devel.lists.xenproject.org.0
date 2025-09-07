Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1CB47C5E
	for <lists+xen-devel@lfdr.de>; Sun,  7 Sep 2025 18:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114126.1461310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI3C-0000WD-91; Sun, 07 Sep 2025 16:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114126.1461310; Sun, 07 Sep 2025 16:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI3C-0000Sc-4g; Sun, 07 Sep 2025 16:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1114126;
 Sun, 07 Sep 2025 16:15:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCRb=3S=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1uvI3A-00009z-MC
 for xen-devel@lists.xenproject.org; Sun, 07 Sep 2025 16:15:32 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd7dec0c-8c05-11f0-9809-7dc792cee155;
 Sun, 07 Sep 2025 18:15:26 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6188b793d21so5740718a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Sep 2025 09:15:26 -0700 (PDT)
Received: from MinisforumBD795m.phoenix-carat.ts.net
 ([2a02:1748:f7df:8cb1:5474:d7c3:6edd:e683])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047b61cf00sm908263766b.15.2025.09.07.09.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 09:15:25 -0700 (PDT)
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
X-Inumbo-ID: dd7dec0c-8c05-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757261726; x=1757866526; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO5tUDv0U0MxdgWnoUNF5wlhakSsj8V4mCcgx1zPxGY=;
        b=Sk+rhqyTkocQRRGYQwdCD2mzvcbK5xh4F6JrfTQb7UEfpGhXYdaBs/bRR488lu5Or8
         0HCV23bkSc7QKkukR3acqrMHxg+ySAr9UuICfdsCZAEAYGbben7/I6R0bSteilH1aKDM
         iTddId3Q9zj5ZEXGWOQ+tf/lwaKL85eNKEDxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261726; x=1757866526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iO5tUDv0U0MxdgWnoUNF5wlhakSsj8V4mCcgx1zPxGY=;
        b=K7XH1nBo5McfS/5QHoQmyY/1ONDqZNKfEJL+Mwvz4AlhGvUiu/ZxvUzTGXxb604Xhg
         djVPCt4aJmoq4sP95HqvRhOBdjo13VyrkmyV5AIDXitd6KmPso+imEvJ/b7340jG3L2G
         /LANt2XXJ0WdAQzlcXRYAhCFk9fVv1rx2OJ4YyqF56DuKNaXcuTBZvZpapRVR3V+2XVL
         p+nKFp4o4Fh7CXKuspbcJJAoG8oST8rrGkSMW4sSug/9ORxlWinaOtAyNSMVreXKqzdT
         9q9BSxFr6d5h2C6q7OLGuvMTqUWt8pw+C7mJtBJRUCrzEdZKb2GcivLzPgQncai1WSaZ
         k/YA==
X-Gm-Message-State: AOJu0YwgCWyG4PolYd3uzW1JuyPY+m0RsSkHR8u2iNcdI0l3gkfvw0rJ
	1asykPCgDwbpFzH54C/Y2YOKe5f5y9BtQ1YxUfOJMAVkzs7TU3+RX7PRCgB0IcpRCymgKouEsXz
	ie6QMqwY=
X-Gm-Gg: ASbGnctGaCN/q4IVBb0gltruo215y1iI+6ZToWEnZB0I3nSuOvr9QrDlHyGq57qTkmZ
	N3vDU8Zu8+5OQ3bzaISriwVd4/wBL/4uhsHUgoSRB8YGeCvB4fpL6J4nYSpajGZHMGlwRT7oBny
	2i3wITSWUEHBqjdd+CcXvBPIQ7TtQ1nqYvbYhaCxho+liVF/r7lWjbHi+/r3jt8ldRn0DFL7ujJ
	wYlA6G63hbHN6UoUSo4ecNXl4o2km2HtpxDewruLPqNSzIvgEo5QETahdTShMDM4PNa3VFoXWUh
	b3F1QeC2DYVpfE7Ll791WjspFqIFKPQPJlKyT2OI5Dea/pD8bwK1L7SrBtGiV4YTNSfc3UA+CDu
	CaJOGA28PeH4HEclN7ns96tkaywFpVUUBzfB5UWw0xUiIUi530I4t8gCLtjpiOhjDpvs=
X-Google-Smtp-Source: AGHT+IFM6Na4mCbdidqmq1mkUoDlkb/7C0nB0sqhQlVjW4irCLtDIf0HY6HTI0p1oz5LZmv7Xrwnvg==
X-Received: by 2002:a17:906:3185:b0:b04:b435:fc6b with SMTP id a640c23a62f3a-b04b43602bamr371349866b.60.1757261725991;
        Sun, 07 Sep 2025 09:15:25 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 1/7] xen/numa: Add per_node() variables paralleling per_cpu() variables
Date: Sun,  7 Sep 2025 18:15:16 +0200
Message-ID: <2a2e557f84ba4785f3f8788d31d3edf64e689da0.1757261045.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757261045.git.bernhard.kaindl@cloud.com>
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the review of the 3rd commit of the NUMA claims v1 series, it
was found to be concerning (performance-wise) add add another array
like this that randomly written from all nodes:

+/* Per-node counts of free pages */
+static unsigned long pernode_avail_pages[MAX_NUMNODES];

As solution, it was suggested to introduce per_node() paralleling
per_cpu(), or (less desirable) to make sure one particular cache
line would only ever be written from a single node.

It was mentioned that node_need_scrub[] could/should use it, and
I assume others may benefit too.

per_cpu() is a simple standard blueprint that is easy to copy, add
per_node(), paralleling per_cpu() as the preferred suggestion:

It is entirely derived from per_cpu(), with a few differences:

- No add/remove callback: Nodes are onlined on boot and never offlined.

- As per_node(avail_pages) and pernode(outstanding_claims) are used by
  the buddy allocator itself, and the buddy allocator is used to alloc
  the per_node() memory from the local NUMA node, there is a catch:

  per_node() must already be working to have a working buddy allocator:

  - Init per_node() before the buddy allocator is ready as it needs
    to be setup before its use, e.g. to init per_node(avail_pages)!

  Use an early static __initdata array during early boot and migrate
  it to the NUMA-node-local xenheap before we enable the secondary CPUs.

Cc: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>

---
Changes:
- This is patch is new in v3 to resolve the the suggestion from the review.
- The previous patch #2 is removed from the series as not required,
  which is best visualized by how claims are used:

  - Claim needed memory
  - Allocate all domain memory
  - Cancel a possible leftover claim
  - Finish building the domain and unpause it.

  As it makes no sense to repeat "Claim needed memory" at any time,
  the change made had no practical significance.  It can be applied
  later as a tiny, not important cleanup, e.g. with multi-node claims.

Implementation note on this patch (not needed for the commit message):

Instead of the __initdata array, I tried to alloc bootmem, but it
caused paging_init() to panic with not enough memory for p2m on a
very large 4-Socket, 480 pCPU, 4TiB RAM host (or it caused boot to
hang after the microcode updates of the 480 pCPUs)

The static __initdata array is freed after init and does not affect
bootmem allocation.

PPS: Yes, node_need_scrub[] should use it too, do it after this series.
---
 xen/arch/arm/xen.lds.S    |  1 +
 xen/arch/ppc/xen.lds.S    |  1 +
 xen/arch/riscv/xen.lds.S  |  1 +
 xen/arch/x86/xen.lds.S    |  1 +
 xen/common/numa.c         | 53 ++++++++++++++++++++++++++++++++++++++-
 xen/include/xen/numa.h    | 15 +++++++++++
 xen/include/xen/xen.lds.h |  8 ++++++
 7 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index db17ff1efa..d296a95dd3 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -176,6 +176,7 @@ SECTIONS
        *(.bss.stack_aligned)
        *(.bss.page_aligned)
        PERCPU_BSS
+       PERNODE_BSS
        *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 1de0b77fc6..29d1b5da58 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -151,6 +151,7 @@ SECTIONS
         *(.bss.stack_aligned)
         *(.bss.page_aligned)
         PERCPU_BSS
+        PERNODE_BSS
         *(.bss .bss.*)
         . = ALIGN(POINTER_ALIGN);
         __bss_end = .;
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index edcadff90b..e154427353 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -146,6 +146,7 @@ SECTIONS
         *(.bss.stack_aligned)
         *(.bss.page_aligned)
         PERCPU_BSS
+        PERNODE_BSS
         *(.sbss .sbss.* .bss .bss.*)
         . = ALIGN(POINTER_ALIGN);
         __bss_end = .;
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 966e514f20..95040cd516 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -327,6 +327,7 @@ SECTIONS
        __bss_start = .;
        *(.bss.page_aligned*)
        PERCPU_BSS
+       PERNODE_BSS
        *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a16..5e66471159 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -320,6 +320,51 @@ static bool __init nodes_cover_memory(void)
     return true;
 }
 
+/* Defined on the BSS in xen.lds.S, used for area sizes and relative offsets */
+extern const char __pernode_start[];
+extern const char __pernode_end[];
+
+unsigned long __read_mostly __pernode_offset[MAX_NUMNODES];
+
+#define EARLY_PERNODE_AREA_SIZE (SMP_CACHE_BYTES)
+
+static char early_pernode_area[MAX_NUMNODES][EARLY_PERNODE_AREA_SIZE]
+    __initdata __cacheline_aligned;
+
+/* per_node() needs to be ready before the first alloc call using the heap */
+static void __init early_init_pernode_areas(void)
+{
+    unsigned int node;
+
+    if (__pernode_end - __pernode_start > EARLY_PERNODE_AREA_SIZE)
+        panic("per_node() area too small, increase EARLY_PERNODE_AREA_SIZE");
+
+    for_each_online_node(node)
+        __pernode_offset[node] = early_pernode_area[node] - __pernode_start;
+}
+
+/* Before going SMP, migrate the per_node memory areas to their NUMA nodes */
+static int __init init_pernode_areas(void)
+{
+    const int pernode_size = __pernode_end - __pernode_start;  /* size in BSS */
+    unsigned int node;
+
+    for_each_online_node(node)
+    {
+        char *p = alloc_xenheap_pages(get_order_from_bytes(pernode_size),
+                                      MEMF_node(node));
+
+        if ( !p )
+            return -ENOMEM;
+        /* migrate the pernode data from the bootmem area to the xenheap */
+        memcpy(p, early_pernode_area[node], SMP_CACHE_BYTES);
+        __pernode_offset[node] = p - __pernode_start;
+    }
+    return 0;
+}
+
+presmp_initcall(init_pernode_areas);
+
 /* Use discovered information to actually set up the nodes. */
 static bool __init numa_process_nodes(paddr_t start, paddr_t end)
 {
@@ -617,7 +662,7 @@ static int __init numa_emulation(unsigned long start_pfn,
 }
 #endif
 
-void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+static void __init init_nodes(unsigned long start_pfn, unsigned long end_pfn)
 {
     unsigned int i;
     paddr_t start = pfn_to_paddr(start_pfn);
@@ -656,6 +701,12 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     setup_node_bootmem(0, start, end);
 }
 
+void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+{
+    init_nodes(start_pfn, end_pfn);
+    early_init_pernode_areas(); /* With all nodes registered, init per_node() */
+}
+
 void numa_add_cpu(unsigned int cpu)
 {
     cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index f6c1f27ca1..729c400d64 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -152,4 +152,19 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
 
 #define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
 
+/* Per NUMA node data area handling based on per-cpu data area handling. */
+extern unsigned long __pernode_offset[];
+
+#define DECLARE_PER_NODE(type, name) \
+    extern __typeof__(type) pernode__ ## name
+
+#define __DEFINE_PER_NODE(attr, type, name) \
+    attr __typeof__(type) pernode_ ## name
+
+#define DEFINE_PER_NODE(type, name) \
+    __DEFINE_PER_NODE(__section(".bss.pernode"), type, _ ## name)
+
+#define per_node(var, node)  \
+    (*RELOC_HIDE(&pernode__##var, __pernode_offset[node]))
+
 #endif /* _XEN_NUMA_H */
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index b126dfe887..a32423dcec 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -174,6 +174,14 @@
 #define LOCK_PROFILE_DATA
 #endif
 
+/* Per-node BSS for declaring per_node vars, based on per_cpu, but simpler */
+#define PERNODE_BSS                \
+       . = ALIGN(PAGE_SIZE);       \
+       __pernode_start = .;        \
+       *(.bss.pernode)             \
+       . = ALIGN(SMP_CACHE_BYTES); \
+       __pernode_end = .;          \
+
 #define PERCPU_BSS                 \
        . = ALIGN(PAGE_SIZE);       \
        __per_cpu_start = .;        \
-- 
2.43.0


