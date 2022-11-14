Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3C7628271
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 15:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443381.697921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouaNP-0001R8-VU; Mon, 14 Nov 2022 14:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443381.697921; Mon, 14 Nov 2022 14:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouaNP-0001O1-SP; Mon, 14 Nov 2022 14:23:55 +0000
Received: by outflank-mailman (input) for mailman id 443381;
 Mon, 14 Nov 2022 14:23:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nftf=3O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ouaNN-0001Nv-Q3
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 14:23:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0072a96-6427-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 15:23:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B547620047;
 Mon, 14 Nov 2022 14:23:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8528113A92;
 Mon, 14 Nov 2022 14:23:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OwIAH3dPcmMtagAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Nov 2022 14:23:51 +0000
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
X-Inumbo-ID: f0072a96-6427-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1668435831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sAfl5fuNeiYw163kQkU47PxfF3Zja2zKggUEdCCcBhk=;
	b=gp8JXiltXKb1uWqjC2t5qQtcG7+F9MBrH/xUbap/0IPmp81Z94Iz2J/dS88U0CRcqLhWQV
	wTEvQEfHqi/kDIGYEh8ZGKJV6Es/bCBCLhtpO9FonmMEi/N9et6tYlBl/oV3YJbbAQPHDW
	xXQhut/guvd1A7piXFT6qk4zMoX7oLM=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen/platform-pci: use define instead of literal number
Date: Mon, 14 Nov 2022 15:23:48 +0100
Message-Id: <20221114142348.1499-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of "0x01" use the HVM_PARAM_CALLBACK_TYPE_PCI_INTX define from
the interface header in get_callback_via().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/platform-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index 18f0ed8b1f93..24a3de1b7b03 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -54,7 +54,8 @@ static uint64_t get_callback_via(struct pci_dev *pdev)
 	pin = pdev->pin;
 
 	/* We don't know the GSI. Specify the PCI INTx line instead. */
-	return ((uint64_t)0x01 << HVM_CALLBACK_VIA_TYPE_SHIFT) | /* PCI INTx identifier */
+	return ((uint64_t)HVM_PARAM_CALLBACK_TYPE_PCI_INTX <<
+			  HVM_CALLBACK_VIA_TYPE_SHIFT) |
 		((uint64_t)pci_domain_nr(pdev->bus) << 32) |
 		((uint64_t)pdev->bus->number << 16) |
 		((uint64_t)(pdev->devfn & 0xff) << 8) |
-- 
2.35.3


