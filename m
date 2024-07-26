Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A8793D627
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765510.1176129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMus-00007O-Ls; Fri, 26 Jul 2024 15:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765510.1176129; Fri, 26 Jul 2024 15:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMus-00005k-JD; Fri, 26 Jul 2024 15:31:34 +0000
Received: by outflank-mailman (input) for mailman id 765510;
 Fri, 26 Jul 2024 15:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMus-00084T-2x
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:34 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 225b2650-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:31:32 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7a1dea79e1aso46018885a.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:32 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73b6030sm184648085a.52.2024.07.26.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:30 -0700 (PDT)
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
X-Inumbo-ID: 225b2650-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007891; x=1722612691; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKymiwpMPZJ5/hzGvo04irbMOh4ckmWGExUi8izxgEY=;
        b=g2CZh8PzJVV6cSccLzcfZao96z+rrxvlhV/jpqKyjIwTYzWn5GNoDkKHugM3d1P8j1
         lrwSyBWFFNxJi8Jpff7C/MrhR5XtaJUe36O5gVmv4+WHywNE0swkG3eHDnrOVOq+lit0
         u5E225yvs1PGMM2skBwlh3CGPKStapi7dFUj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007891; x=1722612691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKymiwpMPZJ5/hzGvo04irbMOh4ckmWGExUi8izxgEY=;
        b=vSdKYiFYkWjuXCI8mzRNXYK1CEZSjuUitWYsH/SyxTIVhnfIOh5H14vJP2cfsBc6jU
         KjIXu6ll/smE4u1LEax5IwHKWOdM08RbIzfEB9p6flTTAzmdMybxOhihOQlwFEHoRTRR
         0LzIRCRj2ELUUadJJGWMWQoRkulQ6Do3dZ55QzAJujmfXFrDi7WdQEeOTWXXSIiLa6U2
         77CD+Xy+7jWC/3sVOmyHwsAY//yAZ/yfM2Ri2V04ow/vrH5IGHZzHJcFpt6Jf7qmQNtj
         L61/C7ka8lZbPSQIE8n16+0rqqpBB31YRO5iorVDyJfoyTbEx+jaZU+Xxt8Whse0AIQr
         W6YA==
X-Gm-Message-State: AOJu0Yz7d048j2LP1tJ34vJ0VJG5C/2ibTLtgthsvBTI5UYbTuGseBja
	iinc3ANkEJIvyj7TB9xBCFnybJcFP+zIOzcxR5//lccavS8h5nZdeNqZhV1y9NeC4n4FNPZjJ94
	G
X-Google-Smtp-Source: AGHT+IEdUO0MI9dsyDOfxgyck3T6p5fTlRG7Ie+Y+ECT2UK0qouUz1Bg+vc3njuND80gxH1JaE/PaQ==
X-Received: by 2002:a05:620a:4013:b0:79f:17af:e360 with SMTP id af79cd13be357-7a1e525e9c4mr11217485a.33.1722007890580;
        Fri, 26 Jul 2024 08:31:30 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 02/22] x86/mm: rename l{1,2,3,4}e_read_atomic()
Date: Fri, 26 Jul 2024 17:21:46 +0200
Message-ID: <20240726152206.28411-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no l{1,2,3,4}e_read() implementation, so drop the _atomic suffix from
the read helpers.  This allows unifying the naming with the write helpers,
which are also atomic but don't have the suffix already: l{1,2,3,4}e_write().

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/page.h        | 16 ++++++++--------
 xen/arch/x86/include/asm/x86_64/page.h |  2 --
 xen/arch/x86/mm.c                      | 12 ++++++------
 xen/arch/x86/traps.c                   |  8 ++++----
 4 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index 3d20ee507a33..e48571de9332 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -16,14 +16,14 @@
 #include <asm/x86_64/page.h>
 
 /* Read a pte atomically from memory. */
-#define l1e_read_atomic(l1ep) \
-    l1e_from_intpte(pte_read_atomic(&l1e_get_intpte(*(l1ep))))
-#define l2e_read_atomic(l2ep) \
-    l2e_from_intpte(pte_read_atomic(&l2e_get_intpte(*(l2ep))))
-#define l3e_read_atomic(l3ep) \
-    l3e_from_intpte(pte_read_atomic(&l3e_get_intpte(*(l3ep))))
-#define l4e_read_atomic(l4ep) \
-    l4e_from_intpte(pte_read_atomic(&l4e_get_intpte(*(l4ep))))
+#define l1e_read(l1ep) \
+    l1e_from_intpte(read_atomic(&l1e_get_intpte(*(l1ep))))
+#define l2e_read(l2ep) \
+    l2e_from_intpte(read_atomic(&l2e_get_intpte(*(l2ep))))
+#define l3e_read(l3ep) \
+    l3e_from_intpte(read_atomic(&l3e_get_intpte(*(l3ep))))
+#define l4e_read(l4ep) \
+    l4e_from_intpte(read_atomic(&l4e_get_intpte(*(l4ep))))
 
 /* Write a pte atomically to memory. */
 #define l1e_write(l1ep, l1e) \
diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
index 03fcce61c052..465a70731214 100644
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -69,8 +69,6 @@ typedef l4_pgentry_t root_pgentry_t;
 
 #endif /* !__ASSEMBLY__ */
 
-#define pte_read_atomic(ptep)       read_atomic(ptep)
-
 /* Given a virtual address, get an entry offset into a linear page table. */
 #define l1_linear_offset(_a) (((_a) & VADDR_MASK) >> L1_PAGETABLE_SHIFT)
 #define l2_linear_offset(_a) (((_a) & VADDR_MASK) >> L2_PAGETABLE_SHIFT)
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index fab2de5fae27..6ffacab341ad 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2147,7 +2147,7 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
                         struct vcpu *pt_vcpu, struct domain *pg_dom)
 {
     bool preserve_ad = (cmd == MMU_PT_UPDATE_PRESERVE_AD);
-    l1_pgentry_t ol1e = l1e_read_atomic(pl1e);
+    l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
     int rc = 0;
 
@@ -2270,7 +2270,7 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
         return -EPERM;
     }
 
-    ol2e = l2e_read_atomic(pl2e);
+    ol2e = l2e_read(pl2e);
 
     if ( l2e_get_flags(nl2e) & _PAGE_PRESENT )
     {
@@ -2332,7 +2332,7 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
     if ( pgentry_ptr_to_slot(pl3e) >= 3 && is_pv_32bit_domain(d) )
         return -EINVAL;
 
-    ol3e = l3e_read_atomic(pl3e);
+    ol3e = l3e_read(pl3e);
 
     if ( l3e_get_flags(nl3e) & _PAGE_PRESENT )
     {
@@ -2394,7 +2394,7 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         return -EINVAL;
     }
 
-    ol4e = l4e_read_atomic(pl4e);
+    ol4e = l4e_read(pl4e);
 
     if ( l4e_get_flags(nl4e) & _PAGE_PRESENT )
     {
@@ -5925,7 +5925,7 @@ void init_or_livepatch modify_xen_mappings_lite(
     while ( v < e )
     {
         l2_pgentry_t *pl2e = &l2_xenmap[l2_table_offset(v)];
-        l2_pgentry_t l2e = l2e_read_atomic(pl2e);
+        l2_pgentry_t l2e = l2e_read(pl2e);
         unsigned int l2f = l2e_get_flags(l2e);
 
         ASSERT(l2f & _PAGE_PRESENT);
@@ -5947,7 +5947,7 @@ void init_or_livepatch modify_xen_mappings_lite(
             while ( v < e )
             {
                 l1_pgentry_t *pl1e = &pl1t[l1_table_offset(v)];
-                l1_pgentry_t l1e = l1e_read_atomic(pl1e);
+                l1_pgentry_t l1e = l1e_read(pl1e);
                 unsigned int l1f = l1e_get_flags(l1e);
 
                 ASSERT(l1f & _PAGE_PRESENT);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index ee91fc56b125..b4fb95917023 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1450,7 +1450,7 @@ static enum pf_type __page_fault_type(unsigned long addr,
     mfn = cr3 >> PAGE_SHIFT;
 
     l4t = map_domain_page(_mfn(mfn));
-    l4e = l4e_read_atomic(&l4t[l4_table_offset(addr)]);
+    l4e = l4e_read(&l4t[l4_table_offset(addr)]);
     mfn = l4e_get_pfn(l4e);
     unmap_domain_page(l4t);
     if ( ((l4e_get_flags(l4e) & required_flags) != required_flags) ||
@@ -1459,7 +1459,7 @@ static enum pf_type __page_fault_type(unsigned long addr,
     page_user &= l4e_get_flags(l4e);
 
     l3t  = map_domain_page(_mfn(mfn));
-    l3e = l3e_read_atomic(&l3t[l3_table_offset(addr)]);
+    l3e = l3e_read(&l3t[l3_table_offset(addr)]);
     mfn = l3e_get_pfn(l3e);
     unmap_domain_page(l3t);
     if ( ((l3e_get_flags(l3e) & required_flags) != required_flags) ||
@@ -1470,7 +1470,7 @@ static enum pf_type __page_fault_type(unsigned long addr,
         goto leaf;
 
     l2t = map_domain_page(_mfn(mfn));
-    l2e = l2e_read_atomic(&l2t[l2_table_offset(addr)]);
+    l2e = l2e_read(&l2t[l2_table_offset(addr)]);
     mfn = l2e_get_pfn(l2e);
     unmap_domain_page(l2t);
     if ( ((l2e_get_flags(l2e) & required_flags) != required_flags) ||
@@ -1481,7 +1481,7 @@ static enum pf_type __page_fault_type(unsigned long addr,
         goto leaf;
 
     l1t = map_domain_page(_mfn(mfn));
-    l1e = l1e_read_atomic(&l1t[l1_table_offset(addr)]);
+    l1e = l1e_read(&l1t[l1_table_offset(addr)]);
     mfn = l1e_get_pfn(l1e);
     unmap_domain_page(l1t);
     if ( ((l1e_get_flags(l1e) & required_flags) != required_flags) ||
-- 
2.45.2


