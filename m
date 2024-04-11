Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C98A18E4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704030.1100125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwVa-0006Ia-Rw; Thu, 11 Apr 2024 15:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704030.1100125; Thu, 11 Apr 2024 15:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwVa-0006FQ-Oc; Thu, 11 Apr 2024 15:38:38 +0000
Received: by outflank-mailman (input) for mailman id 704030;
 Thu, 11 Apr 2024 15:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyOp=LQ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ruwJy-0000Mi-HD
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:26:38 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2744a0a-f817-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 17:26:37 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1712849133372546.854655551866;
 Thu, 11 Apr 2024 08:25:33 -0700 (PDT)
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
X-Inumbo-ID: e2744a0a-f817-11ee-b908-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; t=1712849135; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AM1W3oM3/jBer+uk2dAhpydvxPiQ/v639/VYDawNR1+WcWCzQka2JHvEHLQE+yi+DY2nqF+p1fM8y3exUvlX9JFP06AUQfHRWy3og01fGgJ/lGg1OGwrOrJJEgje7wbiw0kgAdCaxG38cKrCgOeAYEBLk+AP8DaPr23U1Qe8JVw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712849135; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CnTjEaX3hnuMjXMsnX980kERulKrcznM7VftSyLKlZI=; 
	b=GuYjC4zciGnSsOPeFDqwQgL2tlRlCGJIVqU5ky6RK0AvmqVp1fii5FS5cpYgNY+Mlg74uTscyhKxc7PVgzRkzuzeH0455ajJxtPdg4nvZRL4YZvVTRuDXTMppehD6e1sIFWroTNHIvR/IGJlJNy6Ui/kKtVDCrbKHCkUq+D6lR0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712849135;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=CnTjEaX3hnuMjXMsnX980kERulKrcznM7VftSyLKlZI=;
	b=lYmTdwQR4nnpkPHJ989rRXQVWJp5sRTKy77MpiThId6AAgnyBnWB5/J/KHMCfSvP
	xaYjtxmRXGnaCMSZKqJRt1kO9dVjLol5VLsmV070iJQU6QDNnrueBnycW1ruK3BI0zA
	zdRayhCvKTadoXY1IXWrGr+8JOLVQRg3B2eo+Xo4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/5] gzip: move crc state into consilidated gzip state
Date: Thu, 11 Apr 2024 11:25:17 -0400
Message-Id: <20240411152518.2995-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411152518.2995-1-dpsmith@apertussolutions.com>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  | 11 +++++++----
 xen/common/gzip/inflate.c | 12 +++++-------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 9b4891731b8b..a1b516b925c9 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -28,6 +28,9 @@ struct gzip_data {
 
     unsigned long bb;      /* bit buffer */
     unsigned bk;           /* bits in bit buffer */
+
+    unsigned long crc_32_tab[256];
+    unsigned long crc;
 };
 
 #define OF(args)        args
@@ -78,7 +81,7 @@ static __init void flush_window(struct gzip_data *gd)
      * The window is equal to the output buffer therefore only need to
      * compute the crc.
      */
-    unsigned long c = crc;
+    unsigned long c = gd->crc;
     unsigned int n;
     unsigned char *in, ch;
 
@@ -86,9 +89,9 @@ static __init void flush_window(struct gzip_data *gd)
     for ( n = 0; n < gd->outcnt; n++ )
     {
         ch = *in++;
-        c = crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
+        c = gd->crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
     }
-    crc = c;
+    gd->crc = c;
 
     gd->bytes_out += (unsigned long)gd->outcnt;
     gd->outcnt = 0;
@@ -129,7 +132,7 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
     gd.inptr = 0;
     gd.bytes_out = 0;
 
-    makecrc();
+    makecrc(&gd);
 
     if ( gunzip(&gd) < 0 )
     {
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index c8dd35962abb..6c8c7452a31f 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -1125,16 +1125,14 @@ static int __init inflate(struct gzip_data *gd)
  *
  **********************************************************************/
 
-static ulg __initdata crc_32_tab[256];
-static ulg __initdata crc;  /* initialized in makecrc() so it'll reside in bss */
-#define CRC_VALUE (crc ^ 0xffffffffUL)
+#define CRC_VALUE (gd->crc ^ 0xffffffffUL)
 
 /*
  * Code to compute the CRC-32 table. Borrowed from
  * gzip-1.0.3/makecrc.c.
  */
 
-static void __init makecrc(void)
+static void __init makecrc(struct gzip_data *gd)
 {
 /* Not copyrighted 1990 Mark Adler */
 
@@ -1151,7 +1149,7 @@ static void __init makecrc(void)
     for (i = 0; i < sizeof(p)/sizeof(int); i++)
         e |= 1L << (31 - p[i]);
 
-    crc_32_tab[0] = 0;
+    gd->crc_32_tab[0] = 0;
 
     for (i = 1; i < 256; i++)
     {
@@ -1162,11 +1160,11 @@ static void __init makecrc(void)
             if (k & 1)
                 c ^= e;
         }
-        crc_32_tab[i] = c;
+        gd->crc_32_tab[i] = c;
     }
 
     /* this is initialized here so this code could reside in ROM */
-    crc = (ulg)0xffffffffUL; /* shift register contents */
+    gd->crc = (ulg)0xffffffffUL; /* shift register contents */
 }
 
 /* gzip flag byte */
-- 
2.30.2


