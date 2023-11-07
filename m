Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD3F7E37A6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 10:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628633.980307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0IHu-0002UJ-2T; Tue, 07 Nov 2023 09:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628633.980307; Tue, 07 Nov 2023 09:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0IHt-0002NG-QZ; Tue, 07 Nov 2023 09:22:21 +0000
Received: by outflank-mailman (input) for mailman id 628633;
 Tue, 07 Nov 2023 09:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjcX=GU=casper.srs.infradead.org=BATV+0fd401c0b30749933da3+7380+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r0IHr-0001o6-Na
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 09:22:19 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24028d86-7d4f-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 10:22:15 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r0IHN-00BPkO-EG; Tue, 07 Nov 2023 09:21:50 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r0IHN-001hKA-2Y; Tue, 07 Nov 2023 09:21:49 +0000
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
X-Inumbo-ID: 24028d86-7d4f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JgU6E8czOnyEdFZ4KMWVk8ZUZQwhpS/SOzIrn/4R494=; b=MsrRHgDKexgi0vQ/h0LhcV2/MC
	c9fo4GUifP9KVpV8YMsNFHazYOTI9qqLgSOX2YiD93wJDPKV5l0SUFJVPFW396VwB+++58tVLgWdF
	OCq1KDrkrl64Co2Y4kmHnpzSDw4cwNHAKC7p6rLPLgtpnGKG4a3mWPVKBotcG8n5L88NThyr11ECC
	CiH6qCTRJo+Tnf1ilUQoGuExwt0JuHYfX+2pHUDoyPt9fU4DY8T15JdqAnK9WHGxwuAlxMKbglsk3
	H9EWfXn/mZPpSLG60Ee6v+fQ1gy7l2S9m/dR054eurI+E4E4BNrn/eOnlYK+C+I+7WBjcZyrd9S/p
	7N7+JdJQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
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
	kvm@vger.kernel.org
Subject: [PULL 05/15] hw/xen: populate store frontend nodes with XenStore PFN/port
Date: Tue,  7 Nov 2023 09:21:37 +0000
Message-ID: <20231107092149.404842-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107092149.404842-1-dwmw2@infradead.org>
References: <20231107092149.404842-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This is kind of redundant since without being able to get these through
some other method (HVMOP_get_param) the guest wouldn't be able to access
XenStore in order to find them.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_xenstore.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 831da535fc..b7c0407765 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -1434,6 +1434,7 @@ static void alloc_guest_port(XenXenstoreState *s)
 int xen_xenstore_reset(void)
 {
     XenXenstoreState *s = xen_xenstore_singleton;
+    GList *perms;
     int err;
 
     if (!s) {
@@ -1461,6 +1462,16 @@ int xen_xenstore_reset(void)
     }
     s->be_port = err;
 
+    /* Create frontend store nodes */
+    perms = g_list_append(NULL, xs_perm_as_string(XS_PERM_NONE, DOMID_QEMU));
+    perms = g_list_append(perms, xs_perm_as_string(XS_PERM_READ, xen_domid));
+
+    relpath_printf(s, perms, "store/port", "%u", s->guest_port);
+    relpath_printf(s, perms, "store/ring-ref", "%lu",
+                   XEN_SPECIAL_PFN(XENSTORE));
+
+    g_list_free_full(perms, g_free);
+
     /*
      * We don't actually access the guest's page through the grant, because
      * this isn't real Xen, and we can just use the page we gave it in the
-- 
2.41.0


