Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6McrJCfF2Gk4hwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:38:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EA63D507A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278586.1563367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8Ju-0000uD-Pj; Fri, 10 Apr 2026 09:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278586.1563367; Fri, 10 Apr 2026 09:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8Ju-0000rc-N2; Fri, 10 Apr 2026 09:38:34 +0000
Received: by outflank-mailman (input) for mailman id 1278586;
 Fri, 10 Apr 2026 09:38:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wB8Jt-0000rU-KA
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:38:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8Jt-00BbKX-0C
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:38:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8c512-e002-0a2a0a5209dd-0a2a450ae7ac-14
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:38:32 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8c518-ee98-0a2a450a0019-d155da2cf11d-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:38:32 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b9825ba7e8dso260267566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:38:32 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.238])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9d6e5c52b3sm66307566b.30.2026.04.10.02.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 02:38:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775813912; x=1776418712; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxciCGjMhtZXe5VYflJrqx8ULRUS5CvVj0n9IlAzSp4=;
        b=ULUbGzNK1GuUtNDVcEKfTMcadO0ClK1dg7qC+6QTM3zE3rQTRDj5LTCLqUFAl1cv/+
         OwloOfhhfX+I36tGvwK8ALJoyKzUR45vK+NWBlaLtTg1G86AktzsVLZDiYBegWuFYCmj
         DwIwr7GZ0O41V0kaEsVm278tP0mW6wjS2MSTD21ktQar8R0fJqSvDGUCySSYBR/3Hbug
         u7rsICuhmbfR3GxPq0/EOk8uH1XyZbniBGkjXoQ2RKTVdAv1olSyPeLjcMzHYJOVr9Wj
         qFi6LmuwmfGNPO651PF65ogyUyj78fY9hLAFPJfUwhHG5cvbSFcJFKrMyIdsfFecI1N0
         oKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813912; x=1776418712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxciCGjMhtZXe5VYflJrqx8ULRUS5CvVj0n9IlAzSp4=;
        b=RmZdA7Drzt7ZnMDzpIitS9hvghzdBI2WcVByeg4Ku6peyeoW+p6HxUSk+lupIbVxTn
         +sizTPTJBNpe0HQGvigdb9CZN82qODRT/taC2Wmm0J7BMO08MTgA+MYOVYhbsRojC2FL
         Dr8fTyebmg7Nd4CqsOKhYU4J6WxoiilDvmd5CzIL6qPOu5krcRJaasMX7uHx9EBwqqQG
         HAw/I7unLvF/qS3qyrt4Dan5z/E3tk53LwAXxkiaekWiZhkW/izeO22LCE39gUlVgIux
         n1yp3q2Vy7GJjdhIgBeI+HFSvnqoHAJt/Jsukxk73z16RjvZaL0BJPNpyaBjGSlLuUz9
         c4wQ==
X-Gm-Message-State: AOJu0YyStTvJ1xjFKR4dFv25KpHuXcnVx5UK404qaVOlaBZohj+mFCiv
	o1RVeAkIick4UE8wl5umbFVhDFRr5nmJmrPCTLCPjhLl2o3DAru5vMbw+OCW9SWn
X-Gm-Gg: AeBDiesbzbwOcchTy/KT9ddRZg7de1sa5JOjj1vSPIzZQAdH/qfB0imz/nLam6YhQna
	9E4nJGHBO+J0bJFK92uMs8P8mNWDaxAvyo2z2WqF7UJOq9GDhgIM5jF3CssCcblkKqvJGXWzEIb
	tsms6R+VYE+N5i5cJ3Wzf1DCjv8I5k3j5XUn/I3dJUXamVOhX7TCNNWms8jT6MINrXR7H07ZZW+
	8NWC7GGCrvWdHxdQZscSFOx7mXPzr8aIWTAo4E/4H6ba0orp9aQT4QRbEAf7/0KUWke72xECzWI
	CWS6lPFiL9j1sWhYzwNLvIVffNKvyqAOpPGIpeh6MomCf2VlN3lRLR4R0l833vZb0dTmca/XA7/
	fGU/rCvwyLRvgW8JyEBDQgOOc8N7wx2oRjW7cJi5m6KP7/msCzMDgv0ccti2b0oDPjDMDkYh1UB
	VWJ0lK5XtMv8+HPLdjRtwu/+4vXJ4=
X-Received: by 2002:a17:907:a392:b0:b96:eee1:bb66 with SMTP id a640c23a62f3a-b9d7267ad9dmr146723166b.10.1775813911606;
        Fri, 10 Apr 2026 02:38:31 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: gic-v2: disable interrupt bypass on CPU shutdown
Date: Fri, 10 Apr 2026 12:36:15 +0300
Message-ID: <459cf46204e86ed3a2ffd79ae649b1a2051f5204.1775812563.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1775813912-BCF5B0B1-DB3B44AB/0/0
X-purgate-type: clean
X-purgate-size: 3034
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 03EA63D507A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.

Per IHI0048B.b section 2.3.1, clearing IRQBypDisGrp{0,1} and
FIQBypDisGrp{0,1} selects bypass rather than deasserted interrupt
outputs when the CPU interface stops driving them. Tables 2-2 and 2-3
show that a zeroed GICC_CTLR can fall back to the legacy IRQ/FIQ inputs
instead of fully disabling the interface.

Fix this by reading GICC_CTLR, setting the bypass-disable bits, and
clearing both group-enable bits before writing the value back. Keep the
existing GICC_CTL_ENABLE definition for the init path and use a separate
mask for the shutdown-side group-enable handling.

Section 2.3.2 also states that wakeup event signals remain available
even when both GIC interrupt signaling and interrupt bypass are
disabled, so disabling bypass does not break the power-management use
case, i.e. suspend modes.

Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v2.c          |  7 ++++++-
 xen/arch/arm/include/asm/gic.h | 21 +++++++++++++++++++--
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index b23e72a3d0..22aa25bad0 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -408,7 +408,12 @@ static void gicv2_cpu_init(void)
 
 static void gicv2_cpu_disable(void)
 {
-    writel_gicc(0x0, GICC_CTLR);
+    uint32_t ctlr = readl_gicc(GICC_CTLR);
+
+    ctlr |= GICC_CTL_BYP_DIS_MASK;
+    ctlr &= ~GICC_CTL_ENABLE_GRP_MASK;
+
+    writel_gicc(ctlr, GICC_CTLR);
 }
 
 static void gicv2_hyp_init(void)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 8e713aa477..da285adb83 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -102,8 +102,25 @@
 #define GICD_TYPE_SEC   0x400
 #define GICD_TYPER_DVIS (1U << 18)
 
-#define GICC_CTL_ENABLE 0x1
-#define GICC_CTL_EOI    (0x1 << 9)
+/*
+ * Keep the legacy name for bit[0]. In the Non-secure view of a GICv2 with
+ * Security Extensions this is the Group 1 enable bit; otherwise it is the
+ * Group 0.
+ */
+#define GICC_CTL_ENABLE        (0x1 << 0)
+/* Bit[1] is the second group-enable bit when separate group enables exist. */
+#define GICC_CTL_ENABLE_GRP1   (0x1 << 1)
+#define GICC_CTL_FIQBypDisGrp0 (0x1 << 5)
+#define GICC_CTL_IRQBypDisGrp0 (0x1 << 6)
+#define GICC_CTL_FIQBypDisGrp1 (0x1 << 7)
+#define GICC_CTL_IRQBypDisGrp1 (0x1 << 8)
+#define GICC_CTL_EOI           (0x1 << 9)
+
+/* Shutdown clears both possible group-enable bits, regardless of layout. */
+#define GICC_CTL_ENABLE_GRP_MASK (GICC_CTL_ENABLE | GICC_CTL_ENABLE_GRP1)
+#define GICC_CTL_BYP_DIS_MASK                          \
+    (GICC_CTL_FIQBypDisGrp0 | GICC_CTL_IRQBypDisGrp0 | \
+     GICC_CTL_FIQBypDisGrp1 | GICC_CTL_IRQBypDisGrp1)
 
 #define GICC_IA_IRQ       0x03ff
 #define GICC_IA_CPU_MASK  0x1c00
-- 
2.43.0


