Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DFFAC9816
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 01:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001601.1381724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL90A-00057g-Kd; Fri, 30 May 2025 23:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001601.1381724; Fri, 30 May 2025 23:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL90A-00056B-Hl; Fri, 30 May 2025 23:19:02 +0000
Received: by outflank-mailman (input) for mailman id 1001601;
 Fri, 30 May 2025 23:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AEV3=YO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uL908-00055p-Nf
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 23:19:00 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 766d3ff1-3dac-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 01:18:58 +0200 (CEST)
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
X-Inumbo-ID: 766d3ff1-3dac-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=cjfyrptl4ng5he7ajhctxrmcyq.protonmail; t=1748647136; x=1748906336;
	bh=YSUOLXyrO7AC8+AnY9XmvmG3t0KDhdjWKnpe7lbTOKA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=kejDclk7enbZKjSY8z9Q91xwWE4NvLpKUZo6SlEX1ReFBCVW2bgdaltNJTZ/ZQr7q
	 kWGVsl5Rwipa4SgDuUUXLK1VLg7ko5YifhPGo6lGAwYf4sv33+skz9sb0dTctZcKor
	 0za3beM3YWqGtGwBgOEDfgOSCLI0/qwwWMRKnHBjTcV+G88bN0OhucOHRCqm1/HzaX
	 djQEqRymApavtK5eKJxJj07+Hz4qgPdn2OdhJyVsa0/VfLuXbsA+ZvdkCOXDWHvd8n
	 pk5/gxUvpkI2lMJY2YGrsLP/+0olkesmxpi6qNTB9lSKGRXTnJ9M21yPZ2RKeBgXCB
	 4TpG7JHwkzSiQ==
Date: Fri, 30 May 2025 23:18:53 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 1/4] xen/console: rename switch_serial_input() to console_switch_input()
Message-ID: <20250530231841.73386-2-dmukhin@ford.com>
In-Reply-To: <20250530231841.73386-1-dmukhin@ford.com>
References: <20250530231841.73386-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 423c493d8e7f267520abe8c351b28d1eab06b8b7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Update the function name as per naming notation in the console driver.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v4:
- kept A-b
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



