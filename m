Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A810E5F6186
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 09:15:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416627.661288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogL6C-0004e8-SS; Thu, 06 Oct 2022 07:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416627.661288; Thu, 06 Oct 2022 07:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogL6C-0004bN-OD; Thu, 06 Oct 2022 07:15:16 +0000
Received: by outflank-mailman (input) for mailman id 416627;
 Thu, 06 Oct 2022 07:15:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogL6B-0004aP-QI
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 07:15:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f7e7a24-4546-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 09:15:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 547FD1F8C8;
 Thu,  6 Oct 2022 07:15:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 17F3B1376E;
 Thu,  6 Oct 2022 07:15:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7+JTBIKAPmM+EwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Oct 2022 07:15:14 +0000
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
X-Inumbo-ID: 9f7e7a24-4546-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665040514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CshijtaHr92stGSDZHMzCA/tn87geqWqdgj21TRuNc=;
	b=XcbUCD9o3PCb96W7Lx2pJ43DcJkjWoXykE9e7nTT/kS3m1zFb9YDxpuUVs2na45rQC+PCh
	sSh5iPuz1gLVgaZnLLoLdLvXZkXtz3YLIoZEYeZhhm6DGcwghEs1QYGawjNYkSah65JQsq
	EYuLVLQs3J+dFpZRCHv148T+yFFyXM4=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/3] xen/virtio: use dom0 as default backend for CONFIG_XEN_VIRTIO_FORCE_GRANT
Date: Thu,  6 Oct 2022 09:14:59 +0200
Message-Id: <20221006071500.15689-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221006071500.15689-1-jgross@suse.com>
References: <20221006071500.15689-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_XEN_VIRTIO_FORCE_GRANT set the default backend domid to 0,
enabling to use xen_grant_dma_ops for those devices.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/grant-dma-ops.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index f29759d5301f..a00112235877 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -349,6 +349,9 @@ void xen_grant_setup_dma_ops(struct device *dev)
 	if (dev->of_node) {
 		if (xen_dt_grant_setup_dma_ops(dev, data))
 			goto err;
+	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)) {
+		dev_info(dev, "Using dom0 as backend\n");
+		data->backend_domid = 0;
 	} else {
 		/* XXX ACPI device unsupported for now */
 		goto err;
-- 
2.35.3


