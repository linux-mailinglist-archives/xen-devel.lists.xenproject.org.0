Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3AE7EC9A8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 18:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633812.988890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Jg0-0003W3-KV; Wed, 15 Nov 2023 17:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633812.988890; Wed, 15 Nov 2023 17:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Jg0-0003Lv-Em; Wed, 15 Nov 2023 17:27:44 +0000
Received: by outflank-mailman (input) for mailman id 633812;
 Wed, 15 Nov 2023 17:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ynSk=G4=desiato.srs.infradead.org=BATV+a72437c23eaab18a7e37+7388+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r3Jfy-00031s-FG
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 17:27:42 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44af9411-83dc-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 18:27:38 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r3Jfi-004Bc1-25; Wed, 15 Nov 2023 17:27:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r3Jfh-004sFD-0h; Wed, 15 Nov 2023 17:27:25 +0000
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
X-Inumbo-ID: 44af9411-83dc-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nb4/k2mDzWcTB0WCWH1Sc4XyVKQa4fT5IUZadSOtr3A=; b=lHv8bWujGEmJl9ObnRZwBoZQPl
	gX7tpE1PWf5bAAP/UlMIQIio4a2+QZqHthuG5aA3qkM2vZGDvL5XqQUXCoSnzqjPG6NHqUcj4pj5b
	Mj1nNHARxT6exhbrY5ga6H1FrO8o05cTq5+WWJBFm91uuwEnQ8EzHGWimoZinGk1cdhlBAqqsZ5QL
	GPDIhHeAok8hk8s6DJUXW2FudVHzasFQHMao+kuK0m5SZB2wF4CID3aUheWtD2zRHP/ntD05fSCB4
	2a9vXKFFmi34fk5gkSWR/cPvRHT6ChZ5j7eOKvGC2SWcvDE6xX9s9ZZtt2nGZUNY0T+3jH3tZZzZM
	gAVhOqKA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: [PATCH 1/3] net: do not delete nics in net_cleanup()
Date: Wed, 15 Nov 2023 17:24:35 +0000
Message-ID: <20231115172723.1161679-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115172723.1161679-1-dwmw2@infradead.org>
References: <20231115172723.1161679-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

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
2.41.0


