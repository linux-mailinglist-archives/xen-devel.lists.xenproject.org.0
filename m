Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F4509DDC
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 12:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310018.526600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhUHm-0000fY-34; Thu, 21 Apr 2022 10:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310018.526600; Thu, 21 Apr 2022 10:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhUHl-0000cs-Vh; Thu, 21 Apr 2022 10:43:41 +0000
Received: by outflank-mailman (input) for mailman id 310018;
 Thu, 21 Apr 2022 10:43:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5++L=U7=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1nhUHk-0000cm-O8
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 10:43:40 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7b82409-c15f-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 12:43:39 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id b19so6045312wrh.11
 for <xen-devel@lists.xenproject.org>; Thu, 21 Apr 2022 03:43:39 -0700 (PDT)
Received: from banana.davidvrabel.org.uk (banana.davidvrabel.org.uk.
 [82.70.146.42]) by smtp.googlemail.com with ESMTPSA id
 r3-20020a1c2b03000000b00392a3e6280bsm1790450wmr.8.2022.04.21.03.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 03:43:38 -0700 (PDT)
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
X-Inumbo-ID: e7b82409-c15f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMoTPeB7BTLpWOQfhuwiocjrzUK1wUCWzqs0ZSxBB7E=;
        b=Y3bn8wqcPwYxKKdf4DG25sqqv7W6UVZIiFzt5hVnYhTBvsbvE0kbVmkYEQH2rmdVgJ
         uBdik4pOaEo+lYU/2ev+OOh640tLaOSu62BcHJsx7wRp1PYgiN9T1STRIiKmEktOx5qD
         u2v6+XbYuDruSCSPlyrqR28tUZy1Y70aJf4Gilll/5j/NKrUNjlok4FyYm2IItoAlJVY
         y2lzjtoRE0ZWO4KaTHIdGNMFlaiEWge8F7HvZg75pid7yo+68bakUl7O/JM5ou1AnD5M
         nbTBfvDPzPzIqEUmtm9RbmVaB4iYNADocy6gtlHEgrByCD77SgwSR2X3vkYoUrUhkBOs
         Lf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=wMoTPeB7BTLpWOQfhuwiocjrzUK1wUCWzqs0ZSxBB7E=;
        b=iBDzb5zH2ZAsLTfs2wCpd+czbR1hCbJGAh8DYgpDVoNIjD+pSI+v0kxYyAet14Xpn9
         rfqLiVuwcAgkrW5q47aTdA3PnVZtKhUE62X760OX5SYgz2dRXYxkWQs3vVRtweJ2q5sH
         rB6jVDYB/eqMDllmEaroD1Uxk6HW2uZ79qudTxaFXxPybHVAGPR75r++hM2WFZY3lxDl
         eu3qIGCg0X5z64ljLBdxtYgP6gf/Xuz4N90asC0qizJFBfrtGryP6cxkNw8t4dweoN/8
         1QbiZGseRmX30qIdfaxpxoSZTA06FflkrWejWpJm40Q3Buv5amLhQaV1gRivoLVB8pDh
         B3cw==
X-Gm-Message-State: AOAM531dsK/u+riWAFW9HXWAww7Hq4LRWqmFnZhLihfbFlup27u4ebM6
	znoHK0r4jGkj/oeDNBZpGv7KgajwtPEYeA==
X-Google-Smtp-Source: ABdhPJzglbNJLubVHZR+/nGmnbV/4mNnNj9ygNPA++nq5bkeqHoeq24mWFgc21kiLFTFfrejjWVxYg==
X-Received: by 2002:a5d:48cc:0:b0:206:d17:10aa with SMTP id p12-20020a5d48cc000000b002060d1710aamr19188725wrs.460.1650537819156;
        Thu, 21 Apr 2022 03:43:39 -0700 (PDT)
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
Subject: [PATCH v2] page_alloc: assert IRQs are enabled in heap alloc/free
Date: Thu, 21 Apr 2022 11:43:05 +0100
Message-Id: <20220421104305.878204-1-dvrabel@cantab.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Vrabel <dvrabel@amazon.co.uk>

Heap pages can only be safely allocated and freed with interuupts
enabled as they may require a TLB flush which will send IPIs.

Normally spinlock debugging would catch calls from the incorrect
context, but not from stop_machine_run() action functions as these are
called with spin lock debugging disabled.

Enhance the assertions in alloc_xenheap_pages() and
alloc_domheap_pages() to check interrupts are enabled. For consistency
the same asserts are used when freeing heap pages.

As an exception, during early boot when only 1 PCPU is online,
allocations are permitted with interrupts disabled. This required
setting the SYS_STATE_smp_boot system state on arm, to match x86.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
Changes in v2:
- Set SYS_STATE_smp_boot on arm.
---
 xen/arch/arm/setup.c    |  2 ++
 xen/common/page_alloc.c | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..44d45f1449 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -984,6 +984,8 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     console_init_postirq();
 
+    system_state = SYS_STATE_smp_boot
+
     do_presmp_initcalls();
 
     for_each_present_cpu ( i )
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


