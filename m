Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70441591833
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386019.621916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7a-0002AD-8C; Sat, 13 Aug 2022 01:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386019.621916; Sat, 13 Aug 2022 01:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7Z-00023H-VR; Sat, 13 Aug 2022 01:39:25 +0000
Received: by outflank-mailman (input) for mailman id 386019;
 Sat, 13 Aug 2022 01:39:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7Y-0000pT-G4
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:24 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1e4604b-1aa8-11ed-bd2e-47488cf2e6aa;
 Sat, 13 Aug 2022 03:39:23 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A24465C00D8;
 Fri, 12 Aug 2022 21:39:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 12 Aug 2022 21:39:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:21 -0400 (EDT)
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
X-Inumbo-ID: c1e4604b-1aa8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660354762; x=1660441162; bh=3vwZO/cHIy
	oLl/Bx95EOgkgvhsPphVoLUtAC3Lmmo20=; b=yn5worH2WLJ0T1xlJShsvUa6xO
	+n0UqbfoFdQnPpimQbgpwAqAs3qUbEmDowsRPnNY6FT0ySdOURdQfH4SPplYaxGW
	JGikB6YQ8t2X5P4mPHc+Wperb4Wq0XC5xrUXWgvCScn4PppMT51ZdT5C0RECf3/s
	FUn1BWoZHCsEmV3e6AsIW7u4KIngvrE2PtRvmHfDGIs7DKE01ng1elFZ/gPDMynZ
	2Ko9EiZ81FFT1lRWqpku1ysAq97i2Nnl+Aeqzv8+YmNalt4ECdfvMD2Qtgcwjv60
	Ztme2G3CuOAGzfo6o1dln6O3J92dDkCFILxtaq69mzdzPZd2GNwsCJSh9h3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660354762; x=
	1660441162; bh=3vwZO/cHIyoLl/Bx95EOgkgvhsPphVoLUtAC3Lmmo20=; b=I
	01NskkBRHJGGIiYHsX7cP3e54I6sm+oqObFw3m67cRacxGxeszC2gaK5wlMema2h
	MpqnTHB9q40TjzvIRuFSN6+JQEu30p48QDANm5RfrWTHxBPcYxjrY6OvnxDh4dox
	OQOrXW9+oSk/miR1jeIXnZl5Y0FCKSYia0NPhSWdfuEpJKqqnWg10JixeWWOqeKg
	Fg13KXGY0zMtPFQ2LF/2EBFyiEzluM60wWq5pDBY75AM1UbDaIWDEAFfqOoX2+/c
	/sjbMNych50zlp0qa1PI0jLWK5zifGrqzRChCy/bfUbQ6pF4DTCY4t4WkbWdkduZ
	/EMY5lzDnJuBXpkPxxFJA==
X-ME-Sender: <xms:ygD3YrRO2sIoGRVxpgW1nM3rUVx9hGjEo-si3IQcDpw8-YXEVRaAMw>
    <xme:ygD3YsxWjwf3fDFMh0H4wvioy0CHsmcJ18777sCljQvegXFzymQOlcv08qT1yvjSM
    EmLTt2YdUWpfg>
X-ME-Received: <xmr:ygD3Yg2Vc-NxaYbTvL02-RAL0dN8c-uB3XbF3kbNa24_IISoIKWkJ7lIVY0bTZ90SZTcYJYRsWM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ygD3YrCQ_6IS0_iylVSqrnZFG9j0UIfzDmSBNEFZtOEofbabxOnujg>
    <xmx:ygD3Ykh_UkF4Jhsdxy62GkP8bS4bW54JSRPGUWwf6R6p1PMEjgUXxA>
    <xmx:ygD3Yvp9wTUVpgWnvWpU-NE8EEsalekVgNubQ5aa-JVgTcVMMk0QiQ>
    <xmx:ygD3YuYikfjfdZ7VhOEdlyoBwkunsfwYXCUsOIdmjofd56a-e0UzEA>
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
Subject: [PATCH v4 05/11] console: support multiple serial console simultaneously
Date: Sat, 13 Aug 2022 03:38:55 +0200
Message-Id: <e750ea9b05c1976a0439277a74ee2b439714a6c1.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
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
Changes in v4:
- use unsigned int for loop counters
- other minor changes
Changes in v3:
- adjust console_steal() for multiple consoles too
- add MAX_SERCONS to kconfig
- add warning about sync_console impact
- add warning if too many consoles are configured
- log issue with PCI spec parsing
---
 docs/misc/xen-command-line.pandoc |  4 +-
 xen/drivers/char/Kconfig          | 11 ++++-
 xen/drivers/char/console.c        | 98 ++++++++++++++++++++++++--------
 xen/include/xen/serial.h          |  1 +-
 4 files changed, 92 insertions(+), 22 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6b1e515bfc8c..163b05886ed6 100644
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
 
@@ -2390,6 +2393,7 @@ vulnerabilities.
 
 Flag to force synchronous console output.  Useful for debugging, but
 not suitable for production environments due to incurred overhead.
+If multiple consoles are configured, the incurred overhead is even bigger.
 
 ### tboot (x86)
 > `= 0x<phys_addr>`
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 06350c387371..7b5ff0c414ec 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -85,6 +85,17 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 16384 (16kiB).
 
+config MAX_SERCONS
+	int "Maximum number of serial consoles active at once"
+	default 4
+	help
+	  Controls how many serial consoles can be active at once. Configuring more
+	  using `console=` parameter will be ignored.
+	  When multiple consoles are configured, overhead of `sync_console` option
+	  is even bigger.
+
+	  Default value is 4.
+
 config XHCI
 	bool "XHCI DbC UART driver"
 	depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e8468c121ad0..60d42284f606 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -113,7 +113,9 @@ static char *__read_mostly conring = _conring;
 static uint32_t __read_mostly conring_size = _CONRING_SIZE;
 static uint32_t conringc, conringp;
 
-static int __read_mostly sercon_handle = -1;
+#define MAX_SERCONS CONFIG_MAX_SERCONS
+static int __read_mostly sercon_handle[MAX_SERCONS];
+static unsigned int __read_mostly nr_sercon_handle = 0;
 
 #ifdef CONFIG_X86
 /* Tristate: 0 disabled, 1 user enabled, -1 default enabled */
@@ -393,32 +395,61 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 static char serial_rx_ring[SERIAL_RX_SIZE];
 static unsigned int serial_rx_cons, serial_rx_prod;
 
-static void (*serial_steal_fn)(const char *, size_t nr) = early_puts;
+/* The last entry means "steal from all consoles" */
+static void (*serial_steal_fn[])(const char *, size_t nr) = {
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
+    unsigned int i;
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
+    unsigned int i;
+
+    if ( serial_steal_fn[MAX_SERCONS] != NULL )
+        serial_steal_fn[MAX_SERCONS](s, nr);
     else
-        serial_puts(sercon_handle, s, nr);
+        for ( i = 0; i < nr_sercon_handle; i++ )
+        {
+            if ( serial_steal_fn[i] != NULL )
+                serial_steal_fn[i](s, nr);
+            else
+                serial_puts(sercon_handle[i], s, nr);
+        }
 
     /* Copy all serial output into PV console */
     pv_console_puts(s, nr);
@@ -957,6 +988,7 @@ void __init console_init_preirq(void)
 {
     char *p;
     int sh;
+    unsigned int i;
 
     serial_init_preirq();
 
@@ -977,8 +1009,12 @@ void __init console_init_preirq(void)
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
@@ -996,7 +1032,8 @@ void __init console_init_preirq(void)
         opt_console_xen = 0;
 #endif
 
-    serial_set_rx_handler(sercon_handle, serial_rx);
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_set_rx_handler(sercon_handle[i], serial_rx);
     pv_console_set_rx_handler(serial_rx);
 
     /* HELLO WORLD --- start-of-day banner text. */
@@ -1014,7 +1051,8 @@ void __init console_init_preirq(void)
 
     if ( opt_sync_console )
     {
-        serial_start_sync(sercon_handle);
+        for ( i = 0; i < nr_sercon_handle; i++ )
+            serial_start_sync(sercon_handle[i]);
         add_taint(TAINT_SYNC_CONSOLE);
         printk("Console output is synchronous.\n");
         warning_add(warning_sync_console);
@@ -1121,13 +1159,19 @@ int __init console_has(const char *device)
 
 void console_start_log_everything(void)
 {
-    serial_start_log_everything(sercon_handle);
+    unsigned int i;
+
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_start_log_everything(sercon_handle[i]);
     atomic_inc(&print_everything);
 }
 
 void console_end_log_everything(void)
 {
-    serial_end_log_everything(sercon_handle);
+    unsigned int i;
+
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_end_log_everything(sercon_handle[i]);
     atomic_dec(&print_everything);
 }
 
@@ -1149,23 +1193,32 @@ void console_unlock_recursive_irqrestore(unsigned long flags)
 
 void console_force_unlock(void)
 {
+    unsigned int i;
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
+    unsigned int i;
+
     atomic_inc(&print_everything);
-    serial_start_sync(sercon_handle);
+    for ( i = 0 ; i < nr_sercon_handle ; i++ )
+        serial_start_sync(sercon_handle[i]);
 }
 
 void console_end_sync(void)
 {
-    serial_end_sync(sercon_handle);
+    unsigned int i;
+
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_end_sync(sercon_handle[i]);
     atomic_dec(&print_everything);
 }
 
@@ -1291,7 +1344,8 @@ static int suspend_steal_id;
 
 int console_suspend(void)
 {
-    suspend_steal_id = console_steal(sercon_handle, suspend_steal_fn);
+    if ( nr_sercon_handle )
+        suspend_steal_id = console_steal(SERHND_STEAL_ALL, suspend_steal_fn);
     serial_suspend();
     return 0;
 }
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 4cd4ae5e6f1c..36ddf062ccad 100644
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

