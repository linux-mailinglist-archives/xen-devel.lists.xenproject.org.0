Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B973FCC476B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188151.1509463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL4-00008K-Uv; Tue, 16 Dec 2025 16:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188151.1509463; Tue, 16 Dec 2025 16:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL4-0008UC-Mn; Tue, 16 Dec 2025 16:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1188151;
 Tue, 16 Dec 2025 16:55:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYL2-0006ge-NV
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1429979d-daa0-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 17:55:51 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so850846166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:51 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:50 -0800 (PST)
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
X-Inumbo-ID: 1429979d-daa0-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904151; x=1766508951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9q+Ut/kN8/CLp796BltcYgjUpr0SgqZuKWHbqLwDf0=;
        b=N+hTTDqizG3Xk9yECt/cWjC0z5y/GATH5+MhB/VZrgAcDaLY1HqNpa3grUMWPInMu3
         A2ybBa0KGY2GW0wfskan0wT7GPxoT1H0Bm/3t5krptcTIdkCFxSHJaBdpZWNhwizlRRM
         HNaaztQ4bm4uKLXwk0KQAPeHyMZNHHsu07Zf/eS5rXWjTIlL3tUxl1Gw/F/ON14kBf0q
         NB3aKSUPj8zKMs38EX5lrB6+RXgC+KWpEpyIvH7LQIibHmTt/B8u/pRIder43pCjKxtl
         KjneL1bxq/0ahaY4nQ2ipIIBev8FAfg6T0e++FwiqpQDRpLuy5vzrnp7VKqIJIS3y9//
         qBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904151; x=1766508951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9q+Ut/kN8/CLp796BltcYgjUpr0SgqZuKWHbqLwDf0=;
        b=L1QPKWo40LsVjSDIfdvmk+6p4T8kq8iBQEHSJbONf9HhPXsP7apmLDFI7iQ7eJdUDd
         jVIMquFS29+EMs88vJNShsdqDRv+xTswh5PdS2VCZ0lJVZ1s4i9vuFJ+xkZYtKCZBcaN
         SRUPs7FjoCPgBWPYyTEJorwApx0uV7eQM6PD71sVYaSc7U8/F5KonvJmMoijC5zxsgoI
         cbjK6JSJaawTW+7HAWbRnnucIgA/5dn1k+yECq3FSs0H+pF30FZcKsErdDhjwgUXXY+u
         95qvvY8hjKVa3hL0Na9i0T8ag+Rzyhq9JAAuAVLZ8nw+Mo9JS5XiwNaEklADgSQr3G8z
         gzWw==
X-Gm-Message-State: AOJu0YzPwIixf3EjJwACvd9N3+868aX7pptE5BrEMagsFRwaMHkAJThF
	fZJA9BRH9QEcuuxoB363e6uo9hhIh9fHrYXNSiSKbnFEYBr4yEaPrtjxOGjRbQ==
X-Gm-Gg: AY/fxX7Q5BX9zdSw3wRdvVuqMq+uRFcFyoEUavluYKtnp3PHF/3SYFJUxBIu4VdCRIc
	9RRXnSnogQsyiHETJ27/EcDI+TYghTsH/ZRTeAoy/NTIxEHXQhgX0ciBfWfgfK+HvdSmcQ3G720
	IAVsFAs90aojFIjEKWbOgRMgyhLdZwrpMwUvK+Fq2oTLcSASadwFTrfyT7w4slYlLfdTyBliPak
	pCisGHF79kNRH/TTCuK7YavA5lSH5H4B2eRCwVYDhyweB6bN/3IzEUZqW/PDAp/SyJJFmlsKEcO
	DqK9Ch1kCMQTR8r6zujlDfIHp5m1PdJ5qm4SRhukVFvdI3YcRZx/PYNpuMo5/gflYo0m7lDxyoW
	p20+4CjCIQ5P0vOefQvhemOuuRVO6tsTAMMkBl7GKW9IgL0gvqQo0xE1o92GI2c0FLPnmsCVTrS
	FgScW677SQoeuSxjZudeDIoI5VF1R4Q/RYu/Zciynv8Uvh1FcEBMFFu3Q=
X-Google-Smtp-Source: AGHT+IELrv9Cns7UgrX3OhP5yEyTJsw4P/GSTm2HyE33iHHvykApawyzsibrgxMIAuOs1ZkHFC6x0w==
X-Received: by 2002:a17:907:9617:b0:b76:8163:f1f8 with SMTP id a640c23a62f3a-b7d23a7d742mr1489278366b.53.1765904150787;
        Tue, 16 Dec 2025 08:55:50 -0800 (PST)
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
Subject: [PATCH v7 09/19] xen/riscv: implement function to map memory in guest p2m
Date: Tue, 16 Dec 2025 17:55:19 +0100
Message-ID: <fe3f30db71034c9b7d2aff57aba60fe5d12ea790.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
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
Changes in V6-7:
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
index d14757331f..8bb197f9b3 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -110,6 +110,41 @@ void __init guest_mm_init(void)
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
@@ -238,3 +273,28 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 
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
2.52.0


