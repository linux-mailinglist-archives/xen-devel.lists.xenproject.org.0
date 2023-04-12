Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7CE6DFDFE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520315.807797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfYz-0002vS-5h; Wed, 12 Apr 2023 18:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520315.807797; Wed, 12 Apr 2023 18:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfYz-0002tL-26; Wed, 12 Apr 2023 18:51:25 +0000
Received: by outflank-mailman (input) for mailman id 520315;
 Wed, 12 Apr 2023 18:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ni7i=AD=desiato.srs.infradead.org=BATV+dd6f636cd48703d0a954+7171+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pmfYx-0001qS-Kg
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:51:24 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 045f501b-d963-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 20:51:22 +0200 (CEST)
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pmfYf-00E0VL-3D; Wed, 12 Apr 2023 18:51:06 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1H-1y; Wed, 12 Apr 2023 19:51:04 +0100
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
X-Inumbo-ID: 045f501b-d963-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Xa7ooeKNSf+k8dNFDJzvKocJu/52pawuc5iQqeYJl9c=; b=nxQF+PYllY75sHqovcNk2BH4Gi
	RpVSWDgHzGp6LR/J9XHEZ/8NcMhK+wvi2yYuhn1/gaMykPZ42EuBEZDwbpl+7j+9ffR82KtYbpKHp
	jDMpMfdHfLyMA6cWiFQ9a+98ywwxU3E4Ks45R78pIEPXpoIkT8fg91nyZVcDyzekRslNMu+N3+Dmi
	vWtqtkYz9VGIPOJ6qJHf/pF+xK8y0jdGcEwCDtzTR1tSBnHGNjIVmY6iljd5SJMmR7UXzcXXwRDsC
	ZEJtD3rZKBTKNS1GAyETt1GMxjt9mnIJoRAy5zmBRb9118HdiHPaxBwJA1NYFEIvolFPS+Z3L+hAX
	p3eq+52w==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/5] hw/xen: Fix memory leak in libxenstore_open() for Xen
Date: Wed, 12 Apr 2023 19:50:59 +0100
Message-Id: <20230412185102.441523-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
References: <20230412185102.441523-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

There was a superfluous allocation of the XS handle, leading to it
being leaked on both the error path and the success path (where it gets
allocated again).

Spotted by Coverity (CID 1508098).

Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/xen/xen-operations.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index 4b78fbf4bd..3d213d28df 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -287,7 +287,7 @@ static void watch_event(void *opaque)
 static struct qemu_xs_handle *libxenstore_open(void)
 {
     struct xs_handle *xsh = xs_open(0);
-    struct qemu_xs_handle *h = g_new0(struct qemu_xs_handle, 1);
+    struct qemu_xs_handle *h;
 
     if (!xsh) {
         return NULL;
-- 
2.39.2


