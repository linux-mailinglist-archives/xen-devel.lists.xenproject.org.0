Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B482B540167
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343346.568673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEm-0006C3-Sb; Tue, 07 Jun 2022 14:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343346.568673; Tue, 07 Jun 2022 14:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEm-00064p-OJ; Tue, 07 Jun 2022 14:31:16 +0000
Received: by outflank-mailman (input) for mailman id 343346;
 Tue, 07 Jun 2022 14:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEl-000619-Nd
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:15 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bcb5aaa-e66e-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 16:31:14 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A2265C01E3;
 Tue,  7 Jun 2022 10:31:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 07 Jun 2022 10:31:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:12 -0400 (EDT)
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
X-Inumbo-ID: 7bcb5aaa-e66e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654612274; x=1654698674; bh=hjjCyL93xP
	zVhTjBxPMqGX4BQBGEIc0Cak0bF/sHaPE=; b=VyGiUkOtBFMTxv7ZoHNmIbNOsd
	AB177RNXxwaSJWtagThnKSrkUjb5VNbsMLrTPv9n+jApy9ASVbcNMK2OVcfLUmhz
	0BIUbAeV4t8IEQLZHQK6zBWHVikGpjc1PvKqhpVadoazrvobSkNmdrkm+tn6bTex
	NrVXxUxZPDjXWf752c20zj0LowKRi6aTmSVWCkIzdAy4+VUEo3EYZ0BafpBjZzjh
	HhPhRZDycba/TePH6up79LLmHE3xzqyAoxoEBe55jw8vf6grHr9pf6NVi9xSalVV
	VweqCoKiEcoAPUhqqjvRGA9H/r7qCkmeWcCbgQiF+rKuAXI9gyk3r04vfFAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654612274; x=
	1654698674; bh=hjjCyL93xPzVhTjBxPMqGX4BQBGEIc0Cak0bF/sHaPE=; b=b
	G/zZt35M7Z/JIcwnFutal3cTjRw5VWuiwzM9heDUnGkkNsnyMHNrNfU8VRjFGIf8
	DWlQWykXOiBW/F0kJtQqzsjE6abvaW++gl9EPEfyJXQETnxFB+k/ZPwPud3gT/Yl
	WGXbI1GG8Lt29FOm35DA40JoKHsOZknAuMy4Axny/2jYktjbsfEqg5DSU8u1UKe4
	I8y5oxDn7w5uAoB3G4Q5e17S1p/uf9j/G9ZIEwito3XY6zCXfc+Imd9DDQ8MOCeI
	D4Z8+TyMroYRiQrYJW/SEDT5L5k7OkzZmpm4ebaM9A0ijQx0tcKe7yrmXXsqOBwE
	bdeWxAxb+xrCGA5heT+2g==
X-ME-Sender: <xms:MWGfYoqd5TDAYxH4Y_e8QvEUiH3rCGOH_GR_6Ec5fAOtRFi4b6YRcQ>
    <xme:MWGfYuorfEwqutM0VXSkxCA_FUaHIPIHzE_kf9tBx0SuJ1O3G_T_UIka_WXaIdTqc
    SThyy0lmyFiQw>
X-ME-Received: <xmr:MWGfYtNGa39QlgG7hirnwxW6qPnxa4qwYk-O5DUUdyhKXa6Z781GdVmqs1RB1e6SWArXkEa7u5ncmdSvwdxeWDpTptjCFmZkug2cd__p0vXBsTTOZqI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:MWGfYv4ltiv27I8yt0Sprm54VTOxeEYbJBxNoJA1o-V-bRt-KqpIrg>
    <xmx:MWGfYn4lHMlK_U5KTfoEOrz6CBUm26hB5zAaRq2N5VG_tYOtm3JZCA>
    <xmx:MWGfYvjGuT8SZFy80Go6NWa9aE5Q_7JDhnxltCC1FCx0GrokNnbr9w>
    <xmx:MmGfYtQW4zWLK4OQ3boShJ-3X6ZBfj68oUMiFQtTDSt49wpZLANcOg>
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
Subject: [PATCH v1 02/10] xue: reset XHCI ports when initializing dbc
Date: Tue,  7 Jun 2022 16:30:08 +0200
Message-Id: <f89ad3528e9d57e4598ac450f08a81391538fa69.1654612169.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
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
 xen/drivers/char/xue.c | 70 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+)

diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index e95dd09d39a8..a9ba25d9d07e 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -60,6 +60,10 @@
     ((1UL << XUE_PSC_CSC) | (1UL << XUE_PSC_PRC) | (1UL << XUE_PSC_PLC) |      \
      (1UL << XUE_PSC_CEC))
 
+#define     XUE_XHC_EXT_PORT_MAJOR(x)  (((x) >> 24) & 0xff)
+#define PORT_RESET  (1 << 4)
+#define PORT_CONNECT  (1 << 0)
+
 #define xue_debug(...) printk("xue debug: " __VA_ARGS__)
 #define xue_alert(...) printk("xue alert: " __VA_ARGS__)
 #define xue_error(...) printk("xue error: " __VA_ARGS__)
@@ -604,6 +608,68 @@ static void xue_init_strings(struct xue *xue, uint32_t *info)
     info[8] = (4 << 24) | (30 << 16) | (8 << 8) | 6;
 }
 
+static void xue_do_reset_debug_port(struct xue *xue, u32 id, u32 count)
+{
+    uint32_t *ops_reg;
+    uint32_t *portsc;
+    u32 val, cap_length;
+    int i;
+
+    cap_length = (*(uint32_t*)xue->xhc_mmio) & 0xff;
+    ops_reg = xue->xhc_mmio + cap_length;
+
+    id--;
+    for ( i = id; i < (id + count); i++ )
+    {
+        portsc = ops_reg + 0x100 + i * 0x4;
+        val = *portsc;
+        if ( !(val & PORT_CONNECT) )
+            *portsc = val | PORT_RESET;
+    }
+}
+
+
+static void xue_reset_debug_port(struct xue *xue)
+{
+    u32 val, port_offset, port_count;
+    uint32_t *xcap;
+    uint32_t next;
+    uint32_t id;
+    uint8_t *mmio = (uint8_t *)xue->xhc_mmio;
+    uint32_t *hccp1 = (uint32_t *)(mmio + 0x10);
+    const uint32_t PROTOCOL_ID = 0x2;
+
+    /**
+     * Paranoid check against a zero value. The spec mandates that
+     * at least one "supported protocol" capability must be implemented,
+     * so this should always be false.
+     */
+    if ( (*hccp1 & 0xFFFF0000) == 0 )
+        return;
+
+    xcap = (uint32_t *)(mmio + (((*hccp1 & 0xFFFF0000) >> 16) << 2));
+    next = (*xcap & 0xFF00) >> 8;
+    id = *xcap & 0xFF;
+
+    /* Look for "supported protocol" capability, major revision 3 */
+    for ( ; next; xcap += next, id = *xcap & 0xFF, next = (*xcap & 0xFF00) >> 8)
+    {
+        if ( id != PROTOCOL_ID && next )
+            continue;
+
+        if ( XUE_XHC_EXT_PORT_MAJOR(*xcap) != 0x3 )
+            continue;
+
+        /* extract ports offset and count from the capability structure */
+        val = *(xcap + 2);
+        port_offset = val & 0xff;
+        port_count = (val >> 8) & 0xff;
+
+        /* and reset them all */
+        xue_do_reset_debug_port(xue, port_offset, port_count);
+    }
+}
+
 static void xue_dump(struct xue *xue)
 {
     struct xue_dbc_reg *r = xue->dbc_reg;
@@ -639,6 +705,10 @@ static void xue_enable_dbc(struct xue *xue)
     while ( (reg->ctrl & (1UL << XUE_CTRL_DCE)) == 0 )
         xue_sys_pause();
 
+    /* reset ports on initial open, to force re-enumerating by the host */
+    if ( !xue->open )
+        xue_reset_debug_port(xue);
+
     wmb();
     reg->portsc |= (1UL << XUE_PSC_PED);
     wmb();
-- 
git-series 0.9.1

