Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1882E507141
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308244.523896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpMW-0004RZ-SQ; Tue, 19 Apr 2022 15:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308244.523896; Tue, 19 Apr 2022 15:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpMW-0004PX-PH; Tue, 19 Apr 2022 15:01:52 +0000
Received: by outflank-mailman (input) for mailman id 308244;
 Tue, 19 Apr 2022 15:01:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nWVz=U5=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1ngpMV-0004PR-4p
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:01:51 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a377e4fb-bff1-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 17:01:49 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id bv16so5689409wrb.9
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 08:01:49 -0700 (PDT)
Received: from pear.davidvrabel.org.uk (pear.davidvrabel.org.uk.
 [82.70.146.41]) by smtp.googlemail.com with ESMTPSA id
 v2-20020adf8b42000000b0020aa790a258sm1711097wra.8.2022.04.19.08.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 08:01:48 -0700 (PDT)
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
X-Inumbo-ID: a377e4fb-bff1-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fa+nO+5zTXoHHur3q9qSPwyJI+3Au1WEuHLSiLtbamw=;
        b=jAEw/Z5vB1WmvUvoA5ChnPexJrjueoVeKWDFMygZmsbswQ2HBCG3U1JVDnTYYd3hw4
         x9l1dAkL3fAGuQHMxtqZBgMpmNMRIFgdLDsf43c7Jik8LRgtYWRWynciDeDpr3f5tRXc
         Qlrmgm6Fatqv/XqTG+pVTfE/swdmlik9EHs1l5kTnsDReTfiXiF9Y7N0XE+e+NyouuzP
         idC1SODdX0RPTIzNx7E7ZrFKHX0F/3bZ0765rV0gpAEUOpQZzvqwXkj0I1o2kW6L4ySB
         VwpsYE1y9OpxSTv3W7/opNTnd3nY5c3htfDs4Dz6ZLKI6frKcRKyvyNastwzwSYEGpDl
         q6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=fa+nO+5zTXoHHur3q9qSPwyJI+3Au1WEuHLSiLtbamw=;
        b=to0KvoO4MSad1RWByrF2UyeZyrjVF3+Mm1bxrB8QCaBkQ4ykmyNkqczzTkeI+ayK+a
         YPAXp2hU4Vz6SNAUYDNW+LqtB7iE8tMquSn1ktH5l2tHDZk8sYwiUcgkybI1X530voyp
         1+973TMZ0GXl7izzyXX/maX+fyO622Pzr8lC3te67DlQf03dX6CYyIEbtdr+omCTOdX4
         +ghKnELiiWeocdLWpsT/16NJzIrG+mqsh/TlOt9afyfwFKeWrtmN5LD4j+Cw3HD3B3dk
         0xy6DcBp4ayzRCAb2SbEr1G5wj7HkDaPNYW2FmtzTqQ1Y7MxHFCJkmmlnXAzMM4a8p7G
         Tf7Q==
X-Gm-Message-State: AOAM533uA7tM3JETHh7I+y/QQHRG9ULmkVIGVabLUsYxtrlncF3raX5u
	lwAjVCZ/AUIwxroqUfuaH6SuHWsW+4M0Mg==
X-Google-Smtp-Source: ABdhPJxAmz6hhl/WIerRhwTNzcHgtazTyyyRMrTZVqSqOx++AJ6uL7ovxbaCjypKbekFp4m+0YB/Ag==
X-Received: by 2002:a5d:658f:0:b0:207:9c0e:1364 with SMTP id q15-20020a5d658f000000b002079c0e1364mr12107299wru.632.1650380508844;
        Tue, 19 Apr 2022 08:01:48 -0700 (PDT)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH v1] page_alloc: assert IRQs are enabled in heap alloc/free
Date: Tue, 19 Apr 2022 16:01:34 +0100
Message-Id: <20220419150134.64704-1-dvrabel@cantab.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Vrabel <dvrabel@amazon.co.uk>

Heap pages can only be safely allocated and freed with interuupts
enabled as they may require a TLB flush which will send IPIs.

Enhance the assertions in alloc_xenheap_pages() and
alloc_domheap_pages() to check interrupts are enabled. For consistency
the same asserts are used when freeing heap pages.

As an exception, during early boot when only 1 PCPU is online,
allocations are permitted with interrupts disabled.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
 xen/common/page_alloc.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..e1ce38df13 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -162,6 +162,14 @@
 static char __initdata opt_badpage[100] = "";
 string_param("badpage", opt_badpage);
 
+/*
+ * Heap allocations may need TLB flushes which require IRQs to be
+ * enabled (except during early boot when only 1 PCPU is online).
+ */
+#define ASSERT_ALLOC_CONTEXT()                                          \
+    ASSERT(!in_irq() && (local_irq_is_enabled()                         \
+                         || system_state < SYS_STATE_smp_boot))
+
 /*
  * no-bootscrub -> Free pages are not zeroed during boot.
  */
@@ -2160,7 +2168,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     pg = alloc_heap_pages(MEMZONE_XEN, MEMZONE_XEN,
                           order, memflags | MEMF_no_scrub, NULL);
@@ -2173,7 +2181,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
@@ -2202,7 +2210,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     struct page_info *pg;
     unsigned int i;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( xenheap_bits && (memflags >> _MEMF_bits) > xenheap_bits )
         memflags &= ~MEMF_bits(~0U);
@@ -2224,7 +2232,7 @@ void free_xenheap_pages(void *v, unsigned int order)
     struct page_info *pg;
     unsigned int i;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
@@ -2249,7 +2257,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 {
     mfn_t smfn, emfn;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     smfn = maddr_to_mfn(round_pgup(ps));
     emfn = maddr_to_mfn(round_pgdown(pe));
@@ -2369,7 +2377,7 @@ struct page_info *alloc_domheap_pages(
     unsigned int bits = memflags >> _MEMF_bits, zone_hi = NR_ZONES - 1;
     unsigned int dma_zone;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
                                       bits ? : (BITS_PER_LONG+PAGE_SHIFT));
@@ -2419,7 +2427,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
     unsigned int i;
     bool drop_dom_ref;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( unlikely(is_xen_heap_page(pg)) )
     {
@@ -2738,7 +2746,7 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
 {
     struct page_info *pg;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
     if ( !pg )
-- 
2.30.2


