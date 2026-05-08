Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPvwOLT2/WlilQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD34F7F97
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303746.1577067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQk-0006ya-98; Fri, 08 May 2026 14:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303746.1577067; Fri, 08 May 2026 14:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQj-0006ux-VS; Fri, 08 May 2026 14:43:53 +0000
Received: by outflank-mailman (input) for mailman id 1303746;
 Fri, 08 May 2026 14:43:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQi-0006aZ-5O
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQh-00A90j-Id
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a6-bab6-0a2a0a5309dd-0a2a450581d0-2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:51 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a7-aaa8-0a2a45050019-d155da31a443-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:51 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b93698bb57aso376275666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:51 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251431; x=1778856231; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IQA+KUL5MpZcplutGw2+zZiZhu/Y0nI/Sw/1I/I0ks=;
        b=ji80PUJ9EwNfOqVaAU9VD3Wsi8xo6rDjVxRhBQ0SZg+qBAvl7flY/BLeAmvq+gKy+S
         vlYUyq+0bnHbIOOOE0e2X38mEiITUOFbB8ncBk6IuCXVFg7iPckzjn0hJtPju2QpEHx5
         K7taLf1r1uPSX1FYmoGXEKPP2ljOxEyVKbjvTkgWki0mA51XaJrtoEL72OXZPFW3HWtC
         dfhYlvWXYXNrFCBlh75w3x0CpkL7XceQeUPRaEH9hlm7KjvovsmoTzc9CaKmYvV+yUbX
         QUOvbLFB5r8p0EIzAUBaDPmm4zpc2qD5VVzkm/P0J2gkvLgKwmexh3O5ItFUSD9O85dj
         WA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251431; x=1778856231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/IQA+KUL5MpZcplutGw2+zZiZhu/Y0nI/Sw/1I/I0ks=;
        b=emJKk16gQPzSuxOJnOAdXa7uRtpzzIBaM/PoKZX9G36zAus45FVgQJxTdK7papk7J8
         eu9MKXjpluHUe+Pcx/5AK7gDEzK8/kedSL5JsCNLsxqK1Utm2YNPHucZjJmpqz8rdfht
         B5kotRCbCPn/LkqQFJ71r9HIR9h4xzrwqVCs96K7uzAbFsNt1CJWMYnKY/2Cc4Fr2gCX
         a6c9zFyNy+orzidLcuBzgOkyuSsG10QipkNLvXO1SVpOCJun1YNXklxWjtlpFz8xyVjw
         MLVzyVU+CxqVwJhwxohC+v5DvjvE0OuJ4+CW+yCt0z09Eu5/Lm5L/Em4f8FmLEVvH/Ky
         VJjA==
X-Gm-Message-State: AOJu0YzXYuSRdDFSD6FrmSZAogbNTWotBg21of8PEJteKsnmbT+0UdJN
	9PPFi3QUiEXlhdJ3qxtg3ydzRpP3j0kOgqZWRR2tl2r63+zcfkKMtejI1wlgMw==
X-Gm-Gg: AeBDiesWLQtYF7ZAFZuHKHIk34bA/2ZLd0C/54TvNwHfJUvIuO84Lh/glfI/EeUZlQw
	kWZgBvZqlLx+7BLxlRdLRjcsotuhRJTN0aYOnGri6Jq6AaDkjzsWTnHwSoAt09k8pQClFzlybyJ
	hM+Go7/gMPptQZCrRcRK8KLPdcz9CMGctW+RH5HqMqexHH7xM/TLT2MSfiIP5RC3fxfQE165yuC
	oUkwiAVneqjjBdFNnwBY7A5V1xh7s7oCJIRB4Oome3RdkbdouZWluewJAY4H6FJlTsS4V76l68Y
	VHoRfo2ZgF1TsW1vI7Ge46MypXyc0h9F1mv6A+0ErTfd//gOcgcFLaW/ZcIpNi/x1QS3DM+6czs
	B/Mj5sSztSd71UZ0JXHn9y0r04ExAZfPHbLOJOnnRH5p8u5HM9gWIVBrdCO052y2BjMfHkUjVrf
	yXiapkL0DJ32kdRK6ZGPY8/hf7/QDvdOIOXVQO++LLv5uv0qpopJnwgmrgNh8eiA==
X-Received: by 2002:a17:907:7207:b0:bcb:8b41:b0de with SMTP id a640c23a62f3a-bcb8b41b476mr22594966b.19.1778251430667;
        Fri, 08 May 2026 07:43:50 -0700 (PDT)
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
Subject: [PATCH v2 09/26] xen/riscv: introduce init interrupt controller operations
Date: Fri,  8 May 2026 16:43:11 +0200
Message-ID: <286a8b99ad7c107fc46c346f7c075617740fa194.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1778251431-E2997443-F9C86D02/10/73395122804
X-purgate-type: spam
X-purgate-size: 3566
X-Rspamd-Queue-Id: 6BCD34F7F97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Introduce intc_hw_init_ops structure to avoid risky mix of init
function and non-init function.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/aplic.c            |  7 +++++--
 xen/arch/riscv/include/asm/intc.h | 10 +++++++---
 xen/arch/riscv/intc.c             | 10 ++++++++--
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 739e8dab3498..97dc0ef731f0 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -306,12 +306,15 @@ static const hw_irq_controller aplic_xen_irq_type = {
 
 static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
-    .init                = aplic_init,
     .host_irq_type       = &aplic_xen_irq_type,
     .handle_interrupt    = aplic_handle_interrupt,
     .set_irq_type        = aplic_set_irq_type,
 };
 
+static const struct intc_hw_init_ops __initdata aplic_init_ops = {
+    .init                = aplic_init,
+};
+
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
                                     unsigned int intsize,
                                     unsigned int *out_hwirq,
@@ -347,7 +350,7 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     dt_irq_xlate = aplic_irq_xlate;
 
-    register_intc_ops(&aplic_ops);
+    register_intc_ops(&aplic_ops, &aplic_init_ops);
 
     /* Enable supervisor external interrupt */
     csr_set(CSR_SIE, BIT(IRQ_S_EXT, UL));
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index ecdc8a5e6577..8b498e43b33f 100644
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
+    /* Initialize the intc and the boot CPU */
+    int (*init)(void);
+};
+
 void intc_preinit(void);
 
-void register_intc_ops(const struct intc_hw_operations *ops);
+void register_intc_ops(const struct intc_hw_operations *ops,
+                       const struct intc_hw_init_ops *init_ops);
 
 void intc_init(void);
 
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index ea317aea5ad8..8649160403f7 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -12,9 +12,13 @@
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
 
-void __init register_intc_ops(const struct intc_hw_operations *ops)
+static const struct intc_hw_init_ops *__initdata intc_hw_init_ops;
+
+void __init register_intc_ops(const struct intc_hw_operations *ops,
+                              const struct intc_hw_init_ops *init_ops)
 {
     intc_hw_ops = ops;
+    intc_hw_init_ops = init_ops;
 }
 
 void __init intc_preinit(void)
@@ -27,7 +31,9 @@ void __init intc_preinit(void)
 
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


