Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD007CAD46
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617754.960742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNd-0003JI-Aq; Mon, 16 Oct 2023 15:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617754.960742; Mon, 16 Oct 2023 15:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPNd-0003Ag-6P; Mon, 16 Oct 2023 15:19:41 +0000
Received: by outflank-mailman (input) for mailman id 617754;
 Mon, 16 Oct 2023 15:19:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUCO=F6=desiato.srs.infradead.org=BATV+1bdf71eab2d76d13073e+7358+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qsPNZ-0001wj-Fo
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:19:38 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68999eb3-6c37-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 17:19:33 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qsPNB-0067AK-2I; Mon, 16 Oct 2023 15:19:15 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qsPNC-0005ni-0J; Mon, 16 Oct 2023 16:19:14 +0100
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
X-Inumbo-ID: 68999eb3-6c37-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8ikJQCC5TLkL7JR5JlTU3UpA6g8LaKWjgM9/evGEzFk=; b=aGOU43EkvyJiadbd3LlgugWndr
	4xurUA890xm0/ENhk99UVqAb54O6T00LyeHtXfR8m3GM6lFk6OtKRHZ5HDxMqzKrpTPqvg5curQTr
	rIV6Rucgz20nRUsiqKnlZowMUo/NLQs17ZwN1GSv1fANshFRCM9lfJKWuQM8Ra8d0q9BT36RFta0K
	HgM66p0WtsRQkI9a/yI/ofe75YSiQI0/JmLUayOl4LbMquRoXLqmWyDFtxA6W3xa50XAID32EGqMX
	D1y4MMKSArdJ+xYoB6kSbjUQ7fDqJ6/e+9bWR4mjrbKDiSh7b0s3OvJc+W87KuuuGX5pAcILS2i5L
	20Sx+dJw==;
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
Subject: [PATCH 10/12] hw/xen: automatically assign device index to console devices
Date: Mon, 16 Oct 2023 16:19:07 +0100
Message-Id: <20231016151909.22133-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231016151909.22133-1-dwmw2@infradead.org>
References: <20231016151909.22133-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Now that we can reliably tell whether a given device already exists, we
can allow the user to add console devices on the command line with just
'-device xen-console,chardev=foo'.

Start at 1, because we can't add the *primary* console; that's special
because the toolstack has to set up the guest end of that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/char/xen_console.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 2825b8c511..1a0f5ed3e1 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -333,6 +333,22 @@ static char *xen_console_get_name(XenDevice *xendev, Error **errp)
 {
     XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
 
+    if (con->dev == -1) {
+        char name[11];
+        int idx = 1;
+
+        /* Theoretically we could go up to INT_MAX here but that's overkill */
+        while (idx < 100) {
+            snprintf(name, sizeof(name), "%u", idx);
+            if (!xen_backend_exists("console", name)) {
+                con->dev = idx;
+                return g_strdup(name);
+            }
+            idx++;
+        }
+        error_setg(errp, "cannot find device index for console device");
+        return NULL;
+    }
     return g_strdup_printf("%u", con->dev);
 }
 
-- 
2.40.1


