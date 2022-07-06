Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6585568CE5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362335.592367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971O-0000gV-UV; Wed, 06 Jul 2022 15:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362335.592367; Wed, 06 Jul 2022 15:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971O-0000e4-NE; Wed, 06 Jul 2022 15:32:58 +0000
Received: by outflank-mailman (input) for mailman id 362335;
 Wed, 06 Jul 2022 15:32:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWdV=XL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o971N-00081g-G8
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:32:57 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e86c1d32-fd40-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 17:32:56 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E7E865C013E;
 Wed,  6 Jul 2022 11:32:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 06 Jul 2022 11:32:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 11:32:54 -0400 (EDT)
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
X-Inumbo-ID: e86c1d32-fd40-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1657121575; x=1657207975; bh=/FmM9IRoHk
	jrJvz5SecKZ+9vnPpot8BHqRtqlD2wsdk=; b=TeSF8TQIHWZN5u8l7NlLQgmrM2
	392VbjOuH3mKRqIp+KAzyPGq9YLgnpYQnIHQH0lzWrTp/kaCYeGzQjErBJWeo3tb
	MvJ+PLtttNzAuaScAuxBJFVnhq8ARuJRPzCTjpoda3gvSOUyz5kPLp3u9PMrRYiE
	4Rbyna0jKb5qkWFntG+XleLPi8YfBW8SMrI8sTjk4jp/3vfxBgWQgQxq+T7+17MH
	oogqlRW0aOSO4qwhNLCcFLYZtMyPMVHy8687y0RyHpJmw4VGzxLv6VC1CgBad4V1
	WrF8+c9rvESv1gtgD7V+tDZYtqTUsBxw+gKshhdqIdhOegoMfGTsARQNGH7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657121575; x=
	1657207975; bh=/FmM9IRoHkjrJvz5SecKZ+9vnPpot8BHqRtqlD2wsdk=; b=v
	EBaxY41fGsJy42QkRx73YdFsYVw5q+FrdmcA8VDmYJrIVSqdhCONLT+l/sDgqjH7
	sh11/yOHyqz85xdsmLAYB+CIlH67DFeSAvg7/3DeQyhmKJ8kIf/wf5GKjojrZZEq
	exuLtgrja6lWXvNf5ls0ALlDdlTN7e8llWpdlSvhFXCdSpiiY2WqyDNpdzPdOH4P
	6vSynGaBwV8ityhz8IwgyNp/oUAnkruP0hXhiVRMNmqiEsF0voxcbPpfj/0095tb
	PEJ06OjS9HQCbcUsAY8QPymD7rXRBNNCNdSSeOQEngQ1W/juEQQIDlPtpvd4d+Hn
	SrMlgoqmUxD7QNoWrlc4Q==
X-ME-Sender: <xms:J6vFYhS4ZQ0rWG4_VMYvNUa4t8Sofserwy-xH9C6FeMnrqbUQMLeKQ>
    <xme:J6vFYqx0F2otUqFGIxI8IoIeQWBNdWf89vCy94FAcqSutAof3y1Jo_xYrJhwWjRf_
    QrOpDETeWT_oQ>
X-ME-Received: <xmr:J6vFYm2Nv-wVdQGDV4DcyPMQBsMyhmR-8I4Yp6JSYQSvoKGKIHPURM_uACBIG4axWA5a41hF9WDNKXifE5TUS-xvLaa3xXz8nN8knkgnckncdhunrbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:J6vFYpCR_hFVLnGJA3bKqqzAuR2NIU0iPXwqsHTcy6wzbIZstToaZw>
    <xmx:J6vFYqgeL63uCdqQll79-NFDJPhsB87Z4zCooItTYkImS19UOFW9kQ>
    <xmx:J6vFYtqZYYZe501W9p9UEtWNiYORe_Zsm9BNxRUQhXFegx58hO_rpA>
    <xmx:J6vFYsZNFplBzCo9readqVwBYvqK7bpcyUlHx6R2plx4sZAXlq296g>
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
Subject: [PATCH v2 4/9] console: support multiple serial console simultaneously
Date: Wed,  6 Jul 2022 17:32:09 +0200
Message-Id: <e40a6de7f032c776e889e4ca6d68579fbb3ad57a.1657121519.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
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

