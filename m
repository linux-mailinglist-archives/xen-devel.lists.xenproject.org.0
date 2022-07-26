Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6745809EA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374936.607172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAV-0003yZ-L8; Tue, 26 Jul 2022 03:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374936.607172; Tue, 26 Jul 2022 03:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAV-0003w9-HI; Tue, 26 Jul 2022 03:23:35 +0000
Received: by outflank-mailman (input) for mailman id 374936;
 Tue, 26 Jul 2022 03:23:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGBAT-0003P0-SL
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:23:33 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52d2e04c-0c92-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:23:31 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E3605C00E4;
 Mon, 25 Jul 2022 23:23:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 25 Jul 2022 23:23:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:23:29 -0400 (EDT)
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
X-Inumbo-ID: 52d2e04c-0c92-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658805811; x=1658892211; bh=mn0z1OH9eg
	gVIVHY4O0/oZ9aMMverVaOFzZCSUteg7c=; b=glyArnG9S9fGItYdmV6xuIABX5
	FhM7J6AkqfUzfPh2O7CVhcjHsDrn7PO5FMQqiIr+fZUPQ5TPMxNUjFxrTBdZgqVh
	OkTmGiHQl3joPxAxosiLnyuirErBkMVPuc8GZP5Cq1gxPcKcj99Ml5Kt9ao/dnzG
	8x2Vd3NH1Gh+WBtkhq8enqPrvgFfEGPNcG7+ebW3MxbPpy3xRjXaEzw5UGKokKwB
	6nbnETABu/fgP9cWXq7u0x0KvFzW9MRdMlEnhRokQwSznX1oojyY/DXZr6rQGUKu
	WWBIhHVMB28SnHTrvjmpUOKNDHbH0YCJyiVaHfrSmLY8MiAR1n8u/VHIzz2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658805811; x=
	1658892211; bh=mn0z1OH9eggVIVHY4O0/oZ9aMMverVaOFzZCSUteg7c=; b=Q
	lyKL0uHEipv1rrru2WwJyMUJQaNjeg4nDF+9uELy6xyvm/OEixaJkKYQ0ApF8oXZ
	qWPtLiBjr/DfeMh8QW+unVX8uBBvHXilEPtIRQ8i/lWP5Psa3E23tgWM9X+oKg3t
	g/CHzhwkKKudqZmSCzlpNLd38Gt3MIZs6QagGcb6C2plPKjQHGTI+5Jx4AKj0J6M
	ZGuszkvtgmsq5cFPe1zZAlJyk+Mlnf4K7la8EHTqFiZrq4S7uL8IZuwiGA2cvHUB
	5RZvFXmTWj9+rcPDEshWS7gqfr9co+LvQjwhj/a5ldQVOwKkEEV1YsyE+za7GuVs
	HvaU9M2d4LyR22NKVCZiA==
X-ME-Sender: <xms:Ml7fYmZx8exoyiZqJ0IpTHUWR2Dlt_CsFouyZa4DjvELGf6jCjICZQ>
    <xme:Ml7fYpYIrRRW953UZrFjXioAqZzP8xAHykGaRFMLfWCCxpc9s9ozAz8ucpFOCIREj
    -IxXnGnfgVKNw>
X-ME-Received: <xmr:Ml7fYg_ECzkSk2qkqN-vuL7ojTY962N3nu14Wfp9moPaMgqXbr8HyzBPIV-9bcDbjB4Y6ufhUMPQsRsWYTxr9RAEtYZG1FRQclBvQOdv5Ia9MC0Qn1mT_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Ml7fYopg3-Avv0Jg3cHM2G4wH5J1ry5d95jAmyF8V_A4xTLpL3VjWg>
    <xmx:Ml7fYhrbU1eW7qXfVo7rjStQSWRRQqgSC33sCpHSK7i92eE3Y-H1rg>
    <xmx:Ml7fYmRCbI4c0yZq4yICgBOv8deQCiayT0xgnxfWPA2HnCPeBQWWWg>
    <xmx:M17fYqAL-dDBtxDDCOX-w189jrA2ompGyLpq_22OkKlj_J2WoHmiWQ>
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
Subject: [PATCH v3 02/10] drivers/char: reset XHCI ports when initializing dbc
Date: Tue, 26 Jul 2022 05:23:07 +0200
Message-Id: <0f26cc3299e340f7cea58aa59fcd462abd3215da.1658804819.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reset ports, to force host system to re-enumerate devices. Otheriwse it
will require the cable to be re-plugged, or will wait in the
"configuring" state indefinitely.

Trick and code copied from Linux:
drivers/usb/early/xhci-dbc.c:xdbc_start()->xdbc_reset_debug_port()

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- adjust for renamed driver
- use readl() etc for MMIO
- simplify xcap lookup
- drop acked-by
Changes in v2:
- use uint32_t instead of u32
- code style
---
 xen/drivers/char/xhci-dbc.c | 75 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index f0e60d1b86aa..53c39eedd4a6 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -63,6 +63,10 @@
     ((1UL << DBC_PSC_CSC) | (1UL << DBC_PSC_PRC) | (1UL << DBC_PSC_PLC) |      \
      (1UL << DBC_PSC_CEC))
 
+#define XHC_EXT_PORT_MAJOR(x)  (((x) >> 24) & 0xff)
+#define PORT_RESET             (1 << 4)
+#define PORT_CONNECT           (1 << 0)
+
 #define dbc_debug(...) printk("dbc debug: " __VA_ARGS__)
 #define dbc_alert(...) printk("dbc alert: " __VA_ARGS__)
 #define dbc_error(...) printk("dbc error: " __VA_ARGS__)
@@ -660,6 +664,73 @@ static void dbc_init_strings(struct dbc *dbc, uint32_t *info)
                            &dbc->dbc_ctx->serial_size);
 }
 
+static void dbc_do_reset_debug_port(struct dbc *dbc,
+                                    unsigned int id, unsigned int count)
+{
+    uint32_t __iomem *ops_reg;
+    uint32_t __iomem *portsc;
+    uint32_t val, cap_length;
+    unsigned int i;
+
+    cap_length = readl(dbc->xhc_mmio) & 0xff;
+    ops_reg = dbc->xhc_mmio + cap_length;
+
+    id--;
+    for ( i = id; i < (id + count); i++ )
+    {
+        portsc = ops_reg + 0x100 + i * 0x4;
+        val = readl(portsc);
+        if ( !(val & PORT_CONNECT) )
+            writel(val | PORT_RESET, portsc);
+    }
+}
+
+static void dbc_reset_debug_port(struct dbc *dbc)
+{
+    uint32_t val, port_offset, port_count;
+    uint32_t __iomem *xcap;
+    uint32_t xcap_val;
+    uint32_t next;
+    uint32_t id;
+    uint8_t __iomem *mmio = (uint8_t *)dbc->xhc_mmio;
+    uint32_t __iomem *hccp1 = (uint32_t *)(mmio + 0x10);
+    const uint32_t PROTOCOL_ID = 0x2;
+    int ttl = 48;
+
+    xcap = (uint32_t *)dbc->xhc_mmio;
+    /*
+     * This is initially an offset to the first capability. All the offsets
+     * (both in HCCP1 and then next capability pointer are dword-based.
+     */
+    next = (readl(hccp1) & 0xFFFF0000) >> 16;
+
+    /*
+     * Look for "supported protocol" capability, major revision 3.
+     * There may be multiple of them.
+     */
+    while ( next && ttl-- )
+    {
+        xcap += next;
+        xcap_val = readl(xcap);
+        id = xcap_val & 0xFF;
+        next = (xcap_val & 0xFF00) >> 8;
+
+        if ( id != PROTOCOL_ID )
+            continue;
+
+        if ( XHC_EXT_PORT_MAJOR(xcap_val) != 0x3 )
+            continue;
+
+        /* extract ports offset and count from the capability structure */
+        val = readl(xcap + 2);
+        port_offset = val & 0xff;
+        port_count = (val >> 8) & 0xff;
+
+        /* and reset them all */
+        dbc_do_reset_debug_port(dbc, port_offset, port_count);
+    }
+}
+
 static void dbc_enable_dbc(struct dbc *dbc)
 {
     struct dbc_reg *reg = dbc->dbc_reg;
@@ -671,6 +742,10 @@ static void dbc_enable_dbc(struct dbc *dbc)
     while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCE)) == 0 )
         cpu_relax();
 
+    /* reset ports on initial open, to force re-enumerating by the host */
+    if ( !dbc->open )
+        dbc_reset_debug_port(dbc);
+
     wmb();
     writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
     wmb();
-- 
git-series 0.9.1

