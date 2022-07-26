Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5F65809EB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374938.607189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAX-0004KG-BD; Tue, 26 Jul 2022 03:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374938.607189; Tue, 26 Jul 2022 03:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAX-0004Fq-4s; Tue, 26 Jul 2022 03:23:37 +0000
Received: by outflank-mailman (input) for mailman id 374938;
 Tue, 26 Jul 2022 03:23:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGBAW-000459-BF
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:23:36 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54a90892-0c92-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 05:23:34 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 38A6F5C00C4;
 Mon, 25 Jul 2022 23:23:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 25 Jul 2022 23:23:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:23:32 -0400 (EDT)
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
X-Inumbo-ID: 54a90892-0c92-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658805814; x=1658892214; bh=hSsEZHy6kJ
	LcmqWZuPa/umq2lr+G/hdZU1gW2QDjIRI=; b=hIFn0DIgOSL3dauKE5PXTJegSt
	GlpZO47OaT7GxSTdX0cGtkv2FrVfxKey4WVaAAOY4bGZ39yt4fH1TLVjRkKXNnCx
	XoMAhkufI4fVrw6vdwug8YOoWm/cuVdKLHtN1iHHqW9MHr6t8CeRYH9nVoMfd6s8
	V7TiIS8GepYCkUUQLA+voybRNnIBcAQuy46XpPh9UA4HsJjmeJpiT8eu10PO+FeP
	6n9OtNVi2N3FcgY42baDW0rWAXngKInIF2Z/eJDpnRQS9azDFC7z2L5DaQNFyIa/
	sRqHJWx7RiqKZt8tJdUY7lSm8ujXgzZJMf2mocgzZLZAImRoKDUkFN5+r9+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658805814; x=
	1658892214; bh=hSsEZHy6kJLcmqWZuPa/umq2lr+G/hdZU1gW2QDjIRI=; b=O
	rxHoquYpjEzNSsjsYn2n1ZBx9j6TSD60CNrjkV9STnEzNXC98XoDNZHvyNmO2TB2
	+dQWEg57TvAtL4ughDcqq3R/EOnK8ZNSPZcV9l42T5bbl9kpx9PjuiS9CDn8fbzE
	u+NDcA2nZgoWJOAhf6+oZL2T0n4FeGx9rfK1ULygvPrOUPOF9P39D2/zYNuaA0W1
	FfdtVDSYDZ/+rf2OzEkLaXRp3k/aXN5xyGuLY/2UcqBgxjZs1neE0lTlWBMP1VBm
	FoP1zBXGihE5b0mKtbAii0zaNXzcUXw4Ob01p0q3xzvhyVtN/pxGIhn4tDZhjFD6
	MRDRbGGY5Pmgpf3C3o2Nw==
X-ME-Sender: <xms:Nl7fYicOLaUww88pyOBKRaEG6_MrzaV1kxK_v1pEopYiG6_MLet0PA>
    <xme:Nl7fYsMs0PRdedLenV1W6Rc8zWyE-fGF5BczETK8DdBIusk-cP4PiShr2T9o8Npff
    OA4Xv69ZHjEkg>
X-ME-Received: <xmr:Nl7fYjiZ_pkYAvfGWrQ5_osjkLcuTlFGavtNUv1_gNxb-NqdVrEjHEa1OOoJMW827lFN8mAYZqrL9ZMR6nRiXUjYUpFzF9gYkMJMAGhzArO4UPg7e6mlkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Nl7fYv_4kmMv25lYyCGeWDJ0NqHQQt12cKn1vjznuC6Hh_D7UgyL7A>
    <xmx:Nl7fYuvioFpLSduMFpFLicVmNLrhU4C1MNcBsUZVtC5BZu0nhKtRxA>
    <xmx:Nl7fYmFc6p3JvsIlMf_SuuIkh9KPT_upCqxGL8YYMFMY1mKaHz0fWA>
    <xmx:Nl7fYgVK0LI_Mjcw_pmRRBlIOybaw_WRcK5d6mNmrp5IuMlykyM6OA>
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
Subject: [PATCH v3 04/10] console: support multiple serial console simultaneously
Date: Tue, 26 Jul 2022 05:23:09 +0200
Message-Id: <14411aa674b61d22d9626a3455206454793b6a37.1658804819.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previously only one serial console was supported at the same time. Using
console=com1,dbgp,vga silently ignored all but last serial console (in
this case: only dbgp and vga were active).

Fix this by storing not a single sercon_handle, but an array of them, up
to MAX_SERCONS entries. The value of MAX_SERCONS can be chosen in
kconfig, the default (4) is arbitrary, inspired by the number of
SERHND_IDX values.

Make console_steal() aware of multiple consoles too. It can now either
steal output from specific console (for gdbstub), or from all of them at
once (for console suspend).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- adjust console_steal() for multiple consoles too
- add MAX_SERCONS to kconfig
- add warning about sync_console impact
- add warning if too many consoles are configured
- log issue with PCI spec parsing
---
 docs/misc/xen-command-line.pandoc |  4 +-
 xen/drivers/char/Kconfig          | 11 ++++-
 xen/drivers/char/console.c        | 97 ++++++++++++++++++++++++--------
 xen/drivers/char/xhci-dbc.c       |  6 +-
 xen/include/xen/serial.h          |  1 +-
 5 files changed, 95 insertions(+), 24 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index d594bd5c7436..e53efdb324b3 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -433,6 +433,9 @@ only available when used together with `pv-in-pvh`.
 `none` indicates that Xen should not use a console.  This option only
 makes sense on its own.
 
+Specifying more than one serial console will increase console latency,
+especially when `sync_console` option is used.
+
 ### console_timestamps
 > `= none | date | datems | boot | raw`
 
@@ -2372,6 +2375,7 @@ vulnerabilities.
 
 Flag to force synchronous console output.  Useful for debugging, but
 not suitable for production environments due to incurred overhead.
+If multiple consoles are configured, the incurred overhead is even bigger.
 
 ### tboot (x86)
 > `= 0x<phys_addr>`
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 06350c387371..1010436d245c 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -85,6 +85,17 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 16384 (16kiB).
 
+config MAX_SERCONS
+	int "Maximum number of serial consoles active at once"
+	default 4
+	help
+      Controls how many serial consoles can be active at once. Configuring more
+      using `console=` parameter will be ignored.
+      When multiple consoles are configured, overhead of `sync_console` option
+      is even bigger.
+
+	  Default value is 4.
+
 config XHCI
 	bool "XHCI DbC UART driver"
 	depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index f9937c5134c0..2ffc919445c6 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -113,7 +113,9 @@ static char *__read_mostly conring = _conring;
 static uint32_t __read_mostly conring_size = _CONRING_SIZE;
 static uint32_t conringc, conringp;
 
-static int __read_mostly sercon_handle = -1;
+#define MAX_SERCONS CONFIG_MAX_SERCONS
+static int __read_mostly sercon_handle[MAX_SERCONS];
+static int __read_mostly nr_sercon_handle = 0;
 
 #ifdef CONFIG_X86
 /* Tristate: 0 disabled, 1 user enabled, -1 default enabled */
@@ -393,32 +395,59 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 static char serial_rx_ring[SERIAL_RX_SIZE];
 static unsigned int serial_rx_cons, serial_rx_prod;
 
-static void (*serial_steal_fn)(const char *, size_t nr) = early_puts;
+/* The last entry means "steal from all consoles" */
+static void (*serial_steal_fn[MAX_SERCONS+1])(const char *, size_t nr) = {
+    [MAX_SERCONS] = early_puts,
+};
 
+/*
+ * Redirect console *handle* output to *fn*. Use SERHND_STEAL_ALL as *handle* to
+ * redirect all the consoles. 
+ */
 int console_steal(int handle, void (*fn)(const char *, size_t nr))
 {
-    if ( (handle == -1) || (handle != sercon_handle) )
-        return 0;
+    int i;
+
+    if ( handle == -1 )
+        return -ENOENT;
+    if ( serial_steal_fn[MAX_SERCONS] != NULL )
+        return -EBUSY;
+    if ( handle == SERHND_STEAL_ALL )
+    {
+        serial_steal_fn[MAX_SERCONS] = fn;
+        return MAX_SERCONS;
+    }
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        if ( handle == sercon_handle[i] )
+            break;
+    if ( i == nr_sercon_handle )
+        return -ENOENT;
 
-    if ( serial_steal_fn != NULL )
+    if ( serial_steal_fn[i] != NULL )
         return -EBUSY;
 
-    serial_steal_fn = fn;
-    return 1;
+    serial_steal_fn[i] = fn;
+    return i;
 }
 
 void console_giveback(int id)
 {
-    if ( id == 1 )
-        serial_steal_fn = NULL;
+    if ( id >= 0 && id <= MAX_SERCONS )
+        serial_steal_fn[id] = NULL;
 }
 
 void console_serial_puts(const char *s, size_t nr)
 {
-    if ( serial_steal_fn != NULL )
-        serial_steal_fn(s, nr);
+    int i;
+
+    if ( serial_steal_fn[MAX_SERCONS] != NULL )
+        serial_steal_fn[MAX_SERCONS](s, nr);
     else
-        serial_puts(sercon_handle, s, nr);
+        for ( i = 0; i < nr_sercon_handle; i++ )
+            if ( serial_steal_fn[i] != NULL )
+                serial_steal_fn[i](s, nr);
+            else
+                serial_puts(sercon_handle[i], s, nr);
 
     /* Copy all serial output into PV console */
     pv_console_puts(s, nr);
@@ -956,7 +985,7 @@ void guest_printk(const struct domain *d, const char *fmt, ...)
 void __init console_init_preirq(void)
 {
     char *p;
-    int sh;
+    int sh, i;
 
     serial_init_preirq();
 
@@ -977,8 +1006,12 @@ void __init console_init_preirq(void)
             continue;
         else if ( (sh = serial_parse_handle(p)) >= 0 )
         {
-            sercon_handle = sh;
-            serial_steal_fn = NULL;
+            if ( nr_sercon_handle < MAX_SERCONS )
+                sercon_handle[nr_sercon_handle++] = sh;
+            else
+                printk("Too many consoles (max %d), ignoring '%s'\n",
+                       MAX_SERCONS, p);
+            serial_steal_fn[MAX_SERCONS] = NULL;
         }
         else
         {
@@ -996,7 +1029,8 @@ void __init console_init_preirq(void)
         opt_console_xen = 0;
 #endif
 
-    serial_set_rx_handler(sercon_handle, serial_rx);
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_set_rx_handler(sercon_handle[i], serial_rx);
     pv_console_set_rx_handler(serial_rx);
 
     /* HELLO WORLD --- start-of-day banner text. */
@@ -1014,7 +1048,8 @@ void __init console_init_preirq(void)
 
     if ( opt_sync_console )
     {
-        serial_start_sync(sercon_handle);
+        for ( i = 0; i < nr_sercon_handle; i++ )
+            serial_start_sync(sercon_handle[i]);
         add_taint(TAINT_SYNC_CONSOLE);
         printk("Console output is synchronous.\n");
         warning_add(warning_sync_console);
@@ -1121,13 +1156,19 @@ int __init console_has(const char *device)
 
 void console_start_log_everything(void)
 {
-    serial_start_log_everything(sercon_handle);
+    int i;
+
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_start_log_everything(sercon_handle[i]);
     atomic_inc(&print_everything);
 }
 
 void console_end_log_everything(void)
 {
-    serial_end_log_everything(sercon_handle);
+    int i;
+
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_end_log_everything(sercon_handle[i]);
     atomic_dec(&print_everything);
 }
 
@@ -1149,23 +1190,32 @@ void console_unlock_recursive_irqrestore(unsigned long flags)
 
 void console_force_unlock(void)
 {
+    int i;
+
     watchdog_disable();
     spin_debug_disable();
     spin_lock_init(&console_lock);
-    serial_force_unlock(sercon_handle);
+    for ( i = 0 ; i < nr_sercon_handle ; i++ )
+        serial_force_unlock(sercon_handle[i]);
     console_locks_busted = 1;
     console_start_sync();
 }
 
 void console_start_sync(void)
 {
+    int i;
+
     atomic_inc(&print_everything);
-    serial_start_sync(sercon_handle);
+    for ( i = 0 ; i < nr_sercon_handle ; i++ )
+        serial_start_sync(sercon_handle[i]);
 }
 
 void console_end_sync(void)
 {
-    serial_end_sync(sercon_handle);
+    int i;
+
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_end_sync(sercon_handle[i]);
     atomic_dec(&print_everything);
 }
 
@@ -1291,7 +1341,8 @@ static int suspend_steal_id;
 
 int console_suspend(void)
 {
-    suspend_steal_id = console_steal(sercon_handle, suspend_steal_fn);
+    if ( nr_sercon_handle )
+        suspend_steal_id = console_steal(SERHND_STEAL_ALL, suspend_steal_fn);
     serial_suspend();
     return 0;
 }
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 11026d3b71f0..14a2d3eb0ee2 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1078,8 +1078,12 @@ void __init xhci_dbc_uart_init(void)
 
         e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
         if ( !e || *e )
+        {
+            printk(XENLOG_ERR
+                   "Invalid dbgp= PCI device spec: '%s'\n",
+                   opt_dbgp);
             return;
-
+        }
         dbc->sbdf = PCI_SBDF(0, bus, slot, func);
     }
 
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 181e026967bc..c3bca000e238 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -99,6 +99,7 @@ struct uart_driver {
 #define SERHND_HI       (1<<2) /* Mux/demux each transferred char by MSB. */
 #define SERHND_LO       (1<<3) /* Ditto, except that the MSB is cleared.  */
 #define SERHND_COOKED   (1<<4) /* Newline/carriage-return translation?    */
+#define SERHND_STEAL_ALL 0xff  /* Synthetic handle used in console_steal() */
 
 /* Three-stage initialisation (before/during/after IRQ-subsystem setup). */
 void serial_init_preirq(void);
-- 
git-series 0.9.1

