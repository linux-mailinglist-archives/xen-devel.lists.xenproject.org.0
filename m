Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743857E2754
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 15:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628096.979210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00pM-0000my-SV; Mon, 06 Nov 2023 14:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628096.979210; Mon, 06 Nov 2023 14:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00pM-0000ck-Ib; Mon, 06 Nov 2023 14:43:44 +0000
Received: by outflank-mailman (input) for mailman id 628096;
 Mon, 06 Nov 2023 14:43:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wwoJ=GT=infradead.org=prvs=667a8cc2a=dwmw2@srs-se1.protection.inumbo.net>)
 id 1r00iE-0008Lv-A2
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:36:22 +0000
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com
 [207.171.188.206]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d916f548-7cb1-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 15:36:20 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-9106.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 14:36:17 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com (Postfix)
 with ESMTPS id C365780650; Mon,  6 Nov 2023 14:36:07 +0000 (UTC)
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:42871]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.251:2525]
 with esmtp (Farcaster)
 id 2f456b54-d745-49c6-a6fe-1ae7d4e8d6d6; Mon, 6 Nov 2023 14:36:06 +0000 (UTC)
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 14:35:57 +0000
Received: from u3832b3a9db3152.ant.amazon.com (10.106.83.6) by
 mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Mon, 6 Nov 2023 14:35:55 +0000
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
X-Inumbo-ID: d916f548-7cb1-11ee-98da-6d05b1d4d9a1
X-IronPort-AV: E=Sophos;i="6.03,281,1694736000"; 
   d="scan'208";a="682420133"
X-Farcaster-Flow-ID: 2f456b54-d745-49c6-a6fe-1ae7d4e8d6d6
From: David Woodhouse <dwmw2@infradead.org>
To: <qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, <qemu-block@nongnu.org>,
	<xen-devel@lists.xenproject.org>, <kvm@vger.kernel.org>
Subject: [PATCH v4 14/17] net: do not delete nics in net_cleanup()
Date: Mon, 6 Nov 2023 14:35:04 +0000
Message-ID: <20231106143507.1060610-15-dwmw2@infradead.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106143507.1060610-1-dwmw2@infradead.org>
References: <20231106143507.1060610-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: David Woodhouse <dwmw@amazon.co.uk>

In net_cleanup() we only need to delete the netdevs, as those may have
state which outlives Qemu when it exits, and thus may actually need to
be cleaned up on exit.

The nics, on the other hand, are owned by the device which created them.
Most devices don't bother to clean up on exit because they don't have
any state which will outlive Qemu... but XenBus devices do need to clean
up their nodes in XenStore, and do have an exit handler to delete them.

When the XenBus exit handler destroys the xen-net-device, it attempts
to delete its nic after net_cleanup() had already done so. And crashes.

Fix this by only deleting netdevs as we walk the list. As the comment
notes, we can't use QTAILQ_FOREACH_SAFE() as each deletion may remove
*multiple* entries, including the "safely" saved 'next' pointer. But
we can store the *previous* entry, since nics are safe.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 net/net.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/net/net.c b/net/net.c
index c0c0cbe99e..bbe33da176 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1499,18 +1499,34 @@ static void net_vm_change_state_handler(void *opaque, bool running,
 
 void net_cleanup(void)
 {
-    NetClientState *nc;
+    NetClientState *nc, **p = &QTAILQ_FIRST(&net_clients);
 
     /*cleanup colo compare module for COLO*/
     colo_compare_cleanup();
 
-    /* We may del multiple entries during qemu_del_net_client(),
-     * so QTAILQ_FOREACH_SAFE() is also not safe here.
+    /*
+     * Walk the net_clients list and remove the netdevs but *not* any
+     * NET_CLIENT_DRIVER_NIC entries. The latter are owned by the device
+     * model which created them, and in some cases (e.g. xen-net-device)
+     * the device itself may do cleanup at exit and will be upset if we
+     * just delete its NIC from underneath it.
+     *
+     * Since qemu_del_net_client() may delete multiple entries, using
+     * QTAILQ_FOREACH_SAFE() is not safe here. The only safe pointer
+     * to keep as a bookmark is a NET_CLIENT_DRIVER_NIC entry, so keep
+     * 'p' pointing to either the head of the list, or the 'next' field
+     * of the latest NET_CLIENT_DRIVER_NIC, and operate on *p as we walk
+     * the list.
+     *
+     * The 'nc' variable isn't part of the list traversal; it's purely
+     * for convenience as too much '(*p)->' has a tendency to make the
+     * readers' eyes bleed.
      */
-    while (!QTAILQ_EMPTY(&net_clients)) {
-        nc = QTAILQ_FIRST(&net_clients);
+    while (*p) {
+        nc = *p;
         if (nc->info->type == NET_CLIENT_DRIVER_NIC) {
-            qemu_del_nic(qemu_get_nic(nc));
+            /* Skip NET_CLIENT_DRIVER_NIC entries */
+            p = &QTAILQ_NEXT(nc, next);
         } else {
             qemu_del_net_client(nc);
         }
-- 
2.34.1


