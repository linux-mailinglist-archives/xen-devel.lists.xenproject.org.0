Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF776CD3EB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 10:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516098.799671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQlw-00030m-Gw; Wed, 29 Mar 2023 08:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516098.799671; Wed, 29 Mar 2023 08:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQlw-0002xu-DJ; Wed, 29 Mar 2023 08:03:08 +0000
Received: by outflank-mailman (input) for mailman id 516098;
 Wed, 29 Mar 2023 08:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i+Ld=7V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phQlv-0002xm-3Z
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 08:03:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21d3d7c8-ce08-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 10:03:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A91031FE0C;
 Wed, 29 Mar 2023 08:03:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5602A139D3;
 Wed, 29 Mar 2023 08:03:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gP+dE7fwI2QLVAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 29 Mar 2023 08:03:03 +0000
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
X-Inumbo-ID: 21d3d7c8-ce08-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680076983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XkIlKbNA1TkczV1RQwGRPvUdSOv/P1LFG2UzjXLvDSU=;
	b=l686GUWRSYDUHgUznltiyuVdym2edkLnSc7FQgWFkIM47r7WpN2eCj0rOSOWAOPRzKIbcn
	MzsbTQUYdGLGBtUVfeL7hzX+43Sf0U78MmmZWgWiwD85yibarwgOUC4rWn+AtBS3389qCJ
	o3va+i7x9e5FYkdI02qO0JklhX3jyjI=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] xen/netback: use same error messages for same errors
Date: Wed, 29 Mar 2023 10:02:59 +0200
Message-Id: <20230329080259.14823-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue the same error message in case an illegal page boundary crossing
has been detected in both cases where this is tested.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
V3:
- modify message text (Jan Beulich)
---
 drivers/net/xen-netback/netback.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 9ca4b69d3b39..dbaead243737 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -996,10 +996,8 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
 
 		/* No crossing a page as the payload mustn't fragment. */
 		if (unlikely((txreq.offset + txreq.size) > XEN_PAGE_SIZE)) {
-			netdev_err(queue->vif->dev,
-				   "txreq.offset: %u, size: %u, end: %lu\n",
-				   txreq.offset, txreq.size,
-				   (unsigned long)(txreq.offset&~XEN_PAGE_MASK) + txreq.size);
+			netdev_err(queue->vif->dev, "Cross page boundary, txreq.offset: %u, size: %u\n",
+				   txreq.offset, txreq.size);
 			xenvif_fatal_tx_err(queue->vif);
 			break;
 		}
-- 
2.35.3


