Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A3C807A2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170564.1495638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlp-00025N-Ku; Mon, 24 Nov 2025 12:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170564.1495638; Mon, 24 Nov 2025 12:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlp-00022M-GQ; Mon, 24 Nov 2025 12:34:17 +0000
Received: by outflank-mailman (input) for mailman id 1170564;
 Mon, 24 Nov 2025 12:34:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVln-0001zv-Ah
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:15 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2c2e286-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:34:14 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b739b3fc2a0so576122566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:14 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:12 -0800 (PST)
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
X-Inumbo-ID: e2c2e286-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987653; x=1764592453; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHt+/vjl3FZPYDXPpDZDMvLZOLkTgHtSNP3M526OD5g=;
        b=SrVULXuvNWnFQk1GMjo9/l7cBeo29/Z0sCSkIE+9TeNkUZMDS43y9pqQJqVVyZIy73
         UsYa/laL672jlaR/3FdSpGVWwQn89ecDpPgjjIO4SIOy9V0fP2MREknHjPZ+MKNYxPRP
         0oB2pfgQY508U/hFNcwqR6XfT7SCveT2Js6AmXT4IAWtPDmnhka/VhaVDrAbOtceWz36
         UuISUOpcJ4xG/gGDqxh/GwjXvSCRrrSaUW0T42AcERghZIp8X8vQ7nfDSHbTVzf1OTwF
         5x2rwROCuY602f/QrmEtclsN39j2f5zGvfOwNEsKwkGykowWglSwFpKVsQ5zLXLtSZ7h
         pSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987653; x=1764592453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GHt+/vjl3FZPYDXPpDZDMvLZOLkTgHtSNP3M526OD5g=;
        b=nbY9wU/adFAYMRMyaW604vwRbci0ATxzdliXgRtVh2wb7WhWvT3Q32zpn5SEk96tJe
         C+mWm8OfvBjhcFG7ttjrWFah/5k7D9S0PWz8/jsJLzmPPEgL3X/oUyyTY0DlNa7haE1w
         WfpIMfLNtmfGjD7qLIZfT0dCn342WNx3Za2nN2faYtV4zscMuJkCJi5EgNaPuEr6rElc
         LOhf90SqI5x3MR7tQNQQzvrZu92X53y2JpNUrVy/TlGoel8huC+VWNgJN0YgV06QFBDe
         6BbxfQOxdqG+34nUd/OjqxlN/buYQ1T48EqSL6sKkw2MuEoTIk4oiKmN5lwz6vqyAehH
         5e3g==
X-Gm-Message-State: AOJu0Yx4ZjEvTaYKr8n4Wx6nEG7YrucKh2J6h5K1e04sjMH78GckZr0j
	+WdWDSBcY0CVkvr+eTsS+3ldypJqpbRwPnAWWoBeTNZtBbY4FtxrohZh0FHD6ymK
X-Gm-Gg: ASbGncuaqgSCAjSnIoF/hD/os6kiL7BbyGMsKkkVVNcMpmaC81Og23Nc72XiqPBUPht
	bvKrYOOzGeV+2DCmo7fd6sBvi/vzkFiNOiUW/KIu8Y7IEaqGeGzPAyA4kcn0JLrvfsd8I2MawXN
	rS7wuSRVViECBqkoCi4Gdh5RSDlD3Nqp05JrDJbxcPx5Ib0rupk15gMnzjC5GauHt4aX3Kt2CtZ
	7hG/MUcp9lxdkiHHnNG4sR9MQ3dGJC2yvZo0qIabEuY1OSMVrTxIQelwVr4hI4TUcB8XpNdcVCZ
	BdwI9GXJmF0PoBIIEEiSjMz2HBB9MchC++dXmIFHzNCE2xUxso9tybYEYzgP1sFubzNBQey6S9f
	w1HrerK4+JsZvjmg8P5QeLqqvX/olSvtQdhZnXgHqmsMP7Q+NjW2wYvK6fWOKsvuIQFUgmfU1uW
	UiaKZ92XqxDGS7VnGCmta3tRmnMg+1viTY8hRePtfUOCNYulbhrI52m5E=
X-Google-Smtp-Source: AGHT+IHuOGSOob/SXpDQRyFzBLcqKb1T3g/UdybsojJQfLi550dBaGllkeZml/L3Iwj+NobGII8Wog==
X-Received: by 2002:a17:906:fe47:b0:b6d:3fc9:e60c with SMTP id a640c23a62f3a-b7671591b7dmr1317755566b.20.1763987653193;
        Mon, 24 Nov 2025 04:34:13 -0800 (PST)
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
Subject: [PATCH v6 04/19] xen/riscv: introduce things necessary for p2m initialization
Date: Mon, 24 Nov 2025 13:33:37 +0100
Message-ID: <3ac28be95c3d9219bed7756cc0a78e735490f190.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the following things:
- Update p2m_domain structure, which describe per p2m-table state, with:
  - lock to protect updates to p2m.
  - pool with pages used to construct p2m.
  - back pointer to domain structure.
- p2m_init() to initalize members introduced in p2m_domain structure.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
 - Nothing changed. Only rebase.
---
Changes in V5:
 - Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Move an introduction of clean_pte member of p2m_domain structure to the
   patch where it is started to be used:
     xen/riscv: add root page table allocation
 - Add prototype of p2m_init() to asm/p2m.h.
---
Changes in V3:
 - s/p2m_type/p2m_types.
 - Drop init. of p2m->clean_pte in p2m_init() as CONFIG_HAS_PASSTHROUGH is
   going to be selected unconditionaly. Plus CONFIG_HAS_PASSTHROUGH isn't
   ready to be used for RISC-V.
   Add compilation error to not forget to init p2m->clean_pte.
 - Move defintion of p2m->domain up in p2m_init().
 - Add iommu_use_hap_pt() when p2m->clean_pte is initialized.
 - Add the comment above p2m_types member of p2m_domain struct.
 - Add need_flush member to p2m_domain structure.
 - Move introduction of p2m_write_(un)lock() and p2m_tlb_flush_sync()
   to the patch where they are really used:
     xen/riscv: implement guest_physmap_add_entry() for mapping GFNs to MFN
 - Add p2m member to arch_domain structure.
 - Drop p2m_types from struct p2m_domain as P2M type for PTE will be stored
   differently.
 - Drop default_access as it isn't going to be used for now.
 - Move defintion of p2m_is_write_locked() to "implement function to map memory
   in guest p2m"  where it is really used.
---
Changes in V2:
 - Use introduced erlier sbi_remote_hfence_gvma_vmid() for proper implementation
   of p2m_force_tlb_flush_sync() as TLB flushing needs to happen for each pCPU
   which potentially has cached a mapping, what is tracked by d->dirty_cpumask.
 - Drop unnecessary blanks.
 - Fix code style for # of pre-processor directive.
 - Drop max_mapped_gfn and lowest_mapped_gfn as they aren't used now.
 - [p2m_init()] Set p2m->clean_pte=false if CONFIG_HAS_PASSTHROUGH=n.
 - [p2m_init()] Update the comment above p2m->domain = d;
 - Drop p2m->need_flush as it seems to be always true for RISC-V and as a
   consequence drop p2m_tlb_flush_sync().
 - Move to separate patch an introduction of root page table allocation.
---
 xen/arch/riscv/include/asm/domain.h |  5 +++++
 xen/arch/riscv/include/asm/p2m.h    | 33 +++++++++++++++++++++++++++++
 xen/arch/riscv/p2m.c                | 20 +++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index aac1040658..e688980efa 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -5,6 +5,8 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/p2m.h>
+
 struct vcpu_vmid {
     uint64_t generation;
     uint16_t vmid;
@@ -24,6 +26,9 @@ struct arch_vcpu {
 
 struct arch_domain {
     struct hvm_domain hvm;
+
+    /* Virtual MMU */
+    struct p2m_domain p2m;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 3776b98303..239f90622e 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -3,17 +3,48 @@
 #define ASM__RISCV__P2M_H
 
 #include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/rwlock.h>
+#include <xen/types.h>
 
 #include <asm/page-bits.h>
 
 #define paddr_bits PADDR_BITS
 
+/* Get host p2m table */
+#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
+
 struct gstage_mode_desc {
     unsigned char mode;
     unsigned int paging_levels;
     char name[8];
 };
 
+/* Per-p2m-table state */
+struct p2m_domain {
+    /*
+     * Lock that protects updates to the p2m.
+     */
+    rwlock_t lock;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
+    /* Back pointer to domain */
+    struct domain *domain;
+
+    /*
+     * P2M updates may required TLBs to be flushed (invalidated).
+     *
+     * Flushes may be deferred by setting 'need_flush' and then flushing
+     * when the p2m write lock is released.
+     *
+     * If an immediate flush is required (e.g, if a super page is
+     * shattered), call p2m_tlb_flush_sync().
+     */
+    bool need_flush;
+};
+
 /*
  * List of possible type for each page in the p2m entry.
  * The number of available bit per page in the pte for this purpose is 2 bits.
@@ -97,6 +128,8 @@ static inline bool arch_acquire_resource_check(struct domain *d)
 void guest_mm_init(void);
 unsigned char get_max_supported_mode(void);
 
+int p2m_init(struct domain *d);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index a4c5b682ce..3017e9a260 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -3,6 +3,10 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/macros.h>
+#include <xen/mm.h>
+#include <xen/paging.h>
+#include <xen/rwlock.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
 
 #include <asm/csr.h>
@@ -107,3 +111,19 @@ void __init guest_mm_init(void)
      */
     local_hfence_gvma_all();
 }
+
+int p2m_init(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    /*
+     * "Trivial" initialisation is now complete.  Set the backpointer so the
+     * users of p2m could get an access to domain structure.
+     */
+    p2m->domain = d;
+
+    rwlock_init(&p2m->lock);
+    INIT_PAGE_LIST_HEAD(&p2m->pages);
+
+    return 0;
+}
-- 
2.51.1


