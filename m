Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256A8B0FFC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711552.1111608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfbC-0005wv-KY; Wed, 24 Apr 2024 16:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711552.1111608; Wed, 24 Apr 2024 16:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfbC-0005vJ-He; Wed, 24 Apr 2024 16:35:58 +0000
Received: by outflank-mailman (input) for mailman id 711552;
 Wed, 24 Apr 2024 16:35:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfbB-0004Nw-2R
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:35:57 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8426cb6-0258-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 18:35:56 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713976478817631.4787800889635;
 Wed, 24 Apr 2024 09:34:38 -0700 (PDT)
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
X-Inumbo-ID: b8426cb6-0258-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1713976481; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iy161XWEdMWeHGi5/d6N6NuNIP9cFCBte8hJoHPhdy4++8Hq3wEaaAlNwZytx7dfr+bBnufvJnm4iVw580R8Gr/FoY70a4Qckwf3xHyMCQ8+ozw2tZ+d9jRY/zl7sMXytr8Khjyz6lSt/kl7YDsvMOc8gltQFKwaPxFTHADaito=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713976481; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GpHnI7vIWP3t83v9jzSRMXedCoJS9I7Zt1oRPss2CLE=; 
	b=P1HgrRqD6eO8JbW79RTdYKeVG+KJTOMOBWD2RoJRemZAscaMIsITUCQNFUkALo1cESWYQk9DZ8GE44K+hgZfoaVruSggum7XBjDcIXl8+lHJJwjJNMOfYkOjO8aYtQVG0aTtJgpjvV443dDipZ0z7sAJZ77dJyQ7keM9HhypPig=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713976480;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=GpHnI7vIWP3t83v9jzSRMXedCoJS9I7Zt1oRPss2CLE=;
	b=mZyhqngeFPP2CXkxuNutxlvM/J0wKqNzZGIFoRKoj2DyOZFufBVqjgjwk5xfn+GM
	hHj1Q3yeSl5niQt6T4EFk2tgCx2qL6+GceT5VVHD2ZVycNjw1fa9NE9ApP7pPDqwOdk
	MfHgOScUb5ysjYQkN5qEnMPHVdQYRWdAbrC4LS8U=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 5/8] gzip: move input buffer handling into gunzip state
Date: Wed, 24 Apr 2024 12:34:19 -0400
Message-Id: <20240424163422.23276-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move the input buffer handling, buffer pointer(inbuf), size(insize), and
index(inptr), into gunzip state. Adjust functions and macros that consumed the
input buffer to accept a struct gunzip_state reference.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  | 23 +++++-----
 xen/common/gzip/inflate.c | 92 +++++++++++++++++++--------------------
 2 files changed, 57 insertions(+), 58 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 11bfe45d8222..3fb9589b069e 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -10,13 +10,12 @@ struct gunzip_state {
     unsigned char *window;
     /* window pointer: */
     unsigned int wp;
-};
-
-static unsigned char *__initdata inbuf;
-static unsigned int __initdata insize;
 
-/* Index of next byte to be processed in inbuf: */
-static unsigned int __initdata inptr;
+    unsigned char *inbuf;
+    size_t insize;
+    /* Index of next byte to be processed in inbuf: */
+    unsigned int inptr;
+};
 
 #define malloc(a)       xmalloc_bytes(a)
 #define free(a)         xfree(a)
@@ -51,14 +50,14 @@ static __init void error(const char *x)
     panic("%s\n", x);
 }
 
-static __init uch get_byte(void) {
-    if ( inptr >= insize )
+static __init uch get_byte(struct gunzip_state *s) {
+    if ( s->inptr >= s->insize )
     {
         error("ran out of input data");
         return 0; /* should never reach */
     }
 
-    return inbuf[inptr++];
+    return s->inbuf[s->inptr++];
 }
 
 #include "inflate.c"
@@ -111,9 +110,9 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
         return -ENOMEM;
 
     s->window = (unsigned char *)output;
-    inbuf = (unsigned char *)image;
-    insize = image_len;
-    inptr = 0;
+    s->inbuf = (unsigned char *)image;
+    s->insize = image_len;
+    s->inptr = 0;
     bytes_out = 0;
 
     makecrc();
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 78b2f20a97ba..f1a3b04cef8f 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -220,8 +220,8 @@ static const ush mask_bits[] = {
     0x01ff, 0x03ff, 0x07ff, 0x0fff, 0x1fff, 0x3fff, 0x7fff, 0xffff
 };
 
-#define NEXTBYTE()  (get_byte()) /* get_byte will panic on failure */
-#define NEEDBITS(n) {while(k<(n)){b|=((ulg)NEXTBYTE())<<k;k+=8;}}
+#define NEXTBYTE(s)  (get_byte(s)) /* get_byte will panic on failure */
+#define NEEDBITS(s,n) {while(k<(n)){b|=((ulg)NEXTBYTE(s))<<k;k+=8;}}
 #define DUMPBITS(n) {b>>=(n);k-=(n);}
 
 /*
@@ -562,14 +562,14 @@ static int __init inflate_codes(
     md = mask_bits[bd];
     for (;;)                      /* do until end of block */
     {
-        NEEDBITS((unsigned)bl);
+        NEEDBITS(s, (unsigned)bl);
         if ((e = (t = tl + ((unsigned)b & ml))->e) > 16)
             do {
                 if (e == 99)
                     return 1;
                 DUMPBITS(t->b);
                 e -= 16;
-                NEEDBITS(e);
+                NEEDBITS(s, e);
             } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
         DUMPBITS(t->b);
         if (e == 16)                /* then it's a literal */
@@ -590,22 +590,22 @@ static int __init inflate_codes(
                 break;
 
             /* get length of block to copy */
-            NEEDBITS(e);
+            NEEDBITS(s, e);
             n = t->v.n + ((unsigned)b & mask_bits[e]);
             DUMPBITS(e);
 
             /* decode distance of block to copy */
-            NEEDBITS((unsigned)bd);
+            NEEDBITS(s, (unsigned)bd);
             if ((e = (t = td + ((unsigned)b & md))->e) > 16)
                 do {
                     if (e == 99)
                         return 1;
                     DUMPBITS(t->b);
                     e -= 16;
-                    NEEDBITS(e);
+                    NEEDBITS(s, e);
                 } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
             DUMPBITS(t->b);
-            NEEDBITS(e);
+            NEEDBITS(s, e);
             d = w - t->v.n - ((unsigned)b & mask_bits[e]);
             DUMPBITS(e);
             Tracevv((stderr,"\\[%d,%d]", w-d, n));
@@ -665,10 +665,10 @@ static int __init inflate_stored(struct gunzip_state *s)
 
 
     /* get the length and its complement */
-    NEEDBITS(16);
+    NEEDBITS(s, 16);
     n = ((unsigned)b & 0xffff);
     DUMPBITS(16);
-    NEEDBITS(16);
+    NEEDBITS(s, 16);
     if (n != (unsigned)((~b) & 0xffff))
         return 1;                   /* error in compressed data */
     DUMPBITS(16);
@@ -676,7 +676,7 @@ static int __init inflate_stored(struct gunzip_state *s)
     /* read and output the compressed data */
     while (n--)
     {
-        NEEDBITS(8);
+        NEEDBITS(s, 8);
         s->window[w++] = (uch)b;
         if (w == WSIZE)
         {
@@ -798,13 +798,13 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
     k = bk;
 
     /* read in table lengths */
-    NEEDBITS(5);
+    NEEDBITS(s, 5);
     nl = 257 + ((unsigned)b & 0x1f);      /* number of literal/length codes */
     DUMPBITS(5);
-    NEEDBITS(5);
+    NEEDBITS(s, 5);
     nd = 1 + ((unsigned)b & 0x1f);        /* number of distance codes */
     DUMPBITS(5);
-    NEEDBITS(4);
+    NEEDBITS(s, 4);
     nb = 4 + ((unsigned)b & 0xf);         /* number of bit length codes */
     DUMPBITS(4);
     if (nl > 286 || nd > 30)
@@ -818,7 +818,7 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
     /* read in bit-length-code lengths */
     for (j = 0; j < nb; j++)
     {
-        NEEDBITS(3);
+        NEEDBITS(s, 3);
         ll[border[j]] = (unsigned)b & 7;
         DUMPBITS(3);
     }
@@ -845,7 +845,7 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
     i = l = 0;
     while ((unsigned)i < n)
     {
-        NEEDBITS((unsigned)bl);
+        NEEDBITS(s, (unsigned)bl);
         j = (td = tl + ((unsigned)b & m))->b;
         DUMPBITS(j);
         j = td->v.n;
@@ -853,7 +853,7 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
             ll[i++] = l = j;          /* save last length in l */
         else if (j == 16)           /* repeat last length 3 to 6 times */
         {
-            NEEDBITS(2);
+            NEEDBITS(s, 2);
             j = 3 + ((unsigned)b & 3);
             DUMPBITS(2);
             if ((unsigned)i + j > n) {
@@ -865,7 +865,7 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
         }
         else if (j == 17)           /* 3 to 10 zero length codes */
         {
-            NEEDBITS(3);
+            NEEDBITS(s, 3);
             j = 3 + ((unsigned)b & 7);
             DUMPBITS(3);
             if ((unsigned)i + j > n) {
@@ -878,7 +878,7 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
         }
         else                        /* j == 18: 11 to 138 zero length codes */
         {
-            NEEDBITS(7);
+            NEEDBITS(s, 7);
             j = 11 + ((unsigned)b & 0x7f);
             DUMPBITS(7);
             if ((unsigned)i + j > n) {
@@ -969,12 +969,12 @@ static int __init inflate_block(struct gunzip_state *s, int *e)
     k = bk;
 
     /* read in last block bit */
-    NEEDBITS(1);
+    NEEDBITS(s, 1);
     *e = (int)b & 1;
     DUMPBITS(1);
 
     /* read in block type */
-    NEEDBITS(2);
+    NEEDBITS(s, 2);
     t = (unsigned)b & 3;
     DUMPBITS(2);
 
@@ -1019,7 +1019,7 @@ static int __init inflate(struct gunzip_state *s)
      */
     while (bk >= 8) {
         bk -= 8;
-        inptr--;
+        s->inptr--;
     }
 
     /* flush out window */
@@ -1100,9 +1100,9 @@ static int __init gunzip(struct gunzip_state *s)
     ulg orig_len = 0;       /* original uncompressed length */
     int res;
 
-    magic[0] = NEXTBYTE();
-    magic[1] = NEXTBYTE();
-    method   = NEXTBYTE();
+    magic[0] = NEXTBYTE(s);
+    magic[1] = NEXTBYTE(s);
+    method   = NEXTBYTE(s);
 
     if (magic[0] != 037 ||                            /* octal-ok */
         ((magic[1] != 0213) && (magic[1] != 0236))) { /* octal-ok */
@@ -1116,7 +1116,7 @@ static int __init gunzip(struct gunzip_state *s)
         return -1;
     }
 
-    flags  = (uch)get_byte();
+    flags  = (uch)get_byte(s);
     if ((flags & ENCRYPTED) != 0) {
         error("Input is encrypted");
         return -1;
@@ -1129,29 +1129,29 @@ static int __init gunzip(struct gunzip_state *s)
         error("Input has invalid flags");
         return -1;
     }
-    NEXTBYTE(); /* Get timestamp */
-    NEXTBYTE();
-    NEXTBYTE();
-    NEXTBYTE();
+    NEXTBYTE(s); /* Get timestamp */
+    NEXTBYTE(s);
+    NEXTBYTE(s);
+    NEXTBYTE(s);
 
-    NEXTBYTE();  /* Ignore extra flags for the moment */
-    NEXTBYTE();  /* Ignore OS type for the moment */
+    NEXTBYTE(s);  /* Ignore extra flags for the moment */
+    NEXTBYTE(s);  /* Ignore OS type for the moment */
 
     if ((flags & EXTRA_FIELD) != 0) {
-        unsigned len = (unsigned)NEXTBYTE();
-        len |= ((unsigned)NEXTBYTE())<<8;
-        while (len--) (void)NEXTBYTE();
+        unsigned len = (unsigned)NEXTBYTE(s);
+        len |= ((unsigned)NEXTBYTE(s))<<8;
+        while (len--) (void)NEXTBYTE(s);
     }
 
     /* Get original file name if it was truncated */
     if ((flags & ORIG_NAME) != 0) {
         /* Discard the old name */
-        while (NEXTBYTE() != 0) /* null */ ;
+        while (NEXTBYTE(s) != 0) /* null */ ;
     }
 
     /* Discard file comment if any */
     if ((flags & COMMENT) != 0) {
-        while (NEXTBYTE() != 0) /* null */ ;
+        while (NEXTBYTE(s) != 0) /* null */ ;
     }
 
     /* Decompress */
@@ -1181,15 +1181,15 @@ static int __init gunzip(struct gunzip_state *s)
     /* crc32  (see algorithm.doc)
      * uncompressed input size modulo 2^32
      */
-    orig_crc = (ulg) NEXTBYTE();
-    orig_crc |= (ulg) NEXTBYTE() << 8;
-    orig_crc |= (ulg) NEXTBYTE() << 16;
-    orig_crc |= (ulg) NEXTBYTE() << 24;
-
-    orig_len = (ulg) NEXTBYTE();
-    orig_len |= (ulg) NEXTBYTE() << 8;
-    orig_len |= (ulg) NEXTBYTE() << 16;
-    orig_len |= (ulg) NEXTBYTE() << 24;
+    orig_crc = (ulg) NEXTBYTE(s);
+    orig_crc |= (ulg) NEXTBYTE(s) << 8;
+    orig_crc |= (ulg) NEXTBYTE(s) << 16;
+    orig_crc |= (ulg) NEXTBYTE(s) << 24;
+
+    orig_len = (ulg) NEXTBYTE(s);
+    orig_len |= (ulg) NEXTBYTE(s) << 8;
+    orig_len |= (ulg) NEXTBYTE(s) << 16;
+    orig_len |= (ulg) NEXTBYTE(s) << 24;
 
     /* Validate decompression */
     if (orig_crc != CRC_VALUE) {
-- 
2.30.2


