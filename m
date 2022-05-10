Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F4522071
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325839.548608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSG3-00082n-RG; Tue, 10 May 2022 15:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325839.548608; Tue, 10 May 2022 15:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSG3-00080G-No; Tue, 10 May 2022 15:58:43 +0000
Received: by outflank-mailman (input) for mailman id 325839;
 Tue, 10 May 2022 15:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kgyf=VS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1noSG1-0007kf-Jf
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:58:41 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f516219-d07a-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 17:58:40 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E28E5C0048;
 Tue, 10 May 2022 11:58:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 10 May 2022 11:58:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 May 2022 11:58:38 -0400 (EDT)
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
X-Inumbo-ID: 0f516219-d07a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1652198320; x=1652284720; bh=f2wikOacR1Pgp
	cgiF7iAdbBxzhDpXOHQwXdF9nAGshc=; b=J78rH3A2uDDlFcLKejFwVNWwZflzw
	e5AF2vvT/tLHTnTLTCwQ2Qoy+THzSyUlUz2NeULTdJlAmxKuiHP3BRHM79QyrHpC
	TYVNBiM0fh2Eg2Ygd4shj6DuV2JMnchY5JSsPQfnzS7gqSwwNiwYk/Mq9rag8+fe
	y/eMsKHBJybrRuUe62kQ8xrxoWq3Gv2Yq8bjeGXiISUDd/N89Ggf226Ix6F4TErJ
	miv9MZAggRQoCn4SQr/kr2P1nzMB81CRFM4oDgSwpgoZhirtV3CVvXfGfBov6Gh1
	/3PRLTNyv3Mv01kA1Ro+k3J1h4buoR5p60m1CmhaGqqHwSfP2XmfFqtjg==
X-ME-Sender: <xms:sIt6Yqs-B19jP7Q_UjTWKmHRkVljRycIj3Wn4V_Q8Qo-JW5vp0252g>
    <xme:sIt6Yvds_U8gI1o0-nzVxAKJ30mPVZGGIbKwKe9VcaCSk2gr-vrFseOhk9Ex2b8cu
    h1mOFzewf-jxA>
X-ME-Received: <xmr:sIt6Ylyn4VvXk7SEgG3-nl6LiuMPpGEvIITZkxSrV-vC7061ZtfnsUqct0dti2RYAbV0R8-pkoTM6TT3fSWUVOpWBUHT10RWct78_Wp3MoBDkfn_ehk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedugdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:sIt6YlNWJDH-w0BVNuTXfNnAqh4qm-bRaBJS1g5HUYWL2MPJNfRPcA>
    <xmx:sIt6Yq8Xz1wqPRI9vv3u_TAEVMXWJVAZyoywYaeai1E96mF_ZHlT6g>
    <xmx:sIt6YtXrrqvC9FcGMTvWpzE8PiQQQhFGKY0rl8oLaG80T_91ifOnWA>
    <xmx:sIt6Yhln1_HDpFmggEoo2Im-VxJpdu1Qbi0XFLfDTH7mfdefMRAVOQ>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] ns16550: Add more device IDs for Intel LPSS UART
Date: Tue, 10 May 2022 17:58:24 +0200
Message-Id: <20220510155824.1779789-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510155824.1779789-1-marmarek@invisiblethingslab.com>
References: <20220510155824.1779789-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is purely based on the spec:
- Intel 500 Series PCH: 635218-006
- Intel 600 Series PCH: 691222-001, 648364-003

This is tested only on TGL-LP added initially, but according to the
spec, they should behave the same.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v2:
 - new patch, adding more IDs to the patch that went in already
---
 xen/drivers/char/ns16550.c | 80 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index b4434ad815e1..72283c106514 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1077,12 +1077,90 @@ static const struct ns16550_config __initconst uart_config[] =
         .dev_id = 0x0358,
         .param = param_exar_xr17v358
     },
-    /* Intel Corp. TGL-LP LPSS PCI */
+    /* Intel Corp. TGL-LP LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xa0a8,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. TGL-LP LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xa0a9,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. TGL-LP LPSS PCI UART #2 */
     {
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .dev_id = 0xa0c7,
         .param = param_intel_lpss
     },
+    /* Intel Corp. TGL-H LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x43a8,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. TGL-H LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x43a9,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. TGL-H LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x43a7,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-P LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x51a8,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-P LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x51a9,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-P LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x51c7,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-P LPSS PCI UART #3 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x51da,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-S LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7aa8,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-S LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7aa9,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-S LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7afe,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-S LPSS PCI UART #3 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7adc,
+        .param = param_intel_lpss
+    },
 };
 
 static int __init
-- 
2.35.1


