Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C7576932C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 12:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572878.896961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQDP-0001Ug-Kr; Mon, 31 Jul 2023 10:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572878.896961; Mon, 31 Jul 2023 10:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQDP-0001S1-Hp; Mon, 31 Jul 2023 10:33:27 +0000
Received: by outflank-mailman (input) for mailman id 572878;
 Mon, 31 Jul 2023 10:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+d4S=DR=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qQQDN-0001Rv-Pu
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 10:33:26 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab6e9b9f-2f8d-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 12:33:23 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 79AA95C013A;
 Mon, 31 Jul 2023 06:33:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 31 Jul 2023 06:33:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jul 2023 06:33:18 -0400 (EDT)
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
X-Inumbo-ID: ab6e9b9f-2f8d-11ee-b254-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1690799600; x=1690886000; bh=gbZ43CfdF993NYpYySwQkSalc5T7JSkZ6hd
	i7rJBdL8=; b=onaTmr8w6gRMgtzg0ShO/oYjFgAo2zSgdPX20qtJrZW3lSSzCQi
	q2YKnlf7PVDMTYp7qOrMfwttKSOTwhIYWMQ2UOT4iaU+o62sPLO0WIqJY6pjEzIu
	iGBguKokk+5WbrG1ETaVtguk/RVo0lZqklzZ5AaSh6qTOYrwbtbIt7Z6Ko0kwh/g
	YO9rpzcWfg9OJ7MS8vSU24Lu9SexKGel8JHna5FziqQ39xcZTpgJlzl2KLY7azBI
	VHz0YzmhC3mPfj/Os9ZBBI0M8JKHjtDuBUqXkmWU08OIW2G5HsQg/e6FAjoGr6n1
	RFDZgcDeRAI1oOsfaU3e33mZs2dEf+zQNHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690799600; x=1690886000; bh=gbZ43CfdF993N
	YpYySwQkSalc5T7JSkZ6hdi7rJBdL8=; b=3SBiZjD4+BSwUf4OsqiCdkYKtNoy8
	vGRQWhGZE52JdCVfi3XBypWPXvPXkTVw8ZxH41jwbiuNYAH5Tb0QkUNPkmR79iT4
	bPG6ScCdjSvHbd/lE9fDtf4hIGi9IgrRdfjZorMYBI6TebOmtxn+2eh/MZKhfs2D
	Y1pSQO5cX76frQ3Y96dIVTb4ubDLAftyQFFK6M73NBqsbMXT8ndhUu6vhuxkWGSB
	glqCtocQ73NfTC9jE+Z1wJ8IxN3SNr1InzJQcywX8AbKSM0G5/1/Q8V9MpPiJ0ew
	uEuvGuTeAzepd8UPaXUNbZ3kMqXqAyWjb1RycgU+IeV3T0aED+53avQqw==
X-ME-Sender: <xms:8I3HZAPPwe0f6Y-Y_yewYqrr-Wl4YQKQRZ7oS7Ff99SOyrSCS9jZsQ>
    <xme:8I3HZG_yOxRvA3emdq1bMAYTHXHAsifePdfHcjL-27fYV3DrbN2trNQcke8g7a34A
    cmzekkIDDncegk>
X-ME-Received: <xmr:8I3HZHRLCjH7ANAM7r4Ckc_AyNx4ykw3TFpmIjgkhENZGB2XwHfYDjPgB8jy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjeeggddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuihhmohhnucfi
    rghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepueevheegtdefgeefuddvfeduueduffffffejveeugeef
    udefiedugedugeevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:8I3HZIvE_4yFjp_CHsIIfDsXqWlBWll0-U3ndD0grs_QuH2wvA0l6Q>
    <xmx:8I3HZIdV48l2PkadtEIjQAAsXm5jxFT11nOHv9hDdLICRnbkz7Fntw>
    <xmx:8I3HZM1Q_Z_Vo3IFodbE2tx1P-6OulUU2-tx5RQV4gUnIoJrduLaNQ>
    <xmx:8I3HZH4gqXkSU7hR_nUJH_y7wY-ut6PIKdL7NaDqbcAAXjlFUTYBag>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH v2] x86/hpet: Disable legacy replacement mode after IRQ test
Date: Mon, 31 Jul 2023 12:32:12 +0200
Message-Id: <a112f0fbbb333fc29a35d0a81853d59409a33fde.1690798460.git.simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As far as I understand the HPET legacy mode is not required after the
timer IRQ test. For previous discussion see [1] and [2]. Keeping it
enabled prevents reaching deeper C-states on some systems and thereby
also S0ix residency. So disable it after the timer IRQ test worked. Note
that this code path is only reached when opt_hpet_legacy_replacement < 0,
so explicit user choice is still honored.

Link: https://lore.kernel.org/xen-devel/cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com/ # [1]
Link: https://lore.kernel.org/xen-devel/20230718122603.2002-1-simon@invisiblethingslab.com/ # [2]
Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
---

Changes in v2:

 - Always disable legacy mode after test, not only when ARAT is
   available. See [3] for reasoning.

[3]: https://lore.kernel.org/xen-devel/ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com/

---
 xen/arch/x86/io_apic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 041233b9b7..b4b4cd5939 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1967,6 +1967,8 @@ static void __init check_timer(void)
 
             if ( timer_irq_works() )
             {
+                printk(XENLOG_INFO "IRQ test with HPET Legacy Replacement Mode worked. Disabling it again.\n");
+                hpet_disable_legacy_replacement_mode();
                 local_irq_restore(flags);
                 return;
             }
-- 
2.40.1


