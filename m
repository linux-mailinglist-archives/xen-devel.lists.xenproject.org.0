Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9778B0FF9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711545.1111587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfan-0004y9-1b; Wed, 24 Apr 2024 16:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711545.1111587; Wed, 24 Apr 2024 16:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfam-0004vH-Uz; Wed, 24 Apr 2024 16:35:32 +0000
Received: by outflank-mailman (input) for mailman id 711545;
 Wed, 24 Apr 2024 16:35:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfal-0003bR-Eu
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:35:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a897eead-0258-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 18:35:29 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713976476276561.9093003138563;
 Wed, 24 Apr 2024 09:34:36 -0700 (PDT)
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
X-Inumbo-ID: a897eead-0258-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713976477; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XSRWgXeRHwnWQP9qmAKL4FcG0DlSTRYATjhBBBDlrBwlKMfsMBNC1whOTW8RR6Xh/vzXKgE8U5qOcdetU4SU0VZ0N+udc4VAdugHAD2PfAtcyKv65PMKnY8V1ZOX1eybe1GBBDXrpNTSpxuL6JfWl+250YPGhau3K4Jg8981wFI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713976477; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xNCMPIahaRQM7vl9VJ2rJaGp4FvNjIMBK+7wegbCWvw=; 
	b=h6aRytdpyeY3mZPCQnTrjFDYUO0UWNTYmsMXj7eUVHW1wcgepONgQOiA1QsPQ9VU9nMnjihbmne+uoyVPHZwu3gikyNAUGJS9A9Yf9yUNwXssepPa/9MtPXxEacgTSW4Z65UgQhqgPNZtCm5UC2R3S18cFhohweKxRDOvLx+lSM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713976477;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=xNCMPIahaRQM7vl9VJ2rJaGp4FvNjIMBK+7wegbCWvw=;
	b=rvbnmhUGfLPhu+DUApf2F6cVglxHMM5Oyi3bOW54GandEwTHdZtsQuHtmnuSgSPN
	1Ex09Dye3hw1FiPEv/PlQDNmRyp2Yva9C1Zt5froIO76p+BBOKuC8L/V2k2mMtButJi
	OG1R1ze0aKbN0axl+ARMnEt74AcL2LCkXK4eXraM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/8] gzip: refactor the gunzip window into common state
Date: Wed, 24 Apr 2024 12:34:17 -0400
Message-Id: <20240424163422.23276-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Begin moving core state, in this case the gunzip window, into struct
gunzip_state to allow a per decompression instance. In doing so, drop the
define aliasing of window to slide.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  | 21 ++++++++----
 xen/common/gzip/inflate.c | 68 +++++++++++++++++++--------------------
 2 files changed, 48 insertions(+), 41 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index b7cadadcca8b..e47f10ae19ad 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -4,10 +4,12 @@
 #include <xen/lib.h>
 #include <xen/mm.h>
 
-static unsigned char *__initdata window;
-
 #define WSIZE           0x80000000U
 
+struct gunzip_state {
+    unsigned char *window;
+};
+
 static unsigned char *__initdata inbuf;
 static unsigned int __initdata insize;
 
@@ -43,7 +45,7 @@ typedef unsigned long   ulg;
 #endif
 
 static long __initdata bytes_out;
-static void flush_window(void);
+static void flush_window(struct gunzip_state *s);
 
 static __init void error(const char *x)
 {
@@ -62,7 +64,7 @@ static __init uch get_byte(void) {
 
 #include "inflate.c"
 
-static __init void flush_window(void)
+static __init void flush_window(struct gunzip_state *s)
 {
     /*
      * The window is equal to the output buffer therefore only need to
@@ -72,7 +74,7 @@ static __init void flush_window(void)
     unsigned int n;
     unsigned char *in, ch;
 
-    in = window;
+    in = s->window;
     for ( n = 0; n < outcnt; n++ )
     {
         ch = *in++;
@@ -99,12 +101,17 @@ __init int gzip_check(char *image, unsigned long image_len)
 
 __init int perform_gunzip(char *output, char *image, unsigned long image_len)
 {
+    struct gunzip_state *s;
     int rc;
 
     if ( !gzip_check(image, image_len) )
         return 1;
 
-    window = (unsigned char *)output;
+    s = (struct gunzip_state *)malloc(sizeof(struct gunzip_state));
+    if ( !s )
+        return -ENOMEM;
+
+    s->window = (unsigned char *)output;
     inbuf = (unsigned char *)image;
     insize = image_len;
     inptr = 0;
@@ -112,7 +119,7 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
 
     makecrc();
 
-    if ( gunzip() < 0 )
+    if ( gunzip(s) < 0 )
     {
         rc = -EINVAL;
     }
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 02a395aeb86a..5fa5c039c6d1 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -126,12 +126,11 @@ static char rcsid[] = "#Id: inflate.c,v 0.14 1993/06/10 13:27:04 jloup Exp #";
  * ANDing with 0x7fff (32K-1).
  *
  * It is left to other modules to supply the 32 K area.  It is assumed
- * to be usable as if it were declared "uch slide[32768];" or as just
- * "uch *slide;" and then malloc'ed in the latter case.  The definition
+ * to be usable as if it were declared "uch window[32768];" or as just
+ * "uch *window;" and then malloc'ed in the latter case.  The definition
  * must be in unzip.h, included above.
  */
 #define wp outcnt
-#define slide window
 
 /*
  * Huffman code lookup table entry--this entry is four bytes for machines
@@ -155,12 +154,13 @@ struct huft {
 static int huft_build(unsigned *, unsigned, unsigned,
                       const ush *, const ush *, struct huft **, int *);
 static int huft_free(struct huft *);
-static int inflate_codes(struct huft *, struct huft *, int, int);
-static int inflate_stored(void);
-static int inflate_fixed(void);
-static int inflate_dynamic(void);
-static int inflate_block(int *);
-static int inflate(void);
+static int inflate_codes(
+    struct gunzip_state *, struct huft *, struct huft *, int, int);
+static int inflate_stored(struct gunzip_state *s);
+static int inflate_fixed(struct gunzip_state *s);
+static int inflate_dynamic(struct gunzip_state *s);
+static int inflate_block(struct gunzip_state *, int *);
+static int inflate(struct gunzip_state *s);
 
 /* Tables for deflate from PKZIP's appnote.txt. */
 static const unsigned border[] = {    /* Order of the bit length code lengths */
@@ -542,7 +542,7 @@ static int __init huft_free(struct huft *t)
  * @param bd  Number of bits decoded by td[]
  */
 static int __init inflate_codes(
-    struct huft *tl, struct huft *td, int bl, int bd)
+    struct gunzip_state *s, struct huft *tl, struct huft *td, int bl, int bd)
 {
     register unsigned e;  /* table entry flag/number of extra bits */
     unsigned n, d;        /* length and index for copy */
@@ -575,12 +575,12 @@ static int __init inflate_codes(
         DUMPBITS(t->b);
         if (e == 16)                /* then it's a literal */
         {
-            slide[w++] = (uch)t->v.n;
-            Tracevv((stderr, "%c", slide[w-1]));
+            s->window[w++] = (uch)t->v.n;
+            Tracevv((stderr, "%c", s->window[w-1]));
             if (w == WSIZE)
             {
                 wp = w;
-                flush_window();
+                flush_window(s);
                 w = 0;
             }
         }
@@ -616,19 +616,19 @@ static int __init inflate_codes(
                 n -= (e = (e = WSIZE - ((d &= WSIZE-1) > w ? d : w)) > n ? n : e);
                 if (w - d >= e)         /* (this test assumes unsigned comparison) */
                 {
-                    memcpy(slide + w, slide + d, e);
+                    memcpy(s->window + w, s->window + d, e);
                     w += e;
                     d += e;
                 }
                 else                      /* do it slow to avoid memcpy() overlap */
                     do {
-                        slide[w++] = slide[d++];
-                        Tracevv((stderr, "%c", slide[w-1]));
+                        s->window[w++] = s->window[d++];
+                        Tracevv((stderr, "%c", s->window[w-1]));
                     } while (--e);
                 if (w == WSIZE)
                 {
                     wp = w;
-                    flush_window();
+                    flush_window(s);
                     w = 0;
                 }
             } while (n);
@@ -645,7 +645,7 @@ static int __init inflate_codes(
 }
 
 /* "decompress" an inflated type 0 (stored) block. */
-static int __init inflate_stored(void)
+static int __init inflate_stored(struct gunzip_state *s)
 {
     unsigned n;           /* number of bytes in block */
     unsigned w;           /* current window position */
@@ -678,11 +678,11 @@ static int __init inflate_stored(void)
     while (n--)
     {
         NEEDBITS(8);
-        slide[w++] = (uch)b;
+        s->window[w++] = (uch)b;
         if (w == WSIZE)
         {
             wp = w;
-            flush_window();
+            flush_window(s);
             w = 0;
         }
         DUMPBITS(8);
@@ -707,7 +707,7 @@ static int __init inflate_stored(void)
  * either replace this with a custom decoder, or at least precompute the
  * Huffman tables.
  */
-static int noinline __init inflate_fixed(void)
+static int noinline __init inflate_fixed(struct gunzip_state *s)
 {
     int i;                /* temporary variable */
     struct huft *tl;      /* literal/length code table */
@@ -751,7 +751,7 @@ static int noinline __init inflate_fixed(void)
     }
 
     /* decompress until an end-of-block code */
-    if (inflate_codes(tl, td, bl, bd)) {
+    if (inflate_codes(s, tl, td, bl, bd)) {
         free(l);
         return 1;
     }
@@ -768,7 +768,7 @@ static int noinline __init inflate_fixed(void)
  */
 
 /* decompress an inflated type 2 (dynamic Huffman codes) block. */
-static int noinline __init inflate_dynamic(void)
+static int noinline __init inflate_dynamic(struct gunzip_state *s)
 {
     int i;                /* temporary variables */
     unsigned j;
@@ -934,7 +934,7 @@ static int noinline __init inflate_dynamic(void)
     DEBG("dyn6 ");
 
     /* decompress until an end-of-block code */
-    if (inflate_codes(tl, td, bl, bd)) {
+    if (inflate_codes(s, tl, td, bl, bd)) {
         ret = 1;
         goto out;
     }
@@ -957,7 +957,7 @@ static int noinline __init inflate_dynamic(void)
  *
  * @param e Last block flag
  */
-static int __init inflate_block(int *e)
+static int __init inflate_block(struct gunzip_state *s, int *e)
 {
     unsigned t;           /* block type */
     register ulg b;       /* bit buffer */
@@ -985,11 +985,11 @@ static int __init inflate_block(int *e)
 
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
 
@@ -998,7 +998,7 @@ static int __init inflate_block(int *e)
 }
 
 /* decompress an inflated entry */
-static int __init inflate(void)
+static int __init inflate(struct gunzip_state *s)
 {
     int e;                /* last block flag */
     int r;                /* result code */
@@ -1010,7 +1010,7 @@ static int __init inflate(void)
 
     /* decompress until the last block */
     do {
-        r = inflate_block(&e);
+        r = inflate_block(s, &e);
         if (r)
             return r;
     } while (!e);
@@ -1023,8 +1023,8 @@ static int __init inflate(void)
         inptr--;
     }
 
-    /* flush out slide */
-    flush_window();
+    /* flush out window */
+    flush_window(s);
 
     /* return success */
     return 0;
@@ -1092,7 +1092,7 @@ static void __init makecrc(void)
 /*
  * Do the uncompression!
  */
-static int __init gunzip(void)
+static int __init gunzip(struct gunzip_state *s)
 {
     uch flags;
     unsigned char magic[2]; /* magic header */
@@ -1156,7 +1156,7 @@ static int __init gunzip(void)
     }
 
     /* Decompress */
-    if ((res = inflate())) {
+    if ((res = inflate(s))) {
         switch (res) {
         case 0:
             break;
-- 
2.30.2


