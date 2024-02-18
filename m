Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C41E8593DD
	for <lists+xen-devel@lfdr.de>; Sun, 18 Feb 2024 02:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682519.1061621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbW50-00051y-Bg; Sun, 18 Feb 2024 01:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682519.1061621; Sun, 18 Feb 2024 01:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbW50-000502-8R; Sun, 18 Feb 2024 01:34:54 +0000
Received: by outflank-mailman (input) for mailman id 682519;
 Sun, 18 Feb 2024 01:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J8zP=J3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rbW4y-0004zw-FS
 for xen-devel@lists.xenproject.org; Sun, 18 Feb 2024 01:34:52 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6da7471-cdfd-11ee-8a52-1f161083a0e0;
 Sun, 18 Feb 2024 02:34:49 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id E42671C00079;
 Sat, 17 Feb 2024 20:34:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 17 Feb 2024 20:34:46 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Feb 2024 20:34:43 -0500 (EST)
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
X-Inumbo-ID: e6da7471-cdfd-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1708220085; x=1708306485; bh=AU9JacD3M6P4ufXSFjP46LL0rxd7nWVR
	0IwQtMoYP8E=; b=b4lP9LvSM4NAibaLeF+jttCMRv15OqJD6XFnFaDb6wxX/ioj
	pNLLBrs26Ela0fPx8+Urf3BborVGIndJ5TilLOAK9uXMEnrjmjxbK3BItXugqyTE
	ZzaxPDx/C1hh6qbnjRFHpu2x6cIVMsZai8/6dcxRk46YxU/Ve3fVHCN3dw1BKURZ
	5mJUc8eRmIEeYIAoO1mPeE24vA9OuQKszTElD/PnI+bEFkJ9cGNqUVzUwvmiTUVn
	dzDJacsnFI5PXpXkEASHY010KAOja7SvmAT3qxaP7WPpQ8umflTNN6rv3VWo0anM
	YEsM2TOyQrFtp3XFyjNi2VhjWF1knUH+dUt8ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1708220085; x=1708306485; bh=AU9JacD3M6P4u
	fXSFjP46LL0rxd7nWVR0IwQtMoYP8E=; b=csIL74bWjCqynx+cDDqtjAcwSmCDs
	Ju8UKfLJ5+BV+WJcC5+djITjIQw3oWDcR5tJNVxcxlLr+sWYPr2MYUqFDrVyrVs4
	T6EV5/Jk2+5du4flLuNAvE5NTe841w6VVV5aZ8lUV742idr/WPjx9dvklzGEGeZw
	vQHQvlsYTV3Bw7H+dsway1uzSndFX9InXs/M/SmFB+3yK42/34DfRJPRw93g7HXQ
	jQYDtL1gLP+xYPP6B4v0PC9HFPMKHYa79jhc1XE5Ukcwp6LNXsSW+K85b6Dij12H
	/LOHf8QNP9sS6ekCQ9teQ0R2XkllHpra2LFRBLu68KyvPgW7JpthqqLJg==
X-ME-Sender: <xms:tF7RZVAtqzZcxJ2-Y9Btrr8fChkAg5Dp5L0DvOzElBrBMaEAUslFYQ>
    <xme:tF7RZThHTn-6dCa2iBfoJ3RZqVAEFLoFKZjV48Pm-aIa28aUVYKYILiCUGlI_uk5P
    t4jsPo4Q4kd4w>
X-ME-Received: <xmr:tF7RZQn7ULd36Pg99sNbcgdG4n6pM8kTg8Lk2Ug2nJ9WBHY8SLrxSTuD4TY45iE8YZ75KdSkXos8Z6sIPYfNyDE_4WosVCApVSfpf9n9eyjyeRnqIo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:tF7RZfxkNE7UDBaC8KkaFqHlx4O2SPVudqrrO8c8bEqbzvspWiUNfw>
    <xmx:tF7RZaQrnTta1CQcab4-V8vQGENOSbuMMGA_3ayhz9ZOL-09NN3vTA>
    <xmx:tF7RZSaJN4txQ1RTfOmU7pG2k_e5diXro5VFfRgJjrehjpNafI-HhQ>
    <xmx:tV7RZXQPOCcMy73Q4cytZO7RrPRbdUedlap34Do9UjmuXHp_JwW7skjJrvs>
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
Subject: [PATCH] ns16550: add Asix AX99100 serial card
Date: Sun, 18 Feb 2024 02:34:29 +0100
Message-ID: <20240218013431.274451-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's 4-port serial card, each port is presented as a separate function.
According to the specification, it features 256-byte TX FIFO buffer.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
It's a card plugged into a box that can function as yet another gitlab runner.
---
 xen/drivers/char/ns16550.c | 12 ++++++++++++
 xen/include/xen/pci_ids.h  |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 97bf0985344a..00c0da3f373c 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -92,6 +92,7 @@ struct ns16550_config {
         param_exar_xr17v354,
         param_exar_xr17v358,
         param_intel_lpss,
+        param_asix_ax99100,
     } param;
 };
 
@@ -842,6 +843,12 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .mmio = 1,
         .max_ports = 1,
     },
+    [param_asix_ax99100] = {
+        .reg_width = 1,
+        .lsr_mask = UART_LSR_THRE,
+        .max_ports = 1,
+        .fifo_size = 256,
+    },
 };
 
 static const struct ns16550_config __initconst uart_config[] =
@@ -1170,6 +1177,11 @@ static const struct ns16550_config __initconst uart_config[] =
         .dev_id = 0x7adc,
         .param = param_intel_lpss
     },
+    {
+        .vendor_id = PCI_VENDOR_ID_ASIX,
+        .dev_id = 9100,
+        .param = param_asix_ax99100
+    },
 };
 
 static int __init
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index e798477a7e23..2a19f4ab7872 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -11,3 +11,5 @@
 #define PCI_VENDOR_ID_BROADCOM           0x14e4
 
 #define PCI_VENDOR_ID_INTEL              0x8086
+
+#define PCI_VENDOR_ID_ASIX               0x125b
-- 
2.43.0


