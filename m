Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFC2303968
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74727.134327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kzm-00012b-Gd; Tue, 26 Jan 2021 09:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74727.134327; Tue, 26 Jan 2021 09:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kzm-00012A-DE; Tue, 26 Jan 2021 09:50:46 +0000
Received: by outflank-mailman (input) for mailman id 74727;
 Tue, 26 Jan 2021 09:50:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Kzl-000120-KO
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:50:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6739aef-732e-4a33-a15b-e251b531f63e;
 Tue, 26 Jan 2021 09:50:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34DB3AC4F;
 Tue, 26 Jan 2021 09:50:43 +0000 (UTC)
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
X-Inumbo-ID: e6739aef-732e-4a33-a15b-e251b531f63e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmwSsmMDdvtMbIUY0SvgScR6zITZsQEageDRz+4Jb5Y=;
	b=HBqbETvS55jdG35mpzi5Q9+PrRQm7W8xUQUA0GZIfdmRcKNuo+yvBzzoS5LVb+sf7IF/Bk
	SbN0o84sPD/LRPpmJX6lUvbtsRJiphM0JuirRTba2r52btXtlyw2pNVN4W24fHCZoSBC68
	buLIjhGWDoRJaWkQPGAq8Y9KAY5M41k=
Subject: [PATCH v3 01/15] gunzip: drop INIT{,DATA} and STATIC
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <b33f4fd3-e81a-a703-9fb5-a01880c2db9a@suse.com>
Date: Tue, 26 Jan 2021 10:50:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need for the extra abstraction.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/common/gunzip.c
+++ b/xen/common/gunzip.c
@@ -22,7 +22,6 @@ static unsigned __initdata inptr;
 static unsigned __initdata outcnt;
 
 #define OF(args)        args
-#define STATIC          static
 
 #define memzero(s, n)   memset((s), 0, (n))
 
@@ -30,9 +29,6 @@ typedef unsigned char   uch;
 typedef unsigned short  ush;
 typedef unsigned long   ulg;
 
-#define INIT            __init
-#define INITDATA        __initdata
-
 #define get_byte()      (inptr < insize ? inbuf[inptr++] : fill_inbuf())
 
 /* Diagnostic functions */
--- a/xen/common/inflate.c
+++ b/xen/common/inflate.c
@@ -107,7 +107,7 @@
 static char rcsid[] = "#Id: inflate.c,v 0.14 1993/06/10 13:27:04 jloup Exp #";
 #endif
 
-#ifndef STATIC
+#ifndef __XEN__
 
 #if defined(STDC_HEADERS) || defined(HAVE_STDLIB_H)
 #  include <sys/types.h>
@@ -115,14 +115,9 @@ static char rcsid[] = "#Id: inflate.c,v
 #endif
 
 #include "gzip.h"
-#define STATIC
-#endif /* !STATIC */
 
-#ifndef INIT
-#define INIT
-#define INITDATA
-#endif
- 
+#endif /* !__XEN__ */
+
 #define slide window
 
 /* Huffman code lookup table entry--this entry is four bytes for machines
@@ -143,15 +138,15 @@ struct huft {
 
 
 /* Function prototypes */
-STATIC int INIT huft_build OF((unsigned *, unsigned, unsigned, 
-                               const ush *, const ush *, struct huft **, int *));
-STATIC int INIT huft_free OF((struct huft *));
-STATIC int INIT inflate_codes OF((struct huft *, struct huft *, int, int));
-STATIC int INIT inflate_stored OF((void));
-STATIC int INIT inflate_fixed OF((void));
-STATIC int INIT inflate_dynamic OF((void));
-STATIC int INIT inflate_block OF((int *));
-STATIC int INIT inflate OF((void));
+static int huft_build OF((unsigned *, unsigned, unsigned,
+                          const ush *, const ush *, struct huft **, int *));
+static int huft_free OF((struct huft *));
+static int inflate_codes OF((struct huft *, struct huft *, int, int));
+static int inflate_stored OF((void));
+static int inflate_fixed OF((void));
+static int inflate_dynamic OF((void));
+static int inflate_block OF((int *));
+static int inflate OF((void));
 
 
 /* The inflate algorithm uses a sliding 32 K byte window on the uncompressed
@@ -217,10 +212,10 @@ static const ush cpdext[] = {         /*
    the stream.
  */
 
-STATIC ulg INITDATA bb;                /* bit buffer */
-STATIC unsigned INITDATA bk;           /* bits in bit buffer */
+static ulg __initdata bb;                /* bit buffer */
+static unsigned __initdata bk;           /* bits in bit buffer */
 
-STATIC const ush mask_bits[] = {
+static const ush mask_bits[] = {
     0x0000,
     0x0001, 0x0003, 0x0007, 0x000f, 0x001f, 0x003f, 0x007f, 0x00ff,
     0x01ff, 0x03ff, 0x07ff, 0x0fff, 0x1fff, 0x3fff, 0x7fff, 0xffff
@@ -235,10 +230,10 @@ STATIC const ush mask_bits[] = {
  *  malloc by Hannu Savolainen 1993 and Matthias Urlichs 1994
  */
 
-static unsigned long INITDATA malloc_ptr;
-static int INITDATA malloc_count;
+static unsigned long __initdata malloc_ptr;
+static int __initdata malloc_count;
 
-static void *INIT malloc(int size)
+static void *__init malloc(int size)
 {
     void *p;
 
@@ -259,7 +254,7 @@ static void *INIT malloc(int size)
     return p;
 }
 
-static void INIT free(void *where)
+static void __init free(void *where)
 {
     malloc_count--;
     if (!malloc_count)
@@ -303,8 +298,8 @@ static void INIT free(void *where)
  */
 
 
-STATIC const int lbits = 9;          /* bits in base literal/length lookup table */
-STATIC const int dbits = 6;          /* bits in base distance lookup table */
+static const int lbits = 9;          /* bits in base literal/length lookup table */
+static const int dbits = 6;          /* bits in base distance lookup table */
 
 
 /* If BMAX needs to be larger than 16, then h and x[] should be ulg. */
@@ -312,10 +307,10 @@ STATIC const int dbits = 6;          /*
 #define N_MAX 288       /* maximum number of codes in any set */
 
 
-STATIC unsigned INITDATA hufts;      /* track memory usage */
+static unsigned __initdata hufts;      /* track memory usage */
 
 
-STATIC int INIT huft_build(
+static int __init huft_build(
     unsigned *b,            /* code lengths in bits (all assumed <= BMAX) */
     unsigned n,             /* number of codes (assumed <= N_MAX) */
     unsigned s,             /* number of simple-valued codes (0..s-1) */
@@ -560,7 +555,7 @@ STATIC int INIT huft_build(
 
 
 
-STATIC int INIT huft_free(
+static int __init huft_free(
     struct huft *t         /* table to free */
     )
 /* Free the malloc'ed tables built by huft_build(), which makes a linked
@@ -582,7 +577,7 @@ STATIC int INIT huft_free(
 }
 
 
-STATIC int INIT inflate_codes(
+static int __init inflate_codes(
     struct huft *tl,    /* literal/length decoder tables */
     struct huft *td,    /* distance decoder tables */
     int bl,             /* number of bits decoded by tl[] */
@@ -697,7 +692,7 @@ STATIC int INIT inflate_codes(
 
 
 
-STATIC int INIT inflate_stored(void)
+static int __init inflate_stored(void)
 /* "decompress" an inflated type 0 (stored) block. */
 {
     unsigned n;           /* number of bytes in block */
@@ -758,7 +753,7 @@ STATIC int INIT inflate_stored(void)
 /*
  * We use `noinline' here to prevent gcc-3.5 from using too much stack space
  */
-STATIC int noinline INIT inflate_fixed(void)
+static int noinline __init inflate_fixed(void)
 /* decompress an inflated type 1 (fixed Huffman codes) block.  We should
    either replace this with a custom decoder, or at least precompute the
    Huffman tables. */
@@ -822,7 +817,7 @@ STATIC int noinline INIT inflate_fixed(v
 /*
  * We use `noinline' here to prevent gcc-3.5 from using too much stack space
  */
-STATIC int noinline INIT inflate_dynamic(void)
+static int noinline __init inflate_dynamic(void)
 /* decompress an inflated type 2 (dynamic Huffman codes) block. */
 {
     int i;                /* temporary variables */
@@ -1027,7 +1022,7 @@ goto out;
 
 
 
-STATIC int INIT inflate_block(
+static int __init inflate_block(
 int *e                  /* last block flag */
 )
 /* decompress an inflated block */
@@ -1078,7 +1073,7 @@ NEEDBITS(1)
 
 
 
-STATIC int INIT inflate(void)
+static int __init inflate(void)
 /* decompress an inflated entry */
 {
     int e;                /* last block flag */
@@ -1130,8 +1125,8 @@ STATIC int INIT inflate(void)
  *
  **********************************************************************/
 
-static ulg INITDATA crc_32_tab[256];
-static ulg INITDATA crc;  /* initialized in makecrc() so it'll reside in bss */
+static ulg __initdata crc_32_tab[256];
+static ulg __initdata crc;  /* initialized in makecrc() so it'll reside in bss */
 #define CRC_VALUE (crc ^ 0xffffffffUL)
 
 /*
@@ -1139,7 +1134,7 @@ static ulg INITDATA crc;  /* initialized
  * gzip-1.0.3/makecrc.c.
  */
 
-static void INIT
+static void __init
 makecrc(void)
 {
 /* Not copyrighted 1990 Mark Adler */
@@ -1187,7 +1182,7 @@ makecrc(void)
 /*
  * Do the uncompression!
  */
-static int INIT gunzip(void)
+static int __init gunzip(void)
 {
     uch flags;
     unsigned char magic[2]; /* magic header */


