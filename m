Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6F3BF2412
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146540.1479032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH9-0006iQ-7k; Mon, 20 Oct 2025 15:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146540.1479032; Mon, 20 Oct 2025 15:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH8-0006XK-Vp; Mon, 20 Oct 2025 15:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1146540;
 Mon, 20 Oct 2025 15:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH6-0004DQ-V9
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:20 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 996e77d1-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:20 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-63b9da57cecso7761000a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:20 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:19 -0700 (PDT)
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
X-Inumbo-ID: 996e77d1-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975900; x=1761580700; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES4z+eBDTLVhxr/atl2Kpe+U8TAzLTl/NEVlGrsCRw8=;
        b=fZLc1mTzUhCZtnban2FsgKcEuROmUCnZ9pBCAluKEtp4bt5OVMsoRx/nON7auHk/N9
         kPTHVXmrHYaHmnDRFOg25qxMi2grgkQCqi1ox/rCI8Idsj/LiQyLy0rybuUa9weeLjEs
         6pkdbsYJ5dQVKxXQNZPL6A+8708MbjPJnvT66Vy5z19+WzbK+NTcdhtH14GSqJhuIt8I
         gipzk8w4bs7E9VX/m77mBOyLdZ0bDHefvtkeK1FUQG2HMJuVR0jVRzYRPG0uW4JHTB73
         WwfgIzYfNmIGTcjoe7AFV75cSLUKcfWCh6N61LfF/UUgqbwryO4BcxFm00tDVO8WX9mm
         skgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975900; x=1761580700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES4z+eBDTLVhxr/atl2Kpe+U8TAzLTl/NEVlGrsCRw8=;
        b=W4ZGO06ljDsBa6MvTfya5QD9ny1Cu48FEGqQdQeE+PqncmQhGM1jidjGqJLoj7evip
         W6kY46AiCrVJNI7z3UeH4IA1EQ+n7Ya1fWFriun663cm3qNBMJ36bF0au7lhZDl2Lx4/
         MqjI5o8dkEKWFh3AQVd4Li+9wt2vyCS9o+L8UtKaZXJDLZW7dsUTBDr2fV72K3itabi7
         2MCSYz5U0dFx/FraZj7rUal/DZa9YzhoBvFIoRWBq+14xjVvHxHn/Rsp6AJ5WPZ9sSv1
         J6lFLtSmYBu4Mkn60vySviteWAy4OOeDTFxdkdW3cLqTjnivxqNPD1sFGLLE5t2bZ2kO
         W6oQ==
X-Gm-Message-State: AOJu0YyuF2IfjaUITqvVX7sceFT9eNY6biPuSDKYMwaEynd3BM+WTFBW
	DimwsAiv05ZOlWVOTR1Uu1uYwuy6A/2ILHsYYe5Y0EGDuQyGc1ykfqaQ5OAQTw==
X-Gm-Gg: ASbGncuBQfdo0Omz+90BQDRMkwQh9do7fEAgnMOLqtxhAzGzYRBqMU3jhSR2rxi54C0
	V86jc0+06aMzBGCOHCpIdVJw01//5VYfh3YGzBtY2U0+nnH/WM+f5kJAq206HBdWz95bp9xkE8M
	CUxsJj5P5yYv+jEqzcIXNa+gHDdDCZ/z2bGuM5tqVh2dgP0/BG+57PmSc/SOZTgJMvliaROGUHA
	ViE1qWBlSrKvYHlwgTfIYT78D78zqGF9S4kCGJzG4lvsyp1zbDYmcxezKTBV/aKiMLF7DcpjC3z
	yQ9AH7Oi3TG9LQem+llUmr5EQDcKn39jji8MA7VfLQfSDfipF7Crmd/5GV7OsQtOzFntgNSveOe
	6QyagY6PGL+rLIhSKFBkkjitKaBkOiT4keDlaT5Z38YRrVZaaSamgxniP6erH9yGWnHlIM/D/0o
	58o0kzRLzDruLAwjO70j2Y7ykUxV+CWxvBAvjXfkGhtOvEMyNeg21smh4Yt5f/FjZiJSUD
X-Google-Smtp-Source: AGHT+IFFWGAdE0K3CnBOI7ij5mSq0h3xh7q7yy/oEcUmu6Jb29bkG68wCGxaRvSYNwGSu2IA5e7grQ==
X-Received: by 2002:a05:6402:234a:b0:63b:ed9c:dd16 with SMTP id 4fb4d7f45d1cf-63c1f631b11mr14149225a12.3.1760975899350;
        Mon, 20 Oct 2025 08:58:19 -0700 (PDT)
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
Subject: [for 4.22 v5 09/18] xen/riscv: implement function to map memory in guest p2m
Date: Mon, 20 Oct 2025 17:57:52 +0200
Message-ID: <3e25d1b522edb4b97d8fddf8ea93805e4f2b9b69.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
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
index 46ee0b93f2..4fafb26e1e 100644
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
@@ -159,6 +160,18 @@ void pre_gstage_init(void);
 
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
index c9ffad393f..e571257022 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -104,6 +104,41 @@ void __init pre_gstage_init(void)
     vmid_init();
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
     clear_domain_page(page_to_mfn(page));
@@ -223,3 +258,28 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 
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


