Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C7C8A8625
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707568.1105627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6R0-0007Kj-1U; Wed, 17 Apr 2024 14:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707568.1105627; Wed, 17 Apr 2024 14:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Qz-0007J0-Up; Wed, 17 Apr 2024 14:38:49 +0000
Received: by outflank-mailman (input) for mailman id 707568;
 Wed, 17 Apr 2024 14:38:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNGY=LW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rx6Qz-0004w5-B3
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:38:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32069a61-fcc8-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 16:38:47 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 171336465166816.801478738201467;
 Wed, 17 Apr 2024 07:37:31 -0700 (PDT)
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
X-Inumbo-ID: 32069a61-fcc8-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1713364654; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZkJTpCvrIrDome+ZXwYhHJxzyxg4zmtQfizy6nVNb5CE5JBMOxaqxFSMA0/9B/wjb8LueWBHUeU1eH+nZpsmgw/sh2AySYiYBNPptWbNL1zdaTQOyOWlYjmyGFOZCgdN6+j1Ug2XQ8R/mj39dgea8h6mdXpwXm45LB/EDy8/rqo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713364654; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N0arzaXrMPl4r4kp3iif6Kha+dns7W1SUMyWcnC9JNw=; 
	b=SulzFp//5+LuqZtaRWFRoM0yQPvpP6iPA7/Pyx64CtpD/wMYI9up0B/dCV7MixlTJBpdzuaLbHaoR3Fmn7R1s4X3MUTwjlrivzTgPH9iRfbX8NFadmZSHRFdErh2pCbwIOAJXMof5RopVF+TJbJmEwOQ4pE08CT7GD0aoxm63aU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713364654;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=N0arzaXrMPl4r4kp3iif6Kha+dns7W1SUMyWcnC9JNw=;
	b=Jb7WFUtYeoL47Pe+5ZP4zkLXgvKFjIk855CqadzrYCVW2oFWppnlMJN0/MHigrQ7
	xUPybszTZhmatNFfvsuUc3w8voFB7r1b6V1mGjhdu3czqfBcEERvqoQk0/dLfApoJGF
	kg/nw0i5OTpsXMkh6p/arqj16jEQ+94BAt8XMDnw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 5/6] gzip: move crc state into consilidated gzip state
Date: Wed, 17 Apr 2024 10:37:15 -0400
Message-Id: <20240417143716.27189-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240417143716.27189-1-dpsmith@apertussolutions.com>
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  | 11 +++++++----
 xen/common/gzip/inflate.c | 12 +++++-------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 8178a05a0190..bef324d3d166 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -22,6 +22,9 @@ struct gzip_state {
 
     unsigned long bb;      /* bit buffer */
     unsigned bk;           /* bits in bit buffer */
+
+    uint32_t crc_32_tab[256];
+    uint32_t crc;
 };
 
 #define OF(args)        args
@@ -74,7 +77,7 @@ static __init void flush_window(struct gzip_state *s)
      * The window is equal to the output buffer therefore only need to
      * compute the crc.
      */
-    unsigned long c = crc;
+    unsigned long c = s->crc;
     unsigned int n;
     unsigned char *in, ch;
 
@@ -82,9 +85,9 @@ static __init void flush_window(struct gzip_state *s)
     for ( n = 0; n < s->outcnt; n++ )
     {
         ch = *in++;
-        c = crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
+        c = s->crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
     }
-    crc = c;
+    s->crc = c;
 
     s->bytes_out += (unsigned long)s->outcnt;
     s->outcnt = 0;
@@ -121,7 +124,7 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
     s->inptr = 0;
     s->bytes_out = 0;
 
-    makecrc();
+    makecrc(s);
 
     if ( gunzip(s) < 0 )
     {
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 5735bbcf7eb4..c18ce20210b0 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -1063,16 +1063,14 @@ static int __init inflate(struct gzip_state *s)
  *
  **********************************************************************/
 
-static ulg __initdata crc_32_tab[256];
-static ulg __initdata crc;  /* initialized in makecrc() so it'll reside in bss */
-#define CRC_VALUE (crc ^ 0xffffffffUL)
+#define CRC_VALUE (s->crc ^ 0xffffffffUL)
 
 /*
  * Code to compute the CRC-32 table. Borrowed from
  * gzip-1.0.3/makecrc.c.
  */
 
-static void __init makecrc(void)
+static void __init makecrc(struct gzip_state *s)
 {
 /* Not copyrighted 1990 Mark Adler */
 
@@ -1089,7 +1087,7 @@ static void __init makecrc(void)
     for (i = 0; i < sizeof(p)/sizeof(int); i++)
         e |= 1L << (31 - p[i]);
 
-    crc_32_tab[0] = 0;
+    s->crc_32_tab[0] = 0;
 
     for (i = 1; i < 256; i++)
     {
@@ -1100,11 +1098,11 @@ static void __init makecrc(void)
             if (k & 1)
                 c ^= e;
         }
-        crc_32_tab[i] = c;
+        s->crc_32_tab[i] = c;
     }
 
     /* this is initialized here so this code could reside in ROM */
-    crc = (ulg)0xffffffffUL; /* shift register contents */
+    s->crc = (ulg)0xffffffffUL; /* shift register contents */
 }
 
 /* gzip flag byte */
-- 
2.30.2


