Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A173F03A0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 14:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168237.307157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKVH-0004J8-WF; Wed, 18 Aug 2021 12:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168237.307157; Wed, 18 Aug 2021 12:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKVH-0004Gf-TE; Wed, 18 Aug 2021 12:17:07 +0000
Received: by outflank-mailman (input) for mailman id 168237;
 Wed, 18 Aug 2021 12:17:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWQ4=NJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGKVG-0004GZ-Sh
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 12:17:07 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32b54d3e-001e-11ec-a549-12813bfff9fa;
 Wed, 18 Aug 2021 12:17:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C09645C013E;
 Wed, 18 Aug 2021 08:17:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 18 Aug 2021 08:17:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 08:17:03 -0400 (EDT)
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
X-Inumbo-ID: 32b54d3e-001e-11ec-a549-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WK7aJH
	zAWiHIDyinLYF6llZgglqbrKg3e8i20rp8HeU=; b=JqNwioQhZiIfRm+iKofegt
	pvnDCtMnurud/eEDk1AmpEwefySfLfsA3hrE2jCVuUa1aJoqH6lByfmO1oSlrbCW
	+XEU86568DOu2uAZ884juO6g1ngI2kNuWAKD55sm5I1wyZ50jTm9mb171dnW1cVj
	F03rDe+ZLQqNPTj4xuTXvBEoNWt6mTpW/g+wAlkOa+96AaiprfvTy+FBYvClcAcK
	7Y+E6tMj1drAQ1JH+CkzcHexdU+fNBEJVgmYzARBRQxyQ1BA4ddVt9ZdKeJh5Tbx
	5zzU8HTGaLeEulfl0xaYVLDWT6sisrcIVYW4RRNfV1BV1Z2CHZPYa1dLO27kGwDQ
	==
X-ME-Sender: <xms:QPocYRDaIFwBOvDRw1VZQUDzj45Rr91OBAwv_XrTuRJZxeExhhavyQ>
    <xme:QPocYfhUnezjELpJf5zcnjshyGXFu-RYbGJM1Fkjlm-wqMx1pJJpFPfxEjkrlBqcH
    YMk7hhdCn4fFA>
X-ME-Received: <xmr:QPocYclVVHUw8tHZ_T-q0jREgxOQz1DvygjrJu9OiGdoXIy68Xch2MqzbZLpxxPpTLwG_a8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofggtghogfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteegteek
    ueekfffhjeeuleduheettdekueeitdfggfdthfevfeeuieeihfduheegnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:QPocYbyIKmJyS40dQvHw7eZxUKKxix2e18PcS6wjzbZ112zRH4FNcg>
    <xmx:QPocYWTkiFShIwtAi8iTIVZ1BaU2Nx7LOx2ZQqtFfiPZkt-5EG6bLQ>
    <xmx:QPocYeaykcDhO7RK1MO1yxKyVjREjvZdYBjErQuQYT1NtMx8etnjMw>
    <xmx:QfocYVHjuCC-KzrDCvfhy5ActGsxsJyj8MYBe2-V9HRwaWDniCDiiA>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] ns16550: do not override fifo size if explicitly set
Date: Wed, 18 Aug 2021 14:16:47 +0200
Message-Id: <20210818121649.462413-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

If fifo size is already set via uart_params, do not force it to 16 - which
may not match the actual hardware. Specifically Exar cards have fifo of
256 bytes.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/char/ns16550.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 16a73d0c0e47..97b85b0225cc 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -357,7 +357,8 @@ static void __init ns16550_init_preirq(struct serial_port *port)
     ns16550_setup_preirq(uart);
 
     /* Check this really is a 16550+. Otherwise we have no FIFOs. */
-    if ( ((ns_read_reg(uart, UART_IIR) & 0xc0) == 0xc0) &&
+    if ( uart->fifo_size <= 1 &&
+         ((ns_read_reg(uart, UART_IIR) & 0xc0) == 0xc0) &&
          ((ns_read_reg(uart, UART_FCR) & UART_FCR_TRG14) == UART_FCR_TRG14) )
         uart->fifo_size = 16;
 }
-- 
2.31.1


