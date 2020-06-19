Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F01200660
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 12:32:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmEJE-0000qd-1N; Fri, 19 Jun 2020 10:31:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zs6k=AA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jmEJD-0000qY-C5
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 10:31:43 +0000
X-Inumbo-ID: 1086eb9e-b218-11ea-bb60-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1086eb9e-b218-11ea-bb60-12813bfff9fa;
 Fri, 19 Jun 2020 10:31:42 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fYsZu61/2ZYIqvY2si0AkUINxkWzpin0GRMWoIaFvWIqTj+jIEhBt+O/jzhO6fCY7ZlKmnFqDJ
 uRS9Qq+n7TV99RcpIur2A50qlKP9ZaAuzNPfFL7D8ln3WHsK/IQMa2RU5ud+OV3lSpCT2QZYz/
 3zYWPRpBprx4QGm7TElREiVJ03itvX2G0RB0euKtADDDubWQLfDDXT8vIWICnuc2yNkRjjUPuY
 p5NvJCg5T4OzApEaCdCYke2l4NauscZN+2YTGvy875mSFT9TTm0dB4JapeinR+FMqWmkzzJfV8
 4Og=
X-SBRS: 2.7
X-MesageID: 20756471
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="20756471"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] xen: Actually fix build without passthrough
Date: Fri, 19 Jun 2020 11:31:15 +0100
Message-ID: <20200619103115.254127-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix typo.

Fixes: acd0c9416d48 ("xen: fix build without pci passthrough")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/xen/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
index 3fc715e5954d..502b32d877a0 100644
--- a/hw/xen/Makefile.objs
+++ b/hw/xen/Makefile.objs
@@ -4,4 +4,4 @@ common-obj-y += xen-legacy-backend.o xen_devconfig.o xen_pvdev.o xen-bus.o xen-b
 obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen-host-pci-device.o
 obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_graphics.o xen_pt_msi.o
 obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt_load_rom.o
-obj-$(call $(lnot, $(CONFIG_XEN_PCI_PASSTHROUGH))) += xen_pt_stub.o
+obj-$(call lnot,$(CONFIG_XEN_PCI_PASSTHROUGH)) += xen_pt_stub.o
-- 
Anthony PERARD


