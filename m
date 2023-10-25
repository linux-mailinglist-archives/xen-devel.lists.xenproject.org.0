Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33497D7026
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623024.970447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfIL-0003Mr-LQ; Wed, 25 Oct 2023 14:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623024.970447; Wed, 25 Oct 2023 14:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfIL-0003Kr-Hy; Wed, 25 Oct 2023 14:55:41 +0000
Received: by outflank-mailman (input) for mailman id 623024;
 Wed, 25 Oct 2023 14:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7q9=GH=desiato.srs.infradead.org=BATV+fe87d11d956b9f6f1554+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfE3-0000WU-E4
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:15 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f043ff82-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:51:12 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qvfDa-00GPM5-1F; Wed, 25 Oct 2023 14:50:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDZ-002dFL-0k; Wed, 25 Oct 2023 15:50:45 +0100
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
X-Inumbo-ID: f043ff82-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=iaeDXSTaoWdCm87GDHXDzDikArDTOfszjp92r6YPQM0=; b=Fpo2lDHmkFJFrEzTxCnYSHMQc+
	H+POf4RpTDXrqfi7zmTI2kpkXiZEJ/4ikVugJbl/UXMyulJnl8bxTi7gdq+Xlhe/NOsdTz353nXNS
	skhnTvQvc19bBykXDJLHjeBVQ97kJvOEjCn3zBqYb/BH5rDtwk6NqQC0EyXGhRuEVDofWOrIuQUbH
	eDXBfUYpNVxLjOjbdUpmFPsWWBCjffiEX876q5ArcW6FdlTHX93HUMDbaBkhxtxYaZxt/fpHXCNkE
	Ko/NceL/1GypeXooX+xxhcNkWMbOUUaDd3BrGGwo4s3+7LbNRB/e9K7vIixU+dnx+7J2jpuR7mvKp
	dd1Vd6Hw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v3 20/28] net: do not delete nics in net_cleanup()
Date: Wed, 25 Oct 2023 15:50:34 +0100
Message-Id: <20231025145042.627381-21-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
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
2.40.1


