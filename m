Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FAB5379FA
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 13:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338515.563298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvdft-0005zl-Lx; Mon, 30 May 2022 11:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338515.563298; Mon, 30 May 2022 11:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvdft-0005wM-IX; Mon, 30 May 2022 11:35:05 +0000
Received: by outflank-mailman (input) for mailman id 338515;
 Mon, 30 May 2022 11:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e3+D=WG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nvdfr-0005wG-Qs
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 11:35:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b21b729-e00c-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 13:35:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D410E21B63;
 Mon, 30 May 2022 11:35:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86F9213A84;
 Mon, 30 May 2022 11:35:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NmJ9H+WrlGLPdQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 May 2022 11:35:01 +0000
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
X-Inumbo-ID: 8b21b729-e00c-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653910501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VtWEzLh+t2xI23/ZsFZwEDqX/MxDCN5dV6zj7JYIqG0=;
	b=XehnlzPLjv36KTNOB9J4ShMSmsMYHbhrrdLdVbWTzeBLyw+C7WdzQRfn0FE4QjFefjXu+V
	9LpbUM5fdnYDbmN8XOeZr5O/vfu9gTM3n57PlUU7GaV/dDb35M/Sxs+tvFZQ772zKoJ726
	nP0Rlld/SRDHZdIltFFXqS4Qj1FkTfk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/netback: fix incorrect usage of RING_HAS_UNCONSUMED_REQUESTS()
Date: Mon, 30 May 2022 13:34:59 +0200
Message-Id: <20220530113459.20124-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6fac592cca60 ("xen: update ring.h") missed to fix one use case
of RING_HAS_UNCONSUMED_REQUESTS().

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: 6fac592cca60 ("xen: update ring.h")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/net/xen-netback/netback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 0f7fd159f0f2..d93814c14a23 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -828,7 +828,7 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
 			break;
 		}
 
-		work_to_do = RING_HAS_UNCONSUMED_REQUESTS(&queue->tx);
+		work_to_do = XEN_RING_NR_UNCONSUMED_REQUESTS(&queue->tx);
 		if (!work_to_do)
 			break;
 
-- 
2.35.3


