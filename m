Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6EDB1748B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065995.1431400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVk7-0005JT-2j; Thu, 31 Jul 2025 16:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065995.1431400; Thu, 31 Jul 2025 16:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVk6-0005G5-Uc; Thu, 31 Jul 2025 16:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1065995;
 Thu, 31 Jul 2025 16:02:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVg8-0001FB-MK
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:48 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df0b852-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:47 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55b8b8e00caso569926e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:47 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:45 -0700 (PDT)
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
X-Inumbo-ID: 3df0b852-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977526; x=1754582326; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9A8ULyozJc/nKuEPNSmZGMU66I2uIkMKGf8g4aTjZc=;
        b=niSnpS1EAKNw49D51QjWah0OHUjGKtctuZ56p2P6RP2lYOGO05muqvQl/yPwasd0Ox
         CiHcZvbvQE3phmnBK0XykmIkyXBNixPYC91OpTL+47AxTDl6LNGXd3rQ9k7ym1DlvoJt
         JX8/LQARLv3orAdL+O0PEaYBIKpRJ6JhsTByggUvk67jhwpkJp3jxy24KSzM3GTG3ikP
         CSwXUpMODf6W2oivMpuaig5JdKUKU5qgudEferfInH5+sdyz852duCGbwdXalqQf2v7R
         AQuE2P5IUj//70qvxqonWZsiU3xLYP3Ac/GmA5vWHIQ4FxvGIr6mT87cznZZBt1oH4F/
         S4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977526; x=1754582326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9A8ULyozJc/nKuEPNSmZGMU66I2uIkMKGf8g4aTjZc=;
        b=taWu8yoTER+rjRrvPyZT+TxQR+nSVgMeh8BdPSs1/rkbxUa1k0j8ZAF8p7banHE8a6
         XbQFAdIFMyRoPfHongybugKQhATk2b0Av8/gPNK7AsDqKsYCeZB08TQqT8cdGFDTJdrC
         ymF54hkmnbS1YaLgjUx3eyuA442ZNur39Ily3emh+Ubn1q2CmJZeosQi/mr5mwphKR8a
         EnngOv80NxnC/kDXUnHaPnapSfnyeAaeQzylm2ELWD36khm/F+lQpU/CJ2HJZZVEC/h6
         5XP7sE3JFQAt7WzF+LHQrSWsI3EzVvYlCaBiEhYJbs9b+4vsidLGJEdqLbqHf+egabbZ
         CQfQ==
X-Gm-Message-State: AOJu0Yzbt5wo8OO0q3j0E2J7FZaNQfh2PgDpWQZTKkLB/qwJq6uBAofj
	gUPbXLhj1aXF3VeXNtJ3P+i6r/S2+JoKITRwRRNjFVbmf8QKD4W/5h2vs2XohA==
X-Gm-Gg: ASbGnctNYMyABM2K/b0qGK+yIfV4jEhdWxzVLlfOBV7RK5hTA06xbr/zuOLL+re42fv
	xbDbqJ6X1itNyvSH0eEa2l2LSzR+9hVeet1LuSCHkb88Aaotgu/ocHJV0/SN9Mj43ncenN9Q8dC
	i5xi3cCTtGOLa8smiDcghTGoQjTwjlX8X+C8XR0LR5oR3BLIP2f4GtaD7MHnGdk2QaIhaT+2eN0
	EZwMCBMY3yWgOPSgOl2K3mbj//Hnn0D4w9ic/5lCNb3ASUw0VKsqbpSJWftg0nS9D3P8zCz5arh
	QuejByimFaw6LN9ueKj2IkLzj4ObIPAgjpQWzZfzs8/24qgn6pVsuoMsNl1zSH2jKl8ivELnpCZ
	vQ5W4bbQm6bAexi/y138sB1HJ7PjMOlewv3XCo1yaWJa+V/3M3kl5NKnElOo5dQ==
X-Google-Smtp-Source: AGHT+IG3rQ2MDLV+jzyMChDNS/ZKIl//GIGUS3fiRb4942UTVk8U82i3aEykhbwBVDrOU94hPB+pGA==
X-Received: by 2002:a05:6512:108b:b0:55a:4bfe:bf78 with SMTP id 2adb3069b0e04-55b7c00d417mr2483333e87.2.1753977526148;
        Thu, 31 Jul 2025 08:58:46 -0700 (PDT)
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
Subject: [PATCH v3 11/20] xen/riscv: implement function to map memory in guest p2m
Date: Thu, 31 Jul 2025 17:58:10 +0200
Message-ID: <e00dcbecf8f0dbe863628dcc45526100f9ee86a3.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement map_regions_p2mt() to map a region in the guest p2m with
a specific p2m type. The memory attributes will be derived from the
p2m type. This function is going to be called from dom0less common
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
 xen/arch/riscv/include/asm/p2m.h | 31 ++++++++++-----
 xen/arch/riscv/p2m.c             | 65 ++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 5f253da1dd..ada3c398b4 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -121,21 +121,22 @@ static inline int guest_physmap_mark_populate_on_demand(struct domain *d,
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
+ * Map a region in the guest p2m with a specific p2m type.
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
@@ -159,6 +160,18 @@ static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
     /* Not supported on RISCV. */
 }
 
+static inline void p2m_write_lock(struct p2m_domain *p2m)
+{
+    write_lock(&p2m->lock);
+}
+
+void p2m_write_unlock(struct p2m_domain *p2m);
+
+static inline int p2m_is_write_locked(struct p2m_domain *p2m)
+{
+    return rw_is_write_locked(&p2m->lock);
+}
+
 unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid);
 
 #endif /* ASM__RISCV__P2M_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index cac07c51c9..7cfcf76f24 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -9,6 +9,41 @@
 
 unsigned int __read_mostly p2m_root_order;
 
+/*
+ * Force a synchronous P2M TLB flush.
+ *
+ * Must be called with the p2m lock held.
+ */
+static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m->domain;
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
+
+    p2m->need_flush = false;
+}
+
+void p2m_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    if ( p2m->need_flush )
+        p2m_force_tlb_flush_sync(p2m);
+}
+
+/* Unlock the flush and do a P2M TLB flush if necessary */
+void p2m_write_unlock(struct p2m_domain *p2m)
+{
+    /*
+     * The final flush is done with the P2M write lock taken to avoid
+     * someone else modifying the P2M wbefore the TLB invalidation has
+     * completed.
+     */
+    p2m_tlb_flush_sync(p2m);
+
+    write_unlock(&p2m->lock);
+}
+
 static void clear_and_clean_page(struct page_info *page)
 {
     clear_domain_page(page_to_mfn(page));
@@ -139,3 +174,33 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 
     return 0;
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
+static int p2m_insert_mapping(struct p2m_domain *p2m, gfn_t start_gfn,
+                              unsigned long nr, mfn_t mfn, p2m_type_t t)
+{
+    int rc;
+
+    p2m_write_lock(p2m);
+    rc = p2m_set_range(p2m, start_gfn, nr, mfn, t);
+    p2m_write_unlock(p2m);
+
+    return rc;
+}
+
+int map_regions_p2mt(struct domain *d,
+                     gfn_t gfn,
+                     unsigned long nr,
+                     mfn_t mfn,
+                     p2m_type_t p2mt)
+{
+    return p2m_insert_mapping(p2m_get_hostp2m(d), gfn, nr, mfn, p2mt);
+}
-- 
2.50.1


