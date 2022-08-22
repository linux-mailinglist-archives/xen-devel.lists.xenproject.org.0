Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9BC59C2B6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391482.629408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9LF-0006NP-7K; Mon, 22 Aug 2022 15:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391482.629408; Mon, 22 Aug 2022 15:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9LF-0006Hf-21; Mon, 22 Aug 2022 15:27:53 +0000
Received: by outflank-mailman (input) for mailman id 391482;
 Mon, 22 Aug 2022 15:27:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9LD-0003iu-3F
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:51 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fae6ba82-222e-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 17:27:50 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 02AEE3200A3C;
 Mon, 22 Aug 2022 11:27:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Aug 2022 11:27:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:46 -0400 (EDT)
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
X-Inumbo-ID: fae6ba82-222e-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661182067; x=1661268467; bh=xj7bP3qj5V
	gPvcpXH0+9UDlbrSUvdrbGTDOQmCOLAFU=; b=lVdYxd7OMDMpoWEzPlSB6orzII
	svSLcmI7LAHqXmG9EElY31MfPQmwiSgCSddFJ2EAePlAEf63+hLRCLUfiBx01xoM
	gilIEG89lbJpdqxFcKmHAt5X8S5rm73waHCHzlWGZzjH7dBKNob2xG+bKjv8ZpBB
	Rn2XkQTmdDF/yKHeGFSmqyB74pCiGz+g/5cmWBJ1+pWT6Oi1lc6EWGYNMPaL+r32
	ZSlUtWbhtrnnYpxN6CBo0zPnpGhAzS4F55tk1S0/4wA8pDV/vzrNMhC1UDyZlv+1
	w2AOGPh/GA8nAk+mI4w7eWaF+zaY6tzhwUsBNLGDPSfFHosFjbE0sEOvt76A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661182067; x=
	1661268467; bh=xj7bP3qj5VgPvcpXH0+9UDlbrSUvdrbGTDOQmCOLAFU=; b=R
	b45L44hfa+9QOZ/zMt3kAlxTGY+9Fmf7KmjUeX/qfLLhwR8wQKdtMz+ZwDaL31Zs
	4jCm1/pz5huCnFkMhlx1W5p0YS7V+94yxkQY45qy+m7WDbxc6rW1oxStOFwUE6T2
	y4k1dINxltvQ9xDyAu5RDc+866q68ORu6jIg2LmSdGx4YxZIemfrPrtoMQLD5Li1
	nV2c+PcI565KHmvoud0/6iofLqXbn8ECgm7neGXKp0qigGo1tKUzsac0EbQ2bUIi
	uqygazSI4gL7EumMtSlOV6KRMK4Jz63LDnLWHor08j5tEz6Vyk7IkG2tpxoUE02A
	ix/utwOvxMc4vG+f/wFnw==
X-ME-Sender: <xms:c6ADY1wihqBjr4_gx-_nluaDX4nAXS0chv5re8TRuN1Iv0EVVjZ3Tg>
    <xme:c6ADY1RlwZh_9HgHkv5uc9rhx5Qt4fi4tTwZIM6O67QPxZpO4XzPhjkqKjfJHKDZh
    weuxIgD6ndoKg>
X-ME-Received: <xmr:c6ADY_X0MQQ8vGsBEbHof1EGAYYWbFkMXfPa_VFSIknhiCK0xZzxe0nDKrb6jjl4MFPr1BxKp7HTqhSIuI_dVmYjzPmYsG6MWQfvXgIpjGqgVG6qYBk41A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:c6ADY3jWGDi1ex7wtkHsm4aYrSYL3iHwcVm3VNti_MfO-ifLASHXmQ>
    <xmx:c6ADY3DlJjYbpzfyycr1agRIOyBvDvJA6iOSmbnPeWjz8OTbUGqvQA>
    <xmx:c6ADYwLt2CRifCAg347aUkG7yqlxYizi0ADQ2tFW5Q-NSTl_5AjYpA>
    <xmx:c6ADYy7-2Q4X62JwBkC0WnyLTORwaaE_2shbqhBRNSGcvT5oiIkAaw>
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
Subject: [PATCH v5 9/9] drivers/char: fix handling cable re-plug in XHCI console driver
Date: Mon, 22 Aug 2022 17:27:09 +0200
Message-Id: <bf26655295d0d85b1718d60f2e4390da7ec62b93.1661181584.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
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
 xen/drivers/char/xhci-dbc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index e838e285fb75..0ff340dac103 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -553,6 +553,15 @@ static unsigned int dbc_work_ring_space_to_end(const struct dbc_work_ring *ring)
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
@@ -1023,6 +1032,8 @@ static bool dbc_ensure_running(struct dbc *dbc)
         writel(ctrl | (1U << DBC_CTRL_DRC), &reg->ctrl);
         writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
         wmb();
+        dbc_ring_doorbell(dbc, dbc->dbc_iring.db);
+        dbc_ring_doorbell(dbc, dbc->dbc_oring.db);
     }
 
     return true;
@@ -1040,10 +1051,6 @@ static bool dbc_ensure_running(struct dbc *dbc)
 static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
                       struct dbc_work_ring *wrk)
 {
-    struct dbc_reg *reg = dbc->dbc_reg;
-    uint32_t db = (readl(&reg->db) & ~DBC_DOORBELL_TARGET_MASK) |
-                  (trb->db << DBC_DOORBELL_TARGET_SHIFT);
-
     if ( xhci_trb_ring_full(trb) )
         return;
 
@@ -1066,8 +1073,7 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
         }
     }
 
-    wmb();
-    writel(db, &reg->db);
+    dbc_ring_doorbell(dbc, trb->db);
 }
 
 /**
-- 
git-series 0.9.1

