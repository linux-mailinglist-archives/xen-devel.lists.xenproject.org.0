Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F179A7EC9A6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 18:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633811.988884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Jg0-0003MS-DK; Wed, 15 Nov 2023 17:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633811.988884; Wed, 15 Nov 2023 17:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Jg0-0003If-3W; Wed, 15 Nov 2023 17:27:44 +0000
Received: by outflank-mailman (input) for mailman id 633811;
 Wed, 15 Nov 2023 17:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ynSk=G4=desiato.srs.infradead.org=BATV+a72437c23eaab18a7e37+7388+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r3Jfy-00031y-AT
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 17:27:42 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44a6bfc0-83dc-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 18:27:38 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r3Jfi-004Bc2-26; Wed, 15 Nov 2023 17:27:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r3Jfh-004sFL-16; Wed, 15 Nov 2023 17:27:25 +0000
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
X-Inumbo-ID: 44a6bfc0-83dc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=iJEkdS0pn0NaWuyuJa10RygKkR2b5taCeZjDdDEb+V8=; b=kAKl+Xku2nRKfIhSLPH3+fjd8S
	PIIIAjYbVjC4xBDHZaXNvD0z9x58yFQGqYFlfOnrlK+4kceqKQqBzVf/04nDaW7UNNcPAq7CN3GON
	53EQfv1KL4qKFIxx1w0US+jxdYqvXc7rz+VeWnWsY6SMjejou4sfApYbzAtwVZtc+xAb7CnxLZO8h
	fGQ4l0vEe7cWQ+BAJAboVAzNGMLlBX3Azmy5PcL6SK0RsmpuFWKpXr02LRE5FrafLzTVJHR/q/xlr
	/DjObAZMr4mskpzSgSE0g6R8w8U3d6Pj9cs6eGpjrhG0hEQEBZfInO3RbFgBLxC6gPbX0LxKhDsjk
	P2AENoUQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: [PATCH 3/3] hw/xen: clean up xen_block_find_free_vdev() to avoid Coverity false positive
Date: Wed, 15 Nov 2023 17:24:37 +0000
Message-ID: <20231115172723.1161679-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115172723.1161679-1-dwmw2@infradead.org>
References: <20231115172723.1161679-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Coverity couldn't see that nr_existing was always going to be zero when
qemu_xen_xs_directory() returned NULL in the ENOENT case (CID 1523906).

Perhaps more to the point, neither could Peter at first glance. Improve
the code to hopefully make it clearer to Coverity and human reviewers
alike.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/block/xen-block.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 6d64ede94f..aed1d5c330 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -91,9 +91,27 @@ static bool xen_block_find_free_vdev(XenBlockDevice *blockdev, Error **errp)
 
     existing_frontends = qemu_xen_xs_directory(xenbus->xsh, XBT_NULL, fe_path,
                                                &nr_existing);
-    if (!existing_frontends && errno != ENOENT) {
-        error_setg_errno(errp, errno, "cannot read %s", fe_path);
-        return false;
+    if (!existing_frontends) {
+        if (errno == ENOENT) {
+            /*
+             * If the frontend directory doesn't exist because there are
+             * no existing vbd devices, that's fine. Just ensure that we
+             * don't dereference the NULL existing_frontends pointer, by
+             * checking that nr_existing is zero so the loop below is not
+             * entered.
+             *
+             * In fact this is redundant since nr_existing is initialized
+             * to zero, but setting it again here makes it abundantly clear
+             * to Coverity, and to the human reader who doesn't know the
+             * semantics of qemu_xen_xs_directory() off the top of their
+             * head.
+             */
+            nr_existing = 0;
+        } else {
+            /* All other errors accessing the frontend directory are fatal. */
+            error_setg_errno(errp, errno, "cannot read %s", fe_path);
+            return false;
+        }
     }
 
     memset(used_devs, 0, sizeof(used_devs));
-- 
2.41.0


