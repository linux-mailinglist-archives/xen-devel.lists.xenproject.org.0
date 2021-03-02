Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E532A8B4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 19:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92541.174516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH9MI-0001Kb-0W; Tue, 02 Mar 2021 18:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92541.174516; Tue, 02 Mar 2021 18:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH9MH-0001Jr-Si; Tue, 02 Mar 2021 18:02:57 +0000
Received: by outflank-mailman (input) for mailman id 92541;
 Tue, 02 Mar 2021 18:02:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fwSr=IA=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1lH9MG-0001Io-Pz
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 18:02:56 +0000
Received: from forwardcorp1o.mail.yandex.net (unknown [95.108.205.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae8789d2-33fd-4e2d-ac19-49bc1d53e060;
 Tue, 02 Mar 2021 18:02:55 +0000 (UTC)
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 609922E15C8;
 Tue,  2 Mar 2021 21:02:54 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dc59eICpro-2rxe1tLf; Tue, 02 Mar 2021 21:02:54 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8002::1:1a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 onVeXhLyoo-2qo0XYka; Tue, 02 Mar 2021 21:02:53 +0300
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
X-Inumbo-ID: ae8789d2-33fd-4e2d-ac19-49bc1d53e060
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1614708174; bh=tqGbJUwXT9DHQMSmXyvwWHdwuWsscb7aSpvdvrgvkFc=;
	h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
	b=tJHNcdp7lAAUX0AacvMrTOVv7Bgbf+8vbCMnjT8jKSjl/FsqnvxfC90R3EpWsEEWq
	 FpuT/Lqk+XeM124B5pkdQI4+T6vtiZYabyl9MDlinCyGQafAiIyCFo1f5/GQzGmmU+
	 EDOwjOtbN+UwIs3FGjz2N5ldAYI+QZSc2KtzOlqQ=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
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
Subject: [PATCH v6 5/5] net: Do not fill legacy info_str for backends
Date: Tue,  2 Mar 2021 21:02:05 +0300
Message-Id: <20210302180205.5009-6-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302180205.5009-1-lekiravi@yandex-team.ru>
References: <20210302180205.5009-1-lekiravi@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As we use QAPI NetClientState->stored_config to store and get information
about backend network devices, we can drop fill of legacy field info_str
for them.

We still use info_str field for NIC and hubports, so we can not completely
remove it.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
---
 net/l2tpv3.c     |  2 --
 net/slirp.c      |  3 ---
 net/socket.c     | 28 ----------------------------
 net/tap-win32.c  |  2 --
 net/tap.c        |  9 ---------
 net/vde.c        |  2 --
 net/vhost-user.c |  1 -
 net/vhost-vdpa.c |  1 -
 8 files changed, 48 deletions(-)

diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 96611cb4af..b7e1d84674 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -729,8 +729,6 @@ int net_init_l2tpv3(const Netdev *netdev,
 
     QAPI_CLONE_MEMBERS(NetdevL2TPv3Options,
                        &nc->stored_config->u.l2tpv3, l2tpv3);
-
-    s->nc.info_str = g_strdup_printf("l2tpv3: connected");
     return 0;
 outerr:
     qemu_del_net_client(nc);
diff --git a/net/slirp.c b/net/slirp.c
index f8b3636fcc..99b131a3b0 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -669,9 +669,6 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         stored->tftp_server_name = g_strdup(tftp_server_name);
     }
 
-    nc->info_str = g_strdup_printf("net=%s,restrict=%s", inet_ntoa(net),
-                                   restricted ? "on" : "off");
-
     s = DO_UPCAST(SlirpState, nc, nc);
 
     s->slirp = slirp_init(restricted, ipv4, net, mask, host,
diff --git a/net/socket.c b/net/socket.c
index 98172347d7..c0de10c0c0 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -180,8 +180,6 @@ static void net_socket_send(void *opaque)
         s->fd = -1;
         net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
         s->nc.link_down = true;
-        g_free(s->nc.info_str);
-        s->nc.info_str = g_new0(char, 1);
 
         return;
     }
@@ -401,16 +399,10 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
         stored->mcast = g_strdup(mcast);
 
         s->dgram_dst = saddr;
-        nc->info_str = g_strdup_printf("socket: fd=%d (cloned mcast=%s:%d)",
-                                       fd, inet_ntoa(saddr.sin_addr),
-                                       ntohs(saddr.sin_port));
     } else {
         if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
             s->dgram_dst.sin_family = AF_UNIX;
         }
-
-        nc->info_str = g_strdup_printf("socket: fd=%d %s",
-                                       fd, SocketAddressType_str(sa_type));
     }
 
     return s;
@@ -445,8 +437,6 @@ static NetSocketState *net_socket_fd_init_stream(NetClientState *peer,
 
     nc = qemu_new_net_client(&net_socket_info, peer, model, name);
 
-    nc->info_str = g_strdup_printf("socket: fd=%d", fd);
-
     s = DO_UPCAST(NetSocketState, nc, nc);
 
     s->fd = fd;
@@ -528,11 +518,6 @@ static void net_socket_accept(void *opaque)
 
     stored->has_fd = true;
     stored->fd = g_strdup_printf("%d", fd);
-
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: connection from %s:%d",
-                                     inet_ntoa(saddr.sin_addr),
-                                     ntohs(saddr.sin_port));
 }
 
 static int net_socket_listen_init(NetClientState *peer,
@@ -647,10 +632,6 @@ static int net_socket_connect_init(NetClientState *peer,
     stored->has_connect = true;
     stored->connect = g_strdup(host_str);
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: connect to %s:%d",
-                                     inet_ntoa(saddr.sin_addr),
-                                     ntohs(saddr.sin_port));
     return 0;
 }
 
@@ -707,12 +688,7 @@ static int net_socket_mcast_init(NetClientState *peer,
         stored->localaddr = g_strdup(localaddr_str);
     }
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: mcast=%s:%d",
-                                     inet_ntoa(saddr.sin_addr),
-                                     ntohs(saddr.sin_port));
     return 0;
-
 }
 
 static int net_socket_udp_init(NetClientState *peer,
@@ -773,10 +749,6 @@ static int net_socket_udp_init(NetClientState *peer,
     stored->has_udp = true;
     stored->udp = g_strdup(rhost);
 
-    g_free(s->nc.info_str);
-    s->nc.info_str = g_strdup_printf("socket: udp=%s:%d",
-                                     inet_ntoa(raddr.sin_addr),
-                                     ntohs(raddr.sin_port));
     return 0;
 }
 
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 0888db8cce..21e451107b 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -787,8 +787,6 @@ static int tap_win32_init(NetClientState *peer, const char *model,
     stored->has_ifname = true;
     stored->ifname = g_strdup(ifname);
 
-    s->nc.info_str = g_strdup_printf("tap: ifname=%s", ifname);
-
     s->handle = handle;
 
     qemu_add_wait_object(s->handle->tap_semaphore, tap_win32_send, s);
diff --git a/net/tap.c b/net/tap.c
index f864f434b2..12a08d54fe 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -625,8 +625,6 @@ int net_init_bridge(const Netdev *netdev, const char *name,
         stored->helper = g_strdup(helper);
     }
 
-    s->nc.info_str = g_strdup_printf("helper=%s,br=%s", helper, br);
-
     return 0;
 }
 
@@ -712,8 +710,6 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->fds = g_strdup_printf("%s:%d", stored->fds, fd);
             g_free(tmp_s);
         }
-
-        s->nc.info_str = g_strdup_printf("fd=%d", fd);
     } else if (tap->has_helper) {
         if (!stored->has_helper) {
             stored->has_helper = true;
@@ -725,8 +721,6 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->br = tap->has_br ? g_strdup(tap->br) :
                                        g_strdup(DEFAULT_BRIDGE_INTERFACE);
         }
-
-        s->nc.info_str = g_strdup_printf("helper=%s", tap->helper);
     } else {
         if (ifname && !stored->has_ifname) {
             stored->has_ifname = true;
@@ -743,9 +737,6 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->downscript = g_strdup(downscript);
         }
 
-        s->nc.info_str = g_strdup_printf("ifname=%s,script=%s,downscript=%s",
-                                         ifname, script, downscript);
-
         if (strcmp(downscript, "no") != 0) {
             snprintf(s->down_script, sizeof(s->down_script), "%s", downscript);
             snprintf(s->down_script_arg, sizeof(s->down_script_arg),
diff --git a/net/vde.c b/net/vde.c
index 67de6eb0c5..64bdb937ca 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -100,8 +100,6 @@ static int net_vde_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_vde_info, peer, model, name);
 
-    nc->info_str = g_strdup_printf("sock=%s,fd=%d", sock, vde_datafd(vde));
-
     s = DO_UPCAST(VDEState, nc, nc);
 
     s->vde = vde;
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 49c9a740c2..e443c4b2b5 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -327,7 +327,6 @@ static int net_vhost_user_init(NetClientState *peer, const char *device,
     user = g_new0(struct VhostUserState, 1);
     for (i = 0; i < queues; i++) {
         nc = qemu_new_net_client(&net_vhost_user_info, peer, device, name);
-        nc->info_str = g_strdup_printf("vhost-user%d to %s", i, chr->label);
         nc->queue_index = i;
         if (!nc0) {
             nc0 = nc;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 423d71770d..5a28bbcd7b 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -200,7 +200,6 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     stored->has_queues = true;
     stored->queues = 1; /* TODO: change when support multiqueue */
 
-    nc->info_str = g_strdup_printf(TYPE_VHOST_VDPA);
     nc->queue_index = 0;
     s = DO_UPCAST(VhostVDPAState, nc, nc);
     vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
-- 
2.25.1


