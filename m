Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C46B53E031
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342174.567340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bx-0000qy-OG; Mon, 06 Jun 2022 03:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342174.567340; Mon, 06 Jun 2022 03:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bx-0000iw-8Y; Mon, 06 Jun 2022 03:41:01 +0000
Received: by outflank-mailman (input) for mailman id 342174;
 Mon, 06 Jun 2022 03:40:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bu-0006AI-L9
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:58 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7999dc07-e54a-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 05:40:57 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D5C45C009E;
 Sun,  5 Jun 2022 23:40:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 05 Jun 2022 23:40:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:55 -0400 (EDT)
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
X-Inumbo-ID: 7999dc07-e54a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486857; x=1654573257; bh=CJWHUy2VWq
	xW/8CRCgMpeNzBJIn8oo40U2Dyt2b4CbY=; b=cbiGlQRAPePlltHvsM0totHwde
	mQgxKBrEQIYBdnaLgbZTwEBcaVF00/5RSMlM3pwDjpagnY2htyg0s+bcgvV9Ezkm
	/T9/p/IQnLOoOuThbgBEcexfysh05byebCgqkROmb7ilaOUxmDExJ9cx4JLftnBa
	tynWvL1cV52Xh/dGPChY9d5REvIiIDaDkG8h3VNttXMZd+t0QfN9sjFTy5ovLZHX
	XPHfxQJiDTRCbgjKolXQ37pZimlsB9MNLb75oiwmxBy6tXAe2Rnsxb/40eh1nwpf
	u+gf0b0clblWPqhAmXV2n/euYLdfVjtrntxMVbd20x47RoJAV12vEZCxsRWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486857; x=
	1654573257; bh=CJWHUy2VWqxW/8CRCgMpeNzBJIn8oo40U2Dyt2b4CbY=; b=S
	is+XW1FcqbLf61YDtDrxLIWBV+PynaefCYM3lTuYwR/KqA4AeQGPSLammQU4BTMx
	ReDxr94nAgQ1HrPlbIsvn5oNRv3wJRwOYKzUTNe3wu7NbMwQ3aQYo00spND0o+Cl
	h+wC3jebG6HUUJ+RI5sujOw5SAdfASpYwQKuYcOCDvc5Zx6Yh3/5K2fdWi69rMaP
	Xa5x03kHSMZnDsslalwZHGmwt1ro65BW9t3E4Y4XodaXyksRXF70E7Y9oIfrdHr4
	EV5WE99XaMam6TrsDWOGNp0/tH5+HXK4n28BuJLLh2oP30jRaWGpn47bNZx/YxFa
	6xcZLM/NHJ8049V/szPaQ==
X-ME-Sender: <xms:SHedYnoq2Xv0qS3rgxLxQ0AvDoaEnxGhkEpdDdiOlbWepeQdw6c5RA>
    <xme:SHedYhrODhRrIJHbx6zkNC6jlxYtTV6YrpwqnLg9jqdZ-WWyijuvUZ8Vr8eca8_MF
    q2iYsA3qDxPJg>
X-ME-Received: <xmr:SHedYkN10VrovxOJr6y6MC3IE9znRumzk0fbD9dLiCk7ilYKHjxSyhGYX0hSPUXP0c9-U25XYMtpn06WQ-irD-aBS2CKufYmHNIF2eNLZAlR3aJb3kE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:SHedYq6LMFP48lT7Aee9_514AdYmN-b6XnJ3sNcizFD_hY4mL7X2rQ>
    <xmx:SHedYm6R1e1FbPbs0z7iDzQrLVzrqxFTy11OCcOFLUbV7Hxmt-uNEg>
    <xmx:SHedYihc5hr40FSOm93vKIVLXdi57IRTuxy30e7V45GvcRgapDyLbA>
    <xmx:SXedYoSNb_UC64k8g5jBC9NvRXw9MaGtgVWWLjsG6dg3jg8Jlx42nQ>
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
Subject: [RFC PATCH 11/12] xue: prevent dom0 (or other domain) from using the device
Date: Mon,  6 Jun 2022 05:40:23 +0200
Message-Id: <74ffafdaa109f6067f2ecbc89b885a8a9cdbadaf.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mark config space of the device as read-only, to prevent dom0 (or
others) re-configuring the USB controller while it's used as a debug
console.

This isn't strictly necessary, as the xhci and xhci-dbc drivers can
co-exists, but that's a simpler option.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/xue.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index 8863b996c619..ff62b868e906 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -70,6 +70,13 @@ static void __init cf_check xue_uart_init_postirq(struct serial_port *port)
     serial_async_transmit(port);
     init_timer(&uart->timer, xue_uart_poll, port, 0);
     set_timer(&uart->timer, NOW() + MILLISECS(1));
+
+    if ( pci_ro_device(0, (uart->xue.xhc_cf8 >> 16) & 0xff,
+                          (uart->xue.xhc_cf8 >> 8) & 0xff) )
+            printk(XENLOG_INFO "Could not mark config space of %02x:%02x.%u read-only.\n",
+                   (uart->xue.xhc_cf8 >> 16) & 0xff,
+                   (uart->xue.xhc_cf8 >> 11) & 0x1f,
+                   (uart->xue.xhc_cf8 >> 8) & 0x0f);
 }
 
 static int cf_check xue_uart_tx_ready(struct serial_port *port)
-- 
git-series 0.9.1

