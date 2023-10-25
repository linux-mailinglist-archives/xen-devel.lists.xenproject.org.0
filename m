Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99C97D6FC2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:51:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622976.970407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfEA-0004oL-A7; Wed, 25 Oct 2023 14:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622976.970407; Wed, 25 Oct 2023 14:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfEA-0004kL-4i; Wed, 25 Oct 2023 14:51:22 +0000
Received: by outflank-mailman (input) for mailman id 622976;
 Wed, 25 Oct 2023 14:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7q9=GH=desiato.srs.infradead.org=BATV+fe87d11d956b9f6f1554+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfE8-0008W8-BO
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:20 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f518d2eb-7345-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 16:51:19 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qvfDa-00GPM3-1E; Wed, 25 Oct 2023 14:50:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDZ-002dFB-0E; Wed, 25 Oct 2023 15:50:45 +0100
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
X-Inumbo-ID: f518d2eb-7345-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ASyx27ABg/WdxWXFMwdeXHtm2HUFOe8n8pbrbgV+R1U=; b=KSw3c28aYsIp9zBAi8cllWWDpi
	K8vfkVYz6/oGDNu+k4/VRrApYRSLjOfuKlvOwBUVg9jYOF+gWouYRyma5JLfDxUpY1onGCtNGKQpF
	zBsNj3EUDXg0QWtWYUPvY8uBRIl54dJgWQvWuC8EvuOKw6VRy1J5bsJjkNwyijb/fI6mRiUfwhjVr
	OvRtBYcurzH/qFdJ06Lnsu0ODcytGK3P/g3Yqk3V1hxBDbf4R/qHZHjO+ItsHl7JrxZ/wE1tPEl0Q
	SroVpabcjcZWsiltYy0DIQdggLoMb/3M7L35Jlh++igC9qdxOa4z4pbQiGOsgSw1X5wI0fL9zweFf
	32KoOv9A==;
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
Subject: [PATCH v3 18/28] hw/xen: only remove peers of PCI NICs on unplug
Date: Wed, 25 Oct 2023 15:50:32 +0100
Message-Id: <20231025145042.627381-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

When the Xen guest asks to unplug *emulated* NICs, it's kind of unhelpful
also to unplug the peer of the *Xen* PV NIC.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/xen/xen_platform.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 17457ff3de..e2dd1b536a 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -140,9 +140,14 @@ static void unplug_nic(PCIBus *b, PCIDevice *d, void *o)
 /* Remove the peer of the NIC device. Normally, this would be a tap device. */
 static void del_nic_peer(NICState *nic, void *opaque)
 {
-    NetClientState *nc;
+    NetClientState *nc = qemu_get_queue(nic);
+    ObjectClass *klass = module_object_class_by_name(nc->model);
+
+    /* Only delete peers of PCI NICs that we're about to delete */
+    if (!klass || !object_class_dynamic_cast(klass, TYPE_PCI_DEVICE)) {
+        return;
+    }
 
-    nc = qemu_get_queue(nic);
     if (nc->peer)
         qemu_del_net_client(nc->peer);
 }
-- 
2.40.1


