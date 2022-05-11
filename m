Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF2A52358A
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326963.549650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonN3-0005JL-0O; Wed, 11 May 2022 14:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326963.549650; Wed, 11 May 2022 14:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonN2-0005Bm-Qc; Wed, 11 May 2022 14:31:20 +0000
Received: by outflank-mailman (input) for mailman id 326963;
 Wed, 11 May 2022 14:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7Fu=VT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nonN1-0004zb-Aa
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:31:19 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0495c8de-d137-11ec-a406-831a346695d4;
 Wed, 11 May 2022 16:31:18 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 129193200368;
 Wed, 11 May 2022 10:31:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 11 May 2022 10:31:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:31:14 -0400 (EDT)
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
X-Inumbo-ID: 0495c8de-d137-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1652279475; x=1652365875; bh=5gOHCoO1SJFfX
	dPVixx2/Z9rK5CgcQ7j85MTwz+/pus=; b=Lf3SDq/UiiL6FYTKCRrGa8PyOc6Db
	e6VUVR5hVh0m+LfQf0T/IYaQLFOPcKQlJ8aw8+t9eWTEwlfcSUdcxWBTyDYDjwBT
	5S24yj7CcpwX8BW59Utm4OL/vFCWU5KT25qOdALNGjMMtVyMTgSZ5dwIpycVfksa
	BKKLEuTctcL9eHlgCLDmi39gAulJfw2KCQOn2MMWnsU/IkpohV+hAD9q5NP5xou3
	TuwMotC8vSCAPM29YtPMzTXHrxBtJRFsIbrMOrLRUo0YfBu+xEZDKwUnkAzIvP+s
	pIxeN6/hc+Yi2oDWen9bwqQp/a8hV2HzjMWGAuQlK6JonkJwQW0UNl5YA==
X-ME-Sender: <xms:s8h7YjeWY5yv9f6XI3j7gZdtpCmLPF0PLKiYqemv7FzuqwQ-wZbQ9Q>
    <xme:s8h7YpN7BoQ8pEVgvGjs01zVKi1xp9xm9QJinWlLuhf_uDaLRZur-T2z2Pz043c1L
    1bQH3RX21OZZw>
X-ME-Received: <xmr:s8h7YsgHrWbbG9CJTCRwAk_lZAjoNrjiqiH4SarPvSjXSKq972A7DPUMOhOU-JmKjuPppOnwd_UZffNojZz5ldNDQVfEf8ftMJS8eqeflg2JatLEyhE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:s8h7Yk9s7Q2rJKZh8nFxEx9k6jd4JXtArNBEtUJhQWi65YvT8a6ORA>
    <xmx:s8h7YvvbfdTOKgEnzFT3HbKJi2NGQrJl692oGYPx7PsFFoMPuD3f3Q>
    <xmx:s8h7YjHIhINoxjbRiBRAQbpMZOetj20p44a8nOfryRz0aTBSM5DEyw>
    <xmx:s8h7YlVcUYUk13T7d4P4mL8kKzxdE_djV2ywy60HdcrRvneA8hjoXw>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 2/2] ns16550: Add more device IDs for Intel LPSS UART
Date: Wed, 11 May 2022 16:30:59 +0200
Message-Id: <20220511143059.1826794-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
References: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
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
index 417c07cde3dc..cb17947e002f 100644
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


