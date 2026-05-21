Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JKAJIZFD2ptIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D715AA922
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315654.1585399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VP-00027H-GS; Thu, 21 May 2026 17:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315654.1585399; Thu, 21 May 2026 17:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VP-00022J-BS; Thu, 21 May 2026 17:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1315654;
 Thu, 21 May 2026 17:48:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VN-0001ku-Pf
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VN-00Bm0f-5b
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f452f-bab6-0a2a0a5309dd-0a2a4508d226-28
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:21 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4564-63b5-0a2a45080019-d155802ccc81-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:21 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so69350735e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:21 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779385700; x=1779990500; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhFqA0ujOchoRkzWCwRDd18LeOSHm2z8hzgN4OjK95I=;
        b=l4JYUnGO2DaDJ/MfJMah0A3PVHKAFMvYRPzuIzZgiPR1OFBgrLP8WJjYbfk0FUik/V
         eCFObcYEs14xg07JeFuDMWs+ji2d+dMIBBVliildhnYZ2Ps12zeRRHVCKKQ/L/C5XZU3
         rC2DpImN0TTBg3R33jjkXkuDN6j7GfiOlJ0wbMhfC73Zsrp+L35ALwVPWCAwEZRakzzK
         y6YV3c0S9aSBeP1gznVFzIzDl/4C5sodmxbjtTZsmsBVw+Bl/4YDiWDEQaSnqLBR8+0R
         It3zygcj4srKG8OpI4eWgIsi166NXB+xqzQODqtXD/VdcZ0W1ecupQbchHf8/8TA0TUc
         Befg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385700; x=1779990500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bhFqA0ujOchoRkzWCwRDd18LeOSHm2z8hzgN4OjK95I=;
        b=IoXRQXDroUCxYSAkMW9z8HsXRdN4gaYO1so80mmF8oXobgjuT6+O3RhxAeK2kCeejA
         V3q91DpemV02dqZx4ENvnMAPG4S2Oc2sLzqrb7/6LW2hsPY6xPJz/rAvDM0lDg0atQZ6
         +GphF1pQhDfqHants5fLca/mXc8Ot4u4c/UeGYUkektFcpf6E4xVs9nlZimA2qeT2l7h
         yjDFkzb6+5hfrW6UTtjoOMXvyZs2Cxzgon4/T/e1N6bJYqToJ2C9m8PWB3WDbMG8rfvL
         lp7/LN+Xi7h5aAI/voN9MySjYyB+yxcqBVQ5tK2ag6JvUHemMQi07bY/E7hn+41NtLkY
         k3gQ==
X-Gm-Message-State: AOJu0YzYHbXKxo7EVYVQsG41OvO8QKKpFMlqciOWtfLGu5Z9muo+/r5v
	R7I9/5ihP5YimDpzTWN6oBrM7GJkBVo2xwsT8gMvmGdS78VE/W1e33WQnuejrUdH
X-Gm-Gg: Acq92OHo3aVOqav3ga0u+oJDhx48UOXQXXU8qNVSSPUBUplr0yTUnXRPo/Dfe0SOFmz
	6QUq+R0IEDLKNXkQM6azwFd4VYw49dc2ouQyQQGIvZGfRp/Wkhea8B/rDmSJAhCHBKxLV84a8hZ
	FfMeAWHw6EnDCH2mjWqbh2cJ5kPpHbVQmkiFeOFvbyED+jCFP/TyWD1/HgkA/dQDvwl9C3baPhD
	CaeKT28PUreaYhfQrTol/UbxkKuGMgqUw9kMI66CHrt6UkzcmGqwJkz125+OXBTvvQacrfC4pVo
	8MdwGIxUxdfgccwjPFjt6HKX9Y2sRs7+JNztTGtantgvFBIZxUvLyyEsFzbqeGiJmN+OkwX/UrZ
	oX70jRM8C/XCSSUGKU7KontqrRMiwjvT3sNE4bLd+pl7rz0EGDgRRIMNyt0ZZZCWDVYebTWcb3P
	zYT67Mo31f3EzxLe2GRF5xcteidw==
X-Received: by 2002:a05:600c:1c0d:b0:48f:fe2a:107b with SMTP id 5b1f17b1804b1-49036048699mr70867295e9.7.1779385700421;
        Thu, 21 May 2026 10:48:20 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Date: Thu, 21 May 2026 20:45:23 +0300
Message-ID: <95930674d4639727b9cdf4f52b4a23b6df60c3c4.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779385072.git.mykola_kvach@epam.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779385701-B797DDB1-2A1C7773/0/0
X-purgate-type: clean
X-purgate-size: 11107
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 44D715AA922
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
working after firmware powers the GIC down.

Save and restore the ITS CTLR, CBASER and BASER registers. On resume,
re-establish the collection mapping only when the collection is held in
the ITS itself. Memory-backed collections are restored through the
restored GITS_BASER tables and must not be remapped unconditionally.

Add list_for_each_entry_continue_reverse() in list.h for the ITS suspend
error path that needs to roll back partially saved state.

Based on Linux commit dba0bc7b76dc:
"irqchip/gic-v3-its: Add ability to save/restore ITS state".
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- Replay MAPC on resume only for collections held in the ITS itself, as
  indicated by GITS_TYPER.HCC. Memory-backed collections are restored
  through GITS_BASER and are no longer remapped unconditionally.
- Make the current Xen col_id == cpu assumption explicit in the ITS
  resume path.
- Use "unpredictable" instead of "undefined" in the CBASER/BASER restore
  comment.

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
 xen/arch/arm/gic-v3-its.c             | 146 ++++++++++++++++++++++++--
 xen/arch/arm/gic-v3.c                 |  11 +-
 xen/arch/arm/include/asm/gic_v3_its.h |  28 +++++
 xen/include/xen/list.h                |  14 +++
 4 files changed, 189 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 7560d46c6d..dd53209865 100644
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
@@ -1211,6 +1219,126 @@ int gicv3_its_init(void)
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
+    uint64_t typer;
+    unsigned int col_id = cpu; /* Xen currently uses col_id == cpu. */
+
+    /*
+     * Make sure that the ITS is disabled. If it fails to quiesce,
+     * don't restore it since writing to CBASER or BASER<n>
+     * registers is unpredictable according to the GIC v3 ITS
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
+    typer = readq_relaxed(base + GITS_TYPER);
+
+    /*
+     * Only collections with IDs below HCC are held in the ITS itself
+     * and lose their state across an ITS reset/power loss. Memory-backed
+     * collections are restored by restoring GITS_BASER and must not be
+     * remapped here.
+     */
+    if ( col_id < GITS_TYPER_HCC(typer) )
+        return gicv3_its_setup_collection_single(its, cpu);
+
+    return 0;
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
index 64fd772d65..6e0ca6c50d 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -2184,10 +2184,14 @@ static int gicv3_suspend(void)
     if ( ret )
         goto out_enable_iface;
 
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
 
@@ -2227,6 +2231,9 @@ static int gicv3_suspend(void)
 
     return 0;
 
+ out_its_resume:
+    gicv3_its_resume();
+
  out_enable_iface:
     if ( gicv3_enable_redist() )
         panic("GICv3: Failed to re-enable redistributor after suspend abort\n");
@@ -2353,6 +2360,8 @@ static void gicv3_resume(void)
 
     gicv3_redist_wait_for_rwp();
 
+    gicv3_its_resume();
+
     WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
     isb();
 
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index fc5a84892c..0f8cb16e41 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -43,6 +43,11 @@
 #define GITS_CTLR_QUIESCENT             BIT(31, UL)
 #define GITS_CTLR_ENABLE                BIT(0, UL)
 
+#define GITS_TYPER_HCC_SHIFT            24
+#define GITS_TYPER_HCC_MASK             0xffUL
+#define GITS_TYPER_HCC(r)               (((r) >> GITS_TYPER_HCC_SHIFT) & \
+                                                 GITS_TYPER_HCC_MASK)
+
 #define GITS_TYPER_PTA                  BIT(19, UL)
 #define GITS_TYPER_DEVIDS_SHIFT         13
 #define GITS_TYPER_DEVIDS_MASK          (0x1fUL << GITS_TYPER_DEVIDS_SHIFT)
@@ -129,6 +134,13 @@ struct host_its {
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
@@ -204,6 +216,11 @@ uint64_t gicv3_its_get_cacheability(void);
 uint64_t gicv3_its_get_shareability(void);
 unsigned int gicv3_its_get_memflags(void);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void);
+void gicv3_its_resume(void);
+#endif
+
 #else
 
 #ifdef CONFIG_ACPI
@@ -271,6 +288,17 @@ static inline int gicv3_its_make_hwdom_dt_nodes(const struct domain *d,
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


