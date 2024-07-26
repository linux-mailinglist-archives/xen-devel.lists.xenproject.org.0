Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF493CC92
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 03:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765204.1175805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXACl-0004O7-T0; Fri, 26 Jul 2024 01:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765204.1175805; Fri, 26 Jul 2024 01:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXACl-0004MA-Q2; Fri, 26 Jul 2024 01:57:11 +0000
Received: by outflank-mailman (input) for mailman id 765204;
 Fri, 26 Jul 2024 01:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHFb=O2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sXACk-0004M2-Qt
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 01:57:10 +0000
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf6505f-4af2-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 03:57:08 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 4A35A13802CF;
 Thu, 25 Jul 2024 21:57:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 25 Jul 2024 21:57:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jul 2024 21:57:04 -0400 (EDT)
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
X-Inumbo-ID: 5cf6505f-4af2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721959027; x=1722045427; bh=3q36D4bJYb
	KeTNzDrlCHr7vVdpQaHyX3JUKiZcT8bno=; b=vN/hKgqjhbMpN6C73nTDymg29F
	MNcGa6Imys7zQ6zvCuhUkw2tHlrdUmAlchyNdn3S4K/27872lU4WVi/DhBNUd/dS
	gitJ960hKVfQvdY010S932cs0aMBIA+jydLp+2nq9Gm8mhSrAu/vOIw8jkbVoZLC
	Ki75TDhvPpq3AUiXU0OY8cTJq7B13QjUpDbDexYEuHXS/2eqc3MATkhcLTfjieB/
	q+zpASYVQaHZJvmVXp6V5wQR7J0A8MFxGqW80sUpg+NyhxB1c82kxlyjnvwbPBkJ
	VNUzDNSxnYbJEcMx/NbRS1/p64OA6w3WBnrJiLN92J3vnmaO9o6rqmuOmlTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721959027; x=
	1722045427; bh=3q36D4bJYbKeTNzDrlCHr7vVdpQaHyX3JUKiZcT8bno=; b=K
	TTbsAg73rkDPw66++pyniJBiVrsqNCNfudpdreWk/iONcTfDhQ5HW6diiwTgF7S5
	rMkt6ubfs2d5jIO/nsxot6/xRvqD+PjsNFWuMg7NvAmeqMzBh1xllw/QQwAv4u9y
	HKKtlSwQU3Zc/7Ve4ihaqkiIXTH/M8HG8bbgPFb4zSezixzTyTZqMmy3H2feXQgJ
	i5pKpZApUE2EOjl2iE8E25u49zy1o3AU9mto8cjfp94bNAQelfaO7wkUppSLbJGq
	CLuXW2gnu0Fmd+xRypC3OWOnW3NH3ElX+riS8hxFUk/OiWdU92SDMjb2AMpsfL2r
	lsa38yCumnU2Isg+af3fw==
X-ME-Sender: <xms:cwKjZkXiw7XEYI1aA-RPyy2CAT9R7uj36H4J_cxeUbvvnMrLcRZVFA>
    <xme:cwKjZolxQxdUwyHUJPc_wE0oHllwZepenLcCyFjEo9GlMzNF2yJNul-XcbNNDlEXK
    q8Wf6hzPn7Tbw>
X-ME-Received: <xmr:cwKjZobFZO8n8UsAQo0Vy84ZzTe-4pW8rEcIbXpHa9AWATkcYgXg0Gp0y-atFyR60AGuXt6tpBcxT9u1nC0TAGY3LO_HMPl79Ll1hwynkQg7QqYxTzM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrieeggdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:cwKjZjXqyQdnGqpCxNyXibL6dTAgEVfFdAtc00Fl5Ro0rNZ4mmwc5g>
    <xmx:cwKjZukahNS4SABAFQw6oAJmtJRnVaGp-Rw7ZD_b3smYwAfVKc8fwA>
    <xmx:cwKjZodnH4pYfMfSrOyFXj5E_TWDWCrdJvSXLvQheENKoJsXGCL9pQ>
    <xmx:cwKjZgHwc_uHXUWA1ZRkEJlk18ikoWirSi7psuwZH6HvOPrrpYbxQg>
    <xmx:cwKjZltVIFm1WfHWY9FNey7p1kTdj7IMHHqPJEg5YG8i0Y6a7bSnHiJ_>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 2/2] drivers/char: Use sub-page ro API to make just xhci dbc cap RO
Date: Fri, 26 Jul 2024 03:55:54 +0200
Message-ID: <278c3f5336a02f6c3235772271e364f9d50c6034.1721958949.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.fe70b6220fe40bbe11f97b9396340c5dd11d59aa.1721958949.git-series.marmarek@invisiblethingslab.com>
References: <cover.fe70b6220fe40bbe11f97b9396340c5dd11d59aa.1721958949.git-series.marmarek@invisiblethingslab.com>
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

