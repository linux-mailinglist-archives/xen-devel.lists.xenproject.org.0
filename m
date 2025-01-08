Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1131EA05FDD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867488.1279086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpx-0001xS-7i; Wed, 08 Jan 2025 15:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867488.1279086; Wed, 08 Jan 2025 15:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpx-0001qr-1P; Wed, 08 Jan 2025 15:19:13 +0000
Received: by outflank-mailman (input) for mailman id 867488;
 Wed, 08 Jan 2025 15:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpu-0008Lg-Qr
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8ece51c-cdd3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:19:10 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaf60d85238so1272582266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:10 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:09 -0800 (PST)
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
X-Inumbo-ID: e8ece51c-cdd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349549; x=1736954349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OW3IEcDQIGgERvNx7U/UfHJTPkVf/pejI3zoKLzHcZ4=;
        b=O72zaF7NS/cBoKnHQexNJbYarf9+dYvh96M2k8qFN+wUvi7IkFykhW2VmNbksaR9RH
         7GITDaWY15+x0ChXWeLV2tTNQK9wr5MF5fpkFKzk50tnh8b63vY4FmjPzfZwaWevFmsc
         HZd4+Na3kmOUh0Bm+T8GN2w4ZIGWXWWJz/g+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349549; x=1736954349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OW3IEcDQIGgERvNx7U/UfHJTPkVf/pejI3zoKLzHcZ4=;
        b=ubMthTtbcUycdSEFddVBcOLar8m3BhdxFLsC+JrBm8kwnMD8UIbmiHCXebqMtCpAMb
         0N250MvhkD8MMCJQ25ny2Hsl0uhFVbKVBycAnhyYWJydg/SitilFDK3w1Muq/0TDGnls
         yRN5FjLnJ8wzA+Ff8peQ1nrfGzGEwnbaBS8ZKZAsnJ+CUWyvvBXQc4r0g0JmcSiacuwh
         VBkefj689YhIJvArELCN4CLx6GVRe8+Yw0ePhmmnPFcM95k2tVVH2vmxdxs/Lptzrr4x
         yk861rZ/GQCC2d6jj5ZyEg2w7H15wtANX7n7+TR9qmBBq1zZCe5yOLWrWxSxMT4J4/kW
         9E2w==
X-Gm-Message-State: AOJu0YzjYDDbIjY6KIW+QfbS8rlNMFZvwf5ERV+SquDIDEMguUlka7Y2
	bCWhoxZIXjavxBMZko1UIB5vqn3g8ufLrGP0GYLvgQBXnTPyuVqD+ajrR3u7J5K2RYb607bQU4J
	hANFuoQ==
X-Gm-Gg: ASbGncvzo5Oj155b46FsIDMSDAghELqsQYQsXnXFn5YxM4usWrbSB4G99/grBwuoYoT
	1KTp1SeJF6PFq9w2cZsmep6Z+avuWkmgKKnIcfyuEbWf9fY/X8OOBgmo687Z1KRqeJnTYRZMFP0
	PRZyIAAyin8UI8AxLNkCkdndwgeC1z2DtlmU3bHe/BcKUkmwCoc/jJWhpclR8RAyNp9iyPUeJ/5
	VblwUkN5KT7O2hSw236f7jeKYzZZN52bWBx3IzNwMcJ38SysdcCJovdWHIgomDw8bLoueOUig8g
	Xvc=
X-Google-Smtp-Source: AGHT+IEHcvVuDBftNzgvsSJjl9/9ijtvIIRWM0K6YyDq9Uo03CAZE0TpiiTY8VB9i1idNueu4C4Prg==
X-Received: by 2002:a17:907:80c:b0:aab:daf9:972 with SMTP id a640c23a62f3a-ab2ab70c9afmr294425966b.28.1736349549423;
        Wed, 08 Jan 2025 07:19:09 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 08/15] xen/page_alloc: Add a path for xenheap when there is no direct map
Date: Wed,  8 Jan 2025 15:18:15 +0000
Message-ID: <20250108151822.16030-9-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

When there is not an always-mapped direct map, xenheap allocations need
to be mapped and unmapped on-demand.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * Remove stray comma in printk() after XENLOG_WARNING.

Elias @ v4:
  I have left the call to map_pages_to_xen() and destroy_xen_mappings()
  in the split heap for now. I am not entirely convinced this is
necessary
  because in that setup only the xenheap would be always mapped and
  this doesn't contain any guest memory (aside the grant-table).
  So map/unmapping for every allocation seems unnecessary.

v3->v4:
  * Call printk instead of dprintk()

v1->v2:
  * Fix remaining wrong indentation in alloc_xenheap_pages()

Changes since Hongyan's version:
  * Rebase
  * Fix indentation in alloc_xenheap_pages()
  * Fix build for arm32
---
 xen/common/page_alloc.c | 43 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1bf070c8c5df..1c01332b6cb0 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2435,6 +2435,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
+    void *virt_addr;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2443,17 +2444,36 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
-    return page_to_virt(pg);
+    virt_addr = page_to_virt(pg);
+
+    if ( !has_directmap() &&
+         map_pages_to_xen((unsigned long)virt_addr, page_to_mfn(pg), 1UL << order,
+                          PAGE_HYPERVISOR) )
+    {
+        /* Failed to map xenheap pages. */
+        free_heap_pages(pg, order, false);
+        return NULL;
+    }
+
+    return virt_addr;
 }
 
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
+    unsigned long va = (unsigned long)v & PAGE_MASK;
+
     ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
 
+    if ( !has_directmap() &&
+         destroy_xen_mappings(va, va + (PAGE_SIZE << order)) )
+        printk(XENLOG_WARNING
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order);
+
     free_heap_pages(virt_to_page(v), order, false);
 }
 
@@ -2477,6 +2497,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
     unsigned int i;
+    void *virt_addr;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2489,16 +2510,28 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
+    virt_addr = page_to_virt(pg);
+
+    if ( !has_directmap() &&
+         map_pages_to_xen((unsigned long)virt_addr, page_to_mfn(pg), 1UL << order,
+                          PAGE_HYPERVISOR) )
+    {
+        /* Failed to map xenheap pages. */
+        free_domheap_pages(pg, order);
+        return NULL;
+    }
+
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info |= PGC_xen_heap;
 
-    return page_to_virt(pg);
+    return virt_addr;
 }
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
     struct page_info *pg;
     unsigned int i;
+    unsigned long va = (unsigned long)v & PAGE_MASK;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2510,6 +2543,12 @@ void free_xenheap_pages(void *v, unsigned int order)
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info &= ~PGC_xen_heap;
 
+    if ( !has_directmap() &&
+         destroy_xen_mappings(va, va + (PAGE_SIZE << order)) )
+        printk(XENLOG_WARNING
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order);
+
     free_heap_pages(pg, order, true);
 }
 
-- 
2.47.1


