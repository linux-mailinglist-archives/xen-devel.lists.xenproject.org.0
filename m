Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B67CAD4A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617748.960688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNZ-0001zV-RI; Mon, 16 Oct 2023 15:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617748.960688; Mon, 16 Oct 2023 15:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNZ-0001x9-N7; Mon, 16 Oct 2023 15:19:37 +0000
Received: by outflank-mailman (input) for mailman id 617748;
 Mon, 16 Oct 2023 15:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yi9k=F6=casper.srs.infradead.org=BATV+ffd15938eba190e275bf+7358+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsPNX-0001wj-Pu
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:19:35 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67e39f91-6c37-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 17:19:32 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qsPNC-006lqa-6s; Mon, 16 Oct 2023 15:19:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsPNB-0005nO-2c; Mon, 16 Oct 2023 16:19:13 +0100
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
X-Inumbo-ID: 67e39f91-6c37-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=f7F9SDM1bUdOvNZpQs4iJJJk6zsJmxlOCqdnVelp0m8=; b=JI9Cp5t4Jep1lUjFFL+2rPgVxX
	C+t5NGWYH8UJ/aniIMYUBrCu0fIU9iTJ+vTpef8EEAB7SClGjGZM/EHHHHvzHfaviA3kVmuw1wCTJ
	N7L+3vVvqu10dZZELOd1F/uW8Zt80B+gQ/ZJhmZDGhB0DYFzJigrRm1rtICjhe0g+3KEYcdPGyHO9
	wYtpxo1U140xHjDKeY1hLWRucnyzVL4t3HlKbqhCq7zFNEb1R7eKbY7k1Xudw5PNi5r3ohP/2s063
	dGaCe88IwhB57Kh2/CRrEW4ABoisGKH9B0hgP5tyFACRikVrXcHTs55vFS4Nh/i/uiTWMq4zN+miS
	eO7T8Hpg==;
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
	David Woodhouse <dwmw2@infradead.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org
Subject: [PATCH 05/12] hw/xen: populate store frontend nodes with XenStore PFN/port
Date: Mon, 16 Oct 2023 16:19:02 +0100
Message-Id: <20231016151909.22133-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231016151909.22133-1-dwmw2@infradead.org>
References: <20231016151909.22133-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This is kind of redundant since without being able to get these through
ome other method (HVMOP_get_param) the guest wouldn't be able to access
XenStore in order to find them. But Xen populates them, and it does
allow guests to *rebind* to the event channel port after a reset.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index d2b311109b..3300e0614a 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -1432,6 +1432,7 @@ static void alloc_guest_port(XenXenstoreState *s)
 int xen_xenstore_reset(void)
 {
     XenXenstoreState *s = xen_xenstore_singleton;
+    GList *perms;
     int err;
 
     if (!s) {
@@ -1459,6 +1460,15 @@ int xen_xenstore_reset(void)
     }
     s->be_port = err;
 
+    /* Create frontend store nodes */
+    perms = g_list_append(NULL, xs_perm_as_string(XS_PERM_NONE, DOMID_QEMU));
+    perms = g_list_append(perms, xs_perm_as_string(XS_PERM_READ, xen_domid));
+
+    relpath_printf(s, perms, "store/ring-ref", "%lu", XEN_SPECIAL_PFN(XENSTORE));
+    relpath_printf(s, perms, "store/port", "%u", s->be_port);
+
+    g_list_free_full(perms, g_free);
+
     /*
      * We don't actually access the guest's page through the grant, because
      * this isn't real Xen, and we can just use the page we gave it in the
-- 
2.40.1


