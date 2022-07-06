Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8E568CE6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:33:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362334.592362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971O-0000d3-Hg; Wed, 06 Jul 2022 15:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362334.592362; Wed, 06 Jul 2022 15:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971O-0000aN-Dh; Wed, 06 Jul 2022 15:32:58 +0000
Received: by outflank-mailman (input) for mailman id 362334;
 Wed, 06 Jul 2022 15:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWdV=XL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o971M-000854-2b
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:32:56 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e77d41e5-fd40-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 17:32:55 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 56BAA5C0110;
 Wed,  6 Jul 2022 11:32:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 06 Jul 2022 11:32:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 11:32:52 -0400 (EDT)
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
X-Inumbo-ID: e77d41e5-fd40-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1657121574; x=1657207974; bh=APJyRhX6/2
	wxNUIPxM+2LptgYjBbjDcQ/gEU4+XF8Xs=; b=naexuyo7OOluAJjx3VQHuw8Gl6
	aW45I0V55oVSyghev1vf3BRqZWyJE+tCeC1DTR4ADT4Yhm3FpbrGMUcNaRc7DR6J
	hEVsp9HyIRungb6cVyeEjrDIGxY3Xy0DB9ywqkz/s08qv6Ostexnj06+cmMRoOYe
	YOSSET76ixGIcZ4wYtH2EhUY4pL8HY54VbTYyUtxBYSmvgyd7w6ZAgxJiIFLqm04
	BC/dgUWXgcHSTYJxHi1euS9aXoK6lBN+m7qJbmrW0tJhSTHK7aUNPOBwM38uh5oA
	2p59nWLCgmaW1L9KzA5KrCIumU/NUnMf70xOnX59qlWc3GJhX45ThVNs5hYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657121574; x=
	1657207974; bh=APJyRhX6/2wxNUIPxM+2LptgYjBbjDcQ/gEU4+XF8Xs=; b=s
	UBi9VBdnDNPFrCpmFVea1nnjHnpNK0csRJtERX9rbUF1mnNZB5MnVLlN9Z03pscR
	SS51evZo5v68evtzvWs8XXW/NXgXIkMeMp2R1pwWyeV5C1op1IYEw/XTwJStocEa
	BGtkqx5JpcjCMkE215zTF5z/j8myto0kDOU78wxf0z1rY/61rZWMLwmfJz6LXGnE
	SEsOejcJ2jSqFCTkRZc6wkgk6zp5Ywhlp56icQBqeMZkqk1nFIo49CChUfTm5qvf
	bfQuDSkOh6tjP2h/37skRNvJ/25TdOyYoZvlxRpT133EBGfMDDyBxS+twCKGgo5c
	9eMeLIOxrg9oOmgqtSZOA==
X-ME-Sender: <xms:JqvFYm3FaguAcTt03gpiyMuIi40-oej4oTiyDTXjmo6ieHDj6tnSog>
    <xme:JqvFYpEZSJjzv_VNqAyq1YjSF0jMeUrDyfWgNOSiW-o2-SqVkvbJh7smAweR_ZCVQ
    QyXmj2o9rzVUw>
X-ME-Received: <xmr:JqvFYu6At-RgH8GSRRtoNyZSYlkTxMLrXsoVPisghBjxnQawlkYCoP7Pxi7EmDoh346pO0LP6nrUbe8WrQvguxIKXnW_SwwdHTzTP0IR9sAS-75MZpc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:JqvFYn0lQ8SHWINgKRw8u4ozPLZ1EOVaYFxAhVhXdtqgPDgG5iaG2A>
    <xmx:JqvFYpEIxRUek7-PJDR5b2fpmuTYlwC8whbHF46rLkwmShtSu1N21A>
    <xmx:JqvFYg-IKW-829223yNMXwx1DRaumRf3mza01nono25IIb_tQmsfiw>
    <xmx:JqvFYiMuP6T4wVi7A6p5wbihH-WN0UQPUMkcRDhrIGsiYoE8OESm6Q>
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
Subject: [PATCH v2 3/9] xue: add support for selecting specific xhci
Date: Wed,  6 Jul 2022 17:32:08 +0200
Message-Id: <399a41db5eb32197364b47a7031c30464803fa76.1657121519.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Handle parameters similar to dbgp=ehci.

Implement this by not resettting xhc_cf8 again in xue_init_xhc(), but
using a value found there if non-zero. Additionally, add xue->xhc_num to
select n-th controller.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
 - unsigned int xhc_num
 - code style
---
 docs/misc/xen-command-line.pandoc |  2 +-
 xen/drivers/char/xue.c            | 53 ++++++++++++++++++++++++--------
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f9fa857bd84e..1ab92bf7b50a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -721,7 +721,7 @@ Available alternatives, with their meaning, are:
 
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
-> `= xue`
+> `= xue[ <integer> | @pci<bus>:<slot>.<func> ]`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index 2cbbaea11fa0..9d48068a5fba 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -205,6 +205,7 @@ struct xue {
     void *xhc_mmio;
 
     int open;
+    unsigned int xhc_num; /* look for n-th xhc */
 };
 
 static void xue_sys_pause(void)
@@ -238,24 +239,35 @@ static bool __init xue_init_xhc(struct xue *xue)
     uint64_t bar1;
     uint64_t devfn;
 
-    /*
-     * Search PCI bus 0 for the xHC. All the host controllers supported so far
-     * are part of the chipset and are on bus 0.
-     */
-    for ( devfn = 0; devfn < 256; devfn++ )
+    if ( xue->sbdf.sbdf == 0 )
     {
-        pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
-        uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
-
-        if ( hdr == 0 || hdr == 0x80 )
+        /*
+         * Search PCI bus 0 for the xHC. All the host controllers supported so far
+         * are part of the chipset and are on bus 0.
+         */
+        for ( devfn = 0; devfn < 256; devfn++ )
         {
-            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
+            pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
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
     }
+    else
+    {
+        /* Verify if selected device is really xHC */
+        if ( (pci_conf_read32(xue->sbdf, PCI_CLASS_REVISION) >> 8) != XUE_XHC_CLASSC )
+            xue->sbdf.sbdf = 0;
+    }
 
     if ( !xue->sbdf.sbdf )
     {
@@ -955,12 +967,29 @@ void __init xue_uart_init(void)
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

