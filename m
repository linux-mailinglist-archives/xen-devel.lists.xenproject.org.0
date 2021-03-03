Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80AF32B665
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 10:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92804.174970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHOI8-0001dQ-Hn; Wed, 03 Mar 2021 09:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92804.174970; Wed, 03 Mar 2021 09:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHOI8-0001ca-Ce; Wed, 03 Mar 2021 09:59:40 +0000
Received: by outflank-mailman (input) for mailman id 92804;
 Wed, 03 Mar 2021 09:59:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4P7r=IB=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1lHOI7-0001PK-Cg
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:59:39 +0000
Received: from forwardcorp1o.mail.yandex.net (unknown [2a02:6b8:0:1a2d::193])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d3cd9ae-3831-454b-94ca-afeb03441a89;
 Wed, 03 Mar 2021 09:59:25 +0000 (UTC)
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 990FB2E15BD;
 Wed,  3 Mar 2021 12:59:24 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 U464HtyxDo-xOxSQLKe; Wed, 03 Mar 2021 12:59:24 +0300
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:107:880d:3c89:fcd8:ca75])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 w0BjtEeJGw-xOnKhJsv; Wed, 03 Mar 2021 12:59:24 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9d3cd9ae-3831-454b-94ca-afeb03441a89
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1614765564; bh=tKLqAXYmQttCAaAlU3fBYVvZyqpt/IoO0XRXm/czWeY=;
	h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
	b=AkZnkvJFo+ECjj66JzKbBbTOtDX6hKqNbh4xeP96UYVqIETfkaXHjnZoO1fNDedkg
	 0ebA/ed1usEe3C7S/PJ9ksh40p89acXsAxfhd0+yb+1cGtWm7TVfIlnaLDCtHJc/D+
	 zAafC/aPEWlto+FIOWMdYRW0VYMfyYW0EitDeQ50=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Luigi Rizzo <rizzo@iet.unipi.it>,
	Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
	Vincenzo Maffione <v.maffione@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org,
	yc-core@yandex-team.ru
Subject: [PATCH v7 3/5] net: Move NetClientState.info_str to dynamic allocations
Date: Wed,  3 Mar 2021 12:59:08 +0300
Message-Id: <20210303095910.78277-4-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303095910.78277-1-lekiravi@yandex-team.ru>
References: <20210303095910.78277-1-lekiravi@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The info_str field of the NetClientState structure is static and has a size
of 256 bytes. This amount is often unclaimed, and the field itself is used
exclusively for HMP "info network".

The patch translates info_str to dynamic memory allocation.

This action is also allows us to painlessly discard usage of this field
for backend devices.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
---
 hw/net/xen_nic.c  |  5 ++---
 include/net/net.h |  2 +-
 net/l2tpv3.c      |  3 +--
 net/net.c         | 14 ++++++++------
 net/slirp.c       |  5 ++---
 net/socket.c      | 43 ++++++++++++++++++++++++-------------------
 net/tap-win32.c   |  3 +--
 net/tap.c         | 13 +++++--------
 net/vde.c         |  3 +--
 net/vhost-user.c  |  3 +--
 net/vhost-vdpa.c  |  2 +-
 11 files changed, 47 insertions(+), 49 deletions(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 5c815b4f0c..8431808ea0 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -296,9 +296,8 @@ static int net_init(struct XenLegacyDevice *xendev)
     netdev->nic = qemu_new_nic(&net_xen_info, &netdev->conf,
                                "xen", NULL, netdev);
 
-    snprintf(qemu_get_queue(netdev->nic)->info_str,
-             sizeof(qemu_get_queue(netdev->nic)->info_str),
-             "nic: xenbus vif macaddr=%s", netdev->mac);
+    qemu_get_queue(netdev->nic)->info_str = g_strdup_printf(
+        "nic: xenbus vif macaddr=%s", netdev->mac);
 
     /* fill info */
     xenstore_write_be_int(&netdev->xendev, "feature-rx-copy", 1);
diff --git a/include/net/net.h b/include/net/net.h
index 162fd3f1b5..7039eb280a 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -94,7 +94,7 @@ struct NetClientState {
     NetQueue *incoming_queue;
     char *model;
     char *name;
-    char info_str[256];
+    char *info_str;
     NetdevInfo *stored_config;
     unsigned receive_disabled : 1;
     NetClientDestructor *destructor;
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 8aa0a3e1a0..96611cb4af 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -730,8 +730,7 @@ int net_init_l2tpv3(const Netdev *netdev,
     QAPI_CLONE_MEMBERS(NetdevL2TPv3Options,
                        &nc->stored_config->u.l2tpv3, l2tpv3);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "l2tpv3: connected");
+    s->nc.info_str = g_strdup_printf("l2tpv3: connected");
     return 0;
 outerr:
     qemu_del_net_client(nc);
diff --git a/net/net.c b/net/net.c
index 1e50222a6e..88d70d0e4d 100644
--- a/net/net.c
+++ b/net/net.c
@@ -128,11 +128,12 @@ char *qemu_mac_strdup_printf(const uint8_t *macaddr)
 
 void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6])
 {
-    snprintf(nc->info_str, sizeof(nc->info_str),
-             "model=%s,macaddr=%02x:%02x:%02x:%02x:%02x:%02x",
-             nc->model,
-             macaddr[0], macaddr[1], macaddr[2],
-             macaddr[3], macaddr[4], macaddr[5]);
+    g_free(nc->info_str);
+    nc->info_str = g_strdup_printf(
+        "model=%s,macaddr=%02x:%02x:%02x:%02x:%02x:%02x",
+        nc->model,
+        macaddr[0], macaddr[1], macaddr[2],
+        macaddr[3], macaddr[4], macaddr[5]);
 }
 
 static int mac_table[256] = {0};
@@ -351,6 +352,7 @@ static void qemu_free_net_client(NetClientState *nc)
     }
     g_free(nc->name);
     g_free(nc->model);
+    g_free(nc->info_str);
     qapi_free_NetdevInfo(nc->stored_config);
     if (nc->destructor) {
         nc->destructor(nc);
@@ -1197,7 +1199,7 @@ void print_net_client(Monitor *mon, NetClientState *nc)
     monitor_printf(mon, "%s: index=%d,type=%s,%s\n", nc->name,
                    nc->queue_index,
                    NetClientDriver_str(nc->info->type),
-                   nc->info_str);
+                   nc->info_str ? nc->info_str : "");
     if (!QTAILQ_EMPTY(&nc->filters)) {
         monitor_printf(mon, "filters:\n");
     }
diff --git a/net/slirp.c b/net/slirp.c
index 6ab348b943..bfa07e3432 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -664,9 +664,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         stored->tftp_server_name = g_strdup(tftp_server_name);
     }
 
-    snprintf(nc->info_str, sizeof(nc->info_str),
-             "net=%s,restrict=%s", inet_ntoa(net),
-             restricted ? "on" : "off");
+    nc->info_str = g_strdup_printf("net=%s,restrict=%s", inet_ntoa(net),
+                                   restricted ? "on" : "off");
 
     s = DO_UPCAST(SlirpState, nc, nc);
 
diff --git a/net/socket.c b/net/socket.c
index 1614523b82..98172347d7 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -180,7 +180,8 @@ static void net_socket_send(void *opaque)
         s->fd = -1;
         net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
         s->nc.link_down = true;
-        memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
+        g_free(s->nc.info_str);
+        s->nc.info_str = g_new0(char, 1);
 
         return;
     }
@@ -400,16 +401,16 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
         stored->mcast = g_strdup(mcast);
 
         s->dgram_dst = saddr;
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "socket: fd=%d (cloned mcast=%s:%d)",
-                 fd, inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+        nc->info_str = g_strdup_printf("socket: fd=%d (cloned mcast=%s:%d)",
+                                       fd, inet_ntoa(saddr.sin_addr),
+                                       ntohs(saddr.sin_port));
     } else {
         if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
             s->dgram_dst.sin_family = AF_UNIX;
         }
 
-        snprintf(nc->info_str, sizeof(nc->info_str),
-                 "socket: fd=%d %s", fd, SocketAddressType_str(sa_type));
+        nc->info_str = g_strdup_printf("socket: fd=%d %s",
+                                       fd, SocketAddressType_str(sa_type));
     }
 
     return s;
@@ -444,7 +445,7 @@ static NetSocketState *net_socket_fd_init_stream(NetClientState *peer,
 
     nc = qemu_new_net_client(&net_socket_info, peer, model, name);
 
-    snprintf(nc->info_str, sizeof(nc->info_str), "socket: fd=%d", fd);
+    nc->info_str = g_strdup_printf("socket: fd=%d", fd);
 
     s = DO_UPCAST(NetSocketState, nc, nc);
 
@@ -528,9 +529,10 @@ static void net_socket_accept(void *opaque)
     stored->has_fd = true;
     stored->fd = g_strdup_printf("%d", fd);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: connection from %s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: connection from %s:%d",
+                                     inet_ntoa(saddr.sin_addr),
+                                     ntohs(saddr.sin_port));
 }
 
 static int net_socket_listen_init(NetClientState *peer,
@@ -645,9 +647,10 @@ static int net_socket_connect_init(NetClientState *peer,
     stored->has_connect = true;
     stored->connect = g_strdup(host_str);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: connect to %s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: connect to %s:%d",
+                                     inet_ntoa(saddr.sin_addr),
+                                     ntohs(saddr.sin_port));
     return 0;
 }
 
@@ -704,9 +707,10 @@ static int net_socket_mcast_init(NetClientState *peer,
         stored->localaddr = g_strdup(localaddr_str);
     }
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: mcast=%s:%d",
-             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: mcast=%s:%d",
+                                     inet_ntoa(saddr.sin_addr),
+                                     ntohs(saddr.sin_port));
     return 0;
 
 }
@@ -769,9 +773,10 @@ static int net_socket_udp_init(NetClientState *peer,
     stored->has_udp = true;
     stored->udp = g_strdup(rhost);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "socket: udp=%s:%d",
-             inet_ntoa(raddr.sin_addr), ntohs(raddr.sin_port));
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: udp=%s:%d",
+                                     inet_ntoa(raddr.sin_addr),
+                                     ntohs(raddr.sin_port));
     return 0;
 }
 
diff --git a/net/tap-win32.c b/net/tap-win32.c
index b60933bd1a..0888db8cce 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -787,8 +787,7 @@ static int tap_win32_init(NetClientState *peer, const char *model,
     stored->has_ifname = true;
     stored->ifname = g_strdup(ifname);
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-             "tap: ifname=%s", ifname);
+    s->nc.info_str = g_strdup_printf("tap: ifname=%s", ifname);
 
     s->handle = handle;
 
diff --git a/net/tap.c b/net/tap.c
index 8041245ba7..f864f434b2 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -625,8 +625,7 @@ int net_init_bridge(const Netdev *netdev, const char *name,
         stored->helper = g_strdup(helper);
     }
 
-    snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s,br=%s", helper,
-             br);
+    s->nc.info_str = g_strdup_printf("helper=%s,br=%s", helper, br);
 
     return 0;
 }
@@ -714,7 +713,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             g_free(tmp_s);
         }
 
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "fd=%d", fd);
+        s->nc.info_str = g_strdup_printf("fd=%d", fd);
     } else if (tap->has_helper) {
         if (!stored->has_helper) {
             stored->has_helper = true;
@@ -727,8 +726,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                                        g_strdup(DEFAULT_BRIDGE_INTERFACE);
         }
 
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s",
-                 tap->helper);
+        s->nc.info_str = g_strdup_printf("helper=%s", tap->helper);
     } else {
         if (ifname && !stored->has_ifname) {
             stored->has_ifname = true;
@@ -745,9 +743,8 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->downscript = g_strdup(downscript);
         }
 
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-                 "ifname=%s,script=%s,downscript=%s", ifname, script,
-                 downscript);
+        s->nc.info_str = g_strdup_printf("ifname=%s,script=%s,downscript=%s",
+                                         ifname, script, downscript);
 
         if (strcmp(downscript, "no") != 0) {
             snprintf(s->down_script, sizeof(s->down_script), "%s", downscript);
diff --git a/net/vde.c b/net/vde.c
index b0b8800571..67de6eb0c5 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -100,8 +100,7 @@ static int net_vde_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_vde_info, peer, model, name);
 
-    snprintf(nc->info_str, sizeof(nc->info_str), "sock=%s,fd=%d",
-             sock, vde_datafd(vde));
+    nc->info_str = g_strdup_printf("sock=%s,fd=%d", sock, vde_datafd(vde));
 
     s = DO_UPCAST(VDEState, nc, nc);
 
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 5b7056be25..49c9a740c2 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -327,8 +327,7 @@ static int net_vhost_user_init(NetClientState *peer, const char *device,
     user = g_new0(struct VhostUserState, 1);
     for (i = 0; i < queues; i++) {
         nc = qemu_new_net_client(&net_vhost_user_info, peer, device, name);
-        snprintf(nc->info_str, sizeof(nc->info_str), "vhost-user%d to %s",
-                 i, chr->label);
+        nc->info_str = g_strdup_printf("vhost-user%d to %s", i, chr->label);
         nc->queue_index = i;
         if (!nc0) {
             nc0 = nc;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 8c27ea0142..423d71770d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -200,7 +200,7 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     stored->has_queues = true;
     stored->queues = 1; /* TODO: change when support multiqueue */
 
-    snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
+    nc->info_str = g_strdup_printf(TYPE_VHOST_VDPA);
     nc->queue_index = 0;
     s = DO_UPCAST(VhostVDPAState, nc, nc);
     vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
-- 
2.25.1


