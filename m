Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B073867C3A8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 04:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484689.751425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKt1s-0000PO-Bk; Thu, 26 Jan 2023 03:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484689.751425; Thu, 26 Jan 2023 03:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKt1s-0000N1-8p; Thu, 26 Jan 2023 03:34:24 +0000
Received: by outflank-mailman (input) for mailman id 484689;
 Thu, 26 Jan 2023 03:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q4q1=5X=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pKt1r-0000Lj-60
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 03:34:23 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fe5c3ad-9d2a-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 04:34:20 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2472C5C05B7;
 Wed, 25 Jan 2023 22:34:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 25 Jan 2023 22:34:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 22:34:16 -0500 (EST)
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
X-Inumbo-ID: 4fe5c3ad-9d2a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1674704057; x=1674790457; bh=fly1TGtjPYQFqq0ZAbmMb6xmSvsz35BqaEQ
	byQNg2OA=; b=D1MtYf7memgXbJNrc512Gsyf7cLrgjr6PQo/+5SRDUNVexrSxSC
	Jkb5mc4UepBZHaS+WfVmJOPzRnlte6IdRUwS2LchBnaoWtesjoO1buvJGixk1ZWt
	W2JlzBei3s3Q+yUEq/btspULrZTxS5BYxXousMYLYeRrAQ8Vz/bDNL7SjKPt/1HO
	V+D/T8GldIOZR/fE2l3RLQw7uXqbjeBid6SdZxtWQPQmjG+VNO/1ntp5kbEu7oFI
	lnzGP/sb+Mtlukny0sQD11buwfGcg/H2paeQWwfapygyZ1QbCpdMapdr3yZZzAOu
	2nJkuttV4wyUT8tSgLLiVazf/HXYBehvrdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674704057; x=1674790457; bh=fly1TGtjPYQFq
	q0ZAbmMb6xmSvsz35BqaEQbyQNg2OA=; b=ctkpfx7SZRRL6KeO6bFZhCqe3XQGd
	ddY9ADAEaPF42/Pdj3OYxAFRo254vZsVEa8tWSr/KSF+zVoyu2EteDsynPXOj/iu
	63IO7MJyBbRlf7+vQey7wd0POoDgEkJdxFADcHNTYc1/FbN9ZjueKRKqVShvQjKd
	H52kTj6LTGwltBqYV4MSsF9pfN6Ngjul1V6orbHr317ENrVkDkF04ZJyJ/u6siGZ
	040psDMjFLte9H8xZp2q3BlERdUWC3vFfHvaXpbUYvoMJDuxj/eP7uesva1h1NAJ
	A31HPEIeEK62hAR0XVgh41M6lyaOiUZeQlINouPHd1OF+PYrKk/UTJ/5g==
X-ME-Sender: <xms:uPTRY-UJugvRHQWqLPTevHKqWNImygoOOyYewPe_uQqS9qbczCFzJQ>
    <xme:uPTRY6kQLCCCct-1GcPEKU697zRbqex5ZNGMVHmm5m1c95TxOkO3SEzC1ScFo6NML
    oOwjeNEzEMil4k>
X-ME-Received: <xmr:uPTRYyZG5ypvub0AjxhcULUmMs0YaTlx0iWR3IkE2nr6D7XtDdxS9uvROL8aCXQoMnZS-iuZdIud>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepheehvdekudfffeelkeelvdevffej
    ieetudeifeeliefgleffiedvgefhheehgfeunecuffhomhgrihhnpehinhguihhrvggtth
    drnhhrpdhinhguihhrvggtthdrihgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:ufTRY1VuavHbMeRfNh8kDPgSScRHLLvGJKom87ozljBfd7VtLvnXOw>
    <xmx:ufTRY4kcERKeOg3A5RFmTzfWgpLEQfKpt-p4qEWyUhIR0g086pbcKg>
    <xmx:ufTRY6fYHq4xTO6jgFUdjKJN8TzKE92H_QhdqAHrdujMm1gOVJ1NeA>
    <xmx:ufTRY3ufM2M8yw78lZ1XU9KjM0U4Iyf08R5809m_oRpfv3KY2kmPCQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jens Axboe <axboe@kernel.dk>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/7] Minor blkback cleanups
Date: Wed, 25 Jan 2023 22:33:57 -0500
Message-Id: <20230126033358.1880-6-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126033358.1880-1-demi@invisiblethingslab.com>
References: <20230126033358.1880-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change intended.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/block/xen-blkback/blkback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index a5cf7f1e871c7f9ff397ab8ff1d7b9e3db686659..8a49cbe81d8895f89371bdf50d1b445c088c9b6a 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1238,6 +1238,8 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 	nseg = req->operation == BLKIF_OP_INDIRECT ?
 	       req->u.indirect.nr_segments : req->u.rw.nr_segments;
 
+	BUILD_BUG_ON(offsetof(struct blkif_request, u.rw.id) != 8);
+	BUILD_BUG_ON(offsetof(struct blkif_request, u.indirect.id) != 8);
 	if (unlikely(nseg == 0 && operation_flags != REQ_PREFLUSH) ||
 	    unlikely((req->operation != BLKIF_OP_INDIRECT) &&
 		     (nseg > BLKIF_MAX_SEGMENTS_PER_REQUEST)) ||
@@ -1261,13 +1263,13 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
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


