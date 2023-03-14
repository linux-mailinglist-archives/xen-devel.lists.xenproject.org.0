Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A21C6B97EF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509663.785871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5d9-0003m1-Cb; Tue, 14 Mar 2023 14:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509663.785871; Tue, 14 Mar 2023 14:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5d9-0003jv-95; Tue, 14 Mar 2023 14:27:59 +0000
Received: by outflank-mailman (input) for mailman id 509663;
 Tue, 14 Mar 2023 14:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6q5S=7G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pc5d7-0003Pt-Hv
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:27:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 695cc9be-c274-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:27:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B1A161F899;
 Tue, 14 Mar 2023 14:27:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7913413A26;
 Tue, 14 Mar 2023 14:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 799bHGuEEGSwHQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Mar 2023 14:27:55 +0000
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
X-Inumbo-ID: 695cc9be-c274-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678804075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqlDj5UjmiMEvoSqLoc8v4qWW4pHq8z/st4qCe4e2C4=;
	b=XedR/elBQfI+Fz7FgpPVP+ZbOWuN0G/kycE+YIYHG4ucOgb2jqbq/RsT3P01YYQc+jh+sD
	p7AUUWfpWVa3R7aQTs5LIveOP60zG+VFTOWn/LG+1mrwU+jRNEANIJTd2m81lRdJqETmfr
	76hrkOJfJyw/GrSMrGqgR2qjN60oV4I=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/4] xen/blkback: remove stale prototype
Date: Tue, 14 Mar 2023 15:27:39 +0100
Message-Id: <20230314142741.24917-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230314142741.24917-1-jgross@suse.com>
References: <20230314142741.24917-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is no function xen_blkif_purge_persistent(), so remove its
prototype from common.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/block/xen-blkback/common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index 9a13a6b420a6..fab8a8dee0da 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -384,7 +384,6 @@ void xen_blkif_xenbus_fini(void);
 
 irqreturn_t xen_blkif_be_int(int irq, void *dev_id);
 int xen_blkif_schedule(void *arg);
-int xen_blkif_purge_persistent(void *arg);
 void xen_blkbk_free_caches(struct xen_blkif_ring *ring);
 
 int xen_blkbk_flush_diskcache(struct xenbus_transaction xbt,
-- 
2.35.3


