Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O/HCfleA2r55QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D087E5257E7
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307281.1579045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcE-0007I6-Bl; Tue, 12 May 2026 17:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307281.1579045; Tue, 12 May 2026 17:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcE-0007FC-8B; Tue, 12 May 2026 17:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1307281;
 Tue, 12 May 2026 17:09:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqcC-0006to-7x
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqcB-007RzZ-Km
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ec9-2eae-0a2a0a5409dd-0a2a4501afae-30
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:51 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035edf-c1f2-0a2a45010019-d155802cb4e9-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:51 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so69609145e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:51 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778605791; x=1779210591; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0jUJYHm37yuKRA04SvTDMOB3esx5h23DnnVhZYfk0I=;
        b=ggpm0ec0fA0bp1goMWuheTGx9TqOYlr+wHChAfDZ9lBlX256N+/Hq8h6qJfJGRvyVZ
         heyf7si4eQ6z5hURq5s9p1eGFWm87/QiSl1YrWs0vUkI6uyoY71iKnS3fKv0rb81/eX8
         +E/MUPtsH162f+nXLOFVwNZUV7cSvRtn0jPh5x/GUxrYyh0M8CEMiRj7z7d3AtHqwv8U
         Lu1Tft/KXZYkWk3+aEw1cztnVddb8LrJMq2t38ESERAvp1wNj20bd+wkIwiGwSDnMRld
         rFDYaYEpVMQK30OFK+4XJGMyeN4ej7ytBlQvk4vgvBQX2o2aX8Z7yHik7zu4HnscL24S
         4dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605791; x=1779210591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F0jUJYHm37yuKRA04SvTDMOB3esx5h23DnnVhZYfk0I=;
        b=AM5rBrh9ZHbuFbYao0P6tFdEQyaVYWFUsY5EUN/+3gkPZDU7epZ9XPnHhIMNRa8lZq
         v+meheFYvz1hmkFywnwoeN1IZCBorhec9+S+y1FvpdrT8CLFNOG/rPyr0tIq8AXahT3B
         w95NfvtXFRmCKaquLwCzcjYrRHqPX55ClJVBXsCOwBZORYlB3F3C75EwntJEyqJtVzFs
         fq88OuPtrm5IIH+3E9c1h0YkA2jQUeTyc6DtEao6+0ELHicQSaNWzJRiVelzZP/Ua0jy
         H/LuLllPOjmvbM9k2C1fx3V0zwbFGLznu2+aIoHtbMWTmmgw7Dww+fKr0uQS5MC6PADo
         p5JQ==
X-Gm-Message-State: AOJu0YwPag7Q8H60E+YjjzSyAHlw0EP4S3Oqr9gZzs8S4ZXdNGc28elG
	hC2RU40RKNhcOB1wGp0Cs7nhMEFFUnh0C2oSUQfV5xxUkeu3jIFluZPUPzv7fQ==
X-Gm-Gg: Acq92OFxx30AB80x+yygAaGwwrAbI+t9Q7jUNpYxRkMrerpoAABQnlu6/b3xN0m9ZHa
	1twBTQxgQzsmGGXmqEbq91X1Eq7slS/+EyVYry73pKed/6B4ivfaKUWdxEA19dU0UqH5y/XzLGQ
	n8FFTFvC1rRyzp+2ZiwgywNwkWMYT1BwyRqtYYkNNUzkGMLkDMDALiwjYgMzySDp8i/Kv+Jg/Gd
	WFZR0XkCdz4ZyO2e/XTuFGA9gHYGqjNb1+TwbLk999jY8IBbtlvlePnxvQfv5EW4NooeigX+Wud
	6lapYgM68xBfe6LG5prtpbYSieyIg9i/72VWKWX0fPoUF0AMeeuBQUS+y4cC+qOeETMSaVqb+Od
	JqgSdI3SEP759YlNL9/Grk9cwsOM5+SQMUlz8RkbZLfhYZQjrEcQVc83jrTPZGAQAEJaMfr5CBU
	xsMdnQlQrqYuSlBStaYBGLvJtiBA==
X-Received: by 2002:a05:600c:8b68:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48e70809f8fmr252913185e9.27.1778605790729;
        Tue, 12 May 2026 10:09:50 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v9 07/13] xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
Date: Tue, 12 May 2026 20:07:14 +0300
Message-ID: <f56ef93fd90ebd599437620047050cd5d23b8f17.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778605791-AFF50FF4-A4C47A8C/0/0
X-purgate-type: clean
X-purgate-size: 3700
X-Rspamd-Queue-Id: D087E5257E7
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:luca.fancellu@arm.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

The FF-A notification SRI interrupt handler was not correctly tied to
CPU hotplug and suspend/resume. As a result, CPUs going offline and
back online could end up with stale or missing handlers, breaking
delivery of FF-A notifications.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_notif.c | 63 ++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 186e726412..513c399594 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -360,10 +360,28 @@ static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
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
@@ -376,14 +394,36 @@ void ffa_notif_init_interrupt(void)
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
+                                  unsigned long action,
+                                  void *hcpu)
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
@@ -392,7 +432,6 @@ void ffa_notif_init(void)
     };
     struct arm_smccc_1_2_regs resp;
     unsigned int irq;
-    int ret;
 
     /* Only enable fw notification if all ABIs we need are supported */
     if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
@@ -408,13 +447,11 @@ void ffa_notif_init(void)
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


