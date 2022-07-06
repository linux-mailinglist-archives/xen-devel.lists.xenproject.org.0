Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E967568CE4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362332.592335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971L-0008Md-I7; Wed, 06 Jul 2022 15:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362332.592335; Wed, 06 Jul 2022 15:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971L-0008Fs-EF; Wed, 06 Jul 2022 15:32:55 +0000
Received: by outflank-mailman (input) for mailman id 362332;
 Wed, 06 Jul 2022 15:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWdV=XL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o971K-00081g-C6
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:32:54 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e691d91a-fd40-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 17:32:53 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C8A475C0170;
 Wed,  6 Jul 2022 11:32:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 06 Jul 2022 11:32:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 11:32:51 -0400 (EDT)
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
X-Inumbo-ID: e691d91a-fd40-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1657121572; x=1657207972; bh=jTLjQ6SoY6
	EYcoZ1VpBnLuSOpWBuAhAOnELQ3/iEcEM=; b=rzkhxG0SYBz5Iq251QGwCouSeM
	5edrhyGAkhKHvqd/7077KeEWW63IwCBJN6NTr0TzZFTulwz0WcRC9Tw69fRTLzbF
	RF2tqZwWCQag3Hy3cqEabg7YQVPusLmdfURc7XJlOmIR719CzujlOZ8/qbSkjp+a
	FiUAhkBPhQHLpWI67ocViubCnQUpEqwOh69gvRG61iulyFjW3fc+2Uv0eX5S3MKj
	Qefgt/ugsX7apAMAuoMCMnxZSFHbzy0/Libh09sp5ecESrHBZVwu1ybCFjavampx
	FHfHtYP1YAamIl/Nl3CP71mZ64XAOq+hXgiKC8udXpeLEuzUgLPhS0YOaMZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657121572; x=
	1657207972; bh=jTLjQ6SoY6EYcoZ1VpBnLuSOpWBuAhAOnELQ3/iEcEM=; b=X
	xl81hj67XgQ9b1T5I5QoRxyYqxrrcLlcCuS/mZkZzCv3ZBtm4Miu2qkdFEA3tMcj
	qri7Xt/w4h47qUH+ctBJPVA9QBt8jY6sGuNs2xYfA0KZNg2qD2yI1b2NyFxNypBY
	hUmgP/T9SNWC9+xVVAdlCNbKGOsMYCm4TZRAnApqO6oo7Drw5xQwWLyaoxcp2BD2
	QXMoW4UJjozlwrZ4zRMkuGCfzgcd3m1T9QjvzLW4yaTHObq1NBmjiVayWur1OFBz
	UzDfM8di4F3fqHS66Rru7MqucnMq6RYPFk2tFDaLvTdRpUaesW+ohd6gsNz2J2Q1
	yIBb/bwFpKB9Ih/rwj+jg==
X-ME-Sender: <xms:JKvFYnFfHFxrdjzNIxZEU3pYeFajnNVEBl9Pei3x9UBqPA6dmb4yQg>
    <xme:JKvFYkVF9vfkRRA414emwB-hSJ_Qa60i7k0jebA4QEbRSA75SEdfBUDOoZOT6Cn_E
    DXf_cZNuYR1DA>
X-ME-Received: <xmr:JKvFYpLUE38Bjgqcxhbpf0qXX28opd9m4CMy-8AqlWO43luzXIPi3QCaYFJKeNxXRtJ0WlUGS3I0_cNxU8oZz51aiGfUXzQ0fHySnnmZCLvQyBLK9Ic>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:JKvFYlEa6MPJvrFMDQoo1gL8KZNGjVVWXzamTMbl8CsSBk_0H6-AjA>
    <xmx:JKvFYtW-Z65maTKwq0JmHNsuXzhVCmyzbxWrE0Ad1vouBmhHBtW-1Q>
    <xmx:JKvFYgM74pqcmOdiZsEyR72y39GFMbp6LeS9ri2awG2vSmvwxTi67Q>
    <xmx:JKvFYrdKHoj8-wxHgMqIhUYrLiLTzIsFdWYVwF-mq2XApIdVyBKvCA>
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
Subject: [PATCH v2 2/9] xue: reset XHCI ports when initializing dbc
Date: Wed,  6 Jul 2022 17:32:07 +0200
Message-Id: <4874087c2304034e0d917d649f7cb9d46c149ed6.1657121519.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
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
Changes in v2:
- use uint32_t instead of u32
- code style
---
 xen/drivers/char/xue.c | 70 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+)

diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index 234b07b563bb..2cbbaea11fa0 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -63,6 +63,10 @@
     ((1UL << XUE_PSC_CSC) | (1UL << XUE_PSC_PRC) | (1UL << XUE_PSC_PLC) |      \
      (1UL << XUE_PSC_CEC))
 
+#define XUE_XHC_EXT_PORT_MAJOR(x)  (((x) >> 24) & 0xff)
+#define PORT_RESET                 (1 << 4)
+#define PORT_CONNECT               (1 << 0)
+
 #define xue_debug(...) printk("xue debug: " __VA_ARGS__)
 #define xue_alert(...) printk("xue alert: " __VA_ARGS__)
 #define xue_error(...) printk("xue error: " __VA_ARGS__)
@@ -590,6 +594,68 @@ static void xue_init_strings(struct xue *xue, uint32_t *info)
     info[8] = (4 << 24) | (30 << 16) | (8 << 8) | 6;
 }
 
+static void xue_do_reset_debug_port(struct xue *xue,
+                                    unsigned int id, unsigned int count)
+{
+    uint32_t *ops_reg;
+    uint32_t *portsc;
+    uint32_t val, cap_length;
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
+static void xue_reset_debug_port(struct xue *xue)
+{
+    uint32_t val, port_offset, port_count;
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
 static void xue_enable_dbc(struct xue *xue)
 {
     struct xue_dbc_reg *reg = xue->dbc_reg;
@@ -601,6 +667,10 @@ static void xue_enable_dbc(struct xue *xue)
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

