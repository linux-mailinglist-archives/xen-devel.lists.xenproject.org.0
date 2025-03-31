Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8319A7713E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933131.1335178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCc-0004oz-Fi; Mon, 31 Mar 2025 23:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933131.1335178; Mon, 31 Mar 2025 23:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCc-0004mX-Ch; Mon, 31 Mar 2025 23:05:58 +0000
Received: by outflank-mailman (input) for mailman id 933131;
 Mon, 31 Mar 2025 23:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzOCb-00041G-3f
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:05:57 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3c3c743-0e84-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 01:05:56 +0200 (CEST)
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
X-Inumbo-ID: b3c3c743-0e84-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743462355; x=1743721555;
	bh=fFhCvlB/1zqro9CkPetkZk3bqFHwLxMCAaqoQPXzqBA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=DO7B4oP0DNoI1UvAj5bAZiTIh7kMYXc3vLUqJ9nqfYR/csV+ncsFsmY4gM534ZmOi
	 78v2Pl5aD02A6GLFWbc4O0e3o1Ndww8GR2YbkyiGKFbxrP+t6bjiXk3ZR6IruHdoSV
	 oMJru/PfOz0z7Wq4RS77N+T/E7vWEQHfPgfC9+sb6DBOUEd9afQHx5wXmHByHirtTY
	 mW4R5u6OKRJyucHgJmuOc9nDX0vD2II0Qjvoou60m9ipRW1+bu8xr+NLxKXE+Nk3Xt
	 VM6z/7AhKrb9c2nv1wCrjfLmOKjTiCTlTRA1zOz/qSP0DesLgkT1J4wbTVq/hlxfBN
	 gV1H5OSsydC5A==
Date: Mon, 31 Mar 2025 23:05:48 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 4/7] xen/console: rename switch_serial_input() to console_switch_input()
Message-ID: <20250331230508.440198-5-dmukhin@ford.com>
In-Reply-To: <20250331230508.440198-1-dmukhin@ford.com>
References: <20250331230508.440198-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b14ccfa3a58e4e78b6fca6b051d930587e309221
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Update the name to emphasize the physical console input switch to a
new owner domain following the naming notation in the console driver.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- rename console_switch_focus() to console_switch_input()
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 54163e93fb..48da4e5838 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -511,7 +511,7 @@ static bool console_is_input_allowed(domid_t domid)
     return !!d;
 }
=20
-static void switch_serial_input(void)
+static void console_switch_input(void)
 {
     unsigned int next_rx =3D console_rx;
=20
@@ -603,7 +603,7 @@ static void cf_check serial_rx(char c)
         /* We eat CTRL-<switch_char> in groups of 3 to switch console inpu=
t. */
         if ( ++switch_code_count =3D=3D 3 )
         {
-            switch_serial_input();
+            console_switch_input();
             switch_code_count =3D 0;
         }
         return;
@@ -1147,7 +1147,7 @@ void __init console_endboot(void)
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



