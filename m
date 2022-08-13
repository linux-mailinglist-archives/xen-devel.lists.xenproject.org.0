Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76733591836
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386017.621893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7Y-0001dW-DK; Sat, 13 Aug 2022 01:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386017.621893; Sat, 13 Aug 2022 01:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7Y-0001aa-9R; Sat, 13 Aug 2022 01:39:24 +0000
Received: by outflank-mailman (input) for mailman id 386017;
 Sat, 13 Aug 2022 01:39:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7W-0000pU-58
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:22 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c00452ed-1aa8-11ed-924f-1f966e50362f;
 Sat, 13 Aug 2022 03:39:20 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 73CE85C00D8;
 Fri, 12 Aug 2022 21:39:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 12 Aug 2022 21:39:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:17 -0400 (EDT)
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
X-Inumbo-ID: c00452ed-1aa8-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660354759; x=1660441159; bh=+tq74EmTNx
	wZc6y/WZqTtbf1ui31IoQOPvTvVNWPcQQ=; b=TcJhewUr8I0jjgG6UP4pXU4Gyk
	wf5q+2ZReBMTqTqiOJQE5K9PcEwpDNq4HwPxmoSvRG5P9+BnZnF7CyGTBXr2EbvU
	s6cqjJ5mEQuD9z69vBsVJDW8kZ8pV3EBPLwdMllsjJPPgjZQGgjW+QImOZKlLZC2
	79shtFfVC1DrmrTDbnaxEcRe2PvFaBSdY0EpcaxSRh5NmZyVZ5owM3UsEJgeLZX3
	F5f1OKRqlHKWDFLGIgHacF9in+dYkMVWq867pAcNWT4+DMDJYSQBslHAJyAJ87r6
	e6JE6yBJQ6gcYIGwjuEK8kq3qxEVDihleMvsYZyrVblWbMKyB0Dg/4wo4WxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660354759; x=
	1660441159; bh=+tq74EmTNxwZc6y/WZqTtbf1ui31IoQOPvTvVNWPcQQ=; b=S
	JhTrlaS+DF+jwS+xMtaBgqkHro+dq3s9F2CcDLj9P4exlwrvhZ4iVzDPE9INja94
	1Qkz03s2adVaGj1Jj5EaUDrDeuWpqQIOTKEs4bFDQCreH8tlWDjb1D7G1TiE8fFs
	/BpWCQIP6NONXM5pTDx2GDrW43hl7Xch32OrvRR+esvSWudZA6MIu4QSo4U62e+S
	Fyqyg0ck9N/jlNiq5U0GUK/iYzF8NTDjjyQggqFTvOySzaTEHR0LMCTwpKe51ObY
	qxEnIV663LtwnwXe+XfQq3IGDcXPXpSbwD/NnrHCkkadbm9Gp30+kG++A/W9fKTB
	mrEWqH1G8sY45tYu//iww==
X-ME-Sender: <xms:xwD3YnpxOpux4maNixr0vEk9o8PLYQLe18Vy-mfsf9zAF2Be4C0Ixg>
    <xme:xwD3YhoJREr9ndhH95xfuHWOZsH7b7dVtZydXBRagAWANL_aQ34LbpBkk0U3IGrNz
    9irNSuW8qWBMQ>
X-ME-Received: <xmr:xwD3YkOUfaZVErc6ty6EofwW7GRs3fUWr_67Wqlvo60Hei06SELdufzdjjuPnWDXMiZYgno-4ns>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:xwD3Yq6-U8N7rTg5_DzsvcG1mLfH65veR2op6lMkod2C9AGe4IK1zA>
    <xmx:xwD3Ym5IpFC6eG3FiLUW6Bt1iJ4z4hE0UW-NOrUqZim6tpDTq9U7OQ>
    <xmx:xwD3YihHVJkapdjKtjnK4o0-oIrA5QJiAeuDvveBflf7tN5PsnWm4g>
    <xmx:xwD3YoRQnC3J4_BrgcWEgHSeqCg_y4c4L5yuphtR2xqRc3r7Aw2JLg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 03/11] drivers/char: add support for selecting specific xhci
Date: Sat, 13 Aug 2022 03:38:53 +0200
Message-Id: <2dd1245d3c969359e0e6e3545692756024dc613e.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Handle parameters similar to dbgp=ehci.

Implement this by not resettting dbc->sbdf again in dbc_init_xhc(), but
using a value found there if non-zero. Additionally, add xue->xhc_num to
select n-th controller.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - adjust error message
Changes in v3:
 - adjust for xhci-dbc rename
 - drop redundant check in parsing dbgp= option
Changes in v2:
 - unsigned int xhc_num
 - code style
---
 docs/misc/xen-command-line.pandoc |  2 +-
 xen/drivers/char/xhci-dbc.c       | 59 +++++++++++++++++++++++++-------
 2 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 88c70d133951..6b1e515bfc8c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -721,7 +721,7 @@ Available alternatives, with their meaning, are:
 
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
-> `= xhci`
+> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 8c9dfa6cfcc0..ca7d4a62139e 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -246,6 +246,7 @@ struct dbc {
     void __iomem *xhc_mmio;
 
     bool open;
+    unsigned int xhc_num; /* look for n-th xhc */
 };
 
 static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
@@ -278,24 +279,37 @@ static bool __init dbc_init_xhc(struct dbc *dbc)
     uint16_t cmd;
     size_t xhc_mmio_size;
 
-    /*
-     * Search PCI bus 0 for the xHC. All the host controllers supported so far
-     * are part of the chipset and are on bus 0.
-     */
-    for ( devfn = 0; devfn < 256; devfn++ )
+    if ( dbc->sbdf.sbdf == 0 )
     {
-        pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
-        uint8_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
-
-        if ( hdr == 0 || hdr == 0x80 )
+        /*
+         * Search PCI bus 0 for the xHC. All the host controllers supported so
+         * far are part of the chipset and are on bus 0.
+         */
+        for ( devfn = 0; devfn < 256; devfn++ )
         {
-            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == DBC_XHC_CLASSC )
+            pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
+            uint8_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
+
+            if ( hdr == 0 || hdr == 0x80 )
             {
-                dbc->sbdf = sbdf;
-                break;
+                if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) ==
+                     DBC_XHC_CLASSC )
+                {
+                    if ( dbc->xhc_num-- )
+                        continue;
+                    dbc->sbdf = sbdf;
+                    break;
+                }
             }
         }
     }
+    else
+    {
+        /* Verify if selected device is really xHC */
+        if ( (pci_conf_read32(dbc->sbdf, PCI_CLASS_REVISION) >> 8) !=
+             DBC_XHC_CLASSC )
+            dbc->sbdf.sbdf = 0;
+    }
 
     if ( !dbc->sbdf.sbdf )
     {
@@ -1052,12 +1066,33 @@ void __init xhci_dbc_uart_init(void)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
+    const char *e;
 
     if ( strncmp(opt_dbgp, "xhci", 4) )
         return;
 
     memset(dbc, 0, sizeof(*dbc));
 
+    if ( isdigit(opt_dbgp[4]) )
+    {
+        dbc->xhc_num = simple_strtoul(opt_dbgp + 4, &e, 10);
+    }
+    else if ( strncmp(opt_dbgp + 4, "@pci", 4) == 0 )
+    {
+        unsigned int bus, slot, func;
+
+        e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
+        if ( !e || *e )
+        {
+            printk(XENLOG_ERR
+                   "Invalid dbgp= PCI device spec: '%s'\n",
+                   opt_dbgp + 8);
+            return;
+        }
+
+        dbc->sbdf = PCI_SBDF(0, bus, slot, func);
+    }
+
     dbc->dbc_ctx = &ctx;
     dbc->dbc_erst = &erst;
     dbc->dbc_ering.trb = evt_trb;
-- 
git-series 0.9.1

