Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7DF5809E7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374937.607183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAW-0004G3-WD; Tue, 26 Jul 2022 03:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374937.607183; Tue, 26 Jul 2022 03:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAW-0004D1-R4; Tue, 26 Jul 2022 03:23:36 +0000
Received: by outflank-mailman (input) for mailman id 374937;
 Tue, 26 Jul 2022 03:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGBAU-0003P0-SU
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:23:34 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53c69a50-0c92-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:23:33 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B00DB5C00D2;
 Mon, 25 Jul 2022 23:23:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Jul 2022 23:23:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:23:31 -0400 (EDT)
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
X-Inumbo-ID: 53c69a50-0c92-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658805812; x=1658892212; bh=3+Myjyd1Ql
	jUjc3rIyJbwALSLpFyz/2kcKDHAc8UTjU=; b=jUaEBIvUae6flJleBjXEEGUdFe
	JAgTIwisnWqcQvdsZCoYNpqROwJ6mMBWsWMe07I2VpM3XHBPiUxUIJya53PcsT3s
	dEFEjZccdU5uplmijE33r65KMhJmh85GbQ7PsF6DW+oTu9BKCka0i2BmSb3z/WRC
	TztkyKNO15+yxHt+btr7BlQMjhaaltCO6VuxDo/Tf3Dro6cJsBVib7Gpx+ZS/0ev
	6HMYyBjtnhhvFCUAUFBzbw5oTYn9uX+iKsasLWIvLMcKGCfecE8iTSi/PEdapsT1
	2j+acUrTBpVRrNBdn7KuXUniK0XxIZcMyx17L3ST1PGQH0ZmZqjh8D2M+bAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658805812; x=
	1658892212; bh=3+Myjyd1QljUjc3rIyJbwALSLpFyz/2kcKDHAc8UTjU=; b=z
	2RPsAdyciG6IBHebVkU63AHlkXtawGFyZoTcWMYv8EJGOuL3THT343Ytxu1zA17s
	geCjuVORzo0Fg65LckTxdbsyMkax3NEwyNPxwZOn1ff9E7lnSN/8X6xhJPTE2qZD
	AN9UIIuamYi++MKNOgNrJ0rgTlJ5fMFCW++ViHRPlWWFhHq5ptBymwDJmhBcC0Wt
	MY8e7TeqieqQArEVxbp56FeRcbe81DGyn+Ht9/pYAv2e0yHc5FmTDBSDKPmkHbd9
	YTh7TZ1PLBH9orceO6vcyzWW/fEToARRhaJjZLmFHm8kX+qBUz6LZqw/9wa4PLlp
	XsJ1G4FgXrsfMI2mWI/8g==
X-ME-Sender: <xms:NF7fYpkkVZUY8aoqO6Cmqz9xcOecF0DC_Ef5gaLZ9XjP8YFnHt9lWw>
    <xme:NF7fYk0nJMdkZTZucNxp1OIhUyfVRZHmqvw3JETLt_mIRTo3VxU6Bm4ba-aHLYOZD
    7A2O76L1tuhYQ>
X-ME-Received: <xmr:NF7fYvpBED5u28OUYbDGJxWbzRGfOcq7LAqB-E0SFWzz3PWYvwG-eID3kWBWfKVz6Hh6TAYH_Jc0zHFwQ3YvRjqCd_XF_YBBJaswnTiKoifQOoKmgRi3Tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:NF7fYpkfjuu3607JpGRv-Tmv_8DAM5858LDoMs_XARmAFrWeAOih8g>
    <xmx:NF7fYn2uNgfuVa3Dmt3A3yFq0iBthgOzSTOEM9un7NSd6Ui-hryh5g>
    <xmx:NF7fYos1L_X3IxluO_rG17WvB8fYB4GT_5FYxGeC6tBh-ygeJ8NUag>
    <xmx:NF7fYn_N7-o9IpIl5Ix7sXAiYtlo8cNWaTpDWyHK5V-8_smqvRhg-w>
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
Subject: [PATCH v3 03/10] drivers/char: add support for selecting specific xhci
Date: Tue, 26 Jul 2022 05:23:08 +0200
Message-Id: <97e54ccf5f9a21cf1226a1e9de6aae8dc09d2406.1658804819.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
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
Changes in v3:
 - adjust for xhci-dbc rename
 - drop redundant check in parsing dbgp= option
Changes in v2:
 - unsigned int xhc_num
 - code style
---
 docs/misc/xen-command-line.pandoc |  2 +-
 xen/drivers/char/xhci-dbc.c       | 54 ++++++++++++++++++++++++--------
 2 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f936283cd187..d594bd5c7436 100644
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
index 53c39eedd4a6..11026d3b71f0 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -243,6 +243,7 @@ struct dbc {
     void __iomem *xhc_mmio;
 
     bool open;
+    unsigned int xhc_num; /* look for n-th xhc */
 };
 
 static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
@@ -274,24 +275,37 @@ static bool __init dbc_init_xhc(struct dbc *dbc)
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
@@ -1047,12 +1061,28 @@ void __init xhci_dbc_uart_init(void)
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
+            return;
+
+        dbc->sbdf = PCI_SBDF(0, bus, slot, func);
+    }
+
     dbc->dbc_ctx = &ctx;
     dbc->dbc_erst = &erst;
     dbc->dbc_ering.trb = evt_trb;
-- 
git-series 0.9.1

