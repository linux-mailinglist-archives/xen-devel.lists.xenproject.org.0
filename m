Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B05AB148
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397611.638332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6Yd-0002yf-6g; Fri, 02 Sep 2022 13:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397611.638332; Fri, 02 Sep 2022 13:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6Yc-0002oi-T7; Fri, 02 Sep 2022 13:18:02 +0000
Received: by outflank-mailman (input) for mailman id 397611;
 Fri, 02 Sep 2022 13:18:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHR5=ZF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oU6Ya-0008Qk-Io
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:18:00 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa413bd4-2ac1-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 15:17:59 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E76215C00DD;
 Fri,  2 Sep 2022 09:17:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 02 Sep 2022 09:17:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 09:17:57 -0400 (EDT)
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
X-Inumbo-ID: aa413bd4-2ac1-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662124678; x=1662211078; bh=pEWUqxEj2m
	kIrRCvTAQi0Yzt/WUEwDzCu/7BJlYxh6A=; b=ElFWG///z1wqbpKkdQNnPsW8Er
	qFP9ZLwZKKqZPmKvmiZBEBDXQQneQXMwlwBT/rQPVDGX0W36MBxO02y5cQsA/TgQ
	pIFcpZD6Z4EPDIINj+9QoIZBNJIFd49Ui23JXIl6wlmAVOFEEc2hROgbL7qkWa+7
	OHUsQVC6vVW/FMlFajEGoWSjJLKCbcuFxmmfhoylF98WdDufUXYSoDsVNIZBP9lt
	VgQ+z9ljZP2gYaW5uURthapsyHjPu7IaRpcRHTfF/yJRanpVJsPOAlA1C328+YfF
	VGmpFR8EFGq2O0L01lKpnr75+Ujn6kSkeIAnyczwzy5GTJHnZE4+VWzoteqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662124678; x=
	1662211078; bh=pEWUqxEj2mkIrRCvTAQi0Yzt/WUEwDzCu/7BJlYxh6A=; b=j
	Hm1jHCb5X79ToZEa3aQ1IR17i2zIuTUxeP7rGJBwHd+4iGzQLRQOA96y/hIafJI8
	DZ+ODjpvDUf2LSmEmliWsF+dzLekcJWNTdeOcZkqKSWrjv3ZI/TPYW4nVU14bPbW
	YItn9Q1ZHLaUAi4PHT+mW8QsIaJxfJk9mPrfxsMB7E8Lf9vf3TcTVJjxK/7WNFHG
	IqC1dDGq4OZqog3+A9zc17LIlq+RTxJpMISbCOp+mwEWr6XxvrRwQBIEoYHGuTbd
	Pqb92WyUfpw6XgJsEqQJZzd6qXJUXkULF9R07Mej3e0ol+jIMfZr2GZHKUcXbXxz
	WNT+fi0nIqUzKnnOWH3mg==
X-ME-Sender: <xms:hgISY43y4qLU8_OBUsPXfMZv5nTF-OFubIkSw37mIWmmAuXTOKe4lQ>
    <xme:hgISYzEQfmg8_6VddXo4dq83rO8ln_I77FZyshayc-5_CTS7mGmNScd4IUQB2pjNo
    AuDIvJg0qx07g>
X-ME-Received: <xmr:hgISYw5DxSKhNf51Y_wSGPgE8NYNk3oEosamQPRbOGelcGEz9VcYQmr4qdhB2zHuWZrZK7zQpBoJQkybVz-Goxu04ba7RY6l7QWd6QEfposllx-zHorUXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:hgISYx2NB0LPTjCX9oc4rN7iTRvo2rqoRcJ5BbxRPI5ZsoBdM_pc2Q>
    <xmx:hgISY7Hn_l4Ms1xOeeDL0zH7ZbyHv8G8nwyqY2vKw3Wl57lD2cg8Jw>
    <xmx:hgISY69IxAx1pk80gujTdnjWccdlytxSCSFC2NbiLNgvOcTILzx-PQ>
    <xmx:hgISY8MDCfbiRHaWDZR7J5z-TgSTYce-uXSpdT3REVVFR5E2HMEZbg>
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
Subject: [PATCH v6 10/10] drivers/char: use smp barriers in xhci driver
Date: Fri,  2 Sep 2022 15:17:31 +0200
Message-Id: <992c6512e54435a006c6de28515d1242518cb974.1662124370.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All (interesting) data is in plain WB cached memory, and the few BAR
register that are configured have a UC mapping, which orders properly
WRT other writes on x86.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v6
---
 xen/drivers/char/xhci-dbc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 829f1d1d910f..03df4d82a623 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -666,7 +666,7 @@ static void dbc_pop_events(struct dbc *dbc)
 
     BUILD_BUG_ON((1 << XHCI_TRB_SHIFT) != sizeof(struct xhci_trb));
 
-    rmb();
+    smp_rmb();
 
     while ( xhci_trb_cyc(event) == er->cyc )
     {
@@ -710,7 +710,7 @@ static void dbc_pop_events(struct dbc *dbc)
     }
 
     erdp = er->dma + (er->deq << XHCI_TRB_SHIFT);
-    wmb();
+    smp_wmb();
     writeq(erdp, &reg->erdp);
 }
 
@@ -847,9 +847,9 @@ static void dbc_enable_dbc(struct dbc *dbc)
 {
     struct dbc_reg *reg = dbc->dbc_reg;
 
-    wmb();
+    smp_wmb();
     writel(readl(&reg->ctrl) | (1U << DBC_CTRL_DCE), &reg->ctrl);
-    wmb();
+    smp_wmb();
 
     while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCE)) == 0 )
         cpu_relax();
@@ -858,9 +858,9 @@ static void dbc_enable_dbc(struct dbc *dbc)
     if ( !dbc->open )
         dbc_reset_debug_port(dbc);
 
-    wmb();
+    smp_wmb();
     writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
-    wmb();
+    smp_wmb();
 
     while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 )
         cpu_relax();
@@ -871,7 +871,7 @@ static void dbc_disable_dbc(struct dbc *dbc)
     struct dbc_reg *reg = dbc->dbc_reg;
 
     writel(readl(&reg->portsc) & ~(1U << DBC_PSC_PED), &reg->portsc);
-    wmb();
+    smp_wmb();
     writel(readl(&reg->ctrl) & ~(1U << DBC_CTRL_DCE), &reg->ctrl);
 
     while ( readl(&reg->ctrl) & (1U << DBC_CTRL_DCE) )
@@ -1032,7 +1032,7 @@ static bool dbc_ensure_running(struct dbc *dbc)
     {
         writel(ctrl | (1U << DBC_CTRL_DRC), &reg->ctrl);
         writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
-        wmb();
+        smp_wmb();
         dbc_ring_doorbell(dbc, dbc->dbc_iring.db);
         dbc_ring_doorbell(dbc, dbc->dbc_oring.db);
     }
@@ -1074,7 +1074,7 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
         }
     }
 
-    wmb();
+    smp_wmb();
     dbc_ring_doorbell(dbc, trb->db);
 }
 
@@ -1101,7 +1101,7 @@ static void dbc_enqueue_in(struct dbc *dbc, struct xhci_trb_ring *trb,
     dbc_push_trb(dbc, trb, wrk->dma + wrk->enq,
                  dbc_work_ring_space_to_end(wrk));
 
-    wmb();
+    smp_wmb();
     writel(db, &reg->db);
 }
 
-- 
git-series 0.9.1

