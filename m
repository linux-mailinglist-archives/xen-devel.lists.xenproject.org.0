Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7252759FD3F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392752.631302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrLy-0007Xp-VB; Wed, 24 Aug 2022 14:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392752.631302; Wed, 24 Aug 2022 14:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrLy-0007Uf-Ro; Wed, 24 Aug 2022 14:27:34 +0000
Received: by outflank-mailman (input) for mailman id 392752;
 Wed, 24 Aug 2022 14:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQrLy-0007UV-2L
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:27:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4431c91-23b8-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 16:27:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A88F20447;
 Wed, 24 Aug 2022 14:27:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45DB313AC0;
 Wed, 24 Aug 2022 14:27:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HPKUD1Q1BmN+BgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 14:27:32 +0000
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
X-Inumbo-ID: e4431c91-23b8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661351252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Yi2ZNad6kgMz/6PldXnNjKbyPX0uHyJxaAqhAA//dfo=;
	b=FUHgHgR1V9zX7w8l+rS/yI6QH5Cqpo1omm+unoLQLUz1Agf/U8G0GH+Rst0xcKAH7lzsjk
	WW2yUOBSNUBidc8jsqDa2505hNaY1Y3VQdrrVrKa3yfUZ9TqhJkdRLZZWorEiDi7CjwLT/
	/fUsx7qp6AbarPHI8pxMGwt7b3Yzc/U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	stable@vger.kernel.org,
	Rustam Subkhankulov <subkhankulov@ispras.ru>
Subject: [PATCH] xen/privcmd: fix error exit of privcmd_ioctl_dm_op()
Date: Wed, 24 Aug 2022 16:26:34 +0200
Message-Id: <20220824142634.20966-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error exit of privcmd_ioctl_dm_op() is calling unlock_pages()
potentially with pages being NULL, leading to a NULL dereference.

Fix that by calling unlock_pages only if lock_pages() was at least
partially successful.

Cc: <stable@vger.kernel.org>
Fixes: ab520be8cd5d ("xen/privcmd: Add IOCTL_PRIVCMD_DM_OP")
Reported-by: Rustam Subkhankulov <subkhankulov@ispras.ru>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/privcmd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 3369734108af..ec87968b4459 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -679,7 +679,7 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 	rc = lock_pages(kbufs, kdata.num, pages, nr_pages, &pinned);
 	if (rc < 0) {
 		nr_pages = pinned;
-		goto out;
+		goto unlock;
 	}
 
 	for (i = 0; i < kdata.num; i++) {
@@ -691,8 +691,9 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 	rc = HYPERVISOR_dm_op(kdata.dom, kdata.num, xbufs);
 	xen_preemptible_hcall_end();
 
-out:
+ unlock:
 	unlock_pages(pages, nr_pages);
+ out:
 	kfree(xbufs);
 	kfree(pages);
 	kfree(kbufs);
-- 
2.35.3


