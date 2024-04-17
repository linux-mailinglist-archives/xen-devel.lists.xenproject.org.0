Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670948A8622
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707565.1105618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Qn-0006qy-RL; Wed, 17 Apr 2024 14:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707565.1105618; Wed, 17 Apr 2024 14:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Qn-0006ov-O0; Wed, 17 Apr 2024 14:38:37 +0000
Received: by outflank-mailman (input) for mailman id 707565;
 Wed, 17 Apr 2024 14:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNGY=LW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rx6Ql-0004w5-TW
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:38:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e12b37-fcc8-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 16:38:33 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713364650378661.1634785547899;
 Wed, 17 Apr 2024 07:37:30 -0700 (PDT)
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
X-Inumbo-ID: 29e12b37-fcc8-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1713364652; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HNO4Zw8TAqCb47mccT8ei94b6Q2iYyeDx3iBS3dYUnHjzPYWF4XR4BKwkg/TvmvWh5ZzaCS7L5X7GlMBDft/1BUt7drsrjaDAfMFrTlBJt2QX2+6/XRC/sK22w5h03djxv+WUVVRcyvWdPu6b2xRoDOBNV8rzxfXqFkBk6BuKfE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713364652; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C9KWiBXvcAQOB/6xgDOqlewNDvhMoNnnITpwYyb0xYA=; 
	b=iawrayuMYiOF9OBLgf/WEbS42gn65Q9sSJut6tMxOztJUSDlMZQUg4OiaCOzd4dgO0Gk9F02eaRoSHAKq5H0qxFic5U8WYu35EYLox2SRDxEhp7W/c3G40n8d2bMRYIiSADQg10MDZhxprbZzU55HMA598UARvw1HBdCTz4aHhs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713364652;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=C9KWiBXvcAQOB/6xgDOqlewNDvhMoNnnITpwYyb0xYA=;
	b=ANNKfm/CezOp4TxnCR8A4dbhqHgp9KKatvjsLbrfqY+uy5Itf/VvijMAi08hm1Yn
	BL3SwvMkuWchGJh7RZhyn+IHFsFn8SBVbkROd7Eui6Z7PZyl4foTRCc/y96+P9YuPyg
	mpu58i5ZJ26xPdrSuQvo00Uh4nO5Lcn4UpIYRaV0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/6] gzip: refactor state tracking
Date: Wed, 17 Apr 2024 10:37:14 -0400
Message-Id: <20240417143716.27189-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240417143716.27189-1-dpsmith@apertussolutions.com>
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move the core state into struct gzip_data to allow a per decompression
instance.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  |  55 +++++++-----
 xen/common/gzip/inflate.c | 174 +++++++++++++++++++-------------------
 2 files changed, 120 insertions(+), 109 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 1b448d6e3655..8178a05a0190 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -4,18 +4,25 @@
 #include <xen/lib.h>
 #include <xen/mm.h>
 
-static unsigned char *__initdata window;
-
 #define WSIZE           0x80000000U
 
-static unsigned char *__initdata inbuf;
-static unsigned int __initdata insize;
+struct gzip_state {
+    unsigned char *window;
+
+    unsigned char *inbuf;
+    unsigned int insize;
+
+    /* Index of next byte to be processed in inbuf: */
+    unsigned int inptr;
 
-/* Index of next byte to be processed in inbuf: */
-static unsigned int __initdata inptr;
+    /* Bytes in output buffer: */
+    unsigned int outcnt;
 
-/* Bytes in output buffer: */
-static unsigned int __initdata outcnt;
+    long bytes_out;
+
+    unsigned long bb;      /* bit buffer */
+    unsigned bk;           /* bits in bit buffer */
+};
 
 #define OF(args)        args
 
@@ -27,7 +34,7 @@ typedef unsigned char   uch;
 typedef unsigned short  ush;
 typedef unsigned long   ulg;
 
-#define get_byte()      (inptr < insize ? inbuf[inptr++] : fill_inbuf())
+#define get_byte()     (s->inptr < s->insize ? s->inbuf[s->inptr++] : fill_inbuf())
 
 /* Diagnostic functions */
 #ifdef DEBUG
@@ -46,8 +53,7 @@ typedef unsigned long   ulg;
 #  define Tracecv(c, x)
 #endif
 
-static long __initdata bytes_out;
-static void flush_window(void);
+static void flush_window(struct gzip_state *s);
 
 static __init void error(const char *x)
 {
@@ -62,7 +68,7 @@ static __init int fill_inbuf(void)
 
 #include "inflate.c"
 
-static __init void flush_window(void)
+static __init void flush_window(struct gzip_state *s)
 {
     /*
      * The window is equal to the output buffer therefore only need to
@@ -72,16 +78,16 @@ static __init void flush_window(void)
     unsigned int n;
     unsigned char *in, ch;
 
-    in = window;
-    for ( n = 0; n < outcnt; n++ )
+    in = s->window;
+    for ( n = 0; n < s->outcnt; n++ )
     {
         ch = *in++;
         c = crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
     }
     crc = c;
 
-    bytes_out += (unsigned long)outcnt;
-    outcnt = 0;
+    s->bytes_out += (unsigned long)s->outcnt;
+    s->outcnt = 0;
 }
 
 __init int gzip_check(char *image, unsigned long image_len)
@@ -99,20 +105,25 @@ __init int gzip_check(char *image, unsigned long image_len)
 
 __init int perform_gunzip(char *output, char *image, unsigned long image_len)
 {
+    struct gzip_state *s;
     int rc;
 
     if ( !gzip_check(image, image_len) )
         return 1;
 
-    window = (unsigned char *)output;
-    inbuf = (unsigned char *)image;
-    insize = image_len;
-    inptr = 0;
-    bytes_out = 0;
+    s = (struct gzip_state *)malloc(sizeof(struct gzip_state));
+    if ( !s )
+        return -ENOMEM;
+
+    s->window = (unsigned char *)output;
+    s->inbuf = (unsigned char *)image;
+    s->insize = image_len;
+    s->inptr = 0;
+    s->bytes_out = 0;
 
     makecrc();
 
-    if ( gunzip() < 0 )
+    if ( gunzip(s) < 0 )
     {
         rc = -EINVAL;
     }
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 512d9bf0ee2e..5735bbcf7eb4 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -119,7 +119,7 @@ static char rcsid[] = "#Id: inflate.c,v 0.14 1993/06/10 13:27:04 jloup Exp #";
 
 #endif /* !__XEN__ */
 
-#define slide window
+#define slide s->window
 
 /*
  * Huffman code lookup table entry--this entry is four bytes for machines
@@ -143,12 +143,12 @@ struct huft {
 static int huft_build OF((unsigned *, unsigned, unsigned,
                           const ush *, const ush *, struct huft **, int *));
 static int huft_free OF((struct huft *));
-static int inflate_codes OF((struct huft *, struct huft *, int, int));
-static int inflate_stored OF((void));
-static int inflate_fixed OF((void));
-static int inflate_dynamic OF((void));
-static int inflate_block OF((int *));
-static int inflate OF((void));
+static int inflate_codes OF((struct gzip_state *, struct huft *, struct huft *, int, int));
+static int inflate_stored OF((struct gzip_state *));
+static int inflate_fixed OF((struct gzip_state *));
+static int inflate_dynamic OF((struct gzip_state *));
+static int inflate_block OF((struct gzip_state *, int *));
+static int inflate OF((struct gzip_state *));
 
 /*
  * The inflate algorithm uses a sliding 32 K byte window on the uncompressed
@@ -162,8 +162,8 @@ static int inflate OF((void));
  * must be in unzip.h, included above.
  */
 /* unsigned wp;             current position in slide */
-#define wp outcnt
-#define flush_output(w) (wp=(w),flush_window())
+#define wp s->outcnt
+#define flush_output(s, w) (wp=(w),flush_window(s))
 
 /* Tables for deflate from PKZIP's appnote.txt. */
 static const unsigned border[] = {    /* Order of the bit length code lengths */
@@ -215,17 +215,14 @@ static const ush cpdext[] = {         /* Extra bits for distance codes */
  * the stream.
  */
 
-static ulg __initdata bb;                /* bit buffer */
-static unsigned __initdata bk;           /* bits in bit buffer */
-
 static const ush mask_bits[] = {
     0x0000,
     0x0001, 0x0003, 0x0007, 0x000f, 0x001f, 0x003f, 0x007f, 0x00ff,
     0x01ff, 0x03ff, 0x07ff, 0x0fff, 0x1fff, 0x3fff, 0x7fff, 0xffff
 };
 
-#define NEXTBYTE()  ({ int v = get_byte(); if (v < 0) goto underrun; (uch)v; })
-#define NEEDBITS(n) {while(k<(n)){b|=((ulg)NEXTBYTE())<<k;k+=8;}}
+#define NEXTBYTE(s)  ({ int v = get_byte(); if (v < 0) goto underrun; (uch)v; })
+#define NEEDBITS(s, n) {while(k<(n)){b|=((ulg)NEXTBYTE(s))<<k;k+=8;}}
 #define DUMPBITS(n) {b>>=(n);k-=(n);}
 
 /*
@@ -548,7 +545,7 @@ static int __init huft_free(struct huft *t)
  * @param bd  Number of bits decoded by td[]
  */
 static int __init inflate_codes(
-    struct huft *tl, struct huft *td, int bl, int bd)
+    struct gzip_state *s, struct huft *tl, struct huft *td, int bl, int bd)
 {
     register unsigned e;  /* table entry flag/number of extra bits */
     unsigned n, d;        /* length and index for copy */
@@ -560,8 +557,8 @@ static int __init inflate_codes(
 
 
     /* make local copies of globals */
-    b = bb;                       /* initialize bit buffer */
-    k = bk;
+    b = s->bb;                   /* initialize bit buffer */
+    k = s->bk;
     w = wp;                       /* initialize window position */
 
     /* inflate the coded data */
@@ -569,14 +566,14 @@ static int __init inflate_codes(
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
-            NEEDBITS(e);
+            NEEDBITS(s, e);
             } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
         DUMPBITS(t->b);
         if (e == 16)                /* then it's a literal */
@@ -585,7 +582,7 @@ static int __init inflate_codes(
             Tracevv((stderr, "%c", slide[w-1]));
             if (w == WSIZE)
             {
-                flush_output(w);
+                flush_output(s, w);
                 w = 0;
             }
         }
@@ -596,22 +593,22 @@ static int __init inflate_codes(
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
@@ -632,7 +629,7 @@ static int __init inflate_codes(
                     } while (--e);
                 if (w == WSIZE)
                 {
-                    flush_output(w);
+                    flush_output(s, w);
                     w = 0;
                 }
             } while (n);
@@ -641,8 +638,8 @@ static int __init inflate_codes(
 
     /* restore the globals from the locals */
     wp = w;                       /* restore global window pointer */
-    bb = b;                       /* restore global bit buffer */
-    bk = k;
+    s->bb = b;                   /* restore global bit buffer */
+    s->bk = k;
 
     /* done */
     return 0;
@@ -652,7 +649,7 @@ static int __init inflate_codes(
 }
 
 /* "decompress" an inflated type 0 (stored) block. */
-static int __init inflate_stored(void)
+static int __init inflate_stored(struct gzip_state *s)
 {
     unsigned n;           /* number of bytes in block */
     unsigned w;           /* current window position */
@@ -662,8 +659,8 @@ static int __init inflate_stored(void)
     DEBG("<stor");
 
     /* make local copies of globals */
-    b = bb;                       /* initialize bit buffer */
-    k = bk;
+    b = s->bb;                   /* initialize bit buffer */
+    k = s->bk;
     w = wp;                       /* initialize window position */
 
 
@@ -673,10 +670,10 @@ static int __init inflate_stored(void)
 
 
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
@@ -684,11 +681,11 @@ static int __init inflate_stored(void)
     /* read and output the compressed data */
     while (n--)
     {
-        NEEDBITS(8);
+        NEEDBITS(s, 8);
         slide[w++] = (uch)b;
         if (w == WSIZE)
         {
-            flush_output(w);
+            flush_output(s, w);
             w = 0;
         }
         DUMPBITS(8);
@@ -696,8 +693,8 @@ static int __init inflate_stored(void)
 
     /* restore the globals from the locals */
     wp = w;                       /* restore global window pointer */
-    bb = b;                       /* restore global bit buffer */
-    bk = k;
+    s->bb = b;                   /* restore global bit buffer */
+    s->bk = k;
 
     DEBG(">");
     return 0;
@@ -716,7 +713,7 @@ static int __init inflate_stored(void)
  * either replace this with a custom decoder, or at least precompute the
  * Huffman tables.
  */
-static int noinline __init inflate_fixed(void)
+static int noinline __init inflate_fixed(struct gzip_state *s)
 {
     int i;                /* temporary variable */
     struct huft *tl;      /* literal/length code table */
@@ -760,7 +757,8 @@ static int noinline __init inflate_fixed(void)
     }
 
     /* decompress until an end-of-block code */
-    if (inflate_codes(tl, td, bl, bd)) {
+    if ( inflate_codes(s, tl, td, bl, bd) )
+    {
         free(l);
         return 1;
     }
@@ -777,7 +775,7 @@ static int noinline __init inflate_fixed(void)
  */
 
 /* decompress an inflated type 2 (dynamic Huffman codes) block. */
-static int noinline __init inflate_dynamic(void)
+static int noinline __init inflate_dynamic(struct gzip_state *s)
 {
     int i;                /* temporary variables */
     unsigned j;
@@ -804,17 +802,17 @@ static int noinline __init inflate_dynamic(void)
         return 1;
 
     /* make local bit buffer */
-    b = bb;
-    k = bk;
+    b = s->bb;
+    k = s->bk;
 
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
@@ -828,7 +826,7 @@ static int noinline __init inflate_dynamic(void)
     /* read in bit-length-code lengths */
     for (j = 0; j < nb; j++)
     {
-        NEEDBITS(3);
+        NEEDBITS(s, 3);
         ll[border[j]] = (unsigned)b & 7;
         DUMPBITS(3);
     }
@@ -855,7 +853,7 @@ static int noinline __init inflate_dynamic(void)
     i = l = 0;
     while ((unsigned)i < n)
     {
-        NEEDBITS((unsigned)bl);
+        NEEDBITS(s, (unsigned)bl);
         j = (td = tl + ((unsigned)b & m))->b;
         DUMPBITS(j);
         j = td->v.n;
@@ -863,7 +861,7 @@ static int noinline __init inflate_dynamic(void)
             ll[i++] = l = j;          /* save last length in l */
         else if (j == 16)           /* repeat last length 3 to 6 times */
         {
-            NEEDBITS(2);
+            NEEDBITS(s, 2);
             j = 3 + ((unsigned)b & 3);
             DUMPBITS(2);
             if ((unsigned)i + j > n) {
@@ -875,7 +873,7 @@ static int noinline __init inflate_dynamic(void)
         }
         else if (j == 17)           /* 3 to 10 zero length codes */
         {
-            NEEDBITS(3);
+            NEEDBITS(s, 3);
             j = 3 + ((unsigned)b & 7);
             DUMPBITS(3);
             if ((unsigned)i + j > n) {
@@ -888,7 +886,7 @@ static int noinline __init inflate_dynamic(void)
         }
         else                        /* j == 18: 11 to 138 zero length codes */
         {
-            NEEDBITS(7);
+            NEEDBITS(s, 7);
             j = 11 + ((unsigned)b & 0x7f);
             DUMPBITS(7);
             if ((unsigned)i + j > n) {
@@ -909,8 +907,8 @@ static int noinline __init inflate_dynamic(void)
     DEBG("dyn5 ");
 
     /* restore the global bit buffer */
-    bb = b;
-    bk = k;
+    s->bb = b;
+    s->bk = k;
 
     DEBG("dyn5a ");
 
@@ -943,7 +941,8 @@ static int noinline __init inflate_dynamic(void)
     DEBG("dyn6 ");
 
       /* decompress until an end-of-block code */
-    if (inflate_codes(tl, td, bl, bd)) {
+    if ( inflate_codes(s, tl, td, bl, bd) )
+    {
         ret = 1;
         goto out;
     }
@@ -968,9 +967,10 @@ static int noinline __init inflate_dynamic(void)
 /*
  * decompress an inflated block
  *
+ * @param s Gzip decompression state
  * @param e Last block flag
  */
-static int __init inflate_block(int *e)
+static int __init inflate_block(struct gzip_state *s, int *e)
 {
     unsigned t;           /* block type */
     register ulg b;       /* bit buffer */
@@ -979,30 +979,30 @@ static int __init inflate_block(int *e)
     DEBG("<blk");
 
     /* make local bit buffer */
-    b = bb;
-    k = bk;
+    b = s->bb;
+    k = s->bk;
 
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
 
     /* restore the global bit buffer */
-    bb = b;
-    bk = k;
+    s->bb = b;
+    s->bk = k;
 
     /* inflate that block type */
     if (t == 2)
-        return inflate_dynamic();
+        return inflate_dynamic(s);
     if (t == 0)
-        return inflate_stored();
+        return inflate_stored(s);
     if (t == 1)
-        return inflate_fixed();
+        return inflate_fixed(s);
 
     DEBG(">");
 
@@ -1014,7 +1014,7 @@ static int __init inflate_block(int *e)
 }
 
 /* decompress an inflated entry */
-static int __init inflate(void)
+static int __init inflate(struct gzip_state *s)
 {
     int e;                /* last block flag */
     int r;                /* result code */
@@ -1022,8 +1022,8 @@ static int __init inflate(void)
 
     /* initialize window, bit buffer */
     wp = 0;
-    bk = 0;
-    bb = 0;
+    s->bk = 0;
+    s->bb = 0;
 
     /* decompress until the last block */
     h = 0;
@@ -1032,7 +1032,7 @@ static int __init inflate(void)
 #ifdef ARCH_HAS_DECOMP_WDOG
         arch_decomp_wdog();
 #endif
-        r = inflate_block(&e);
+        r = inflate_block(s, &e);
         if (r)
             return r;
         if (hufts > h)
@@ -1042,13 +1042,13 @@ static int __init inflate(void)
     /* Undo too much lookahead. The next read will be byte aligned so we
      * can discard unused bits in the last meaningful byte.
      */
-    while (bk >= 8) {
-        bk -= 8;
-        inptr--;
+    while (s->bk >= 8) {
+        s->bk -= 8;
+        s->inptr--;
     }
 
     /* flush out slide */
-    flush_output(wp);
+    flush_output(s, wp);
 
     /* return success */
 #ifdef DEBUG
@@ -1119,7 +1119,7 @@ static void __init makecrc(void)
 /*
  * Do the uncompression!
  */
-static int __init gunzip(void)
+static int __init gunzip(struct gzip_state *s)
 {
     uch flags;
     unsigned char magic[2]; /* magic header */
@@ -1128,9 +1128,9 @@ static int __init gunzip(void)
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
@@ -1157,18 +1157,18 @@ static int __init gunzip(void)
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
 
-    (void)NEXTBYTE();  /* Ignore extra flags for the moment */
-    (void)NEXTBYTE();  /* Ignore OS type for the moment */
+    (void)NEXTBYTE(s);  /* Ignore extra flags for the moment */
+    (void)NEXTBYTE(s);  /* Ignore OS type for the moment */
 
     if ((flags & EXTRA_FIELD) != 0) {
-        unsigned len = (unsigned)NEXTBYTE();
-        len |= ((unsigned)NEXTBYTE())<<8;
-        while (len--) (void)NEXTBYTE();
+        unsigned len = (unsigned)NEXTBYTE(s);
+        len |= ((unsigned)NEXTBYTE(s))<<8;
+        while (len--) (void)NEXTBYTE(s);
     }
 
     /* Get original file name if it was truncated */
@@ -1179,11 +1179,11 @@ static int __init gunzip(void)
 
     /* Discard file comment if any */
     if ((flags & COMMENT) != 0) {
-        while (NEXTBYTE() != 0) /* null */ ;
+        while (NEXTBYTE(s) != 0) /* null */ ;
     }
 
     /* Decompress */
-    if ((res = inflate())) {
+    if ((res = inflate(s))) {
         switch (res) {
         case 0:
             break;
@@ -1224,13 +1224,13 @@ static int __init gunzip(void)
         error("crc error");
         return -1;
     }
-    if (orig_len != bytes_out) {
+    if (orig_len != s->bytes_out) {
         error("length error");
         return -1;
     }
     return 0;
 
- underrun:   /* NEXTBYTE() goto's here if needed */
+ underrun:   /* NEXTBYTE(s) goto's here if needed */
     error("out of input data");
     return -1;
 }
-- 
2.30.2


