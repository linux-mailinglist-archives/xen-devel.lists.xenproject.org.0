Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EXrCktQsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED70255467
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250392.1547921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aB-0003G6-9y; Tue, 10 Mar 2026 17:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250392.1547921; Tue, 10 Mar 2026 17:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aA-00038q-W2; Tue, 10 Mar 2026 17:09:22 +0000
Received: by outflank-mailman (input) for mailman id 1250392;
 Tue, 10 Mar 2026 17:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a9-0001Q4-Gb
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:21 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e11448e7-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:20 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-485392de558so15013885e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:20 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:19 -0700 (PDT)
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
X-Inumbo-ID: e11448e7-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162560; x=1773767360; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l+2sfUlHi+3W7tldQuhyj7te+foi9fBjieEM15WHyQ=;
        b=ZAK36sIlsfOk4hW9Bb7BChtrCIV28Sid3O9vbFB3gC2iVx0qWb4/GSNl2bKt0eRBAq
         WT47fAnrqMH3QdgU3oMD9LVUPDJAx39Z4nV2R5xe2HqbLW6+2g5Gl4fWGHtxYIAmYtFG
         grN3QsJ3opTlj7q36I+/NVNyF/vaR95dpMoIbgF/tmc3QsQ47hM5KSAwB0MJVUC+tTWm
         bbOmaevwCoZQD+RT95OzP8Ccqk4KHVbgQO4PCbfXHZfRPCPWZTJnPCVDiPZPGLfg4pqU
         XXKzS1tPIhHN6anLHFRhd/HMhsyH3w590akpfFIWeBomVc9FJ3gKGN/L5h9AyjyGRXN+
         SUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162560; x=1773767360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/l+2sfUlHi+3W7tldQuhyj7te+foi9fBjieEM15WHyQ=;
        b=XKrojN2ypzF0CG/eTPhVLlAMXbivQV0F8uKHcVzHTvZgUT0nbkuG1Y0gQ/G8t3+t0E
         VT+LaVGSgnGxNLW01iABuo7CIKD3bFkWSOm1y1PRv9uohe+rn8qQ8MXcvcChQSU0UaWS
         depDiXgqqc86H0o8RpCLWy/ADwvQ0CKyz8Z6hdxkS4b2gZ2uBPNCyTdrp/Swd60lAexv
         uVuvf1pz1k6cGbXalTSZyAAjfsKrbrd4M0QQTMqP98i1WtV5GGmORyfoMq2z2uR4XiZ/
         LiHRTR75m0FSfXB6k1ehiZvvRAoZY1n54H8KUmowczoF9rIONma2+uZvgtmj0f6ckBZh
         wBbA==
X-Gm-Message-State: AOJu0YzTnMQDZVUdZWLK0ma9ROSNvBFt6tDjsrulScKtgDepbuwjllfm
	cQjNrg6m52mWXMmlv8axx/tJoXUY3o97aB5e/sDcz9KsEYrOcjFGVtnMxQbtxkUP
X-Gm-Gg: ATEYQzyJ/l2cTlL3dlpl/2BuKkuDIU0UUrG8TA0Gkx7cV0CoAWAxra9UqROpoa6NbnY
	kk5WeRG5UOsxULuEjJfULUzyVD1RMoSe0bj0mkbvVsWQjZ7Q3j2yR2nDamdYkRRCNfziyUe+uNm
	IjqZRp0vkddZXdszNG90SBPt3Ns7BfajrTaBbgq13+pzPdw6dkHQh6y14xEqDPQocleaIPfF0sL
	k9kGf/cm9nmcPsgaPMT+1ZP/VVb5hHg7DaOVwjCp1h0x4fO4aN2v5HpRQJqgtTx1BqwN4A6oSlN
	ioKESIzbXEcyOrJpjgLPUrXE1bWmILUtqu3a561diqKpzWqKtFj06q7jFoaZZ4i2fkh96QGa7cy
	QERmB+gZrPGILQ71/IEc2D6zBAXzBGfvdm34U9Fzsd4pBbOyfO48zpoN0NYLdBjXZS8uGo7p3Ug
	C1cNCxbxeaR2GEcDE2mImWFphpEpjF7qpJpFUT4t78UiGKayoM1tPGB4z3gpHWpT7K2ac7OA==
X-Received: by 2002:a05:600c:1f0f:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-48526967cd9mr255015965e9.22.1773162559897;
        Tue, 10 Mar 2026 10:09:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 09/27] xen/riscv: implement make_intc_domU_node()
Date: Tue, 10 Mar 2026 18:08:42 +0100
Message-ID: <7a7f1430090eaf50cc3bff25e894c13404bffad5.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AED70255467
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Introduce a RISC-V specific function to create an interrupt controller
Device Tree node for DomU domains during dom0less build.

Add make_intc_domU_node() to the dom0less build path and wire it to
a new generic helper, intc_make_domu_dt_node(), which delegates DT
node creation to the active interrupt controller implementation via
intc_hw_ops.

Extend struct intc_hw_operations with a make_dom_dt_node callback
and expose the required interfaces in the interrupt controller header,
allowing individual interrupt controller drivers to populate DomU DT
nodes as needed.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/dom0less-build.c   |  9 +++++++++
 xen/arch/riscv/include/asm/intc.h | 10 ++++++++--
 xen/arch/riscv/intc.c             |  8 ++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index 10863cffc96b..312c5d7d4979 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -3,6 +3,15 @@
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
 
+#include <asm/intc.h>
+
+int __init make_intc_domU_node(struct kernel_info *kinfo)
+{
+    intc_make_domu_dt_node(kinfo);
+
+    return 0;
+}
+
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     /* No RISC-V specific nodes need to be made, at the moment. */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index ecdc8a5e6577..8300d71d472f 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,14 +8,14 @@
 #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
 #define ASM__RISCV__INTERRUPT_CONTOLLER_H
 
-struct dt_device_node;
-
 enum intc_version {
     INTC_APLIC,
 };
 
 struct cpu_user_regs;
+struct dt_device_node;
 struct irq_desc;
+struct kernel_info;
 
 struct intc_info {
     enum intc_version hw_version;
@@ -41,6 +41,10 @@ struct intc_hw_operations {
 
     /* handle external interrupt */
     void (*handle_interrupt)(struct cpu_user_regs *regs);
+
+    /* Create interrupt controller node for domain */
+    int (*make_dom_dt_node)(const struct kernel_info *kinfo,
+                            const struct dt_device_node *intc);
 };
 
 void intc_preinit(void);
@@ -53,4 +57,6 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
+int intc_make_domu_dt_node(const struct kernel_info *kinfo);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index ea317aea5ad8..a6f8c30f4771 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -67,3 +67,11 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_type(desc, desc->arch.type);
     intc_set_irq_priority(desc, priority);
 }
+
+int __init intc_make_domu_dt_node(const struct kernel_info *kinfo)
+{
+    if ( intc_hw_ops && intc_hw_ops->make_dom_dt_node )
+        return intc_hw_ops->make_dom_dt_node(kinfo, intc_hw_ops->info->node);
+
+    return -ENOSYS;
+}
-- 
2.53.0


