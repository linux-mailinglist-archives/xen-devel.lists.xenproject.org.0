Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957DF97A4D6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 17:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799583.1209590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLl-0006ox-JS; Mon, 16 Sep 2024 15:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799583.1209590; Mon, 16 Sep 2024 15:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLl-0006lq-FK; Mon, 16 Sep 2024 15:09:13 +0000
Received: by outflank-mailman (input) for mailman id 799583;
 Mon, 16 Sep 2024 15:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVXs=QO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sqDLj-0006Jf-FO
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 15:09:11 +0000
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [2607:f8b0:4864:20::d2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0340fe5-743d-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 17:09:10 +0200 (CEST)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-82cec47242eso171179139f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 08:09:10 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e9005csm16897935ab.79.2024.09.16.08.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:09:08 -0700 (PDT)
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
X-Inumbo-ID: a0340fe5-743d-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726499349; x=1727104149; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIDS2BgSDN2sYeAiwQv8u9Oegpn8pHfzCYrmX62ewXA=;
        b=FzzBG2cAeI9OVS6ZfKSdMHbMb8qs2lb4Uzm/bb6rZEpRoGtFJI+8dnPeGGKq46FKaL
         DrTD9uGwtvoTasRRKsJNe1oIwq+WRJTj3nZVUHdapH1SMHWNWQxqV3sZ8l0MKPIemOKb
         bjT8oZm4a1Xazg2Dk5KY4VsdKjgJpYQSyt4D+Dg2rzdm7K+HjxnRbweZyQRBhFqtYlFW
         hMsfaJivzSPvkXrWav8F+f2KANJ7AOVzqa8B0aekYnwZUUpM+pg8G1uH28ofACLeL0Jd
         qEHvZU5akdQXwDrUn9K9p0zui0b7an2PdMIQ5m58WA5FLWo907zfuYEEZ7jgCX8FPBYt
         tRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726499349; x=1727104149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIDS2BgSDN2sYeAiwQv8u9Oegpn8pHfzCYrmX62ewXA=;
        b=FmvFo+LilFldcF7C/MJlPggb9By+avz2HYZAbII2w8ceylCPyX2xb+dwJHCfhmaoOG
         pGOishA+8J07A72cGGRT9xtsNnOjxigklpoi6YlUxvZdA1hcaH4T5Ompo/7C25/k6rh8
         GXT1VEVzWAoPZQNY6fhExhUtXJ+FK11jVN1cT14xCqojBaJ1jHMfVlDVm3witT8qv+15
         nxRs50AjXoaOCEmcU3Nxu6d4gKKP3S+Wt0IUjX4KNUtFvksAUWi4qTaHU8dZGNnppA1G
         RdA7PCGKjTunYS16BhP0X2ckMOiimbaLohCmsrLHMF3sunRkRfyQMNyNE7a/UYW7hNBc
         p+jA==
X-Forwarded-Encrypted: i=1; AJvYcCVY5MUGU+9LXTiqJ6T7SMcfu/54lqqdT0bLI6g4F9xAxC26QHnEuexWNFuYf7/UkGzofUWPrgDNz0A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUmX9bm2h6S69FLcSKax0dtzqQon+8AW61InWJwz9nqJ/45i67
	UHo9i9PiEtlvh/GDBrmbnq2ZqAHasF7vPwba+EKE5t5F2s9emmvC
X-Google-Smtp-Source: AGHT+IE86ZuS/7NQzNvR5tLVOdqaKbQKcpupAoW/xUcVW9ix1XY+RyPuORlI+lKWYit0Zg+iCQOwZg==
X-Received: by 2002:a05:6e02:12c5:b0:39f:325f:78e6 with SMTP id e9e14a558f8ab-3a0845a0d55mr130717185ab.0.1726499349478;
        Mon, 16 Sep 2024 08:09:09 -0700 (PDT)
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
Subject: [PATCH v1 4/4] hw/arm: xenpvh: Enable PCI for ARM PVH
Date: Mon, 16 Sep 2024 17:08:52 +0200
Message-ID: <20240916150853.1216703-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Enable PCI support for the ARM Xen PVH machine.

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


