Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93E6C9E01
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 10:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515069.797597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgiLf-0007MB-HW; Mon, 27 Mar 2023 08:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515069.797597; Mon, 27 Mar 2023 08:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgiLf-0007Il-EG; Mon, 27 Mar 2023 08:37:03 +0000
Received: by outflank-mailman (input) for mailman id 515069;
 Mon, 27 Mar 2023 08:37:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J70X=7T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pgiLe-00071F-Fd
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 08:37:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a2600f9-cc7a-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 10:36:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FDA81F8A8;
 Mon, 27 Mar 2023 08:37:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D0B913329;
 Mon, 27 Mar 2023 08:37:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rNmIDaxVIWS+SAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Mar 2023 08:37:00 +0000
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
X-Inumbo-ID: 8a2600f9-cc7a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679906220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYwAGMe1PfAGydSVqlgv0hiTKV8LxJz7Cfr4pQvks4M=;
	b=pnRmRrpElIfOGh45HyDbGyTLv5HE1XJiCA+hgB75qnV0jL4KSVd4BTS/HMLMTgZ6vr5c/q
	EW2BxF/x9H47o/NyMlbMwkvnqPLcy3SN0f4vddtVKFgShfc+EvOgYvcl9QnYQkD2CuiNrS
	8JiD6T2Fu41dFmCAKBsZ2kYeG2PvttU=
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
Subject: [PATCH 2/2] xen/netback: remove not needed test in xenvif_tx_build_gops()
Date: Mon, 27 Mar 2023 10:36:46 +0200
Message-Id: <20230327083646.18690-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230327083646.18690-1-jgross@suse.com>
References: <20230327083646.18690-1-jgross@suse.com>
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
---
 drivers/net/xen-netback/netback.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 111c179f161b..4943be4fd99d 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -1082,10 +1082,6 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
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


