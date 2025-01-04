Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19BDA0119A
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864710.1275995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQn-0006XO-9h; Sat, 04 Jan 2025 01:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864710.1275995; Sat, 04 Jan 2025 01:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQm-0006Hf-RT; Sat, 04 Jan 2025 01:58:24 +0000
Received: by outflank-mailman (input) for mailman id 864710;
 Sat, 04 Jan 2025 01:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQj-0005Ax-Q6
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dd06576-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F7205C61A0;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F862C4CEDF;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 258D1E7719A;
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
X-Inumbo-ID: 5dd06576-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=WkgpINAi4NmXbCPyfSBPSjKkxNTDWSdwSg5wm9hn06Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H9zfqAfx2RSRbi2EMUVSUK5A5YOdctvF9wzXgaRtutupZJbIU2q2d8AbEzvPTLyQ3
	 xBtuOwtfuHSO9BCbRcpqL13I5m3lIuSKDBhhcvRQ61SFzRTB3A5Z4lGOsmLXX2PyrK
	 A5mHdUnmnJVhFcx9Nw7Zh+ApfuGjWuwrdafH0q3tGQsrtLyCXZKJ+clySk3PJOdmDq
	 jyyCEvxnykvwyU4Ja+BNljO44nCTjVLnUyuduJK2oQLVUyVFZ9Gvbp85ObWGdR3k5t
	 X9XfdkHs1SuM2shblGWjSiiX6XsDLSjifDP6GUwcasEMmBJaNpFdh7ZsH/Kf4mCBeu
	 wDa82EC6J8jlQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:14 -0800
Subject: [PATCH v3 08/24] xen/console: rename switch_serial_input() to
 console_switch_input()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-8-c5d36b31d66c@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=1473;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=VlrDmVYSUYYEG2sJ1u5nbMuy01Nt/S2plh2q6DJ+BIw=;
 b=S1s8vEh//WnTsVDQMRNzdQ8IrNEV/vZqF5vI012/k7AeJFUsj7kHlwgXqm6tbP8iH+pQoIZMm
 eh6s4rBUInzDHPPpwvMdJSQgTovGbPH5QGbGKna4mP/7Vse5daRUn15
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Updated the name to highlight the physical console input selection logic:
existing code does not switch only serial console, it also switches debugging
console (debug I/O port and console hypercall).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 0927c0564a67098c70dab576ebeda3825fadfb61..48866cf47beda39e48a7774277238273566382b1 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -486,7 +486,7 @@ void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
 
-static void switch_serial_input(void)
+static void console_switch_input(void)
 {
     unsigned int next_rx = console_rx;
 
@@ -577,7 +577,7 @@ static void cf_check serial_rx(char c)
         /* We eat CTRL-<switch_char> in groups of 3 to switch console input. */
         if ( ++switch_code_count == 3 )
         {
-            switch_serial_input();
+            console_switch_input();
             switch_code_count = 0;
         }
         return;
@@ -1117,7 +1117,7 @@ void __init console_endboot(void)
                             "toggle host/guest log level adjustment", 0);
 
     /* Serial input is directed to DOM0 by default. */
-    switch_serial_input();
+    console_switch_input();
 }
 
 int __init console_has(const char *device)

-- 
2.34.1



