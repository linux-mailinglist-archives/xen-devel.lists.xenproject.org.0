Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DA716EF3
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541458.844280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q466H-0001I7-Qq; Tue, 30 May 2023 20:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541458.844280; Tue, 30 May 2023 20:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q466H-0001Ah-La; Tue, 30 May 2023 20:37:49 +0000
Received: by outflank-mailman (input) for mailman id 541458;
 Tue, 30 May 2023 20:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460z-0001yj-HJ
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:32:21 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12a83ba4-ff29-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 22:32:20 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 32CF03200962;
 Tue, 30 May 2023 16:32:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 30 May 2023 16:32:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:32:16 -0400 (EDT)
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
X-Inumbo-ID: 12a83ba4-ff29-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1685478737; x=1685565137; bh=1g
	7wCby6gdLY4jovUh0//kEDEi26QbSZsUz9aHtBM2E=; b=PTeqRnmYVEq0wVDDJD
	v2NgZMyQcplu/m14wNSYj0ve2VYJmp8/HYabLKde0hrBjhqPZg+BxcpirBxApwy2
	KvE46HYM5wnhC/4Udrw7hIu2L32qAPNxDFZSBSqYYIz8YujdBJci/NpTNo+p53K/
	ZP8rfzYLpird6egQYWSHAANqz/RZSLswiBplOl2A/y0OyIu1BxIicwKMkAPHGDmV
	WessmjZhCG8zKV4Ukgz9PvctwW0ATp+S5OvpXekfubo5VoPLDLWvcXJBYNxtQwjv
	35EuDW8XkpOFiyYumD6qGJ1/GAkIvB5AhpkolWi7yQxyzJUOn5vpE8RhOvgoL7fS
	IUPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1685478737; x=1685565137; bh=1g7wCby6gdLY4jovUh0//kEDEi26QbSZsUz
	9aHtBM2E=; b=r0rkmSaGTkR2+3ZnA69S5XdEOZnX5eZ1eqBMohYZ6j1pDR1bBh3
	P1bQkHb1aiBf1/paYWLWZ6AQv38yySL0NXXisjeAkN/2Fw6/19D61jXb67QHtocH
	nY2dPHsGsa+vj/j56DVnnMYRzaWKLjV/o+G6vMbtTDRYca8UuWRp7PMHxrv2wb8g
	cdHne0mqgpSzSUcH6DyBsqFNuKPGlHeL7aPXNEEqKgjzioAq5o9+iWqS12vVJbzI
	VeUakDmBw1pkRDsIoh9JGCA82dK2Ag5zfwJrLSviRxJc/0zfHHW/oSddQhvVWtM4
	21jj9qe9xf4rI1JLfrZVS7uAi/G3uQwtsKw==
X-ME-Sender: <xms:UV12ZJsB7-6thDBOW04ZBm8dwA1w8OqPQmWsHPIsTD85Gotn6oCtAQ>
    <xme:UV12ZCcND6TvIARXd8QOOkdba5asaIVOCge4bX4g8CQ5jmO5RYFcsdAxDLYUr6xpT
    K7j0UTQ4KOSnXg>
X-ME-Received: <xmr:UV12ZMz7jUkHkkTvC4PaB0pWjhII28OE1-d4VoJYh3Rk5KoK5polsbsvSHQ6A82D-keKTXHm8f0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgv
    mhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeefieekhfdtgeeuueelleeg
    vdetieehgfejteduvedvvdejudetudelfedukefhnecuffhomhgrihhnpehinhguihhrvg
    gtthdrnhhrpdhinhguihhrvggtthdrihgunecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:UV12ZAPqoC6ugOyhqw12hilSeplCRnKjnOlJfmhYkOVrSOBnWerfZA>
    <xmx:UV12ZJ8Zyv2sMdGJ8yUkzVbNcYb8OnOE3NDfnKK7_d4J77we3bDJpQ>
    <xmx:UV12ZAVfjKO8vuRkhvcAjXEFakWAjuI2n5mclwt9ec30GFsNgGodag>
    <xmx:UV12ZCMvAk4xGoCgzeqg5Gt0J8JIuCFJuktUAcqyZrosY5iMdZIIaw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jens Axboe <axboe@kernel.dk>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 15/16] xen-blkback: Minor cleanups
Date: Tue, 30 May 2023 16:31:15 -0400
Message-Id: <20230530203116.2008-16-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds a couple of BUILD_BUG_ON()s and moves some arithmetic after
the validation code that checks the arithmetic’s preconditions.  The
previous code was correct but could potentially trip sanitizers that
check for unsigned integer wraparound.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/block/xen-blkback/blkback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index c362f4ad80ab07bfb58caff0ed7da37dc1484fc5..ac760a08d559085ab875784f1c58cdf2ead95a43 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1342,6 +1342,8 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 	nseg = req->operation == BLKIF_OP_INDIRECT ?
 	       req->u.indirect.nr_segments : req->u.rw.nr_segments;
 
+	BUILD_BUG_ON(offsetof(struct blkif_request, u.rw.id) != 8);
+	BUILD_BUG_ON(offsetof(struct blkif_request, u.indirect.id) != 8);
 	if (unlikely(nseg == 0 && operation_flags != REQ_PREFLUSH) ||
 	    unlikely((req->operation != BLKIF_OP_INDIRECT) &&
 		     (nseg > BLKIF_MAX_SEGMENTS_PER_REQUEST)) ||
@@ -1365,13 +1367,13 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 		preq.sector_number     = req->u.rw.sector_number;
 		for (i = 0; i < nseg; i++) {
 			pages[i]->gref = req->u.rw.seg[i].gref;
-			seg[i].nsec = req->u.rw.seg[i].last_sect -
-				req->u.rw.seg[i].first_sect + 1;
-			seg[i].offset = (req->u.rw.seg[i].first_sect << 9);
 			if ((req->u.rw.seg[i].last_sect >= (XEN_PAGE_SIZE >> 9)) ||
 			    (req->u.rw.seg[i].last_sect <
 			     req->u.rw.seg[i].first_sect))
 				goto fail_response;
+			seg[i].nsec = req->u.rw.seg[i].last_sect -
+				req->u.rw.seg[i].first_sect + 1;
+			seg[i].offset = (req->u.rw.seg[i].first_sect << 9);
 			preq.nr_sects += seg[i].nsec;
 		}
 	} else {
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


