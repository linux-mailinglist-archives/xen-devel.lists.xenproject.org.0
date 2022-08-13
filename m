Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E318F591831
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386015.621867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7W-0000yx-6x; Sat, 13 Aug 2022 01:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386015.621867; Sat, 13 Aug 2022 01:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7W-0000rj-1W; Sat, 13 Aug 2022 01:39:22 +0000
Received: by outflank-mailman (input) for mailman id 386015;
 Sat, 13 Aug 2022 01:39:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7U-0000pT-EI
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:20 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf0874f2-1aa8-11ed-bd2e-47488cf2e6aa;
 Sat, 13 Aug 2022 03:39:19 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CF87C5C00C5;
 Fri, 12 Aug 2022 21:39:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 12 Aug 2022 21:39:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:16 -0400 (EDT)
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
X-Inumbo-ID: bf0874f2-1aa8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660354757; x=1660441157; bh=UAqmlVElOH
	Gms+qUDEDMr9ZztrAUMmQozFQJ+Lun5Kk=; b=HCR8O+mAUkl3FG1H4Odz0cgxBp
	DRQsGL6KLMHq0Ub7Fni5F0SeuS7FNko81d6k89fJSvyM9yT0j/Fn9znhYe1t50qL
	ywI4btRqdDMbBFFPmSng9XUgLvO5zus1VqS+3/O8C4bdBAzL3jIn9FAAH+pcs4a0
	sH9peyDTiu3YUerBWBH9I/sgfvwD36nsKTTE2M8t0DnCWu5vMuXq5QgZX4PVsO56
	aoo3ua9kBQnur37T0ofZiKQugXr9ckxHPnpHpwJ664sovHfsNe6yiq+JL2vUJ9Rh
	yVRJmg0YEFnd1Z5R+mIfeADG+Glc5aImxS3AP89qbMia60ZV8mOaba64prKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660354757; x=
	1660441157; bh=UAqmlVElOHGms+qUDEDMr9ZztrAUMmQozFQJ+Lun5Kk=; b=m
	+Ewa4/VTd8S6d7DWrOIvIwjXiw4NB69MNlrDFa5z3T9Jvh9IPtkuuws2AUmF7OM9
	Dc9tZZWFziCMSZ6Q8vWqfYE2gsy6PHNHw4HfCzV2WnbaGsfBOScHzfx/RHO3iwk1
	kHGAfdRmgIwjHK/2qz61vXG6JNgFkX3RVMPDM3vzLpoCnKo19y7qvRF2/jo96B+N
	gO1Uz+NcDe5Q3hXGAWAlCVdI+VzJ/IFUuc1E4BTbrpWipF/aMr7hGI8OfYYNNkMM
	iIK+Wlv7eC+86IAt7lEBcCkVJnrwRmJlm5dK+yO7Gu2VlnL0Hg4uqCDO947Hcgab
	K4Wlzy5AdGiswtBmdpZbA==
X-ME-Sender: <xms:xQD3YnyXaj0mnXPd2-DkhVMDtXTW7cyJz4M5vvBsu2yxT4837RqcnA>
    <xme:xQD3YvQDwmBzUljYQqTdhuZQzG9TQtz7N0hZhaXJ-CSQPa09Y9JNk4mn7rv5M_3Hq
    vaNLCoDjzJi6w>
X-ME-Received: <xmr:xQD3YhU_ebbuk59HnrZAKsYxdx8DKVGVlZE682vp1v0u0A8Y1CjjO-mkCk1DVB9Q67Jovotur2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:xQD3YhgmjEL6oN3j79WCn2fpFAXbdAJf2rRZAb3ndGcxTfhZhU0xGw>
    <xmx:xQD3YpCMSWoBMwROyTn3I4qbLFQ_sHVSUBwBZrKMymmsMijADjPEwg>
    <xmx:xQD3YqLVQEvFvC7Jqk2fzwGdCvTbMSBvHZznij1j4w5v49WjkZu6xA>
    <xmx:xQD3Ys47niqxZlUWN8BozusSjq6CLILUbtV7Bv6sa99eINSyyYechw>
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
Subject: [PATCH v4 02/11] drivers/char: reset XHCI ports when initializing dbc
Date: Sat, 13 Aug 2022 03:38:52 +0200
Message-Id: <f9b47a78968e06f5af2930d99e5dc558fdc131f2.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reset ports, to force host system to re-enumerate devices. Otheriwse it
will require the cable to be re-plugged, or will wait in the
"configuring" state indefinitely.

Trick and code copied from Linux:
drivers/usb/early/xhci-dbc.c:xdbc_start()->xdbc_reset_debug_port()

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index a16c81b9e71c..8c9dfa6cfcc0 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -66,6 +66,10 @@
     ((1UL << DBC_PSC_CSC) | (1UL << DBC_PSC_PRC) | (1UL << DBC_PSC_PLC) |      \
      (1UL << DBC_PSC_CEC))
 
+#define XHC_EXT_PORT_MAJOR(x)  (((x) >> 24) & 0xff)
+#define PORT_RESET             (1 << 4)
+#define PORT_CONNECT           (1 << 0)
+
 #define dbc_debug(...) printk("dbc debug: " __VA_ARGS__)
 #define dbc_alert(...) printk("dbc alert: " __VA_ARGS__)
 #define dbc_error(...) printk("dbc error: " __VA_ARGS__)
@@ -666,6 +670,73 @@ static void dbc_init_strings(struct dbc *dbc, uint32_t *info)
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
@@ -677,6 +748,10 @@ static void dbc_enable_dbc(struct dbc *dbc)
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

