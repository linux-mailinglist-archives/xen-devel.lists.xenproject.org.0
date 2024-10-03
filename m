Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43398F6A8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809822.1222398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0m-0000aC-F1; Thu, 03 Oct 2024 18:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809822.1222398; Thu, 03 Oct 2024 18:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0m-0000Wb-AR; Thu, 03 Oct 2024 18:57:16 +0000
Received: by outflank-mailman (input) for mailman id 809822;
 Thu, 03 Oct 2024 18:57:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swR0k-00082k-As
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 18:57:14 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4caddc82-81b9-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 20:57:12 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fac63abf63so15451941fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 11:57:12 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecc13b2asm2706361fa.69.2024.10.03.11.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:57:11 -0700 (PDT)
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
X-Inumbo-ID: 4caddc82-81b9-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727981832; x=1728586632; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        b=IFY7a/FyJzyfhvjgBBfsOp7pEBH5rtEGckImg9AlxNXtFefHzVpaop6sMdoudzwdCr
         orq8hPfEvEBJ+QY6acH7bTCjo+LZo4N5Uc5zKv8l19gmy7Tc8x0smLo3c74J3Fp2JhWc
         etpgNdAEOuK2WiSrbY/g4qjAiVN0lRuLKyUz68S2VeC2j0Dkm3B82bRk5x74tr+kk2JF
         cAi/QCCIz/bUrhlvBIcEtJ4q7pTuPasw7VrgxlXPqKOYMw8kNNl0Ka9jQrRmy56dKUx4
         EwRTNk3CSnGzS0iB800Dc+lS2qUnMNAjvEv81PABPIuy+w428vdzCXkx744lEPGcCFCa
         O+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981832; x=1728586632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        b=JY/e9MeX4AHi5K7qlDRquLyZmtIaPATuvZ3ND/FK7FgpG4KyLMrFwJRX9chQOxwORR
         P/XtQaFKY5Z6q0ouezVpXyfPlrF34NfE6eRcLVWJcxVfe0aCqRCIysmIsv01iYab3De0
         /cdWXNNdKL3DlT+aQBu/eIo+9C2hCpXsm+JRfjmZj/2Bgw6wzRwDd/guLzglUJvoBGci
         ZA8odQ6ywG7c7Rg/RTkAbwOV/aMluzg4KarWbgEfOyQizW+M3bhvOHIiHeQJgV7k2PXM
         WgSiOfOx1y0ot2zWFagtcI+A7RAFi1Vo9nfx2HGghD8ZKeBtV6FMolvnD8nBAC5sIzA0
         ywQw==
X-Forwarded-Encrypted: i=1; AJvYcCVfL0v6Y6Op8yMAhIwnye27fLalZ6jLb055ji7sslPbX+oQrDP1mZyESJxLZafDt3oz8q2TLXUdRhg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFjinsyRgngQFIpvQTmNzPw3FZUczwIAWAQajGOe20sG5YgQsa
	Qaad8BtYaupaLf8PX8+D4b8Q3mp/ynrDL1roaSdauPOVPiTSnZyP
X-Google-Smtp-Source: AGHT+IGdtsrhdXwp14pMpvdvc+CdpPcIPMIZgK2C81T/sez5hURdlMZpHD5usN8FxM0Nz2NV9uyp/Q==
X-Received: by 2002:a2e:be20:0:b0:2f5:2ba:2c99 with SMTP id 38308e7fff4ca-2faf3c1400cmr307781fa.9.1727981832153;
        Thu, 03 Oct 2024 11:57:12 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PULL v2 5/5] hw/arm: xenpvh: Enable PCI for ARM PVH
Date: Thu,  3 Oct 2024 20:56:54 +0200
Message-ID: <20241003185655.1480819-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
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


