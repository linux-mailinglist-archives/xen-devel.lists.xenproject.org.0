Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B52AC3521
	for <lists+xen-devel@lfdr.de>; Sun, 25 May 2025 16:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997158.1378172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCDD-00074h-6t; Sun, 25 May 2025 14:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997158.1378172; Sun, 25 May 2025 14:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCDD-00072F-17; Sun, 25 May 2025 14:20:27 +0000
Received: by outflank-mailman (input) for mailman id 997158;
 Sun, 25 May 2025 14:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uJCDA-0006Ah-Os
 for xen-devel@lists.xenproject.org; Sun, 25 May 2025 14:20:24 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 638175e0-3973-11f0-b893-0df219b8e170;
 Sun, 25 May 2025 16:20:20 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B9CF425400CA;
 Sun, 25 May 2025 10:20:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Sun, 25 May 2025 10:20:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 May 2025 10:20:17 -0400 (EDT)
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
X-Inumbo-ID: 638175e0-3973-11f0-b893-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748182819; x=1748269219; bh=8N0UZzKt4D
	QbodDXdvRtwVlKHw5NKvan8QfhJwtoCk8=; b=BhL1n/QeRiZ5LIM3pw/lE4MNPI
	jnNyVsgCW6EOTbt2MYUlrmmicZ0DHbaaY66u0Tn3MULNqBXJQ7ZdxerNg4aoFKto
	7AVB++4Ow+EemU1aLbdkOXf90Zm9A2ONnf2HrrtKe/wwNPr5ruBFtbpTzMVG9xBW
	AL2GLp319pmzi+eqYbDN6kXnMYYDoSSp31gtGfdJCvoH3UA+sVArHJuDBm7Cnffg
	1NKQHXOUPdgv0xI1EjoTslHWNuyKr6lXNlkNd7HNgHVlJ+GE3ps3FkdsVOEAap0A
	VQQLRT6ZyLJbUgOTfZOhZbP7IjZvcoVnBVQnS062uUHVl46niQ2qL7r71wgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748182819; x=
	1748269219; bh=8N0UZzKt4DQbodDXdvRtwVlKHw5NKvan8QfhJwtoCk8=; b=U
	J6bOiBqrsmflyAGrQZRClJtBba3espjZkLKDVsCaIB8dyAhfwDIAyqZVTidk47dV
	XwHNuU3Ych4r/eXVYN9e7Z+/GyPgAeh/HvIHIiNTrwvli+uIu/YfWEqpA8S3FWXa
	W1JjiawMc6IJj6NxOWbaRn6mh91IqZCrCgHcjK/tC4pObbxyjKRwhIsqUSJakS/q
	M+lklnhY6RTixkKJ1ddubGMVO67JYgGPFCBEbBQI66I5RghW6JL9oC2bW/c/KQ+J
	yGr1g47hL2hLsbCyWjVu6J949DJER4yrQavgKkYL9p5Z2IDn3Up0270ej9Nr7FWU
	0Uovp1mdjiPYRHICDMQiQ==
X-ME-Sender: <xms:IyczaHQNRgs3UgO4w5gcxX2N8vdd8K_xCNN0MOOqmSo0BLsEx4ylXg>
    <xme:IyczaIwO0APyT6wOUZWTfevG_tKAn4l0RGPj_Qdpjbotw889xmEGh-J7NLFzuJLs2
    HKNMgyE7Ai6Ig>
X-ME-Received: <xmr:IyczaM1RGFX_VebD-G__PAOexnBI4WBBXb3K2kI2YZfsJBjm3rzh8ZQEkPIR1HYIIBSTydbzWXVSLMTy92NTvEMTOjEx-fZj0GFui5F_FzOUKjXzjdfH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddugeekfeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
    jghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofi
    hskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffeitdegveffteelvdeghffhve
    fghfefkeelheeujeejgedvvdfgffejuedtvdelnecuffhomhgrihhnpehkvghrnhgvlhdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggp
    rhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvg
    hvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghr
    mhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoh
    eprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitg
    hhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehs
    uhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtth
    hopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggs
    vghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IyczaHBuuIhT750_EKALARwzo7yXE-wapjLhV6jdgU94IskmAFZa0g>
    <xmx:IyczaAhqQxUth6GW1BTQqi2_jYbEaMlLw3t-Ls6v2IE_8hvfk26cxQ>
    <xmx:IyczaLrxPc_eTj5hJU4IESGkg6GTjSxR0ikb1_QZ75Neip1gCQpBKA>
    <xmx:IyczaLiZonqZlxROlGYM6eSTI4ZDG5mGpFGXWHsXfM0NgNSlc7FRbw>
    <xmx:IyczaK9qr8jGGG2g-fdzl-FZYp9Ms2LRFrRYlYt7DBsMwWurQ4zKzeAR>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 5/5] console: support multiple serial console simultaneously
Date: Sun, 25 May 2025 16:15:46 +0200
Message-ID: <98ff383ff2ee3dc162b2d12afaea2b3f1406d99e.1748182535.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
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
This was posted before as part of initial xhci console submission, it
reached v6 (but last changes were in v4), but wasn't considered useful
enough to review/ack:
https://lore.kernel.org/xen-devel/Yu0XHUhsebE+WG0g@mail-itl/

Since I needed this feature again, to debug xhci console issue, I'm
including this patch again in the series.

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
index b0eadd2c5d58..052c01f87bfc 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -456,6 +456,9 @@ only available when used together with `pv-in-pvh`.
 `none` indicates that Xen should not use a console.  This option only
 makes sense on its own.
 
+Specifying more than one serial console will increase console latency,
+especially when `sync_console` option is used.
+
 ### console_timestamps
 > `= none | date | datems | boot | raw`
 
@@ -2637,6 +2640,7 @@ Intel SA-00982.  Intel suggest that some workloads will benefit from this.
 
 Flag to force synchronous console output.  Useful for debugging, but
 not suitable for production environments due to incurred overhead.
+If multiple consoles are configured, the incurred overhead is even bigger.
 
 ### tboot (x86)
 > `= 0x<phys_addr>`
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e6e12bb41397..76305fcb4afa 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -96,6 +96,17 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
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
index 12898b684b5e..e306986bfcbc 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -134,7 +134,9 @@ static char *__read_mostly conring = _conring;
 static uint32_t __read_mostly conring_size = _CONRING_SIZE;
 static uint32_t conringc, conringp;
 
-static int __read_mostly sercon_handle = -1;
+#define MAX_SERCONS CONFIG_MAX_SERCONS
+static int __read_mostly sercon_handle[MAX_SERCONS];
+static unsigned int __read_mostly nr_sercon_handle = 0;
 
 #ifdef CONFIG_X86
 /* Tristate: 0 disabled, 1 user enabled, -1 default enabled */
@@ -424,32 +426,61 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 static char serial_rx_ring[SERIAL_RX_SIZE];
 static unsigned int serial_rx_cons, serial_rx_prod;
 
-static void (*serial_steal_fn)(const char *str, size_t nr) = early_puts;
+/* The last entry means "steal from all consoles" */
+static void (*serial_steal_fn[])(const char *str, size_t nr) = {
+    [MAX_SERCONS] = early_puts,
+};
 
+/*
+ * Redirect console *handle* output to *fn*. Use SERHND_STEAL_ALL as *handle* to
+ * redirect all the consoles. 
+ */
 int console_steal(int handle, void (*fn)(const char *str, size_t nr))
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
 }
 
 /*
@@ -1026,6 +1057,7 @@ void __init console_init_preirq(void)
 {
     char *p;
     int sh;
+    unsigned int i;
 
     serial_init_preirq();
 
@@ -1046,8 +1078,12 @@ void __init console_init_preirq(void)
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
@@ -1065,7 +1101,8 @@ void __init console_init_preirq(void)
         opt_console_xen = 0;
 #endif
 
-    serial_set_rx_handler(sercon_handle, serial_rx);
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_set_rx_handler(sercon_handle[i], serial_rx);
     pv_console_set_rx_handler(serial_rx);
 
     /* NB: send conring contents to all enabled physical consoles, if any */
@@ -1084,7 +1121,8 @@ void __init console_init_preirq(void)
 
     if ( opt_sync_console )
     {
-        serial_start_sync(sercon_handle);
+        for ( i = 0; i < nr_sercon_handle; i++ )
+            serial_start_sync(sercon_handle[i]);
         add_taint(TAINT_SYNC_CONSOLE);
         printk("Console output is synchronous.\n");
         warning_add(warning_sync_console);
@@ -1201,13 +1239,19 @@ int __init console_has(const char *device)
 
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
 
@@ -1223,23 +1267,32 @@ void console_unlock_recursive_irqrestore(unsigned long flags)
 
 void console_force_unlock(void)
 {
+    unsigned int i;
+
     watchdog_disable();
     spin_debug_disable();
     rspin_lock_init(&console_lock);
-    serial_force_unlock(sercon_handle);
+    for ( i = 0 ; i < nr_sercon_handle ; i++ )
+        serial_force_unlock(sercon_handle[i]);
     conring_no_notify = true;
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
 
@@ -1362,7 +1415,8 @@ static int suspend_steal_id;
 
 int console_suspend(void)
 {
-    suspend_steal_id = console_steal(sercon_handle, suspend_steal_fn);
+    if ( nr_sercon_handle )
+        suspend_steal_id = console_steal(SERHND_STEAL_ALL, suspend_steal_fn);
     serial_suspend();
     return 0;
 }
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 1ee3df2624fb..31159814d883 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -101,6 +101,7 @@ struct uart_driver {
 #define SERHND_HI       (1<<2) /* Mux/demux each transferred char by MSB. */
 #define SERHND_LO       (1<<3) /* Ditto, except that the MSB is cleared.  */
 #define SERHND_COOKED   (1<<4) /* Newline/carriage-return translation?    */
+#define SERHND_STEAL_ALL 0xff  /* Synthetic handle used in console_steal() */
 
 /* Three-stage initialisation (before/during/after IRQ-subsystem setup). */
 void serial_init_preirq(void);
-- 
git-series 0.9.1

