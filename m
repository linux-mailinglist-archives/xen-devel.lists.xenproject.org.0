Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9576A853B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505061.777699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxX-0004aQ-EX; Thu, 02 Mar 2023 15:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505061.777699; Thu, 02 Mar 2023 15:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxW-0004QJ-G7; Thu, 02 Mar 2023 15:35:06 +0000
Received: by outflank-mailman (input) for mailman id 505061;
 Thu, 02 Mar 2023 15:34:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxO-0001Jw-My
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:58 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4444851-b90f-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx5-00FL3u-0c; Thu, 02 Mar 2023 15:34:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx5-004uzz-0H; Thu, 02 Mar 2023 15:34:39 +0000
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
X-Inumbo-ID: c4444851-b90f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=T2ES46G+W4wfRtbGgYULh0xnoiw027E1Epehblpp/UU=; b=Q6PRP+Ok4Y/LWFg5GT2Lo6owKb
	6PzF3X/WY+wW19Qd6c5e2Ldj/TWoSmau5OeSFhd7wqiP14jiannTxtt4NsAXCNdD8DEQ2Q4vjt77f
	c1C7dV9Inqty2v6QOkHysCYsI8AoxZcPBSMIwPhZe13LBja6uDKcNlJpjq3lqQom9f29rGMQY5aBb
	aqwxKMzs4Z15CTvBJmfZWP9bJkeJecSW+v0Ou5CXvmaRMfdChC/4WPTs4/ZQDesOVK+L1NAezIqyO
	lCziKQDGt0ar2rUjdRS4MZstN/4FWKHH/BXG61f9T4ujzOCpzjHTD6q3SQMU89n8J8GEDM7cn6ePo
	I7hERoTw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 25/25] i386/xen: Initialize Xen backends from pc_basic_device_init() for emulation
Date: Thu,  2 Mar 2023 15:34:35 +0000
Message-Id: <20230302153435.1170111-26-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Now that all the work is done to enable the PV backends to work without
actual Xen, instantiate the bus from pc_basic_device_init() for emulated
mode.

This allows us finally to launch an emulated Xen guest with PV disk.

   qemu-system-x86_64 -serial mon:stdio -M q35 -cpu host -display none \
     -m 1G -smp 2 -accel kvm,xen-version=0x4000a,kernel-irqchip=split \
     -kernel bzImage -append "console=ttyS0 root=/dev/xvda1" \
     -drive file=/var/lib/libvirt/images/fedora28.qcow2,if=none,id=disk \
     -device xen-disk,drive=disk,vdev=xvda

If we use -M pc instead of q35, we can even add an IDE disk and boot a
guest image normally through grub. But q35 gives us AHCI and that isn't
unplugged by the Xen magic, so the guests ends up seeing "both" disks.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/pc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fd17ce7a94..3fe028c86c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -102,6 +102,11 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+#ifdef CONFIG_XEN_EMU
+#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen-bus.h"
+#endif
+
 /*
  * Helper for setting model-id for CPU models that changed model-id
  * depending on QEMU versions up to QEMU 2.4.
@@ -1318,6 +1323,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         if (pcms->bus) {
             pci_create_simple(pcms->bus, -1, "xen-platform");
         }
+        xen_bus_init();
+        xen_be_init();
     }
 #endif
 
-- 
2.39.0


