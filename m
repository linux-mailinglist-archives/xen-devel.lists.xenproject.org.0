Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C976491C1
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 03:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458706.716511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4BnT-0002eW-U9; Sun, 11 Dec 2022 02:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458706.716511; Sun, 11 Dec 2022 02:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4BnT-0002cd-LN; Sun, 11 Dec 2022 02:10:31 +0000
Received: by outflank-mailman (input) for mailman id 458706;
 Sun, 11 Dec 2022 02:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=97oD=4J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p4BnR-0002cH-5w
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 02:10:29 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9eb4daf-78f8-11ed-8fd2-01056ac49cbb;
 Sun, 11 Dec 2022 03:10:26 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id AB4185C00AD;
 Sat, 10 Dec 2022 21:10:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 10 Dec 2022 21:10:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Dec 2022 21:10:24 -0500 (EST)
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
X-Inumbo-ID: f9eb4daf-78f8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1670724625; x=1670811025; bh=JbnZPi5CqE
	43ZODZw6U/mp6Yrnv9+Sh8ckKp+USh51M=; b=IQ3LNIaB5kob96AC1AFnfCJU0Z
	mxdSDoM8TmeyHS7asyLDDOVhKgXwBW/bp75VJAajys3E7JbNYR4IBZ7FVjod7RM2
	8ld5f/VObj0YRitO1+Ec1iRmcSlEt2BndWES8MMABewnLp+kyhgdn6sPEpv3zGY/
	W4KPTFnrwEK12TbdF6JmzQ9uXdxTQ1XSCIxxBNIeOdkYW7dmyUKNrD0dKl2LIw1H
	S0Gw/IC0PUYXKAZIRKWDOZcdeImyOvEHgk6MQr8ne0/6KEjQNT3l7aUwCJprBSGt
	S5Pl0gcR/4BGoAGKc79/dBA1QBFjgKnxl3utwDwegjpj6YfYPkQ75gwmNQNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670724625; x=
	1670811025; bh=JbnZPi5CqE43ZODZw6U/mp6Yrnv9+Sh8ckKp+USh51M=; b=S
	lCUti6o4f9XbjvUPVi2RnTlevm225dmVZtQodZ3tOnbkCe/KhnYQV9DlOpaAraVI
	JKodXZsLyg5VmNSafrWP6pean85kMKiSYrZ5HiQ19KqaaRd5O5D71XCD0usX+OdD
	eHrCsJirgTp1jI0IRDsM7VMCeJ6koogKSriStG8A9r3nC5wSCLRg9VBQgEfvkwMz
	YofxB2S7NBFI1w5snaGNOCmfWBE9oDlqk36ZZnnfsdVQYWZ8LYvLQowU4+jPDIU/
	+dPlVxo/lB9veu6JdzJmmsCsfL+ilPU04cVFKzVz9tn7cIAa6fiOr5JUN5EB0sZ7
	TPrnKnzFNAyCqMqztCaKA==
X-ME-Sender: <xms:ETyVY6YtTu9QuaCEIWfYi6XW9TnzsArHVWL1XtdBKsoAdwUf-5vT9w>
    <xme:ETyVY9avSnINNBjKRJqkobpncSoaIBUXioAo97lKs7pCHIUGMIkO0SdIpo9M0uBmB
    xtI4sNx5-2yRA>
X-ME-Received: <xmr:ETyVY096b2jWSfnZ65s-o0coLdux2WIW3hdgV4cXYLgt1kY2EypPVNxWQKQs-XzG5xj7XtHL0MowB0exan7US3GhKe3gsDqLqY3Dv8ev9XcBEbydx-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:ETyVY8p5ESeepHnsR5JTrLLw4-jhum-NM_4Mx7yZ1vRkrD3jt1726A>
    <xmx:ETyVY1obWAQNWcbPhvEGyG2uIJkSkMtlgY-LHrmLBWugGYduO0SVOQ>
    <xmx:ETyVY6Qd9cVAEMgDDxmnwvkmovgbD5YdZxNTKXEnwRpknoLtYHdxeg>
    <xmx:ETyVY2dI2vmchh8D55H1aw3VWkxv81FUU-12KFhCZja4WCT7crc8Fw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 1/3] drivers/char: support up to 1M BAR0 of xhci
Date: Sun, 11 Dec 2022 03:10:04 +0100
Message-Id: <3398f603208397e2894dd452e9de047431599c58.1670724490.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
References: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

AMD's XHCI has BAR0 of 1M (compared to 64K on Intel). Map it as a whole
(reserving more space in the fixmap). Make fixmap slot conditional on
CONFIG_XHCI.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/fixmap.h | 4 +++-
 xen/drivers/char/xhci-dbc.c       | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index bc39ffe896b1..516ec3fa6c95 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -25,7 +25,7 @@
 #include <asm/msi.h>
 #include <acpi/apei.h>
 
-#define MAX_XHCI_PAGES 16
+#define MAX_XHCI_PAGES 256
 
 /*
  * Here we define all the compile-time 'special' virtual
@@ -45,8 +45,10 @@ enum fixed_addresses {
     FIX_COM_BEGIN,
     FIX_COM_END,
     FIX_EHCI_DBGP,
+#ifdef CONFIG_XHCI
     FIX_XHCI_BEGIN,
     FIX_XHCI_END = FIX_XHCI_BEGIN + MAX_XHCI_PAGES - 1,
+#endif
 #ifdef CONFIG_XEN_GUEST
     FIX_PV_CONSOLE,
     FIX_XEN_SHARED_INFO,
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 86f6df6bef67..60b781f87202 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -268,10 +268,12 @@ static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
 {
     size_t i;
 
-    if ( size != MAX_XHCI_PAGES * PAGE_SIZE )
+    if ( size > MAX_XHCI_PAGES * PAGE_SIZE )
         return NULL;
 
-    for ( i = FIX_XHCI_END; i >= FIX_XHCI_BEGIN; i-- )
+    size >>= PAGE_SHIFT;
+
+    for ( i = FIX_XHCI_END; i > FIX_XHCI_END - size; i-- )
     {
         set_fixmap_nocache(i, phys);
         phys += PAGE_SIZE;
-- 
git-series 0.9.1

