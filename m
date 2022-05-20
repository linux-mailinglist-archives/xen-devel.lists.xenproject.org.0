Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E6352E819
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 10:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333550.557402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nryOb-00006T-5L; Fri, 20 May 2022 08:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333550.557402; Fri, 20 May 2022 08:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nryOb-0008RV-05; Fri, 20 May 2022 08:54:05 +0000
Received: by outflank-mailman (input) for mailman id 333550;
 Fri, 20 May 2022 08:54:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dOI6=V4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nryOZ-0008OY-BO
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 08:54:03 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 635e06fb-d81a-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 10:54:00 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C35875C02A8;
 Fri, 20 May 2022 04:53:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 20 May 2022 04:53:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 04:53:57 -0400 (EDT)
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
X-Inumbo-ID: 635e06fb-d81a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1653036838; x=1653123238; bh=9SoDrM5QXO
	ZZaENaU/Vm3Kz95pyoPpFXFzfpd79RRT4=; b=LCszMCKuP0zC9hT2zd1cAdmOcQ
	i2N+8aSPgul9dfjJ3mUS4ILp4ZI4MUJSi4Bjlx0H6vTV+Ru7mf5IYK1wRf4Qz11j
	qpIiMuP4m2Ft3pV9j5QckOn0ZY56JeKnXG1RMRmfDcl20mLj7lydKkLO3wHTVhHD
	aorEXVluZK8kPZeB3aPwZa9LBQ5Z/eU5rU98njX8CwiK/ckju0BL2vu1gdE8kY8t
	CqARfaz0DavHu8wFuk9XDmMTv5PX3smvEG8e16QHgu2lCx9ZNwPL0p9xzvYqrC1x
	CbR5fKBS0f8dRaf/uFm7kEbT8h1gpTYUaPFBNzwWGlUhRM9Lpncu/HUCAYsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653036838; x=
	1653123238; bh=9SoDrM5QXOZZaENaU/Vm3Kz95pyoPpFXFzfpd79RRT4=; b=s
	Rfw21pbDfj5erRoCBw/z/ClKDcbe9RCZo+13dXolDLK0dWBD1RXPPQ5RgB2Y/CB5
	5tnzEKbsYlo4Su4AV16u+o+LQ2B0Oi0LTH9ff8WcaqxW0qDOMrQPsn6f+BewxLrW
	ONEA4idSPHr8+a3it1wO1C+RRi+T7rn+sWk3NC8PGVJI+3nsk0b/u+R5kvZC6R1d
	zwy1dEPUA9Ie2cw56pyPckQt7sThgZ14bK/0xM65N8q93ngarMgECf7tZ3X80BsI
	pWCSZBxonB2f7ecc6n22XTfiHnEWScrYPEMDXiIb3CTCQPqghMn2ZBw05Hsl3Rl2
	iO72YutBtypT5AbjlY9pw==
X-ME-Sender: <xms:JleHYl3JhP7vBKVwgV-Rb6Yc-oExSNc_8naUx2Cb2z0WvnaJFzKacA>
    <xme:JleHYsFmJTs9aD8ZYGHfy-YxW_ME8yNkCMfKM5DsB9GOXk8_6BWUV2LB0S0lBnVCJ
    ylvqXXjd1KpvA>
X-ME-Received: <xmr:JleHYl5-itiBxyqtUZCvifbHP5kgMPnPAMnmGRZ_xfNCcd3knPnpFkBIqsH4swFTO2q71qeCmJ6S4bFPeu7RXYU3yIUynl8ttoX3QIjS5kerclzIT6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:JleHYi2uC-jPAiT5btl8Vc6-Gs7HtNAwK9pr3GYR-OF0VUdPFMjavA>
    <xmx:JleHYoFbNR8iDfPW4vJ49u3mOOvlky9U9l2dsklnFO_CEVQcckHdzw>
    <xmx:JleHYj94wPOfDnILZ-fyaIxrm3HcKiPc_JE8pm1ggoPfo0g5SdsXXg>
    <xmx:JleHYtNXMNNS2uPZD_xJ6uJHEungwxUT5Aesp4bcndkDkRb-NcVkKA>
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
Subject: [PATCH v6 2/2] ns16550: Add more device IDs for Intel LPSS UART
Date: Fri, 20 May 2022 10:53:43 +0200
Message-Id: <20220520085343.1835866-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520085343.1835866-1-marmarek@invisiblethingslab.com>
References: <20220520085343.1835866-1-marmarek@invisiblethingslab.com>
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
index b37f67dc7430..b7da5646fc28 100644
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


