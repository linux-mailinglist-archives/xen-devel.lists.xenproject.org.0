Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t7l6JQefPmoBJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17BE6CEA0A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bqRzeLr9;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346281.1604810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lg-0002dd-Gg; Fri, 26 Jun 2026 15:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346281.1604810; Fri, 26 Jun 2026 15:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lg-0002a7-7b; Fri, 26 Jun 2026 15:47:00 +0000
Received: by outflank-mailman (input) for mailman id 1346281;
 Fri, 26 Jun 2026 15:46:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8le-0002Ap-DR
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8ld-00D1eP-QD
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ed4-5cb7-0a2a0a5109dd-0a2a4505c00c-42
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:57 +0200
Received: from [209.85.167.41] (helo=mail-lf1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef1-3cb2-0a2a45050019-d155a729f031-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:57 +0200
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5ad536cd0c6so1012879e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:57 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:56 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782488817; x=1783093617; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzYOAPlpVwUcUak5H++ik2H8pEqHXcF+MNINDhmTTZ8=;
        b=bqRzeLr92fsmX9wc1dW6sjw7CqV+uJFJZGrAaHV8ykSH2ESbK6ZJ3dL0xuiUHi4xxj
         eiqYciX0/bxwhdMQRYQeHmAQU1vNYRm7VyGTuZJrOSQettDSPB8JLaaxk5hnN31McOBl
         PlxHAhPLvlTl8H47mIRRimwCjueC/pAAuYQlUJonG8puqCCyjT4iNwqaEcs3eaaWWDRu
         r1yCbQCVAzhMyUb+XGLgqrsepgOZo7MYZAHUcUy/Z8vvqSiNJCD5xbS39DcJ3XCvm29b
         QdqRoMSlMot1QjVs0a7bFOA7Xo1bY9KfOeG4LF4fDZRx5dJ/ZEM/TZ0L93McsFy0+mrx
         KxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488817; x=1783093617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FzYOAPlpVwUcUak5H++ik2H8pEqHXcF+MNINDhmTTZ8=;
        b=h1fMeqsUvtvQSvlg+Z5T5QUyofAYRk47dUUQl/mvEGbwI1gNBpZE0XpcxF+2RW+uxF
         eANvQ0P5BWmX64wwDe4QGiH+zfMCSHDkfyNIhshdsqJeKqJITyfFGm7fYQCgN7bXz5N/
         fmVho5K6FuO+pEirOSPNBskRKrB/trA2D3vzNqhD89kNw9QdnKHGFOSIUSyFTnptHVhA
         dWzH233488QvnS5QldgHeTzm/tdMJOs7ep2Ro4QsRLZdKXpzG3J4zLjb//84C/dbz5Vt
         uyvu3e2lP0GIV8WnKCyMW+qMTPuTIvnIO0nYajFgNSTIUqCXKHVOuxtUANyNNnK1cKiV
         VEaQ==
X-Gm-Message-State: AOJu0Yyg9/Ug0xaVmH28rmc62QEI4E4LNhGMr6rdjMgPtthujzWpwJfS
	zrQjka5/ChDBLkSqIoln5tdG9/b3BH7TWnMH4cd6OhrA2bTdMLmlDGObjDSWfQ==
X-Gm-Gg: AfdE7ck7Rd400QbNX7rrl6IdKKScRsCLDKVx/EK0lISKRCbzy14zQpHJOerDnhHzLKk
	94+opJYo2JCJXZ8xVPPut9fyEnWrY4PwCZiSIP/TvVl6TdAKoRgUj9YV51dq54+qszKfi6jbmxV
	9WOGBL482ItrKLlhdI0P0t4wUTrKs0uilO24UU4lmh+cezTZlrrDzvVzAJL4P+rLBiEio8qfzCr
	t+xRtsLSbViVzEfa07Ygmg8ZYc5gqsOg3pogE3L/cCcR6dR86O5K+5GWJkqnAxaAVopWkNyCzVK
	yO9gapusszTPDE1rNEq6rYsnuRq9mAltVNtHFQCnjJ2HuIQrmYzKXb3DMQhdKJfzmJIbA+eUBiI
	3stBwf3rROXT2sSStiR50uJXb/tmpbtoHjn10NZWC3mn02whI7LU+ne8m5wENerabgWzWkI0iNX
	M4THGMAYMqAj9I/Sp7Y6aF2Fx7vbZS5CKNmg8l4udTwcxz6shm5ciB9advneo3aMBKD8il
X-Received: by 2002:a05:6512:39c8:b0:5ad:abf:1e1d with SMTP id 2adb3069b0e04-5aea1f3464emr2403998e87.8.1782488816947;
        Fri, 26 Jun 2026 08:46:56 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v4 12/25] xen/riscv: introduce init interrupt controller operations
Date: Fri, 26 Jun 2026 17:46:21 +0200
Message-ID: <6b57fa27f8f4c8a90a1237c1880ecf476b9fe222.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1782488817-0DB092B8-6C7299E4/10/73395122804
X-purgate-type: spam
X-purgate-size: 3976
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F17BE6CEA0A

Introduce intc_hw_init_ops structure to avoid risky mix of init
function and non-init function.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Use __initconstrel instead of __initconst for aplic_init_ops as both
   initialized fields incur a relocation.
 - Add Acked-by: ... .
---
Changes in v3:
 - Use __initconst instead of __initdata for const intc_hw_init_ops.
 - Embed const struct intc_hw_operations *ops into intc_hw_init_ops so
   register_intc_ops() takes a single pointer argument.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aplic.c            |  8 ++++++--
 xen/arch/riscv/include/asm/intc.h | 10 +++++++---
 xen/arch/riscv/intc.c             | 11 ++++++++---
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 739e8dab3498..def15f792d62 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -306,12 +306,16 @@ static const hw_irq_controller aplic_xen_irq_type = {
 
 static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
-    .init                = aplic_init,
     .host_irq_type       = &aplic_xen_irq_type,
     .handle_interrupt    = aplic_handle_interrupt,
     .set_irq_type        = aplic_set_irq_type,
 };
 
+static const struct intc_hw_init_ops __initconstrel aplic_init_ops = {
+    .ops                 = &aplic_ops,
+    .init                = aplic_init,
+};
+
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
                                     unsigned int intsize,
                                     unsigned int *out_hwirq,
@@ -347,7 +351,7 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     dt_irq_xlate = aplic_irq_xlate;
 
-    register_intc_ops(&aplic_ops);
+    register_intc_ops(&aplic_init_ops);
 
     /* Enable supervisor external interrupt */
     csr_set(CSR_SIE, BIT(IRQ_S_EXT, UL));
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index ecdc8a5e6577..3d84fcc51d1a 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -28,8 +28,6 @@ struct intc_info {
 struct intc_hw_operations {
     /* Hold intc hw information */
     const struct intc_info *info;
-    /* Initialize the intc and the boot CPU */
-    int (*init)(void);
 
     /* hw_irq_controller to enable/disable/eoi host irq */
     const struct hw_interrupt_type *host_irq_type;
@@ -43,9 +41,15 @@ struct intc_hw_operations {
     void (*handle_interrupt)(struct cpu_user_regs *regs);
 };
 
+struct intc_hw_init_ops {
+    const struct intc_hw_operations *ops;
+    /* Initialize the intc and the boot CPU */
+    int (*init)(void);
+};
+
 void intc_preinit(void);
 
-void register_intc_ops(const struct intc_hw_operations *ops);
+void register_intc_ops(const struct intc_hw_init_ops *init_ops);
 
 void intc_init(void);
 
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index ea317aea5ad8..3600d23bdb5b 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -12,9 +12,12 @@
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
 
-void __init register_intc_ops(const struct intc_hw_operations *ops)
+static const struct intc_hw_init_ops *__initdata intc_hw_init_ops;
+
+void __init register_intc_ops(const struct intc_hw_init_ops *init_ops)
 {
-    intc_hw_ops = ops;
+    intc_hw_ops = init_ops->ops;
+    intc_hw_init_ops = init_ops;
 }
 
 void __init intc_preinit(void)
@@ -27,7 +30,9 @@ void __init intc_preinit(void)
 
 void __init intc_init(void)
 {
-    if ( intc_hw_ops->init() )
+    ASSERT(intc_hw_init_ops && intc_hw_init_ops->init);
+
+    if ( intc_hw_init_ops->init() )
         panic("Failed to initialize the interrupt controller drivers\n");
 }
 
-- 
2.54.0


