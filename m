Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1AA59C2B2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391470.629332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9Kx-0003l5-Ec; Mon, 22 Aug 2022 15:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391470.629332; Mon, 22 Aug 2022 15:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9Kx-0003j1-9r; Mon, 22 Aug 2022 15:27:35 +0000
Received: by outflank-mailman (input) for mailman id 391470;
 Mon, 22 Aug 2022 15:27:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9Kv-0003Dm-1x
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:33 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id effe4189-222e-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 17:27:32 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B59603200A3C;
 Mon, 22 Aug 2022 11:27:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 22 Aug 2022 11:27:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:27 -0400 (EDT)
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
X-Inumbo-ID: effe4189-222e-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661182049; x=1661268449; bh=PKFBeEd03f
	Bi/cJsuUHCHAaB+wlrlisP7arcB1aTEUU=; b=LeoqTdmBACcyPXRwPfzGxyl4wK
	XpkS5EIaFaOwl83iyV0RyuWJ3OmEgTx7acnQ0NHbjlShNKLGukWIoXyR/fmAoNl7
	Ql0yCGnkrOWD6uTTLoxg7aP504G6PQv72yI6BfRuIAyLGtDm/CritssWRXTTqxZ6
	2GBbulwk2doL6F4hBrtLEe+TbqapOvJ9m6ivyIjjZXuaOsakO6gZCXY1N4sOxMC+
	nDBgyuZmQN9sHLg0P3ZvZdNx3ueunxmsvzizRpvHBb4KHtCfr2BNPYcwJQU/5DZ/
	okRNlRjA/7l1OB4Pu/8/v86X99pcWS+EcTth7kSXol+ocIldQzHDuCThP70g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661182049; x=
	1661268449; bh=PKFBeEd03fBi/cJsuUHCHAaB+wlrlisP7arcB1aTEUU=; b=x
	BoHA13gJCQwgzaQanMAo8HoUAQcOxLRH9GwMVYob68HfhPnxe+arDGdvsG2Act8j
	unV2QYiX76IBR35nDm18ZqVghlyqMcuGzHAHGA44iSOOSXJOv50d8MQV0qIRt2dN
	65ThL4geysZjA+igENp8KRx2JFYgfU7rdinlECwqd6ZWhn5PvWgnZIbACmjWwmRY
	zX1995IR5sbZm8tdZWdwsHyVfYE02FBMrASfHIKxXuAEYjosdHJThzChcAqYbQKR
	APoiZtFxhddnW1v+z8Xo7fi1MqHN+rZEOSrSXWhNiSbnryf9vlkRpNtNkP+ziR5+
	pQ/SakYbgDmamdHjnMRxA==
X-ME-Sender: <xms:YKADY_ZnTUbmWzhOBmmUsUKjB57auuE516XUQjNRmVrEmMbBKuQ6Hg>
    <xme:YKADY-ZjGu2FD3tn-QSSq_RIC7rg5ARblv_hwsnIum2Glb85dwFseuaypux6Aikvt
    Qfyi_vhtv_hUA>
X-ME-Received: <xmr:YKADYx-FZS0q6SMA3DFD71k5yGb8zmdPu_UFklM1BUFhF00zKh4Bg0-a1sYm8X6IJXgK9CYe9LDz4MLEXCrYL87Hb3vHiSGmjYJu6cSAAabuFzhRHmfi6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:YKADY1r0Smk7rQtIB5s9cr5XI04VVuTajRf2ucxfMGgBaXvffrtYQw>
    <xmx:YKADY6qqrrf-4IRfRM7rsDUntC6qHTAVlBTrpoVaFn1SOjWrsaEjwQ>
    <xmx:YKADY7QCUmSpPDQEAvRa50S6gL_JLpSxN9jPAVy7m1AX4jKQfK3avQ>
    <xmx:YaADY3BWKSsJPBDYyglVuniNE2OtJ79yrHEuT9anmwiJ7AvMkKh7rA>
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
Subject: [PATCH v5 2/9] console: support multiple serial console simultaneously
Date: Mon, 22 Aug 2022 17:27:02 +0200
Message-Id: <d4a5b8d6a612fdc45c96eb3e88396fc1ec299fb3.1661181584.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
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
index 0d07f0c75990..e31300ea3408 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -435,6 +435,9 @@ only available when used together with `pv-in-pvh`.
 `none` indicates that Xen should not use a console.  This option only
 makes sense on its own.
 
+Specifying more than one serial console will increase console latency,
+especially when `sync_console` option is used.
+
 ### console_timestamps
 > `= none | date | datems | boot | raw`
 
@@ -2409,6 +2412,7 @@ vulnerabilities.
 
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
index 186afbed9c92..31c825edb052 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -100,6 +100,7 @@ struct uart_driver {
 #define SERHND_HI       (1<<2) /* Mux/demux each transferred char by MSB. */
 #define SERHND_LO       (1<<3) /* Ditto, except that the MSB is cleared.  */
 #define SERHND_COOKED   (1<<4) /* Newline/carriage-return translation?    */
+#define SERHND_STEAL_ALL 0xff  /* Synthetic handle used in console_steal() */
 
 /* Three-stage initialisation (before/during/after IRQ-subsystem setup). */
 void serial_init_preirq(void);
-- 
git-series 0.9.1

