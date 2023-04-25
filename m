Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E136EE413
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 16:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526095.817577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prJpG-0000Y0-JG; Tue, 25 Apr 2023 14:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526095.817577; Tue, 25 Apr 2023 14:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prJpG-0000WB-GN; Tue, 25 Apr 2023 14:39:26 +0000
Received: by outflank-mailman (input) for mailman id 526095;
 Tue, 25 Apr 2023 14:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHzL=AQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prJpE-0000Vm-VV
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 14:39:25 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f626a355-e376-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 16:39:21 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 91E7E3200CD9;
 Tue, 25 Apr 2023 10:39:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 25 Apr 2023 10:39:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 10:39:15 -0400 (EDT)
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
X-Inumbo-ID: f626a355-e376-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1682433557; x=1682519957; bh=Yo6puT7IlnChcJRZUA4S2RX7x
	2nQa/b22dTRjpdjRFk=; b=NMR7MnGJfxRxH+qV7woA8jZrxU/29CsoaLANUQE9R
	q9GxQzDWAJgUn2/yv4/POsMjqQttyxGbeaMJE0E1+DCBc+Hm6YK5qunzPz+OsxTE
	x3Py0KfUOkJsKiJUA6pqcESQIaLnWFCioLuhIIa99FiHsdeJOU90kZwg9ZkX6yaz
	wbxllesRpIou9Qhr8ojMIOL03+Ocx6M5eZmoAnK4YmwW5aU++E2j3UWqVss7VGxN
	j+WESSxbllYl6rYaHA3WSnfGBKCXxaf9SBhIvXs/aO5HKL8fE7zEVKE/n00X+U5Y
	wVcmsOSxmx065wSQ72TnJfH9WivdQZ0oLpgdiufyHKESQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1682433557; x=1682519957; bh=Y
	o6puT7IlnChcJRZUA4S2RX7x2nQa/b22dTRjpdjRFk=; b=ItE/ETWrUTce9lCu0
	ezIMyA2r0sxzDYNJENwHoiUSYeTbDB4o0j9jKFDzV++YLj6lXqskQ0D5hDN/9UrA
	WAD4xv+JnQrR85fvhsoFtnzcN258z3bSjZvnp8g963odrg8tWrT5in/8PGikYtkg
	38+NY8nwB4X+dpCGr/m/OWFjogsJCTCU3s2AvmCpvQor8mzCYE4ilo/nf9mHsWuP
	AYnppOLLnNCEHt/VDwB/PmSqfLQXj5Fy4Ts5e7n/WOrKaMJLfHjkr6sn0eRAWV1W
	XGYiR1ZAhH2MVJgRt70RiXfJj9LJ5X/5Ag28quxTADlyExb9SvEkSsPfvfGPYasH
	oG52A==
X-ME-Sender: <xms:FOZHZGbcVn6nrVvpFokIbp0HrcT1-AzZhivSqHmYaY5dxSvSUP9Tkw>
    <xme:FOZHZJaX_b4nwMPkPa8xUs3B7UC4ESeNUzl_2ekk4JHV_PvaV_B6YYN7pFJxE6OAC
    Z5MwZpNjLUx2Q>
X-ME-Received: <xmr:FOZHZA-n0vGhwGj2bFlyIHC52qmclhBcwGj6XKiue9Fs-EAMw7gBJ7uRRgZgNoo9WjpIM0cwzlFOveH5mu5y_iLfnUApjzwkCobCaespYAG7KX0fn00F>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:FOZHZIoHgIHcc3co1pbHz82zevfUDsmrSgjM6pK4ydQkgqgfnNyvEg>
    <xmx:FOZHZBr2xAWv3k-xpzziezsP2Ys1qOEyj-0ZirP0QWJt9bwLNhLYCA>
    <xmx:FOZHZGTB1lZTwDn9MOtKq-N4So9JSQ58n1-W9Bp-2SWKrzeqIykQWg>
    <xmx:FeZHZKACaZ9245IKBwyZ2rAGmcMSCLg-HBLBzUgtED9j8x0NQdZ0Fg>
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
Subject: [PATCH v2] ns16550: enable memory decoding on MMIO-based PCI console card
Date: Tue, 25 Apr 2023 16:39:02 +0200
Message-Id: <20230425143902.142571-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
devices, add setting PCI_COMMAND_MEMORY for MMIO-based UART devices too.
Note the MMIO-based devices in practice need a "pci" sub-option,
otherwise a few parameters are not initialized (including bar_idx,
reg_shift, reg_width etc). The "pci" is not supposed to be used with
explicit BDF, so do not key setting PCI_COMMAND_MEMORY on explicit BDF
being set. Contrary to the IO-based UART, pci_serial_early_init() will
not attempt to set BAR0 address, even if user provided io_base manually
- in most cases, those are with an offest and the current cmdline syntax
doesn't allow expressing it. Due to this, enable PCI_COMMAND_MEMORY only
if uart->bar is already populated. In similar spirit, this patch does
not support setting BAR0 of the bridge.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This fixes the issue I was talking about on #xendevel. Thanks Roger for
the hint.

Changes in v2:
 - check if uart->bar instead of uart->io_base
 - move it ahead of !uart->ps_bdf_enable return
 - expand commit message.
---
 xen/drivers/char/ns16550.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 1b21eb93c45f..34231dcb23ea 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -272,7 +272,15 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
 static void pci_serial_early_init(struct ns16550 *uart)
 {
 #ifdef NS16550_PCI
-    if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
+    if ( uart->bar )
+    {
+        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
+                                  uart->ps_bdf[2]),
+                         PCI_COMMAND, PCI_COMMAND_MEMORY);
+        return;
+    }
+
+    if ( !uart->ps_bdf_enable )
         return;
 
     if ( uart->pb_bdf_enable )
-- 
2.39.2


