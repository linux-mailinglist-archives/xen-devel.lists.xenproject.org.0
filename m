Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BDF523589
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326962.549641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonN2-0005A9-DF; Wed, 11 May 2022 14:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326962.549641; Wed, 11 May 2022 14:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonN2-00056x-9e; Wed, 11 May 2022 14:31:20 +0000
Received: by outflank-mailman (input) for mailman id 326962;
 Wed, 11 May 2022 14:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7Fu=VT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nonN0-0004zb-E0
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:31:18 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0331db8f-d137-11ec-a406-831a346695d4;
 Wed, 11 May 2022 16:31:17 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0CED432007BE;
 Wed, 11 May 2022 10:31:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 11 May 2022 10:31:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:31:10 -0400 (EDT)
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
X-Inumbo-ID: 0331db8f-d137-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1652279472; x=1652365872; bh=jIkiYkh7la43OEzKPZ+DpqRnBfLZndvyLge
	srSS+y4A=; b=sJcH1vsra32nUbcRtqLkhTwv0fSHcGpzm+cTilyKBfVKtBW7gHj
	w0+HryjNqfPevIdbSjrvu34BZB5m93r0zWrBBn6XqVhplMrZ+GXIegF5wdIO8rIG
	wibWM873FyOXEoII4efJLxYcilHrbXbzEG2TGbqbPR6JuIJGEnj60tUbxcQdRvGG
	ycLeNMENve98XL6EHM/sykHMqO24atJ9LKCB1wrvung5wm1duPTMkXyuTeITOPUo
	U9sKu2DO6qBHGI2/W2EZ0cf4hfp61QQK+8oxmFzLXcuKDWoBPXfAYtzVaE+iSnKt
	9gSTkXtKGUOelqFAG3K0zcZyJUtPu/1N50A==
X-ME-Sender: <xms:sMh7Yv59JvLvwHZ-FTpFkO2nEANzfYruwnqqM_h-u2dTUppm6Slr1A>
    <xme:sMh7Yk71s2GTRmlcWVsejhVqwhskZ-KKZpIzgJMeFMlWhZ1vkz7cf209Pzbb0lwgq
    zWmDBzlgLp5bw>
X-ME-Received: <xmr:sMh7YmfeSwc0_4sM0ixI6ar5V8NlxhuGyngJcKQ8evvc2tEvohQJ6bCzMzjlef4IzHAIrZ-nSYegdRncmcopY2VGeNxKJVIr8fBkWslk02hiZ8qE_hs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:sMh7YgKo9eK8WOQ4uwLQj8JekWCGIwBi4H4o9n_6SdOqzApYwgGfbA>
    <xmx:sMh7YjIZpjGzC0KdAXJFY4MruCmefsqdzTTjFJSBqpet690Hh5zMag>
    <xmx:sMh7YpxCWnXcqYq8iq13EzrMMw_DurM4UHtB_xl-Cq48i8A-49h-_A>
    <xmx:sMh7Yr9eR8vx5Ofs5-2VkFauVx54gS2F7XKWd80ASZKEVnOrgp5D5g>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Date: Wed, 11 May 2022 16:30:58 +0200
Message-Id: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
by the PCI Local Bus Specification Revision 3.0 (from 2004) as
"unknown"/"no connection". Fallback to poll mode in this case.
The 0xff handling is x86-specific, the surrounding code is guarded with
CONFIG_X86 anyway.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes in v5:
 - drop IRQ 0 from the log message
Changes in v4:
 - adjust log message, change it from WARNING to INFO
 - re-add x86 reference in the commit message
Changes in v3:
 - change back to checking 0xff explicitly
 - adjust commit message, include spec reference
 - change warning to match the above
Changes in v2:
 - add log message
 - extend commit message
 - code style fix
---
 xen/drivers/char/ns16550.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index fb75cee4a13a..417c07cde3dc 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                             pci_conf_read8(PCI_SBDF(0, b, d, f),
                                            PCI_INTERRUPT_LINE) : 0;
 
+                if ( uart->irq == 0xff )
+                    uart->irq = 0;
+                if ( !uart->irq )
+                    printk(XENLOG_INFO
+                           "ns16550: %pp no legacy IRQ, using poll mode\n",
+                           &PCI_SBDF(0, b, d, f));
+
                 return 0;
             }
         }
-- 
2.35.1


