Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FCF6491C2
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 03:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458709.716533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4BnV-00031v-2p; Sun, 11 Dec 2022 02:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458709.716533; Sun, 11 Dec 2022 02:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4BnU-0002ux-RP; Sun, 11 Dec 2022 02:10:32 +0000
Received: by outflank-mailman (input) for mailman id 458709;
 Sun, 11 Dec 2022 02:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=97oD=4J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p4BnT-0002cO-7e
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 02:10:31 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fadf7b8b-78f8-11ed-91b6-6bf2151ebd3b;
 Sun, 11 Dec 2022 03:10:28 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D33A5C00AE;
 Sat, 10 Dec 2022 21:10:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 10 Dec 2022 21:10:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Dec 2022 21:10:25 -0500 (EST)
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
X-Inumbo-ID: fadf7b8b-78f8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1670724627; x=1670811027; bh=sg2cPuKe2S
	k532Re3aGsL/PLgELaIrHgpLc2ZsAa7cs=; b=gclVIleoM/4MGvi6lRswZNZopC
	ZDkFF4Lrkw0fHRAUMxwy1/tgL44ipW6QB6C/aE9aDgWRVc2icnH1Z+S3/Bt/xVZg
	K4Nk46pl8SqActJC8pUn5hOyWPFwWCeyjnaFvv4gbTOxy86SiKoOPk0KN/dWQcPA
	HuucwXxNYJQJM5N47jaUeM1O2oTXsoNJNzkgB4ee63SV8tfhSRvn3kMY3yDw972p
	Klv7NuzyF23LCTMiy8Pi9wQmuUNhG85jz6nxM7i+iP7Gbp+KIt8w+ogDFi2OTz7b
	FwpJFi+lPLNmlaXUDFRih9TwhCawhFCoSX29tOmB8WHiMmPfPItWzQbmDjLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670724627; x=
	1670811027; bh=sg2cPuKe2Sk532Re3aGsL/PLgELaIrHgpLc2ZsAa7cs=; b=S
	YGtLBF8Jwnb2aH/2qmC62LGr3OHVMfcS6HNpVnzf19xqrer3PiLvnoVAxY84PHm4
	rKFCcdZYnMj2uVICTUZwPVjhxvlqaZ6juXRjdozjUs76Hf0qp6moVvnQ+DLP8jve
	bVEHNTgx6ijJsQakcXFBtrcmzDO7ndMsFB/5Q+Q5DHWtA1pFfO3ziiKmecpULf/I
	v8wHtjdeKNYMgoEyEqwtNnTkp4wTbIQt6kDypOy14k2pVJ4ajCSGTewhhegk53DP
	4iIU4k5po8suOFMRPUgTKGkqxGJVRG7HxstU5rVrda+02m7n07KXJWNA83vcoW3m
	mqme8hr+OVHQLsMU2M68w==
X-ME-Sender: <xms:EzyVY1JsujUKilRQeU3xwbO-adlJnuDw8N8-kz3nKDTTnLcYxwR27w>
    <xme:EzyVYxLnP531ElgIpBbwT80iDSmt8Qa1Wu49yk4ad84tHIa7UMPs2kLweEmJRu2A7
    InIrgd_QVLcSw>
X-ME-Received: <xmr:EzyVY9vmx_WDq5jtbtKTSqLGm7QQVeL8FYW7meHFv46j9B5nhcoS0aNrLFQEsHIQuhezbe5ZMq6iqqXlZqsL5MkGl4asZzjBxxHPShkD5tqUcSPfEeE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:EzyVY2Z5TUAEl9ja2zreCfwyjn_4CwAscI2kNnObavWBsbLYyduiPA>
    <xmx:EzyVY8YYWpYGpWVDpKTmAowArR9e5zNelqs3HyNDryxJovUV3YFQtg>
    <xmx:EzyVY6AMDQIxNQhiP06MvTUcSLurovuAJwq0a8TxjnkjyRiBxwir-A>
    <xmx:EzyVY7yNXhne7H8kwNPfopk7elhV3t3AvwVFuO1VRocVPrpjuR73MQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 2/3] drivers/char: search all buses for xhci
Date: Sun, 11 Dec 2022 03:10:05 +0100
Message-Id: <34d3e4e4067b86183e6d834c8bc93736f058fe19.1670724490.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
References: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On (at least some) AMD systems, XHCI isn't on bus 0 (in my case, it was
bus 4). Search all of them.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/xhci-dbc.c | 84 +++++++++++++++++++++++++++++---------
 1 file changed, 66 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 60b781f87202..62b0ce88b6bf 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -286,39 +286,87 @@ static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
     return fix_to_virt(FIX_XHCI_END);
 }
 
+static void xhci_bios_handoff(struct dbc *dbc)
+{
+    const uint32_t __iomem *xcap;
+    uint32_t xcap_val;
+    uint32_t next;
+    uint32_t id = 0;
+    const void __iomem *mmio = dbc->xhc_mmio;
+    const uint32_t __iomem *hccp1 = mmio + 0x10;
+    const uint32_t LEGACY_ID = 0x1;
+    int ttl = 48;
+    int timeout = 10000;
+
+    xcap = mmio;
+    /*
+     * This is initially an offset to the first capability. All the offsets
+     * (both in HCCP1 and then next capability pointer) are dword-based.
+     */
+    next = (readl(hccp1) & 0xFFFF0000) >> 16;
+
+    while ( id != LEGACY_ID && next && ttl-- )
+    {
+        xcap += next;
+        xcap_val = readl(xcap);
+        id = xcap_val & 0xFF;
+        next = (xcap_val & 0xFF00) >> 8;
+    }
+
+    if ( id != LEGACY_ID )
+        return;
+
+    xcap_val = readl(xcap);
+#define XHCI_HC_BIOS_OWNED (1U << 16)
+#define XHCI_HC_OS_OWNED (1U << 24)
+    if (xcap_val & XHCI_HC_BIOS_OWNED) {
+        dbc_error("bios owned\n");
+        writeb(1, (uint8_t*)xcap + 3);
+        while ((readl(xcap) & (XHCI_HC_BIOS_OWNED | XHCI_HC_OS_OWNED)) != XHCI_HC_OS_OWNED)
+        {
+            cpu_relax();
+            if (!--timeout)
+                break;
+        }
+        if (!timeout)
+            dbc_error("handoff timeout\n");
+        xcap_val = readl(xcap + 1);
+        xcap_val &= ((0x7 << 1) + (0xff << 5) + (0x7 << 17)); // XHCI_LEGACY_DISABLE_SMI
+        xcap_val |= (0x7 << 29); // XHCI_LEGACY_SMI_EVENTS
+        writel(xcap_val, xcap + 1);
+    }
+}
+
 static bool __init dbc_init_xhc(struct dbc *dbc)
 {
     uint32_t bar0;
     uint64_t bar1;
     uint64_t bar_val;
     uint64_t bar_size;
-    uint64_t devfn;
+    unsigned int bus, devfn;
     uint16_t cmd;
     size_t xhc_mmio_size;
 
     if ( dbc->sbdf.sbdf == 0 )
     {
-        /*
-         * Search PCI bus 0 for the xHC. All the host controllers supported so
-         * far are part of the chipset and are on bus 0.
-         */
-        for ( devfn = 0; devfn < 256; devfn++ )
-        {
-            pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
-            uint8_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
-
-            if ( hdr == 0 || hdr == 0x80 )
+        for ( bus = 0; bus < 0x100; bus++ )
+            for ( devfn = 0; devfn < 256; devfn++ )
             {
-                if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) ==
-                     DBC_XHC_CLASSC )
+                pci_sbdf_t sbdf = PCI_SBDF(0, bus, devfn);
+                uint8_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
+
+                if ( hdr == 0 || hdr == 0x80 )
                 {
-                    if ( dbc->xhc_num-- )
-                        continue;
-                    dbc->sbdf = sbdf;
-                    break;
+                    if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) ==
+                         DBC_XHC_CLASSC )
+                    {
+                        if ( dbc->xhc_num-- )
+                            continue;
+                        dbc->sbdf = sbdf;
+                        break;
+                    }
                 }
             }
-        }
     }
     else
     {
-- 
git-series 0.9.1

