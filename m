Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999B78CC444
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 17:39:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727790.1132485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9o43-0001wB-TL; Wed, 22 May 2024 15:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727790.1132485; Wed, 22 May 2024 15:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9o43-0001tj-Pc; Wed, 22 May 2024 15:39:39 +0000
Received: by outflank-mailman (input) for mailman id 727790;
 Wed, 22 May 2024 15:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKXr=MZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9o41-0001b1-OC
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 15:39:37 +0000
Received: from wfout5-smtp.messagingengine.com
 (wfout5-smtp.messagingengine.com [64.147.123.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dd19db8-1851-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 17:39:36 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id 8D4FD1C0007C;
 Wed, 22 May 2024 11:39:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 22 May 2024 11:39:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 May 2024 11:39:32 -0400 (EDT)
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
X-Inumbo-ID: 7dd19db8-1851-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716392374; x=1716478774; bh=ODec38YfsT
	YTR4Z7j+bHVMoCfopdSqSbknuPJ8JX1zs=; b=R/oN/2foLIWImGj1tGXmwiHBcJ
	/Pv37jWMpvJhveqwVI97TFGbHPmrkPuwJzHHGnmAYuu3GKVAfdzPGmI8Iyf2Kt7I
	1kmdIcTLKJbI8vg0hQ/FiMEVXvEwSRgsDBMFDeZPoylbSSkxomxrv6cdWkkBOKKw
	8Hof+Ql0pFj29dqxILCtAWu2Nx1nQPOxeRFDKY1QlBN7QPJrU0jLwbjvdztsXEkk
	Vk/jXN62UvmWEW+NuKvYsMPajyf889zp4VhFn7cW9iCH1yWv0yretg+hT6j9Ll4e
	hDcnsWr6JlJdQOmtPfR/cuNd2NNYg3pfnWfN+Uwr9wT7RwsBD85lUvcST2hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716392374; x=
	1716478774; bh=ODec38YfsTYTR4Z7j+bHVMoCfopdSqSbknuPJ8JX1zs=; b=f
	duPTgPeZfPO66YAWnEsq4+cY7cBVOEe4Yjt2BjZLh2RUkmkZEigCNZmE0FexmCqk
	SJaiJsl1HyiROaCM5qv5oTBvSE3s/+eoRlfQcu8ZibSX7vBvNYPEN5b9eCWYxCt3
	Me9kO+OwCMgJp8gIPtgOpO0xboL0k0r3EqwJHFzG07BMadzFigWFS6OR//olZ6dF
	UU5pzSJmFFZ36X/QELveKv0wA22wtiLdC34lpfIwYOjqA2KTxWCWGBJl9lZlj9ap
	4VjzH4wZrAlm2sTbPN2AZDgbPJ/anyHqqQkwQbXltBxdP1D/EJNun917wUtt/jk+
	LbKXTJQ0qhp0BNPqiGzow==
X-ME-Sender: <xms:tRFOZllzAhVyKVLpsXZP5CjYCi4BkbboPc-vxqw8LdrZyTOyTREOlA>
    <xme:tRFOZg0vr_Endk2nWvSeVn1LTyhcRQc8qxL6Ne6EjLmNmN0oeDgyzfjZjAQ7M9Ssv
    RUlKvyawKet_w>
X-ME-Received: <xmr:tRFOZroOOem-oZ_IjHkCBclgrt3M3v9e0ghTkdVvaO8V1VKyrI6pHGbAB_Rl8zg0VvI81G3N8g3FZEhOc2_CDXeL6QHuIZGjwTZ02trdisi3t9EQlBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeigedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:tRFOZlnN4bTrNy9_-JpdXerlQ66K8TLWH1yeLylECKgT_M1RkkvMpQ>
    <xmx:tRFOZj0p8ppcahqz-J_98q7z0RGUWzqmTiLdYsECr-yLg3xQ-PyuaQ>
    <xmx:tRFOZkv5SvWxmN0261HFOOupLO_Ol2OrK_j0zipdfrRvBPluQw1e6Q>
    <xmx:tRFOZnUYpxpNF8cxTZ43pFKpUUDPT4HH7RJ3_g-dFLv05PB9we0Klw>
    <xmx:thFOZtpgR6p7y0BDuhmU6oeilzRW5eMIf3mHvM_kZ9hQSoHt2R4xASRE>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/2] drivers/char: Use sub-page ro API to make just xhci dbc cap RO
Date: Wed, 22 May 2024 17:39:04 +0200
Message-ID: <83dfaaf5cbd056ffbe381cbd39f0230348257642.1716392340.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
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

