Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A67CCA9A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 20:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618334.961885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsolv-0006Ys-3A; Tue, 17 Oct 2023 18:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618334.961885; Tue, 17 Oct 2023 18:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsolu-0006WD-VO; Tue, 17 Oct 2023 18:26:26 +0000
Received: by outflank-mailman (input) for mailman id 618334;
 Tue, 17 Oct 2023 18:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKvq=F7=desiato.srs.infradead.org=BATV+ff42024f62dfd72ba0d0+7359+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsols-0005jg-EN
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 18:26:24 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa86ec8f-6d1a-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 20:26:21 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qsolL-007II3-25; Tue, 17 Oct 2023 18:25:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsolI-000Pal-25; Tue, 17 Oct 2023 19:25:48 +0100
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
X-Inumbo-ID: aa86ec8f-6d1a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ASyx27ABg/WdxWXFMwdeXHtm2HUFOe8n8pbrbgV+R1U=; b=dCsAZYtU5oS750WARgfG1cbHbk
	bPq+UZ7bR809wKmsw6T/r5Nxzqx94zY+jrblkr53Fbw9QGaa0IdcMIDWC7gMM9f/2wG56EATB16YM
	6Cdyn/BVEQT8FmID+F6W4Do+H9HkX8Yx6y3050hlpOfC4WRRmLws8CV1sav8q1c3JvBJ1buZfhQ1b
	D7SbIvxrk3EDzcEPbzuFIPt/piSKj+wHOSdiGhorqpUF3KFolMfYdOAF71tj/YcAZF/QvMnkDo0kt
	wNcmRNEUqWWlcIWAgKAiCrsr8NFVyln/wn+h28XuAME3OeO+FgYtDeHIGbHAG+XixHHmENkN4g5m3
	E+1fmYTg==;
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
Subject: [PATCH 1/4] hw/xen: only remove peers of PCI NICs on unplug
Date: Tue, 17 Oct 2023 19:25:42 +0100
Message-Id: <20231017182545.97973-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017182545.97973-1-dwmw2@infradead.org>
References: <20231017182545.97973-1-dwmw2@infradead.org>
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


