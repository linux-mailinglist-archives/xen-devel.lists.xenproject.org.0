Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C976ED8E4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 01:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525664.816971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr5mm-0007g1-IV; Mon, 24 Apr 2023 23:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525664.816971; Mon, 24 Apr 2023 23:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr5mm-0007dX-Fm; Mon, 24 Apr 2023 23:39:56 +0000
Received: by outflank-mailman (input) for mailman id 525664;
 Mon, 24 Apr 2023 23:39:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pr5mk-0007dR-2g
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 23:39:54 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c7dee5b-e2f9-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 01:39:49 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D1A32320085B;
 Mon, 24 Apr 2023 19:39:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 24 Apr 2023 19:39:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 19:39:43 -0400 (EDT)
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
X-Inumbo-ID: 4c7dee5b-e2f9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1682379585; x=1682465985; bh=qbUiaxfm8UFf7/Yjc2NC8nBUI
	2byOOEqiabdUu9e3WQ=; b=axzkRcf2tyrGoSe5HbeFOq0VEVnPc+dLM7euLhGyD
	fOpzSWKNk+bB5yTGN1O4UY5/hVxHEX2b/8/gkK5/cKWGipzwb32ch7cM4EuT/8tw
	a7Lgx7uPA3K1CvC0oEqtkhIPf4mG/Z0VLYA/U7ZbCtn9at+lUkn8j9jOmIXwM+j6
	BPj9+gTUz7qF0qLzS1S1pbsuq8NWOrCdzRyRsLHoJK7VVf07+FB9WZ9wuix8qKnP
	/JD7zq9jubKhd5rUfITM5x/6k6HDKHOJS+GdRfO6qMrqLgbdxA45mhYme4/hTyzo
	K4NtdI7yM6mbpl37e36tulslE7xe6fjnFJ8SwEx6Czfgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1682379585; x=1682465985; bh=q
	bUiaxfm8UFf7/Yjc2NC8nBUI2byOOEqiabdUu9e3WQ=; b=T3JjEa8q52HJbz1Dm
	z7kgBweJUW4VTo9Hl9bpsS96Gy08zSiqc3BAfNMIX6x2brQHqP/ybIPwBauSPb9m
	fRSHiaNIiPK6WB18k4g0Cj0CjBzbnQjf8pmTGMdfZaDbePy2PnX7u8h36/565Dry
	0IlT7rOsTrSSLER92pniLR/fFlN3J0wisEw+JNjTDJ1OaVBsEpANJEJ78w+MflaB
	o2M80D8XmPpZzPzxnoJBszg9ss/YXfqblP98dI9QTLXys6TVPya4/ELjcOXtmRiK
	1PawCLefIW+uDeCnUCW75m0cigWYssfhiWR0cqlSCJAFtW7VzUD3MmBstnq5vW/c
	IpbUg==
X-ME-Sender: <xms:QRNHZAqTG2n0VzQRIupHzx-krgaDrN83Za11MsqvchmWspedGujuUw>
    <xme:QRNHZGqzBgjLKc21kCHooAEVrNSbYZPmRyeKiw-HII0irRiXMKjmf6ilGDAoIZyF0
    AKPH5uNBAxLIg>
X-ME-Received: <xmr:QRNHZFP4I7lDH1JJvIY0xUmDsM3XF6xhEenB1O_3bX5YY_-O8TwMtONEePsJBlwfv6puJAsgtYhojuHbExqLIi4nY0t8dSWV_Tlu6BLT1EeNC_qSbwJO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QRNHZH650lDbdW7zDDuT8bbBnk3CD6H6FWVmE3z4-Z4C2wRHD0-tIg>
    <xmx:QRNHZP7yyzxXl53KriApnoVep8q_LtX6dXtSDDca99sRxb__Vs1hkA>
    <xmx:QRNHZHhGNebF-sDFBCkMecgIUt1c0BkO-etHfALB_CiCkq76w7N-Jg>
    <xmx:QRNHZFRSM8yOt0Omlba4rPTTBiYTYiGealqVeGUg-cfHkxc3KcfEfg>
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
Subject: [PATCH] ns16550: enable memory decoding on MMIO-based PCI console card
Date: Tue, 25 Apr 2023 01:39:30 +0200
Message-Id: <20230424233930.129621-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
devices, do similar with PCI_COMMAND_MEMORY for MMIO-based UART devices.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This fixes the issue I was talking about on #xendevel. Thanks Roger for
the hint.
---
 xen/drivers/char/ns16550.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 1b21eb93c45f..acfcce1c5d72 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -272,9 +272,17 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
 static void pci_serial_early_init(struct ns16550 *uart)
 {
 #ifdef NS16550_PCI
-    if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
+    if ( !uart->ps_bdf_enable )
         return;
 
+    if ( uart->io_base >= 0x10000 )
+    {
+        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
+                                  uart->ps_bdf[2]),
+                         PCI_COMMAND, PCI_COMMAND_MEMORY);
+        return;
+    }
+
     if ( uart->pb_bdf_enable )
         pci_conf_write16(PCI_SBDF(0, uart->pb_bdf[0], uart->pb_bdf[1],
                                   uart->pb_bdf[2]),
-- 
2.39.2


