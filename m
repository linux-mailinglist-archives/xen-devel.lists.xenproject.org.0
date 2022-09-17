Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380EC5BB5AA
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 04:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408205.650986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvv-0004TZ-5g; Sat, 17 Sep 2022 02:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408205.650986; Sat, 17 Sep 2022 02:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvu-0004NW-T4; Sat, 17 Sep 2022 02:51:54 +0000
Received: by outflank-mailman (input) for mailman id 408205;
 Sat, 17 Sep 2022 02:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=os+o=ZU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZNvt-0002wS-Cz
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 02:51:53 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aea86660-3633-11ed-9761-273f2230c3a0;
 Sat, 17 Sep 2022 04:51:52 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C9F625C00AC;
 Fri, 16 Sep 2022 22:51:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 16 Sep 2022 22:51:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 22:51:50 -0400 (EDT)
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
X-Inumbo-ID: aea86660-3633-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663383111; x=1663469511; bh=IyFutLja57
	/fivONhEJ7wzgB6O+d/UdKnwYWMwrAmNA=; b=Bvs3Cc6N8ZMiYJz7sDxvjB8G7n
	gm3M/5dTu4GCw+rTHvgqFjw1a0vBdk6QnVd8yWyxtWr8YVr06wc+uN8o2Gr9oP6E
	OUXb4TgUcimdFHoUMEwDvD4I54aZY6x7jhaJAz+YPysxXa2yIjlJEzGqzJcSsSlG
	p/5zKUquEl8i42tMSGdtbGycn+VNaqFabTxIGWevkpPr7NjWnXZLFA9ZwPmpEonh
	L91LGV3v9mk9FwGqwOEDExgY95qem+cQqGyTnZOxNtjSpc7hh7awI74xB0mHJmpE
	IfNs51sr7gy5iHOAEXtdEJ0wo0mpRo2Xr5cE+KmceFDmhlq9dKUV4iQ1klpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663383111; x=
	1663469511; bh=IyFutLja57/fivONhEJ7wzgB6O+d/UdKnwYWMwrAmNA=; b=w
	RWjE+wgK5xJBPaukH/JpHHi06ehpNlDOmFep0NYPcc4zQrI+MA6J1fqK70AP90zy
	cYuYHsERK8TtaNLgtfUSDs2Yh80UsTkNvVyMf9yM/fMdT6v32j81MgsP9D8yAI3v
	6HzsW3/CT6dSAfHZrfv3kMwwe4LYW/ONCPVEa4X2HHNbP36tt2GrKrPIqrbKw9Lx
	XIRms3VBaVfpu28qg8aKewWBKojdS8vJvfocA6ycXuvY6aMig2wi7lEPY1fhWA8c
	1qaGaMv2NF88ESmW/jC25Q04MpAH74KvgDMgva1bd8Qq2/r8r6VvU0NbdMXnsHBf
	maBsDK1JYvRm589jPM6Pg==
X-ME-Sender: <xms:RzYlY4Sc1BUX080Caz6CBcexBu-hDQiDJt8hJv4vpeRhEplfBNlYWA>
    <xme:RzYlY1xYy1m6Ei20UCtSkIlGQqENIaMHev6r9ktfm9ObRGv26k_vQttIsKa13OP0A
    HhPSMyhlNdxgQ>
X-ME-Received: <xmr:RzYlY12fJyGmW14HDWE7FAkpFsdCVoJWRZN4_ekaZRslPd-2S3eWh7xr87Aqn0wROyT_ItxM0GcSfQk3tAQgAu9MVpL_kFAkZm_LWrnNdn0sa7eyj9qWiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:RzYlY8DUq4v9iC7z4pKQtP8G57pQkv2q-XkeA8MceRwtTgPrarP9Pg>
    <xmx:RzYlYxjakbYyH0qKWpP3HnZBEktj4tu7ZgRqr7f90td_3xACcjOz8w>
    <xmx:RzYlY4oIEiU8ccEeWHPuiaS8-IEpeCTEudYunbqt11tmv_X4bJd83w>
    <xmx:RzYlY_YpV9wTenWfDrPVpP73nxqSe3DwZxzowIWz6l6yp7lMjKhwew>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 06/11] drivers/char: fix handling cable re-plug in XHCI console driver
Date: Sat, 17 Sep 2022 04:51:25 +0200
Message-Id: <aa45ee0d290f179e71d52c613e773291f56d7cd5.1663383053.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
 - keep barriers consistent
---
 xen/drivers/char/xhci-dbc.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 00ab4ae4a27e..5f47733c1801 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -546,6 +546,15 @@ static unsigned int dbc_work_ring_space_to_end(const struct dbc_work_ring *ring)
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
@@ -973,6 +982,8 @@ static bool dbc_ensure_running(struct dbc *dbc)
         writel(ctrl | (1U << DBC_CTRL_DRC), &reg->ctrl);
         writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
         wmb();
+        dbc_ring_doorbell(dbc, dbc->dbc_iring.db);
+        dbc_ring_doorbell(dbc, dbc->dbc_oring.db);
     }
 
     return true;
@@ -990,10 +1001,6 @@ static bool dbc_ensure_running(struct dbc *dbc)
 static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
                       struct dbc_work_ring *wrk)
 {
-    struct dbc_reg *reg = dbc->dbc_reg;
-    uint32_t db = (readl(&reg->db) & ~DBC_DOORBELL_TARGET_MASK) |
-                  (trb->db << DBC_DOORBELL_TARGET_SHIFT);
-
     if ( xhci_trb_ring_full(trb) )
         return;
 
@@ -1017,7 +1024,7 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
     }
 
     wmb();
-    writel(db, &reg->db);
+    dbc_ring_doorbell(dbc, trb->db);
 }
 
 /**
-- 
git-series 0.9.1

