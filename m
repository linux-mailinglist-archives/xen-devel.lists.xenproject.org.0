Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E46845EE7E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232747.403609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauB-0003Ie-4l; Fri, 26 Nov 2021 13:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232747.403609; Fri, 26 Nov 2021 13:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauB-0003FS-0i; Fri, 26 Nov 2021 13:04:43 +0000
Received: by outflank-mailman (input) for mailman id 232747;
 Fri, 26 Nov 2021 13:04:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauA-0002zD-1o
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69c06862-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:04:40 +0100 (CET)
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
X-Inumbo-ID: 69c06862-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0JgbBrfAwQwtdb0IBLWk+TvY2zX477eVRbHMu7fiRPk=;
  b=cfDdmaCp21C/vy0kXf2V5fcMPtcUgfKblMaOT9X5gHVVa3NNjmn76KLB
   qccYmsEgSGkntgRZsIBHkLKXwjMrIIk4zJZA/P+ffR7DScI10Q7cJ7v92
   o4W2Qv0bWhIAl1Ei5FFRUpaQmKVDjrS5kbMwhXIO2lEszYvqFUV1Qu74i
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eAIUH47b1AWNmKD+/uw/I5BRdAKmPRFEGpwRUdKuAX1OK3OTmo4QQDh5Wmq9PZYv1kpCMDbf4O
 YPYjbtRiBIlcNXnM2AE3KKnBigEPttpKhkTYyC04swgtNCRde37Ia4CTQb0m2Alo7DRbq9sQzC
 InVIzqjU8TMPajBwsjra0dlkM2PhqTVQRvygssvqM602L3e0mEE7HVLP4Zet3HOaJ59iy2x6Xq
 QoxqI9XKFksU/ZXAcntxuKbWQwWFQRXKKBhdlcCFc619q2y0cjOr92seqMug/rC3yxPURlH5Es
 Ej9eTbsqkI3QDoeoiw2Nitcc
X-SBRS: 5.1
X-MesageID: 58695923
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Bt187aIbe/7jiJdtFE+RJJIlxSXFcZb7ZxGr2PjKsXjdYENS02BVn
 GMeUGmFP6yDZDOkf9kibd6yoRgF75SAz4dmGwZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Cg9Jwk
 stwvqe8VCYsJ5LPieQiSCdhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpg2JETTKyFD
 yYfQWVxd0rJeyVrA3YGVZEyl8iPonD+TxQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 H/C/mn/KgEXMpqY0zXt2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQglSJoxodUNp4CPAh5UeGza+83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LTdzsrzPV0+WzbuJjDarBisELVAZWxZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2OBjr9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6raWNE/qQQ2d3XEy9hL0yX4FWy3yGsjTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27Da+EMIcRM8QvKFTvEMRSiai4hDuFfK8Ey/xXB
 HtmWZz0USZy5VpPkFJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CALyWSnSGquY7cAFVRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNw/4Iy7yWp
 y7lASe1CjPX3BX6FOlDUVg7AJuHYHq1hStT0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:nwVYCalvYAar/SJVv27Xs/hqQtTpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58695923"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 24/65] xen/video: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:05 +0000
Message-ID: <20211126123446.32324-25-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
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


