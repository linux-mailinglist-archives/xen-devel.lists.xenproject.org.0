Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE3F9D9F99
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844069.1259716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tu-00034K-DD; Tue, 26 Nov 2024 23:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844069.1259716; Tue, 26 Nov 2024 23:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tt-0002kw-Ol; Tue, 26 Nov 2024 23:23:21 +0000
Received: by outflank-mailman (input) for mailman id 844069;
 Tue, 26 Nov 2024 23:22:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4si-0000Ao-MC
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dbf5b85-ac4d-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 00:22:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E47905C5D70;
 Tue, 26 Nov 2024 23:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DBFDC4CED7;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 11E83D66B94;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
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
X-Inumbo-ID: 3dbf5b85-ac4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNkYmY1Yjg1LWFjNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjYzMzIzLjI1ODE0NSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663317;
	bh=xN3Qk4AnkavJDz1+2oRzOsxhatlUANXuldhRbnVqaL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ItYXHoJ/mJNsPDSZ9pf4Ui726UpgFmylp5LAsOGmc2yZqvNzSjIAKc+fMV+PdsJnC
	 RxLCIck1Wfcv7eF+HknLfAxJO3jiVLxxpII/Kl6TpWtC4ct7bFEvLWhMjp+d9vAmHP
	 P3iuRXB3dQJQtffNjDd8pjaYCsMO1maYRtTENwECy0JhRRkr39RkuNR454sLuDH503
	 /egBzxIdcif4Zqt16DnAkRv5CWX5Ye9QkvhYwsm7O42u/G+sGk0WKSUlEAYMnCCCZn
	 sJR8lW7x5wSmgrdL7nhCuJPqJFMoB5Bd1flhz7j4z2RcMg/GJoXQh12ijlgRx/5dmO
	 GYQ8r9hIxUlDg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:14 -0800
Subject: [PATCH 24/36] xen/console: introduce console_init_owner()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-24-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=1949;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=9IHMF1BdeViUoT1r1xwy88EM2J39hJxCdMpf6FUj+oc=;
 b=iU++HT4kXEU4fCx3MfdSPop0eCxgapVBalO1zTfRHftl7NMTURPkAWlnTI41PiCDlyw5pkYq5
 YJOq/CZ6Y6lD6glLNem8Mfog6GMWKqhpPKh/ks4hfwiAJ0sIF3uEIrW
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



