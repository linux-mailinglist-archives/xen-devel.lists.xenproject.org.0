Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D5CB6F00
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184550.1507006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfp-0004Sz-RR; Thu, 11 Dec 2025 18:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184550.1507006; Thu, 11 Dec 2025 18:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfp-0004Pq-Kd; Thu, 11 Dec 2025 18:45:57 +0000
Received: by outflank-mailman (input) for mailman id 1184550;
 Thu, 11 Dec 2025 18:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfn-0003I9-3E
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:55 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ec41371-d6c1-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 19:45:53 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b73161849e1so115603166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:53 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:51 -0800 (PST)
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
X-Inumbo-ID: 9ec41371-d6c1-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478752; x=1766083552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjTxMfuV2ry3Bt7T4zhRYcS+sdtazS8raHtB9fvxlRg=;
        b=bSK4HOzoiDQFYjIoVqXY8kgjJzSpETDmYnfBEXRZvNANGQKTm9p0ywKqG6wUyFDTqS
         wBDtJSeHow1HjXEcDSyoeZvBNAIXwqPq61HriEpCSPxmsrLCQZVSjoo5KqLJt1GbgeXw
         TsLRJmHYbJlSR8R5GjwsqTzDiTK3Rahk2+LIZhVbwaW7lxCv4TGecUN6CSgkxIAfEx/7
         KaoTQ02/8T28EvCL+XR/kn4+18vqWAbOjbgU/k97Db5bDfYnRE2XnkJZYDI56HSvKo76
         UszKHjSy4dkLt3v6ubejN6jnP2ps4z/h5zJeg0L8gM6DYG76Oh1fedP0xAlKbRbRso8Z
         SC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478752; x=1766083552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WjTxMfuV2ry3Bt7T4zhRYcS+sdtazS8raHtB9fvxlRg=;
        b=KVOP8djSmzo9sUmMBYDQlvz0PxSDlCmVenS4PBmhEw1mGWrgrDtmj7cgekm71akmQ/
         ZjGzjQ4UynoIO5kHOvjkmwvaduXdBIhSg3NB43q2U0U6hTwkbDv6/flrqSoHCyTkWXBZ
         ULcBSoyddL73223FegwpQV51cgi5OYbVXQcbfnRYq5woCM0iWBbBGJrcsr3p+FdHv3Kz
         YR7B/ShCP0Ij745lBcDoQfQotCLHrOU4IK/pX/GijIVX/h3Sqf2Qi+ZBNh2BcZOtVtOu
         1Zghxh1uturvqe02uordyiqX4k3w8TcH3AIBANseOAYkdfWWdFbAX/pb4Ow+PIfMmubc
         xmPg==
X-Gm-Message-State: AOJu0Yy2ktTjTdAGe2B51dqscPixiUu3KJ2OOH+remT9PaGJML79Emyp
	v3F39tg9vgCqr17Gz80Kv8xrxsqf0Nr2/toVYRnhKPQALs3TFk+G6bX1jMVj6v6b
X-Gm-Gg: AY/fxX7DhzUGnnkieP3XiI24XtyGUa5CWywMOmm50EWvBX58bND16ZBqFnK9N9eFw0V
	cW5zmbpWUTmdVLZXd+JPewGNguKGH0UCMLgejP0B0f2BaEXWlDXwba2G7d5anyIFT24hMrAgtuH
	O2xSxWVRv/PC7nxI5BGb499NL9mL2U/n4GJ0egaHhaTdCW2y6eK0oNx6w/yczoJmnRCHw/zHl8O
	F77k1R3P0q3Lk7nBXhAGBjkRgGhiT75wDB7qcSgEkUU+HlrA2ia1Z4bS8jXyjRouJXVjo4QD+uk
	zUSZXYjGrhuuhsw9FvJkfxXXn7bN6kCM5iwoqD+nGdUSnM/F6bKVcx1+q5DmTCk+qRzpbqj16z6
	u6oBiNts5SB63xcq/JVOD/YylnSCBsH7LD5ugT7roF+1D7lGp4n9LDvRbIuG/ZLS2oTDLlSLvBL
	VW+et9th2N0mIcbAEzpVTP+lEnmfThvQQhgGLJLVN8
X-Google-Smtp-Source: AGHT+IFjRICZYFD+6bCjcyCTiWc0ssNriVYuF6uCkR9q+ZlpE+Pm25lA1i4Aqp+4yHS6qOgburziRw==
X-Received: by 2002:a17:907:9282:b0:b79:cef7:6574 with SMTP id a640c23a62f3a-b7ce822f461mr839551466b.4.1765478751978;
        Thu, 11 Dec 2025 10:45:51 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 04/12] xen/arm: gic-v3: add ITS suspend/resume support
Date: Thu, 11 Dec 2025 20:43:28 +0200
Message-ID: <2fade2b96128053fbe3ed59f1d5e3444b32b96c3.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
working after firmware powers the GIC down. Snapshot the CPU interface,
distributor and last-CPU redistributor state, disable the ITS to cache its
CTLR/CBASER/BASER registers, then restore everything and re-arm the
collection on resume.

Add list_for_each_entry_continue_reverse() in list.h for the ITS suspend
error path that needs to roll back partially saved state.

Based on Linux commit: dba0bc7b76dc ("irqchip/gic-v3-its: Add ability to save/restore ITS state")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3-its.c             | 91 +++++++++++++++++++++++++++
 xen/arch/arm/gic-v3.c                 | 15 ++++-
 xen/arch/arm/include/asm/gic_v3_its.h | 23 +++++++
 xen/include/xen/list.h                | 14 +++++
 4 files changed, 140 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 34833166ad..08a3d8d1ef 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -1209,6 +1209,97 @@ int gicv3_its_init(void)
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void)
+{
+    struct host_its *its;
+    int ret;
+
+    list_for_each_entry(its, &host_its_list, entry)
+    {
+        unsigned int i;
+        void __iomem *base = its->its_base;
+
+        its->suspend_ctx.ctlr = readl_relaxed(base + GITS_CTLR);
+        ret = gicv3_disable_its(its);
+        if ( ret )
+        {
+            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+            goto err;
+        }
+
+        its->suspend_ctx.cbaser = readq_relaxed(base + GITS_CBASER);
+
+        for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+            uint64_t baser = readq_relaxed(base + GITS_BASER0 + i * 8);
+
+            if ( !(baser & GITS_VALID_BIT) )
+                continue;
+
+            its->suspend_ctx.baser[i] = baser;
+        }
+    }
+
+    return 0;
+
+ err:
+    list_for_each_entry_continue_reverse(its, &host_its_list, entry)
+        writel_relaxed(its->suspend_ctx.ctlr, its->its_base + GITS_CTLR);
+
+    return ret;
+}
+
+void gicv3_its_resume(void)
+{
+    struct host_its *its;
+    int ret;
+
+    list_for_each_entry(its, &host_its_list, entry)
+    {
+        void __iomem *base;
+        unsigned int i;
+
+        base = its->its_base;
+
+        /*
+         * Make sure that the ITS is disabled. If it fails to quiesce,
+         * don't restore it since writing to CBASER or BASER<n>
+         * registers is undefined according to the GIC v3 ITS
+         * Specification.
+         *
+         * Firmware resuming with the ITS enabled is terminally broken.
+         */
+        WARN_ON(readl_relaxed(base + GITS_CTLR) & GITS_CTLR_ENABLE);
+        ret = gicv3_disable_its(its);
+        if ( ret )
+            continue;
+
+        writeq_relaxed(its->suspend_ctx.cbaser, base + GITS_CBASER);
+
+        /*
+         * Writing CBASER resets CREADR to 0, so make CWRITER and
+         * cmd_write line up with it.
+         */
+        writeq_relaxed(0, base + GITS_CWRITER);
+
+        /* Restore GITS_BASER from the value cache. */
+        for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+            uint64_t baser = its->suspend_ctx.baser[i];
+
+            if ( !(baser & GITS_VALID_BIT) )
+                continue;
+
+            writeq_relaxed(baser, base + GITS_BASER0 + i * 8);
+        }
+        writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+    }
+
+    ret = gicv3_its_setup_collection(smp_processor_id());
+    if ( ret )
+        panic("GICv3: ITS: resume setup collection failed: %d\n", ret);
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index dc5e58066d..cde76b182f 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -857,7 +857,7 @@ static bool gicv3_enable_lpis(void)
     return true;
 }
 
-static int __init gicv3_populate_rdist(void)
+static int gicv3_populate_rdist(void)
 {
     int i;
     uint32_t aff;
@@ -927,7 +927,7 @@ static int __init gicv3_populate_rdist(void)
                     ret = gicv3_lpi_init_rdist(ptr);
                     if ( ret && ret != -ENODEV )
                     {
-                        printk("GICv3: CPU%d: Cannot initialize LPIs: %u\n",
+                        printk("GICv3: CPU%d: Cannot initialize LPIs: %d\n",
                                smp_processor_id(), ret);
                         break;
                     }
@@ -2096,9 +2096,13 @@ static int gicv3_suspend(void)
 
     gicv3_disable_interface();
 
+    ret = gicv3_its_suspend();
+    if ( ret )
+        goto out_enable_iface;
+
     ret = gicv3_disable_redist();
     if ( ret )
-        return out_enable_iface;
+        goto out_its_resume;
 
     /* Save GICR configuration */
     gicv3_redist_wait_for_rwp();
@@ -2133,6 +2137,9 @@ static int gicv3_suspend(void)
 
     return 0;
 
+ out_its_resume:
+    gicv3_its_resume();
+
  out_enable_iface:
     gicv3_hyp_enable(true);
     WRITE_SYSREG(gicv3_ctx.cpu.ctlr, ICC_CTLR_EL1);
@@ -2205,6 +2212,8 @@ static void gicv3_resume(void)
 
     gicv3_redist_wait_for_rwp();
 
+    gicv3_its_resume();
+
     WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
     isb();
 
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index fc5a84892c..492c468ae0 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -129,6 +129,13 @@ struct host_its {
     spinlock_t cmd_lock;
     void *cmd_buf;
     unsigned int flags;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct suspend_ctx {
+        uint32_t ctlr;
+        uint64_t cbaser;
+        uint64_t baser[GITS_BASER_NR_REGS];
+    } suspend_ctx;
+#endif
 };
 
 /* Map a collection for this host CPU to each host ITS. */
@@ -204,6 +211,11 @@ uint64_t gicv3_its_get_cacheability(void);
 uint64_t gicv3_its_get_shareability(void);
 unsigned int gicv3_its_get_memflags(void);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void);
+void gicv3_its_resume(void);
+#endif
+
 #else
 
 #ifdef CONFIG_ACPI
@@ -271,6 +283,17 @@ static inline int gicv3_its_make_hwdom_dt_nodes(const struct domain *d,
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+static inline int gicv3_its_suspend(void)
+{
+    return 0;
+}
+
+static inline void gicv3_its_resume(void)
+{
+}
+#endif
+
 #endif /* CONFIG_HAS_ITS */
 
 #endif
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 98d8482dab..87c940ac3b 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -535,6 +535,20 @@ static inline void list_splice_init(struct list_head *list,
          &(pos)->member != (head);                                        \
          (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
 
+/**
+ * list_for_each_entry_continue_reverse - iterate backwards from the given point
+ * @pos:    the type * to use as a loop cursor.
+ * @head:   the head for your list.
+ * @member: the name of the list_head within the struct.
+ *
+ * Start to iterate over list of given type backwards, continuing after
+ * the current position.
+ */
+#define list_for_each_entry_continue_reverse(pos, head, member)           \
+    for ((pos) = list_entry((pos)->member.prev, typeof(*(pos)), member);  \
+         &(pos)->member != (head);                                        \
+         (pos) = list_entry((pos)->member.prev, typeof(*(pos)), member))
+
 /**
  * list_for_each_entry_from - iterate over list of given type from the
  *                            current point
-- 
2.43.0


