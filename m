Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46021BC3D8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:36:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSHv-0005u3-SQ; Tue, 28 Apr 2020 15:36:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fewl=6M=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1jTSHu-0005tq-FZ
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:36:46 +0000
X-Inumbo-ID: 1100b97c-8966-11ea-9885-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1100b97c-8966-11ea-9885-12813bfff9fa;
 Tue, 28 Apr 2020 15:36:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d17so25188504wrg.11
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 08:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gDQQvbPT3Kzf63XvecjBNGYEsk2bb2xd9NhLfULiqJg=;
 b=cjSlJUoKTogoeoKOW04Xhg+PRZJQ5mO37o+gijfepUxYBzE3B+xIgh6rT21B9t76dc
 mmNIW+BFNWpbZQpUFpSiIg3K1x3wdLDjzV7qdi0QqCUl3yHjZhVg2tMuErdTq3DGZhWa
 v+wmV3NMdSRqtnV8r3CS5HbncQG+DqxMbV/X9kipObBUx+HhlvK9xzojdoj+Kvs/avfr
 rPgf+NYh5hwJupm8gYBXVaV7x8vDi0Vp6OKcGLPmLeoPLNwAwwyU6uSmSsEo2Pc6C5Gv
 wB4HKZ2c0JdpvDQUW7RIunSGWp/zyIlfR/xLHf5p2x62wlaKkPeKB6OWVrun0ITS87yc
 hurQ==
X-Gm-Message-State: AGi0PuYHrrQ8qsDnJp7/hP6mnvCx2zJrJJ1+GRTXwRxjqZ1qmEvODWqI
 n2qzNRDNudQWALLM22Hi7uY=
X-Google-Smtp-Source: APiQypIOusuwAcr33CB5Ldy0/gal7sLr8hHFrxFgnuMNsSelBzKOp9T5ByiX4HEIJfDkRsL82eG/gw==
X-Received: by 2002:adf:84c2:: with SMTP id 60mr33197060wrg.65.1588088204974; 
 Tue, 28 Apr 2020 08:36:44 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w12sm25355384wrk.56.2020.04.28.08.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:36:43 -0700 (PDT)
From: Wei Liu <wei.liu@kernel.org>
To: linux-pci@vger.kernel.org,
 Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/xen: drop an unused parameter gsi_override
Date: Tue, 28 Apr 2020 15:36:40 +0000
Message-Id: <20200428153640.76476-1-wei.liu@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 sstabellini@kernel.org, konrad.wilk@oracle.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

All callers within the same file pass in -1 (no override).

Signed-off-by: Wei Liu <wei.liu@kernel.org>
---
 arch/x86/pci/xen.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 91220cc25854..e3f1ca316068 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -60,8 +60,7 @@ static int xen_pcifront_enable_irq(struct pci_dev *dev)
 }
 
 #ifdef CONFIG_ACPI
-static int xen_register_pirq(u32 gsi, int gsi_override, int triggering,
-			     bool set_pirq)
+static int xen_register_pirq(u32 gsi, int triggering, bool set_pirq)
 {
 	int rc, pirq = -1, irq = -1;
 	struct physdev_map_pirq map_irq;
@@ -94,9 +93,6 @@ static int xen_register_pirq(u32 gsi, int gsi_override, int triggering,
 		name = "ioapic-level";
 	}
 
-	if (gsi_override >= 0)
-		gsi = gsi_override;
-
 	irq = xen_bind_pirq_gsi_to_irq(gsi, map_irq.pirq, shareable, name);
 	if (irq < 0)
 		goto out;
@@ -112,12 +108,12 @@ static int acpi_register_gsi_xen_hvm(struct device *dev, u32 gsi,
 	if (!xen_hvm_domain())
 		return -1;
 
-	return xen_register_pirq(gsi, -1 /* no GSI override */, trigger,
+	return xen_register_pirq(gsi, trigger,
 				 false /* no mapping of GSI to PIRQ */);
 }
 
 #ifdef CONFIG_XEN_DOM0
-static int xen_register_gsi(u32 gsi, int gsi_override, int triggering, int polarity)
+static int xen_register_gsi(u32 gsi, int triggering, int polarity)
 {
 	int rc, irq;
 	struct physdev_setup_gsi setup_gsi;
@@ -128,7 +124,7 @@ static int xen_register_gsi(u32 gsi, int gsi_override, int triggering, int polar
 	printk(KERN_DEBUG "xen: registering gsi %u triggering %d polarity %d\n",
 			gsi, triggering, polarity);
 
-	irq = xen_register_pirq(gsi, gsi_override, triggering, true);
+	irq = xen_register_pirq(gsi, triggering, true);
 
 	setup_gsi.gsi = gsi;
 	setup_gsi.triggering = (triggering == ACPI_EDGE_SENSITIVE ? 0 : 1);
@@ -148,7 +144,7 @@ static int xen_register_gsi(u32 gsi, int gsi_override, int triggering, int polar
 static int acpi_register_gsi_xen(struct device *dev, u32 gsi,
 				 int trigger, int polarity)
 {
-	return xen_register_gsi(gsi, -1 /* no GSI override */, trigger, polarity);
+	return xen_register_gsi(gsi, trigger, polarity);
 }
 #endif
 #endif
@@ -491,7 +487,7 @@ int __init pci_xen_initial_domain(void)
 		if (acpi_get_override_irq(irq, &trigger, &polarity) == -1)
 			continue;
 
-		xen_register_pirq(irq, -1 /* no GSI override */,
+		xen_register_pirq(irq,
 			trigger ? ACPI_LEVEL_SENSITIVE : ACPI_EDGE_SENSITIVE,
 			true /* Map GSI to PIRQ */);
 	}
-- 
2.20.1


