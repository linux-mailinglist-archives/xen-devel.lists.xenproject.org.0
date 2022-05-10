Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F1522070
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325838.548598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSG2-0007oI-IB; Tue, 10 May 2022 15:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325838.548598; Tue, 10 May 2022 15:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSG2-0007kq-FF; Tue, 10 May 2022 15:58:42 +0000
Received: by outflank-mailman (input) for mailman id 325838;
 Tue, 10 May 2022 15:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kgyf=VS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1noSG0-0007kf-NJ
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:58:40 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e838c96-d07a-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 17:58:39 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 976445C01D9;
 Tue, 10 May 2022 11:58:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 10 May 2022 11:58:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 May 2022 11:58:37 -0400 (EDT)
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
X-Inumbo-ID: 0e838c96-d07a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1652198318; x=1652284718; bh=mYaKCBVQq7I6CRUH5kFvTjqejzct4Ce/08q
	PdhMHtqA=; b=ISN6lIMRNWS7GfQpVhKKFleTmeaoYkgMQmQV92FhZI5Mg8oNVM5
	E8j2p4osLHk+cqWLS5vnBOdQGFnSTD0bx6rW1MAEli4C9nSxPu0QK4tuvIvpNvU9
	x6gSjdvd0jJ6aYDXLVur8eAZuBrhifQwFqaG/QwaKXyBNlcdrUjp4dAYHWDLayIH
	+Ep5x0MJYHA//dNkzhS6jNBPq7cV/OjQJWA74tgFCo3RcMmhVfaUwDBUq6YNWDUW
	BF/rG4lUUQr3hL77nS0lKHMa6w6Ap3CIRj9vfrTgGgla94T++HWKrP8Hu+zl+Wsd
	V6SDXVjkU92LhEXOD3C6u/M6qOenmgomycA==
X-ME-Sender: <xms:rot6YtnfmCslcWuPX9pzzc93QXDrr7NI3TNr8m3qpjlTvQhqcRlH5Q>
    <xme:rot6Yo1hNrv94TH0r8rjvYVmfMqUteuNgOMYgyNYSw266UmkeHxo-JdHzaLNeAxTq
    G6PY0Px4xnUBA>
X-ME-Received: <xmr:rot6YjqPKL0-r57bfDhUekd_EYLqgxVmN2jgLppZQZG36WtSV-lRzYvkypkbETwAVrUfABkkDon3OIYYHHQyvz8nQnOOxGQcYj67LoQ-f6Q5x9YNQrE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedugdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:rot6YtmDTpW20L_CdSrANTWiVpoNLUoCutlir7n6MQBwrzbkujrNLg>
    <xmx:rot6Yr3dMhOMkNDwP3pG2lilDq8hk36PDdWyJreM8M_leMrl578JLQ>
    <xmx:rot6YsvTArHVHbM0jwlmCrNBJ4dBs7VMo5ZZUmft-O6O8FhnMc2YRQ>
    <xmx:rot6Yr_9NqgT5oisPnYUOJ2P8Y4Tc-zvnyA-4UTyPfh7oz7MUmQkMw>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] ns16550: reject IRQ above nr_irqs_gsi
Date: Tue, 10 May 2022 17:58:23 +0200
Message-Id: <20220510155824.1779789-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
by the PCI Local Bus Specification Revision 3.0 (from 2004) as
"unknown"/"no connection". Fallback to poll mode in this case.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
 - change back to checking 0xff explicitly
 - adjust commit message, include spec reference
 - change warning to match the above
Changes in v2:
 - add log message
 - extend commit message
 - code style fix
---
 xen/drivers/char/ns16550.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index fb75cee4a13a..b4434ad815e1 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1238,6 +1238,15 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                             pci_conf_read8(PCI_SBDF(0, b, d, f),
                                            PCI_INTERRUPT_LINE) : 0;
 
+                if ( uart->irq == 0xff )
+                {
+                    printk(XENLOG_WARNING
+                           "ns16550: %02x:%02x.%u has no legacy IRQ %d, "
+                           "falling back to a poll mode\n",
+                           b, d, f, uart->irq);
+                    uart->irq = 0;
+                }
+
                 return 0;
             }
         }
-- 
2.35.1


