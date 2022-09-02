Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5BA5AB14B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397610.638321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6Yb-0002bF-Ay; Fri, 02 Sep 2022 13:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397610.638321; Fri, 02 Sep 2022 13:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6Yb-0002OP-3Q; Fri, 02 Sep 2022 13:18:01 +0000
Received: by outflank-mailman (input) for mailman id 397610;
 Fri, 02 Sep 2022 13:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHR5=ZF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oU6YY-0008Qk-Sv
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:17:59 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a949c846-2ac1-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 15:17:58 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 53DA45C00DF;
 Fri,  2 Sep 2022 09:17:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 02 Sep 2022 09:17:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 09:17:55 -0400 (EDT)
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
X-Inumbo-ID: a949c846-2ac1-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662124677; x=1662211077; bh=FT/9EaeivQ
	6Yg0Q2MVnR1LdECut0xAgreZVi3/6Rzrs=; b=dYZzdvRf5MIoXjIPWqATS14Fx5
	ISV/gzq+An9kBONWb/K8oAFpremfs0fAyDISlgQf7BcxhUA6zveYEQeWdf4gttok
	MDW6f9RnvDt9Wakm1BmTVlNRsLL5XoFQOCxpQG6CgZajwHAJaY9Yss00ias+RMu4
	MV/p7E5REt9Erbvllo5Ojq9TJS2S32sxPrLVZUB+U+lT/bp6UzniZw1ggT96m+5f
	ctpYcZDasBsK23t/nlP/L2IZfUnr5pLtn79yj/PlMbo0krq5oY80/JuY8R0DEQ2Z
	9L7QnoSDB1LgyYNzGXPO+uzoAC2hmH58l0PGmKYyI4sma7Hk3cXJ7msPNuug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662124677; x=
	1662211077; bh=FT/9EaeivQ6Yg0Q2MVnR1LdECut0xAgreZVi3/6Rzrs=; b=N
	vgc5yW0Tjb2kyfTYH2j7sftlaDHvjiaD311RHKMEXFW5cTWPW+YisU5La9ghcTpN
	KaNIIfM6egaUB8eTzcmo+a4xq7xb6yVm9vGWa/AgCyv38IxhecGsRrHIkjz9VAWe
	wHZ0QAfqFLywrPsqBOVygf3VoEKdmv0LNVqHtHqYvJTbEqJr4w8mQssp03i1jWy4
	xyN76gc8L26hettC9WFuRik8Pvsgxuz5ebUD3mlBkq9pIsKj87qAaOZV1dOeSXE/
	6bEa4DdFEpRdJz97gp7TTPMRsyDea3cIBouYhild0cxPfWa1NDPt1fE+NjyvIHvM
	XfiQRJUlsN66Kpj4Jg3rQ==
X-ME-Sender: <xms:hQISY_4Z09UMlj6HgNjG4xqFQIC1_vLvXsFFdjbcPPXHZmROtMrlBQ>
    <xme:hQISY05hWjb0oqErUh9qaG63Fnw-WMmFoJUC9xpUEHa9HmpyuP39fZ5SU07AZNKUu
    _XqfV2Xg5IDQA>
X-ME-Received: <xmr:hQISY2faL6dhz1jqdHsufW7zain6BpyOLz7451RdNVgM6QlYy8BUO44KK9-fduOpLw3g4s2fHNicemFoiKvTcBlvJeR-J4zJH5D8fHhqGLZoUqsmzWTLZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:hQISYwL0bxt5Fbu0I78xUHT20NXTIzdeM--751ZQsduy8nxnNP1ZAA>
    <xmx:hQISYzJ1AC4nvbxXo-N7iFRECorUl2YedHH3qfjH_L7FamaGvWafpQ>
    <xmx:hQISY5xue-ZxZhRtNrxySncdJET8LUl3-IoD1mFubZhD-GlenKfpBw>
    <xmx:hQISY5jFtgCrwrmslxb-ZRIBVrsnyUYNQZN7-LDisJm8lrqvxpULWA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 09/10] drivers/char: fix handling cable re-plug in XHCI console driver
Date: Fri,  2 Sep 2022 15:17:30 +0200
Message-Id: <c53d287bf741831e1eb19137091c00efc3f9b3c8.1662124370.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When cable is unplugged, dbc_ensure_running() correctly detects this
situation (DBC_CTRL_DCR flag is clear), and prevent sending data
immediately to the device. It gets only queued in work ring buffers.
When cable is plugged in again, subsequent dbc_flush() will send the
buffered data.
But there is a corner case, where no subsequent data was buffered in the
work buffer, but a TRB was still pending. Ring the doorbell to let the
controller re-send them. For console output it is rare corner case (TRB
is pending for a very short time), but for console input it is very
normal case (there is always one pending TRB for input).

Extract doorbell ringing into separate function to avoid duplication.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v6:
 - keep barriers consistent
---
 xen/drivers/char/xhci-dbc.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 9f7e1dd60a78..829f1d1d910f 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -554,6 +554,15 @@ static unsigned int dbc_work_ring_space_to_end(const struct dbc_work_ring *ring)
     return ring->deq - ring->enq;
 }
 
+static void dbc_ring_doorbell(struct dbc *dbc, int doorbell)
+{
+    uint32_t __iomem *db_reg = &dbc->dbc_reg->db;
+    uint32_t db = (readl(db_reg) & ~DBC_DOORBELL_TARGET_MASK) |
+                  (doorbell << DBC_DOORBELL_TARGET_SHIFT);
+
+    writel(db, db_reg);
+}
+
 static void dbc_push_trb(struct dbc *dbc, struct xhci_trb_ring *ring,
                          uint64_t dma, uint64_t len)
 {
@@ -1024,6 +1033,8 @@ static bool dbc_ensure_running(struct dbc *dbc)
         writel(ctrl | (1U << DBC_CTRL_DRC), &reg->ctrl);
         writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
         wmb();
+        dbc_ring_doorbell(dbc, dbc->dbc_iring.db);
+        dbc_ring_doorbell(dbc, dbc->dbc_oring.db);
     }
 
     return true;
@@ -1041,10 +1052,6 @@ static bool dbc_ensure_running(struct dbc *dbc)
 static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
                       struct dbc_work_ring *wrk)
 {
-    struct dbc_reg *reg = dbc->dbc_reg;
-    uint32_t db = (readl(&reg->db) & ~DBC_DOORBELL_TARGET_MASK) |
-                  (trb->db << DBC_DOORBELL_TARGET_SHIFT);
-
     if ( xhci_trb_ring_full(trb) )
         return;
 
@@ -1068,7 +1075,7 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
     }
 
     wmb();
-    writel(db, &reg->db);
+    dbc_ring_doorbell(dbc, trb->db);
 }
 
 /**
-- 
git-series 0.9.1

