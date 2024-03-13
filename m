Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6BB87AD28
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 18:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692674.1080060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSO4-0003MQ-U1; Wed, 13 Mar 2024 17:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692674.1080060; Wed, 13 Mar 2024 17:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSO4-0003K3-Q9; Wed, 13 Mar 2024 17:27:32 +0000
Received: by outflank-mailman (input) for mailman id 692674;
 Wed, 13 Mar 2024 17:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkSO2-0001lR-EE
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 17:27:30 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f738e570-e15e-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 18:27:28 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a46682e71a9so9111466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 10:27:28 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906048f00b00a42ee62b634sm5005732eja.106.2024.03.13.10.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:27:27 -0700 (PDT)
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
X-Inumbo-ID: f738e570-e15e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710350848; x=1710955648; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42OziT0p0S95gIbK7k1NI+z53JEbfaX+0bPN+VqyNws=;
        b=NLpoAP1pmRjhQeTgPHFob4IXM4K69d91fLRP41wKjX8WysAXj4kZL0vM96vnQ+z1qV
         RaDsM8kEfO7IVaTz9pVqkr2+1Lo7mWo2/JB6LpJjuywQQ8ZU2rruXSsjeYI7k3PnyPNc
         Vu5/9sGuMKo1LShOrJRfCGAB3f1YOQwjoDAIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350848; x=1710955648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42OziT0p0S95gIbK7k1NI+z53JEbfaX+0bPN+VqyNws=;
        b=GBwY1cv47zhZ5iocf4BPCYspFyaWRP9sOY6jMJeLQUqvExqvcB1duPfURMeH9uoM/T
         li7WuPzTR0I9wB+PkDOXh+Awhj1ajWhqrDCzgJ1QRO/Iz5pMp1fEJw9HqMEncjM17IWE
         PtQCwuQmHULv6KM6rnU3yV6289hVO0j/sGF82Emu7WvCGRViYERvDSRcrHfhMRMtI0EJ
         LBpDe4Efb4HjWHGACGq8zxW996/jIQnPqp8Vt/xU3b5ycAhEU691odoJNpRQScXu3nyL
         Htgn6O71T13nbUPYzUcU/ZyDBZN5pnYJqDScrpqkDJdaUflNj9HTdfbjN5vA8IOvIlFl
         +HGQ==
X-Gm-Message-State: AOJu0Yws3/bs8krlmaBv68J4QoTLquOrc/nKfOq1HrL92R+nTWkIC8sQ
	2eXxFWXXS7cnh0yDqDuW0WxvZmSbzvWgj3yXRgnl8KuHgjzNzHgBkFZHxtUe2rm+qXpYmTT6Fha
	Q
X-Google-Smtp-Source: AGHT+IHDA9kAwEE71Zrgue/ZSZqfSO4un1kmimxgYrjALg0+zIY9/UH8mGWH25XVKZ8g/4LSy1rdDA==
X-Received: by 2002:a17:907:104b:b0:a45:bcac:c7e0 with SMTP id oy11-20020a170907104b00b00a45bcacc7e0mr8414663ejb.65.1710350847919;
        Wed, 13 Mar 2024 10:27:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 6/7] xen: Swap find_first_set_bit() for ffsl() - 1
Date: Wed, 13 Mar 2024 17:27:15 +0000
Message-Id: <20240313172716.2325427-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

find_first_set_bit() is a Xen-ism which has undefined behaviour with a 0
input.  The latter is well defined with an input of 0, and is a found outside
of Xen too.

_init_heap_pages() is the one special case here, comparing the LSB of two
different addresses.  The -1 cancels off both sides of the expression.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/guest/xen/xen.c                 | 4 ++--
 xen/arch/x86/hvm/dom0_build.c                | 2 +-
 xen/arch/x86/hvm/hpet.c                      | 8 ++++----
 xen/arch/x86/include/asm/pt-contig-markers.h | 2 +-
 xen/arch/x86/mm.c                            | 2 +-
 xen/arch/x86/mm/p2m-pod.c                    | 4 ++--
 xen/common/page_alloc.c                      | 2 +-
 xen/common/softirq.c                         | 2 +-
 xen/drivers/passthrough/amd/iommu_map.c      | 2 +-
 xen/drivers/passthrough/iommu.c              | 4 ++--
 xen/drivers/passthrough/x86/iommu.c          | 4 ++--
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index d9768cc9527d..7484b3f73ad3 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -168,14 +168,14 @@ static void cf_check xen_evtchn_upcall(void)
 
     while ( pending )
     {
-        unsigned int l1 = find_first_set_bit(pending);
+        unsigned int l1 = ffsl(pending) - 1;
         unsigned long evtchn = xchg(&XEN_shared_info->evtchn_pending[l1], 0);
 
         __clear_bit(l1, &pending);
         evtchn &= ~XEN_shared_info->evtchn_mask[l1];
         while ( evtchn )
         {
-            unsigned int port = find_first_set_bit(evtchn);
+            unsigned int port = ffsl(evtchn) - 1;
 
             __clear_bit(port, &evtchn);
             port += l1 * BITS_PER_LONG;
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index bbae8a564522..7bc092675628 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -139,7 +139,7 @@ static int __init pvh_populate_memory_range(struct domain *d,
         order = get_order_from_pages(end - start + 1);
         order = min(order ? order - 1 : 0, max_order);
         /* The order allocated and populated must be aligned to the address. */
-        order = min(order, start ? find_first_set_bit(start) : MAX_ORDER);
+        order = min(order, start ? ffsl(start) - 1 : MAX_ORDER);
         page = alloc_domheap_pages(d, order, dom0_memflags | MEMF_no_scrub);
         if ( page == NULL )
         {
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 1db9c0b60ee0..30ec14b24110 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -336,7 +336,7 @@ static void timer_sanitize_int_route(HPETState *h, unsigned int tn)
      * enabled pick the first irq.
      */
     timer_config(h, tn) |=
-        MASK_INSR(find_first_set_bit(timer_int_route_cap(h, tn)),
+        MASK_INSR(ffsl(timer_int_route_cap(h, tn)) - 1,
                   HPET_TN_ROUTE);
 }
 
@@ -410,7 +410,7 @@ static int cf_check hpet_write(
         {
             bool active;
 
-            i = find_first_set_bit(new_val);
+            i = ffsl(new_val) - 1;
             if ( i >= HPET_TIMER_NUM )
                 break;
             __clear_bit(i, &new_val);
@@ -536,14 +536,14 @@ static int cf_check hpet_write(
     /* stop/start timers whos state was changed by this write. */
     while (stop_timers)
     {
-        i = find_first_set_bit(stop_timers);
+        i = ffsl(stop_timers) - 1;
         __clear_bit(i, &stop_timers);
         hpet_stop_timer(h, i, guest_time);
     }
 
     while (start_timers)
     {
-        i = find_first_set_bit(start_timers);
+        i = ffsl(start_timers) - 1;
         __clear_bit(i, &start_timers);
         hpet_set_timer(h, i, guest_time);
     }
diff --git a/xen/arch/x86/include/asm/pt-contig-markers.h b/xen/arch/x86/include/asm/pt-contig-markers.h
index b3c1fe803534..e8c8157d605f 100644
--- a/xen/arch/x86/include/asm/pt-contig-markers.h
+++ b/xen/arch/x86/include/asm/pt-contig-markers.h
@@ -60,7 +60,7 @@ static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
     /* Step 1: Reduce markers in lower numbered entries. */
     while ( i )
     {
-        b = find_first_set_bit(i);
+        b = ffsl(i) - 1;
         i &= ~(1U << b);
         if ( GET_MARKER(pt[i]) <= b )
             break;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 62f5b811bbe8..28e9a159b577 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3418,7 +3418,7 @@ static int vcpumask_to_pcpumask(
         {
             unsigned int cpu;
 
-            vcpu_id = find_first_set_bit(vmask);
+            vcpu_id = ffsl(vmask) - 1;
             vmask &= ~(1UL << vcpu_id);
             vcpu_id += vcpu_bias;
             if ( (vcpu_id >= d->max_vcpus) )
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 65d31e552305..e0ad934d2e30 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -684,7 +684,7 @@ unsigned long
 p2m_pod_decrease_reservation(struct domain *d, gfn_t gfn, unsigned int order)
 {
     unsigned long left = 1UL << order, ret = 0;
-    unsigned int chunk_order = find_first_set_bit(gfn_x(gfn) | left);
+    unsigned int chunk_order = ffsl(gfn_x(gfn) | left) - 1;
 
     do {
         ret += decrease_reservation(d, gfn, chunk_order);
@@ -1384,7 +1384,7 @@ guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
                                       unsigned int order)
 {
     unsigned long left = 1UL << order;
-    unsigned int chunk_order = find_first_set_bit(gfn | left);
+    unsigned int chunk_order = ffsl(gfn | left) - 1;
     int rc;
 
     if ( !paging_mode_translate(d) )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2ec17df9b420..812eac51ea0d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1817,7 +1817,7 @@ static void _init_heap_pages(const struct page_info *pg,
     if ( unlikely(!avail[nid]) )
     {
         bool use_tail = IS_ALIGNED(s, 1UL << MAX_ORDER) &&
-                        (find_first_set_bit(e) <= find_first_set_bit(s));
+                        (ffsl(e) <= ffsl(s));
         unsigned long n;
 
         n = init_node_heap(nid, s, nr_pages, &use_tail);
diff --git a/xen/common/softirq.c b/xen/common/softirq.c
index 321d26902d37..bee4a82009c3 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -48,7 +48,7 @@ static void __do_softirq(unsigned long ignore_mask)
              || cpu_is_offline(cpu) )
             break;
 
-        i = find_first_set_bit(pending);
+        i = ffsl(pending) - 1;
         clear_bit(i, &softirq_pending(cpu));
         (*softirq_handlers[i])();
     }
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index e0f4fe736a8d..f1061bfc798c 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -137,7 +137,7 @@ static void set_iommu_ptes_present(unsigned long pt_mfn,
         ASSERT(!pde->u);
 
         if ( pde > table )
-            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
+            ASSERT(pde->ign0 == ffsl(pde - table) - 1);
         else
             ASSERT(pde->ign0 == CONTIG_LEVEL_SHIFT);
 
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 996c31be1284..67dd8e5cd9e1 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -301,7 +301,7 @@ static unsigned int mapping_order(const struct domain_iommu *hd,
 {
     unsigned long res = dfn_x(dfn) | mfn_x(mfn);
     unsigned long sizes = hd->platform_ops->page_sizes;
-    unsigned int bit = find_first_set_bit(sizes), order = 0;
+    unsigned int bit = ffsl(sizes) - 1, order = 0;
 
     ASSERT(bit == PAGE_SHIFT);
 
@@ -309,7 +309,7 @@ static unsigned int mapping_order(const struct domain_iommu *hd,
     {
         unsigned long mask;
 
-        bit = find_first_set_bit(sizes);
+        bit = ffsl(sizes) - 1;
         mask = (1UL << bit) - 1;
         if ( nr <= mask || (res & mask) )
             break;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index a3fa0aef7c37..d721ea27a033 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -641,7 +641,7 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
     if ( contig_mask )
     {
         /* See pt-contig-markers.h for a description of the marker scheme. */
-        unsigned int i, shift = find_first_set_bit(contig_mask);
+        unsigned int i, shift = ffsl(contig_mask) - 1;
 
         ASSERT((CONTIG_LEVEL_SHIFT & (contig_mask >> shift)) == CONTIG_LEVEL_SHIFT);
 
@@ -652,7 +652,7 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
 
         for ( i = 4; i < PAGE_SIZE / sizeof(*p); i += 4 )
         {
-            p[i + 0] = (find_first_set_bit(i) + 0ULL) << shift;
+            p[i + 0] = (ffsl(i) - 1ULL) << shift;
             p[i + 1] = 0;
             p[i + 2] = 1ULL << shift;
             p[i + 3] = 0;
-- 
2.30.2


