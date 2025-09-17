Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C1B820BD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125591.1467565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08G-0001Mj-6D; Wed, 17 Sep 2025 21:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125591.1467565; Wed, 17 Sep 2025 21:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08G-0001I6-0x; Wed, 17 Sep 2025 21:56:08 +0000
Received: by outflank-mailman (input) for mailman id 1125591;
 Wed, 17 Sep 2025 21:56:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08D-0007Lt-Vk
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:05 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ac4f15e-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:56:04 +0200 (CEST)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b54ff31192aso203547a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:04 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:01 -0700 (PDT)
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
X-Inumbo-ID: 1ac4f15e-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146162; x=1758750962; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0jjeGz+AJmkN++UO+lcFEzMkDbdZhQ1G/5IcA1Gkfk=;
        b=fsdW1oc6zUNsgaJae1bCxeeeY3vxbz2g4EUwePgmcpCvoDRyQZu2IuKpi3NVhouiYd
         4Z8e/4NEK7l/z1x+rsvo6kz8iIivnZtIwjNWpTQ9vyIdDYZeEWlTCPb6d+z55MBCclU2
         wQ0ulL8xfistr0gx67QmNl5sUDjU7QifJjBtxUVJtirqJJoT30EFdxzNpD+gcCgs+Yns
         gcbztK/yn20kZbvb0dr4lofHkbc+4ojoyIlbHhIrhq8NITvXO6tc9phrk21xKNBd2LLD
         XEz3vywan7cg3UB8+6w5d3RZ35cQhFU5Pd/XIw8UQb41o7Ri9JNYin5DBAmlVxmXTT4W
         sArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146162; x=1758750962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0jjeGz+AJmkN++UO+lcFEzMkDbdZhQ1G/5IcA1Gkfk=;
        b=ZxHLy2AqEM1z98sknB+R9F2IILiSFeKwYNiS/r102AaNfQUXqxG6T+oINHmSeysty6
         db9AwFlhqLArJ/KClPn1HWDifakdfTC2MCK0qIoxhPM6XY829tKNPdCLfGZ3QqwrlPpD
         E7KONKWTEMybUF8Z7kTmKCF9FxmeJpZI7xfSxol1TM5lPefck6fFK66COSeiUH6d7KC3
         AhWwuE/3EK/Ise3391p6VNz/9VtFmyPprG00Eiq4g94Rjt9AD0MxkeO8wzifPUg4BYOz
         EdpCLeJDxdNanlBFdf9CLcn5c56QtU8MEaE8wUyAjW0DGFpU4/TmZNd9c6FzragEOgz1
         NGPg==
X-Gm-Message-State: AOJu0YwS2lhFZeES4tjD4XzHFV7h5lJckfOFfYjeEI8lG5qUt7W17ek0
	n3YBMo2cxd2CK83CNzOesOO8vWFJrQB2fzuKczUJWiJ1eI/lHahE61s6C9Jj94gAqzo=
X-Gm-Gg: ASbGnct4au217cTYv9h3pJX0MoGIe2CpMsK1PFMxY5rXZUoPiR1Xi8YOP25yva+KtpJ
	Hgeg9Y5Pa1AhLIvhGv3nzg+FuoA6hE5Fr/7cVorlKfkdeL+K+gULbi0qOFdPZl6kOJkq504/vWG
	GywzJCrYqZ29EPSgICIWAUPzbk0fz0+IyOUaGOPZGLXR4P89C6MZr/5RUVlvP6MX1u68j7Oc5ik
	gmWcVrt/Lhv2/o8hWuY4GscQMf8wrHWlsBqjD5SyN+8UHh51m/kRMZs+splIJtESmxui/lePZsG
	RjuWb0dXB0CwE3wUZsrMnMJrigU1sJWzuR10zarSKM+/sMMkF8m6LNtEeB5+M7BWxXCYjlP3k6w
	urdUDdV28gnPo+DrfsD7vixbbby5qgslp5ui8pJptst8S
X-Google-Smtp-Source: AGHT+IEl1PXxxQcfnhBxZpW+6bQmQIphWQfIkxt0ZsmMrWstNujnSHoS/naPDgcFU7ynZxNz6DLycQ==
X-Received: by 2002:a17:902:e94d:b0:24c:965a:f94d with SMTP id d9443c01a7336-26813cfd846mr42364795ad.46.1758146162260;
        Wed, 17 Sep 2025 14:56:02 -0700 (PDT)
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
Subject: [PATCH v4 09/18] xen/riscv: implement function to map memory in guest p2m
Date: Wed, 17 Sep 2025 23:55:29 +0200
Message-ID: <abdcb86a0aea3bd614d342caaaa482e82d576d2e.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
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
index 8a6f5f3092..c98cf547f1 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -122,21 +122,22 @@ static inline int guest_physmap_mark_populate_on_demand(struct domain *d,
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
@@ -159,6 +160,18 @@ void gstage_mode_detect(void);
 
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
 unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid);
 
 #endif /* ASM__RISCV__P2M_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index ad0478f155..d8b611961c 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -96,6 +96,41 @@ void __init gstage_mode_detect(void)
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
+    sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
+
+    p2m->need_flush = false;
+}
+
+void p2m_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    if ( p2m->need_flush )
+        p2m_tlb_flush(p2m);
+}
+
+/* Unlock the flush and do a P2M TLB flush if necessary */
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
     clear_domain_page(page_to_mfn(page));
@@ -215,3 +250,28 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 
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
2.51.0


