Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C422AD3807
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010785.1389011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfj-0005Wn-0N; Tue, 10 Jun 2025 13:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010785.1389011; Tue, 10 Jun 2025 13:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfi-0005U1-Rw; Tue, 10 Jun 2025 13:05:46 +0000
Received: by outflank-mailman (input) for mailman id 1010785;
 Tue, 10 Jun 2025 13:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfg-0004iH-Mr
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:44 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e20c52a-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:44 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ade30256175so732529066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:44 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:42 -0700 (PDT)
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
X-Inumbo-ID: 9e20c52a-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560743; x=1750165543; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYwCKpM2AdDgMkM5pUxy/3g1cY3Ox3ZYugCCj6NxUk4=;
        b=ELZTfzinQqlZl4eH2hI2YrpentarNS8Of+PA9YGgUP+bQwuom/E6ceIxthdcD2o6tg
         GN37gQ2sxPN8nUtAIylf4SHGB94dhGd9qpgqmHrgB6ZGL3A9HU+EU7aKin/nbR2LfsEu
         y1irOlz4pRAQfX4q34s5Jd1iyhqjJiw9B+RNZilfZGL6dfwqwWF1x0A3YFwW5VfbSuNk
         5RjTnOBWcP2lVCKOYzjgVH5IeMqXVRiVVZb2ujlPF+ONodSfvZdWqQqVTnlC5ENygRvH
         omZtrLyinsyclr3N/Q3ms3U54QxyKxzB1tenaQjzFlY11G0gkDQjgfLiEnK/nvuLDxhe
         KdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560743; x=1750165543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYwCKpM2AdDgMkM5pUxy/3g1cY3Ox3ZYugCCj6NxUk4=;
        b=ShfG/svXT5Ft4JvpWSLbUHb4Pvl+qFowRrEdYVZRHxf8HWBFPsdvIErPV9QJ8dic3G
         F546+jVRO1EgR4762gdZIlx6Z4NT0+YcKVLbjyTQqFtiUPVkNnHOarA8Lv1mWftMxlhD
         Yt6QFF9dLRl3icAMncnsVWU47oSXFrJNV6YWXUfgyElNtN2NOTH0hMDkaCLa0woLFewU
         oiMFftwtSN1k7jQ5ThxqqRBPJJX1enhTzqRfPsmIcqFHo7FbBJwTgmD58h2WbKhF6pgg
         6y08YWPOyHojdz37iuBdSZ9fEprZ2plYKBjiEZEh6GIPWHKEc5iR7XmrH0+FNfJZazDz
         BW1A==
X-Gm-Message-State: AOJu0YyEZkb5GJGB4v0HAbCZGj5eStci2YEiF7ihJOCrxdHURQtQV9Xy
	wSe+o+bj/fuHrMDwNLsN8YpJ7QqUwPMCRC2hPU57OFKSdJUqn1Ng5p+geXNIkA==
X-Gm-Gg: ASbGncvODGBvKWk8+bs9wthQS/87ZvdN11YBBqF6qz4NDivdrtZjl0uUG+KJlbyNUmi
	pfUrnrcPsjNI/EnlFGJGHq/eCdbNlzvF2EtM2uZ3t5xc7YEF01GG/iV7/8KBt6feuRxBjW0XhQi
	FnxRYi2Wv7ZJDKxZb9bpX2Gb7AtjSzEdaqYqeM7TtXKNenM8+wa9w2rHNAV3b3xnVgbYDVf76u3
	pOPRAPsG6AfUvc4SiiNql1Ebjtu4LoAJzvSb3OZl6HQrNWpK/LxP+ahS5jYhviNMxXfC4b4DGPf
	WJH5jsYlPYalbYOihxtU62Tt3j2GKCwllpvKKkBySJHHk2zsZCbFlCpCOyExcXRx3B8LVX4l/Wk
	FqLQb16jWrcMrUKFhPL7hN9G4qHRW
X-Google-Smtp-Source: AGHT+IEjMi5KqzHuFyzfiyMJz8eCJb0GUi4tJPNejv6sm92QokiGnhk6HzV5tiFCfi0GjnHS+iO74A==
X-Received: by 2002:a17:907:7289:b0:adb:229a:f8bd with SMTP id a640c23a62f3a-ade1a978096mr1571669266b.29.1749560742692;
        Tue, 10 Jun 2025 06:05:42 -0700 (PDT)
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
Subject: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID allocation and manegement
Date: Tue, 10 Jun 2025 15:05:18 +0200
Message-ID: <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implementation is based on Arm code with some minor changes:
 - Re-define INVALID_VMID.
 - Re-define MAX_VMID.
 - Add TLB flushing when VMID is re-used.

Also, as a part of this path structure p2m_domain is introduced with
vmid member inside it. It is necessary for VMID management functions.

Add a bitmap-based allocator to manage VMID space, supporting up to 127
VMIDs on RV32 and 16,383 on RV64 platforms, in accordance with the
architecture's hgatp VMID field (RV32 - 7 bit long, others - 14 bit long).

Reserve the highest VMID as INVALID_VMID to ensure it's not reused.

Implement p2m_alloc_vmid() and p2m_free_vmid() for dynamic allocation
and release of VMIDs per domain.

Integrate VMID initialization into p2m_init() and ensured domain-specific
TLB flushes on VMID release using sbi_remote_hfence_gvma_vmid().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/include/asm/domain.h |   4 +
 xen/arch/riscv/include/asm/p2m.h    |  14 ++++
 xen/arch/riscv/p2m.c                | 115 ++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c              |   3 +
 5 files changed, 137 insertions(+)
 create mode 100644 xen/arch/riscv/p2m.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index a1c145c506..1034f2c9cd 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -6,6 +6,7 @@ obj-y += intc.o
 obj-y += irq.o
 obj-y += mm.o
 obj-y += pt.o
+obj-y += p2m.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index c3d965a559..b9a03e91c5 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -5,6 +5,8 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/p2m.h>
+
 struct hvm_domain
 {
     uint64_t              params[HVM_NR_PARAMS];
@@ -18,6 +20,8 @@ struct arch_vcpu {
 
 struct arch_domain {
     struct hvm_domain hvm;
+
+    struct p2m_domain p2m;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 28f57a74f2..359408e1be 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -3,11 +3,21 @@
 #define ASM__RISCV__P2M_H
 
 #include <xen/errno.h>
+#include <xen/types.h>
 
 #include <asm/page-bits.h>
 
 #define paddr_bits PADDR_BITS
 
+/* Get host p2m table */
+#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
+
+/* Per-p2m-table state */
+struct p2m_domain {
+    /* Current VMID in use */
+    uint16_t vmid;
+};
+
 /*
  * List of possible type for each page in the p2m entry.
  * The number of available bit per page in the pte for this purpose is 2 bits.
@@ -93,6 +103,10 @@ static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
     /* Not supported on RISCV. */
 }
 
+void p2m_vmid_allocator_init(void);
+
+int p2m_init(struct domain *d);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
new file mode 100644
index 0000000000..9f7fd8290a
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,115 @@
+#include <xen/bitops.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/spinlock.h>
+#include <xen/xvmalloc.h>
+
+#include <asm/p2m.h>
+#include <asm/sbi.h>
+
+static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
+
+/*
+ * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
+ * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
+ * concurrent domains. The bitmap space will be allocated dynamically
+ * based on whether 7 or 14 bit VMIDs are supported.
+ */
+static unsigned long *vmid_mask;
+static unsigned long *vmid_flushing_needed;
+
+/*
+ * -2 here because:
+ *    - -1 is needed to get the maximal possible VMID
+ *    - -1 is reserved for beinng used as INVALID_VMID
+ */
+#ifdef CONFIG_RISCV_32
+#define MAX_VMID (BIT(7, U) - 2)
+#else
+#define MAX_VMID (BIT(14, U) - 2)
+#endif
+
+/* Reserve the max possible VMID to be INVALID. */
+#define INVALID_VMID (MAX_VMID + 1)
+
+void p2m_vmid_allocator_init(void)
+{
+    /*
+     * Allocate space for vmid_mask and vmid_flushing_needed
+     * based on INVALID_VMID as it is the max possible VMID which just
+     * was reserved to be INVALID_VMID.
+     */
+    vmid_mask = xvzalloc_array(unsigned long, BITS_TO_LONGS(INVALID_VMID));
+    vmid_flushing_needed =
+        xvzalloc_array(unsigned long, BITS_TO_LONGS(INVALID_VMID));
+
+    if ( !vmid_mask || !vmid_flushing_needed )
+        panic("Could not allocate VMID bitmap space or VMID flushing map\n");
+
+    set_bit(INVALID_VMID, vmid_mask);
+}
+
+int p2m_alloc_vmid(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    int rc, nr;
+
+    spin_lock(&vmid_alloc_lock);
+
+    nr = find_first_zero_bit(vmid_mask, MAX_VMID);
+
+    ASSERT(nr != INVALID_VMID);
+
+    if ( nr == MAX_VMID )
+    {
+        rc = -EBUSY;
+        printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain_id);
+        goto out;
+    }
+
+    set_bit(nr, vmid_mask);
+
+    if ( test_bit(p2m->vmid, vmid_flushing_needed) )
+    {
+        clear_bit(p2m->vmid, vmid_flushing_needed);
+        sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
+    }
+
+    p2m->vmid = nr;
+
+    rc = 0;
+
+out:
+    spin_unlock(&vmid_alloc_lock);
+    return rc;
+}
+
+void p2m_free_vmid(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    spin_lock(&vmid_alloc_lock);
+
+    if ( p2m->vmid != INVALID_VMID )
+    {
+        clear_bit(p2m->vmid, vmid_mask);
+        set_bit(p2m->vmid, vmid_flushing_needed);
+    }
+
+    spin_unlock(&vmid_alloc_lock);
+}
+
+int p2m_init(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc;
+
+    p2m->vmid = INVALID_VMID;
+
+    rc = p2m_alloc_vmid(d);
+    if ( rc )
+        return rc;
+
+    return 0;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 8bcd19218d..aa8f5646ea 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -19,6 +19,7 @@
 #include <asm/early_printk.h>
 #include <asm/fixmap.h>
 #include <asm/intc.h>
+#include <asm/p2m.h>
 #include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/traps.h>
@@ -134,6 +135,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     intc_preinit();
 
+    p2m_vmid_allocator_init();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.49.0


