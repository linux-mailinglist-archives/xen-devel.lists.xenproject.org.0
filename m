Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC7A8A1899
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704007.1100114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwJl-0003ZB-Lb; Thu, 11 Apr 2024 15:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704007.1100114; Thu, 11 Apr 2024 15:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwJl-0003WX-Hy; Thu, 11 Apr 2024 15:26:25 +0000
Received: by outflank-mailman (input) for mailman id 704007;
 Thu, 11 Apr 2024 15:26:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyOp=LQ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ruwJj-0000Mi-K5
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:26:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d946f07e-f817-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 17:26:22 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1712849132131503.5133015510213;
 Thu, 11 Apr 2024 08:25:32 -0700 (PDT)
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
X-Inumbo-ID: d946f07e-f817-11ee-b908-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; t=1712849134; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=THcYo5pxHWOMGgrMAFLmvAbbxp2fu3ewJ6Mf3Umf3eohD2Ky/6lDdELQj3zDhnknu9mGKZWGLpOE+kgD/4l32pscJMMFS7At32o2c/pEUHUiLtUMuGnISbmJBxaIWNoWZrCwXZTIjWtWL9PYtO3giU085U/1R794AFj6/Fsa02A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712849134; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HYSIEYTwh5p4MTbHEclOqmrjQp9zeCs7GmXlIkw618s=; 
	b=DKW0EdJSc1Uj7OaGhjDokjW3ErW6ym0zlZteCXDTfiMZon5BYJ3MW7mof+SKhj6BZ1Qny3i8PBZWv4a/xUX3azgIB04Z433EXXnVKh6+IdeMtZx3W91PsqB78Um2+eQIaPczdykTlIw5evgRSIxLLren9v9zYgRTUimQCiY6qcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712849134;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=HYSIEYTwh5p4MTbHEclOqmrjQp9zeCs7GmXlIkw618s=;
	b=TXavKt1z9xCBereVl3rq/Y05xDs9m6EoCsqSzDaXSXHpgfzp0f6XtSi0vwi36sre
	EKRzOMueLe58e6ae5914QnegUV6zFRbVMj6rMumO2xI1TOYt4GFUmmepjzMyTe7jDVA
	FIvj3QyVmx/D5hn/YYE35P9D/AVshO9g7FZNRbb8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/5] gzip: refactor state tracking
Date: Thu, 11 Apr 2024 11:25:16 -0400
Message-Id: <20240411152518.2995-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411152518.2995-1-dpsmith@apertussolutions.com>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move the core state into struct gzip_data to allow a per decompression
instance.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  |  50 ++++++-----
 xen/common/gzip/inflate.c | 174 +++++++++++++++++++-------------------
 2 files changed, 116 insertions(+), 108 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 1bcb007395ba..9b4891731b8b 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -6,21 +6,29 @@
 
 #define HEAPORDER 3
 
-static unsigned char *__initdata window;
 #define memptr long
 static memptr __initdata free_mem_ptr;
 static memptr __initdata free_mem_end_ptr;
 
 #define WSIZE           0x80000000U
 
-static unsigned char *__initdata inbuf;
-static unsigned int __initdata insize;
+struct gzip_data {
+    unsigned char *window;
 
-/* Index of next byte to be processed in inbuf: */
-static unsigned int __initdata inptr;
+    unsigned char *inbuf;
+    unsigned int insize;
 
-/* Bytes in output buffer: */
-static unsigned int __initdata outcnt;
+    /* Index of next byte to be processed in inbuf: */
+    unsigned int inptr;
+
+    /* Bytes in output buffer: */
+    unsigned int outcnt;
+
+    long bytes_out;
+
+    unsigned long bb;      /* bit buffer */
+    unsigned bk;           /* bits in bit buffer */
+};
 
 #define OF(args)        args
 
@@ -30,7 +38,7 @@ typedef unsigned char   uch;
 typedef unsigned short  ush;
 typedef unsigned long   ulg;
 
-#define get_byte()      (inptr < insize ? inbuf[inptr++] : fill_inbuf())
+#define get_byte()     (gd->inptr < gd->insize ? gd->inbuf[gd->inptr++] : fill_inbuf())
 
 /* Diagnostic functions */
 #ifdef DEBUG
@@ -49,8 +57,7 @@ typedef unsigned long   ulg;
 #  define Tracecv(c, x)
 #endif
 
-static long __initdata bytes_out;
-static void flush_window(void);
+static void flush_window(struct gzip_data *gd);
 
 static __init void error(const char *x)
 {
@@ -65,7 +72,7 @@ static __init int fill_inbuf(void)
 
 #include "inflate.c"
 
-static __init void flush_window(void)
+static __init void flush_window(struct gzip_data *gd)
 {
     /*
      * The window is equal to the output buffer therefore only need to
@@ -75,16 +82,16 @@ static __init void flush_window(void)
     unsigned int n;
     unsigned char *in, ch;
 
-    in = window;
-    for ( n = 0; n < outcnt; n++ )
+    in = gd->window;
+    for ( n = 0; n < gd->outcnt; n++ )
     {
         ch = *in++;
         c = crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
     }
     crc = c;
 
-    bytes_out += (unsigned long)outcnt;
-    outcnt = 0;
+    gd->bytes_out += (unsigned long)gd->outcnt;
+    gd->outcnt = 0;
 }
 
 __init int gzip_check(char *image, unsigned long image_len)
@@ -102,12 +109,13 @@ __init int gzip_check(char *image, unsigned long image_len)
 
 __init int perform_gunzip(char *output, char *image, unsigned long image_len)
 {
+    struct gzip_data gd;
     int rc;
 
     if ( !gzip_check(image, image_len) )
         return 1;
 
-    window = (unsigned char *)output;
+    gd.window = (unsigned char *)output;
 
     free_mem_ptr = (unsigned long)alloc_xenheap_pages(HEAPORDER, 0);
     if ( !free_mem_ptr )
@@ -116,14 +124,14 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
     free_mem_end_ptr = free_mem_ptr + (PAGE_SIZE << HEAPORDER);
     init_allocator();
 
-    inbuf = (unsigned char *)image;
-    insize = image_len;
-    inptr = 0;
-    bytes_out = 0;
+    gd.inbuf = (unsigned char *)image;
+    gd.insize = image_len;
+    gd.inptr = 0;
+    gd.bytes_out = 0;
 
     makecrc();
 
-    if ( gunzip() < 0 )
+    if ( gunzip(&gd) < 0 )
     {
         rc = -EINVAL;
     }
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index feb6d51008aa..c8dd35962abb 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -119,7 +119,7 @@ static char rcsid[] = "#Id: inflate.c,v 0.14 1993/06/10 13:27:04 jloup Exp #";
 
 #endif /* !__XEN__ */
 
-#define slide window
+#define slide gd->window
 
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
+static int inflate_codes OF((struct gzip_data *, struct huft *, struct huft *, int, int));
+static int inflate_stored OF((struct gzip_data *));
+static int inflate_fixed OF((struct gzip_data *));
+static int inflate_dynamic OF((struct gzip_data *));
+static int inflate_block OF((struct gzip_data *, int *));
+static int inflate OF((struct gzip_data *));
 
 /*
  * The inflate algorithm uses a sliding 32 K byte window on the uncompressed
@@ -162,8 +162,8 @@ static int inflate OF((void));
  * must be in unzip.h, included above.
  */
 /* unsigned wp;             current position in slide */
-#define wp outcnt
-#define flush_output(w) (wp=(w),flush_window())
+#define wp gd->outcnt
+#define flush_output(gd, w) (wp=(w),flush_window(gd))
 
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
+#define NEXTBYTE(gd)  ({ int v = get_byte(); if (v < 0) goto underrun; (uch)v; })
+#define NEEDBITS(gd, n) {while(k<(n)){b|=((ulg)NEXTBYTE(gd))<<k;k+=8;}}
 #define DUMPBITS(n) {b>>=(n);k-=(n);}
 
 #ifndef NO_INFLATE_MALLOC
@@ -595,7 +592,7 @@ static int __init huft_free(struct huft *t)
  * @param bd  Number of bits decoded by td[]
  */
 static int __init inflate_codes(
-    struct huft *tl, struct huft *td, int bl, int bd)
+    struct gzip_data *gd, struct huft *tl, struct huft *td, int bl, int bd)
 {
     register unsigned e;  /* table entry flag/number of extra bits */
     unsigned n, d;        /* length and index for copy */
@@ -607,8 +604,8 @@ static int __init inflate_codes(
 
 
     /* make local copies of globals */
-    b = bb;                       /* initialize bit buffer */
-    k = bk;
+    b = gd->bb;                   /* initialize bit buffer */
+    k = gd->bk;
     w = wp;                       /* initialize window position */
 
     /* inflate the coded data */
@@ -616,14 +613,14 @@ static int __init inflate_codes(
     md = mask_bits[bd];
     for (;;)                      /* do until end of block */
     {
-        NEEDBITS((unsigned)bl)
+        NEEDBITS(gd, (unsigned)bl)
         if ((e = (t = tl + ((unsigned)b & ml))->e) > 16)
             do {
             if (e == 99)
                 return 1;
             DUMPBITS(t->b)
             e -= 16;
-            NEEDBITS(e)
+            NEEDBITS(gd, e)
             } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
         DUMPBITS(t->b)
         if (e == 16)                /* then it's a literal */
@@ -632,7 +629,7 @@ static int __init inflate_codes(
             Tracevv((stderr, "%c", slide[w-1]));
             if (w == WSIZE)
             {
-                flush_output(w);
+                flush_output(gd, w);
                 w = 0;
             }
         }
@@ -643,22 +640,22 @@ static int __init inflate_codes(
                 break;
 
             /* get length of block to copy */
-            NEEDBITS(e)
+            NEEDBITS(gd, e)
             n = t->v.n + ((unsigned)b & mask_bits[e]);
             DUMPBITS(e);
 
             /* decode distance of block to copy */
-            NEEDBITS((unsigned)bd)
+            NEEDBITS(gd, (unsigned)bd)
             if ((e = (t = td + ((unsigned)b & md))->e) > 16)
                 do {
                     if (e == 99)
                         return 1;
                     DUMPBITS(t->b)
                     e -= 16;
-                    NEEDBITS(e)
+                    NEEDBITS(gd, e)
                 } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
             DUMPBITS(t->b)
-            NEEDBITS(e)
+            NEEDBITS(gd, e)
             d = w - t->v.n - ((unsigned)b & mask_bits[e]);
             DUMPBITS(e)
             Tracevv((stderr,"\\[%d,%d]", w-d, n));
@@ -681,7 +678,7 @@ static int __init inflate_codes(
                     } while (--e);
                 if (w == WSIZE)
                 {
-                    flush_output(w);
+                    flush_output(gd, w);
                     w = 0;
                 }
             } while (n);
@@ -690,8 +687,8 @@ static int __init inflate_codes(
 
     /* restore the globals from the locals */
     wp = w;                       /* restore global window pointer */
-    bb = b;                       /* restore global bit buffer */
-    bk = k;
+    gd->bb = b;                   /* restore global bit buffer */
+    gd->bk = k;
 
     /* done */
     return 0;
@@ -701,7 +698,7 @@ static int __init inflate_codes(
 }
 
 /* "decompress" an inflated type 0 (stored) block. */
-static int __init inflate_stored(void)
+static int __init inflate_stored(struct gzip_data *gd)
 {
     unsigned n;           /* number of bytes in block */
     unsigned w;           /* current window position */
@@ -711,8 +708,8 @@ static int __init inflate_stored(void)
     DEBG("<stor");
 
     /* make local copies of globals */
-    b = bb;                       /* initialize bit buffer */
-    k = bk;
+    b = gd->bb;                   /* initialize bit buffer */
+    k = gd->bk;
     w = wp;                       /* initialize window position */
 
 
@@ -722,10 +719,10 @@ static int __init inflate_stored(void)
 
 
     /* get the length and its complement */
-    NEEDBITS(16)
+    NEEDBITS(gd, 16)
     n = ((unsigned)b & 0xffff);
     DUMPBITS(16)
-    NEEDBITS(16)
+    NEEDBITS(gd, 16)
     if (n != (unsigned)((~b) & 0xffff))
         return 1;                   /* error in compressed data */
     DUMPBITS(16)
@@ -733,11 +730,11 @@ static int __init inflate_stored(void)
     /* read and output the compressed data */
     while (n--)
     {
-        NEEDBITS(8)
+        NEEDBITS(gd, 8)
         slide[w++] = (uch)b;
         if (w == WSIZE)
         {
-            flush_output(w);
+            flush_output(gd, w);
             w = 0;
         }
         DUMPBITS(8)
@@ -745,8 +742,8 @@ static int __init inflate_stored(void)
 
     /* restore the globals from the locals */
     wp = w;                       /* restore global window pointer */
-    bb = b;                       /* restore global bit buffer */
-    bk = k;
+    gd->bb = b;                   /* restore global bit buffer */
+    gd->bk = k;
 
     DEBG(">");
     return 0;
@@ -765,7 +762,7 @@ static int __init inflate_stored(void)
  * either replace this with a custom decoder, or at least precompute the
  * Huffman tables.
  */
-static int noinline __init inflate_fixed(void)
+static int noinline __init inflate_fixed(struct gzip_data *gd)
 {
     int i;                /* temporary variable */
     struct huft *tl;      /* literal/length code table */
@@ -809,7 +806,8 @@ static int noinline __init inflate_fixed(void)
     }
 
     /* decompress until an end-of-block code */
-    if (inflate_codes(tl, td, bl, bd)) {
+    if ( inflate_codes(gd, tl, td, bl, bd) )
+    {
         free(l);
         return 1;
     }
@@ -826,7 +824,7 @@ static int noinline __init inflate_fixed(void)
  */
 
 /* decompress an inflated type 2 (dynamic Huffman codes) block. */
-static int noinline __init inflate_dynamic(void)
+static int noinline __init inflate_dynamic(struct gzip_data *gd)
 {
     int i;                /* temporary variables */
     unsigned j;
@@ -857,17 +855,17 @@ static int noinline __init inflate_dynamic(void)
         return 1;
 
     /* make local bit buffer */
-    b = bb;
-    k = bk;
+    b = gd->bb;
+    k = gd->bk;
 
     /* read in table lengths */
-    NEEDBITS(5)
+    NEEDBITS(gd, 5)
     nl = 257 + ((unsigned)b & 0x1f);      /* number of literal/length codes */
     DUMPBITS(5)
-    NEEDBITS(5)
+    NEEDBITS(gd, 5)
     nd = 1 + ((unsigned)b & 0x1f);        /* number of distance codes */
     DUMPBITS(5)
-    NEEDBITS(4)
+    NEEDBITS(gd, 4)
     nb = 4 + ((unsigned)b & 0xf);         /* number of bit length codes */
     DUMPBITS(4)
 #ifdef PKZIP_BUG_WORKAROUND
@@ -885,7 +883,7 @@ static int noinline __init inflate_dynamic(void)
     /* read in bit-length-code lengths */
     for (j = 0; j < nb; j++)
     {
-        NEEDBITS(3)
+        NEEDBITS(gd, 3)
         ll[border[j]] = (unsigned)b & 7;
         DUMPBITS(3)
     }
@@ -912,7 +910,7 @@ static int noinline __init inflate_dynamic(void)
     i = l = 0;
     while ((unsigned)i < n)
     {
-        NEEDBITS((unsigned)bl)
+        NEEDBITS(gd, (unsigned)bl)
         j = (td = tl + ((unsigned)b & m))->b;
         DUMPBITS(j)
         j = td->v.n;
@@ -920,7 +918,7 @@ static int noinline __init inflate_dynamic(void)
             ll[i++] = l = j;          /* save last length in l */
         else if (j == 16)           /* repeat last length 3 to 6 times */
         {
-            NEEDBITS(2)
+            NEEDBITS(gd, 2)
             j = 3 + ((unsigned)b & 3);
             DUMPBITS(2)
             if ((unsigned)i + j > n) {
@@ -932,7 +930,7 @@ static int noinline __init inflate_dynamic(void)
         }
         else if (j == 17)           /* 3 to 10 zero length codes */
         {
-            NEEDBITS(3)
+            NEEDBITS(gd, 3)
             j = 3 + ((unsigned)b & 7);
             DUMPBITS(3)
             if ((unsigned)i + j > n) {
@@ -945,7 +943,7 @@ static int noinline __init inflate_dynamic(void)
         }
         else                        /* j == 18: 11 to 138 zero length codes */
         {
-            NEEDBITS(7)
+            NEEDBITS(gd, 7)
             j = 11 + ((unsigned)b & 0x7f);
             DUMPBITS(7)
             if ((unsigned)i + j > n) {
@@ -966,8 +964,8 @@ static int noinline __init inflate_dynamic(void)
     DEBG("dyn5 ");
 
     /* restore the global bit buffer */
-    bb = b;
-    bk = k;
+    gd->bb = b;
+    gd->bk = k;
 
     DEBG("dyn5a ");
 
@@ -1005,7 +1003,8 @@ static int noinline __init inflate_dynamic(void)
     DEBG("dyn6 ");
 
       /* decompress until an end-of-block code */
-    if (inflate_codes(tl, td, bl, bd)) {
+    if ( inflate_codes(gd, tl, td, bl, bd) )
+    {
         ret = 1;
         goto out;
     }
@@ -1030,9 +1029,10 @@ static int noinline __init inflate_dynamic(void)
 /*
  * decompress an inflated block
  *
+ * @param gd Gzip decompression state
  * @param e Last block flag
  */
-static int __init inflate_block(int *e)
+static int __init inflate_block(struct gzip_data *gd, int *e)
 {
     unsigned t;           /* block type */
     register ulg b;       /* bit buffer */
@@ -1041,30 +1041,30 @@ static int __init inflate_block(int *e)
     DEBG("<blk");
 
     /* make local bit buffer */
-    b = bb;
-    k = bk;
+    b = gd->bb;
+    k = gd->bk;
 
     /* read in last block bit */
-    NEEDBITS(1)
+    NEEDBITS(gd, 1)
     *e = (int)b & 1;
     DUMPBITS(1)
 
     /* read in block type */
-    NEEDBITS(2)
+    NEEDBITS(gd, 2)
     t = (unsigned)b & 3;
     DUMPBITS(2)
 
     /* restore the global bit buffer */
-    bb = b;
-    bk = k;
+    gd->bb = b;
+    gd->bk = k;
 
     /* inflate that block type */
     if (t == 2)
-        return inflate_dynamic();
+        return inflate_dynamic(gd);
     if (t == 0)
-        return inflate_stored();
+        return inflate_stored(gd);
     if (t == 1)
-        return inflate_fixed();
+        return inflate_fixed(gd);
 
     DEBG(">");
 
@@ -1076,7 +1076,7 @@ static int __init inflate_block(int *e)
 }
 
 /* decompress an inflated entry */
-static int __init inflate(void)
+static int __init inflate(struct gzip_data *gd)
 {
     int e;                /* last block flag */
     int r;                /* result code */
@@ -1084,8 +1084,8 @@ static int __init inflate(void)
 
     /* initialize window, bit buffer */
     wp = 0;
-    bk = 0;
-    bb = 0;
+    gd->bk = 0;
+    gd->bb = 0;
 
     /* decompress until the last block */
     h = 0;
@@ -1094,7 +1094,7 @@ static int __init inflate(void)
 #ifdef ARCH_HAS_DECOMP_WDOG
         arch_decomp_wdog();
 #endif
-        r = inflate_block(&e);
+        r = inflate_block(gd, &e);
         if (r)
             return r;
         if (hufts > h)
@@ -1104,13 +1104,13 @@ static int __init inflate(void)
     /* Undo too much lookahead. The next read will be byte aligned so we
      * can discard unused bits in the last meaningful byte.
      */
-    while (bk >= 8) {
-        bk -= 8;
-        inptr--;
+    while (gd->bk >= 8) {
+        gd->bk -= 8;
+        gd->inptr--;
     }
 
     /* flush out slide */
-    flush_output(wp);
+    flush_output(gd, wp);
 
     /* return success */
 #ifdef DEBUG
@@ -1181,7 +1181,7 @@ static void __init makecrc(void)
 /*
  * Do the uncompression!
  */
-static int __init gunzip(void)
+static int __init gunzip(struct gzip_data *gd)
 {
     uch flags;
     unsigned char magic[2]; /* magic header */
@@ -1190,9 +1190,9 @@ static int __init gunzip(void)
     ulg orig_len = 0;       /* original uncompressed length */
     int res;
 
-    magic[0] = NEXTBYTE();
-    magic[1] = NEXTBYTE();
-    method   = NEXTBYTE();
+    magic[0] = NEXTBYTE(gd);
+    magic[1] = NEXTBYTE(gd);
+    method   = NEXTBYTE(gd);
 
     if (magic[0] != 037 ||                            /* octal-ok */
         ((magic[1] != 0213) && (magic[1] != 0236))) { /* octal-ok */
@@ -1219,18 +1219,18 @@ static int __init gunzip(void)
         error("Input has invalid flags");
         return -1;
     }
-    NEXTBYTE(); /* Get timestamp */
-    NEXTBYTE();
-    NEXTBYTE();
-    NEXTBYTE();
+    NEXTBYTE(gd); /* Get timestamp */
+    NEXTBYTE(gd);
+    NEXTBYTE(gd);
+    NEXTBYTE(gd);
 
-    (void)NEXTBYTE();  /* Ignore extra flags for the moment */
-    (void)NEXTBYTE();  /* Ignore OS type for the moment */
+    (void)NEXTBYTE(gd);  /* Ignore extra flags for the moment */
+    (void)NEXTBYTE(gd);  /* Ignore OS type for the moment */
 
     if ((flags & EXTRA_FIELD) != 0) {
-        unsigned len = (unsigned)NEXTBYTE();
-        len |= ((unsigned)NEXTBYTE())<<8;
-        while (len--) (void)NEXTBYTE();
+        unsigned len = (unsigned)NEXTBYTE(gd);
+        len |= ((unsigned)NEXTBYTE(gd))<<8;
+        while (len--) (void)NEXTBYTE(gd);
     }
 
     /* Get original file name if it was truncated */
@@ -1241,11 +1241,11 @@ static int __init gunzip(void)
 
     /* Discard file comment if any */
     if ((flags & COMMENT) != 0) {
-        while (NEXTBYTE() != 0) /* null */ ;
+        while (NEXTBYTE(gd) != 0) /* null */ ;
     }
 
     /* Decompress */
-    if ((res = inflate())) {
+    if ((res = inflate(gd))) {
         switch (res) {
         case 0:
             break;
@@ -1286,13 +1286,13 @@ static int __init gunzip(void)
         error("crc error");
         return -1;
     }
-    if (orig_len != bytes_out) {
+    if (orig_len != gd->bytes_out) {
         error("length error");
         return -1;
     }
     return 0;
 
- underrun:   /* NEXTBYTE() goto's here if needed */
+ underrun:   /* NEXTBYTE(gd) goto's here if needed */
     error("out of input data");
     return -1;
 }
-- 
2.30.2


