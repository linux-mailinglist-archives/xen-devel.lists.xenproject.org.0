Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52B9A0119C
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864706.1275966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQk-0005sJ-WB; Sat, 04 Jan 2025 01:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864706.1275966; Sat, 04 Jan 2025 01:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQk-0005mw-LG; Sat, 04 Jan 2025 01:58:22 +0000
Received: by outflank-mailman (input) for mailman id 864706;
 Sat, 04 Jan 2025 01:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQi-0005Ay-CN
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:20 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cc997fe-ca3f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 02:58:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D055A411CA;
 Sat,  4 Jan 2025 01:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D46CC4CEE3;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 34815E77199;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5cc997fe-ca3f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=xXcYmPnyoaBYwuvwmwzq65u8a7zL6rzG/+EY8Xv8xGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AcM7Vtoksl9NuXsBkmaV+MfZOCMRt2zDfmJPK3Gs9ieXp0syisbEcIaH8QlLJrQLB
	 SK0JUVGW11+9hKqDLS/5CnS9gX1lCP7TNMpbehJo5pxrkbCx1f2XwD+X12QgNzweK+
	 Kb0Bv6pRUw5UCFQesSfHU1uyrbXWwfuLw5clv5jqeXIy2xJOBtvkCKQXYBnIWMBFUH
	 v+dwRYvU2VEzOAf76MQFuSxW3ENllWV659LJ2nnv23vaVsVyct31+F9WFpxkQYkwjB
	 N0uaqRTn0UuVjJlMTbLz3BClt0PGRnuixH/tRLyRcau00SCMZHzxykwgSEub+mg/9o
	 nqii0jYMZ8Hog==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:15 -0800
Subject: [PATCH v3 09/24] xen/console: rename console_rx to console_owner
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-9-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=2836;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=hlHBU29TJ6azKlgJxKuwT5okumjd5Gkw0PPbKZ55oxg=;
 b=8gj6SDYe8BztlUQL/hKRBIYVD38Gp7CgTWQrnGT86srkbF/wCLOJPeSHzvZRRElqsEEVQAoxG
 SSRoin1gwJzBzBL2tPOlDVb3Ajj9sx2b2fV9mk90Edf+KMiLPBHdtvO
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Update the symbol name to prepare for the follow on semantic change of console
owner identifier.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 48866cf47beda39e48a7774277238273566382b1..33da5ff7933ea2186245763e07940c17d74bf40f 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -465,19 +465,19 @@ static void cf_check dump_console_ring_key(unsigned char key)
  */
 #define switch_code (opt_conswitch[0]-'a'+1)
 /*
- * console_rx=0 => input to xen
- * console_rx=1 => input to dom0 (or the sole shim domain)
- * console_rx=N => input to dom(N-1)
+ * console_owner=0 => input to xen
+ * console_owner=1 => input to dom0 (or the sole shim domain)
+ * console_owner=N => input to dom(N-1)
  */
-static unsigned int __read_mostly console_rx = 0;
+static unsigned int __read_mostly console_owner = 0;
 
 #define max_console_rx (max_init_domid + 1)
 
 struct domain *console_get_domain(void)
 {
-    if ( console_rx == 0 )
+    if ( console_owner == 0 )
             return NULL;
-    return rcu_lock_domain_by_id(console_rx - 1);
+    return rcu_lock_domain_by_id(console_owner - 1);
 }
 
 void console_put_domain(struct domain *d)
@@ -488,7 +488,7 @@ void console_put_domain(struct domain *d)
 
 static void console_switch_input(void)
 {
-    unsigned int next_rx = console_rx;
+    unsigned int next_rx = console_owner;
 
     /*
      * Rotate among Xen, dom0 and boot-time created domUs while skipping
@@ -501,7 +501,7 @@ static void console_switch_input(void)
 
         if ( next_rx++ >= max_console_rx )
         {
-            console_rx = 0;
+            console_owner = 0;
             printk("*** Serial input to Xen");
             break;
         }
@@ -514,7 +514,7 @@ static void console_switch_input(void)
         if ( d )
         {
             rcu_unlock_domain(d);
-            console_rx = next_rx;
+            console_owner = next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
         }
@@ -531,7 +531,7 @@ static void __serial_rx(char c)
     struct domain *d;
     int rc = 0;
 
-    if ( console_rx == 0 )
+    if ( console_owner == 0 )
         return handle_keypress(c, false);
 
     d = console_get_domain();
@@ -1105,7 +1105,7 @@ void __init console_endboot(void)
      * a useful 'how to switch' message.
      */
     if ( opt_conswitch[1] == 'x' )
-        console_rx = max_console_rx;
+        console_owner = max_console_rx;
 
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", 0);

-- 
2.34.1



