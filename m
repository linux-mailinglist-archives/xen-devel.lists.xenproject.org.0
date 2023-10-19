Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A17CFE41
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619409.964392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8j-0005wu-K1; Thu, 19 Oct 2023 15:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619409.964392; Thu, 19 Oct 2023 15:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8j-0005vC-Gs; Thu, 19 Oct 2023 15:40:49 +0000
Received: by outflank-mailman (input) for mailman id 619409;
 Thu, 19 Oct 2023 15:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Lg=GB=casper.srs.infradead.org=BATV+06ae5fa416ae820d9d5a+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8h-0005v1-Pw
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:40:48 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de5c7d8a-6e95-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 17:40:46 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qtV8N-007ot1-K0; Thu, 19 Oct 2023 15:40:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8N-000Pv5-0t; Thu, 19 Oct 2023 16:40:27 +0100
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
X-Inumbo-ID: de5c7d8a-6e95-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=iaeDXSTaoWdCm87GDHXDzDikArDTOfszjp92r6YPQM0=; b=i+jG3TmJBmY+zkUpHBdimsG7cq
	7p0LDLP5W7wK0hCX+CeYTknNp1J5rK1m0dyVJ6+T831ZnUgVu7V/UMwvxU4q9P/StzXIiLSxKYXt+
	VMW8IT2l6P1NZhPDNqyPqseAATfVk971Z4Q833tnPE/Kf0gKrP1Zh7BH2U410KfSi6+In3MJ/SBHN
	TI/EBEeH4n9s2rgGYbRurAllX+cLnCc/AbH7JXqf+RQkFqXb5Gsj+sF+n9eRd8R3u0ifOIq4fjnwO
	UaJEe6dC5bT5fJJM/beY/4CRxmoL3A5t0gs90g5VnQEnfwbjcVqTva9L1r8vyFio0Kb/uknr+vsxl
	QdfW8f8A==;
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
Subject: [PATCH v2 21/24] net: do not delete nics in net_cleanup()
Date: Thu, 19 Oct 2023 16:40:17 +0100
Message-Id: <20231019154020.99080-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

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


