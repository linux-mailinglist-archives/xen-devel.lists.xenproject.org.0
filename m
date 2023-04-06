Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E551A6D8E25
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 05:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518705.805523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGl7-0000uo-3P; Thu, 06 Apr 2023 03:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518705.805523; Thu, 06 Apr 2023 03:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkGl6-0000rP-T0; Thu, 06 Apr 2023 03:58:00 +0000
Received: by outflank-mailman (input) for mailman id 518705;
 Thu, 06 Apr 2023 03:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHTq=75=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pkGl4-0000Z1-OO
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 03:57:58 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 350fda72-d42f-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 05:57:54 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C1395C0165;
 Wed,  5 Apr 2023 23:57:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 05 Apr 2023 23:57:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 23:57:52 -0400 (EDT)
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
X-Inumbo-ID: 350fda72-d42f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680753473; x=1680839873; bh=jp
	uAaW3PocLxTjAz2gz/L9CxKTd3JuRdv2jiYB1F7uE=; b=CMyh8xUt2/XeuWuWly
	QYaK3x37WG6/AWwaIZouaj79YATV2yngaZrUzknYh5QowZWBFh8jqXeuLVObvZsp
	EZE0DMqwRYJUkzmwYTClsVB1dg4iirEZfdyvq0mHZfCz7LNXg5CSauXqCHeUWhiV
	YE4lVs3VIouNSDtQawOyHbvr4APMvSpJXF/IafpEAFG7rFTsoiaODXyGRBT4wj1Z
	ghEhB/i5rGNoRC3hDHGh8QtTA/k51E0jqx7U0R2eLnzNYm5NHSdlkPABbEIBU1Nd
	eUV0aDGEbVyIBDpsZfYMzeCDa0ZA2cpKi5K/Hah2cDHEUdniq446RRdL1xeb2pGY
	iTpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680753473; x=1680839873; bh=jpuAaW3PocLxTjAz2gz/L9CxKTd3JuRdv2j
	iYB1F7uE=; b=U4DzV7PsTmqf1zaY1JwFd6kf2wa5MT3kKgH82/AHh332No6k4/d
	QPIvFWtiX3FUUpUkvM4ILD60sx/zRjWLPJPdcmNz0+FJW942jK6mi087jjplNb+C
	SJWxzeY8D6mGriqv6gLVPe+WYVG1nsckhKVUdvY89Rp3DGD82V5AZxvQyiNPABoF
	r3ITXR9HRxVWutswrFJA2h85BTCQoFbku9uLbETBbXxv5TPbD3ozYjWAbuu0onx6
	p3qskz8xSy93PsRGgHXcEwQOOSpJNTjC/iAxbHzfKfZRJiQS7oz8d2XwXS4gqJ4c
	XGWQhfK5yfh+4qubnwk0zJoFTPeD+M3PVPw==
X-ME-Sender: <xms:QUMuZCEnJAzrS8_1heQgGjb4S1Gz6sLM-ULQ-e39y3p12kmMUPcEiw>
    <xme:QUMuZDVr7p5neoqXqR-xqt2ugJd6TpjHo6S5DVBtXfM1q64jZemQCKdV-2CCpulm8
    mdvrsZq9PEryw>
X-ME-Received: <xmr:QUMuZMKbEaLeMyvKPmkpEXYIuERldzqCgKMOSprctK4cGQXrd74dIWH_3ut9VDlYpfEBbdnHJS35VyO3rtZjt33FbIdDjAefwD2GRsXs8caPBy4jv7qL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejvddgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QUMuZMEJK-ssEUCURfCxyuinRUhnJVI06sV9f10a5e1-J1aMYWvvfw>
    <xmx:QUMuZIVRRmR-AkXVZqyVun3HhtGmcK2LwCoEO8y8H2fuebn3scFIOw>
    <xmx:QUMuZPPPsNyqwbuDsByqIMwm9G0BYLBTWQ9FoXCLntN8mlgp9gbSDQ>
    <xmx:QUMuZPQguiSUueALUTVYusHheD_VtEPnGLNQ5mf8YkJ6bM_NlIf48Q>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 4/4] x86/msi: clear initial MSI-X state on boot
Date: Thu,  6 Apr 2023 05:57:26 +0200
Message-Id: <6984a8571dac35d04c85117834d99b00fe1c4184.1680752649.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some firmware/devices are found to not reset MSI-X properly, leaving
MASKALL set. Jason reports on his machine MASKALL persists through a
warm reboot, but is cleared on cold boot. Xen relies on initial state
being MASKALL clear. Especially, pci_reset_msix_state() assumes if
MASKALL is set, it was Xen setting it due to msix->host_maskall or
msix->guest_maskall. Clearing just MASKALL might be unsafe if ENABLE is
set, so clear them both.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v3:
 - update comment
 - clear bits only when they were set
---
 xen/drivers/passthrough/msi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
index ce1a450f6f4a..c9f7eac29ebf 100644
--- a/xen/drivers/passthrough/msi.c
+++ b/xen/drivers/passthrough/msi.c
@@ -46,6 +46,23 @@ int pdev_msi_init(struct pci_dev *pdev)
         spin_lock_init(&msix->table_lock);
 
         ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
+
+        if ( ctrl & (PCI_MSIX_FLAGS_MASKALL|PCI_MSIX_FLAGS_ENABLE) )
+        {
+            /*
+             * pci_reset_msix_state() relies on MASKALL not being set
+             * initially, clear it (and ENABLE too - for safety), to meet that
+             * expectation.
+             */
+            printk(XENLOG_WARNING
+                   "%pp: unexpected initial MSI-X state (MASKALL=%d, ENABLE=%d), fixing\n",
+                   &pdev->sbdf,
+                   (ctrl & PCI_MSIX_FLAGS_MASKALL) ? 1 : 0,
+                   (ctrl & PCI_MSIX_FLAGS_ENABLE) ? 1 : 0);
+            ctrl &= ~(PCI_MSIX_FLAGS_ENABLE|PCI_MSIX_FLAGS_MASKALL);
+            pci_conf_write16(pdev->sbdf, msix_control_reg(pos), ctrl);
+        }
+
         msix->nr_entries = msix_table_size(ctrl);
 
         pdev->msix = msix;
-- 
git-series 0.9.1

