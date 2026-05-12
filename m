Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DKQMvxeA2r65QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A68525813
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307278.1579028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcB-0006mA-K0; Tue, 12 May 2026 17:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307278.1579028; Tue, 12 May 2026 17:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcB-0006jh-F1; Tue, 12 May 2026 17:09:51 +0000
Received: by outflank-mailman (input) for mailman id 1307278;
 Tue, 12 May 2026 17:09:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqc9-0006ej-Vt
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqc9-007RzZ-9b
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ecd-2eae-0a2a0a5409dd-0a2a450cc83c-40
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:49 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035edd-62f1-0a2a450c0019-d1558031dcc7-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:49 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso59332165e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:49 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778605788; x=1779210588; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IZE3vvZX8wTCOIvxrr5h+/UmQXvZVQaktiFrkuAMu4=;
        b=IcD5Ikeb+fSV5jb87eN5sdQt4h2F2BytaEeYehJUmw40qv/cp+XqzuB4FGVlAd+9SP
         GfpwGoHKfP2AF4D9VUK3Aj0Cz/KZz2sLaIFezm4Wd2nnGIpbvZrSIVUaUQSrnngX8hM4
         k4wFFEh2UBX94XBGL1wy/S8f+1ki0X6Z6KCtAdEi4Z7t7zJOCsM//hUg2e+/EIX8VXFI
         TBmkki1ew5FG3Y2Cr9YQIt7pNS7SI/WLf6m7ioxXFUttOH4uf1rPCE3RLzuLxeiHzK+u
         S9ovfQFWIi67h3j5jTSXlXQFOU/ngOdYSmalLxkC6H4fxeetUDhbssLkgj5EJW7NaPLm
         fuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605788; x=1779210588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IZE3vvZX8wTCOIvxrr5h+/UmQXvZVQaktiFrkuAMu4=;
        b=Dv8n+k4f4HLDPxVvDwiaJk5+VmA7K2Mp15xHPo97UC4Ps4V9yT5Swa07uWPv5DKHoh
         YhWVZ4L10HFxYVFpY/GKCfQXqA9//IQ9CZ0cO4nw9E9bF/FxLcIh6pGlRpi0C/j2aDL4
         VkoAytNDjPouUiOcQvEFP9ptJAxe2VgfHCl1slepQwv04OOtbm+C0W4qgHPH3NBw03Be
         CGkm3cmQpKkzN2yWWs9xolP4a+cQMv4/QJCksPgO0MPLnONNBEOChPNjUpBgGh+Wts0U
         EwrNX30iZJfFbSK+5ifn3tUXzfdrACLOcGmR5tnE6868fOGllp3PbmMnHobkdxDJFDYa
         cJMw==
X-Gm-Message-State: AOJu0YyTaEjCgIvA+gmHhO4EVHCcCY+1SnqMScpScK9BnLo7lkIuG64E
	1Sj8piNmPPfoq0M1X7GYPS6pmpbMMq20NkKWXnV65eCPh/CC/brwcIwfIa8TOw==
X-Gm-Gg: Acq92OHO1CIs/KGzFDNXleamW1+7YGauD0qAByiutdwvykQ9OF9+5f48aXhABcCy4+o
	5pS6oHMCLb3/MHm2OoYLaXlWoS/pa3+RpBodYWEgfYYZiqPYbtY3v9S01rgZGgFiQ5/ns4qDiUb
	DhCMP78+I8B+4vthgPICauD1sOZiu/TbhzAt4RnDKxd3pSOH0GQGLW4tOuANx31RVf3vDKyPsiR
	wGBm0PocQOogWmBEIAfTcCRbcyVIoeI/YjSYvIAkVERk86ZskR+Rpa9Xu3xIFDc6+mAuew07iKp
	ibzuh2nAP6m8JlZjgGFHdgayaFpCtdmPSor8jkV9dx9LrwE0u1QsopUfxVp1VwtRDJygQRfnoJ3
	F87d6gQWLDHrUTSKId17jLEtuYhZDTE56eA2s7EhKHlg/XMoMoREWSXCRulliWhXn7XNrisAUxK
	WUKeIuQrEququ3vsm7m1aoneA4GQ==
X-Received: by 2002:a05:600c:3b0f:b0:48a:7965:b943 with SMTP id 5b1f17b1804b1-48e51f4e9admr478114025e9.29.1778605788240;
        Tue, 12 May 2026 10:09:48 -0700 (PDT)
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
Subject: [PATCH v9 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Date: Tue, 12 May 2026 20:07:12 +0300
Message-ID: <bd79226263c1dd9c915a7fffd4f92b194af864ee.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778605789-DB57FCF5-620AAA48/0/0
X-purgate-type: clean
X-purgate-size: 9457
X-Rspamd-Queue-Id: 78A68525813
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
working after firmware powers the GIC down. Save and restore the ITS
CTLR, CBASER and BASER registers, and re-establish the collection mapping
on resume.

Add list_for_each_entry_continue_reverse() in list.h for the ITS suspend
error path that needs to roll back partially saved state.

Based on Linux commit dba0bc7b76dc:
"irqchip/gic-v3-its: Add ability to save/restore ITS state".
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V9:
- fix the ITS suspend/resume coding-style nits;
- preserve the saved GITS_CTLR state while masking the read-only
  QUIESCENT bit.

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
 xen/arch/arm/gic-v3-its.c             | 133 ++++++++++++++++++++++++--
 xen/arch/arm/gic-v3.c                 |  11 ++-
 xen/arch/arm/include/asm/gic_v3_its.h |  23 +++++
 xen/include/xen/list.h                |  14 +++
 4 files changed, 171 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 9005ce8ce5..582c26d964 100644
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
@@ -1210,6 +1218,113 @@ int gicv3_its_init(void)
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void)
+{
+    struct host_its *its;
+    int ret;
+
+    list_for_each_entry( its, &host_its_list, entry )
+    {
+        unsigned int i;
+        void __iomem *base = its->its_base;
+
+        /*
+         * By the time Xen reaches gic_suspend(), every domain is already in
+         * SHUTDOWN_suspend, so ITS-targeting interrupt sources are expected
+         * to have been quiesced by the owning OS before SYSTEM_SUSPEND.
+         */
+        /* Preserve saved GITS_CTLR state, excluding read-only QUIESCENT. */
+        its->suspend_ctx.ctlr = readl_relaxed(base + GITS_CTLR) &
+                                ~GITS_CTLR_QUIESCENT;
+        ret = gicv3_disable_its(its);
+        if ( ret )
+        {
+            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+            goto err;
+        }
+
+        its->suspend_ctx.cbaser = readq_relaxed(base + GITS_CBASER);
+
+        for ( i = 0; i < GITS_BASER_NR_REGS; i++ )
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
+    list_for_each_entry_continue_reverse( its, &host_its_list, entry )
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
+    list_for_each_entry( its, &host_its_list, entry )
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
index 6fc4354e2e..8ef9f416d0 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -2115,10 +2115,14 @@ static int gicv3_suspend(void)
 
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
 
@@ -2154,6 +2158,9 @@ static int gicv3_suspend(void)
 
     return 0;
 
+ out_its_resume:
+    gicv3_its_resume();
+
  out_enable_iface:
     gicv3_hyp_enable(true);
     WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
@@ -2253,6 +2260,8 @@ static void gicv3_resume(void)
 
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


