Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38053E034
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342169.567288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3br-0007q3-78; Mon, 06 Jun 2022 03:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342169.567288; Mon, 06 Jun 2022 03:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3br-0007my-0k; Mon, 06 Jun 2022 03:40:55 +0000
Received: by outflank-mailman (input) for mailman id 342169;
 Mon, 06 Jun 2022 03:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bo-0006AI-Cz
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:52 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75cd1f4c-e54a-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 05:40:51 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A9F915C0061;
 Sun,  5 Jun 2022 23:40:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 05 Jun 2022 23:40:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:49 -0400 (EDT)
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
X-Inumbo-ID: 75cd1f4c-e54a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486850; x=1654573250; bh=NGSmc+qtu3
	4gNopUlqM1N80pu5ni6kp1Nm5hYXfdT1w=; b=Obd1H0trnpDacJCfnGwuE/Lj6D
	EmLq6/S6pIRz3axGfWdZnP+tDN4tAzEKqIqHscd/W5lVhquhNznD5zEuXZDeXpgL
	S6053qeQOVeb5UvTeU14L580mcICg7iOr2y0ywJgNZTY0yyLBUunNmMzA8xyZSG3
	kwJVS3RThqtGzvv+w3X6OeottG634ba6EIFh786yxpAoF2r20GWXwayqzXWB0/ZX
	qVGJIRHaAGHiO1y4tOfrh0AanE318hQhh50N+YVfRTBAhkg91hvjgVDzdLRw2oSL
	uM9j6im+VKEU5oElR+2kwvsxN3msYLNiyoMZHZzutroWb0DNAG0L836YTcTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486850; x=
	1654573250; bh=NGSmc+qtu34gNopUlqM1N80pu5ni6kp1Nm5hYXfdT1w=; b=o
	Io98yxeiOq1ZwOguKQVHDO1642SzCGnhJixkSIWE/vl+ZbS6QKvS5KXDBtrt/GUO
	ES/GHkLjFIsAsGS9SgsOzx2gFgPaDYEUXMCppUkRPCcCdRewm/McHnebkq639kD2
	1mjeBlFknfVPJCJHcTkjLIbekbbRA2EbFmRkntW8pCPXRbgK4bMo2+baxogab5PV
	inozapL7dcNZIAjygrL++fMti6vjMgy7oSIXXGnZpI5+JXPSoWGa2R0CmSwgyCU6
	a/vUOOKo8d8Akqzd1McgWkGE9XDfCHNFzJZlCY6gcL8//gTaN5U0Kr0HrZ8+YepR
	UlZndUpqIQHP3K7UxdoIw==
X-ME-Sender: <xms:QnedYgNWyrenokUQzcjqOq2JO8thG-hZJEKZxyL50YXJbhSuQIAGcw>
    <xme:QnedYm9tJzdoErhsj_p8mpub3JBy9Qo-6GYKW70baWrDO0kZ0ZlVfY9-CMKdfO5mq
    hSyxJIYwiLUtA>
X-ME-Received: <xmr:QnedYnSqzwPCvMhZHKUkz27Rh8PsmxRZglbktIA7MPQLPdGbSAUgx68PWB4rforQic8Dhx2aEWU6_UMDkd27KE02Y0iuYyKwYkgZS6SKyPQlhOekerA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QnedYos3YzL632hKDmOXeoSq2RxWfRq3JJW74JsXFFcJ5JCROrxwHg>
    <xmx:QnedYodMjZKEWId34cAI5gKqZ4jU7TG4EOzIj6Ig3FLYJcCCvzOkiQ>
    <xmx:QnedYs17RXiy3SU3_1eEh6s3Hwwrtsm0Y1_tW6eKVihcOF_P-5zqVA>
    <xmx:QnedYtECHspf_yPAOESfN4hb0qyRGdWkPthvgYkDqAtAH4KcM3BBMw>
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
Subject: [RFC PATCH 06/12] console: support multiple serial console simultaneously
Date: Mon,  6 Jun 2022 05:40:18 +0200
Message-Id: <0762fece2dc26ff926d92840e64ce30167cd3260.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previously only one serial console was supported at the same time. Using
console=com1,dbgp,vga silently ignored all but last serial console (in
this case: only dbgp and vga were active).

Fix this by storing not a single sercon_handle, but an array of them, up
to MAX_SERCONS entries. The value of MAX_SERCONS (4) is arbitrary,
inspired by the number of SERHND_IDX values.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/console.c | 58 ++++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index f9937c5134c0..f576cfdc3b62 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -113,7 +113,9 @@ static char *__read_mostly conring = _conring;
 static uint32_t __read_mostly conring_size = _CONRING_SIZE;
 static uint32_t conringc, conringp;
 
-static int __read_mostly sercon_handle = -1;
+#define MAX_SERCONS 4
+static int __read_mostly sercon_handle[MAX_SERCONS];
+static int __read_mostly nr_sercon_handle = 0;
 
 #ifdef CONFIG_X86
 /* Tristate: 0 disabled, 1 user enabled, -1 default enabled */
@@ -395,9 +397,17 @@ static unsigned int serial_rx_cons, serial_rx_prod;
 
 static void (*serial_steal_fn)(const char *, size_t nr) = early_puts;
 
+/* Redirect any console output to *fn*, if *handle* is configured as a console. */
 int console_steal(int handle, void (*fn)(const char *, size_t nr))
 {
-    if ( (handle == -1) || (handle != sercon_handle) )
+    int i;
+
+    if ( (handle == -1) )
+        return 0;
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        if ( handle == sercon_handle[i] )
+            break;
+    if ( nr_sercon_handle && i == nr_sercon_handle )
         return 0;
 
     if ( serial_steal_fn != NULL )
@@ -415,10 +425,13 @@ void console_giveback(int id)
 
 void console_serial_puts(const char *s, size_t nr)
 {
+    int i;
+
     if ( serial_steal_fn != NULL )
         serial_steal_fn(s, nr);
     else
-        serial_puts(sercon_handle, s, nr);
+        for ( i = 0; i < nr_sercon_handle; i++ )
+            serial_puts(sercon_handle[i], s, nr);
 
     /* Copy all serial output into PV console */
     pv_console_puts(s, nr);
@@ -956,7 +969,7 @@ void guest_printk(const struct domain *d, const char *fmt, ...)
 void __init console_init_preirq(void)
 {
     char *p;
-    int sh;
+    int sh, i;
 
     serial_init_preirq();
 
@@ -977,7 +990,8 @@ void __init console_init_preirq(void)
             continue;
         else if ( (sh = serial_parse_handle(p)) >= 0 )
         {
-            sercon_handle = sh;
+            if ( nr_sercon_handle < MAX_SERCONS )
+                sercon_handle[nr_sercon_handle++] = sh;
             serial_steal_fn = NULL;
         }
         else
@@ -996,7 +1010,8 @@ void __init console_init_preirq(void)
         opt_console_xen = 0;
 #endif
 
-    serial_set_rx_handler(sercon_handle, serial_rx);
+    for ( i = 0; i < nr_sercon_handle; i++ )
+        serial_set_rx_handler(sercon_handle[i], serial_rx);
     pv_console_set_rx_handler(serial_rx);
 
     /* HELLO WORLD --- start-of-day banner text. */
@@ -1014,7 +1029,8 @@ void __init console_init_preirq(void)
 
     if ( opt_sync_console )
     {
-        serial_start_sync(sercon_handle);
+        for ( i = 0; i < nr_sercon_handle; i++ )
+            serial_start_sync(sercon_handle[i]);
         add_taint(TAINT_SYNC_CONSOLE);
         printk("Console output is synchronous.\n");
         warning_add(warning_sync_console);
@@ -1121,13 +1137,19 @@ int __init console_has(const char *device)
 
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
 
@@ -1149,23 +1171,32 @@ void console_unlock_recursive_irqrestore(unsigned long flags)
 
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
 
@@ -1291,7 +1322,8 @@ static int suspend_steal_id;
 
 int console_suspend(void)
 {
-    suspend_steal_id = console_steal(sercon_handle, suspend_steal_fn);
+    if ( nr_sercon_handle )
+        suspend_steal_id = console_steal(sercon_handle[0], suspend_steal_fn);
     serial_suspend();
     return 0;
 }
-- 
git-series 0.9.1

