Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4158CEAA7
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729753.1135083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8v-000191-85; Fri, 24 May 2024 20:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729753.1135083; Fri, 24 May 2024 20:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8u-00011V-SX; Fri, 24 May 2024 20:03:56 +0000
Received: by outflank-mailman (input) for mailman id 729753;
 Fri, 24 May 2024 20:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8t-000773-3P
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:55 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be7c9349-1a08-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 22:03:53 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a89787ea4so1184828466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:53 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:51 -0700 (PDT)
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
X-Inumbo-ID: be7c9349-1a08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581032; x=1717185832; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4H8slafbFD5MZ8pWJsbqpEr4l2E5HCz8G8Qyr9VoPE=;
        b=Z/CNqc6CpHqjwoOREq64r09/7yOcRxQblHLWOt3tTFmMwrrAovbMMUuBr++ejXxYid
         b1dzew5fMHnG9wWnUp2aRVjKUCkb4ZodzX9hyDvYTsu9U0Ua5dxJdNVJUkuTXmKm/R28
         NQdRB7Pz1GHhLIX6A1t0V1XGyEYqHa2nELA4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581032; x=1717185832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4H8slafbFD5MZ8pWJsbqpEr4l2E5HCz8G8Qyr9VoPE=;
        b=bkZ3C3IGJqRn91vfuYFBKZ9ukstM+WR/Lfd6aZ+53s4xTOWEJ52S63SLOyz6A5K1o3
         s/YfFK0croI5/ceyLU/dy28e1HE2+Cl1EiYUpc5Xa8uHDFn3GSXS1ZYVmsDI8JAaBM8/
         fL6OnG8WFWzLz3lqvUZyWTRDL/5uG5AHPXNdGG0s1NEwIhIbYI+wMJcCs8RQ6WFTl+50
         BxqTey3TbeUZHdFUCzEwGgG3vwtWe4F6mDUMukYcCX1REKm2yY9+dH8T44qtuOyp8HV6
         KW3QwLniDimRsD1BRnuxj8hpMdD98coPxwKbwLXfzqHSqUSjVmv8FPdxdBNgbxpKcAHT
         QQ5w==
X-Gm-Message-State: AOJu0Yzi30Zlvj5NO8+YUs2AG3ydCzjF0t+qQsM1TRIyE++HAK+AZAOp
	CtnlhDU/2bG0W3pEbNB7okkr1cx1qMrBQisbLO7BgFgQA/hi1JQI6Lsevyi8v9Mgv4EaPgoauaF
	O+xs=
X-Google-Smtp-Source: AGHT+IEFnNtUkkX+5j+8K47eW4QSiYZz+ttxOCsa+8nNZwxQCIEI2xbVmGmD+ZqUVhiUQomAbDPrRg==
X-Received: by 2002:a17:906:c214:b0:a5a:8b8c:6203 with SMTP id a640c23a62f3a-a62646d7f32mr215106166b.45.1716581032090;
        Fri, 24 May 2024 13:03:52 -0700 (PDT)
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
Subject: [PATCH v2 09/13] xen/bitops: Replace find_first_set_bit() with ffsl() - 1
Date: Fri, 24 May 2024 21:03:34 +0100
Message-Id: <20240524200338.1232391-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
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

v2:
 * Reorder from later in the series to keep ARM bisectable

In an x86 build, we get the following delta:

  add/remove: 0/0 grow/shrink: 2/4 up/down: 39/-52 (-13)
  Function                                     old     new   delta
  hpet_write                                  2183    2206     +23
  init_heap_pages                             1222    1238     +16
  dom0_construct_pvh                          3959    3958      -1
  mapping_order                                139     126     -13
  guest_physmap_mark_populate_on_demand       1301    1285     -16
  vcpumask_to_pcpumask                         525     503     -22

so the optimiser improvements for ffsl() really do speak for themselves.

I'm surprised by the increase in hpet_write(), but looking at the code, it
very clearly wants the same treatment as:

  commit 188fa82305e72b725473db9146e20cc9abf7bff3
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Fri Mar 15 11:31:33 2024

      xen/vpci: Improve code generation in mask_write()

which I'm confident will end up as a net improvement.
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
index b0cb96c3bc76..68c08bbe94f7 100644
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
index 12b00b770257..37e765e97df9 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -335,7 +335,7 @@ static void timer_sanitize_int_route(HPETState *h, unsigned int tn)
      * enabled pick the first irq.
      */
     timer_config(h, tn) |=
-        MASK_INSR(find_first_set_bit(timer_int_route_cap(h, tn)),
+        MASK_INSR(ffsl(timer_int_route_cap(h, tn)) - 1,
                   HPET_TN_ROUTE);
 }
 
@@ -409,7 +409,7 @@ static int cf_check hpet_write(
         {
             bool active;
 
-            i = find_first_set_bit(new_val);
+            i = ffsl(new_val) - 1;
             if ( i >= HPET_TIMER_NUM )
                 break;
             __clear_bit(i, &new_val);
@@ -535,14 +535,14 @@ static int cf_check hpet_write(
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
index d968bbbc7315..2a84bdae670b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3424,7 +3424,7 @@ static int vcpumask_to_pcpumask(
         {
             unsigned int cpu;
 
-            vcpu_id = find_first_set_bit(vmask);
+            vcpu_id = ffsl(vmask) - 1;
             vmask &= ~(1UL << vcpu_id);
             vcpu_id += vcpu_bias;
             if ( (vcpu_id >= d->max_vcpus) )
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 1c727c78c833..bd84fe9e27ee 100644
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
@@ -1393,7 +1393,7 @@ guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
                                       unsigned int order)
 {
     unsigned long left = 1UL << order;
-    unsigned int chunk_order = find_first_set_bit(gfn | left);
+    unsigned int chunk_order = ffsl(gfn | left) - 1;
     int rc;
 
     if ( !paging_mode_translate(d) )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 8d3342e95236..054b7edb3989 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1819,7 +1819,7 @@ static void _init_heap_pages(const struct page_info *pg,
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
index ba18136c461c..50bfd62553ae 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -305,7 +305,7 @@ static unsigned int mapping_order(const struct domain_iommu *hd,
 {
     unsigned long res = dfn_x(dfn) | mfn_x(mfn);
     unsigned long sizes = hd->platform_ops->page_sizes;
-    unsigned int bit = find_first_set_bit(sizes), order = 0;
+    unsigned int bit = ffsl(sizes) - 1, order = 0;
 
     ASSERT(bit == PAGE_SHIFT);
 
@@ -313,7 +313,7 @@ static unsigned int mapping_order(const struct domain_iommu *hd,
     {
         unsigned long mask;
 
-        bit = find_first_set_bit(sizes);
+        bit = ffsl(sizes) - 1;
         mask = (1UL << bit) - 1;
         if ( nr <= mask || (res & mask) )
             break;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 304a2f5480c7..cc0062b02712 100644
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


