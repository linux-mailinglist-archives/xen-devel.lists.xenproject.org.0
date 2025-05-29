Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3773AC74CF
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 02:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999630.1380270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKQpf-0001TQ-QD; Thu, 29 May 2025 00:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999630.1380270; Thu, 29 May 2025 00:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKQpf-0001Qo-NU; Thu, 29 May 2025 00:09:15 +0000
Received: by outflank-mailman (input) for mailman id 999630;
 Thu, 29 May 2025 00:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VQJb=YN=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKQpe-0001DA-QT
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 00:09:14 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 273fd3e3-3c21-11f0-a2fe-13f23c93f187;
 Thu, 29 May 2025 02:09:14 +0200 (CEST)
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
X-Inumbo-ID: 273fd3e3-3c21-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748477353; x=1748736553;
	bh=tw28fhlor8Serb03KD5cH3qsKtDV4rrkKaWcHlVWAj0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gDeEiyvYljBZPniWbtkOUGUVP1oVbGUWyPOGYp0yoHc8kS69Qx5eK1XbBP+E/HnPz
	 dXdtG1EgpdO7ak6oX1KqMQO5ssw1+ZOEfuRSYSevRMUu2zKbAtOiZwm8im3AhFrhXN
	 fqiMIhV7wZ4KUNKZf8Hly6jPwOMy34LXDWH3tN0hIKbahkVvett8c8VWqKiBPAz6hF
	 HUGjGzqx0DIy1GUKwTvY1gqhgsNbGt7TFlJpMmqrbvEwz4aJguCM0TB695O4v9GxeR
	 hgJMBGhUOjCVZcv4Dk89GnTnRuvj3JyT/zN7doafCKfK1r/zAYk+6NJjb51vMp991b
	 L10WTihycEjAQ==
Date: Thu, 29 May 2025 00:09:07 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Denis Mukhin <dmkhn@proton.me>
Subject: [PATCH v4 1/4] xen/console: rename switch_serial_input() to console_switch_input()
Message-ID: <20250529000848.2675903-2-dmukhin@ford.com>
In-Reply-To: <20250529000848.2675903-1-dmukhin@ford.com>
References: <20250529000848.2675903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f34a96e7af543bd1c1a2afc5a551ab2565a02b8b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmkhn@proton.me>

From: Denis Mukhin <dmukhin@ford.com>

Update the function name as per naming notation in the console driver.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
- added A-b
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c15987f5bb..30701ae0b0 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -523,7 +523,7 @@ void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
=20
-static void switch_serial_input(void)
+static void console_switch_input(void)
 {
     unsigned int next_rx =3D console_rx;
=20
@@ -617,7 +617,7 @@ static void cf_check serial_rx(char c)
         /* We eat CTRL-<switch_char> in groups of 3 to switch console inpu=
t. */
         if ( ++switch_code_count =3D=3D 3 )
         {
-            switch_serial_input();
+            console_switch_input();
             switch_code_count =3D 0;
         }
         return;
@@ -1171,7 +1171,7 @@ void __init console_endboot(void)
                             "toggle host/guest log level adjustment", 0);
=20
     /* Serial input is directed to DOM0 by default. */
-    switch_serial_input();
+    console_switch_input();
 }
=20
 int __init console_has(const char *device)
--=20
2.34.1



