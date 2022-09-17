Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5C5BB5A4
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 04:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408199.650923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvo-0002yt-Ox; Sat, 17 Sep 2022 02:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408199.650923; Sat, 17 Sep 2022 02:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvo-0002wh-MD; Sat, 17 Sep 2022 02:51:48 +0000
Received: by outflank-mailman (input) for mailman id 408199;
 Sat, 17 Sep 2022 02:51:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=os+o=ZU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZNvn-0002wS-ET
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 02:51:47 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa4bef6e-3633-11ed-9761-273f2230c3a0;
 Sat, 17 Sep 2022 04:51:45 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F8025C00F8;
 Fri, 16 Sep 2022 22:51:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 16 Sep 2022 22:51:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 22:51:43 -0400 (EDT)
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
X-Inumbo-ID: aa4bef6e-3633-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663383104; x=1663469504; bh=lrkiGrmoKq
	AiVQo0EOwsLXEqHNX4rJOp8Mpa4BXZipo=; b=lUy/vstw7xfZtd5HZtQGnQQLWz
	TxjW1JYGtJzEnDt+QFr+kajn6k6/1T/3OghR9AfMh+Y1+gMjSIKDOyft1TFR9NUE
	zjnrCChavxLvE23d4MY3YfkJdtAxDflcDxbg/xeEUdJ9+1Fh+z3BiL57sxUNCAzw
	bK7NPfdOetzKky6Tck7JywcWwTj2dn0UPCsCX/sUfcgEXEwKyM/cFsfQAE5vBvT7
	ME12mt3Fkc7ZfAn40L592ushwXa8ffONoEtn1faNOmUq2xBrv1G3d5WFHiV1KoDb
	fRuV2KmUgxU0rUE/rIjsiou4ybqnbb6WN2btIwKek8oNIwptHmod3mZM0ttg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663383104; x=
	1663469504; bh=lrkiGrmoKqAiVQo0EOwsLXEqHNX4rJOp8Mpa4BXZipo=; b=g
	dt00lbwvTVi1BALh0a8QBpRYoli8sevqOOOWqv65aN+CT/v0MNq8wgF7OrDMpzg1
	b8r0HnedXHiTqat3x3jAkGG8mOZvJ4vlxuosGbmUI3Kfd8MuAgrmgcszV43tJKco
	V+TIHhAMAAFsKEGswhA5JC9yL87hdlRzTtD0gWKZs1N2/8UzONQbRCKB5KrW0gK+
	rCHzBe3ZlNZ3miiR/QLIIY0I7z/YpdGVH8BGoCezcj3QkjXNbm+hxBJWUlDcHlNA
	MDSeBGIs3QEZCN0njhZ158A6udtkrb+W8Ar3nbCDVuKJ/3DHGIV+dj8WwsCCHaYY
	/N1LoXCapM+gIVLTbjcQg==
X-ME-Sender: <xms:QDYlY1g2dE5nm7vHsMD86eVvOHhNeUo8jE4TgO4a3B6tNMw3RDLgFA>
    <xme:QDYlY6BPZIGkv0cm6Rgz-jm_FFKUCgVpUkURQmbQu9Ofa0HpkadGCVP0Lgb3zCHTy
    kPQTH9ifldyug>
X-ME-Received: <xmr:QDYlY1H_H1ZyZN_m3cg1KAOT2u4TBhUSuZ7QbKlOOSQFq45Q07S32k3RXHZsnCdZdJmfq7fCRvpyt_A0db1cIz03ORmT4ft493FyRu922hcIa_UOFms9yQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QDYlY6TnkUzeA3YzWEwJPT863ihc-2jxbW70tfWWC5Kx4nJoK2G3ng>
    <xmx:QDYlYyy9sK_QQQO_pTNILjfEeiQtXFPfQ_N5yyxEUsCh5_-0SITDoA>
    <xmx:QDYlYw6wrKWtKbw9WVXmnROF2nlI0x4Ryy83euAxmhyZbe2S5jzXEw>
    <xmx:QDYlY5oHmrkZv3TWptluNEnBmmRO4AXrQaS03H45InSitArS2Fz_2w>
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
Subject: [PATCH v7 01/11] drivers/char: allow using both dbgp=xhci and dbgp=ehci
Date: Sat, 17 Sep 2022 04:51:20 +0200
Message-Id: <4586e8d0ce166d6ff47ee9cba7f0ef7831a19a87.1663383053.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows configuring EHCI and XHCI consoles separately,
simultaneously.

This changes string_param() to custom_param() in both ehci and xhci
drivers. Both drivers parse only values applicable to them.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v7:
- restore memset in xhci_parse_dbgp()
Changes in v6:
 - keep dbgp=xhci, but use custom_param() to parse multiple values
   separately
 - modify ehci-dbgp to use custom_param() too
 - change console=dbc to console=xhci, as 'dbc' doesn't appear in any
   other option anymore
 - update comment in serial.h
new in v5
---
 docs/misc/xen-command-line.pandoc |  6 ++++--
 xen/drivers/char/ehci-dbgp.c      | 14 ++++++++++++--
 xen/drivers/char/serial.c         |  6 ++++++
 xen/drivers/char/xhci-dbc.c       | 27 +++++++++++++++++++--------
 xen/include/xen/serial.h          |  3 ++-
 5 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9a79385a3712..c8b07042f58e 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -409,7 +409,7 @@ The following are examples of correct specifications:
 Specify the size of the console ring buffer.
 
 ### console
-> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | none ]`
+> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | xhci | none ]`
 
 > Default: `console=com1,vga`
 
@@ -428,7 +428,9 @@ cleared.  This allows a single port to be shared by two subsystems
 `pv` indicates that Xen should use Xen's PV console. This option is
 only available when used together with `pv-in-pvh`.
 
-`dbgp` indicates that Xen should use a USB debug port.
+`dbgp` indicates that Xen should use a USB2 debug port.
+
+`xhci` indicates that Xen should use a USB3 debug port.
 
 `none` indicates that Xen should not use a console.  This option only
 makes sense on its own.
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 92c588ec0aa3..8a0b95850609 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1464,7 +1464,17 @@ static struct uart_driver __read_mostly ehci_dbgp_driver = {
 static struct ehci_dbgp ehci_dbgp = { .state = dbgp_unsafe, .phys_port = 1 };
 
 static char __initdata opt_dbgp[30];
-string_param("dbgp", opt_dbgp);
+
+static int __init parse_ehci_dbgp(const char *opt)
+{
+    if ( strncmp(opt, "ehci", 4) )
+        return 0;
+
+    strlcpy(opt_dbgp, opt, sizeof(opt_dbgp));
+
+    return 0;
+}
+custom_param("dbgp", parse_ehci_dbgp);
 
 void __init ehci_dbgp_init(void)
 {
@@ -1472,7 +1482,7 @@ void __init ehci_dbgp_init(void)
     u32 debug_port, offset, bar_val;
     const char *e;
 
-    if ( strncmp(opt_dbgp, "ehci", 4) )
+    if ( !opt_dbgp[0] )
         return;
 
     if ( isdigit(opt_dbgp[4]) || !opt_dbgp[4] )
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 47899222cef8..9d9445039232 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -311,6 +311,12 @@ int __init serial_parse_handle(const char *conf)
         goto common;
     }
 
+    if ( !strncmp(conf, "xhci", 4) && (!conf[4] || conf[4] == ',') )
+    {
+        handle = SERHND_XHCI;
+        goto common;
+    }
+
     if ( !strncmp(conf, "dtuart", 6) )
     {
         handle = SERHND_DTUART;
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index ca7d4a62139e..4712faaabef7 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -245,6 +245,7 @@ struct dbc {
     uint64_t xhc_dbc_offset;
     void __iomem *xhc_mmio;
 
+    bool enable; /* whether dbgp=xhci was set at all */
     bool open;
     unsigned int xhc_num; /* look for n-th xhc */
 };
@@ -1058,18 +1059,14 @@ static struct xhci_dbc_ctx ctx __aligned(16);
 static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
 static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
 
-static char __initdata opt_dbgp[30];
-
-string_param("dbgp", opt_dbgp);
-
-void __init xhci_dbc_uart_init(void)
+static int __init xhci_parse_dbgp(const char *opt_dbgp)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
     const char *e;
 
     if ( strncmp(opt_dbgp, "xhci", 4) )
-        return;
+        return 0;
 
     memset(dbc, 0, sizeof(*dbc));
 
@@ -1087,12 +1084,26 @@ void __init xhci_dbc_uart_init(void)
             printk(XENLOG_ERR
                    "Invalid dbgp= PCI device spec: '%s'\n",
                    opt_dbgp + 8);
-            return;
+            return -EINVAL;
         }
 
         dbc->sbdf = PCI_SBDF(0, bus, slot, func);
     }
 
+    dbc->enable = true;
+
+    return 0;
+}
+custom_param("dbgp", xhci_parse_dbgp);
+
+void __init xhci_dbc_uart_init(void)
+{
+    struct dbc_uart *uart = &dbc_uart;
+    struct dbc *dbc = &uart->dbc;
+
+    if ( !dbc->enable )
+        return;
+
     dbc->dbc_ctx = &ctx;
     dbc->dbc_erst = &erst;
     dbc->dbc_ering.trb = evt_trb;
@@ -1102,7 +1113,7 @@ void __init xhci_dbc_uart_init(void)
     dbc->dbc_str = str_buf;
 
     if ( dbc_open(dbc) )
-        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
+        serial_register_uart(SERHND_XHCI, &dbc_uart_driver, &dbc_uart);
 }
 
 #ifdef DBC_DEBUG
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 4cd4ae5e6f1c..f0aff7ea7661 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -91,10 +91,11 @@ struct uart_driver {
 };
 
 /* 'Serial handles' are composed from the following fields. */
-#define SERHND_IDX      (3<<0) /* COM1, COM2, DBGP, DTUART?               */
+#define SERHND_IDX      (3<<0) /* COM1, COM2, DBGP, XHCI, DTUART?         */
 # define SERHND_COM1    (0<<0)
 # define SERHND_COM2    (1<<0)
 # define SERHND_DBGP    (2<<0)
+# define SERHND_XHCI    (3<<0)
 # define SERHND_DTUART  (0<<0) /* Steal SERHND_COM1 value */
 #define SERHND_HI       (1<<2) /* Mux/demux each transferred char by MSB. */
 #define SERHND_LO       (1<<3) /* Ditto, except that the MSB is cleared.  */
-- 
git-series 0.9.1

