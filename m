Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5EC7CFE3F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619416.964457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8p-0007QY-7z; Thu, 19 Oct 2023 15:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619416.964457; Thu, 19 Oct 2023 15:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8o-0007IV-TC; Thu, 19 Oct 2023 15:40:54 +0000
Received: by outflank-mailman (input) for mailman id 619416;
 Thu, 19 Oct 2023 15:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Lg=GB=casper.srs.infradead.org=BATV+06ae5fa416ae820d9d5a+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8n-0006dc-CN
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:40:53 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df1c7b92-6e95-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 17:40:48 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qtV8N-007osy-KY; Thu, 19 Oct 2023 15:40:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8N-000Pv1-0W; Thu, 19 Oct 2023 16:40:27 +0100
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
X-Inumbo-ID: df1c7b92-6e95-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6eB6ZTu6F2pRboHgvVTkcuf9JVHV2C3gx4pFbRpACpA=; b=v3tBGDFXA8XlwBj+VDbGUIikdR
	YvZpeBmMRPn8PIScM+B62OOMnMNtlSRN9f488qg8iDo/npxFjE9lU/InslkYOKIpIezyq7k5YPht8
	KshD2GVes/NkKgdIE9mBX3DoO/h/1f/BltQmn9++W+k582NPRu/KDohIJ+xJUbrCCpNeh7OmYonmv
	2cpOPnmtC8QmUyaYA1AqWbn00FbvvzyWCSHWECn+Kwto5av9TPVZDFDGUO8hrhrm7fgZu+RFJQIbD
	0b3BHphf2n2QuCHfcCuhuYYCoHB6Py8PkZcdR60uEMR0fVlYJgcjv5cOklq/bXCI7SpEmT/YVNp5B
	qiOyOYkQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v2 20/24] hw/xenpv: fix '-nic' support for xen-net-device
Date: Thu, 19 Oct 2023 16:40:16 +0100
Message-Id: <20231019154020.99080-21-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

I can't see how this has ever worked. If I start with the simple attempt
"-nic user,model=xen", it creates a device with index -1 because it's
assuming that it'll be attached to a hubport. So it creates a frontend
at e.g. "/local/domain/84/device/vif/-1" and the guest fails to connect.

If I jump through hoops to give it a configuration that it might like:
    -netdev user,id=usernic
    -netdev hubport,hubid=0,id=hub0,netdev=usernic
    -nic,hubport,hubid=0,model=xen
... it *still* doesn't work. Qemu does actually use a slightly more
sensible index in the XenStore frontend path now, and the guest does
manage to connect to it. But on the Qemu side, the NIC still isn't
actually *attached* to the netdev:

qemu-system-x86_64: warning: hub port #net036 has no peer
qemu-system-x86_64: warning: hub 0 with no nics
qemu-system-x86_64: warning: netdev #net036 has no peer
qemu-system-x86_64: warning: requested NIC (anonymous, model xen) was not created (not supported by this machine?)

I can't see any point in the git history where the xen-nic driver
would actually look at that "handle" property, find the right netdev,
and actually *attach* the emulated NIC to anything.

Just rip out the special XenStore magic and instantiate a xen-net-device
on the XenBus. It all works now. Accept "model=xen-net-device" because
that's the actual Qemu device name and that's what works on HVM & emu.
Also accept model==NULL because why in $DEITY's name was that excluded
before anyway? What else are we doing to do for *PV* guests?

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen_devconfig.c              | 28 ++++++----------------------
 hw/xenpv/xen_machine_pv.c           | 13 ++++++++-----
 include/hw/xen/xen-legacy-backend.h |  2 +-
 3 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
index 3f77c675c6..d72bac38e7 100644
--- a/hw/xen/xen_devconfig.c
+++ b/hw/xen/xen_devconfig.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "qemu/option.h"
 #include "sysemu/blockdev.h"
@@ -46,29 +47,12 @@ static int xen_config_dev_all(char *fe, char *be)
 
 /* ------------------------------------------------------------- */
 
-int xen_config_dev_nic(NICInfo *nic)
+int xen_config_dev_nic(BusState *xen_bus, NICInfo *nic)
 {
-    char fe[256], be[256];
-    char mac[20];
-    int vlan_id = -1;
-
-    net_hub_id_for_client(nic->netdev, &vlan_id);
-    snprintf(mac, sizeof(mac), "%02x:%02x:%02x:%02x:%02x:%02x",
-             nic->macaddr.a[0], nic->macaddr.a[1], nic->macaddr.a[2],
-             nic->macaddr.a[3], nic->macaddr.a[4], nic->macaddr.a[5]);
-    xen_pv_printf(NULL, 1, "config nic %d: mac=\"%s\"\n", vlan_id, mac);
-    xen_config_dev_dirs("vif", "qnic", vlan_id, fe, be, sizeof(fe));
-
-    /* frontend */
-    xenstore_write_int(fe, "handle",     vlan_id);
-    xenstore_write_str(fe, "mac",        mac);
-
-    /* backend */
-    xenstore_write_int(be, "handle",     vlan_id);
-    xenstore_write_str(be, "mac",        mac);
-
-    /* common stuff */
-    return xen_config_dev_all(fe, be);
+    DeviceState *dev = qdev_new("xen-net-device");
+    qdev_set_nic_properties(dev, nic);
+    qdev_realize_and_unref(dev, xen_bus, &error_fatal);
+    return 0;
 }
 
 int xen_config_dev_vfb(int vdev, const char *type)
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 9f9f137f99..3d3a87e416 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -32,6 +32,7 @@
 
 static void xen_init_pv(MachineState *machine)
 {
+    BusState *xen_bus;
     int i;
 
     setup_xen_backend_ops();
@@ -62,15 +63,17 @@ static void xen_init_pv(MachineState *machine)
         vga_interface_created = true;
     }
 
+    xen_bus = xen_bus_init();
+
     /* configure nics */
     for (i = 0; i < nb_nics; i++) {
-        if (!nd_table[i].model || 0 != strcmp(nd_table[i].model, "xen"))
-            continue;
-        xen_config_dev_nic(nd_table + i);
+        if (!nd_table[i].model ||
+            g_str_equal(nd_table[i].model, "xen") ||
+            g_str_equal(nd_table[i].model, "xen-net-device")) {
+                xen_config_dev_nic(xen_bus, nd_table + i);
+            }
     }
 
-    xen_bus_init();
-
     /* config cleanup hook */
     atexit(xen_config_cleanup);
 }
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index fc42146bc2..01cab3a35e 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -81,7 +81,7 @@ extern struct XenDevOps xen_usb_ops;          /* xen-usb.c         */
 
 /* configuration (aka xenbus setup) */
 void xen_config_cleanup(void);
-int xen_config_dev_nic(NICInfo *nic);
+int xen_config_dev_nic(BusState *xen_bus, NICInfo *nic);
 int xen_config_dev_vfb(int vdev, const char *type);
 int xen_config_dev_vkbd(int vdev);
 int xen_config_dev_console(int vdev);
-- 
2.40.1


