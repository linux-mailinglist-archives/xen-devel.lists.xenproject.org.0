Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17475510E8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352434.579267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRa-0004UN-VL; Mon, 20 Jun 2022 07:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352434.579267; Mon, 20 Jun 2022 07:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRa-0004Qt-Po; Mon, 20 Jun 2022 07:03:30 +0000
Received: by outflank-mailman (input) for mailman id 352434;
 Mon, 20 Jun 2022 07:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRZ-0001Yx-8h
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 155e3588-f067-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:03:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 624C61042;
 Mon, 20 Jun 2022 00:03:27 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA7A93F5A1;
 Mon, 20 Jun 2022 00:03:24 -0700 (PDT)
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
X-Inumbo-ID: 155e3588-f067-11ec-b725-ed86ccbb4733
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 8/9] common/inflate: Use explicitly specified types
Date: Mon, 20 Jun 2022 09:02:44 +0200
Message-Id: <20220620070245.77979-9-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MISRA C 2012 Rule 8.1, types shall be explicitly
specified. Fix all the findings reported by cppcheck with misra addon
by substituting implicit type 'unsigned' to explicit 'unsigned int'.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
This patch may not be applicable as inflate comes from Linux.
---
 xen/common/inflate.c | 166 +++++++++++++++++++++----------------------
 1 file changed, 83 insertions(+), 83 deletions(-)

diff --git a/xen/common/inflate.c b/xen/common/inflate.c
index 8fa4b96d12..71616ff60c 100644
--- a/xen/common/inflate.c
+++ b/xen/common/inflate.c
@@ -138,7 +138,7 @@ struct huft {
 
 
 /* Function prototypes */
-static int huft_build OF((unsigned *, unsigned, unsigned,
+static int huft_build OF((unsigned int *, unsigned int, unsigned int,
                           const ush *, const ush *, struct huft **, int *));
 static int huft_free OF((struct huft *));
 static int inflate_codes OF((struct huft *, struct huft *, int, int));
@@ -162,20 +162,20 @@ static int inflate OF((void));
 #define flush_output(w) (wp=(w),flush_window())
 
 /* Tables for deflate from PKZIP's appnote.txt. */
-static const unsigned border[] = {    /* Order of the bit length code lengths */
+static const unsigned int border[] = { /* Order of the bit length code lengths */
     16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15};
-static const ush cplens[] = {         /* Copy lengths for literal codes 257..285 */
+static const ush cplens[] = {          /* Copy lengths for literal codes 257..285 */
     3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 17, 19, 23, 27, 31,
     35, 43, 51, 59, 67, 83, 99, 115, 131, 163, 195, 227, 258, 0, 0};
 /* note: see note #13 above about the 258 in this list. */
-static const ush cplext[] = {         /* Extra bits for literal codes 257..285 */
+static const ush cplext[] = {          /* Extra bits for literal codes 257..285 */
     0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2,
     3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0, 99, 99}; /* 99==invalid */
-static const ush cpdist[] = {         /* Copy offsets for distance codes 0..29 */
+static const ush cpdist[] = {          /* Copy offsets for distance codes 0..29 */
     1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193,
     257, 385, 513, 769, 1025, 1537, 2049, 3073, 4097, 6145,
     8193, 12289, 16385, 24577};
-static const ush cpdext[] = {         /* Extra bits for distance codes */
+static const ush cpdext[] = {          /* Extra bits for distance codes */
     0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6,
     7, 7, 8, 8, 9, 9, 10, 10, 11, 11,
     12, 12, 13, 13};
@@ -213,7 +213,7 @@ static const ush cpdext[] = {         /* Extra bits for distance codes */
  */
 
 static ulg __initdata bb;                /* bit buffer */
-static unsigned __initdata bk;           /* bits in bit buffer */
+static unsigned int __initdata bk;       /* bits in bit buffer */
 
 static const ush mask_bits[] = {
     0x0000,
@@ -313,13 +313,13 @@ static const int dbits = 6;          /* bits in base distance lookup table */
 #define N_MAX 288       /* maximum number of codes in any set */
 
 
-static unsigned __initdata hufts;      /* track memory usage */
+static unsigned int __initdata hufts;      /* track memory usage */
 
 
 static int __init huft_build(
-    unsigned *b,            /* code lengths in bits (all assumed <= BMAX) */
-    unsigned n,             /* number of codes (assumed <= N_MAX) */
-    unsigned s,             /* number of simple-valued codes (0..s-1) */
+    unsigned int *b,        /* code lengths in bits (all assumed <= BMAX) */
+    unsigned int n,         /* number of codes (assumed <= N_MAX) */
+    unsigned int s,         /* number of simple-valued codes (0..s-1) */
     const ush *d,           /* list of base values for non-simple codes */
     const ush *e,           /* list of extra bits for non-simple codes */
     struct huft **t,        /* result: starting table */
@@ -331,28 +331,28 @@ static int __init huft_build(
    case), two if the input is invalid (all zero length codes or an
    oversubscribed set of lengths), and three if not enough memory. */
 {
-    unsigned a;                   /* counter for codes of length k */
-    unsigned f;                   /* i repeats in table every f entries */
+    unsigned int a;               /* counter for codes of length k */
+    unsigned int f;               /* i repeats in table every f entries */
     int g;                        /* maximum code length */
     int h;                        /* table level */
-    register unsigned i;          /* counter, current code */
-    register unsigned j;          /* counter */
+    register unsigned int i;      /* counter, current code */
+    register unsigned int j;      /* counter */
     register int k;               /* number of bits in current code */
     int l;                        /* bits per table (returned in m) */
-    register unsigned *p;         /* pointer into c[], b[], or v[] */
+    register unsigned int *p;     /* pointer into c[], b[], or v[] */
     register struct huft *q;      /* points to current table */
     struct huft r;                /* table entry for structure assignment */
     register int w;               /* bits before this table == (l * h) */
-    unsigned *xp;                 /* pointer into x */
+    unsigned int *xp;             /* pointer into x */
     int y;                        /* number of dummy codes added */
-    unsigned z;                   /* number of entries in current table */
+    unsigned int z;               /* number of entries in current table */
     struct {
-        unsigned c[BMAX+1];           /* bit length count table */
-        struct huft *u[BMAX];         /* table stack */
-        unsigned v[N_MAX];            /* values in order of bit length */
-        unsigned x[BMAX+1];           /* bit offsets, then code stack */
+        unsigned int c[BMAX+1];   /* bit length count table */
+        struct huft *u[BMAX];     /* table stack */
+        unsigned int v[N_MAX];    /* values in order of bit length */
+        unsigned int x[BMAX+1];   /* bit offsets, then code stack */
     } *stk;
-    unsigned *c, *v, *x;
+    unsigned int *c, *v, *x;
     struct huft **u;
     int ret;
 
@@ -392,13 +392,13 @@ static int __init huft_build(
         if (c[j])
             break;
     k = j;                        /* minimum code length */
-    if ((unsigned)l < j)
+    if ((unsigned int)l < j)
         l = j;
     for (i = BMAX; i; i--)
         if (c[i])
             break;
     g = i;                        /* maximum code length */
-    if ((unsigned)l > i)
+    if ((unsigned int)l > i)
         l = i;
     *m = l;
 
@@ -464,7 +464,7 @@ static int __init huft_build(
                 w += l;                 /* previous table always l bits */
 
                 /* compute minimum size table less than or equal to l bits */
-                z = (z = g - w) > (unsigned)l ? l : z;  /* upper limit on table size */
+                z = (z = g - w) > (unsigned int)l ? l : z;  /* upper limit on table size */
                 if ((f = 1 << (j = k - w)) > a + 1)     /* try a k-w bit table */
                 {                       /* too few codes for k-w bit table */
                     DEBG1("2 ");
@@ -592,13 +592,13 @@ static int __init inflate_codes(
 /* inflate (decompress) the codes in a deflated (compressed) block.
    Return an error code or zero if it all goes ok. */
 {
-    register unsigned e;  /* table entry flag/number of extra bits */
-    unsigned n, d;        /* length and index for copy */
-    unsigned w;           /* current window position */
-    struct huft *t;       /* pointer to table entry */
-    unsigned ml, md;      /* masks for bl and bd bits */
-    register ulg b;       /* bit buffer */
-    register unsigned k;  /* number of bits in bit buffer */
+    register unsigned int e;  /* table entry flag/number of extra bits */
+    unsigned int n, d;        /* length and index for copy */
+    unsigned int w;           /* current window position */
+    struct huft *t;           /* pointer to table entry */
+    unsigned int ml, md;      /* masks for bl and bd bits */
+    register ulg b;           /* bit buffer */
+    register unsigned int k;  /* number of bits in bit buffer */
 
 
     /* make local copies of globals */
@@ -611,15 +611,15 @@ static int __init inflate_codes(
     md = mask_bits[bd];
     for (;;)                      /* do until end of block */
     {
-        NEEDBITS((unsigned)bl)
-            if ((e = (t = tl + ((unsigned)b & ml))->e) > 16)
+        NEEDBITS((unsigned int)bl)
+            if ((e = (t = tl + ((unsigned int)b & ml))->e) > 16)
                 do {
                     if (e == 99)
                         return 1;
                     DUMPBITS(t->b)
                         e -= 16;
                     NEEDBITS(e)
-                        } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
+                        } while ((e = (t = t->v.t + ((unsigned int)b & mask_bits[e]))->e) > 16);
         DUMPBITS(t->b)
             if (e == 16)                /* then it's a literal */
             {
@@ -639,22 +639,22 @@ static int __init inflate_codes(
 
                 /* get length of block to copy */
                 NEEDBITS(e)
-                    n = t->v.n + ((unsigned)b & mask_bits[e]);
+                    n = t->v.n + ((unsigned int)b & mask_bits[e]);
                 DUMPBITS(e);
 
                 /* decode distance of block to copy */
-                NEEDBITS((unsigned)bd)
-                    if ((e = (t = td + ((unsigned)b & md))->e) > 16)
+                NEEDBITS((unsigned int)bd)
+                    if ((e = (t = td + ((unsigned int)b & md))->e) > 16)
                         do {
                             if (e == 99)
                                 return 1;
                             DUMPBITS(t->b)
                                 e -= 16;
                             NEEDBITS(e)
-                                } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
+                                } while ((e = (t = t->v.t + ((unsigned int)b & mask_bits[e]))->e) > 16);
                 DUMPBITS(t->b)
                     NEEDBITS(e)
-                    d = w - t->v.n - ((unsigned)b & mask_bits[e]);
+                    d = w - t->v.n - ((unsigned int)b & mask_bits[e]);
                 DUMPBITS(e)
                     Tracevv((stderr,"\\[%d,%d]", w-d, n));
 
@@ -701,10 +701,10 @@ static int __init inflate_codes(
 static int __init inflate_stored(void)
 /* "decompress" an inflated type 0 (stored) block. */
 {
-    unsigned n;           /* number of bytes in block */
-    unsigned w;           /* current window position */
-    register ulg b;       /* bit buffer */
-    register unsigned k;  /* number of bits in bit buffer */
+    unsigned int n;           /* number of bytes in block */
+    unsigned int w;           /* current window position */
+    register ulg b;           /* bit buffer */
+    register unsigned int k;  /* number of bits in bit buffer */
 
     DEBG("<stor");
 
@@ -721,10 +721,10 @@ static int __init inflate_stored(void)
 
     /* get the length and its complement */
     NEEDBITS(16)
-        n = ((unsigned)b & 0xffff);
+        n = ((unsigned int)b & 0xffff);
     DUMPBITS(16)
         NEEDBITS(16)
-        if (n != (unsigned)((~b) & 0xffff))
+        if (n != (unsigned int)((~b) & 0xffff))
             return 1;                   /* error in compressed data */
     DUMPBITS(16)
 
@@ -769,7 +769,7 @@ static int noinline __init inflate_fixed(void)
     struct huft *td;      /* distance code table */
     int bl;               /* lookup bits for tl */
     int bd;               /* lookup bits for td */
-    unsigned *l;          /* length list for huft_build */
+    unsigned int *l;      /* length list for huft_build */
 
     DEBG("<fix");
 
@@ -826,21 +826,21 @@ static int noinline __init inflate_fixed(void)
 static int noinline __init inflate_dynamic(void)
 /* decompress an inflated type 2 (dynamic Huffman codes) block. */
 {
-    int i;                /* temporary variables */
-    unsigned j;
-    unsigned l;           /* last length */
-    unsigned m;           /* mask for bit lengths table */
-    unsigned n;           /* number of lengths to get */
-    struct huft *tl;      /* literal/length code table */
-    struct huft *td;      /* distance code table */
-    int bl;               /* lookup bits for tl */
-    int bd;               /* lookup bits for td */
-    unsigned nb;          /* number of bit length codes */
-    unsigned nl;          /* number of literal/length codes */
-    unsigned nd;          /* number of distance codes */
-    unsigned *ll;         /* literal/length and distance code lengths */
-    register ulg b;       /* bit buffer */
-    register unsigned k;  /* number of bits in bit buffer */
+    int i;                    /* temporary variables */
+    unsigned int j;
+    unsigned int l;           /* last length */
+    unsigned int m;           /* mask for bit lengths table */
+    unsigned int n;           /* number of lengths to get */
+    struct huft *tl;          /* literal/length code table */
+    struct huft *td;          /* distance code table */
+    int bl;                   /* lookup bits for tl */
+    int bd;                   /* lookup bits for td */
+    unsigned int nb;          /* number of bit length codes */
+    unsigned int nl;          /* number of literal/length codes */
+    unsigned int nd;          /* number of distance codes */
+    unsigned int *ll;         /* literal/length and distance code lengths */
+    register ulg b;           /* bit buffer */
+    register unsigned int k;  /* number of bits in bit buffer */
     int ret;
 
     DEBG("<dyn");
@@ -861,13 +861,13 @@ static int noinline __init inflate_dynamic(void)
 
     /* read in table lengths */
     NEEDBITS(5)
-        nl = 257 + ((unsigned)b & 0x1f);      /* number of literal/length codes */
+        nl = 257 + ((unsigned int)b & 0x1f);      /* number of literal/length codes */
     DUMPBITS(5)
         NEEDBITS(5)
-        nd = 1 + ((unsigned)b & 0x1f);        /* number of distance codes */
+        nd = 1 + ((unsigned int)b & 0x1f);        /* number of distance codes */
     DUMPBITS(5)
         NEEDBITS(4)
-        nb = 4 + ((unsigned)b & 0xf);         /* number of bit length codes */
+        nb = 4 + ((unsigned int)b & 0xf);         /* number of bit length codes */
     DUMPBITS(4)
 #ifdef PKZIP_BUG_WORKAROUND
         if (nl > 288 || nd > 32)
@@ -885,7 +885,7 @@ static int noinline __init inflate_dynamic(void)
     for (j = 0; j < nb; j++)
     {
         NEEDBITS(3)
-            ll[border[j]] = (unsigned)b & 7;
+            ll[border[j]] = (unsigned int)b & 7;
         DUMPBITS(3)
             }
     for (; j < 19; j++)
@@ -909,10 +909,10 @@ static int noinline __init inflate_dynamic(void)
     n = nl + nd;
     m = mask_bits[bl];
     i = l = 0;
-    while ((unsigned)i < n)
+    while ((unsigned int)i < n)
     {
-        NEEDBITS((unsigned)bl)
-            j = (td = tl + ((unsigned)b & m))->b;
+        NEEDBITS((unsigned int)bl)
+            j = (td = tl + ((unsigned int)b & m))->b;
         DUMPBITS(j)
             j = td->v.n;
         if (j < 16)                 /* length of code in bits (0..15) */
@@ -920,9 +920,9 @@ static int noinline __init inflate_dynamic(void)
         else if (j == 16)           /* repeat last length 3 to 6 times */
         {
             NEEDBITS(2)
-                j = 3 + ((unsigned)b & 3);
+                j = 3 + ((unsigned int)b & 3);
             DUMPBITS(2)
-                if ((unsigned)i + j > n) {
+                if ((unsigned int)i + j > n) {
                     ret = 1;
                     goto out;
                 }
@@ -932,9 +932,9 @@ static int noinline __init inflate_dynamic(void)
         else if (j == 17)           /* 3 to 10 zero length codes */
         {
             NEEDBITS(3)
-                j = 3 + ((unsigned)b & 7);
+                j = 3 + ((unsigned int)b & 7);
             DUMPBITS(3)
-                if ((unsigned)i + j > n) {
+                if ((unsigned int)i + j > n) {
                     ret = 1;
                     goto out;
                 }
@@ -945,9 +945,9 @@ static int noinline __init inflate_dynamic(void)
         else                        /* j == 18: 11 to 138 zero length codes */
         {
             NEEDBITS(7)
-                j = 11 + ((unsigned)b & 0x7f);
+                j = 11 + ((unsigned int)b & 0x7f);
             DUMPBITS(7)
-                if ((unsigned)i + j > n) {
+                if ((unsigned int)i + j > n) {
                     ret = 1;
                     goto out;
                 }
@@ -1033,9 +1033,9 @@ int *e                  /* last block flag */
 )
 /* decompress an inflated block */
 {
-unsigned t;           /* block type */
-register ulg b;       /* bit buffer */
-register unsigned k;  /* number of bits in bit buffer */
+unsigned int t;           /* block type */
+register ulg b;           /* bit buffer */
+register unsigned int k;  /* number of bits in bit buffer */
 
 DEBG("<blk");
 
@@ -1052,7 +1052,7 @@ NEEDBITS(1)
 
     /* read in block type */
     NEEDBITS(2)
-    t = (unsigned)b & 3;
+    t = (unsigned int)b & 3;
     DUMPBITS(2)
 
 
@@ -1084,7 +1084,7 @@ static int __init inflate(void)
 {
     int e;                /* last block flag */
     int r;                /* result code */
-    unsigned h;           /* maximum struct huft's malloc'ed */
+    unsigned int h;       /* maximum struct huft's malloc'ed */
 
     /* initialize window, bit buffer */
     wp = 0;
@@ -1235,8 +1235,8 @@ static int __init gunzip(void)
     (void)NEXTBYTE();  /* Ignore OS type for the moment */
 
     if ((flags & EXTRA_FIELD) != 0) {
-        unsigned len = (unsigned)NEXTBYTE();
-        len |= ((unsigned)NEXTBYTE())<<8;
+        unsigned int len = (unsigned int)NEXTBYTE();
+        len |= ((unsigned int)NEXTBYTE())<<8;
         while (len--) (void)NEXTBYTE();
     }
 
-- 
2.25.1


