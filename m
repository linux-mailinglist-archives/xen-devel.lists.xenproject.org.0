Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B1C7E1E8D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 11:40:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627877.978744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1g-00018Z-RI; Mon, 06 Nov 2023 10:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627877.978744; Mon, 06 Nov 2023 10:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1g-00013Y-J3; Mon, 06 Nov 2023 10:40:12 +0000
Received: by outflank-mailman (input) for mailman id 627877;
 Mon, 06 Nov 2023 10:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qzx1f-00010s-1h
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 10:40:11 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9cf4d07-7c90-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 11:40:07 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qzx1P-005R1j-Rh; Mon, 06 Nov 2023 10:39:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1qzx1Q-000qGL-0i; Mon, 06 Nov 2023 10:39:56 +0000
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
X-Inumbo-ID: d9cf4d07-7c90-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4uz818AY0/m+FRzGeIhGz1ZTqpxzLihnWApmCN46dps=; b=fKwQs5UAJQKDc4KMhJikM8x0P+
	jPOTGf+YxCgZTG/biDh3QzX3JwAbu0gE40tBY8XR/RZ3HilkTvWvdgtoMbVM/GryZUjrqPv/srYx4
	+ipkc9VhfDcYvAyXEPUXUUHSwPPlvgV05kdutHUN0YQWlbfVFPhtzdPr9P3gzllPa+c2RQrgYl6xO
	6BYbsvGDvWMmLVvsAho+MJkjTcjB/wbjsPkkpXi882fTxrvbre3s1QCQSJw92wKxWoLxH0GOWQ49U
	osQBPzD5cm4z9Xb9QrnOHQjCv0800KW3Xgu428Cxh5JoUgybYy4O1wohQagI+6cxYjmo5Ua7CiFYT
	qbjp+IOg==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	kvm@vger.kernel.org
Subject: [PULL 7/7] hw/xen: use correct default protocol for xen-block on x86
Date: Mon,  6 Nov 2023 10:39:55 +0000
Message-ID: <20231106103955.200867-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106103955.200867-1-dwmw2@infradead.org>
References: <20231106103955.200867-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Even on x86_64 the default protocol is the x86-32 one if the guest doesn't
specifically ask for x86-64.

Cc: qemu-stable@nongnu.org
Fixes: b6af8926fb85 ("xen: add implementations of xen-block connect and disconnect functions...")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/block/xen-block.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index a07cd7eb5d..bfa53960c3 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -115,9 +115,13 @@ static void xen_block_connect(XenDevice *xendev, Error **errp)
         return;
     }
 
-    if (xen_device_frontend_scanf(xendev, "protocol", "%ms",
-                                  &str) != 1) {
-        protocol = BLKIF_PROTOCOL_NATIVE;
+    if (xen_device_frontend_scanf(xendev, "protocol", "%ms", &str) != 1) {
+        /* x86 defaults to the 32-bit protocol even for 64-bit guests. */
+        if (object_dynamic_cast(OBJECT(qdev_get_machine()), "x86-machine")) {
+            protocol = BLKIF_PROTOCOL_X86_32;
+        } else {
+            protocol = BLKIF_PROTOCOL_NATIVE;
+        }
     } else {
         if (strcmp(str, XEN_IO_PROTO_ABI_X86_32) == 0) {
             protocol = BLKIF_PROTOCOL_X86_32;
-- 
2.41.0


