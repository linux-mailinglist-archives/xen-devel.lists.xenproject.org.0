Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A95A0F73
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 13:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393319.632187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBDX-0003eI-4j; Thu, 25 Aug 2022 11:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393319.632187; Thu, 25 Aug 2022 11:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBDX-0003c2-1q; Thu, 25 Aug 2022 11:40:11 +0000
Received: by outflank-mailman (input) for mailman id 393319;
 Thu, 25 Aug 2022 11:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K3TS=Y5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oRBDV-0003bw-Ao
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 11:40:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a710a0de-246a-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 13:40:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2240D33FAB;
 Thu, 25 Aug 2022 11:40:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D754213517;
 Thu, 25 Aug 2022 11:40:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wBBAM5VfB2OhfwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Aug 2022 11:40:05 +0000
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a710a0de-246a-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661427606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dwYP6pNMJ0bm8xlxtVpMlGoTLHlcq559EPLF7XX0wWg=;
	b=C+MPh8mLFnN9CLM7FjKQOWdgVZYRDFXFB5CoDv9yeClqcY0jYdkWN9NppQSYqOGtsFRPo9
	llIVVfYKHqCMkvMFoXXzJLHOUxQsCIuE1TSrgfoXYc80a6jPEMgghctgM2MdCM7R3fZLqu
	fsBv5JQ9zYRfGwnkpB3TE73sX55oOoM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	stable@vger.kernel.org,
	Rustam Subkhankulov <subkhankulov@ispras.ru>
Subject: [PATCH v3] xen/privcmd: fix error exit of privcmd_ioctl_dm_op()
Date: Thu, 25 Aug 2022 13:40:04 +0200
Message-Id: <20220825114004.24843-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error exit of privcmd_ioctl_dm_op() is calling unlock_pages()
potentially with pages being NULL, leading to a NULL dereference.

Additionally lock_pages() doesn't check for pin_user_pages_fast()
having been completely successful, resulting in potentially not
locking all pages into memory. This could result in sporadic failures
when using the related memory in user mode.

Fix all of that by calling unlock_pages() always with the real number
of pinned pages, which will be zero in case pages being NULL, and by
checking the number of pages pinned by pin_user_pages_fast() matching
the expected number of pages.

Cc: <stable@vger.kernel.org>
Fixes: ab520be8cd5d ("xen/privcmd: Add IOCTL_PRIVCMD_DM_OP")
Reported-by: Rustam Subkhankulov <subkhankulov@ispras.ru>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use "pinned" as parameter for unlock_pages() (Jan Beulich)
- drop label "unlock" again (Jan Beulich)
- add check for complete success of pin_user_pages_fast()
V3:
- continue after partial success of pin_user_pages_fast() (Jan Beulich)
---
 drivers/xen/privcmd.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 3369734108af..1ca7e3ea6fd4 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -581,7 +581,7 @@ static int lock_pages(
 	struct privcmd_dm_op_buf kbufs[], unsigned int num,
 	struct page *pages[], unsigned int nr_pages, unsigned int *pinned)
 {
-	unsigned int i;
+	unsigned int i, off = 0;
 
 	for (i = 0; i < num; i++) {
 		unsigned int requested;
@@ -589,19 +589,23 @@ static int lock_pages(
 
 		requested = DIV_ROUND_UP(
 			offset_in_page(kbufs[i].uptr) + kbufs[i].size,
-			PAGE_SIZE);
+			PAGE_SIZE) - off;
 		if (requested > nr_pages)
 			return -ENOSPC;
 
 		page_count = pin_user_pages_fast(
-			(unsigned long) kbufs[i].uptr,
+			(unsigned long)kbufs[i].uptr + off * PAGE_SIZE,
 			requested, FOLL_WRITE, pages);
-		if (page_count < 0)
-			return page_count;
+		if (page_count <= 0)
+			return page_count ? : -EFAULT;
 
 		*pinned += page_count;
 		nr_pages -= page_count;
 		pages += page_count;
+
+		off = requested - page_count;
+		if (off)
+			i--;
 	}
 
 	return 0;
@@ -677,10 +681,8 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 	}
 
 	rc = lock_pages(kbufs, kdata.num, pages, nr_pages, &pinned);
-	if (rc < 0) {
-		nr_pages = pinned;
+	if (rc < 0)
 		goto out;
-	}
 
 	for (i = 0; i < kdata.num; i++) {
 		set_xen_guest_handle(xbufs[i].h, kbufs[i].uptr);
@@ -692,7 +694,7 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 	xen_preemptible_hcall_end();
 
 out:
-	unlock_pages(pages, nr_pages);
+	unlock_pages(pages, pinned);
 	kfree(xbufs);
 	kfree(pages);
 	kfree(kbufs);
-- 
2.35.3


