Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB0693D624
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765509.1176120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMur-0008Ki-FS; Fri, 26 Jul 2024 15:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765509.1176120; Fri, 26 Jul 2024 15:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMur-0008Ip-CC; Fri, 26 Jul 2024 15:31:33 +0000
Received: by outflank-mailman (input) for mailman id 765509;
 Fri, 26 Jul 2024 15:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMup-00084Z-Dm
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:31 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2124b10b-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:31:30 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7a1d024f775so52880185a.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:30 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8f83d4sm17591006d6.35.2024.07.26.08.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:28 -0700 (PDT)
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
X-Inumbo-ID: 2124b10b-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007889; x=1722612689; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8/eLzGKCNNaqp81P/ebP+yU7jUBZnj71z4rM4VxIFc=;
        b=qO0jKsIZ8iWXK45vr0ZvmZnaxWd/D6nA1AwpS7MPmv9BYvqhE5TCpM7ix54kTCuyXz
         ZuRXeH03rj0DOJtRC3hBNlKgz1RrCbhuq7V2M1KaRMnpqQ0nUiVYSPY8LU4aVWonlrs0
         +fCNPguGDLb5rC1YHRqHPCvBpWSWGmESrPW6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007889; x=1722612689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8/eLzGKCNNaqp81P/ebP+yU7jUBZnj71z4rM4VxIFc=;
        b=KbPRU3K0gyfhG0UpnLN/Y22ngEwgaLOHToPz1bfYq+QnzM6RUTtknr8DcagpV1IAYS
         Pw1vUitt/ngcHrEkG6gOo2qjv59qepG27SSt2haqY1Z/hq8Yixew+d9aApKSM0ZdhjfT
         +TlCOwe5ae/mwH4brkxCpjd50y0t47qZ2GhuZv6FOCRbs/vm2gv3THSGDVt8j6rS4hFa
         x1Wux0T5rTsWo5CI9Wa0gzMyeN3si99Bs4TgYu7ZBdVw7vOc90cJVikxS39TRP9biK4u
         06cWL3viIjfc/zVpOKEc3aTBvCmTuOwnyiSO6W/rFBUHaGQA0goSbWVba6lbaScpL+T2
         4PfQ==
X-Gm-Message-State: AOJu0YxMA+C+swB2Q26QClHB+8JHvY2Jim8WZIqRQFQPsvBG0U7E++Fg
	SpcVAxpr3pY43e/MfigfgC+KkKke/yxTUNxyYydKC2uIZbLwBFnKOK4tIBoyeHaJVGYchkinvR2
	l
X-Google-Smtp-Source: AGHT+IFLtsWsY1JYEGzPRoLeoM/bqF2ayyF64j8qdM3N2504+XrbCNnIhwNYx2hvnFRpCWiQHayJQw==
X-Received: by 2002:a05:6214:4106:b0:6b5:423:52bc with SMTP id 6a1803df08f44-6bb559f8dd9mr1901106d6.3.1722007888414;
        Fri, 26 Jul 2024 08:31:28 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 01/22] x86/mm: drop l{1,2,3,4}e_write_atomic()
Date: Fri, 26 Jul 2024 17:21:45 +0200
Message-ID: <20240726152206.28411-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The l{1,2,3,4}e_write_atomic() and non _atomic suffixed helpers share the same
implementation, so it seems pointless and possibly confusing to have both.

Remove the l{1,2,3,4}e_write_atomic() helpers and switch it's user to
l{1,2,3,4}e_write(), as that's also atomic.  While there also remove
pte_write{,_atomic}() and just use write_atomic() in the wrappers.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/page.h        | 21 +++-----------
 xen/arch/x86/include/asm/x86_64/page.h |  2 --
 xen/arch/x86/mm.c                      | 39 +++++++++++---------------
 3 files changed, 20 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index 350d1fb1100f..3d20ee507a33 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -26,27 +26,14 @@
     l4e_from_intpte(pte_read_atomic(&l4e_get_intpte(*(l4ep))))
 
 /* Write a pte atomically to memory. */
-#define l1e_write_atomic(l1ep, l1e) \
-    pte_write_atomic(&l1e_get_intpte(*(l1ep)), l1e_get_intpte(l1e))
-#define l2e_write_atomic(l2ep, l2e) \
-    pte_write_atomic(&l2e_get_intpte(*(l2ep)), l2e_get_intpte(l2e))
-#define l3e_write_atomic(l3ep, l3e) \
-    pte_write_atomic(&l3e_get_intpte(*(l3ep)), l3e_get_intpte(l3e))
-#define l4e_write_atomic(l4ep, l4e) \
-    pte_write_atomic(&l4e_get_intpte(*(l4ep)), l4e_get_intpte(l4e))
-
-/*
- * Write a pte safely but non-atomically to memory.
- * The PTE may become temporarily not-present during the update.
- */
 #define l1e_write(l1ep, l1e) \
-    pte_write(&l1e_get_intpte(*(l1ep)), l1e_get_intpte(l1e))
+    write_atomic(&l1e_get_intpte(*(l1ep)), l1e_get_intpte(l1e))
 #define l2e_write(l2ep, l2e) \
-    pte_write(&l2e_get_intpte(*(l2ep)), l2e_get_intpte(l2e))
+    write_atomic(&l2e_get_intpte(*(l2ep)), l2e_get_intpte(l2e))
 #define l3e_write(l3ep, l3e) \
-    pte_write(&l3e_get_intpte(*(l3ep)), l3e_get_intpte(l3e))
+    write_atomic(&l3e_get_intpte(*(l3ep)), l3e_get_intpte(l3e))
 #define l4e_write(l4ep, l4e) \
-    pte_write(&l4e_get_intpte(*(l4ep)), l4e_get_intpte(l4e))
+    write_atomic(&l4e_get_intpte(*(l4ep)), l4e_get_intpte(l4e))
 
 /* Get direct integer representation of a pte's contents (intpte_t). */
 #define l1e_get_intpte(x)          ((x).l1)
diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
index 19ca64d79223..03fcce61c052 100644
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -70,8 +70,6 @@ typedef l4_pgentry_t root_pgentry_t;
 #endif /* !__ASSEMBLY__ */
 
 #define pte_read_atomic(ptep)       read_atomic(ptep)
-#define pte_write_atomic(ptep, pte) write_atomic(ptep, pte)
-#define pte_write(ptep, pte)        write_atomic(ptep, pte)
 
 /* Given a virtual address, get an entry offset into a linear page table. */
 #define l1_linear_offset(_a) (((_a) & VADDR_MASK) >> L1_PAGETABLE_SHIFT)
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 95795567f2a5..fab2de5fae27 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5253,7 +5253,7 @@ int map_pages_to_xen(
              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
         {
             /* 1GB-page mapping. */
-            l3e_write_atomic(pl3e, l3e_from_mfn(mfn, l1f_to_lNf(flags)));
+            l3e_write(pl3e, l3e_from_mfn(mfn, l1f_to_lNf(flags)));
 
             if ( (l3e_get_flags(ol3e) & _PAGE_PRESENT) )
             {
@@ -5353,8 +5353,7 @@ int map_pages_to_xen(
             if ( (l3e_get_flags(*pl3e) & _PAGE_PRESENT) &&
                  (l3e_get_flags(*pl3e) & _PAGE_PSE) )
             {
-                l3e_write_atomic(pl3e,
-                                 l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
+                l3e_write(pl3e, l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
                 l2mfn = INVALID_MFN;
             }
             if ( locking )
@@ -5375,7 +5374,7 @@ int map_pages_to_xen(
         {
             /* Super-page mapping. */
             ol2e = *pl2e;
-            l2e_write_atomic(pl2e, l2e_from_mfn(mfn, l1f_to_lNf(flags)));
+            l2e_write(pl2e, l2e_from_mfn(mfn, l1f_to_lNf(flags)));
 
             if ( (l2e_get_flags(ol2e) & _PAGE_PRESENT) )
             {
@@ -5457,8 +5456,7 @@ int map_pages_to_xen(
                 if ( (l2e_get_flags(*pl2e) & _PAGE_PRESENT) &&
                      (l2e_get_flags(*pl2e) & _PAGE_PSE) )
                 {
-                    l2e_write_atomic(pl2e, l2e_from_mfn(l1mfn,
-                                                        __PAGE_HYPERVISOR));
+                    l2e_write(pl2e, l2e_from_mfn(l1mfn, __PAGE_HYPERVISOR));
                     l1mfn = INVALID_MFN;
                 }
                 if ( locking )
@@ -5471,7 +5469,7 @@ int map_pages_to_xen(
             if ( !pl1e )
                 pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(virt);
             ol1e  = *pl1e;
-            l1e_write_atomic(pl1e, l1e_from_mfn(mfn, flags));
+            l1e_write(pl1e, l1e_from_mfn(mfn, flags));
             UNMAP_DOMAIN_PAGE(pl1e);
             if ( (l1e_get_flags(ol1e) & _PAGE_PRESENT) )
             {
@@ -5524,8 +5522,7 @@ int map_pages_to_xen(
                 UNMAP_DOMAIN_PAGE(l1t);
                 if ( i == L1_PAGETABLE_ENTRIES )
                 {
-                    l2e_write_atomic(pl2e, l2e_from_pfn(base_mfn,
-                                                        l1f_to_lNf(flags)));
+                    l2e_write(pl2e, l2e_from_pfn(base_mfn, l1f_to_lNf(flags)));
                     if ( locking )
                         spin_unlock(&map_pgdir_lock);
                     flush_area(virt - PAGE_SIZE,
@@ -5574,8 +5571,7 @@ int map_pages_to_xen(
             UNMAP_DOMAIN_PAGE(l2t);
             if ( i == L2_PAGETABLE_ENTRIES )
             {
-                l3e_write_atomic(pl3e, l3e_from_pfn(base_mfn,
-                                                    l1f_to_lNf(flags)));
+                l3e_write(pl3e, l3e_from_pfn(base_mfn, l1f_to_lNf(flags)));
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(virt - PAGE_SIZE,
@@ -5674,7 +5670,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                     : l3e_from_pfn(l3e_get_pfn(*pl3e),
                                    (l3e_get_flags(*pl3e) & ~FLAGS_MASK) | nf);
 
-                l3e_write_atomic(pl3e, nl3e);
+                l3e_write(pl3e, nl3e);
                 v += 1UL << L3_PAGETABLE_SHIFT;
                 continue;
             }
@@ -5696,8 +5692,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             if ( (l3e_get_flags(*pl3e) & _PAGE_PRESENT) &&
                  (l3e_get_flags(*pl3e) & _PAGE_PSE) )
             {
-                l3e_write_atomic(pl3e,
-                                 l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
+                l3e_write(pl3e, l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
                 l2mfn = INVALID_MFN;
             }
             if ( locking )
@@ -5732,7 +5727,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                     : l2e_from_pfn(l2e_get_pfn(*pl2e),
                                    (l2e_get_flags(*pl2e) & ~FLAGS_MASK) | nf);
 
-                l2e_write_atomic(pl2e, nl2e);
+                l2e_write(pl2e, nl2e);
                 v += 1UL << L2_PAGETABLE_SHIFT;
             }
             else
@@ -5755,8 +5750,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( (l2e_get_flags(*pl2e) & _PAGE_PRESENT) &&
                      (l2e_get_flags(*pl2e) & _PAGE_PSE) )
                 {
-                    l2e_write_atomic(pl2e, l2e_from_mfn(l1mfn,
-                                                        __PAGE_HYPERVISOR));
+                    l2e_write(pl2e, l2e_from_mfn(l1mfn, __PAGE_HYPERVISOR));
                     l1mfn = INVALID_MFN;
                 }
                 if ( locking )
@@ -5785,7 +5779,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 : l1e_from_pfn(l1e_get_pfn(*pl1e),
                                (l1e_get_flags(*pl1e) & ~FLAGS_MASK) | nf);
 
-            l1e_write_atomic(pl1e, nl1e);
+            l1e_write(pl1e, nl1e);
             UNMAP_DOMAIN_PAGE(pl1e);
             v += PAGE_SIZE;
 
@@ -5824,7 +5818,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             if ( i == L1_PAGETABLE_ENTRIES )
             {
                 /* Empty: zap the L2E and free the L1 page. */
-                l2e_write_atomic(pl2e, l2e_empty());
+                l2e_write(pl2e, l2e_empty());
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
@@ -5868,7 +5862,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             if ( i == L2_PAGETABLE_ENTRIES )
             {
                 /* Empty: zap the L3E and free the L2 page. */
-                l3e_write_atomic(pl3e, l3e_empty());
+                l3e_write(pl3e, l3e_empty());
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
@@ -5940,7 +5934,7 @@ void init_or_livepatch modify_xen_mappings_lite(
         {
             ASSERT(IS_ALIGNED(v, 1UL << L2_PAGETABLE_SHIFT));
 
-            l2e_write_atomic(pl2e, l2e_from_intpte((l2e.l2 & ~fm) | flags));
+            l2e_write(pl2e, l2e_from_intpte((l2e.l2 & ~fm) | flags));
 
             v += 1UL << L2_PAGETABLE_SHIFT;
             continue;
@@ -5958,8 +5952,7 @@ void init_or_livepatch modify_xen_mappings_lite(
 
                 ASSERT(l1f & _PAGE_PRESENT);
 
-                l1e_write_atomic(pl1e,
-                                 l1e_from_intpte((l1e.l1 & ~fm) | flags));
+                l1e_write(pl1e, l1e_from_intpte((l1e.l1 & ~fm) | flags));
 
                 v += 1UL << L1_PAGETABLE_SHIFT;
 
-- 
2.45.2


