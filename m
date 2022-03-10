Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF79B4D4974
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 15:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288417.489038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSJrx-0001mM-GN; Thu, 10 Mar 2022 14:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288417.489038; Thu, 10 Mar 2022 14:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSJrx-0001jK-Ce; Thu, 10 Mar 2022 14:34:21 +0000
Received: by outflank-mailman (input) for mailman id 288417;
 Thu, 10 Mar 2022 14:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g47H=TV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nSJrv-0001j9-Np
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 14:34:19 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29968f09-a07f-11ec-8539-5f4723681683;
 Thu, 10 Mar 2022 15:34:17 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 897B93200D30;
 Thu, 10 Mar 2022 09:34:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 10 Mar 2022 09:34:15 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 09:34:12 -0500 (EST)
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
X-Inumbo-ID: 29968f09-a07f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+ofNMV
	OSWA1/XJphOOvDB6VXgIrvHKjSLBWQP2D64Co=; b=aw/hoPehRvcuF3BAcaR9u2
	gMBQCeGY2jzq+2OkGVuNE8BPJ7SRpUmtTyMelLvXwH6CkzNrmgFZToOHsXUyLEHI
	iJDLNyXgQ5mAEkkFfBAPLSVaD9AfiohVIOJt1khbijpDQc4z3gQO8Oa14vHSybbj
	bVoLUCdd10ol3OEA3hVvD437OmP4YmA1ce2YoO9ePpzpBRZJNiTkNXUA2bxEtML1
	B1QPGzZu2yvnpcz8FUWYR+hn9oCjoZ3bMZXANTDMvnEfZky7ors4D9D+iaexE3FA
	L35RfqfTNzBybga+4BnLij6MLxNt60MdsDX4GnWyNSoOiOq2b4fpz1NUbj+IJwVw
	==
X-ME-Sender: <xms:ZQwqYhp1yIkcsVgwotGCiY1wUXzKYniFO9Fg93uk5quQJcoSUMrCFA>
    <xme:ZQwqYjpUfYv4aVoXsQ5GR1iBIWvRHq_oK7Oo7u7KrSj4C_N5qu0DZMJZ1lHHiQA1p
    Vxxa59Zs7j2cQ>
X-ME-Received: <xmr:ZQwqYuNQ4eZiH05Qou4bAF2WJVnziGWaPRic4MPVaT4t--_iu7X5l0Xl5AdPTaWISwAWYjVKufuFFZs_9rKO2MatJEfvoC-xrA3neIKjgBLz6gcQup4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgeet
    keeukeffhfejueeludehtedtkeeuiedtgffgtdfhveefueeiiefhudehgeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ZQwqYs7OwmzJTy7HAYK4DQcNgyGUnHwxUlsnPOaU6jyjJCpGemlmJw>
    <xmx:ZQwqYg7m6tq-aVDtrJ1mu8tZPNWCDyVdWlAlMM6LXYzi2w-ngLP1Iw>
    <xmx:ZQwqYkgkg_qQPwbfwjFCx-I41j0E-kNvzrY6Ip0-P5knwqHIsstzpg>
    <xmx:ZgwqYqRm-F-Um74D6UZAtCU4wmqfNnD0J25RvWQktUC2IKE3Ul2ebA>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Date: Thu, 10 Mar 2022 15:34:02 +0100
Message-Id: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

Intel LPSS has INTERRUPT_LINE set to 0xff by default, that can't
possibly work. While a proper IRQ configuration may be useful,
validating value retrieved from the hardware is still necessary. If it
fails, use the device in poll mode.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/ns16550.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index e5b4a9085516..2d7c8c11bc69 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                             pci_conf_read8(PCI_SBDF(0, b, d, f),
                                            PCI_INTERRUPT_LINE) : 0;
 
+                if (uart->irq >= nr_irqs)
+                    uart->irq = 0;
+
                 return 0;
             }
         }
-- 
2.31.1


