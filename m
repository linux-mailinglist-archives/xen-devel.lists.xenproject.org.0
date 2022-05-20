Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25852E818
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 10:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333549.557396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nryOa-0008RZ-SC; Fri, 20 May 2022 08:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333549.557396; Fri, 20 May 2022 08:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nryOa-0008Oj-Kl; Fri, 20 May 2022 08:54:04 +0000
Received: by outflank-mailman (input) for mailman id 333549;
 Fri, 20 May 2022 08:54:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dOI6=V4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nryOY-0008OY-I0
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 08:54:02 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6286ade5-d81a-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 10:54:00 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 39EA95C0299;
 Fri, 20 May 2022 04:53:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 20 May 2022 04:53:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 04:53:55 -0400 (EDT)
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
X-Inumbo-ID: 6286ade5-d81a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1653036837; x=1653123237; bh=Zbc3jOEPowRT040X5wqGBooak9Aro6tWaKi
	WhEvPW/w=; b=Utan18Sivb2kE1qnbOcBnFVKPEVEc/wV/xtYE+jQPyxOS9ani6L
	NmURZ0OsZZTYk17o8/es+OTlN5lONR7eFOhiiBG9Jn978a7hXF9sHFq0ZaFAmVIj
	2XzigI44GL1QveXOCblBZ+nQB+dfMAfV/hBM0TAho3pzL68ooExKhvaA3JBMY+wz
	iBzFg3YzsStn1CfYTyl1W/oUKFEwVi1i3USrdIzjxp/v6MSq+hOwsoQ9OijI97er
	fLHL+eVUSX57hNQMNBJtkrxbviBLmHIEGxKChvvd/l+QnXSMebJn4A1CUqm+5YAR
	yGG4MI3+4niQu34IDSzRBFpWqbGFa/JHpFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1653036837; x=1653123237; bh=Zbc3jOEPowRT0
	40X5wqGBooak9Aro6tWaKiWhEvPW/w=; b=pLIqHj/Pe7P28uk2kBurSppqfA2gR
	2u/ocmCWeWFyj9WsL1hKnfDyaF3RvTiQeXzdK872rfgJ8bzE5Z6Ld0zTawlF8Asp
	7z/M+sANC2Pwunai1ed9M7KFKOnJBXbybNhg4marhUHr3ARlBRTsRl8ToVFKcPFg
	H/jzAEzA5o/KkcPe5Pq+F2+0gGtA7Rcy50v0h0meh+QAd6LTBeTWGALJjUpLEJ3x
	RQJjwL9b+aDXcRHwwnyT9NwR6RiDEX1S4eIinJUmPd/8HpAoGJjHPeBIidLv+AWj
	MolRa7bLvjC+vtCAa7Wkjq6IvGVXZnmm2g2q9uh1XEWgmeNJf/o7EiO1A==
X-ME-Sender: <xms:JFeHYp8J2aOx0XbkZ79yERpjb8wXaGZETVDAhPyZBy1GkLMAk4pkaw>
    <xme:JFeHYtsOmMrxLqJXmmgvZpDrh0m6P4TGSTzTgvqyXwf1wpO47D9irKCJY8Gr9CnWj
    fImsmgfdlkNtw>
X-ME-Received: <xmr:JFeHYnBtW3MaefU0PvNk17mqkLfgex-loCZ7FRB8nfKN35gU4r8UEtqPAJW_U8htXu260pN6_9Imp8As4xt0wew1XUfmd21vvmH-U0GmUvv1TrEaUmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:JFeHYtekY4rE19hy9aJQ7TpLy3mAWsL4MNz9niAr56aDGFZxjxiDLA>
    <xmx:JFeHYuMd_hbgSKYnZLe-LEyKnyIxZx4okd-RqNdFC24BPO8fzJxeDQ>
    <xmx:JFeHYvlHNwGrp7Yx51-mz_bZML42B8iIp7Yh8O41IfVgGDp-cN6rjg>
    <xmx:JVeHYqAUqPPdTM3vRgDT_K7qyc8H8-bkizVNuAuvCiQ-MCcBJ1gw8g>
Feedback-ID: i1568416f:Fastmail
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
Subject: [PATCH v6 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Date: Fri, 20 May 2022 10:53:42 +0200
Message-Id: <20220520085343.1835866-1-marmarek@invisiblethingslab.com>
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
Changes in v6:
 - wrap the check in additional CONFIG_X86, with appropriate comment
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
 xen/drivers/char/ns16550.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index fb75cee4a13a..b37f67dc7430 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1238,6 +1238,17 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                             pci_conf_read8(PCI_SBDF(0, b, d, f),
                                            PCI_INTERRUPT_LINE) : 0;
 
+#ifdef CONFIG_X86
+                /* PCI Local Bus Specification Revision 3.0 defines 0xff value
+                 * as special only for X86 */
+                if ( uart->irq == 0xff )
+                    uart->irq = 0;
+#endif
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


