Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022CF6F8B92
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 23:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530668.826417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv3I0-0002QX-AC; Fri, 05 May 2023 21:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530668.826417; Fri, 05 May 2023 21:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv3I0-0002No-54; Fri, 05 May 2023 21:48:32 +0000
Received: by outflank-mailman (input) for mailman id 530668;
 Fri, 05 May 2023 21:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HMjG=A2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pv3Hy-0002Ng-F8
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 21:48:30 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90e2af1c-eb8e-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 23:48:27 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0462C32002FB;
 Fri,  5 May 2023 17:48:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 05 May 2023 17:48:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 17:48:22 -0400 (EDT)
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
X-Inumbo-ID: 90e2af1c-eb8e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1683323304; x=1683409704; bh=63RaELZf0bZZdNao1GuFs3vFD
	Am34PcStRchPykUHYs=; b=g4cW2l8rkHmfM8cL4Kfrd3fptPg848oUPhuCXcs6J
	U3FDMOY1eqDrQ6xQSbodW3pDeq1j0CUnCuaXvb4Tgp+RrNjj4VggdeJg/kKR3WGr
	Ud2gQCni7nLWTVvSUn4KAdRZaio48MySCH0YJAHEYT5efF9+G26re1ZkoC+VRzky
	SyT6WRosYuHNkSbqeAonschZ0v6NAFyYcwwME5AGRJUlWUQ2I/i/VcL8tOf4G190
	Qpy6LBwx2LDz068e6cpr7u4JjQiyczEtSBZyXr3nfXM6zFg/NnDSFuw2MLU42DD8
	RM0m7PwJqGd6xd9GQSsmJPjwx+SirBVIgX4HPlMzYCSxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1683323304; x=1683409704; bh=6
	3RaELZf0bZZdNao1GuFs3vFDAm34PcStRchPykUHYs=; b=DWyn4fEISOpJSSncY
	xcOaePj4xLw1A55hu+5JxyWyn5eqtuW0eddWMFKbD9l/opNYg6ccWq1LZRLykatB
	3PUQtcGZhoMzHey8I2pdrgVVp8MYZtyugNLQhQbGBm4TS7WZYYbDx4oDRqgkLtq7
	i0ckYS3myC479neV4z4RYmj+RemC7dH6QUR1hxLrAv949s47MEdajYEPUvrP/giQ
	Y4V0cAxXj9pDPvpVUlP57sMcUJ+n0OL4AH5751L1R0RX3O62j+4zhfH9iA5gYWeK
	ctJG5IZ38ezFhdDqZAFKa1T9Na00qNilCA26MNxaGCJZQGA5JTXTjDcPwCDBc2SU
	2Dwww==
X-ME-Sender: <xms:qHlVZNKuEvSP7jGSvzsMfG8uQ-lEMaaCV-EVvMOzNUHOIa-faaO_oA>
    <xme:qHlVZJI3k0IwHuf2JoEEgzr6yEV3bH5TwE3ZBDEya7PZmskunAAs80y3dxXV2ziE2
    DklobAcBYGk0A>
X-ME-Received: <xmr:qHlVZFstlGpxbAAOsfNZpK4zfeI4qDrSoD0hedFjExsQ9DtKQfKdFPdbFxkWdhU0d00YuLgjfGR8yCcfXv5dJnf3wG1si3j4pBz8ZSxGLWYTejINbI-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:qHlVZOZ9noAs2Nu3zsjn6tS5oIOMxPP72YIadq1tC2mKvNiJ5Ty32A>
    <xmx:qHlVZEYD5Oiqx7z6cWWdSfNi0hnjPqKXQe1DPTs36_0L32J8VVIR_w>
    <xmx:qHlVZCDldD0VAzg-Dj1rgRkUAZtSE7w6Y5qUh6jUC2PGN8pA1WDsHw>
    <xmx:qHlVZDxqiDhrV4_bQv6zaMUxR68OCmga7KJhYmeXXunmAWz_OWVgqg>
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
Subject: [PATCH v3] ns16550: enable memory decoding on MMIO-based PCI console card
Date: Fri,  5 May 2023 23:48:10 +0200
Message-Id: <20230505214810.406061-1-marmarek@invisiblethingslab.com>
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
Changes in v3:
- restore io_base check
---
 xen/drivers/char/ns16550.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 1b21eb93c45f..ae845a720f7a 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -272,6 +272,14 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
 static void pci_serial_early_init(struct ns16550 *uart)
 {
 #ifdef NS16550_PCI
+    if ( uart->bar && uart->io_base >= 0x10000)
+    {
+        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
+                                  uart->ps_bdf[2]),
+                         PCI_COMMAND, PCI_COMMAND_MEMORY);
+        return;
+    }
+
     if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
         return;
 
-- 
2.39.2


