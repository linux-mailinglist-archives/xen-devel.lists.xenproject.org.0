Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A575E301A1F
	for <lists+xen-devel@lfdr.de>; Sun, 24 Jan 2021 06:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73574.132462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3YEt-0000cM-Ew; Sun, 24 Jan 2021 05:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73574.132462; Sun, 24 Jan 2021 05:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3YEt-0000c1-Br; Sun, 24 Jan 2021 05:47:07 +0000
Received: by outflank-mailman (input) for mailman id 73574;
 Sun, 24 Jan 2021 05:47:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HqrK=G3=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l3YEr-0000bw-MV
 for xen-devel@lists.xenproject.org; Sun, 24 Jan 2021 05:47:05 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bbe9f68-aa79-4e2e-98df-64f8039fc70c;
 Sun, 24 Jan 2021 05:47:04 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10O5ksjQ000452
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 24 Jan 2021 00:46:59 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10O5krt7000451;
 Sat, 23 Jan 2021 21:46:53 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 3bbe9f68-aa79-4e2e-98df-64f8039fc70c
Message-Id: <202101240546.10O5krt7000451@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Date: Sat, 23 Jan 2021 20:47:38 -0800
Subject: [PATCH] x86/pod: Do not fragment PoD memory allocations
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Previously p2m_pod_set_cache_target() would fall back to allocating 4KB
pages if 2MB pages ran out.  This is counterproductive since it suggests
severe memory pressure and is likely a precursor to a memory exhaustion
panic.  As such don't try to fill requests for 2MB pages from 4KB pages
if 2MB pages run out.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
I'm not including a separate cover message since this is a single hunk.
This really needs some checking in `xl`.  If one has a domain which
sometimes gets started on different hosts and is sometimes modified with
slightly differing settings, one can run into trouble.

In this case most of the time the particular domain is most often used
PV/PVH, but every so often is used as a template for HVM.  Starting it
HVM will trigger PoD mode.  If it is started on a machine with less
memory than others, PoD may well exhaust all memory and then trigger a
panic.

`xl` should likely fail HVM domain creation when the maximum memory
exceeds available memory (never mind total memory).
---
 xen/arch/x86/mm/p2m-pod.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 48e609d1ed..6a7c9ae7d1 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -216,12 +216,10 @@ p2m_pod_set_cache_target(struct p2m_domain *p2m, unsigned long pod_target, int p
         page = alloc_domheap_pages(d, order, 0);
         if ( unlikely(page == NULL) )
         {
-            if ( order == PAGE_ORDER_2M )
-            {
-                /* If we can't allocate a superpage, try singleton pages */
-                order = PAGE_ORDER_4K;
-                goto retry;
-            }
+            /* Superpages allocation failures likely indicate severe memory
+            ** pressure.  Continuing to try to fulfill attempts using 4KB pages
+            ** is likely to exhaust memory and trigger a panic.  As such it is
+            ** NOT worth trying to use 4KB pages to fulfill 2MB page requests.*/
 
             printk("%s: Unable to allocate page for PoD cache (target=%lu cache=%ld)\n",
                    __func__, pod_target, p2m->pod.count);
-- 
2.20.1


