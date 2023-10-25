Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF567D702C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623029.970456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfJ6-0004Hd-Tb; Wed, 25 Oct 2023 14:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623029.970456; Wed, 25 Oct 2023 14:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfJ6-0004F8-Ql; Wed, 25 Oct 2023 14:56:28 +0000
Received: by outflank-mailman (input) for mailman id 623029;
 Wed, 25 Oct 2023 14:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7q9=GH=desiato.srs.infradead.org=BATV+fe87d11d956b9f6f1554+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfE8-0000WU-Da
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:20 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3d0b1d2-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:51:17 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qvfDa-00GPM6-1D; Wed, 25 Oct 2023 14:50:52 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDZ-002dFU-1H; Wed, 25 Oct 2023 15:50:45 +0100
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
X-Inumbo-ID: f3d0b1d2-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SKjWRXIgiNg5ff3bqQvSLiVcvlPitO7cHPHfc8XhUXU=; b=i2fwrV8zZ2vjfC4alhYHqho5Kg
	69ItbcjuoufZl6Gv9FMYnIEB1jR+EI2qtRRyqdOFgFYEK1LzG6KxP647hv5/G6my2/D3e1Nf518Bs
	bpsvnspf+G1TgFmvc69VdUs+xMWSbH3w/d4GIgFwg5c42Bt8j3HQ0PB1C/Uw/bTNjij8N3BLhn+ME
	sAQG8vSqxTsmOj0rSVeluMyopsAtLcdgMvZEUnRoZLqQP3/BB165JjV78qWqWj2nFaH3b3IQwlvyc
	qdKCIT24XkYpjsTqPbsyzvjsef9hJe/F4fTkTDMQPAPKlnUOqPmS4ZrhiS0hKFMIO3E4buVrrQeEB
	WiLXn9OQ==;
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
Subject: [PATCH v3 22/28] net: add qemu_{configure,create}_nic_device(), qemu_find_nic_info()
Date: Wed, 25 Oct 2023 15:50:36 +0100
Message-Id: <20231025145042.627381-23-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Most code which directly accesses nd_table[] and nb_nics uses them for
one of two things. Either "I have created a NIC device and I'd like a
configuration for it", or "I will create a NIC device *if* there is a
configuration for it".  With some variants on the theme around whether
they actually *check* if the model specified in the configuration is
the right one.

Provide functions which perform both of those, allowing platforms to
be a little more consistent and as a step towards making nd_table[]
and nb_nics private to the net code.

Also export the qemu_find_nic_info() helper, as some platforms have
special cases they need to handle.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/net/net.h |  7 ++++++-
 net/net.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/include/net/net.h b/include/net/net.h
index 2fb1c9181c..56be694c75 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -205,7 +205,12 @@ int qemu_show_nic_models(const char *arg, const char *const *models);
 void qemu_check_nic_model(NICInfo *nd, const char *model);
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
                         const char *default_model);
-
+NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
+                            const char *alias);
+bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
+                               const char *alias);
+DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
+                                    const char *alias);
 void print_net_client(Monitor *mon, NetClientState *nc);
 void net_socket_rs_init(SocketReadState *rs,
                         SocketReadStateFinalize *finalize,
diff --git a/net/net.c b/net/net.c
index bbe33da176..f8b4973a1e 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1072,6 +1072,57 @@ static int net_init_nic(const Netdev *netdev, const char *name,
     return idx;
 }
 
+NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
+                            const char *alias)
+{
+    NICInfo *nd;
+    int i;
+
+    for (i = 0; i < nb_nics; i++) {
+        nd = &nd_table[i];
+
+        if (!nd->used || nd->instantiated) {
+            continue;
+        }
+
+        if ((match_default && !nd->model) || !g_strcmp0(nd->model, typename)
+            || (alias && !g_strcmp0(nd->model, alias))) {
+            return nd;
+        }
+    }
+    return NULL;
+}
+
+
+/* "I have created a device. Please configure it if you can" */
+bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
+                               const char *alias)
+{
+    NICInfo *nd = qemu_find_nic_info(object_get_typename(OBJECT(dev)),
+                                     match_default, alias);
+
+    if (nd) {
+        qdev_set_nic_properties(dev, nd);
+        return true;
+    }
+    return false;
+}
+
+/* "Please create a device, if you have a configuration for it" */
+DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
+                                    const char *alias)
+{
+    NICInfo *nd = qemu_find_nic_info(typename, match_default, alias);
+    DeviceState *dev;
+
+    if (!nd) {
+        return NULL;
+    }
+
+    dev = qdev_new(typename);
+    qdev_set_nic_properties(dev, nd);
+    return dev;
+}
 
 static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
     const Netdev *netdev,
-- 
2.40.1


