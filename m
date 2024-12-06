Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A429E6696
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 06:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849774.1264348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQT6-0002ew-Uo; Fri, 06 Dec 2024 05:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849774.1264348; Fri, 06 Dec 2024 05:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQT6-0002cg-RR; Fri, 06 Dec 2024 05:01:32 +0000
Received: by outflank-mailman (input) for mailman id 849774;
 Fri, 06 Dec 2024 05:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA5-0004Ka-N8
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63c4dfa4-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 21D635C731C;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B770CC4CEE4;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id ADBAEE77175;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
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
X-Inumbo-ID: 63c4dfa4-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=xN3Qk4AnkavJDz1+2oRzOsxhatlUANXuldhRbnVqaL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WuYwP5N6FRVi49Tvc8z9O/76ioaUpi/FZQBJuMRGDB+GTX2VceyVOCu8rPyGBR9BJ
	 Oc6LrY1JRMML+ctUVgOXz6zrZlPrbcvalDD+qBZGcAGzG/2luW3je+hPqXh2k02o2z
	 YQ7HuB/3Ww2fsvyjPNmOm++JScVRUe0EUm5VJoRK7WZVH45B66YCLescgZHWO+B0ph
	 f1aA8/e1LbT9z1wYmvG0kem2XXv9tpqFZ8J0KYmh8KtFUav8gHDOvgTkvtjsuMaduG
	 5BlvCSCLrHlqbO+6whey6fmCI1ci/YwN9wpp6ZFAzGacJHjCscL0md3noT+4DXQVNC
	 fmeyoSd8P6+lQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:51 -0800
Subject: [PATCH v2 21/35] xen/console: introduce console_init_owner()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-21-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=1949;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=9IHMF1BdeViUoT1r1xwy88EM2J39hJxCdMpf6FUj+oc=;
 b=rkPuVSjKM6PdcjQpqYx04yf5XSLLo6WwLxCVOm3Xp526geyD7FoALVxOn/SqrCa9cjSfLb+QZ
 qW8+QGL4+VvD3kA/ow2AsW8esC9XvQRMDoI/h0TfmZ1MW76KHXfU+fc
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

console_init_owner() is introduced for selecting the boot-time console owner.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a8ab5c2bcb98e4cadf9ad2c9ad28d297977d0557..6261bdb5a2ac1075bc89fa408c0fd6cfef380ae6 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -554,6 +554,22 @@ static void console_find_owner(void)
         console_set_owner(DOMID_XEN);
 }
 
+static void console_init_owner(void)
+{
+    domid_t domid;
+
+    /*
+     * If user specifies so, we fool the switch routine to redirect input
+     * straight back to Xen.
+     */
+    if ( opt_conswitch[1] == 'x' )
+        domid = DOMID_XEN;
+    else
+        domid = get_initial_domain_id();
+
+    console_set_owner(domid);
+}
+
 static void __serial_rx(char c)
 {
     switch ( console_owner )
@@ -1143,14 +1159,6 @@ void __init console_endboot(void)
 
     video_endboot();
 
-    /*
-     * If user specifies so, we fool the switch routine to redirect input
-     * straight back to Xen. I use this convoluted method so we still print
-     * a useful 'how to switch' message.
-     */
-    if ( opt_conswitch[1] == 'x' )
-        console_owner = DOMID_XEN;
-
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", 0);
     register_irq_keyhandler('+', &do_inc_thresh,
@@ -1160,8 +1168,7 @@ void __init console_endboot(void)
     register_irq_keyhandler('G', &do_toggle_guest,
                             "toggle host/guest log level adjustment", 0);
 
-    /* Serial input is directed to DOM0 by default. */
-    console_find_owner();
+    console_init_owner();
 }
 
 int __init console_has(const char *device)

-- 
2.34.1



