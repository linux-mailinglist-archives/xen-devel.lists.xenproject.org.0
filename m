Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06036CB6F09
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184551.1507012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfq-0004cL-CQ; Thu, 11 Dec 2025 18:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184551.1507012; Thu, 11 Dec 2025 18:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfq-0004Yl-6e; Thu, 11 Dec 2025 18:45:58 +0000
Received: by outflank-mailman (input) for mailman id 1184551;
 Thu, 11 Dec 2025 18:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfo-0003I8-4x
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:56 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a01b52bc-d6c1-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:45:55 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso828655a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:55 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:53 -0800 (PST)
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
X-Inumbo-ID: a01b52bc-d6c1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478754; x=1766083554; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rz0HDghJ0IsRbhxCGz59UWa71x4c1jNbwB3bP+NDcUo=;
        b=KWAP0RRJySseb9OVoG9E0sONatv2MyeoRDoINiWn5kEZFyOflwwtu+K24cGS/JGwvf
         cB8xYP4HD2EOYzynuOHeaH8kiaGE2IdFCM2e5wLBiK6aiGdL1c+DBCkmJWJPykI9c3+G
         UcMZBC+hp6K/wQKLiBiC9vz2ao0fc3zGUUK3BChJAAtS3Iclc9Ev10yHV8wZijQrWEgM
         O8D6KTkrvLytYSXbpFNYOZGQwOnj/IkfWcMhGf5Xck9SJYfZdxwvXF4uq38daF0dGiWn
         5VwB8ty8FJGzSqxuxPCnVYxQYP2r+U3SSMekclraC7LahhbOU6080hh9sW1nhKnSQt+0
         Lm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478754; x=1766083554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rz0HDghJ0IsRbhxCGz59UWa71x4c1jNbwB3bP+NDcUo=;
        b=mv/CYCTkYF9jRrfWz+mg5DrFKpbUa4utNb4yYurniQy6KS6xe3p3fu1Tn/BhSjeoO8
         hPuekvHJBta5NOwEpym5VtjUvwXZaO6Pya8ZA9uBUuVv2HRjBMT7YFCeRshAk8nrBm8f
         ILYjpjYMmttNYJ9NLZo8AdOy/5d0OimgDu9O7+ZGdEX4g0LtTCQRPrIilgAlVj7iyuaM
         d6kSBChLRk5WFFktDJVNSNcT9iaZa4KvoYq7OYjBknsHX5qhMBAHCgBJ6JQmwjdCcX36
         VeTl/YRNGIh82gAcZSQaz1ZfeBoMEMuoTHZAgaiBWEtQm8S5EuxwB27BE7C3VLGqkGyq
         PSMQ==
X-Gm-Message-State: AOJu0YzlWglAbmOLPGN6BCgVRHFkvRcJKSI75FU/eet+SPubCddsXWsq
	kYtkSrULFN+JEs/IBbY2iCv9hrmzAlqYkhRVdxkY+1IJauf5q8f4dUCEdj2BNOnG
X-Gm-Gg: AY/fxX4NhdNTr/e3Zgc7eNMFQOFtW8aNvrISRLSMFpBOgYNiBOy8Mtx+yJDGfOaPDk5
	gowerT8pXLspaPhdfAp3eVqx3c845Fgbhd7LpaCrnxlXolNjT9iSCRq6371Q7nAl5h+tKXDFulI
	9rh2CXQHeZ8cYwfGllARLcopXcKH9pRS23xWtYegrLC+AtSipkrAyLCW3ZPCyTYJY8VTOztnKLX
	AuHnO2365P1dlHVoyZ+/A9CfVQNkyE2z6ikLABRejusviHeSCG51ANFU9eY7H6KSzsqF0zcpZnb
	klkcZ9oKUmH6saCMa/H9kRv9rjGh60KUHCNED9mP7dYA/Qy037mL3rRvpodJiHjjd+/3T6zuR3t
	mYLcZkz5yuVxZOe9vslkBN3q/pgt9LTIv7VUWdRI6cK6Z6Tf8mr9CErSa8u44mYZlPv62RMpd2R
	+qmoSAQzpFaP7n7u3wBgIbVUVFl7TyGJGOj7gb+Yst
X-Google-Smtp-Source: AGHT+IFl62FZ0FgJSyr4XEZouQeIWhJVM6kfXy3OW7rtGR1k5t90f62MNqwbncILJbOinFyLpJdUeA==
X-Received: by 2002:a17:907:d10:b0:b73:210a:44e with SMTP id a640c23a62f3a-b7ce8414319mr770611666b.30.1765478754270;
        Thu, 11 Dec 2025 10:45:54 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v7 06/12] xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
Date: Thu, 11 Dec 2025 20:43:30 +0200
Message-ID: <d08aa453e3302105648fd4b4f5872ee88f16c660.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

The FF-A notification SRI interrupt handler was not correctly tied to
CPU hotplug and suspend/resume. As a result, CPUs going offline and
back online could end up with stale or missing handlers, breaking
delivery of FF-A notifications.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/tee/ffa_notif.c | 63 ++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 86bef6b3b2..84f5c6b43b 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -359,10 +359,28 @@ static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
     return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0, 0);
 }
 
-void ffa_notif_init_interrupt(void)
+static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, sri_irq);
+
+static int request_sri_irq(void)
 {
     int ret;
+    struct irqaction *sri_action = &this_cpu(sri_irq);
+
+    sri_action->name = "FF-A notif";
+    sri_action->handler = notif_irq_handler;
+    sri_action->dev_id = NULL;
+    sri_action->free_on_release = 0;
+
+    ret = setup_irq(notif_sri_irq, 0, sri_action);
+    if ( ret )
+        printk(XENLOG_ERR "ffa: setup_irq irq %u failed: error %d\n",
+               notif_sri_irq, ret);
 
+    return ret;
+}
+
+void ffa_notif_init_interrupt(void)
+{
     if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
     {
         /*
@@ -375,14 +393,36 @@ void ffa_notif_init_interrupt(void)
          * pending, while the SPMC in the secure world will not notice that
          * the interrupt was lost.
          */
-        ret = request_irq(notif_sri_irq, 0, notif_irq_handler, "FF-A notif",
-                          NULL);
-        if ( ret )
-            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-                   notif_sri_irq, ret);
+        request_sri_irq();
     }
 }
 
+static void deinit_ffa_notif_interrupt(void)
+{
+    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
+        release_irq(notif_sri_irq, NULL);
+}
+
+static int cpu_ffa_notif_callback(struct notifier_block *nfb,
+                             unsigned long action,
+                             void *hcpu)
+{
+    switch ( action )
+    {
+    case CPU_DYING:
+        deinit_ffa_notif_interrupt();
+        break;
+    default:
+        break;
+    }
+
+    return NOTIFY_DONE;
+}
+
+static struct notifier_block cpu_ffa_notif_nfb = {
+    .notifier_call = cpu_ffa_notif_callback,
+};
+
 void ffa_notif_init(void)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -391,7 +431,6 @@ void ffa_notif_init(void)
     };
     struct arm_smccc_1_2_regs resp;
     unsigned int irq;
-    int ret;
 
     /* Only enable fw notification if all ABIs we need are supported */
     if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
@@ -407,13 +446,11 @@ void ffa_notif_init(void)
         notif_sri_irq = irq;
         if ( irq >= NR_GIC_SGI )
             irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
-        ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
-        if ( ret )
-        {
-            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-                   irq, ret);
+
+        if ( request_sri_irq() )
             return;
-        }
+
+        register_cpu_notifier(&cpu_ffa_notif_nfb);
         fw_notif_enabled = true;
     }
 }
-- 
2.43.0


