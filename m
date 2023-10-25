Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E619F7D6FB8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622965.970307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDv-0001PJ-6b; Wed, 25 Oct 2023 14:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622965.970307; Wed, 25 Oct 2023 14:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDv-0001N4-1J; Wed, 25 Oct 2023 14:51:07 +0000
Received: by outflank-mailman (input) for mailman id 622965;
 Wed, 25 Oct 2023 14:51:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJSz=GH=casper.srs.infradead.org=BATV+85b1c44ac99574f3713d+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfDs-0000WU-No
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:04 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9144c93-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:50:59 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvfDY-009Nma-Hc; Wed, 25 Oct 2023 14:50:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDY-002dEN-0Y; Wed, 25 Oct 2023 15:50:44 +0100
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
X-Inumbo-ID: e9144c93-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=I7wwUWDSmNrD50IckcuS/vpghKxFsMuU+uj7Ug/+mno=; b=RvDifJ46k3zOQxzO3K8gyXMav9
	h9wbWdHVLd9gbqWP/b4m/KQeTI2stcYxTPljdDzPt6hb7NbRhR2P0Z4xKNwxtgzxk3N2Igdu5kwqT
	AXV3Jx/OXlBhdliH0firkNh2O5qAZTR6XHzFMcLDeFRdKJoSGTYLHlhONm24s0uwaH0rDz1Fk/PGw
	3QtrkBftuCQR9gV2WZxNA4tVN+MG4Zja8lhsVua2l7qFzWDiSaHeANeDiYbCF+WoLyBNRQbkEgsY2
	OfZjG7o/oJkUjbPK3xppz5WL8MhBsZtqCyEEELWg6Dn7mGtZrcsYl+Wq2DQKqUo4lVF+bNWFOf8G7
	JSaqrwxg==;
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
Subject: [PATCH v3 07/28] hw/xen: use correct default protocol for xen-block on x86
Date: Wed, 25 Oct 2023 15:50:21 +0100
Message-Id: <20231025145042.627381-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Even on x86_64 the default protocol is the x86-32 one if the guest doesn't
specifically ask for x86-64.

Fixes: b6af8926fb85 ("xen: add implementations of xen-block connect and disconnect functions...")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/block/xen-block.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index a07cd7eb5d..64470fc579 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -117,7 +117,11 @@ static void xen_block_connect(XenDevice *xendev, Error **errp)
 
     if (xen_device_frontend_scanf(xendev, "protocol", "%ms",
                                   &str) != 1) {
-        protocol = BLKIF_PROTOCOL_NATIVE;
+        /* x86 defaults to the 32-bit protocol even for 64-bit guests. */
+        if (object_dynamic_cast(OBJECT(qdev_get_machine()), "x86-machine"))
+            protocol = BLKIF_PROTOCOL_X86_32;
+        else
+            protocol = BLKIF_PROTOCOL_NATIVE;
     } else {
         if (strcmp(str, XEN_IO_PROTO_ABI_X86_32) == 0) {
             protocol = BLKIF_PROTOCOL_X86_32;
-- 
2.40.1


