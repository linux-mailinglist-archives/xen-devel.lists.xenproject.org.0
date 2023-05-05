Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9007F6F8AE3
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 23:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530651.826399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv2wP-0007S7-Aa; Fri, 05 May 2023 21:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530651.826399; Fri, 05 May 2023 21:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv2wP-0007P6-5K; Fri, 05 May 2023 21:26:13 +0000
Received: by outflank-mailman (input) for mailman id 530651;
 Fri, 05 May 2023 21:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HMjG=A2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pv2wN-0007NI-IB
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 21:26:11 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e6fb91b-eb8b-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 23:26:01 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 154E53200985;
 Fri,  5 May 2023 17:26:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 05 May 2023 17:26:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 17:25:58 -0400 (EDT)
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
X-Inumbo-ID: 6e6fb91b-eb8b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683321959; x=1683408359; bh=uL
	hx0P6xBZxBZBxNEJgIiazgGFs2Lty/Wyht3mdpQIM=; b=pm2zuDECQQrRQaXpcm
	Qfpec60lFWjgj74E/Dk/vlOfOUOWJ7YpPwlW4XkPgXrtt0gnEnl1kaAATL+238PL
	vJeA/9EQhRFwMcVY62bETZYUyRQmM5wrwczCVfMCEMf2PGDfOOu12zQCE2SSMtaQ
	wM2FbDLdawwyZt8PR6NmHsXCF4RK88TtwSUJyQs/L+gqAqDvpKZQBjkLRn+Rwjqn
	dOwdLOuUHxw9zehmfXUZ4CMc+iIbe8mXfKoObHw+OkuRDTLhmNOjIs0+P7UfmAji
	2Lvr3DFR6uty99E1cvQ13UK56ekgtjcAOZEo2dxOd/KhwYO/kNU2cbY4UPEq3mGF
	K13A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683321959; x=1683408359; bh=uLhx0P6xBZxBZBxNEJgIiazgGFs2Lty/Wyh
	t3mdpQIM=; b=OFSdM02IPRy0XvJlK7BqPWyE8gxN6e21UPb0aN1FSK2ttWVRRX+
	ruVtBzaAiUo/NjMzb4Cd64clIHFomEoUVehziMx6YmSSATZxlGoldVlsLQCcl6Sn
	Z5zzWrQJpZeyjujCY7pjQG/x1abC0zHzxgqV80bgl2SW5gwli+Reasa1ShQ6Yvgh
	4aexAZVcbJ9X0ZzL9TNtO4uIKjFK5oe+UceLuJX6VAldvT1M34Jhv8KZZyg6mqbK
	qg+xjKjSfHKb4Jw/8oQ7WbPYTZG8zUTY36xp1WamEzhpfOGTwxgpFlCALRX/INW3
	L5WFFBjsKCQVgVf7eu+l9AereZGi2CtI5fA==
X-ME-Sender: <xms:Z3RVZPGJe5J6t7iODWL0V_zwIS7tDkxM5kPXoFHFoouUGvkOwVtNFA>
    <xme:Z3RVZMVdqsyRUaHkrZUO6z7FAOE766Jzaluzk_foPjqxZX0jVaKgptP_DAxJwBO4T
    uEO4YxmdBub7w>
X-ME-Received: <xmr:Z3RVZBJDxXMAtmqw6uEauUH5-_nsFhU0vvhXTa0_KKq2bcWGPu1vAOJEIpTPYp73vs3JuX0km1dB_Qvlu3wYe94pDNbLxYG1ET3-4Vfa6STYn-UuvVPX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgudeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Z3RVZNEmuzqVId5PqNGnXOjCtyrv1oF6U2ZGdFDMAk6CtRGSqgupdw>
    <xmx:Z3RVZFURf2nl5mFJqI_2FdUa2M-TZW3J2y-zRMTF5mwU4A8P4k4oPQ>
    <xmx:Z3RVZINb70Wz8AsGbl91EgiuLhApbQagOYHVxU6umRgdgM3sqgIeSw>
    <xmx:Z3RVZDevq3yKC8xPMTizEhazK8ke64FtATOhCjI5KfFQXsi1bYecdQ>
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
Subject: [PATCH v2 2/2] drivers/char: Use sub-page ro API to make just xhci dbc cap RO
Date: Fri,  5 May 2023 23:25:36 +0200
Message-Id: <1f9909dacfd7822a1c7d30ba03bbec93fa2ff6fd.1683321183.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not the whole page, which may contain other registers too. In fact
on Tiger Lake and newer (at least), this page do contain other registers
that Linux tries to use. And with share=yes, a domU would use them too.
Without this patch, PV dom0 would fail to initialize the controller,
while HVM would be killed on EPT violation.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
 - adjust for simplified subpage_mmio_ro_add() API
---
 xen/drivers/char/xhci-dbc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 60b781f87202..8e368364c933 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1221,14 +1221,12 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
      * Linux's XHCI driver (as of 5.18) works without writting to the whole
      * page, so keep it simple.
      */
-    if ( rangeset_add_range(mmio_ro_ranges,
-                PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
-                         uart->dbc.xhc_dbc_offset),
-                PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
-                       uart->dbc.xhc_dbc_offset +
-                sizeof(*uart->dbc.dbc_reg)) - 1) )
-        printk(XENLOG_INFO
-               "Error while adding MMIO range of device to mmio_ro_ranges\n");
+    if ( subpage_mmio_ro_add(
+            (uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
+             uart->dbc.xhc_dbc_offset,
+            sizeof(*uart->dbc.dbc_reg)) )
+        printk(XENLOG_WARNING
+               "Error while marking MMIO range of XHCI console as R/O\n");
 #endif
 }
 
-- 
git-series 0.9.1

