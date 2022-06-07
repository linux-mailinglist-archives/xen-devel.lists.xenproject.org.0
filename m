Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B754016B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343350.568721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEs-0007Sn-Qi; Tue, 07 Jun 2022 14:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343350.568721; Tue, 07 Jun 2022 14:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEs-0007Pg-Kj; Tue, 07 Jun 2022 14:31:22 +0000
Received: by outflank-mailman (input) for mailman id 343350;
 Tue, 07 Jun 2022 14:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEr-000619-3Z
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:21 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ee3f402-e66e-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 16:31:19 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 48AAD5C01ED;
 Tue,  7 Jun 2022 10:31:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 07 Jun 2022 10:31:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:17 -0400 (EDT)
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
X-Inumbo-ID: 7ee3f402-e66e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654612279; x=1654698679; bh=/FmM9IRoHk
	jrJvz5SecKZ+9vnPpot8BHqRtqlD2wsdk=; b=nRmoMLokKnoTQxNYHIVIw6fE1F
	177uy3Ek8M3bRPAGocRhUA91JiD6McUjah+DxUKG2X7wCEDpEIMNJ32lZKHPS4Vt
	sAWqYtZlee9SCdgWHD95BmrNoTfJIxPbm2MEkDAB7jpp1COWYEEqXqoa9oaNpEgx
	XmBvcm5kny8NuTpzHCVYx8xWjyYr8W5f+FyfrijW5gl54Og4K+tQNxCuL51fJEmD
	ELtKV5Q1ZN+p1oLuBNHIWqrDi14khV1cRlGvOk4wu3IOSMhdLVZBzeyBH+BuwzyO
	PX0m30cGtNFk09D/6t9jOlt6Ux7Yod8Bhsd/xBR4ZOcD46A8ks6zdnGXbVYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654612279; x=
	1654698679; bh=/FmM9IRoHkjrJvz5SecKZ+9vnPpot8BHqRtqlD2wsdk=; b=h
	E4byz8dzkMVIukdL40jB1/bCncvD2WvJLvYOfo6DohGP60RT3ZHzKb6kuGVh0OnA
	N81od+R+NH8Kh2A/nO09OFE8Epb/QC1ZdSGxDxgKYRL+tPPXUY5gBbNE+m869MtK
	jZwF9NHZY9Fob/b8MnHjol7yjNnkyUR2RdGtLk85L5z+VSEiJYZwLNSyh3Ois5P+
	RiJOSnk6CWj6/dkL9EmF02IqiloxEvd6DVWkNRcWtjX99yCqyDMXcllrhaNq9gs5
	bYC+SX5uZ+w0vD1ri8brr+eur/JS0RY/OAexZfMvLrf6lL8jhjoC1iw+ZiTLaQoc
	J2uAvzmXGTjs2j28NQvmQ==
X-ME-Sender: <xms:N2GfYhxX9sKRAy1N9bhVop8Rv4lE1USK_3bdIgSS_mrFlXgdzxqd9Q>
    <xme:N2GfYhRb7DL-phmy-tFyJAFRCQ5rqXeilIjVE7MxJXjyhwH1wWO4oBMT_u6l_pTiv
    0AEtIIKX7QcsA>
X-ME-Received: <xmr:N2GfYrUXR04OfikY8ouYlYwRx3rk6WD9nJ8rGQmNgURFmzpHGUBiu_ByrhoJsa-wk9N9AfndC5kVOib8yAznlXV3VGazaOJHX3H1PKZRDUlTc4vzro0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:N2GfYjgiUUmIVUW7-J8DsqxqqzkR8QqW1SntlxzZwaFEX5tkSL74kw>
    <xmx:N2GfYjCmLXTSOfR3se0zmOoY0q8c0iL2ZMoTyKuEQJuiU_zqxiuipQ>
    <xmx:N2GfYsJ-5c-fsc8lFmtPk3U8kd7YgCPdcALExN8Fglrn1ZAjiNAJew>
    <xmx:N2GfYu59LKrKUUt9kZLRjQljwmbBEt2nOY9YC0Gz80R_wiZ9AydBYA>
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
Subject: [PATCH v1 05/10] console: support multiple serial console simultaneously
Date: Tue,  7 Jun 2022 16:30:11 +0200
Message-Id: <e13ee6e75e41da9468c3c38a18ec265879985976.1654612169.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
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
index f9937c5134c0..44b703296487 100644
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
+    if ( handle == -1 )
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

