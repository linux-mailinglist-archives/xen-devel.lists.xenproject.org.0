Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9065B6DFDFF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520313.807778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfYv-0002Ny-N9; Wed, 12 Apr 2023 18:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520313.807778; Wed, 12 Apr 2023 18:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfYv-0002Lk-IF; Wed, 12 Apr 2023 18:51:21 +0000
Received: by outflank-mailman (input) for mailman id 520313;
 Wed, 12 Apr 2023 18:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3LfV=AD=casper.srs.infradead.org=BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pmfYt-0001qk-Q3
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:51:19 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00ceabaf-d963-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 20:51:16 +0200 (CEST)
Received: from [2001:8b0:10b:5::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pmfYf-0077lF-7n; Wed, 12 Apr 2023 18:51:05 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1V-2S; Wed, 12 Apr 2023 19:51:04 +0100
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
X-Inumbo-ID: 00ceabaf-d963-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NIk/dSGE1S/XkSMWglE5vSkIy2Aotr95wrmjXgO3qTE=; b=jjZUxe9t2zm5dC09PCwBEOxg1z
	joZy6jDOxzr1nMq4pNbcp3WLngm4pYpiqE8AoYSdmmYEq9kGeF6bv9Z2a4WWxpA7YiY0Xtz7jkDNZ
	VMLSp2/tDON07Uv3Yd4BFcaGPn27lWka2nduaqL3piYJyOoFIM7uSZqKzax8Kh6VsHdHz0zYgSqqO
	ILzM43hX1ULSuqD1DrDrzjbRoUwQetje20sfAqhL/5s+GMRopH8X5yY3w5y/cRZoRoZGcwy+b3i9P
	WZYW1Tl6JlHkIlCYN93JjtiITKBL2dr6Oz/qojqVcvQj/3dU01ZHLF4uYLj6QxJIzAGsOfpqp4I7B
	a9J7iXrQ==;
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
Subject: [PATCH 5/5] hw/xen: Fix broken check for invalid state in xs_be_open()
Date: Wed, 12 Apr 2023 19:51:02 +0100
Message-Id: <20230412185102.441523-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
References: <20230412185102.441523-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Coverity points out that if (!s && !s->impl) isn't really what we intended
to do here. CID 1508131.

Fixes: 032475127225 ("hw/xen: Add emulated implementation of XenStore operations")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 900679af8a..65f91e87d7 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -1688,7 +1688,7 @@ static struct qemu_xs_handle *xs_be_open(void)
     XenXenstoreState *s = xen_xenstore_singleton;
     struct qemu_xs_handle *h;
 
-    if (!s && !s->impl) {
+    if (!s || !s->impl) {
         errno = -ENOSYS;
         return NULL;
     }
-- 
2.39.2


