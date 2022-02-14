Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F754B516A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271977.466756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbE3-0006ZD-6S; Mon, 14 Feb 2022 13:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271977.466756; Mon, 14 Feb 2022 13:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbE2-0006VW-V6; Mon, 14 Feb 2022 13:17:06 +0000
Received: by outflank-mailman (input) for mailman id 271977;
 Mon, 14 Feb 2022 13:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4d-0008IH-H1
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b791dfc-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:21 +0100 (CET)
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
X-Inumbo-ID: 0b791dfc-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=eqhKAymiA22/wB5PZk3BR4BeJKlUT2B+meSMBCt3MmU=;
  b=cpFSFB0Y6d6swQiujtITK9SsguSmgsaIDj9dd6Xpceg8NXh5iSw9viMS
   BwqVNgI5AC04Uz5BHTn7NXNkGBLiuzFdrlG45fB8OFN03xiBc3QJJN4Hg
   YeC9COwCJXP9HO4IB6CkOQp72n6SnGPx0REXQWqnL8twM8kB569LWyXOC
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +E6Enw6kwx7WWxt+vv6po0BIihZjUYHGHfpjS5XIMAvcmcdh12ggcmN2kZipUmE0QjWWe9i9j3
 HyJgdHhXRdaFYMK0qFjIlif5Bynr2nxfMpO8WZGSO2o4eZHUIOMIkIM+XGlLpTbo+1IHEytNNY
 +KaiB/akovSRepz1cbNPrWer1T+D82nSKjJW/huRNG3yV8syMoElL6Uv/fhp/zomF3xjqP/Hzb
 sPB0JGPk7aA7MJn1IlFwMwI6fzmK1wf0/+8PZzTGXt7gW2Aax7MpNontZL+mQ0A5bsPm+k3KrN
 q720fo+VRZGVn5Rx0DLjBfKf
X-SBRS: 5.1
X-MesageID: 64554438
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SLMNT631puw+7FO/kfbD5cp2kn2cJEfYwER7XKvMYLTBsI5bpzIBz
 mIbCGyAMqneZWb0fI8kb9uzpEIG6MPXyNFjTQVqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhudIyw
 vlPqpeLbgo3Ooj2tfpDSkBHKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u2p0TQaqFN
 6L1bxJ/TEiaIDkTNm47L585juOJmV3/KwJX/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfycTjTAdxIUufir7gz3QPVljd75AAquUWTh/v6gGK8RNlkD
 EEK/g8UgLZs7RW0d4yoN/Gnm0KsshkZUttWNuQ17gCR16bZizqk6ng4oi1pM4J/6pJvLdA+/
 hrQxo6yW2Qz2FGAYS/Frt+pQSWO1T/5xIPoTQsNVkM77tbqu+nfZTqfH484QMZZYjAYcAwcI
 gxmTgBj3d3/buZRjs1XGGwrZBr2+PD0ovYdvFm/Y45cxloRiHSZT4Kp80PHyv1LMZyUSFKM1
 FBdxZTCs7BeUMzVzXfXKAnoIF1Oz6zbWAAwfHY1R8Vxn9hT0yLLkX9sDMFWex4yb5dslc7Ba
 07PowJBjKK/z1PxBZKbl7mZUpxwpYC5TIyNfqmNMrJmP8ggHCfarXoGTRPBgAjQfL0EzPhX1
 WGzKp33Ux73yM1PkVKLegvq+eF3mH5unz6PLX05pjz+uYejiLeuYe9tGDOzgioRtf/dyOkM2
 9oAZcaM1TtFV+jyPnve/YIJdAhYJnknH5Hm7cdQc7fbcAZhHWggDd7XwK8gJNM5z/gEyL+Q8
 yHvQFJcxXr+mWbDdVeAZEd8Ze69Rp14t386Y3AhZA76x3g5bI+zx64DbJ9rL6I//eluwKcsH
 fkIcsmNGNpVTTHD92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7D5j1HVW5sOQQhmHf36UvP3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiK3Y/YekF+xyQhhTE2XBtOvkMCDb+iyowJNaUfbOdjfYDTum9KKnb
 ORT7vf9LPxYwwoa79siS+5mnfAk+t/ih75G1QA1TnzEYmOiBq5kPnTbj9JEsbdAx+MBtAa7M
 q5VFgK25Vld1BvZLWMs
IronPort-HdrOrdr: A9a23:opt64K0SypVTil+K/JqNtAqjBLAkLtp133Aq2lEZdPRUGvb3qy
 nOpoVj6faaslYssR0b9exofZPwJE80lqQFh7X5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtsp
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554438"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 28/70] xen/video: CFI hardening
Date: Mon, 14 Feb 2022 12:50:45 +0000
Message-ID: <20220214125127.17985-29-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/video/lfb.c  | 4 ++--
 xen/drivers/video/lfb.h  | 4 ++--
 xen/drivers/video/vesa.c | 4 ++--
 xen/drivers/video/vga.c  | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/video/lfb.c b/xen/drivers/video/lfb.c
index 75b749b3303b..48c66f8acf10 100644
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
index cb0e443be4dd..155bc09d3237 100644
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -17,7 +17,7 @@
 
 #define vlfb_info    vga_console_info.u.vesa_lfb
 
-static void lfb_flush(void);
+static void cf_check lfb_flush(void);
 
 static unsigned char *lfb;
 static const struct font_desc *font;
@@ -177,7 +177,7 @@ void __init vesa_mtrr_init(void)
     } while ( (size_total >= PAGE_SIZE) && (rc == -EINVAL) );
 }
 
-static void lfb_flush(void)
+static void cf_check lfb_flush(void)
 {
     if ( vesa_mtrr == 3 )
         __asm__ __volatile__ ("sfence" : : : "memory");
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index b7f04d0d97f4..abe295e477b1 100644
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
@@ -175,7 +175,7 @@ void __init video_endboot(void)
     }
 }
 
-static void vga_text_puts(const char *s, size_t nr)
+static void cf_check vga_text_puts(const char *s, size_t nr)
 {
     for ( ; nr > 0; nr--, s++ )
     {
-- 
2.11.0


