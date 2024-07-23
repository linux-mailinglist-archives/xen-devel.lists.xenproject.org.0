Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953229398A2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 05:25:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762548.1172736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW68s-0006QU-4m; Tue, 23 Jul 2024 03:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762548.1172736; Tue, 23 Jul 2024 03:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW68s-0006N1-0P; Tue, 23 Jul 2024 03:24:46 +0000
Received: by outflank-mailman (input) for mailman id 762548;
 Tue, 23 Jul 2024 03:24:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sW68p-0005rf-Kg
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 03:24:43 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 191bfba5-48a3-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 05:24:41 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id CCD2A11400E6;
 Mon, 22 Jul 2024 23:24:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 22 Jul 2024 23:24:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 23:24:39 -0400 (EDT)
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
X-Inumbo-ID: 191bfba5-48a3-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721705080; x=1721791480; bh=3q36D4bJYb
	KeTNzDrlCHr7vVdpQaHyX3JUKiZcT8bno=; b=BlPtfE+aHRz3PvT0VWRZ/4780l
	jEDEYofmrSxseCH+BbLdpS9DmDHbYCfKOVCZGWnmGmduMNJwkAfsCKZh5UEMBNgO
	pmjWJcxjNVltXuLfd2rLmb8hqNPyNJDsRLWY/n6SRmyqarwl53V5fmyE48MVtbBh
	NcKfGg1I+exUEp0uYAaMVx/uYHHgx7MZAFhnzbhBxrQFMA/WBlhMc9mz08wNJRvS
	cgaGBPEkKx1C52/8T24dxEELjnEjkHdarygQ7ja5x7VkXa2oomYZvWyEi/Gx0aKb
	Z/SFjYXdg2geN85lOPLybq4L7f92KgMb3bRLDZIZSStX3KPD+MCDV2aNTTuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721705080; x=
	1721791480; bh=3q36D4bJYbKeTNzDrlCHr7vVdpQaHyX3JUKiZcT8bno=; b=q
	0Gp9QIUQbewwQP4XXKc/RvuvRKocaWN5M9ckuXuIF2rPbkryIwvsQvDv1bRK+QQJ
	2QAYuHjMWI+3a/wmCHcnID9oXJGt7NHnsYkqyZv52GeSPc0SIK2M3vR+EwUctYLP
	Ah1r0J7lYh6DZtshJJ/VN1A2NXleL7jY7haNemPwBaZthZQ2IF1SfQHH9VVzmnl4
	aVu5kAjGGte1iPXk2jklIzi4uApSpO0s0+muLNaOsjb1cfQdIitOyqysV8bQe4mo
	/agkTVBuMpuQsZXFNXhY1sgmiLY+OLS4enF5SZsul4gk4ibuVkM3MqdLFG7fVpEt
	pHCnMJLEwXxB/hh3pj12A==
X-ME-Sender: <xms:eCKfZqFOjdLh9-wLZ274INZqCaypc0PG3fNYVhJ7fiaSDD6qWkHJWQ>
    <xme:eCKfZrU8Mf2bDOfaXWWgcxHXjXdWLHnuG76J4xmppI5nLjqCRrCOvrItDbFCp6QVV
    2jdvgwkEBm23A>
X-ME-Received: <xmr:eCKfZkLPve6qkKz2vsb5AqKPPSsGHlQyxMeHqo8ot2S34mzj9Wy_R_cHnGWmWOe-qMk2ge8wI_m_4J29IJsEAS3fZkOy5k6K9lTJJNFcDeb7KuTO9rA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheekgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:eCKfZkH3wcCDg-f4uJU5EVuGDrBHfUr6O6cngUqcqYacJJO35Jfhcg>
    <xmx:eCKfZgVx6uB04gfcOjcN2t9tHqp3E_rygRuVLBXSTDhkb6L8_MO6gQ>
    <xmx:eCKfZnM532wvuEOTBekh1hy1qjUYdXbV2D8zb3TvYgdThvql_Qzo6A>
    <xmx:eCKfZn1ZSguLDYZd_D2KWhHinPCXk9moy8GZAr7TTqD75B1XRSXhYQ>
    <xmx:eCKfZqeU1MUjp_B6Y7z2BENgQfb_YV1lSsszuGrftZYugZA2llX6RI1r>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 3/3] drivers/char: Use sub-page ro API to make just xhci dbc cap RO
Date: Tue, 23 Jul 2024 05:24:14 +0200
Message-ID: <b1dadae26c6c9a585a938ebb3e0cda657cb4dfdf.1721704980.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.66bd16d0134f9664ea3e0f4d56f7c127afc308c8.1721704980.git-series.marmarek@invisiblethingslab.com>
References: <cover.66bd16d0134f9664ea3e0f4d56f7c127afc308c8.1721704980.git-series.marmarek@invisiblethingslab.com>
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

