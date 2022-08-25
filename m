Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14D5A0C8E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 11:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393189.631979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR97q-0004i3-Bt; Thu, 25 Aug 2022 09:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393189.631979; Thu, 25 Aug 2022 09:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR97q-0004fR-8o; Thu, 25 Aug 2022 09:26:10 +0000
Received: by outflank-mailman (input) for mailman id 393189;
 Thu, 25 Aug 2022 09:26:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K3TS=Y5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oR97o-0004fL-Lk
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 09:26:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0989845-2457-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 11:26:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4081E5BCEF;
 Thu, 25 Aug 2022 09:26:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 059DC13517;
 Thu, 25 Aug 2022 09:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id luA+OypAB2M1RgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Aug 2022 09:26:02 +0000
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
X-Inumbo-ID: f0989845-2457-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661419563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BYfTZFURvyLCFYVU3ltFgIRHLc50Lkg36j+xzInhtWI=;
	b=qrtmchGnpdx4Li2CexVjMJHXy+6yN4kZSUZagt6K/wEDzX6fbtPxLO/TYsa0ADZmPk6Dkt
	K0+ZYizhPYlyPeCuLO6HdEAkq3cpYHG7QUUP+BVo8f0nR91Gcn3E9LNVZPgqPttUFJTOUk
	uepJ+vC6hOLcHab0OG+L32V3qNARRgs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	stable@vger.kernel.org,
	Rustam Subkhankulov <subkhankulov@ispras.ru>
Subject: [PATCH v2] xen/privcmd: fix error exit of privcmd_ioctl_dm_op()
Date: Thu, 25 Aug 2022 11:26:00 +0200
Message-Id: <20220825092600.7188-1-jgross@suse.com>
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
checking the number of patches pinned by pin_user_pages_fast()
matching the expected number of pages.

Cc: <stable@vger.kernel.org>
Fixes: ab520be8cd5d ("xen/privcmd: Add IOCTL_PRIVCMD_DM_OP")
Reported-by: Rustam Subkhankulov <subkhankulov@ispras.ru>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use "pinned" as parameter for unlock_pages() (Jan Beulich)
- drop label "unlock" again (Jan Beulich)
- add check for complete success of pin_user_pages_fast()
---
 drivers/xen/privcmd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 3369734108af..7dc62510635e 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -602,6 +602,10 @@ static int lock_pages(
 		*pinned += page_count;
 		nr_pages -= page_count;
 		pages += page_count;
+
+		/* Exact reason isn't known, EFAULT is one possibility. */
+		if (page_count < requested)
+			return -EFAULT;
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


