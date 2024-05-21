Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA898CA671
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 04:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726459.1130752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9FhR-00010T-F0; Tue, 21 May 2024 02:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726459.1130752; Tue, 21 May 2024 02:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9FhR-0000xh-Bo; Tue, 21 May 2024 02:58:01 +0000
Received: by outflank-mailman (input) for mailman id 726459;
 Tue, 21 May 2024 02:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TC+7=MY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9FhQ-0000wX-FO
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 02:58:00 +0000
Received: from wfhigh1-smtp.messagingengine.com
 (wfhigh1-smtp.messagingengine.com [64.147.123.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb5950c2-171d-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 04:57:57 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.west.internal (Postfix) with ESMTP id 59201180013A;
 Mon, 20 May 2024 22:57:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 20 May 2024 22:57:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 May 2024 22:57:51 -0400 (EDT)
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
X-Inumbo-ID: eb5950c2-171d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716260272; x=1716346672; bh=bXn4ATxgHs
	YUiQuSECyUBykp11qbPlmHmV2/8rOqouw=; b=eiy9AMiPteWokdkWidguJh47nh
	0B4klAge7QqkMwZGtvWYI2mxcZBCq85onYXASK+KITbnWw0XM/Oae/pUxPJ9oL74
	XpgnSzPuImdVvyjb7O7nc9zUvS6fUhxxv8EX5ejidnDloNEKfQYTL9B0uPBSfvNh
	t25hyAoQFt4upZIojddfR0Cdn5RNVKf5MzsZmy4xgusmdw94yzUp1htEfAkfAWpa
	/ehIgpQe+VHzmNb5V4gxWR+9QL2crQ3zJH+yZt0Naf0rTKJpyT7l5j091HLtnYXp
	7bqbA013DADGtqvwAFzbxIIpqXj07m3PJFnOXfTZ0E3PaICWFCEqow1Rd/zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716260272; x=
	1716346672; bh=bXn4ATxgHsYUiQuSECyUBykp11qbPlmHmV2/8rOqouw=; b=g
	6H2KkhfhzGK6xTenSbqWlqkf9jH8hG5TpaiQNVk9kZcSd9Re5IKYn3qY+hmcaA0n
	H46HiVSRRJVGCXhtH+Bi8UlDE+1gpWOX6sa2YLusjI8Q+ztn+m5lSRXslMFl8i0K
	MusamoSWPq4j+29ssWt2OpIEUwYRxO4lfYbDFlPk0OajEgfbUh20/d2cB3DY6+A3
	jymsn305ayHnIGZoXJK3VxPAXu878Z5+mSHfTzlv0Yu8xhkkVR5y4siQX299JgQR
	bxGDHMdg3WqzEC1TkKrfx2kMP3QePM4qgtSG4/OgVqB1PhSG+ZszYWytGmodk/xQ
	CdlIRex5M8lPIQUcxmNWw==
X-ME-Sender: <xms:sA1MZsyP7820szCgCD2Ip9Lr9VzDBUtO4KkS9ApTjNiZDZR3Zld6dg>
    <xme:sA1MZgSeN6pmyIzRRnF7XzRgdIL5iFONFwR8lhfsix-P45pLpTfkbcj4imxNTl68K
    EhH4AYJ9o44PQ>
X-ME-Received: <xmr:sA1MZuU3towJlYiXPD_El92gzLgxOtPZWgtui52gnb7AojphsD2CvAHGwh4qShsef5-a3xb_g1EToWqMZyZSja3PzKLbHzXjV7CPXOIkL0bNPvzZx4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeiuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:sA1MZqj2zAFcEbj2rne_xzsQ-2TQ_2tMOnPNbhIZPH7Ko6knj8V4SQ>
    <xmx:sA1MZuC5AzlXGZ_q0mdSnWA9KFW8kNbMADp27sSwoc1Kcb8zLcoSxA>
    <xmx:sA1MZrIA_LqDle6tWZN9EtyeuyIpD_Ii_X_Qw4vutsSeZ82notGxZw>
    <xmx:sA1MZlDJoXiyjG3EL-pQ6llBlaMUcfm0oPVLsbvgEXq5ZIiwXnHfYA>
    <xmx:sA1MZg2A0Hxks6a9kL6j2QP0QycvvJeth59q8xwhBpW1wwXyrZkENThg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/2] drivers/char: Use sub-page ro API to make just xhci dbc cap RO
Date: Tue, 21 May 2024 04:54:33 +0200
Message-ID: <7682bbf3a24045ae1fcbdf651a6dd8e609ec3a20.1716260066.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
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
---
Changes in v3:
- indentation fix
- remove stale comment
- fallback to pci_ro_device() if subpage_mmio_ro_add() fails
- extend commit message
Changes in v2:
 - adjust for simplified subpage_mmio_ro_add() API
---
 xen/drivers/char/xhci-dbc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 8e2037f1a5f7..cac9d90d3e39 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1216,20 +1216,19 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
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
+        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
+            printk(XENLOG_WARNING
+                   "Failed to mark read-only %pp used for XHCI console\n",
+                   &uart->dbc.sbdf);
+    }
 #endif
 }
 
-- 
git-series 0.9.1

