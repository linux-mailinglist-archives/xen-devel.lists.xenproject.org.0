Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D47CCA97
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 20:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618332.961875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsoll-00066P-S4; Tue, 17 Oct 2023 18:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618332.961875; Tue, 17 Oct 2023 18:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsoll-00062u-NG; Tue, 17 Oct 2023 18:26:17 +0000
Received: by outflank-mailman (input) for mailman id 618332;
 Tue, 17 Oct 2023 18:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qm1H=F7=casper.srs.infradead.org=BATV+e442e50539a6073fd887+7359+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsolk-0005jg-Ax
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 18:26:16 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6a400c9-6d1a-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 20:26:13 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qsolL-00DrCp-On; Tue, 17 Oct 2023 18:25:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsolI-000Pao-2A; Tue, 17 Oct 2023 19:25:48 +0100
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
X-Inumbo-ID: a6a400c9-6d1a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=soewF1VEeC4Dlpkzvr2uXeIIPaScop4Mpb2XJvzItmY=; b=RkSR5Y5Ot3jJe1d4Q4FDdzIghn
	QI1NxIjMQyDz+f1OQpK27yB8HhfPT73C9TmxaFKMrAaodavvk2DeQYyT+z6zpFERv3aTi5OzxogQN
	Ri+bizOAO1LUuNW2k4tI7WfFDQQCNUJoSom9xBE86kI6yIk1lSxuRVCCXTlIYz5nzNTJfzTBllI4b
	qV/0Wn+6tYmcJ4OgNadm6bg76PsSMOnrDUyrjjcc+UQTdP7wYO26RkOc8Js83mUmGu041vzPhX2M8
	taWrsG/UUW5EU18fzdQHVmlV3+3lVA/LfbrWYdz94JanMSEkdDXntw7PopN+qW/4pJyLSx1++kO1N
	8w9ZXHfw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jason Wang <jasowang@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/4] hw/xen: update Xen PV NIC to XenDevice model
Date: Tue, 17 Oct 2023 19:25:43 +0100
Message-Id: <20231017182545.97973-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017182545.97973-1-dwmw2@infradead.org>
References: <20231017182545.97973-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/net/meson.build        |   2 +-
 hw/net/trace-events       |   9 +
 hw/net/xen_nic.c          | 426 +++++++++++++++++++++++++++++---------
 hw/xenpv/xen_machine_pv.c |   1 -
 4 files changed, 342 insertions(+), 96 deletions(-)

diff --git a/hw/net/meson.build b/hw/net/meson.build
index 2632634df3..f64651c467 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -1,5 +1,5 @@
 system_ss.add(when: 'CONFIG_DP8393X', if_true: files('dp8393x.c'))
-system_ss.add(when: 'CONFIG_XEN', if_true: files('xen_nic.c'))
+system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen_nic.c'))
 system_ss.add(when: 'CONFIG_NE2000_COMMON', if_true: files('ne2000.c'))
 
 # PCI network cards
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 3abfd65e5b..ee56acfbce 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -482,3 +482,12 @@ dp8393x_receive_oversize(int size) "oversize packet, pkt_size is %d"
 dp8393x_receive_not_netcard(void) "packet not for netcard"
 dp8393x_receive_packet(int crba) "Receive packet at 0x%"PRIx32
 dp8393x_receive_write_status(int crba) "Write status at 0x%"PRIx32
+
+# xen_nic.c
+xen_netdev_realize(int idx, const char *info) "idx %u info '%s'"
+xen_netdev_unrealize(int idx) "idx %u"
+xen_netdev_create(int idx) "idx %u"
+xen_netdev_destroy(int idx) "idx %u"
+xen_netdev_disconnect(int idx) "idx %u"
+xen_netdev_connect(int idx, unsigned int tx, unsigned int rx, int port) "idx %u tx %u rx %u port %u"
+xen_netdev_frontend_changed(const char *idx, int state) "idx %s state %d"
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 9bbf6599fc..84914c329c 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -20,6 +20,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/qemu-print.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/error.h"
+
 #include <sys/socket.h>
 #include <sys/ioctl.h>
 #include <sys/wait.h>
@@ -27,18 +32,26 @@
 #include "net/net.h"
 #include "net/checksum.h"
 #include "net/util.h"
-#include "hw/xen/xen-legacy-backend.h"
+
+#include "hw/xen/xen-backend.h"
+#include "hw/xen/xen-bus-helper.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 
 #include "hw/xen/interface/io/netif.h"
+#include "hw/xen/interface/io/xs_wire.h"
+
+#include "trace.h"
 
 /* ------------------------------------------------------------- */
 
 struct XenNetDev {
-    struct XenLegacyDevice      xendev;  /* must be first */
-    char                  *mac;
+    struct XenDevice      xendev;  /* must be first */
+    XenEventChannel       *event_channel;
+    int                   dev;
     int                   tx_work;
-    int                   tx_ring_ref;
-    int                   rx_ring_ref;
+    unsigned int          tx_ring_ref;
+    unsigned int          rx_ring_ref;
     struct netif_tx_sring *txs;
     struct netif_rx_sring *rxs;
     netif_tx_back_ring_t  tx_ring;
@@ -47,6 +60,13 @@ struct XenNetDev {
     NICState              *nic;
 };
 
+typedef struct XenNetDev XenNetDev;
+
+#define TYPE_XEN_NET_DEVICE "xen-net-device"
+OBJECT_DECLARE_SIMPLE_TYPE(XenNetDev, XEN_NET_DEVICE)
+
+#define xen_pv_printf(a, n, ...) qemu_printf(__VA_ARGS__)
+
 /* ------------------------------------------------------------- */
 
 static void net_tx_response(struct XenNetDev *netdev, netif_tx_request_t *txp, int8_t st)
@@ -68,7 +88,8 @@ static void net_tx_response(struct XenNetDev *netdev, netif_tx_request_t *txp, i
     netdev->tx_ring.rsp_prod_pvt = ++i;
     RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(&netdev->tx_ring, notify);
     if (notify) {
-        xen_pv_send_notify(&netdev->xendev);
+        xen_device_notify_event_channel(XEN_DEVICE(netdev),
+                                        netdev->event_channel, NULL);
     }
 
     if (i == netdev->tx_ring.req_cons) {
@@ -104,8 +125,9 @@ static void net_tx_error(struct XenNetDev *netdev, netif_tx_request_t *txp, RING
 #endif
 }
 
-static void net_tx_packets(struct XenNetDev *netdev)
+static bool net_tx_packets(struct XenNetDev *netdev)
 {
+    bool done_something = false;
     netif_tx_request_t txreq;
     RING_IDX rc, rp;
     void *page;
@@ -122,6 +144,7 @@ static void net_tx_packets(struct XenNetDev *netdev)
             }
             memcpy(&txreq, RING_GET_REQUEST(&netdev->tx_ring, rc), sizeof(txreq));
             netdev->tx_ring.req_cons = ++rc;
+            done_something = true;
 
 #if 1
             /* should not happen in theory, we don't announce the *
@@ -151,7 +174,7 @@ static void net_tx_packets(struct XenNetDev *netdev)
                 continue;
             }
 
-            xen_pv_printf(&netdev->xendev, 3,
+            if (0) qemu_printf(//&netdev->xendev, 3,
                           "tx packet ref %d, off %d, len %d, flags 0x%x%s%s%s%s\n",
                           txreq.gref, txreq.offset, txreq.size, txreq.flags,
                           (txreq.flags & NETTXF_csum_blank)     ? " csum_blank"     : "",
@@ -159,8 +182,8 @@ static void net_tx_packets(struct XenNetDev *netdev)
                           (txreq.flags & NETTXF_more_data)      ? " more_data"      : "",
                           (txreq.flags & NETTXF_extra_info)     ? " extra_info"     : "");
 
-            page = xen_be_map_grant_ref(&netdev->xendev, txreq.gref,
-                                        PROT_READ);
+            page = xen_device_map_grant_refs(&netdev->xendev, &txreq.gref, 1,
+                                             PROT_READ, NULL);
             if (page == NULL) {
                 xen_pv_printf(&netdev->xendev, 0,
                               "error: tx gref dereference failed (%d)\n",
@@ -181,7 +204,8 @@ static void net_tx_packets(struct XenNetDev *netdev)
                 qemu_send_packet(qemu_get_queue(netdev->nic),
                                  page + txreq.offset, txreq.size);
             }
-            xen_be_unmap_grant_ref(&netdev->xendev, page, txreq.gref);
+            xen_device_unmap_grant_refs(&netdev->xendev, page, &txreq.gref, 1,
+                                        NULL);
             net_tx_response(netdev, &txreq, NETIF_RSP_OKAY);
         }
         if (!netdev->tx_work) {
@@ -190,6 +214,7 @@ static void net_tx_packets(struct XenNetDev *netdev)
         netdev->tx_work = 0;
     }
     g_free(tmpbuf);
+    return done_something;
 }
 
 /* ------------------------------------------------------------- */
@@ -212,14 +237,15 @@ static void net_rx_response(struct XenNetDev *netdev,
         resp->status = (int16_t)st;
     }
 
-    xen_pv_printf(&netdev->xendev, 3,
+    if (0) qemu_printf(//&netdev->xendev, 3,
                   "rx response: idx %d, status %d, flags 0x%x\n",
                   i, resp->status, resp->flags);
 
     netdev->rx_ring.rsp_prod_pvt = ++i;
     RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(&netdev->rx_ring, notify);
     if (notify) {
-        xen_pv_send_notify(&netdev->xendev);
+        xen_device_notify_event_channel(XEN_DEVICE(netdev),
+                                        netdev->event_channel, NULL);
     }
 }
 
@@ -232,7 +258,7 @@ static ssize_t net_rx_packet(NetClientState *nc, const uint8_t *buf, size_t size
     RING_IDX rc, rp;
     void *page;
 
-    if (netdev->xendev.be_state != XenbusStateConnected) {
+    if (netdev->rx_ring.sring == NULL) {
         return -1;
     }
 
@@ -252,7 +278,8 @@ static ssize_t net_rx_packet(NetClientState *nc, const uint8_t *buf, size_t size
     memcpy(&rxreq, RING_GET_REQUEST(&netdev->rx_ring, rc), sizeof(rxreq));
     netdev->rx_ring.req_cons = ++rc;
 
-    page = xen_be_map_grant_ref(&netdev->xendev, rxreq.gref, PROT_WRITE);
+    page = xen_device_map_grant_refs(&netdev->xendev, &rxreq.gref, 1,
+                                     PROT_WRITE, NULL);
     if (page == NULL) {
         xen_pv_printf(&netdev->xendev, 0,
                       "error: rx gref dereference failed (%d)\n",
@@ -261,7 +288,7 @@ static ssize_t net_rx_packet(NetClientState *nc, const uint8_t *buf, size_t size
         return -1;
     }
     memcpy(page + NET_IP_ALIGN, buf, size);
-    xen_be_unmap_grant_ref(&netdev->xendev, page, rxreq.gref);
+    xen_device_unmap_grant_refs(&netdev->xendev, page, &rxreq.gref, 1, NULL);
     net_rx_response(netdev, &rxreq, NETIF_RSP_OKAY, NET_IP_ALIGN, size, 0);
 
     return size;
@@ -275,139 +302,350 @@ static NetClientInfo net_xen_info = {
     .receive = net_rx_packet,
 };
 
-static int net_init(struct XenLegacyDevice *xendev)
+static void xen_netdev_realize(XenDevice *xendev, Error **errp)
 {
-    struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
+    ERRP_GUARD();
+    XenNetDev *netdev = XEN_NET_DEVICE(xendev);
 
-    /* read xenstore entries */
-    if (netdev->mac == NULL) {
-        netdev->mac = xenstore_read_be_str(&netdev->xendev, "mac");
-    }
+    qemu_macaddr_default_if_unset(&netdev->conf.macaddr);
 
-    /* do we have all we need? */
-    if (netdev->mac == NULL) {
-        return -1;
-    }
-
-    if (net_parse_macaddr(netdev->conf.macaddr.a, netdev->mac) < 0) {
-        return -1;
-    }
+    xen_device_frontend_printf(xendev, "mac", "%02x:%02x:%02x:%02x:%02x:%02x",
+                               netdev->conf.macaddr.a[0],
+                               netdev->conf.macaddr.a[1],
+                               netdev->conf.macaddr.a[2],
+                               netdev->conf.macaddr.a[3],
+                               netdev->conf.macaddr.a[4],
+                               netdev->conf.macaddr.a[5]);
 
     netdev->nic = qemu_new_nic(&net_xen_info, &netdev->conf,
-                               "xen", NULL, netdev);
+                               object_get_typename(OBJECT(xendev)),
+                               DEVICE(xendev)->id, netdev);
 
-    qemu_set_info_str(qemu_get_queue(netdev->nic),
-                      "nic: xenbus vif macaddr=%s", netdev->mac);
+    qemu_format_nic_info_str(qemu_get_queue(netdev->nic), netdev->conf.macaddr.a);
 
     /* fill info */
-    xenstore_write_be_int(&netdev->xendev, "feature-rx-copy", 1);
-    xenstore_write_be_int(&netdev->xendev, "feature-rx-flip", 0);
+    xen_device_backend_printf(xendev, "feature-rx-copy", "%u", 1);
+    xen_device_backend_printf(xendev, "feature-rx-flip", "%u", 0);
 
-    return 0;
+    trace_xen_netdev_realize(netdev->dev, qemu_get_queue(netdev->nic)->info_str);
 }
 
-static int net_connect(struct XenLegacyDevice *xendev)
+static bool net_event(void *_xendev)
 {
-    struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
-    int rx_copy;
+    XenNetDev *netdev = XEN_NET_DEVICE(_xendev);
+    bool done_something;
 
-    if (xenstore_read_fe_int(&netdev->xendev, "tx-ring-ref",
-                             &netdev->tx_ring_ref) == -1) {
-        return -1;
+    done_something = net_tx_packets(netdev);
+    qemu_flush_queued_packets(qemu_get_queue(netdev->nic));
+    return done_something;
+}
+
+static bool xen_netdev_connect(XenDevice *xendev, Error **errp)
+{
+    XenNetDev *netdev = XEN_NET_DEVICE(xendev);
+    unsigned int port, rx_copy;
+
+    if (xen_device_frontend_scanf(xendev, "tx-ring-ref", "%u",
+                                  &netdev->tx_ring_ref) != 1) {
+        error_setg(errp, "failed to read tx-ring-ref");
+        return false;
     }
-    if (xenstore_read_fe_int(&netdev->xendev, "rx-ring-ref",
-                             &netdev->rx_ring_ref) == -1) {
-        return 1;
+
+    if (xen_device_frontend_scanf(xendev, "rx-ring-ref", "%u",
+                                  &netdev->rx_ring_ref) != 1) {
+        error_setg(errp, "failed to read rx-ring-ref");
+        return false;
     }
-    if (xenstore_read_fe_int(&netdev->xendev, "event-channel",
-                             &netdev->xendev.remote_port) == -1) {
-        return -1;
+
+    if (xen_device_frontend_scanf(xendev, "event-channel", "%u",
+                                  &port) != 1) {
+        error_setg(errp, "failed to read event-channel");
+        return false;
     }
 
-    if (xenstore_read_fe_int(&netdev->xendev, "request-rx-copy", &rx_copy) == -1) {
+    if (xen_device_frontend_scanf(xendev, "request-rx-copy", "%u",
+                                  &rx_copy) != 1) {
         rx_copy = 0;
     }
     if (rx_copy == 0) {
-        xen_pv_printf(&netdev->xendev, 0,
-                      "frontend doesn't support rx-copy.\n");
-        return -1;
+        error_setg(errp, "frontend doesn't support rx-copy");
+        return false;
     }
 
-    netdev->txs = xen_be_map_grant_ref(&netdev->xendev,
-                                       netdev->tx_ring_ref,
-                                       PROT_READ | PROT_WRITE);
+    netdev->txs = xen_device_map_grant_refs(xendev,
+                                            &netdev->tx_ring_ref, 1,
+                                            PROT_READ | PROT_WRITE,
+                                            errp);
     if (!netdev->txs) {
-        return -1;
+        error_prepend(errp, "failed to map tx grant ref: ");
+        return false;
     }
-    netdev->rxs = xen_be_map_grant_ref(&netdev->xendev,
-                                       netdev->rx_ring_ref,
-                                       PROT_READ | PROT_WRITE);
+
+    netdev->rxs = xen_device_map_grant_refs(xendev,
+                                            &netdev->rx_ring_ref, 1,
+                                            PROT_READ | PROT_WRITE,
+                                            errp);
     if (!netdev->rxs) {
-        xen_be_unmap_grant_ref(&netdev->xendev, netdev->txs,
-                               netdev->tx_ring_ref);
-        netdev->txs = NULL;
-        return -1;
+        error_prepend(errp, "failed to map rx grant ref: ");
+        return false;
     }
+
     BACK_RING_INIT(&netdev->tx_ring, netdev->txs, XEN_PAGE_SIZE);
     BACK_RING_INIT(&netdev->rx_ring, netdev->rxs, XEN_PAGE_SIZE);
 
-    xen_be_bind_evtchn(&netdev->xendev);
+    netdev->event_channel = xen_device_bind_event_channel(xendev, port,
+                                                          net_event,
+                                                          netdev,
+                                                          errp);
+    if (!netdev->event_channel) {
+        return false;
+    }
 
-    xen_pv_printf(&netdev->xendev, 1, "ok: tx-ring-ref %d, rx-ring-ref %d, "
-                  "remote port %d, local port %d\n",
-                  netdev->tx_ring_ref, netdev->rx_ring_ref,
-                  netdev->xendev.remote_port, netdev->xendev.local_port);
+    trace_xen_netdev_connect(netdev->dev, netdev->tx_ring_ref,
+                             netdev->rx_ring_ref, port);
 
     net_tx_packets(netdev);
-    return 0;
+    return true;
 }
 
-static void net_disconnect(struct XenLegacyDevice *xendev)
+static void xen_netdev_disconnect(XenDevice *xendev, Error **errp)
 {
-    struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
+    XenNetDev *netdev = XEN_NET_DEVICE(xendev);
+
+    trace_xen_netdev_disconnect(netdev->dev);
 
-    xen_pv_unbind_evtchn(&netdev->xendev);
+    netdev->tx_ring.sring = NULL;
+    netdev->rx_ring.sring = NULL;
 
+    if (netdev->event_channel) {
+        xen_device_unbind_event_channel(xendev, netdev->event_channel,
+                                        errp);
+        netdev->event_channel = NULL;
+    }
     if (netdev->txs) {
-        xen_be_unmap_grant_ref(&netdev->xendev, netdev->txs,
-                               netdev->tx_ring_ref);
+        xen_device_unmap_grant_refs(xendev, netdev->txs,
+                                    &netdev->tx_ring_ref, 1, errp);
         netdev->txs = NULL;
     }
     if (netdev->rxs) {
-        xen_be_unmap_grant_ref(&netdev->xendev, netdev->rxs,
-                               netdev->rx_ring_ref);
+        xen_device_unmap_grant_refs(xendev, netdev->rxs,
+                                    &netdev->rx_ring_ref, 1, errp);
         netdev->rxs = NULL;
     }
 }
 
-static void net_event(struct XenLegacyDevice *xendev)
+/* -------------------------------------------------------------------- */
+
+
+static void xen_netdev_frontend_changed(XenDevice *xendev,
+                                       enum xenbus_state frontend_state,
+                                       Error **errp)
 {
-    struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
-    net_tx_packets(netdev);
-    qemu_flush_queued_packets(qemu_get_queue(netdev->nic));
+    ERRP_GUARD();
+    enum xenbus_state backend_state = xen_device_backend_get_state(xendev);
+
+    trace_xen_netdev_frontend_changed(xendev->name, frontend_state);
+
+    switch (frontend_state) {
+    case XenbusStateInitialised:
+    case XenbusStateConnected:
+        if (backend_state == XenbusStateConnected) {
+            break;
+        }
+
+        xen_netdev_disconnect(xendev, errp);
+        if (*errp) {
+            break;
+        }
+
+        if (!xen_netdev_connect(xendev, errp)) {
+            xen_netdev_disconnect(xendev, NULL);
+            xen_device_backend_set_state(xendev, XenbusStateClosing);
+            break;
+        }
+
+        xen_device_backend_set_state(xendev, XenbusStateConnected);
+        break;
+
+    case XenbusStateClosing:
+        xen_device_backend_set_state(xendev, XenbusStateClosing);
+        break;
+
+    case XenbusStateClosed:
+    case XenbusStateUnknown:
+        xen_netdev_disconnect(xendev, errp);
+        if (*errp) {
+            break;
+        }
+
+        xen_device_backend_set_state(xendev, XenbusStateClosed);
+        break;
+
+    default:
+        break;
+    }
 }
 
-static int net_free(struct XenLegacyDevice *xendev)
+static char *xen_netdev_get_name(XenDevice *xendev, Error **errp)
 {
-    struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
+    XenNetDev *netdev = XEN_NET_DEVICE(xendev);
+
+    if (netdev->dev == -1) {
+        XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
+        char fe_path[XENSTORE_ABS_PATH_MAX + 1];
+        int idx = (xen_mode == XEN_EMULATE) ? 0 : 1;
+        char *value;
+
+        /* Theoretically we could go up to INT_MAX here but that's overkill */
+        while (idx < 100) {
+            snprintf(fe_path, sizeof(fe_path),
+                     "/local/domain/%u/device/vif/%u",
+                     xendev->frontend_id, idx);
+            value = qemu_xen_xs_read(xenbus->xsh, XBT_NULL, fe_path, NULL);
+            if (!value) {
+                if (errno == ENOENT) {
+                    netdev->dev = idx;
+                    goto found;
+                }
+                error_setg(errp, "cannot read %s: %s", fe_path,
+                           strerror(errno));
+                return NULL;
+            }
+            free(value);
+            idx++;
+        }
+        error_setg(errp, "cannot find device index for netdev device");
+        return NULL;
+    }
+ found:
+    return g_strdup_printf("%u", netdev->dev);
+}
+
+static void xen_netdev_unrealize(XenDevice *xendev)
+{
+    XenNetDev *netdev = XEN_NET_DEVICE(xendev);
+
+    trace_xen_netdev_unrealize(netdev->dev);
+
+    /* Disconnect from the frontend in case this has not already happened */
+    xen_netdev_disconnect(xendev, NULL);
 
     if (netdev->nic) {
         qemu_del_nic(netdev->nic);
-        netdev->nic = NULL;
     }
-    g_free(netdev->mac);
-    netdev->mac = NULL;
-    return 0;
 }
 
 /* ------------------------------------------------------------- */
 
-struct XenDevOps xen_netdev_ops = {
-    .size       = sizeof(struct XenNetDev),
-    .flags      = DEVOPS_FLAG_NEED_GNTDEV,
-    .init       = net_init,
-    .initialise    = net_connect,
-    .event      = net_event,
-    .disconnect = net_disconnect,
-    .free       = net_free,
+static Property xen_netdev_properties[] = {
+    DEFINE_NIC_PROPERTIES(XenNetDev, conf),
+    DEFINE_PROP_INT32("idx", XenNetDev, dev, -1),
+    DEFINE_PROP_END_OF_LIST(),
 };
+
+static void xen_netdev_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dev_class = DEVICE_CLASS(class);
+    XenDeviceClass *xendev_class = XEN_DEVICE_CLASS(class);
+
+    xendev_class->backend = "qnet";
+    xendev_class->device = "vif";
+    xendev_class->get_name = xen_netdev_get_name;
+    xendev_class->realize = xen_netdev_realize;
+    xendev_class->frontend_changed = xen_netdev_frontend_changed;
+    xendev_class->unrealize = xen_netdev_unrealize;
+    set_bit(DEVICE_CATEGORY_NETWORK, dev_class->categories);
+    dev_class->user_creatable = true;
+
+    device_class_set_props(dev_class, xen_netdev_properties);
+}
+
+static const TypeInfo xen_net_type_info = {
+    .name = TYPE_XEN_NET_DEVICE,
+    .parent = TYPE_XEN_DEVICE,
+    .instance_size = sizeof(XenNetDev),
+    .class_init = xen_netdev_class_init,
+};
+
+static void xen_net_register_types(void)
+{
+    type_register_static(&xen_net_type_info);
+}
+
+type_init(xen_net_register_types)
+
+/* Called to instantiate a XenNetDev when the backend is detected. */
+static void xen_net_device_create(XenBackendInstance *backend,
+                                  QDict *opts, Error **errp)
+{
+    ERRP_GUARD();
+    XenBus *xenbus = xen_backend_get_bus(backend);
+    const char *name = xen_backend_get_name(backend);
+    XenDevice *xendev = NULL;
+    unsigned long number;
+    const char *macstr;
+    XenNetDev *net;
+    MACAddr mac;
+
+    if (qemu_strtoul(name, NULL, 10, &number) || number >= INT_MAX) {
+        error_setg(errp, "failed to parse name '%s'", name);
+        goto fail;
+    }
+
+    trace_xen_netdev_create(number);
+
+    macstr = qdict_get_try_str(opts, "mac");
+    if (macstr == NULL) {
+        error_setg(errp, "no MAC address found");
+        goto fail;
+    }
+
+    if (net_parse_macaddr(mac.a, macstr) < 0) {
+        error_setg(errp, "failed to parse MAC address");
+        goto fail;
+    }
+
+    xendev = XEN_DEVICE(qdev_new(TYPE_XEN_NET_DEVICE));
+    net = XEN_NET_DEVICE(xendev);
+
+    net->dev = number;
+    memcpy(&net->conf.macaddr, &mac, sizeof(mac));
+
+    if (qdev_realize_and_unref(DEVICE(xendev), BUS(xenbus), errp)) {
+        xen_backend_set_device(backend, xendev);
+        return;
+    }
+
+    error_prepend(errp, "realization of net device %lu failed: ",
+                  number);
+
+ fail:
+    if (xendev) {
+        object_unparent(OBJECT(xendev));
+    }
+}
+
+static void xen_net_device_destroy(XenBackendInstance *backend,
+                                       Error **errp)
+{
+    ERRP_GUARD();
+    XenDevice *xendev = xen_backend_get_device(backend);
+    XenNetDev *netdev = XEN_NET_DEVICE(xendev);
+
+    trace_xen_netdev_destroy(netdev->dev);
+
+    object_unparent(OBJECT(xendev));
+}
+
+static const XenBackendInfo xen_net_backend_info  = {
+    .type = "qnet",
+    .create = xen_net_device_create,
+    .destroy = xen_net_device_destroy,
+};
+
+static void xen_net_register_backend(void)
+{
+    xen_backend_register(&xen_net_backend_info);
+}
+
+xen_backend_init(xen_net_register_backend);
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 17cda5ec13..764ca5c4fa 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -55,7 +55,6 @@ static void xen_init_pv(MachineState *machine)
     }
 
     xen_be_register("vfb", &xen_framebuffer_ops);
-    xen_be_register("qnic", &xen_netdev_ops);
 
     /* configure framebuffer */
     if (vga_interface_type == VGA_XENFB) {
-- 
2.40.1


