Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HRvkAl5JzmlQmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98E6387DA9
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271525.1559677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaH-000577-Uk; Thu, 02 Apr 2026 10:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271525.1559677; Thu, 02 Apr 2026 10:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaH-00054u-Q9; Thu, 02 Apr 2026 10:47:33 +0000
Received: by outflank-mailman (input) for mailman id 1271525;
 Thu, 02 Apr 2026 10:47:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaG-0004dR-6T
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaF-009qA7-JE
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4932-e002-0a2a0a5209dd-0a2a450cd128-32
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:31 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4943-f40c-0a2a450c0019-d155da29cd5e-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:31 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b9910707d82so95092866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:31 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126850; x=1775731650; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk9ILGeqhLaxN17ATAwS/XwCMf4ZnQc5O/7gi3JtyMs=;
        b=W2Opd3NOXDhqwaHjQ8eyEy6U8TOtgVfW0ynPPf7Fd9T/NOFIQ0to/UC5HxhgoxJyI3
         lgzK7pP/tpks1HUR6xY9FN1X56jp6+ETN3wYpcYMjmJcrE38QhXcIKUOt8D8BlLtTYrm
         IdlqM1fJHt3YE+y/EmXU8biawm+fQMT+8Rxz0TrigSbwjXwwpb7q3/m0NYk8935fndcG
         x53BXqZy3srjMaU633N+S6int/NTI09Dqf+dTxlSq7gFDfIHVdCOGweFCJ4UOoKpPCTf
         VZWWtY7G6j+yVi6qpbqc1aM8gtCKFu7/KLos/96hARe0ZqWVNZJIjIOZ79Bm9Kq3HSFF
         gjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126850; x=1775731650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qk9ILGeqhLaxN17ATAwS/XwCMf4ZnQc5O/7gi3JtyMs=;
        b=UTu3MV1++V0XV6ubyzlS37DUYWZQEC7Hb3iONDj7F5LxaJkqnjXG0k2nBvcFyq/b75
         yvKLHLfo7ZF+iVa98/dubLF+gZu23ICxRc53vAPaJHHHI1L+l9aYcfpdsT1IB6GfwCqb
         nWUpwgRqKvC3svXWEU34GqpFf19NaAY33blRRLhfY3vo6TrxQPcd4VzTw7veryglP7gf
         nZkZidzT3v8Rw8lI+1Q1+pI7CxLk//NpnLUAjfqp1MEtDE+jkcy4KZ66udj2kTdtqZcG
         YQGvieGENvp2DVJYSFYIoRHvWPLW1Qb4/EmZME0z2DlZlOsuJqcEQjHdSU/d3pGgGkzd
         J9aA==
X-Gm-Message-State: AOJu0Ywicsxvk28ncZC9mwKYtqpHqA1BruQUwhxuOcAwPmW2btH+OcUT
	4R+BQhjgP+CG/IvyHNGOAkWn2ne51pqgNX6VJRnOy+Ip4MYMAknCLTQ7PqCoGHET
X-Gm-Gg: ATEYQzxAOeTpy4iksfHwyIe24RYxH0ZLuVgZslhLrVNIVaegd+4BDpqFZiHqZrJSMur
	ziNXD91CgA0HKYO7K8n8GvM3cEEIe4+Czv9aPzIZLgeIGM7iD6g5Aut4qa+rwvTp2R/AvaThuWJ
	J6dj1bhCEJZIcPTwcSgYAylzN2jSSzfJRf6JREyoo1oGsDgibPdNBtUHM4EyY6BSkIfg253acef
	Pyuc3mksGqmWexInwnrQ6VnB3IW7WmzF0FgoBqL7w4hzKocDA2OXPmFq4b5waaHE9hKEEOaDIOe
	bNl4x8Xs5G/JY4JBrafI1JW7j2eKTB93OoK88a6e4an0HP8ci4CT41rYbN5DgM4uVfL3mS6t7MU
	Pd+4H5hCboc8zZwjFpunCaQHs4AdlU7cAikkWw9UyF5H6W5letnvXOOfFCI0DsiPGlpBvn9oBMr
	4+65b2aYxZHXxjEJPges2H07x22w==
X-Received: by 2002:a17:907:1c85:b0:b93:7d70:20a0 with SMTP id a640c23a62f3a-b9c137a08acmr482815566b.4.1775126850107;
        Thu, 02 Apr 2026 03:47:30 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Date: Thu,  2 Apr 2026 13:45:06 +0300
Message-ID: <5a42b7c32fadf21262b8342f27e685916d0e5812.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775126851-FE74EA3D-D1CDCDD3/0/0
X-purgate-type: clean
X-purgate-size: 9675
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A98E6387DA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
working after firmware powers the GIC down. Snapshot the CPU interface,
distributor and last-CPU redistributor state, disable the ITS to cache its
CTLR/CBASER/BASER registers, then restore everything and re-arm the
collection on resume.

Add list_for_each_entry_continue_reverse() in list.h for the ITS suspend
error path that needs to roll back partially saved state.

Based on Linux commit dba0bc7b76dc ("irqchip/gic-v3-its: Add ability to save/restore ITS state")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V8:
- Reword the CBASER/CWRITER comment to match Xen and drop the stale Linux
  cmd_write reference.
- Clarify the list_for_each_entry_continue_reverse() comment.
- Factor out per-ITS helpers for collection setup and resume.
- Restore each ITS and re-establish its collection mapping in the same
  loop, so a failed ITS resume is not followed by MAPC/SYNC on that
  un-restored instance.
- panic in case when resume of an ITS failed
- cleanup baser cache during suspend
---
 xen/arch/arm/gic-v3-its.c             | 126 ++++++++++++++++++++++++--
 xen/arch/arm/gic-v3.c                 |  15 ++-
 xen/arch/arm/include/asm/gic_v3_its.h |  23 +++++
 xen/include/xen/list.h                |  14 +++
 4 files changed, 166 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 9ba068c46f..fe2865eac9 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -335,6 +335,22 @@ static int its_send_cmd_inv(struct host_its *its,
     return its_send_command(its, cmd);
 }
 
+static int gicv3_its_setup_collection_single(struct host_its *its,
+                                             unsigned int cpu)
+{
+    int ret;
+
+    ret = its_send_cmd_mapc(its, cpu, cpu);
+    if ( ret )
+        return ret;
+
+    ret = its_send_cmd_sync(its, cpu);
+    if ( ret )
+        return ret;
+
+    return gicv3_its_wait_commands(its);
+}
+
 /* Set up the (1:1) collection mapping for the given host CPU. */
 int gicv3_its_setup_collection(unsigned int cpu)
 {
@@ -343,15 +359,7 @@ int gicv3_its_setup_collection(unsigned int cpu)
 
     list_for_each_entry(its, &host_its_list, entry)
     {
-        ret = its_send_cmd_mapc(its, cpu, cpu);
-        if ( ret )
-            return ret;
-
-        ret = its_send_cmd_sync(its, cpu);
-        if ( ret )
-            return ret;
-
-        ret = gicv3_its_wait_commands(its);
+        ret = gicv3_its_setup_collection_single(its, cpu);
         if ( ret )
             return ret;
     }
@@ -1209,6 +1217,106 @@ int gicv3_its_init(void)
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
+        for (i = 0; i < GITS_BASER_NR_REGS; i++)
+        {
+            uint64_t baser = readq_relaxed(base + GITS_BASER0 + i * 8);
+
+            its->suspend_ctx.baser[i] = 0;
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
+static int gicv3_its_resume_single(struct host_its *its, unsigned int cpu)
+{
+    void __iomem *base = its->its_base;
+    unsigned int i;
+    int ret;
+
+    /*
+     * Make sure that the ITS is disabled. If it fails to quiesce,
+     * don't restore it since writing to CBASER or BASER<n>
+     * registers is undefined according to the GIC v3 ITS
+     * Specification.
+     */
+    WARN_ON(readl_relaxed(base + GITS_CTLR) & GITS_CTLR_ENABLE);
+    ret = gicv3_disable_its(its);
+    if ( ret )
+        return ret;
+
+    writeq_relaxed(its->suspend_ctx.cbaser, base + GITS_CBASER);
+
+    /*
+     * Writing CBASER resets CREADR to 0, so reset CWRITER to
+     * keep the command queue pointers aligned.
+     */
+    writeq_relaxed(0, base + GITS_CWRITER);
+
+    /* Restore GITS_BASER from the value cache. */
+    for ( i = 0; i < GITS_BASER_NR_REGS; i++ )
+    {
+        uint64_t baser = its->suspend_ctx.baser[i];
+
+        if ( !(baser & GITS_VALID_BIT) )
+            continue;
+
+        writeq_relaxed(baser, base + GITS_BASER0 + i * 8);
+    }
+
+    writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+
+    return gicv3_its_setup_collection_single(its, cpu);
+}
+
+void gicv3_its_resume(void)
+{
+    struct host_its *its;
+    unsigned int cpu = smp_processor_id();
+    int ret;
+
+    list_for_each_entry(its, &host_its_list, entry)
+    {
+        ret = gicv3_its_resume_single(its, cpu);
+        if ( ret )
+            panic("GICv3: ITS@%"PRIpaddr": failed to restore during resume: %d\n",
+                   its->addr, ret);
+    }
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index d182a71478..ef8318dd50 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -862,7 +862,7 @@ static bool gicv3_enable_lpis(void)
     return true;
 }
 
-static int __init gicv3_populate_rdist(void)
+static int gicv3_populate_rdist(void)
 {
     int i;
     uint32_t aff;
@@ -932,7 +932,7 @@ static int __init gicv3_populate_rdist(void)
                     ret = gicv3_lpi_init_rdist(ptr);
                     if ( ret && ret != -ENODEV && ret != -EBUSY )
                     {
-                        printk("GICv3: CPU%d: Cannot initialize LPIs: %u\n",
+                        printk("GICv3: CPU%d: Cannot initialize LPIs: %d\n",
                                smp_processor_id(), ret);
                         break;
                     }
@@ -2101,10 +2101,14 @@ static int gicv3_suspend(void)
 
     gicv3_disable_interface();
 
-    ret = gicv3_disable_redist();
+    ret = gicv3_its_suspend();
     if ( ret )
         goto out_enable_iface;
 
+    ret = gicv3_disable_redist();
+    if ( ret )
+        goto out_its_resume;
+
     /* Save GICR configuration */
     gicv3_redist_wait_for_rwp();
 
@@ -2140,6 +2144,9 @@ static int gicv3_suspend(void)
 
     return 0;
 
+ out_its_resume:
+    gicv3_its_resume();
+
  out_enable_iface:
     gicv3_hyp_enable(true);
     WRITE_SYSREG(gicv3_ctx.cpu.ctlr, ICC_CTLR_EL1);
@@ -2212,6 +2219,8 @@ static void gicv3_resume(void)
 
     gicv3_redist_wait_for_rwp();
 
+    gicv3_its_resume();
+
     WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
     isb();
 
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index 081bd19180..3ca74435c8 100644
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
@@ -205,6 +212,11 @@ uint64_t gicv3_its_get_cacheability(void);
 uint64_t gicv3_its_get_shareability(void);
 unsigned int gicv3_its_get_memflags(void);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void);
+void gicv3_its_resume(void);
+#endif
+
 #else
 
 #ifdef CONFIG_ACPI
@@ -272,6 +284,17 @@ static inline int gicv3_its_make_hwdom_dt_nodes(const struct domain *d,
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
index 98d8482dab..2aab274157 100644
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
+ * Iterate over list of given type backwards, starting from the element previous
+ * to the current one in list order.
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


