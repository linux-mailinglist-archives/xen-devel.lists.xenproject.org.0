Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3E7E2755
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 15:43:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628097.979218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00pN-0000zH-FK; Mon, 06 Nov 2023 14:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628097.979218; Mon, 06 Nov 2023 14:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00pN-0000t4-6O; Mon, 06 Nov 2023 14:43:45 +0000
Received: by outflank-mailman (input) for mailman id 628097;
 Mon, 06 Nov 2023 14:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wwoJ=GT=infradead.org=prvs=667a8cc2a=dwmw2@srs-se1.protection.inumbo.net>)
 id 1r00i8-0008Lv-32
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:36:16 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6d37267-7cb1-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 15:36:15 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-b538c141.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 14:36:14 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1e-m6i4x-b538c141.us-east-1.amazon.com (Postfix)
 with ESMTPS id AAC23A2579; Mon,  6 Nov 2023 14:36:05 +0000 (UTC)
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:16675]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.28.94:2525]
 with esmtp (Farcaster)
 id deb27e6d-8725-48a3-a146-4d3938248c61; Mon, 6 Nov 2023 14:36:05 +0000 (UTC)
Received: from EX19EXOUWC001.ant.amazon.com (10.250.64.135) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 14:35:49 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19EXOUWC001.ant.amazon.com (10.250.64.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Mon, 6 Nov 2023 14:35:48 +0000
Received: from u3832b3a9db3152.ant.amazon.com (10.106.83.6) by
 mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Mon, 6 Nov 2023 14:35:45 +0000
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
X-Inumbo-ID: d6d37267-7cb1-11ee-98da-6d05b1d4d9a1
X-IronPort-AV: E=Sophos;i="6.03,281,1694736000"; 
   d="scan'208";a="366329806"
X-Farcaster-Flow-ID: deb27e6d-8725-48a3-a146-4d3938248c61
From: David Woodhouse <dwmw2@infradead.org>
To: <qemu-devel@nongnu.org>
CC: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, <qemu-block@nongnu.org>,
	<xen-devel@lists.xenproject.org>, <kvm@vger.kernel.org>
Subject: [PATCH v4 11/17] hw/xen: only remove peers of PCI NICs on unplug
Date: Mon, 6 Nov 2023 14:35:01 +0000
Message-ID: <20231106143507.1060610-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106143507.1060610-1-dwmw2@infradead.org>
References: <20231106143507.1060610-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: David Woodhouse <dwmw@amazon.co.uk>

When the Xen guest asks to unplug *emulated* NICs, it's kind of unhelpful
also to unplug the peer of the *Xen* PV NIC.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
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
2.34.1


