Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCEE50E1A1
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312942.530357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyl8-0001fU-7I; Mon, 25 Apr 2022 13:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312942.530357; Mon, 25 Apr 2022 13:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyl8-0001dQ-4A; Mon, 25 Apr 2022 13:28:10 +0000
Received: by outflank-mailman (input) for mailman id 312942;
 Mon, 25 Apr 2022 13:28:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t3WR=VD=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1niyl6-00015u-Al
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:28:08 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8afd2fe7-c49b-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 15:28:07 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id e24so987488wrc.9
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 06:28:07 -0700 (PDT)
Received: from banana.davidvrabel.org.uk (banana.davidvrabel.org.uk.
 [82.70.146.42]) by smtp.googlemail.com with ESMTPSA id
 u16-20020a05600c441000b0038ebcbadcedsm13537782wmn.2.2022.04.25.06.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 06:28:06 -0700 (PDT)
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
X-Inumbo-ID: 8afd2fe7-c49b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q66nx7Wy/YqGPn1l5/c0mTvFEE166ONkgbtWEZVKxwo=;
        b=XsoWHvsZj33NAAIJ9co4HnurggkfaPjaCwv/uJtlnAvB8NFLpyhUJokSRyBtGeCF+J
         LfvpdsGYOU2RRbSS/iZZ39DvqLdSvMYOyMF9Xc5yhqydmeCwS9Z+Z9hCiYzjIgroCo8z
         y8WfEPTfWNCq2hrM0q26CEjiEFwrhpyGQi1ebQ2t2r2iRfaR5W/lcn8LH8M//oTakjCD
         OWZidAiHYIvzPnG08NEf0HYhH9xZaoCJrfgwKvtBjKMH0rR6UaAu0vKES3DmfDrb/hQ3
         j/GkxJDUduyqdj876voK6Q8A6TIquvP1tTtolUUmb7MNu4RkDcZJPEXcsVIcomYYzx2q
         t1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=q66nx7Wy/YqGPn1l5/c0mTvFEE166ONkgbtWEZVKxwo=;
        b=nTDo7iubg+O9mZ+X+WkzU/Fiaw3AfDyAxHVxcBqrGcy9SVQpa97dmuCUnKbmQC/cOo
         xUIjQek2HLTFpiu1Lxxgm12yDieWB7q8uyhSbTMRLi/dAI9drN1VwR6HnmbkHVckba4w
         w+R7BsQLrMjGs7JBZm/iKTlwflHMw8Bcn103rbUciKRB8WJpMWr7mo/E3xQoStPkwz3q
         nl2X580ZbGZix6IsTvxBF1uIKhcHav2Ii9SkokMswLI3VrZ/MVd7qcbxHOReFIGGy5Tk
         YPZT3q4SaMayZ/UZVqmQ7Gb75OvE9kyczVnoLyo03qx2jy/D3v6sEeKjhyQoZXg8Qfjm
         GFaA==
X-Gm-Message-State: AOAM530ijQHiYTDFhRVq5cfAYDBt4x/SN5ZmCd66p3ZIYZjoY2ZNFtPA
	oiIKp4NH27m0alhL5FuVu2nD9N0Lkex3IWRD
X-Google-Smtp-Source: ABdhPJzlEkR6bSWED7iMn1nfjEacFr6YymiG8OgEO+YSYywyqtjslo/mBg3bynqhNODC7MjNmj/JXw==
X-Received: by 2002:adf:e10d:0:b0:207:a386:d7b8 with SMTP id t13-20020adfe10d000000b00207a386d7b8mr14559357wrz.671.1650893286927;
        Mon, 25 Apr 2022 06:28:06 -0700 (PDT)
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
Subject: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
Date: Mon, 25 Apr 2022 14:28:01 +0100
Message-Id: <20220425132801.1076759-1-dvrabel@cantab.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Vrabel <dvrabel@amazon.co.uk>

Heap pages can only be safely allocated and freed with interuupts
enabled as they may require a TLB flush which will send IPIs (on x86).

Normally spinlock debugging would catch calls from the incorrect
context, but not from stop_machine_run() action functions as these are
called with spin lock debugging disabled.

Enhance the assertions in alloc_xenheap_pages() and
alloc_domheap_pages() to check interrupts are enabled. For consistency
the same asserts are used when freeing heap pages.

As an exception, when only 1 PCPU is online, allocations are permitted
with interrupts disabled as any TLB flushes would be local only. This
is necessary during early boot.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
Changes in v4:
- Tweak comment.

Changes in v3:
- Use num_online_cpus() in assert.

Changes in v2:
- Set SYS_STATE_smp_boot on arm.
---
 xen/common/page_alloc.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..739ca6e74b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -162,6 +162,13 @@
 static char __initdata opt_badpage[100] = "";
 string_param("badpage", opt_badpage);
 
+/*
+ * Heap allocations may need TLB flushes which require IRQs to be
+ * enabled (except when only 1 PCPU is online).
+ */
+#define ASSERT_ALLOC_CONTEXT() \
+    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1))
+
 /*
  * no-bootscrub -> Free pages are not zeroed during boot.
  */
@@ -2160,7 +2167,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     pg = alloc_heap_pages(MEMZONE_XEN, MEMZONE_XEN,
                           order, memflags | MEMF_no_scrub, NULL);
@@ -2173,7 +2180,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
@@ -2202,7 +2209,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     struct page_info *pg;
     unsigned int i;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( xenheap_bits && (memflags >> _MEMF_bits) > xenheap_bits )
         memflags &= ~MEMF_bits(~0U);
@@ -2224,7 +2231,7 @@ void free_xenheap_pages(void *v, unsigned int order)
     struct page_info *pg;
     unsigned int i;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
@@ -2249,7 +2256,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 {
     mfn_t smfn, emfn;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     smfn = maddr_to_mfn(round_pgup(ps));
     emfn = maddr_to_mfn(round_pgdown(pe));
@@ -2369,7 +2376,7 @@ struct page_info *alloc_domheap_pages(
     unsigned int bits = memflags >> _MEMF_bits, zone_hi = NR_ZONES - 1;
     unsigned int dma_zone;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
                                       bits ? : (BITS_PER_LONG+PAGE_SHIFT));
@@ -2419,7 +2426,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
     unsigned int i;
     bool drop_dom_ref;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( unlikely(is_xen_heap_page(pg)) )
     {
@@ -2738,7 +2745,7 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
 {
     struct page_info *pg;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
     if ( !pg )
-- 
2.30.2


