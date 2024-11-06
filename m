Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5E9BE910
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830876.1245978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAK-0004Te-QD; Wed, 06 Nov 2024 12:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830876.1245978; Wed, 06 Nov 2024 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAK-0004N3-N2; Wed, 06 Nov 2024 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 830876;
 Wed, 06 Nov 2024 12:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8fAJ-0004J0-83
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:29:39 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c872ffdc-9c3a-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 13:29:35 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so8426919e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:29:35 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb17ceb1dsm279896566b.101.2024.11.06.04.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 04:29:34 -0800 (PST)
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
X-Inumbo-ID: c872ffdc-9c3a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzAiLCJoZWxvIjoibWFpbC1sZjEteDEzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM4NzJmZmRjLTljM2EtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODk2MTc1LjgwMzA5Nywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730896174; x=1731500974; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzbBlr96+9j+wwmKx3UJvbDOiCZlb8PgkREFn+hF5mw=;
        b=rnN0oUGGrrmNNe0Uqqy0+bHsLGUdvkyIjcSi739LRb8jsKM27uWAnS9gIP/vcbuPhu
         4SkGIJxYTQskl2LpUIFRqJbxL1aAUJZkJq406+Bw4+U6RuI7wK3CsTSaG46GRzjFQ13f
         Krz1UX+hMQyTEKbuCNJFAiu+HZP4Oql1AKM1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896174; x=1731500974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzbBlr96+9j+wwmKx3UJvbDOiCZlb8PgkREFn+hF5mw=;
        b=rFHyt8uEcvs/tyOb+JRkE0r1QOiB1SfJykbK3BQf3Axc8A90DvrV4eNIFX1ZOYaaWK
         L+smo1Ip9X4Gz/2oYkAaes6QD33KlslFE2cBS+2/byQTKUzLQ7n1vrDHX5aVHe7i3tr9
         IPTkEcmJFB3mSLUY0KfrYYIW5UD4KCIVmHcXqdOWuLH3FaoFDzwyyA1UaOQ2NW7/D861
         NiiEMyDcjr+/Vkfc3Ha5oH4Bgjn/gyGtT99DEFzyi0F2KUSykelxzCrrkLoVyVZHGrGf
         OcpNBl4Tbga2xgcCyYl9eUKiErzoJv0ZjGaBQezie6oC9Mfi1zgWMvbrJbCOqxDdGgYj
         7C2w==
X-Gm-Message-State: AOJu0YyNTTjzsrtKk+w5oY0Kx3envJ0QJJE68wil6C9iDr7AaOcnUK8+
	cYwrzIBu2yuALq24p4Ix9SiOa8bb0SaCVMqBiCdcyy92dPLSNtuVSvTa4wO523Sm6bqkHZ0+a1c
	B
X-Google-Smtp-Source: AGHT+IEP3IuYlL8NsaTGkDIQ+BpLLRbxnDOeFPrYMtdnosljz5T5fScqD2EAyqOeWgLhYKHVfDJMvw==
X-Received: by 2002:a05:6512:10c7:b0:539:f06c:6f1d with SMTP id 2adb3069b0e04-53c79ea5346mr11836174e87.55.1730896174360;
        Wed, 06 Nov 2024 04:29:34 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/4] x86/mm: introduce helpers to detect super page alignment
Date: Wed,  6 Nov 2024 13:29:24 +0100
Message-ID: <20241106122927.26461-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241106122927.26461-1-roger.pau@citrix.com>
References: <20241106122927.26461-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that detects whether the physical and linear address of a
mapping request are suitable to be used in an L3 or L2 slot.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/page.h |  6 ++++++
 xen/arch/x86/mm.c               | 11 +++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index e01af28916b0..6970916d61d5 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -200,6 +200,12 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
 #define l4_table_offset(a)         \
     (((a) >> L4_PAGETABLE_SHIFT) & (L4_PAGETABLE_ENTRIES - 1))
 
+/* Check if an address is aligned for a given slot level. */
+#define SLOT_IS_ALIGNED(v, m, s) \
+    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << ((s) - PAGE_SHIFT)) - 1)
+#define IS_L3E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L3_PAGETABLE_SHIFT)
+#define IS_L2E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L2_PAGETABLE_SHIFT)
+
 /* Convert a pointer to a page-table entry into pagetable slot index. */
 #define pgentry_ptr_to_slot(_p)    \
     (((unsigned long)(_p) & ~PAGE_MASK) / sizeof(*(_p)))
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d537a799bced..8f7c397a82d4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5249,9 +5249,7 @@ int map_pages_to_xen(
         L3T_LOCK(current_l3page);
         ol3e = *pl3e;
 
-        if ( cpu_has_page1gb &&
-             !(((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
-               ((1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1)) &&
+        if ( cpu_has_page1gb && IS_L3E_ALIGNED(virt, mfn) &&
              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
         {
@@ -5370,8 +5368,7 @@ int map_pages_to_xen(
         if ( !pl2e )
             goto out;
 
-        if ( ((((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
-               ((1u << PAGETABLE_ORDER) - 1)) == 0) &&
+        if ( IS_L2E_ALIGNED(virt, mfn) &&
              (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
              !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
         {
@@ -5541,9 +5538,7 @@ int map_pages_to_xen(
  check_l3:
         if ( cpu_has_page1gb &&
              (flags == PAGE_HYPERVISOR) &&
-             ((nr_mfns == 0) ||
-              !(((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
-                ((1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1))) )
+             ((nr_mfns == 0) || IS_L3E_ALIGNED(virt, mfn)) )
         {
             unsigned long base_mfn;
             const l2_pgentry_t *l2t;
-- 
2.46.0


