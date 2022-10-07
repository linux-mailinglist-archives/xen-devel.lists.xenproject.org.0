Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5255F744C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 08:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417408.662125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogh3Y-00021f-EG; Fri, 07 Oct 2022 06:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417408.662125; Fri, 07 Oct 2022 06:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogh3Y-0001y5-AH; Fri, 07 Oct 2022 06:42:00 +0000
Received: by outflank-mailman (input) for mailman id 417408;
 Fri, 07 Oct 2022 06:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogh3W-0001dz-6k
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 06:41:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 237b29e6-460b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 08:41:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5BC7C21921;
 Fri,  7 Oct 2022 06:41:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26A1513A3D;
 Fri,  7 Oct 2022 06:41:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VkUHCDXKP2P2SQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Oct 2022 06:41:57 +0000
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
X-Inumbo-ID: 237b29e6-460b-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665124917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubZ+4Ck86Ph/G26SuwNF8h0CjJlNbh0F0U0WIgCgLNk=;
	b=u0B1gOZKRfVtDSiWXK3FHZ+7ZuhS2wNNXD2scXaLTkjdp0U2MWi81cz5CIcqR4f3bUYv8g
	jBnNrjXqx/FvjTozEfvlu2sla1YODh2H6SsLXM8Wx9NXvu+jcHK0gNago1wWy0qFR2qe/S
	z8XGz3kjUOzbP5zxy3/AUWO6neU04g0=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/3] xen/virtio: use dom0 as default backend for CONFIG_XEN_VIRTIO_FORCE_GRANT
Date: Fri,  7 Oct 2022 08:41:42 +0200
Message-Id: <20221007064143.10049-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221007064143.10049-1-jgross@suse.com>
References: <20221007064143.10049-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_XEN_VIRTIO_FORCE_GRANT set the default backend domid to 0,
enabling to use xen_grant_dma_ops for those devices.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/xen/grant-dma-ops.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 646ca913c05c..c703b77b33c9 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -349,6 +349,9 @@ void xen_grant_setup_dma_ops(struct device *dev)
 	if (dev->of_node) {
 		if (xen_dt_grant_init_backend_domid(dev, data))
 			goto err;
+	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT)) {
+		dev_info(dev, "Using dom0 as backend\n");
+		data->backend_domid = 0;
 	} else {
 		/* XXX ACPI device unsupported for now */
 		goto err;
-- 
2.35.3


