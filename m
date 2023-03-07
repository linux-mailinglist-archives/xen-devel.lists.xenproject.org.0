Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A46AF00E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 19:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507788.781885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc29-0005RE-Rw; Tue, 07 Mar 2023 18:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507788.781885; Tue, 07 Mar 2023 18:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc28-0005Dy-PN; Tue, 07 Mar 2023 18:27:32 +0000
Received: by outflank-mailman (input) for mailman id 507788;
 Tue, 07 Mar 2023 18:27:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tG96=67=desiato.srs.infradead.org=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZc22-0002M9-V9
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 18:27:26 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b283b266-bd15-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 19:27:20 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZc1o-00H8TO-0z; Tue, 07 Mar 2023 18:27:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1o-009e9z-0d; Tue, 07 Mar 2023 18:27:12 +0000
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
X-Inumbo-ID: b283b266-bd15-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4BkL9NyCgm8G9JQUlKfpShNc/FIh4cWQeRocuey9tU8=; b=RIvuthfM3LePc4AF2k/q1ZUhW4
	5zwFziqjGtLVihO9L4u9rNjPMbkQDVU/Jh9Li3talXnatPaKfOdniUGtk2u68q+aTaLeEJcCSAe9V
	6Q9UFxPrF22tFeva9qdYiUWtbwJaBpAMhH5/K2+SW9Ir7AiR06Xds4AitMTCZ+xE7GuZV4fq18zuc
	eW6cw2GL4nJHNOoWioOUBIN3yPyjMKzA98MGZjSUgwWjmlgdRRGG9v3hIX1a2cAsZp4ertYzy715E
	x701p1GokKdWOW3TIIwX9GGYmhuSTuUGS9e6VD4ZDtP82gOyWFuuKDxsf3sBPUxvxFCYsK+BCtbpy
	AKikh7pg==;
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 25/27] i386/xen: Initialize Xen backends from pc_basic_device_init() for emulation
Date: Tue,  7 Mar 2023 18:27:05 +0000
Message-Id: <20230307182707.2298618-26-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/pc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7bebea57e3..1489abf010 100644
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


