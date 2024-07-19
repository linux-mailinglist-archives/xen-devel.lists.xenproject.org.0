Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD593727E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 04:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760837.1170805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUdRs-0002d0-9X; Fri, 19 Jul 2024 02:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760837.1170805; Fri, 19 Jul 2024 02:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUdRs-0002bJ-5f; Fri, 19 Jul 2024 02:34:20 +0000
Received: by outflank-mailman (input) for mailman id 760837;
 Fri, 19 Jul 2024 02:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+sj=OT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sUdRr-0001tA-4R
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 02:34:19 +0000
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64e0b003-4577-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 04:34:17 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.nyi.internal (Postfix) with ESMTP id 96E87138027B;
 Thu, 18 Jul 2024 22:34:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 18 Jul 2024 22:34:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jul 2024 22:34:14 -0400 (EDT)
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
X-Inumbo-ID: 64e0b003-4577-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721356456; x=1721442856; bh=3q36D4bJYb
	KeTNzDrlCHr7vVdpQaHyX3JUKiZcT8bno=; b=uC3Kdt+Eja/wVLXjhnTkweQaCU
	bZFHxr1CGB2XbOIpe2jw1BoyqPaQnriPt4SQdNmIFsgTUe30oC3ovt4oIAnCprxo
	uYEIxmLlyzuVUQXOut1b64Zmn+CCfacUqkCoQrcSBdls7qmMoOByp9iQ6Yi4TjLI
	ew5XlXFlIufaErP3op/ChqcI52r1sXxPJGvz/JtcBx0ZQl0oBtKFozTgNG3dCwRt
	h5+QCUM7CCClGfzPjdLewkEiHsdaPxdQBmkaPdvRe7v7UEz2/KKvWaaKU/f27Esp
	kGisrdCZCkR4WW+ZoAplb1Q3LxHXEZHKDoyKi0tTCrQy8nEWAz6wxR6nCo/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721356456; x=
	1721442856; bh=3q36D4bJYbKeTNzDrlCHr7vVdpQaHyX3JUKiZcT8bno=; b=T
	4tLFTbsfKqYi0jIQcTOCN8TgcMIfKS2F7PkoAhtHDueGpj8Wtvgkhk2tsNXwD9tt
	FetKe1A8p5H3YBmIvlM/ZnEtjYfvr5d6nuJ762AxlPVdj9duc9Mi2BNJ8ggvdDS8
	Lja0StmNqj5HLUBxwE88Ccs4XBlBHbtUEKVQbhf22rr740uOZAgkXpx4WRcRsgXl
	GadYhNVyKOUuwM2/knfm0fHopF40s/C6LK0Opz4zWJJ9WDhDTLkYmrD0vCdGBZYL
	oTM2wDckr93gIeSkSdKpauTJB3blw8KTg4QsKrz/srH6PZqSm1SH/zMqvJda/9Y3
	XfLzDmcLNbO5LSFk8MVaw==
X-ME-Sender: <xms:p9CZZq-PaZ4oWRFh_sYzqZIZDxkfzlMyf9b84bT5LVjotlCQeyhxTg>
    <xme:p9CZZquDU8mGJTbCBxPGuAXb0zxAbnERhY-YhsMN1yQDtwpB4qqjI3uwFJBXlpHGq
    2W07hJCkkd86g>
X-ME-Received: <xmr:p9CZZgAK32MllKwtaI1VJEWteFoEYOQuCxjMT3mnuY70oGohXF3de2-bQANPsCM_tbbdTtTf-XJKif-KFvLQThJ0jqCh1qVBpc5Pt4nc0aiAzhAfKXs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedtgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:p9CZZieu1mWb49xw-4hDo-HH0-0fFGoEQTvF-z3nQWsZKb1HQ9L_rA>
    <xmx:p9CZZvP0FtciuIrw9ut43lag1h2jeZgzpQqhqKQyG3-IE3X9H2qdfg>
    <xmx:p9CZZsk5wz9P7ydahk1OyPK4AhDgwp0sovkGUhMelmjd-6q7EytSgg>
    <xmx:p9CZZhvC85E5GeLp5OUB-R1ujYmXhy4KJ9Ud6isg8j_IrgHP9la0Gg>
    <xmx:qNCZZq12toVgo0Sybs1hfoU9yJMVKfm5KgSkl9EikT35Su0APd3Z8ydZ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 3/3] drivers/char: Use sub-page ro API to make just xhci dbc cap RO
Date: Fri, 19 Jul 2024 04:33:38 +0200
Message-ID: <62267309025cd78dd4c901d6c1d0f9880cdd0c73.1721356393.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
References: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not the whole page, which may contain other registers too. The XHCI
specification describes DbC as designed to be controlled by a different
driver, but does not mandate placing registers on a separate page. In fact
on Tiger Lake and newer (at least), this page do contain other registers
that Linux tries to use. And with share=yes, a domU would use them too.
Without this patch, PV dom0 would fail to initialize the controller,
while HVM would be killed on EPT violation.

With `share=yes`, this patch gives domU more access to the emulator
(although a HVM with any emulated device already has plenty of it). This
configuration is already documented as unsafe with untrusted guests and
not security supported.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
- restore mmio_ro_ranges in the fallback case
- set XHCI_SHARE_NONE in the fallback case
Changes in v3:
- indentation fix
- remove stale comment
- fallback to pci_ro_device() if subpage_mmio_ro_add() fails
- extend commit message
Changes in v2:
 - adjust for simplified subpage_mmio_ro_add() API
---
 xen/drivers/char/xhci-dbc.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 8e2037f1a5f7..c45e4b6825cc 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1216,20 +1216,28 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
         break;
     }
 #ifdef CONFIG_X86
-    /*
-     * This marks the whole page as R/O, which may include other registers
-     * unrelated to DbC. Xen needs only DbC area protected, but it seems
-     * Linux's XHCI driver (as of 5.18) works without writting to the whole
-     * page, so keep it simple.
-     */
-    if ( rangeset_add_range(mmio_ro_ranges,
-                PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
-                         uart->dbc.xhc_dbc_offset),
-                PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
-                       uart->dbc.xhc_dbc_offset +
-                sizeof(*uart->dbc.dbc_reg)) - 1) )
-        printk(XENLOG_INFO
-               "Error while adding MMIO range of device to mmio_ro_ranges\n");
+    if ( subpage_mmio_ro_add(
+             (uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
+              uart->dbc.xhc_dbc_offset,
+             sizeof(*uart->dbc.dbc_reg)) )
+    {
+        printk(XENLOG_WARNING
+               "Error while marking MMIO range of XHCI console as R/O, "
+               "making the whole device R/O (share=no)\n");
+        uart->dbc.share = XHCI_SHARE_NONE;
+        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
+            printk(XENLOG_WARNING
+                   "Failed to mark read-only %pp used for XHCI console\n",
+                   &uart->dbc.sbdf);
+        if ( rangeset_add_range(mmio_ro_ranges,
+                 PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
+                          uart->dbc.xhc_dbc_offset),
+                 PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
+                        uart->dbc.xhc_dbc_offset +
+                        sizeof(*uart->dbc.dbc_reg)) - 1) )
+            printk(XENLOG_INFO
+                   "Error while adding MMIO range of device to mmio_ro_ranges\n");
+    }
 #endif
 }
 
-- 
git-series 0.9.1

