Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC56CC056
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515804.799003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph98M-00069c-04; Tue, 28 Mar 2023 13:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515804.799003; Tue, 28 Mar 2023 13:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph98L-00066A-TM; Tue, 28 Mar 2023 13:13:05 +0000
Received: by outflank-mailman (input) for mailman id 515804;
 Tue, 28 Mar 2023 13:13:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLKu=7U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ph98K-0005os-Mx
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:13:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4538cd1e-cd6a-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 15:13:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E146221A25;
 Tue, 28 Mar 2023 13:13:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98ADC1390D;
 Tue, 28 Mar 2023 13:13:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bIYXJN7nImRBTgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Mar 2023 13:13:02 +0000
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
X-Inumbo-ID: 4538cd1e-cd6a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680009182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YW7EQFAaSbV1XiZ+rWOC33Mh7NdDO+nn7h2JPqjxGsU=;
	b=O/kjrp9uwhaX0UHcxnMEsib0oNTmVBstScUxSKkHjVOFyAM6ud1RCyuekMkZ36jQpPD1ZR
	DM6toj/Ixa4HrtnnqRELqKdV5fzFX7Xh5gXJKbQgznCMyUK/eCvzYBpBmemN5d0MS02eho
	LyrmFwNOmbYVjCPAQEH2c0kPLjUJMZE=
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
Subject: [PATCH v2 2/3] xen/netback: remove not needed test in xenvif_tx_build_gops()
Date: Tue, 28 Mar 2023 15:12:32 +0200
Message-Id: <20230328131233.2534-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230328131047.2440-1-jgross@suse.com>
References: <20230328131047.2440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tests for the number of grant mapping or copy operations reaching
the array size of the operations buffer at the end of the main loop in
xenvif_tx_build_gops() isn't needed.

The loop can handle at maximum MAX_PENDING_REQS transfer requests, as
XEN_RING_NR_UNCONSUMED_REQUESTS() is taking unsent responses into
consideration, too.

Remove the tests.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 drivers/net/xen-netback/netback.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 54c76af90233..9ca4b69d3b39 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -1084,10 +1084,6 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
 		__skb_queue_tail(&queue->tx_queue, skb);
 
 		queue->tx.req_cons = idx;
-
-		if ((*map_ops >= ARRAY_SIZE(queue->tx_map_ops)) ||
-		    (*copy_ops >= ARRAY_SIZE(queue->tx_copy_ops)))
-			break;
 	}
 
 	return;
-- 
2.35.3


