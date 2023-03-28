Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3834A6CB9BC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 10:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515592.798611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph4xo-0007gs-3f; Tue, 28 Mar 2023 08:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515592.798611; Tue, 28 Mar 2023 08:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph4xo-0007dr-0W; Tue, 28 Mar 2023 08:45:56 +0000
Received: by outflank-mailman (input) for mailman id 515592;
 Tue, 28 Mar 2023 08:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLKu=7U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ph4xn-0007dl-1a
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 08:45:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f11550a9-cd44-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 10:45:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5E36219CB;
 Tue, 28 Mar 2023 08:45:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B38E31390D;
 Tue, 28 Mar 2023 08:45:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RdNgKj6pImThLgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Mar 2023 08:45:50 +0000
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
X-Inumbo-ID: f11550a9-cd44-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679993150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yXUBjKrqwM53T7UrMckHmjpZFpuDk2TlKdZU+l+grfw=;
	b=fJXUKWANRW8UbMDWIBWa1Ugqequ8HMpEy8gvoVbpd6zkULAMbQGG4p9jGgHdqu6qTdxLhc
	46qW60UcAgbI86aHUuh8Utl7D1GVZkBPPdOIqW5XcHq1NFUqRVZGRbgoBwPsx68xwhMFHV
	KFpMEV+ONinzbFqgbDt2HwSgfcmEXwg=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] xen/pciback: don't call pcistub_device_put() under lock
Date: Tue, 28 Mar 2023 10:45:49 +0200
Message-Id: <20230328084549.20695-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcistub_device_put() shouldn't be called under spinlock, as it can
sleep.

For this reason pcistub_device_get_pci_dev() needs to be modified:
instead of always calling pcistub_device_get() just do the call of
pcistub_device_get() only if it is really needed. This removes the
need to call pcistub_device_put().

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/lkml/Y+JUIl64UDmdkboh@kadam/
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xen-pciback/pci_stub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index bba527620507..e34b623e4b41 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -194,8 +194,6 @@ static struct pci_dev *pcistub_device_get_pci_dev(struct xen_pcibk_device *pdev,
 	struct pci_dev *pci_dev = NULL;
 	unsigned long flags;
 
-	pcistub_device_get(psdev);
-
 	spin_lock_irqsave(&psdev->lock, flags);
 	if (!psdev->pdev) {
 		psdev->pdev = pdev;
@@ -203,8 +201,8 @@ static struct pci_dev *pcistub_device_get_pci_dev(struct xen_pcibk_device *pdev,
 	}
 	spin_unlock_irqrestore(&psdev->lock, flags);
 
-	if (!pci_dev)
-		pcistub_device_put(psdev);
+	if (pci_dev)
+		pcistub_device_get(psdev);
 
 	return pci_dev;
 }
-- 
2.35.3


