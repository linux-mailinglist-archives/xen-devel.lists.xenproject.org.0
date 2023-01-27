Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BD367DD05
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 06:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485291.752400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLGyf-0005E6-VX; Fri, 27 Jan 2023 05:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485291.752400; Fri, 27 Jan 2023 05:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLGyf-0005Br-SV; Fri, 27 Jan 2023 05:08:41 +0000
Received: by outflank-mailman (input) for mailman id 485291;
 Fri, 27 Jan 2023 05:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8w6d=5Y=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pLGye-0005Bj-Bu
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 05:08:40 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6de638d-9e00-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 06:08:37 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 329725C0241;
 Fri, 27 Jan 2023 00:08:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 27 Jan 2023 00:08:35 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jan 2023 00:08:33 -0500 (EST)
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
X-Inumbo-ID: a6de638d-9e00-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1674796115; x=1674882515; bh=Qk3I70q4GCQbspH1CXoRlayOxU4vaCkRWWj
	ciJNXOHs=; b=UoI1Lf6cisrESiDEjHX0jyCFz8HgWlc8IKhQYQ+/WPdSsEM4cC8
	kF3SHkWuYNWFlYhJUkmy+3+F4NVe0PSvrlQVCBgqSLmujy87wDU11uoz7f9vA+Zq
	BgPvkkmjniYxbSNyjn0j+YMeG35bdm8fwcIlBYXHVpY6Q+8vhMfRCT+DSS6McSSR
	rELtCQSyZQCdUztYGurt9LLnEAG/ld3AlofLuQ075wO4s4AWa3toTjjpJdU/Hr1D
	Mcckf6XKvMj++M70lALneACzsr5r3NMKYMjWkAidLtqgs409oEUklIqP+hb1+6Gx
	CipEJTvgact2JfSknwRHFWhqvG9lsvQRAGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674796115; x=1674882515; bh=Qk3I70q4GCQbs
	pH1CXoRlayOxU4vaCkRWWjciJNXOHs=; b=gj+/hk7a0WHa7zTzV03WZPwCizOzg
	QDX+gbUlW/S2rITQjs7FtoQ3atYZQsJqHn4fYVMNR6h06A900ADZIWBEjwPDw/y/
	nLPPcQ3rFiT9py/Osff/Jo4HTsxNpEI/p7LkUqcoj16ImtMA6ollzDuGsAxzrcXY
	ksJGfW5OF/nWhZuxLxtbQTIkqokRm2KnkilF2p0mx/4J/ZWCB4x8+OSi3Nei+Gwd
	vVC71HUDEMsJQND6YkhZZZORxzdcL7V3DLHamWc5Jo4djVfKzBzwWlY7w1cFi7ym
	F4zrc/Sn3hEN11CfoEf5Jfzcr6oE9nch643GqzCLxg/dMa3XzD4wGNFgA==
X-ME-Sender: <xms:UlzTY1S40NxBomxMWr_EMSJeuH09qck2smw95jB5inDukrCGBUrWZw>
    <xme:UlzTY-wP4JcwD_mtgMeChz-BTyK9ioLblRcgBASt-hAIC_M1ey0ptMBh1AdVAju-l
    SPOWQcRWTXUCg>
X-ME-Received: <xmr:UlzTY60npUVlmQ4NX5BsPnFjF669IKSCBLL2DQ3RjgWdMs9QoY5jIV3AaE6a6zQzZiZmD8rtzmHh2DE72DXMsjUXGdNUudurp7mIzICGHS-hXHFgIekm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvhedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:U1zTY9C-VuehQ4MCv8wStqp2IO7KnalAuM0ULNuZIMxVDlQ-cADcAw>
    <xmx:U1zTY-jiYfOixCl5nYUd-PncczRo35ydL7wvz60db9raagXBYo9AGA>
    <xmx:U1zTYxqpUHFEKDLm3EFCEAauBLDm-O_6CeCpYz_y9uZAMb2xpp59Rw>
    <xmx:U1zTY_tX1zCEKcHpUlA_xoWzogiirisIhumeCFAPeqiN0A4ksSGN8Q>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH] hw/xen/xen_pt: fix uninitialized variable
Date: Fri, 27 Jan 2023 06:08:14 +0100
Message-Id: <20230127050815.4155276-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen_pt_config_reg_init() reads only that many bytes as the size of the
register that is being initialized. It uses
xen_host_pci_get_{byte,word,long} and casts its last argument to
expected pointer type. This means for smaller registers higher bits of
'val' are not initialized. Then, the function fails if any of those
higher bits are set.

Fix this by initializing 'val' with zero.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 hw/xen/xen_pt_config_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index cde898b744..8b9b554352 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1924,7 +1924,7 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
     if (reg->init) {
         uint32_t host_mask, size_mask;
         unsigned int offset;
-        uint32_t val;
+        uint32_t val = 0;
 
         /* initialize emulate register */
         rc = reg->init(s, reg_entry->reg,
-- 
2.37.3


