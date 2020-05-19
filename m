Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BDF1D99C0
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 16:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb3H1-0003fB-Hp; Tue, 19 May 2020 14:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jb3H0-0003f4-68
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 14:31:14 +0000
X-Inumbo-ID: 63b1812e-99dd-11ea-b9cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63b1812e-99dd-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 14:31:13 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CmRLdw6LI7GbmUBiN8Dk3dr+z8cZBmJRvieC/1Iylk3BPxEU3SgNwAHcpTcJzXLbGOqrbm8TWC
 15mQPDS2nlav+b5ExdiiPjOUHjTYKE6G5niJ6uI4t7/lkFVAkXlT0X8WmqV3r/Rvh5hPxAeNm4
 p2w0rKmhWkL3zVhDxRswNWqGNkFWJEuau6eW2pTMLI5x84vE1Djo/0R+GKhihf5tMptLEzmbht
 MpO5QkZjry+eDaJZY7wOqTTinQkNdM0rozNXzYhreS0zJFOHUBqdP5cARl2l1PO996SOrG8FPj
 Af4=
X-SBRS: 2.7
X-MesageID: 18167038
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18167038"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] xen: fix build without pci passthrough
Date: Tue, 19 May 2020 16:31:01 +0200
Message-ID: <20200519143101.75330-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

has_igd_gfx_passthru is only available when QEMU is built with
CONFIG_XEN_PCI_PASSTHROUGH, and hence shouldn't be used in common
code without checking if it's available.

Fixes: 46472d82322d0 ('xen: convert "-machine igd-passthru" to an accelerator property')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org
---
Changes since v1:
 - Do not include osdep in header file.
 - Always add the setters/getters of igd-passthru, report an error
   when attempting to set igd-passthru without built in
   pci-passthrough support.
---
 hw/xen/xen-common.c | 4 ++++
 hw/xen/xen_pt.h     | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
index 70564cc952..d758770da0 100644
--- a/hw/xen/xen-common.c
+++ b/hw/xen/xen-common.c
@@ -134,7 +134,11 @@ static bool xen_get_igd_gfx_passthru(Object *obj, Error **errp)
 
 static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
 {
+#ifdef CONFIG_XEN_PCI_PASSTHROUGH
     has_igd_gfx_passthru = value;
+#else
+    error_setg(errp, "Xen PCI passthrough support not built in");
+#endif
 }
 
 static void xen_setup_post(MachineState *ms, AccelState *accel)
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 179775db7b..7430235a27 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -322,7 +322,13 @@ extern void *pci_assign_dev_load_option_rom(PCIDevice *dev,
                                             unsigned int domain,
                                             unsigned int bus, unsigned int slot,
                                             unsigned int function);
+
+#ifdef CONFIG_XEN_PCI_PASSTHROUGH
 extern bool has_igd_gfx_passthru;
+#else
+# define has_igd_gfx_passthru false
+#endif
+
 static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
 {
     return (has_igd_gfx_passthru
-- 
2.26.2


