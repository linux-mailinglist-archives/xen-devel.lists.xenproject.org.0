Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BD997ED74
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 16:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802116.1212292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskTP-0000Wi-VJ; Mon, 23 Sep 2024 14:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802116.1212292; Mon, 23 Sep 2024 14:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskTP-0000Tv-R1; Mon, 23 Sep 2024 14:55:35 +0000
Received: by outflank-mailman (input) for mailman id 802116;
 Mon, 23 Sep 2024 14:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfwC=QV=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sskTO-0008CV-1u
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 14:55:34 +0000
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [2607:f8b0:4864:20::a2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1e5f026-79bb-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 16:55:33 +0200 (CEST)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-501192e8e12so783705e0c.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 07:55:33 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-503d7e9ea08sm1784841e0c.31.2024.09.23.07.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 07:55:31 -0700 (PDT)
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
X-Inumbo-ID: e1e5f026-79bb-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727103332; x=1727708132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        b=c3zmEOxBUbhJ1weKwK+180TKxzIClliqO+M+JgiNoGh+4Qpa4MaM2l3kvhdONLqI++
         1NCvHm8fNrcuQO2AC33m3Du8jrNRpUI8F3qdVZIK01mbInrEPgd72jBzbwm+lZQ4Twqo
         Bw2WxWX6Z/RCUplYO/8bUxYM8mbdkBE4i3L/CbRkwe5Gj6JcVOqI6hGBWQV40TqY4LOk
         jjjnb68PKk/zKv0zHo4lraIVjyQJf459e7fEqXcOoMl1vjyQXqP6fXY9h96lb+G552Ix
         5g0L4HOHMNR7mvFr/ADLy7nQUnI7J31EXGWCOUnEgU5ZLn16o9YrydYUNZPwREXmLX73
         v7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727103332; x=1727708132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        b=eOf0S8jFj7GEyIbx7yIvkJ6LZz6puRzkXbhp/2V8a/jS0K9GYVpAx9IU3uJg7eI1xo
         +TLcMNdMuuUMOAOaUInurUgjDbn9Zu58MaWSi+43dDLr7DIsUZpzGo36TQ8Jmth3qcjb
         SWYa3ekCQX1aYlZfRUj9w3922Z0GbRndNGHQGWsEF9OqREpEL/F84NTEvXulJgjBfHKj
         6Yi+4OAgGSCc/YHgUifq1HveBeY+vGpBcO2YNxh4YAwLUif49XAJsLBWo1gpdxTduW75
         W3Z1QGVvApAWjQnUgRQHs2IGCXtknORdP0SO83QtbQoXwotUx/ODCn1X3eqmfUzM4QA5
         g79w==
X-Forwarded-Encrypted: i=1; AJvYcCWSWeWAlYMwoxEi49aR2QJD4JzOK52aMe0ihDfF5XpF7QCvEUwZTuLit9Q2Om1UPgTMJ3hnkJY3wwE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSkAqk2A7f5SimRCVRXP0ZgQPCmT9+H0wgEt032qiRpO0Rgz4C
	O0BGmGoNRbmyFNjiKsCfOYtfvmI2n/ZnKHtS0C+TPsUydXSwRG5C
X-Google-Smtp-Source: AGHT+IG6dbA1Qoykmc5DxVHIT6I9aGC0+8n371MVri28ok0pj3/lLGZ93yQkgFm3m0GB4zJqdCuIOQ==
X-Received: by 2002:a05:6122:3c91:b0:4f6:e87d:5160 with SMTP id 71dfb90a1353d-503e04cc2ffmr6905503e0c.9.1727103332294;
        Mon, 23 Sep 2024 07:55:32 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 4/4] hw/arm: xenpvh: Enable PCI for ARM PVH
Date: Mon, 23 Sep 2024 16:55:20 +0200
Message-ID: <20240923145520.1323504-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
References: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Enable PCI support for the ARM Xen PVH machine.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen-pvh.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 28af3910ea..33f0dd5982 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -39,6 +39,16 @@ static void xen_arm_instance_init(Object *obj)
                                          VIRTIO_MMIO_DEV_SIZE };
 }
 
+static void xen_pvh_set_pci_intx_irq(void *opaque, int intx_irq, int level)
+{
+    XenPVHMachineState *s = XEN_PVH_MACHINE(opaque);
+    int irq = s->cfg.pci_intx_irq_base + intx_irq;
+
+    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
+        error_report("xendevicemodel_set_pci_intx_level failed");
+    }
+}
+
 static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
     XenPVHMachineClass *xpc = XEN_PVH_MACHINE_CLASS(oc);
@@ -69,7 +79,11 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
     /* Xen/ARM does not use buffered IOREQs.  */
     xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
 
+    /* PCI INTX delivery.  */
+    xpc->set_pci_intx_irq = xen_pvh_set_pci_intx_irq;
+
     /* List of supported features known to work on PVH ARM.  */
+    xpc->has_pci = true;
     xpc->has_tpm = true;
     xpc->has_virtio_mmio = true;
 
-- 
2.43.0


