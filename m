Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B91C627A8C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 11:32:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443251.697779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouWkW-00045b-Ub; Mon, 14 Nov 2022 10:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443251.697779; Mon, 14 Nov 2022 10:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouWkW-00042p-R0; Mon, 14 Nov 2022 10:31:32 +0000
Received: by outflank-mailman (input) for mailman id 443251;
 Mon, 14 Nov 2022 10:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VGCG=3O=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ouWkV-00042j-1A
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 10:31:31 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d98d61a-6407-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 11:31:27 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D047F5C01A3;
 Mon, 14 Nov 2022 05:31:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 05:31:24 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 05:31:23 -0500 (EST)
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
X-Inumbo-ID: 7d98d61a-6407-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1668421884; x=1668508284; bh=ucONn4Vdr4H2NM0BX9SZfqEHZEPMffIrGjL
	SNtqQzlM=; b=Vp72NYFefjy9vy3UqOS+H1WUdeGDGamvbwiqHAR/1cOB1t/JaIS
	QD3NER9FDpkdrBLDdMcGdcqUSXEIi7rZpWY5OcbOaEdz9auBDmv4pXIxSha505H6
	aY33T9v5S4K82NwBzx35OkcmqjEa+M44EO71+8+JC27Ui2QgiBUf443CmI924Qm+
	Ttxde/WDwa4/Ye7C5Fz4ptyhJMPV76oF7GnFsSz9LjFzN/0me48J98KRjuy6+Bf7
	/Tlmu4Ff8jvuPClkb+Dszw8dHKd7eXuUQBN081XIwJfrrjAN7thpY3HBgXBxQ1IZ
	LrV7xaXl80LKnTBxGf4/yrRxaqYeKmDnbGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1668421884; x=1668508284; bh=ucONn4Vdr4H2N
	M0BX9SZfqEHZEPMffIrGjLSNtqQzlM=; b=JFF542PckgJqbVZS+4Do7YSqN+jSO
	TKt7h2BkG/G2j+sv5jYmGCUy6L1WiHZplZuxwFTUwZLWTVkzOHDD39s5WIIYGMaW
	EcWM1M9FKtiM/qU47tnZDbAePVpE48iW96buzCy9YL3h9Ec97p8DO9mL1xa7CDZW
	EDkxZ7AM1gSJQhBlqH5oLpimul8pSU4erAGCtfEs1zhaaBJOce0mwqdMe121Gean
	kFkLGyJ9GV9iCDjVlLA3PYRhxHFKeZcC7mYHakHlCTPq4VZkNwbyijS4uKxZCugR
	yryKiOapq7xmT95ay7kxSkg7ZT+EYDmuN4fkBSu5Kgir892NoVsqHhHww==
X-ME-Sender: <xms:_BhyYy27Q0ClfbgulPGQk2fW584f8VfxeovAQ0mB-n8n3RZFBHl4rQ>
    <xme:_BhyY1E8cxIIEzea3J0glo8xwUxC7zooaZ6LvE3y__iXCksmg4tikxeQ6YxJiuxhQ
    17iBEY4R-ddSQ>
X-ME-Received: <xmr:_BhyY67MTTOqtCCMnSe9wf1bQauUbEeQz474qmPvqCScIYyEP_MACR3gggp3sJgWTZiHejhJG-u4uvYMsbyV6v2gidAxuWy8JBAa32iEsXED9vc3W08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedugddugeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:_BhyYz3mT5dWEqWvimriUa9brLKMPwbAy0M0OmBnJK2jHIxy32be7Q>
    <xmx:_BhyY1GaX5ju4DbggbGCupJWT8ENO1GWPcNzgjy_gaAirsxlSSielg>
    <xmx:_BhyY88W7MZuYV0O7LKLzo5T7yxUDWTu78t5-QiJoSOc-Gw8zZoSWg>
    <xmx:_BhyY1DnLAmq-xPE0Yhqvmd3DyXhvdQdhBctMGB418W-SSrPirsKng>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR INTERFACE)
Subject: [PATCH] xen-pciback: Allow setting PCI_MSIX_FLAGS_MASKALL too
Date: Mon, 14 Nov 2022 11:31:08 +0100
Message-Id: <20221114103110.1519413-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Xen domain configures MSI-X, the usual approach is to enable MSI-X
together with masking all of them via the config space, then fill the
table and only then clear PCI_MSIX_FLAGS_MASKALL. Allow doing this via
QEMU running in a stub domain.

Previously, when changing PCI_MSIX_FLAGS_MASKALL was not allowed, the
whole write was aborted, preventing change to the PCI_MSIX_FLAGS_ENABLE
bit too.

Note the Xen hypervisor intercepts this write anyway, and may keep the
PCI_MSIX_FLAGS_MASKALL bit set if it wishes to. It will store the
guest-requested state and will apply it eventually.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/xen/xen-pciback/conf_space_capability.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/xen/xen-pciback/conf_space_capability.c
index 5e53b4817f16..097316a74126 100644
--- a/drivers/xen/xen-pciback/conf_space_capability.c
+++ b/drivers/xen/xen-pciback/conf_space_capability.c
@@ -190,13 +190,16 @@ static const struct config_field caplist_pm[] = {
 };
 
 static struct msi_msix_field_config {
-	u16          enable_bit; /* bit for enabling MSI/MSI-X */
-	unsigned int int_type;   /* interrupt type for exclusiveness check */
+	u16          enable_bit;   /* bit for enabling MSI/MSI-X */
+	u16          allowed_bits; /* bits allowed to be changed */
+	unsigned int int_type;     /* interrupt type for exclusiveness check */
 } msi_field_config = {
 	.enable_bit	= PCI_MSI_FLAGS_ENABLE,
+	.allowed_bits	= PCI_MSI_FLAGS_ENABLE,
 	.int_type	= INTERRUPT_TYPE_MSI,
 }, msix_field_config = {
 	.enable_bit	= PCI_MSIX_FLAGS_ENABLE,
+	.allowed_bits	= PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL,
 	.int_type	= INTERRUPT_TYPE_MSIX,
 };
 
@@ -229,7 +232,7 @@ static int msi_msix_flags_write(struct pci_dev *dev, int offset, u16 new_value,
 		return 0;
 
 	if (!dev_data->allow_interrupt_control ||
-	    (new_value ^ old_value) & ~field_config->enable_bit)
+	    (new_value ^ old_value) & ~field_config->allowed_bits)
 		return PCIBIOS_SET_FAILED;
 
 	if (new_value & field_config->enable_bit) {
-- 
2.37.3


