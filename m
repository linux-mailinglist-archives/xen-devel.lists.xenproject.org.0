Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A453E032
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342166.567251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bm-0006q3-5g; Mon, 06 Jun 2022 03:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342166.567251; Mon, 06 Jun 2022 03:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bm-0006lD-1U; Mon, 06 Jun 2022 03:40:50 +0000
Received: by outflank-mailman (input) for mailman id 342166;
 Mon, 06 Jun 2022 03:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bl-0006LY-2l
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:49 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7311c486-e54a-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 05:40:47 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 17C635C0148;
 Sun,  5 Jun 2022 23:40:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 05 Jun 2022 23:40:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:44 -0400 (EDT)
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
X-Inumbo-ID: 7311c486-e54a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486846; x=1654573246; bh=c0cgv9w4Lg
	orNmNlJ07oJSahIj0+LHfl1jX6Aux8s3M=; b=Em9l1tQe6BW4ubfwuvScHVisYO
	NZ9juiKsdj2dzC/QD736ofHVHoXvvzcLgDRdZ5hyWnlegygzwT6Hwb/xc2zCfJTF
	KrWoED1p85JKkSL3Lmx6lylYJ+GPyEGtnwqqU+fJCJDo6FZ02uSerqjMIhWSmBbr
	Eo1HcGRmJKy9Q9IhWRk2zAZeD8vs9Bn5SBqFNMRM37nhemaHuDxdXpzqFn5uuHie
	ha83nwuUFaLntZkwydflYRkkC5Cw6O7sO6YM5hY8YntNdO6lLZYy7/LEUoRtlc4K
	9fOCGHquDYmoQrt1Ka5b9pNc3Y5GH4Av8fTLdZPXqy0nEp/GllFHPN5FHVSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486846; x=
	1654573246; bh=c0cgv9w4LgorNmNlJ07oJSahIj0+LHfl1jX6Aux8s3M=; b=q
	DrAlhTnCMLiolvNqEwz453ubt1eiVi+e5NXTnNt+zxnxFOVRcLKbjTfjDR7G6KBH
	LKdKWoC1R30v6WIXQ7U1JnJN3MhNWV7c+XA+hAEcNjAheb06ch79I0om/Zx8KquH
	DqP4JhboHogjzNUOJ+NuPrjbpcK/19G8vYVVaPII+5dfwVI1HTisqyMQtjjcQQ0K
	VW4mbDE7T/Fzw4v1g/jmtTugy2MR+KfGJNggjVYM9XqclSD9zSKzpGT2xWtwKA7U
	uCXkfgz/2KYb0BuZsBzT/7LjViO5M1IEME115WuaYS62n4S7ezgMte6Jv972uont
	PPc1I3w7DU/8irBk+EVHQ==
X-ME-Sender: <xms:PXedYtTh_s7fpihmjYWSI2GYJc3nA0tc7HPsD3dDbrn9YOOw4GPHzg>
    <xme:PXedYmy70HCgJPe561RN85h-PDX1WwH5uJlC4-Vo-bwvv4B34tfEbP0D1naD-zjyq
    TABpMceYgLqpw>
X-ME-Received: <xmr:PXedYi0tM_i_0w5pRisLS4PlXEKOgnozfK_e0Y0FqQmV-ODpW3VQ8vBqvq-u1uvLOtwh4mV3v_QRs6bGCe9gY9CKQsD3Jt-qK6NYnkkdjfYW7PHUSRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PXedYlAWwJj0V0DTvW12LDXET0xPeBuPCcfqQjnKzh68fMq6VrvXXg>
    <xmx:PXedYmgk2cuG_PU8trxdqvNJ-3zBDsLkEVR4VC3o4qG9YtGcNknRJA>
    <xmx:PXedYpqM8CK1v36faClKh17oWIkcKsV_2T92zUFcWSCTKbZBJiejGw>
    <xmx:PnedYoa2_KnKlcXSoTMgcijT7KAp4LWFyk4xZr77IDRF8_qpFUgExg>
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
Subject: [RFC PATCH 03/12] xue: reset XHCI ports when initializing dbc
Date: Mon,  6 Jun 2022 05:40:15 +0200
Message-Id: <27748e5f94769a66900697e521b35b61b1da01d8.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
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
 xen/include/xue.h | 69 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+)

diff --git a/xen/include/xue.h b/xen/include/xue.h
index 7515244f6af3..6048dcdd5509 100644
--- a/xen/include/xue.h
+++ b/xen/include/xue.h
@@ -59,6 +59,10 @@
     ((1UL << XUE_PSC_CSC) | (1UL << XUE_PSC_PRC) | (1UL << XUE_PSC_PLC) |      \
      (1UL << XUE_PSC_CEC))
 
+#define     XUE_XHC_EXT_PORT_MAJOR(x)  (((x) >> 24) & 0xff)
+#define PORT_RESET  (1 << 4)
+#define PORT_CONNECT  (1 << 0)
+
 static inline int known_xhc(uint32_t dev_ven)
 {
     switch (dev_ven) {
@@ -1420,6 +1424,67 @@ static inline void xue_init_strings(struct xue *xue, uint32_t *info)
     info[8] = (4 << 24) | (30 << 16) | (8 << 8) | 6;
 }
 
+static inline void xue_do_reset_debug_port(struct xue *xue, u32 id, u32 count)
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
+    for (i = id; i < (id + count); i++) {
+        portsc = ops_reg + 0x100 + i * 0x4;
+        val = *portsc;
+        if (!(val & PORT_CONNECT))
+            *portsc = val | PORT_RESET;
+    }
+}
+
+
+static inline void xue_reset_debug_port(struct xue *xue)
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
+    if ((*hccp1 & 0xFFFF0000) == 0) {
+        return;
+    }
+
+    xcap = (uint32_t *)(mmio + (((*hccp1 & 0xFFFF0000) >> 16) << 2));
+    next = (*xcap & 0xFF00) >> 8;
+    id = *xcap & 0xFF;
+
+    /* Look for "supported protocol" capability, major revision 3 */
+    for (;next; xcap += next, id = *xcap & 0xFF, next = (*xcap & 0xFF00) >> 8) {
+        if (id != PROTOCOL_ID && next)
+            continue;
+
+        if (XUE_XHC_EXT_PORT_MAJOR(*xcap) != 0x3)
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
 static inline void xue_dump(struct xue *xue)
 {
     struct xue_ops *op = xue->ops;
@@ -1459,6 +1524,10 @@ static inline void xue_enable_dbc(struct xue *xue)
         ops->pause(sys);
     }
 
+    /* reset ports on initial open, to force re-enumerating by the host */
+    if (!xue->open)
+        xue_reset_debug_port(xue);
+
     ops->sfence(sys);
     reg->portsc |= (1UL << XUE_PSC_PED);
     ops->sfence(sys);
-- 
git-series 0.9.1

