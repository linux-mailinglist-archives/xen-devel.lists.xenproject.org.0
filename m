Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C733A680C8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919906.1324268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUY-0005v0-Bx; Tue, 18 Mar 2025 23:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919906.1324268; Tue, 18 Mar 2025 23:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUY-0005sw-87; Tue, 18 Mar 2025 23:37:02 +0000
Received: by outflank-mailman (input) for mailman id 919906;
 Tue, 18 Mar 2025 23:37:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugUW-0003zY-Js
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:37:00 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfc467e9-0451-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 00:36:54 +0100 (CET)
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
X-Inumbo-ID: dfc467e9-0451-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3fi74tjqgbbwzowscapbqgn4tu.protonmail; t=1742341013; x=1742600213;
	bh=CnZXSLA5dm7t4GDjx0s2ayocR6HlIoQPG/eIj0cmur4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gvREQ0oC6sorljs9P37CDBcXbr1AIfNRvu3FXW5MZy1Zeaa9FNBVxJd4K/Bmv62iU
	 kqSWO5yqeSEQkkfeTcnLObqkt49OjXeSCaEOKSQZrE84ORkUvjNKcOuy2iYhEUr9pa
	 OI5AQzi8Qkt2BKL3SGMiNUDCbb6xTfv4gKL/Inho8I+Q+4nHx+X8N6RL3wqu29jdsS
	 LgfO5+bU61tXUGpYljl3ri8eseGlqKVA66G6NZ41bm9GZ4bQAxTTNxGA7/SsZQKzaj
	 0q5R87YdXi0kYsABHkxavL1DmCUMAHXzlho1NTg50QxAabsQ1IdawwOlGtI1Yu5Scz
	 P7p4ShkV6P5eA==
Date: Tue, 18 Mar 2025 23:36:49 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 5/8] xen/console: rename switch_serial_input() to console_switch_focus()
Message-ID: <20250318233617.849903-6-dmukhin@ford.com>
In-Reply-To: <20250318233617.849903-1-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 39587d8bc25c625f4d86e9a97312bdd5666aa16f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Update the name to emphasize the physical console input switch to a
new owner domain following the naming notation in the console driver.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index d04a5335ce..5910ff701c 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -511,7 +511,7 @@ static bool console_check_focus_by_id(domid_t domid)
     return !!d;
 }
=20
-static void switch_serial_input(void)
+static void console_switch_focus(void)
 {
     unsigned int next_rx =3D console_rx;
=20
@@ -618,7 +618,7 @@ static void cf_check serial_rx(char c)
         /* We eat CTRL-<switch_char> in groups of 3 to switch console inpu=
t. */
         if ( ++switch_code_count =3D=3D 3 )
         {
-            switch_serial_input();
+            console_switch_focus();
             switch_code_count =3D 0;
         }
         return;
@@ -1162,7 +1162,7 @@ void __init console_endboot(void)
                             "toggle host/guest log level adjustment", 0);
=20
     /* Serial input is directed to DOM0 by default. */
-    switch_serial_input();
+    console_switch_focus();
 }
=20
 int __init console_has(const char *device)
--=20
2.34.1



