Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMhIE4ZFD2ptIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014615AA919
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315656.1585420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VR-0002eh-Gb; Thu, 21 May 2026 17:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315656.1585420; Thu, 21 May 2026 17:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VR-0002aY-8C; Thu, 21 May 2026 17:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1315656;
 Thu, 21 May 2026 17:48:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VP-00022P-9u
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VO-00Bm0f-Lk
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f452f-bab6-0a2a0a5309dd-0a2a4508d226-32
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:22 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4566-63b5-0a2a45080019-d155802ba517-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:22 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so36844985e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:22 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779385702; x=1779990502; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0jUJYHm37yuKRA04SvTDMOB3esx5h23DnnVhZYfk0I=;
        b=Dtby69b6q3/TRktc/8pj/Tv2o8HqHWeuvPDbkRYiHnM1TMeNsUNw4JzC8NSGi4RgAR
         2gJihOephrb0uXPSw1Py6i8FyKoMpnTomcI88zuIl6Qgb2NjUs6SVJrr/7EXhtSeTJAe
         JoZ6dJAi+jgeRL/47hidfovaoEMyP28L3YxtBBqOWhGm3M04Ma5cxrF7JszjnOlrRLav
         W2UC97i5dGHk+514kdAiC0SjK+lpopuXTHLj5Jtv6Zxi7YiefozfFUsBEn1uRZPlen84
         Z6F8s7J61lVY7/tCoSZ2yyTj4P/QIYCW0Kz5mdFn5L0qta06K5Y4nSwok5P9hGmuK0sD
         PTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385702; x=1779990502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F0jUJYHm37yuKRA04SvTDMOB3esx5h23DnnVhZYfk0I=;
        b=GV0p9BX26dqG5Kd5rHaVPBCZgKSwXN2UmznZ+CE/yawLENFAzux+9IVRNwk5UhBjdq
         iXj1aMx9R2VQZZQO5yg9Zb8JlF0nqrU1uRIbOCMr42X4HMFZKBrWVB39dfpJRIYyMizF
         wspf+quH0ateWgyRVYk8uiZ63RBRRVCjk6GkSKjqL4wL4TZt9SKX7CF4IQU1Okg7RUc4
         O5iRdzRUGOjewUgHBYmBe5Hfzru5Xj1FzodELDEdQhKAdpDxQ50vkGQ1706EDsz48WNp
         lurOXl+EN+VQKWdSMaMMqEw2mSgcT4AJIMM5Xb9PRKkETrNe1bJSyqlIaI+0zMWdCFqw
         8p4A==
X-Gm-Message-State: AOJu0YxOEG50tEHTxAVwly0UjCP/3NPrw7gxNMVVtmKaf6n5e+CcBDCj
	K4N9KeeAX0KDFvXzUB15Oi+9GF4C5NJOUd3LDHUV8GX1ejdqCvZKJ5kqyF9gczoo
X-Gm-Gg: Acq92OEU+DQGVsNK+0YWJXnv37sEUQLCDg80k3MnM3TVtL+0RZ5J4lpPZqxuMMSlbKi
	Tro0qt6N8/m8xznMPHfDrSGzU8nBfIG+mKgXvRjXMD1+m/MOiEHT8gsdNRpzAHW3WNssqid5Run
	w6q47cawafWtLl2Dtkd8tc4kWHRH05Ee7z/0EY/O7L1NsyB55tW4tN28NF5o19oYeGWLUoI8bT1
	72keGEsp6gnOXwYR8PxIN4bgU8dXqcPrxdrpmfhIRl28bh172A6MFi/T8NQ1PPevahnt8w1D8HU
	8HwtVih5XZwHqb4VoEmauXCDsehv97YeMjSh245uqHJcOlYqF5e7VyWCX66TIjDAv2Cx4tstKjF
	pAnzlU34HVikvTnA8Pk6ZL+lbwoHzwf19VU9e9Oj/ZxLfEzHqEAX09dJACYN3Uad6oUryk0GooU
	T4/yvilT4p4RG4RP23pxQN+ILQfed+VB/SGRvh
X-Received: by 2002:a05:600c:3b1f:b0:490:f7c:b19 with SMTP id 5b1f17b1804b1-49035fcbd6bmr44775865e9.0.1779385702074;
        Thu, 21 May 2026 10:48:22 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v10 07/13] xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
Date: Thu, 21 May 2026 20:45:25 +0300
Message-ID: <0c0bf3551f32cfc15ae2006988d3324bdca59b18.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779385072.git.mykola_kvach@epam.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779385702-BF370DB1-AD20EAAE/0/0
X-purgate-type: clean
X-purgate-size: 3700
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 014615AA919
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


