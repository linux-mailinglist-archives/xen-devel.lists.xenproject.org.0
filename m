Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F27CFE44
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619425.964533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8x-00017o-Ea; Thu, 19 Oct 2023 15:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619425.964533; Thu, 19 Oct 2023 15:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8w-0000ty-RM; Thu, 19 Oct 2023 15:41:02 +0000
Received: by outflank-mailman (input) for mailman id 619425;
 Thu, 19 Oct 2023 15:40:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Lg=GB=casper.srs.infradead.org=BATV+06ae5fa416ae820d9d5a+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8r-0006dc-Va
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:40:57 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3ac646c-6e95-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 17:40:54 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qtV8N-007osu-Ka; Thu, 19 Oct 2023 15:40:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8M-000Pun-2t; Thu, 19 Oct 2023 16:40:26 +0100
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
X-Inumbo-ID: e3ac646c-6e95-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ASyx27ABg/WdxWXFMwdeXHtm2HUFOe8n8pbrbgV+R1U=; b=Q+6ncjmIFo7hTNy+ZtPc79xrDg
	U0NPXNlvZPU1d6HeGintbbtqvIYEobGpIB0sVq48i90OOnNVC0x5hreYF3WC+S7oFhdU/13C0cLWM
	UrhTnsczsHoP4H+j6SHuGqaEn2fGYbMjx7xUkY9vRx883FDUmsO01FIdAmlwBby8fb35TEO/07CkS
	4au4CXHmp+EBgIGBx39jcVmNxzfU0dKzcCq80PArVikh/em2Z8PYOnQPSUv2S0RwM2XY7x4eVYYGR
	wbhOd/4VV4zgWXwR8ewuYpktTU6ZEdD0hc2QTnjpwZ4IEaguUj3sAUgXLdwxiyp7sVTNcpGVQwFAF
	xn1VjjWw==;
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
Subject: [PATCH v2 17/24] hw/xen: only remove peers of PCI NICs on unplug
Date: Thu, 19 Oct 2023 16:40:13 +0100
Message-Id: <20231019154020.99080-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

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


