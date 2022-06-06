Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B63353E02D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342167.567266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bn-0007EO-FV; Mon, 06 Jun 2022 03:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342167.567266; Mon, 06 Jun 2022 03:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bn-00079r-Bk; Mon, 06 Jun 2022 03:40:51 +0000
Received: by outflank-mailman (input) for mailman id 342167;
 Mon, 06 Jun 2022 03:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bl-0006LY-Kk
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:49 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73f70345-e54a-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 05:40:48 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 971ED5C0131;
 Sun,  5 Jun 2022 23:40:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 05 Jun 2022 23:40:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:46 -0400 (EDT)
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
X-Inumbo-ID: 73f70345-e54a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486847; x=1654573247; bh=rjE4Ee2HRh
	qow39eHssjbU5ZMvphSoRBeyLy9XO4DAQ=; b=W3lXABqFbA/PUMjQFDR+An8CC5
	2L7W6qsjbMmAzZ59mgo0wndLKDLuJDD0PEQQap5NqsXkm9wbKlWNDW1nx7vnkGnH
	JUT2G4FX5OxFPei1FMFMicEsndVO8c5cLPf2MafUr1cr5ME3smNjv+QsyeK2n/T9
	YPg4CTLBR7W7jj0JaW9Br3jmczbK9GzuB2tVNTs2mge7/AU9fYQXFkNvvOEj+3eF
	HJ0gqj0MrJ06QHEj3gD6hs6AmxFX6KX1donKm0fzpKgy1WabZgrlcFTgNaCU/EBe
	U0yTWdqaWZeWuhuXdrf45+A/dp1U2w/ZeeJQp2Snyq3xuAOH2pGHlNXCQAbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486847; x=
	1654573247; bh=rjE4Ee2HRhqow39eHssjbU5ZMvphSoRBeyLy9XO4DAQ=; b=X
	2ABJW7Je5uwXpvgr9FSrCgyORHWpdQqhgsriS4C4OEcPPdXnCBu8IoQssne1Llny
	uGIs9xdBN0rRaRWYMqbSTpkX+t+ZdW9V9OEpSbgEDgFlhF4MQgxru0iqcJOfiexz
	4TTsdWJCpqx4QkeG1bKEF8lUi9d0/AvjUUTUt1SDW/4QOaynxCdJ1oHcTuRvn+cO
	NV+BaiKhpR5wTx4CImz4iXu9lav1LP2skh9C6U1r/WXRuF3sklQ8XkZQYWRUxGF/
	dK9T5g4KoYuNAnzYIgGIn+Td9r7Rlr8kvGMxdb0jr6HpBs+vNlanEXuI4tU2QmAI
	LD5SDrVq60emRIp47ajcw==
X-ME-Sender: <xms:P3edYhYuJMwqFRAoEm0Vb2hdJ16sP_Y1NwLIZXpG2ZedkIDbP-DLHw>
    <xme:P3edYoZ_DUXtpZgWhNmG37gvCuhnUZMBpm09tnhWrxr1kPawlQPgQhbfxyLTkeZ79
    EFVWmcLHzUASQ>
X-ME-Received: <xmr:P3edYj8IOkKytKe1dNoYy5RkQyXIHgG1KdX_go130koCXCpp2CSTE3TyXso_sdIAJaw5HkXChmrkLPYKHn8M_6oUYxhty6O-i_O42u4Ug4KNgY0benA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:P3edYvqIFdenqUgpjQFaNmeU2AN44Y4X1tYPrtuHavSHPHrVchTMtA>
    <xmx:P3edYsqy9zsOVdsLPqQeQ7ZxlLo-RZZ7cFPDPbeFG0FzLIbtHj9FbA>
    <xmx:P3edYlQ4N5LIPFwqCmrlLzDISLmR4y40PWD2FT_-Zpg2TvnzZw8p4A>
    <xmx:P3edYhDJsUqQhVqkZswou49LDHt6p0Lf4FzBeR2jGt-iKcd9hIZaMQ>
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
Subject: [RFC PATCH 04/12] xue: add support for selecting specific xhci
Date: Mon,  6 Jun 2022 05:40:16 +0200
Message-Id: <c7a261e10c611de3bd457d540524b8207f98fcfc.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Handle parameters similar to dbgp=ehci.

Implement this by not resettting xhc_cf8 again in xue_init_xhc(), but
using a value found there if non-zero. Additionally, add xue->xhc_num to
select n-th controller.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 docs/misc/xen-command-line.pandoc |  5 ++++-
 xen/drivers/char/xue.c            | 17 ++++++++++++++-
 xen/include/xue.h                 | 38 +++++++++++++++++++-------------
 3 files changed, 45 insertions(+), 15 deletions(-)

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
index 98334090c078..632141715d4d 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -125,6 +125,7 @@ void __init xue_uart_init(void)
 {
     struct xue_uart *uart = &xue_uart;
     struct xue *xue = &uart->xue;
+    const char *e;
 
     if ( strncmp(opt_dbgp, "xue", 3) )
         return;
@@ -132,6 +133,22 @@ void __init xue_uart_init(void)
     memset(xue, 0, sizeof(*xue));
     memset(&xue_ops, 0, sizeof(xue_ops));
 
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
+        xue->xhc_cf8 = (1UL << 31) | (bus << 16) | (slot << 11) | (func << 8);
+    }
+
     xue->dbc_ctx = &ctx;
     xue->dbc_erst = &erst;
     xue->dbc_ering.trb = evt_trb;
diff --git a/xen/include/xue.h b/xen/include/xue.h
index 6048dcdd5509..b1f304958679 100644
--- a/xen/include/xue.h
+++ b/xen/include/xue.h
@@ -998,6 +998,7 @@ struct xue {
     int dma_allocated;
     int open;
     int sysid;
+    int xhc_num; /* look for n-th xhc */
 };
 
 static inline void *xue_mset(void *dest, int c, uint64_t size)
@@ -1068,24 +1069,31 @@ static inline int xue_init_xhc(struct xue *xue)
 
     struct xue_ops *ops = xue->ops;
     void *sys = xue->sys;
-    xue->xhc_cf8 = 0;
 
-    /*
-     * Search PCI bus 0 for the xHC. All the host controllers supported so far
-     * are part of the chipset and are on bus 0.
-     */
-    for (devfn = 0; devfn < 256; devfn++) {
-        uint32_t dev = (devfn & 0xF8) >> 3;
-        uint32_t fun = devfn & 0x07;
-        uint32_t cf8 = (1UL << 31) | (dev << 11) | (fun << 8);
-        uint32_t hdr = (xue_pci_read(xue, cf8, 3) & 0xFF0000U) >> 16;
-
-        if (hdr == 0 || hdr == 0x80) {
-            if ((xue_pci_read(xue, cf8, 2) >> 8) == XUE_XHC_CLASSC) {
-                xue->xhc_cf8 = cf8;
-                break;
+    if (xue->xhc_cf8 == 0) {
+        /*
+         * Search PCI bus 0 for the xHC. All the host controllers supported so far
+         * are part of the chipset and are on bus 0.
+         */
+        for (devfn = 0; devfn < 256; devfn++) {
+            uint32_t dev = (devfn & 0xF8) >> 3;
+            uint32_t fun = devfn & 0x07;
+            uint32_t cf8 = (1UL << 31) | (dev << 11) | (fun << 8);
+            uint32_t hdr = (xue_pci_read(xue, cf8, 3) & 0xFF0000U) >> 16;
+
+            if (hdr == 0 || hdr == 0x80) {
+                if ((xue_pci_read(xue, cf8, 2) >> 8) == XUE_XHC_CLASSC) {
+                    if (xue->xhc_num--)
+                        continue;
+                    xue->xhc_cf8 = cf8;
+                    break;
+                }
             }
         }
+    } else {
+        /* Verify if selected device is really xHC */
+        if ((xue_pci_read(xue, xue->xhc_cf8, 2) >> 8) != XUE_XHC_CLASSC)
+            xue->xhc_cf8 = 0;
     }
 
     if (!xue->xhc_cf8) {
-- 
git-series 0.9.1

