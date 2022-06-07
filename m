Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0143A540166
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343348.568699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEq-0006sX-17; Tue, 07 Jun 2022 14:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343348.568699; Tue, 07 Jun 2022 14:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEp-0006pJ-Qi; Tue, 07 Jun 2022 14:31:19 +0000
Received: by outflank-mailman (input) for mailman id 343348;
 Tue, 07 Jun 2022 14:31:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEn-00061K-GP
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:17 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cfeae9f-e66e-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 16:31:16 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C13F55C01E9;
 Tue,  7 Jun 2022 10:31:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 07 Jun 2022 10:31:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:14 -0400 (EDT)
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
X-Inumbo-ID: 7cfeae9f-e66e-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654612275; x=1654698675; bh=Q5My+tX/Z1
	yRUUbiyXNglzpIQl2V/2Tz8JD1D74I3cc=; b=nbw599YaKL8ReHa6gbyVi9XSSv
	ItmURASUNmvTOp7lDLCLDrL7exendz2RW064vfjKNe+XEEyDSOe7taLHiIk/EWX+
	N2Xu5o3rAFowCxKcmq5ZQMo70VEs/Lzaw1DmK934uZjoyUzxF+kyrNFw7vao86Lo
	XY4ga85nMJ4YikbBWAgBNurGAxvofsvTmpWwrHg8DgjqsT31QqKVx0mbF9SG0QOd
	/Sj6JbIBlqoBVcMLFYGFp4UpeSoauhkSA45EyOXEQrChzWjT6wH7r5kfgHvOqzLx
	VwildrMwXDgstNL422TTIbZtdYwmTBMV5s28k744Th+BClQjgx9JIqkKogpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654612275; x=
	1654698675; bh=Q5My+tX/Z1yRUUbiyXNglzpIQl2V/2Tz8JD1D74I3cc=; b=g
	vHbtrRLLsyncnXqdlZ2ywdzEvXx2p7iDewMG2ktXdlzIHRPJjP14GE4/ZNZ7d1JF
	meGrWecXZ0dVYqs8hdYMPi7ALfmqrkpsExXspysTeo+BTxVGuZiyre74yV4M4rUx
	dMwPZrMYPG1Tmqmnkpe0LYVRFpggDBz4AOKqz/utRl1kfjyuNYT/6L4elk91KkEl
	fqk6FqMeY1qqzTIDwZ3en6fU1IKwlFrAL7PZq7lAn5eKHtuen/Bjsku695qXh4wY
	N3JKeufGTrho5vWe5858kcaKCbgcfFSyhi1XlrFo5ApqWV94WiCJ2ROjc+WrzETn
	OorJ4Z24NI9fspxAjIy4Q==
X-ME-Sender: <xms:M2GfYh-7kxcn6m_xEPTmP1WnBWPzgAqVV9-Bk3vs7eBfPru4qqHYzg>
    <xme:M2GfYluijm4wXJjmDBlEPblMUPS0LiSMJ7s-P1_vbgobUhtWSEH0Gu1pxF7k1GnnK
    ET_5iMuEHvcFQ>
X-ME-Received: <xmr:M2GfYvA63cXPkjYrLukZdFXijV7aqh6ahv3LAgbh9p-gulc1SwovZy-KAzFNmcNwK-oq2RPhDOkHya6YunMWlUZjgQhzcfhwmv4LbfzlPxpZPpOKwd8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:M2GfYlckSbwrVLPOOjGNmJy1B3lGu1-NlBm4xFkUb1zB0uTTJP2v1Q>
    <xmx:M2GfYmNnQhAwXQltAOYO9KOwetl09zCuConknJYbkqhZEPj4pSh5Dw>
    <xmx:M2GfYnmTUz9Rnb3ZcoQpKq2Iy4ccbtlVnMNxl60sVx9OXwulGKmq1w>
    <xmx:M2GfYt0VJmy4Oe3uIrlcHZhADFtbs4q8X51liDIxluAHefDL9Au_rA>
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
Subject: [PATCH v1 03/10] xue: add support for selecting specific xhci
Date: Tue,  7 Jun 2022 16:30:09 +0200
Message-Id: <b5466e495943210adc48c754df98862ae49ee489.1654612169.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Handle parameters similar to dbgp=ehci.

Implement this by not resettting xhc_cf8 again in xue_init_xhc(), but
using a value found there if non-zero. Additionally, add xue->xhc_num to
select n-th controller.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 docs/misc/xen-command-line.pandoc |  5 +++-
 xen/drivers/char/xue.c            | 56 ++++++++++++++++++++++++--------
 2 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 881fe409ac76..37a564c2386f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -721,10 +721,15 @@ Available alternatives, with their meaning, are:
 
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
+> `= xue[ <integer> | @pci<bus>:<slot>.<func> ]`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
 
+Use `ehci` for EHCI debug port, use `xue` for XHCI debug capability.
+Xue driver will wait indefinitely for the debug host to connect - make sure the
+cable is connected.
+
 ### debug_stack_lines
 > `= <integer>`
 
diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index a9ba25d9d07e..b253426a95f8 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -204,6 +204,7 @@ struct xue {
     void *xhc_mmio;
 
     int open;
+    int xhc_num; /* look for n-th xhc */
 };
 
 static void xue_sys_pause(void)
@@ -252,24 +253,34 @@ static int xue_init_xhc(struct xue *xue)
     uint64_t bar1;
     uint64_t devfn;
 
-    /*
-     * Search PCI bus 0 for the xHC. All the host controllers supported so far
-     * are part of the chipset and are on bus 0.
-     */
-    for ( devfn = 0; devfn < 256; devfn++ ) {
-        uint32_t dev = (devfn & 0xF8) >> 3;
-        uint32_t fun = devfn & 0x07;
-        pci_sbdf_t sbdf = PCI_SBDF(0, dev, fun);
-        uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
-
-        if ( hdr == 0 || hdr == 0x80 )
+    if ( xue->sbdf.sbdf == 0 )
+    {
+        /*
+         * Search PCI bus 0 for the xHC. All the host controllers supported so far
+         * are part of the chipset and are on bus 0.
+         */
+        for ( devfn = 0; devfn < 256; devfn++ )
         {
-            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
+            uint32_t dev = (devfn & 0xF8) >> 3;
+            uint32_t fun = devfn & 0x07;
+            pci_sbdf_t sbdf = PCI_SBDF(0, dev, fun);
+            uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
+
+            if ( hdr == 0 || hdr == 0x80 )
             {
-                xue->sbdf = sbdf;
-                break;
+                if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
+                {
+                    if ( xue->xhc_num-- )
+                        continue;
+                    xue->sbdf = sbdf;
+                    break;
+                }
             }
         }
+    } else {
+        /* Verify if selected device is really xHC */
+        if ( (pci_conf_read32(xue->sbdf, PCI_CLASS_REVISION) >> 8) != XUE_XHC_CLASSC )
+            xue->sbdf.sbdf = 0;
     }
 
     if ( !xue->sbdf.sbdf )
@@ -999,12 +1010,29 @@ void __init xue_uart_init(void)
 {
     struct xue_uart *uart = &xue_uart;
     struct xue *xue = &uart->xue;
+    const char *e;
 
     if ( strncmp(opt_dbgp, "xue", 3) )
         return;
 
     memset(xue, 0, sizeof(*xue));
 
+    if ( isdigit(opt_dbgp[3]) || !opt_dbgp[3] )
+    {
+        if ( opt_dbgp[3] )
+            xue->xhc_num = simple_strtoul(opt_dbgp + 3, &e, 10);
+    }
+    else if ( strncmp(opt_dbgp + 3, "@pci", 4) == 0 )
+    {
+        unsigned int bus, slot, func;
+
+        e = parse_pci(opt_dbgp + 7, NULL, &bus, &slot, &func);
+        if ( !e || *e )
+            return;
+
+        xue->sbdf = PCI_SBDF(0, bus, slot, func);
+    }
+
     xue->dbc_ctx = &ctx;
     xue->dbc_erst = &erst;
     xue->dbc_ering.trb = evt_trb;
-- 
git-series 0.9.1

