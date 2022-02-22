Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67C44BFC7F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276860.473237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4Z-0007l2-Tz; Tue, 22 Feb 2022 15:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276860.473237; Tue, 22 Feb 2022 15:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4Z-0007Yf-G3; Tue, 22 Feb 2022 15:27:27 +0000
Received: by outflank-mailman (input) for mailman id 276860;
 Tue, 22 Feb 2022 15:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4W-0006OK-El
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed307a22-93f3-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:27:23 +0100 (CET)
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
X-Inumbo-ID: ed307a22-93f3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=N0ZI0nkwMH4pgo3uSdj8brsbvDtIU17yJ3AGUn36a0I=;
  b=gGnoZXpAYwjD/5KM9Wf+sEgXjWpjDnKnLQUY28EhAb4oVxJCM87cajWF
   lTUGJoJXba+9l9/NF9rZGn0V3tk1QR5l0L7JZKsc3ycvl3e0stGXSKHe/
   wX02dVNlrqjB7hAcfZnUX84xw94TvvYnh/a/74c0sjG2FcMilYo9BvPuI
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64170205
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YL8mOauVmCFsvLprfuHyzmA/UOfnVDJeMUV32f8akzHdYApBsoF/q
 tZmKWyAOqmIZ2fxfoslO4vip0gEuJ7WmtM1TlZp+y1gFXxH+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nX4
 4uoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi83H5Lzg8A3TSViHj8lYINb4a3nA0Gw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQzNUuYOUUSUrsRIIkjkd+xol/jSTp7+BHJhbEK4DTc0wMkhdABN/KKI4fXFK25hH2wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3nsOGm3XKmDZVUkdPEwLm/7/p0SZSRu6zN
 WQK2xURtowY6nCRQ8emAjOluWyknCcTDo84//IB1CmBza/d4gC8D2cCTyJcZNFOiPLaVQDGx
 XfSwYq3WGUHXKm9DCvEq+zK9W/a1T09cDdaDRLoWzfp9DUKTGsbqhvUBuhuH6eu5jEeMWGhm
 mvaxMTSalh6sCLq60lZ1Q2f695PjsKQJuLQ2ukxdjj+hu+eTNT4D7FEEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3u6vZbmyB3AQzRsFJG9GRF5iLJ9s4DNZWfhoBDyr5UWWxP
 B+7Vf15vve/w0dGnYcoOtnsWqzGPIDrFMj/V+C8Uza9SsMZSeNzxwk3PRT49zm0yCAEyPhjU
 b/GIZfEJStLUsxPkWvpL9rxJJd2n0jSM0uIHsulp/lmuJLDDEOopUAtagXWNblhtPveyOgXm
 v4GX/a3J9xkeLWWSkHqHUQ7djjm8VBT6UjKlvFq
IronPort-HdrOrdr: A9a23:n6mPX64mQ38icmHMlQPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64170205"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 27/70] xen/video: CFI hardening
Date: Tue, 22 Feb 2022 15:26:38 +0000
Message-ID: <20220222152645.8844-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3:
 * Rebase over recent commits
---
 xen/drivers/video/lfb.c  | 4 ++--
 xen/drivers/video/lfb.h  | 4 ++--
 xen/drivers/video/vesa.c | 4 ++--
 xen/drivers/video/vga.c  | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/video/lfb.c b/xen/drivers/video/lfb.c
index 9254b5e9022a..a6fb837974f7 100644
--- a/xen/drivers/video/lfb.c
+++ b/xen/drivers/video/lfb.c
@@ -53,7 +53,7 @@ static void lfb_show_line(
 }
 
 /* Fast mode which redraws all modified parts of a 2D text buffer. */
-void lfb_redraw_puts(const char *s, size_t nr)
+void cf_check lfb_redraw_puts(const char *s, size_t nr)
 {
     unsigned int i, min_redraw_y = lfb.ypos;
 
@@ -98,7 +98,7 @@ void lfb_redraw_puts(const char *s, size_t nr)
 }
 
 /* Slower line-based scroll mode which interacts better with dom0. */
-void lfb_scroll_puts(const char *s, size_t nr)
+void cf_check lfb_scroll_puts(const char *s, size_t nr)
 {
     unsigned int i;
 
diff --git a/xen/drivers/video/lfb.h b/xen/drivers/video/lfb.h
index e743ccdd6b11..42161402d611 100644
--- a/xen/drivers/video/lfb.h
+++ b/xen/drivers/video/lfb.h
@@ -35,8 +35,8 @@ struct lfb_prop {
     unsigned int text_rows;
 };
 
-void lfb_redraw_puts(const char *s, size_t nr);
-void lfb_scroll_puts(const char *s, size_t nr);
+void cf_check lfb_redraw_puts(const char *s, size_t nr);
+void cf_check lfb_scroll_puts(const char *s, size_t nr);
 void lfb_carriage_return(void);
 void lfb_free(void);
 
diff --git a/xen/drivers/video/vesa.c b/xen/drivers/video/vesa.c
index c8f81a5cc5fc..c41f6b8d4028 100644
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -17,7 +17,7 @@
 
 #define vlfb_info    vga_console_info.u.vesa_lfb
 
-static void lfb_flush(void);
+static void cf_check lfb_flush(void);
 
 static unsigned char *__read_mostly lfb;
 static const struct font_desc *__initdata font;
@@ -140,7 +140,7 @@ void __init vesa_init(void)
     video_puts = lfb_redraw_puts;
 }
 
-static void lfb_flush(void)
+static void cf_check lfb_flush(void)
 {
     __asm__ __volatile__ ("sfence" : : : "memory");
 }
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index 5e58f83c97ff..e624ebff4f8c 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -19,8 +19,8 @@ static int vgacon_keep;
 static unsigned int xpos, ypos;
 static unsigned char *video;
 
-static void vga_text_puts(const char *s, size_t nr);
-static void vga_noop_puts(const char *s, size_t nr) {}
+static void cf_check vga_text_puts(const char *s, size_t nr);
+static void cf_check vga_noop_puts(const char *s, size_t nr) {}
 void (*video_puts)(const char *, size_t nr) = vga_noop_puts;
 
 /*
@@ -179,7 +179,7 @@ void __init video_endboot(void)
     }
 }
 
-static void vga_text_puts(const char *s, size_t nr)
+static void cf_check vga_text_puts(const char *s, size_t nr)
 {
     for ( ; nr > 0; nr--, s++ )
     {
-- 
2.11.0


