Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46047C807B5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170572.1495706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlw-0003qh-41; Mon, 24 Nov 2025 12:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170572.1495706; Mon, 24 Nov 2025 12:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlv-0003mh-Sn; Mon, 24 Nov 2025 12:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1170572;
 Mon, 24 Nov 2025 12:34:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVlt-0001Xp-Ma
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:21 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e61152a8-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:34:20 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7291af7190so619093566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:20 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:18 -0800 (PST)
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
X-Inumbo-ID: e61152a8-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987659; x=1764592459; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GD7FA95vl4zg2gCwBkL7Z4syOSlocjGh3qXHQggLeo=;
        b=ltDQaNRh4iqc/WhqC0Kbwu/o/cCFciNvR6MGk0ltaua+u8dmU2eX88YeVR2cbUQOYh
         lMzF+UHe6TXFS1k8Yo4JnsEVgnGybEglosGcs1RnATL9mDmypqopA/eM+MdNgmjgoOLT
         bHDf6LDwIhl9tGZkolznWvsxX7YAhSml0sV656H/Iy8Nl0Tq7REQGdcZxv0t0kpmdEsO
         1TolNB7qqb4b2ToQ/l5zN2dMuPZBgDILmpNb2yMXY3Oei1iVD9u7kBvawngZPDvXQhJP
         1qDDgu3bprM9kThcvJAioHQ0ojJz/Gs+UwHLKuGziXRGpb2e4XUrN+rnsl1xgqibeyni
         T3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987659; x=1764592459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6GD7FA95vl4zg2gCwBkL7Z4syOSlocjGh3qXHQggLeo=;
        b=Yb/0Vztlz2vHIFQT1AxbcEIzeLHR5N11A3R0hlIcPENZ/RQDxZesmMlPbPgdj2HMNK
         JuUioz3mhi83l33KNnpcs+NIeL62QdJHVTxKJxFDYG1tuR4oBlEzQKMwYgoZOE26xEZU
         j98A/UA1Bskych7hNtXhhoPbhLvT6fa/qO2PxuKptwICt/6YiN+DGtdlvm3fsoXi369T
         35LNqMszUEKrcgVwoEMyoopIZN/rEfbSINNau+kdSDbcnePCMu8sSeygf9RG2qG7aEEv
         dGSwwE9iE0vaAXDPkt2QKkwOKPKKBFF4ST/kg0s9PRhwIpcAkgLdydP1wFVTHBzSHBqO
         +5og==
X-Gm-Message-State: AOJu0YwRyJ8iUra/vzYoOfDBfJFBMMnnjLDeWStWB/Bd9DiJth6LFXDv
	EDss0SndQM94gki/W+DV7NOrgDw6PfyaWOKFpF1PiiqbjX26Aj/rfjIunlB4O2X3
X-Gm-Gg: ASbGncsPLYIthh09Mhy+87WHYWMKpl6HO4pE33v1NgmNCLcLSAcEWama2kieIhHw2jE
	14GGXuqvSETf2mF5oLDpw2oR/ofwpag2smBD7o0So/alodK5uCnDBfTCWFJUu38nlMH/Dkgah8C
	JK8UNoirmEjrLoWQsydCSTX9b7cQSrpqO+jZxXwB/1V4Tp6eMfU33tl1QI9rgQoMYKW46FqR4aB
	RhQPJJp1R/VoX1tJhAPtIlDK8DGJ2FCZA0ncje0sfCdgWxYYRx/lDEkiEtwt+YYlHPmouD02qBe
	dMOJXKow4BM7wCxptpR8hh9jANDwhdG7cSiMXbUD7V3a8LyhsgnOAdfSKgiO5Z+BbVXMY3T8cNL
	vE3RZ+18mHVo67M2SVWa4bC/J6gxlEmJQvDZolFHN7Gt7geNCCdS6x4VxYSzwZ+KFogzJqs+SJe
	Or5ib/FPCcvnY7559fO6fflJviqbQnU+BTp+A2I8At7J1kcnKKDnvY0q7+Dbdo2byEGw==
X-Google-Smtp-Source: AGHT+IEGuRyUo3PaGxSkQyOZIUOAPhl4q9SQjyiUWU3D6w3ZxvuPIT0cE/6iai/8GATh9tsmTCNGDQ==
X-Received: by 2002:a17:906:181b:b0:b76:7fe7:ff37 with SMTP id a640c23a62f3a-b767fe8084emr757914866b.18.1763987658996;
        Mon, 24 Nov 2025 04:34:18 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 10/19] xen/riscv: implement function to map memory in guest p2m
Date: Mon, 24 Nov 2025 13:33:43 +0100
Message-ID: <16a8aee1c204c8bef9629b8a2d7dfbc37a028362.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement map_regions_p2mt() to map a region in the guest p2m with
a specific p2m type. The memory attributes will be derived from the
p2m type. This function is used in dom0less common
code.

To implement it, introduce:
- p2m_write_(un)lock() to ensure safe concurrent updates to the P2M.
  As part of this change, introduce p2m_tlb_flush_sync() and
  p2m_force_tlb_flush_sync().
- A stub for p2m_set_range() to map a range of GFNs to MFNs.
- p2m_insert_mapping().
- p2m_is_write_locked().

Drop guest_physmap_add_entry() and call map_regions_p2mt() directly
from guest_physmap_add_page(), making guest_physmap_add_entry()
unnecessary.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
 - Nothing changed. Only Rebase.
---
Changes in V5:
 - Put "p2m->need_flush = false;" before TLB flush.
 - Correct the comment above p2m_write_unlock().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Update the comment above declaration of map_regions_p2mt():
   s/guest p2m/guest's hostp2m.
 - Add const for p2m_force_tlb_flush_sync()'s local variable `d`.
 - Stray 'w' in the comment inside p2m_write_unlock().
 - Drop p2m_insert_mapping() and leave only map_regions_p2mt() as it
   is just re-use insert_mapping().
 - Rename p2m_force_tlb_flush_sync() to p2m_tlb_flush().
 - Update prototype of p2m_is_write_locked() to return bool instead of
   int.
---
Changes in v3:
 - Introudce p2m_write_lock() and p2m_is_write_locked().
 - Introduce p2m_force_tlb_flush_sync() and p2m_flush_tlb() to flush TLBs
   after p2m table update.
 - Change an argument of p2m_insert_mapping() from struct domain *d to
   p2m_domain *p2m.
 - Drop guest_physmap_add_entry() and use map_regions_p2mt() to define
   guest_physmap_add_page().
 - Add declaration of map_regions_p2mt() to asm/p2m.h.
 - Rewrite commit message and subject.
 - Drop p2m_access_t related stuff.
 - Add defintion of  p2m_is_write_locked().
---
Changes in v2:
 - This changes were part of "xen/riscv: implement p2m mapping functionality".
   No additional signigicant changes were done.
---
 xen/arch/riscv/include/asm/p2m.h | 31 ++++++++++++-----
 xen/arch/riscv/p2m.c             | 60 ++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 1c89838408..9acd6a64a8 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -128,21 +128,22 @@ static inline int guest_physmap_mark_populate_on_demand(struct domain *d,
     return -EOPNOTSUPP;
 }
 
-static inline int guest_physmap_add_entry(struct domain *d,
-                                          gfn_t gfn, mfn_t mfn,
-                                          unsigned long page_order,
-                                          p2m_type_t t)
-{
-    BUG_ON("unimplemented");
-    return -EINVAL;
-}
+/*
+ * Map a region in the guest's hostp2m p2m with a specific p2m type.
+ * The memory attributes will be derived from the p2m type.
+ */
+int map_regions_p2mt(struct domain *d,
+                     gfn_t gfn,
+                     unsigned long nr,
+                     mfn_t mfn,
+                     p2m_type_t p2mt);
 
 /* Untyped version for RAM only, for compatibility */
 static inline int __must_check
 guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int page_order)
 {
-    return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
+    return map_regions_p2mt(d, gfn, BIT(page_order, UL), mfn, p2m_ram_rw);
 }
 
 static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
@@ -166,6 +167,18 @@ unsigned char get_max_supported_mode(void);
 
 int p2m_init(struct domain *d);
 
+static inline void p2m_write_lock(struct p2m_domain *p2m)
+{
+    write_lock(&p2m->lock);
+}
+
+void p2m_write_unlock(struct p2m_domain *p2m);
+
+static inline bool p2m_is_write_locked(struct p2m_domain *p2m)
+{
+    return rw_is_write_locked(&p2m->lock);
+}
+
 unsigned long construct_hgatp(const struct p2m_domain *p2m, uint16_t vmid);
 
 #endif /* ASM__RISCV__P2M_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 7c2ce7ec18..c559cde13a 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -114,6 +114,41 @@ void __init guest_mm_init(void)
     local_hfence_gvma_all();
 }
 
+/*
+ * Force a synchronous P2M TLB flush.
+ *
+ * Must be called with the p2m lock held.
+ */
+static void p2m_tlb_flush(struct p2m_domain *p2m)
+{
+    const struct domain *d = p2m->domain;
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    p2m->need_flush = false;
+
+    sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
+}
+
+void p2m_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    if ( p2m->need_flush )
+        p2m_tlb_flush(p2m);
+}
+
+/* Unlock the P2M and do a P2M TLB flush if necessary */
+void p2m_write_unlock(struct p2m_domain *p2m)
+{
+    /*
+     * The final flush is done with the P2M write lock taken to avoid
+     * someone else modifying the P2M before the TLB invalidation has
+     * completed.
+     */
+    p2m_tlb_flush_sync(p2m);
+
+    write_unlock(&p2m->lock);
+}
+
 static void clear_and_clean_page(struct page_info *page, bool clean_dcache)
 {
     void *p = __map_domain_page(page);
@@ -242,3 +277,28 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 
     return rc;
 }
+
+static int p2m_set_range(struct p2m_domain *p2m,
+                         gfn_t sgfn,
+                         unsigned long nr,
+                         mfn_t smfn,
+                         p2m_type_t t)
+{
+    return -EOPNOTSUPP;
+}
+
+int map_regions_p2mt(struct domain *d,
+                     gfn_t gfn,
+                     unsigned long nr,
+                     mfn_t mfn,
+                     p2m_type_t p2mt)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc;
+
+    p2m_write_lock(p2m);
+    rc = p2m_set_range(p2m, gfn, nr, mfn, p2mt);
+    p2m_write_unlock(p2m);
+
+    return rc;
+}
-- 
2.51.1


