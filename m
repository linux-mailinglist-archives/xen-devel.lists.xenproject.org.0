Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7348B0FF1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711539.1111568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfaG-0003x3-F0; Wed, 24 Apr 2024 16:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711539.1111568; Wed, 24 Apr 2024 16:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfaG-0003vN-AN; Wed, 24 Apr 2024 16:35:00 +0000
Received: by outflank-mailman (input) for mailman id 711539;
 Wed, 24 Apr 2024 16:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfaE-0003bR-39
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:34:58 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93e2ae20-0258-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 18:34:54 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 171397647381758.71801358217556;
 Wed, 24 Apr 2024 09:34:33 -0700 (PDT)
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
X-Inumbo-ID: 93e2ae20-0258-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713976475; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G8paEM41ze5eD0pwTuUxgPaY0GYMNymnFf6Wj/CFWOvp6jnYSTZVWHxUxwsCh2dgYjs3zvon4OS2IZ4jzyQicFdGipJcyTubX2AoX+gG16AZT9Qyx5tBuOVSuKFGXYekd2+jECt0KulvI590vNtZH+MC2VR8bL542Kl8A/hOM2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713976475; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8z49QbqXa4Zd8fwn5J5nFe639PZTbAeeQIyNcepe6Uc=; 
	b=CkKRRSTospewgUyBghbHKSreAOZr6SHCiPVaQNmIckyAGd2DEXLa11MHAs6ZDvQvId6vKgetI833VjAO12FMoaPIewb29H63COTf/p9wWeR2ym9D2kdKxrdtXLHmisZsA33zjSuk4U63q7dZtcyzTJQgmW5PdhSrOgRVtmCutJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713976475;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8z49QbqXa4Zd8fwn5J5nFe639PZTbAeeQIyNcepe6Uc=;
	b=uQCcFGuuyjkMPy5LX6TVjC3AU9FtugjFuo/qlEcOMBkpTjJLJeJsvm+zzzyurhAX
	Z8GPdbBOV40KPtM6wOZLySko3sQTJsShT7DqUZEqyyK2hiBsnjcOP4XJErcLp5Nyo9k
	8mn93l8XpV9uLCWPZ0JuQFWzOYrFInwapG+pU83g=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/8] gzip: clean up comments and fix code alignment
Date: Wed, 24 Apr 2024 12:34:15 -0400
Message-Id: <20240424163422.23276-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit cleans up the comments and fixes the code alignment using Xen
coding style. This is done to make the code more legible before refactoring.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  |  14 +-
 xen/common/gzip/inflate.c | 787 +++++++++++++++++++-------------------
 2 files changed, 406 insertions(+), 395 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 53cee9ee178a..d07c451cd875 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -54,11 +54,10 @@ static __init void error(const char *x)
 
 static __init int fill_inbuf(void)
 {
-        error("ran out of input data");
-        return 0;
+    error("ran out of input data");
+    return 0;
 }
 
-
 #include "inflate.c"
 
 static __init void flush_window(void)
@@ -122,3 +121,12 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
 
     return rc;
 }
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index a03903f73116..220d2ff4d9d9 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -1,11 +1,13 @@
 #define DEBG(x)
 #define DEBG1(x)
-/* inflate.c -- Not copyrighted 1992 by Mark Adler
-   version c10p1, 10 January 1993 */
+/*
+ * inflate.c -- Not copyrighted 1992 by Mark Adler
+ * version c10p1, 10 January 1993
+ */
 
-/* 
+/*
  * Adapted for booting Linux by Hannu Savolainen 1993
- * based on gzip-1.0.3 
+ * based on gzip-1.0.3
  *
  * Nicolas Pitre <nico@cam.org>, 1999/04/14 :
  *   Little mods for all variable to reside either into rodata or bss segments
@@ -15,92 +17,91 @@
  */
 
 /*
-   Inflate deflated (PKZIP's method 8 compressed) data.  The compression
-   method searches for as much of the current string of bytes (up to a
-   length of 258) in the previous 32 K bytes.  If it doesn't find any
-   matches (of at least length 3), it codes the next byte.  Otherwise, it
-   codes the length of the matched string and its distance backwards from
-   the current position.  There is a single Huffman code that codes both
-   single bytes (called "literals") and match lengths.  A second Huffman
-   code codes the distance information, which follows a length code.  Each
-   length or distance code actually represents a base value and a number
-   of "extra" (sometimes zero) bits to get to add to the base value.  At
-   the end of each deflated block is a special end-of-block (EOB) literal/
-   length code.  The decoding process is basically: get a literal/length
-   code; if EOB then done; if a literal, emit the decoded byte; if a
-   length then get the distance and emit the referred-to bytes from the
-   sliding window of previously emitted data.
-
-   There are (currently) three kinds of inflate blocks: stored, fixed, and
-   dynamic.  The compressor deals with some chunk of data at a time, and
-   decides which method to use on a chunk-by-chunk basis.  A chunk might
-   typically be 32 K or 64 K.  If the chunk is incompressible, then the
-   "stored" method is used.  In this case, the bytes are simply stored as
-   is, eight bits per byte, with none of the above coding.  The bytes are
-   preceded by a count, since there is no longer an EOB code.
-
-   If the data is compressible, then either the fixed or dynamic methods
-   are used.  In the dynamic method, the compressed data is preceded by
-   an encoding of the literal/length and distance Huffman codes that are
-   to be used to decode this block.  The representation is itself Huffman
-   coded, and so is preceded by a description of that code.  These code
-   descriptions take up a little space, and so for small blocks, there is
-   a predefined set of codes, called the fixed codes.  The fixed method is
-   used if the block codes up smaller that way (usually for quite small
-   chunks), otherwise the dynamic method is used.  In the latter case, the
-   codes are customized to the probabilities in the current block, and so
-   can code it much better than the pre-determined fixed codes.
- 
-   The Huffman codes themselves are decoded using a multi-level table
-   lookup, in order to maximize the speed of decoding plus the speed of
-   building the decoding tables.  See the comments below that precede the
-   lbits and dbits tuning parameters.
+ * Inflate deflated (PKZIP's method 8 compressed) data.  The compression
+ * method searches for as much of the current string of bytes (up to a
+ * length of 258) in the previous 32 K bytes.  If it doesn't find any
+ * matches (of at least length 3), it codes the next byte.  Otherwise, it
+ * codes the length of the matched string and its distance backwards from
+ * the current position.  There is a single Huffman code that codes both
+ * single bytes (called "literals") and match lengths.  A second Huffman
+ * code codes the distance information, which follows a length code.  Each
+ * length or distance code actually represents a base value and a number
+ * of "extra" (sometimes zero) bits to get to add to the base value.  At
+ * the end of each deflated block is a special end-of-block (EOB) literal/
+ * length code.  The decoding process is basically: get a literal/length
+ * code; if EOB then done; if a literal, emit the decoded byte; if a
+ * length then get the distance and emit the referred-to bytes from the
+ * sliding window of previously emitted data.
+ *
+ * There are (currently) three kinds of inflate blocks: stored, fixed, and
+ * dynamic.  The compressor deals with some chunk of data at a time, and
+ * decides which method to use on a chunk-by-chunk basis.  A chunk might
+ * typically be 32 K or 64 K.  If the chunk is incompressible, then the
+ * "stored" method is used.  In this case, the bytes are simply stored as
+ * is, eight bits per byte, with none of the above coding.  The bytes are
+ * preceded by a count, since there is no longer an EOB code.
+ *
+ * If the data is compressible, then either the fixed or dynamic methods
+ * are used.  In the dynamic method, the compressed data is preceded by
+ * an encoding of the literal/length and distance Huffman codes that are
+ * to be used to decode this block.  The representation is itself Huffman
+ * coded, and so is preceded by a description of that code.  These code
+ * descriptions take up a little space, and so for small blocks, there is
+ * a predefined set of codes, called the fixed codes.  The fixed method is
+ * used if the block codes up smaller that way (usually for quite small
+ * chunks), otherwise the dynamic method is used.  In the latter case, the
+ * codes are customized to the probabilities in the current block, and so
+ * can code it much better than the pre-determined fixed codes.
+ *
+ * The Huffman codes themselves are decoded using a multi-level table
+ * lookup, in order to maximize the speed of decoding plus the speed of
+ * building the decoding tables.  See the comments below that precede the
+ * lbits and dbits tuning parameters.
  */
 
-
 /*
-   Notes beyond the 1.93a appnote.txt:
-
-   1. Distance pointers never point before the beginning of the output
-      stream.
-   2. Distance pointers can point back across blocks, up to 32k away.
-   3. There is an implied maximum of 7 bits for the bit length table and
-      15 bits for the actual data.
-   4. If only one code exists, then it is encoded using one bit.  (Zero
-      would be more efficient, but perhaps a little confusing.)  If two
-      codes exist, they are coded using one bit each (0 and 1).
-   5. There is no way of sending zero distance codes--a dummy must be
-      sent if there are none.  (History: a pre 2.0 version of PKZIP would
-      store blocks with no distance codes, but this was discovered to be
-      too harsh a criterion.)  Valid only for 1.93a.  2.04c does allow
-      zero distance codes, which is sent as one code of zero bits in
-      length.
-   6. There are up to 286 literal/length codes.  Code 256 represents the
-      end-of-block.  Note however that the static length tree defines
-      288 codes just to fill out the Huffman codes.  Codes 286 and 287
-      cannot be used though, since there is no length base or extra bits
-      defined for them.  Similarly, there are up to 30 distance codes.
-      However, static trees define 32 codes (all 5 bits) to fill out the
-      Huffman codes, but the last two had better not show up in the data.
-   7. Unzip can check dynamic Huffman blocks for complete code sets.
-      The exception is that a single code would not be complete (see #4).
-   8. The five bits following the block type is really the number of
-      literal codes sent minus 257.
-   9. Length codes 8,16,16 are interpreted as 13 length codes of 8 bits
-      (1+6+6).  Therefore, to output three times the length, you output
-      three codes (1+1+1), whereas to output four times the same length,
-      you only need two codes (1+3).  Hmm.
-  10. In the tree reconstruction algorithm, Code = Code + Increment
-      only if BitLength(i) is not zero.  (Pretty obvious.)
-  11. Correction: 4 Bits: # of Bit Length codes - 4     (4 - 19)
-  12. Note: length code 284 can represent 227-258, but length code 285
-      really is 258.  The last length deserves its own, short code
-      since it gets used a lot in very redundant files.  The length
-      258 is special since 258 - 3 (the min match length) is 255.
-  13. The literal/length and distance code bit lengths are read as a
-      single stream of lengths.  It is possible (and advantageous) for
-      a repeat code (16, 17, or 18) to go across the boundary between
-      the two sets of lengths.
+ * Notes beyond the 1.93a appnote.txt:
+ *
+ *  1. Distance pointers never point before the beginning of the output
+ *     stream.
+ *  2. Distance pointers can point back across blocks, up to 32k away.
+ *  3. There is an implied maximum of 7 bits for the bit length table and
+ *     15 bits for the actual data.
+ *  4. If only one code exists, then it is encoded using one bit.  (Zero
+ *     would be more efficient, but perhaps a little confusing.)  If two
+ *     codes exist, they are coded using one bit each (0 and 1).
+ *  5. There is no way of sending zero distance codes--a dummy must be
+ *     sent if there are none.  (History: a pre 2.0 version of PKZIP would
+ *     store blocks with no distance codes, but this was discovered to be
+ *     too harsh a criterion.)  Valid only for 1.93a.  2.04c does allow
+ *     zero distance codes, which is sent as one code of zero bits in
+ *     length.
+ *  6. There are up to 286 literal/length codes.  Code 256 represents the
+ *     end-of-block.  Note however that the static length tree defines
+ *     288 codes just to fill out the Huffman codes.  Codes 286 and 287
+ *     cannot be used though, since there is no length base or extra bits
+ *     defined for them.  Similarly, there are up to 30 distance codes.
+ *     However, static trees define 32 codes (all 5 bits) to fill out the
+ *     Huffman codes, but the last two had better not show up in the data.
+ *  7. Unzip can check dynamic Huffman blocks for complete code sets.
+ *     The exception is that a single code would not be complete (see #4).
+ *  8. The five bits following the block type is really the number of
+ *     literal codes sent minus 257.
+ *  9. Length codes 8,16,16 are interpreted as 13 length codes of 8 bits
+ *     (1+6+6).  Therefore, to output three times the length, you output
+ *     three codes (1+1+1), whereas to output four times the same length,
+ *     you only need two codes (1+3).  Hmm.
+ * 10. In the tree reconstruction algorithm, Code = Code + Increment
+ *     only if BitLength(i) is not zero.  (Pretty obvious.)
+ * 11. Correction: 4 Bits: # of Bit Length codes - 4     (4 - 19)
+ * 12. Note: length code 284 can represent 227-258, but length code 285
+ *     really is 258.  The last length deserves its own, short code
+ *     since it gets used a lot in very redundant files.  The length
+ *     258 is special since 258 - 3 (the min match length) is 255.
+ * 13. The literal/length and distance code bit lengths are read as a
+ *     single stream of lengths.  It is possible (and advantageous) for
+ *     a repeat code (16, 17, or 18) to go across the boundary between
+ *     the two sets of lengths.
  */
 
 #ifdef RCSID
@@ -120,13 +121,15 @@ static char rcsid[] = "#Id: inflate.c,v 0.14 1993/06/10 13:27:04 jloup Exp #";
 
 #define slide window
 
-/* Huffman code lookup table entry--this entry is four bytes for machines
-   that have 16-bit pointers (e.g. PC's in the small or medium model).
-   Valid extra bits are 0..13.  e == 15 is EOB (end of block), e == 16
-   means that v is a literal, 16 < e < 32 means that v is a pointer to
-   the next table, which codes e - 16 bits, and lastly e == 99 indicates
-   an unused code.  If a code with e == 99 is looked up, this implies an
-   error in the data. */
+/*
+ * Huffman code lookup table entry--this entry is four bytes for machines
+ * that have 16-bit pointers (e.g. PC's in the small or medium model).
+ * Valid extra bits are 0..13.  e == 15 is EOB (end of block), e == 16
+ * means that v is a literal, 16 < e < 32 means that v is a pointer to
+ * the next table, which codes e - 16 bits, and lastly e == 99 indicates
+ * an unused code.  If a code with e == 99 is looked up, this implies an
+ * error in the data.
+ */
 struct huft {
     uch e;                /* number of extra bits or operation */
     uch b;                /* number of bits in this code or subcode */
@@ -136,7 +139,6 @@ struct huft {
     } v;
 };
 
-
 /* Function prototypes */
 static int huft_build(unsigned *, unsigned, unsigned,
                       const ush *, const ush *, struct huft **, int *);
@@ -148,15 +150,17 @@ static int inflate_dynamic(void);
 static int inflate_block(int *);
 static int inflate(void);
 
-
-/* The inflate algorithm uses a sliding 32 K byte window on the uncompressed
-   stream to find repeated byte strings.  This is implemented here as a
-   circular buffer.  The index is updated simply by incrementing and then
-   ANDing with 0x7fff (32K-1). */
-/* It is left to other modules to supply the 32 K area.  It is assumed
-   to be usable as if it were declared "uch slide[32768];" or as just
-   "uch *slide;" and then malloc'ed in the latter case.  The definition
-   must be in unzip.h, included above. */
+/*
+ * The inflate algorithm uses a sliding 32 K byte window on the uncompressed
+ * stream to find repeated byte strings.  This is implemented here as a
+ * circular buffer.  The index is updated simply by incrementing and then
+ * ANDing with 0x7fff (32K-1).
+ *
+ * It is left to other modules to supply the 32 K area.  It is assumed
+ * to be usable as if it were declared "uch slide[32768];" or as just
+ * "uch *slide;" and then malloc'ed in the latter case.  The definition
+ * must be in unzip.h, included above.
+ */
 /* unsigned wp;             current position in slide */
 #define wp outcnt
 #define flush_output(w) (wp=(w),flush_window())
@@ -180,36 +184,35 @@ static const ush cpdext[] = {         /* Extra bits for distance codes */
     7, 7, 8, 8, 9, 9, 10, 10, 11, 11,
     12, 12, 13, 13};
 
-
-
-/* Macros for inflate() bit peeking and grabbing.
-   The usage is:
-   
-        NEEDBITS(j)
-        x = b & mask_bits[j];
-        DUMPBITS(j)
-
-   where NEEDBITS makes sure that b has at least j bits in it, and
-   DUMPBITS removes the bits from b.  The macros use the variable k
-   for the number of bits in b.  Normally, b and k are register
-   variables for speed, and are initialized at the beginning of a
-   routine that uses these macros from a global bit buffer and count.
-
-   If we assume that EOB will be the longest code, then we will never
-   ask for bits with NEEDBITS that are beyond the end of the stream.
-   So, NEEDBITS should not read any more bytes than are needed to
-   meet the request.  Then no bytes need to be "returned" to the buffer
-   at the end of the last block.
-
-   However, this assumption is not true for fixed blocks--the EOB code
-   is 7 bits, but the other literal/length codes can be 8 or 9 bits.
-   (The EOB code is shorter than other codes because fixed blocks are
-   generally short.  So, while a block always has an EOB, many other
-   literal/length codes have a significantly lower probability of
-   showing up at all.)  However, by making the first table have a
-   lookup of seven bits, the EOB code will be found in that first
-   lookup, and so will not require that too many bits be pulled from
-   the stream.
+/*
+ * Macros for inflate() bit peeking and grabbing.
+ * The usage is:
+ *
+ *      NEEDBITS(j)
+ *      x = b & mask_bits[j];
+ *      DUMPBITS(j)
+ *
+ * where NEEDBITS makes sure that b has at least j bits in it, and
+ * DUMPBITS removes the bits from b.  The macros use the variable k
+ * for the number of bits in b.  Normally, b and k are register
+ * variables for speed, and are initialized at the beginning of a
+ * routine that uses these macros from a global bit buffer and count.
+ *
+ * If we assume that EOB will be the longest code, then we will never
+ * ask for bits with NEEDBITS that are beyond the end of the stream.
+ * So, NEEDBITS should not read any more bytes than are needed to
+ * meet the request.  Then no bytes need to be "returned" to the buffer
+ * at the end of the last block.
+ *
+ * However, this assumption is not true for fixed blocks--the EOB code
+ * is 7 bits, but the other literal/length codes can be 8 or 9 bits.
+ * (The EOB code is shorter than other codes because fixed blocks are
+ * generally short.  So, while a block always has an EOB, many other
+ * literal/length codes have a significantly lower probability of
+ * showing up at all.)  However, by making the first table have a
+ * lookup of seven bits, the EOB code will be found in that first
+ * lookup, and so will not require that too many bits be pulled from
+ * the stream.
  */
 
 static ulg __initdata bb;                /* bit buffer */
@@ -226,60 +229,62 @@ static const ush mask_bits[] = {
 #define DUMPBITS(n) {b>>=(n);k-=(n);}
 
 /*
-   Huffman code decoding is performed using a multi-level table lookup.
-   The fastest way to decode is to simply build a lookup table whose
-   size is determined by the longest code.  However, the time it takes
-   to build this table can also be a factor if the data being decoded
-   is not very long.  The most common codes are necessarily the
-   shortest codes, so those codes dominate the decoding time, and hence
-   the speed.  The idea is you can have a shorter table that decodes the
-   shorter, more probable codes, and then point to subsidiary tables for
-   the longer codes.  The time it costs to decode the longer codes is
-   then traded against the time it takes to make longer tables.
-
-   This results of this trade are in the variables lbits and dbits
-   below.  lbits is the number of bits the first level table for literal/
-   length codes can decode in one step, and dbits is the same thing for
-   the distance codes.  Subsequent tables are also less than or equal to
-   those sizes.  These values may be adjusted either when all of the
-   codes are shorter than that, in which case the longest code length in
-   bits is used, or when the shortest code is *longer* than the requested
-   table size, in which case the length of the shortest code in bits is
-   used.
-
-   There are two different values for the two tables, since they code a
-   different number of possibilities each.  The literal/length table
-   codes 286 possible values, or in a flat code, a little over eight
-   bits.  The distance table codes 30 possible values, or a little less
-   than five bits, flat.  The optimum values for speed end up being
-   about one bit more than those, so lbits is 8+1 and dbits is 5+1.
-   The optimum values may differ though from machine to machine, and
-   possibly even between compilers.  Your mileage may vary.
+ * Huffman code decoding is performed using a multi-level table lookup.
+ * The fastest way to decode is to simply build a lookup table whose
+ * size is determined by the longest code.  However, the time it takes
+ * to build this table can also be a factor if the data being decoded
+ * is not very long.  The most common codes are necessarily the
+ * shortest codes, so those codes dominate the decoding time, and hence
+ * the speed.  The idea is you can have a shorter table that decodes the
+ * shorter, more probable codes, and then point to subsidiary tables for
+ * the longer codes.  The time it costs to decode the longer codes is
+ * then traded against the time it takes to make longer tables.
+ *
+ * This results of this trade are in the variables lbits and dbits
+ * below.  lbits is the number of bits the first level table for literal/
+ * length codes can decode in one step, and dbits is the same thing for
+ * the distance codes.  Subsequent tables are also less than or equal to
+ * those sizes.  These values may be adjusted either when all of the
+ * codes are shorter than that, in which case the longest code length in
+ * bits is used, or when the shortest code is *longer* than the requested
+ * table size, in which case the length of the shortest code in bits is
+ * used.
+ *
+ * There are two different values for the two tables, since they code a
+ * different number of possibilities each.  The literal/length table
+ * codes 286 possible values, or in a flat code, a little over eight
+ * bits.  The distance table codes 30 possible values, or a little less
+ * than five bits, flat.  The optimum values for speed end up being
+ * about one bit more than those, so lbits is 8+1 and dbits is 5+1.
+ * The optimum values may differ though from machine to machine, and
+ * possibly even between compilers.  Your mileage may vary.
  */
 
-
 static const int lbits = 9;          /* bits in base literal/length lookup table */
 static const int dbits = 6;          /* bits in base distance lookup table */
 
-
 /* If BMAX needs to be larger than 16, then h and x[] should be ulg. */
 #define BMAX 16         /* maximum bit length of any code (16 for explode) */
 #define N_MAX 288       /* maximum number of codes in any set */
 
+/*
+ * Given a list of code lengths and a maximum table size, make a set of
+ * tables to decode that set of codes.  Return zero on success, one if
+ * the given code set is incomplete (the tables are still built in this
+ * case), two if the input is invalid (all zero length codes or an
+ * oversubscribed set of lengths), and three if not enough memory.
+ *
+ * @param b Code lengths in bits (all assumed <= BMAX)
+ * @param n Number of codes (assumed <= N_MAX)
+ * @param s Number of simple-valued codes (0..s-1)
+ * @param d List of base values for non-simple codes
+ * @param e List of extra bits for non-simple codes
+ * @param t Result: starting table
+ * @param m Maximum lookup bits, returns actual
+ */
 static int __init huft_build(
-    unsigned *b,            /* code lengths in bits (all assumed <= BMAX) */
-    unsigned n,             /* number of codes (assumed <= N_MAX) */
-    unsigned s,             /* number of simple-valued codes (0..s-1) */
-    const ush *d,           /* list of base values for non-simple codes */
-    const ush *e,           /* list of extra bits for non-simple codes */
-    struct huft **t,        /* result: starting table */
-    int *m                  /* maximum lookup bits, returns actual */
-    )
-/* Given a list of code lengths and a maximum table size, make a set of
-   tables to decode that set of codes.  Return zero on success, one if
-   the given code set is incomplete (the tables are still built in this
-   case), two if the input is invalid (all zero length codes or an
-   oversubscribed set of lengths), and three if not enough memory. */
+    unsigned *b, unsigned n, unsigned s, const ush *d, const ush *e,
+    struct huft **t, int *m)
 {
     unsigned a;                   /* counter for codes of length k */
     unsigned f;                   /* i repeats in table every f entries */
@@ -321,7 +326,7 @@ static int __init huft_build(
     memzero(stk->c, sizeof(stk->c));
     p = b;  i = n;
     do {
-        Tracecv(*p, (stderr, (n-i >= ' ' && n-i <= '~' ? "%c %d\n" : "0x%x %d\n"), 
+        Tracecv(*p, (stderr, (n-i >= ' ' && n-i <= '~' ? "%c %d\n" : "0x%x %d\n"),
                      n-i, *p));
         c[*p]++;                    /* assume all entries <= BMAX */
         p++;                      /* Can't combine with above line (Solaris bug) */
@@ -508,18 +513,17 @@ static int __init huft_build(
     return ret;
 }
 
-
-
-static int __init huft_free(
-    struct huft *t         /* table to free */
-    )
-/* Free the malloc'ed tables built by huft_build(), which makes a linked
-   list of the tables it made, with the links in a dummy first entry of
-   each table. */
+/*
+ * Free the malloc'ed tables built by huft_build(), which makes a linked
+ * list of the tables it made, with the links in a dummy first entry of
+ * each table.
+ *
+ * @param t Table to free
+ */
+static int __init huft_free(struct huft *t)
 {
     register struct huft *p, *q;
 
-
     /* Go through linked list, freeing from the malloced (t[-1]) address. */
     p = t;
     while (p != (struct huft *)NULL)
@@ -527,19 +531,21 @@ static int __init huft_free(
         q = (--p)->v.t;
         free((char*)p);
         p = q;
-    } 
+    }
     return 0;
 }
 
-
+/*
+ * inflate (decompress) the codes in a deflated (compressed) block.
+ * Return an error code or zero if it all goes ok.
+ *
+ * @param huft tl Literal/length decoder tables
+ * @param huft td Distance decoder tables
+ * @param bl  Number of bits decoded by tl[]
+ * @param bd  Number of bits decoded by td[]
+ */
 static int __init inflate_codes(
-    struct huft *tl,    /* literal/length decoder tables */
-    struct huft *td,    /* distance decoder tables */
-    int bl,             /* number of bits decoded by tl[] */
-    int bd              /* number of bits decoded by td[] */
-    )
-/* inflate (decompress) the codes in a deflated (compressed) block.
-   Return an error code or zero if it all goes ok. */
+    struct huft *tl, struct huft *td, int bl, int bd)
 {
     register unsigned e;  /* table entry flag/number of extra bits */
     unsigned n, d;        /* length and index for copy */
@@ -560,77 +566,76 @@ static int __init inflate_codes(
     md = mask_bits[bd];
     for (;;)                      /* do until end of block */
     {
-        NEEDBITS((unsigned)bl)
-            if ((e = (t = tl + ((unsigned)b & ml))->e) > 16)
+        NEEDBITS((unsigned)bl);
+        if ((e = (t = tl + ((unsigned)b & ml))->e) > 16)
+            do {
+                if (e == 99)
+                    return 1;
+                DUMPBITS(t->b);
+                e -= 16;
+                NEEDBITS(e);
+            } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
+        DUMPBITS(t->b);
+        if (e == 16)                /* then it's a literal */
+        {
+            slide[w++] = (uch)t->v.n;
+            Tracevv((stderr, "%c", slide[w-1]));
+            if (w == WSIZE)
+            {
+                flush_output(w);
+                w = 0;
+            }
+        }
+        else                        /* it's an EOB or a length */
+        {
+            /* exit if end of block */
+            if (e == 15)
+                break;
+
+            /* get length of block to copy */
+            NEEDBITS(e);
+            n = t->v.n + ((unsigned)b & mask_bits[e]);
+            DUMPBITS(e);
+
+            /* decode distance of block to copy */
+            NEEDBITS((unsigned)bd);
+            if ((e = (t = td + ((unsigned)b & md))->e) > 16)
                 do {
                     if (e == 99)
                         return 1;
-                    DUMPBITS(t->b)
-                        e -= 16;
-                    NEEDBITS(e)
-                        } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
-        DUMPBITS(t->b)
-            if (e == 16)                /* then it's a literal */
-            {
-                slide[w++] = (uch)t->v.n;
-                Tracevv((stderr, "%c", slide[w-1]));
+                    DUMPBITS(t->b);
+                    e -= 16;
+                    NEEDBITS(e);
+                } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
+            DUMPBITS(t->b);
+            NEEDBITS(e);
+            d = w - t->v.n - ((unsigned)b & mask_bits[e]);
+            DUMPBITS(e);
+            Tracevv((stderr,"\\[%d,%d]", w-d, n));
+
+            /* do the copy */
+            do {
+                n -= (e = (e = WSIZE - ((d &= WSIZE-1) > w ? d : w)) > n ? n : e);
+                if (w - d >= e)         /* (this test assumes unsigned comparison) */
+                {
+                    memcpy(slide + w, slide + d, e);
+                    w += e;
+                    d += e;
+                }
+                else                      /* do it slow to avoid memcpy() overlap */
+                    do {
+                        slide[w++] = slide[d++];
+                        Tracevv((stderr, "%c", slide[w-1]));
+                    } while (--e);
                 if (w == WSIZE)
                 {
                     flush_output(w);
                     w = 0;
                 }
-            }
-            else                        /* it's an EOB or a length */
-            {
-                /* exit if end of block */
-                if (e == 15)
-                    break;
-
-                /* get length of block to copy */
-                NEEDBITS(e)
-                    n = t->v.n + ((unsigned)b & mask_bits[e]);
-                DUMPBITS(e);
-
-                /* decode distance of block to copy */
-                NEEDBITS((unsigned)bd)
-                    if ((e = (t = td + ((unsigned)b & md))->e) > 16)
-                        do {
-                            if (e == 99)
-                                return 1;
-                            DUMPBITS(t->b)
-                                e -= 16;
-                            NEEDBITS(e)
-                                } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
-                DUMPBITS(t->b)
-                    NEEDBITS(e)
-                    d = w - t->v.n - ((unsigned)b & mask_bits[e]);
-                DUMPBITS(e)
-                    Tracevv((stderr,"\\[%d,%d]", w-d, n));
-
-                /* do the copy */
-                do {
-                    n -= (e = (e = WSIZE - ((d &= WSIZE-1) > w ? d : w)) > n ? n : e);
-                    if (w - d >= e)         /* (this test assumes unsigned comparison) */
-                    {
-                        memcpy(slide + w, slide + d, e);
-                        w += e;
-                        d += e;
-                    }
-                    else                      /* do it slow to avoid memcpy() overlap */
-                        do {
-                            slide[w++] = slide[d++];
-                            Tracevv((stderr, "%c", slide[w-1]));
-                        } while (--e);
-                    if (w == WSIZE)
-                    {
-                        flush_output(w);
-                        w = 0;
-                    }
-                } while (n);
-            }
+            } while (n);
+        }
     }
 
-
     /* restore the globals from the locals */
     wp = w;                       /* restore global window pointer */
     bb = b;                       /* restore global bit buffer */
@@ -643,10 +648,8 @@ static int __init inflate_codes(
     return 4;   /* Input underrun */
 }
 
-
-
-static int __init inflate_stored(void)
 /* "decompress" an inflated type 0 (stored) block. */
+static int __init inflate_stored(void)
 {
     unsigned n;           /* number of bytes in block */
     unsigned w;           /* current window position */
@@ -667,28 +670,26 @@ static int __init inflate_stored(void)
 
 
     /* get the length and its complement */
-    NEEDBITS(16)
-        n = ((unsigned)b & 0xffff);
-    DUMPBITS(16)
-        NEEDBITS(16)
-        if (n != (unsigned)((~b) & 0xffff))
-            return 1;                   /* error in compressed data */
-    DUMPBITS(16)
-
-
-        /* read and output the compressed data */
-        while (n--)
+    NEEDBITS(16);
+    n = ((unsigned)b & 0xffff);
+    DUMPBITS(16);
+    NEEDBITS(16);
+    if (n != (unsigned)((~b) & 0xffff))
+        return 1;                   /* error in compressed data */
+    DUMPBITS(16);
+
+    /* read and output the compressed data */
+    while (n--)
+    {
+        NEEDBITS(8);
+        slide[w++] = (uch)b;
+        if (w == WSIZE)
         {
-            NEEDBITS(8)
-                slide[w++] = (uch)b;
-            if (w == WSIZE)
-            {
-                flush_output(w);
-                w = 0;
-            }
-            DUMPBITS(8)
-                }
-
+            flush_output(w);
+            w = 0;
+        }
+        DUMPBITS(8);
+    }
 
     /* restore the globals from the locals */
     wp = w;                       /* restore global window pointer */
@@ -706,10 +707,13 @@ static int __init inflate_stored(void)
 /*
  * We use `noinline' here to prevent gcc-3.5 from using too much stack space
  */
+
+/*
+ * decompress an inflated type 1 (fixed Huffman codes) block.  We should
+ * either replace this with a custom decoder, or at least precompute the
+ * Huffman tables.
+ */
 static int noinline __init inflate_fixed(void)
-/* decompress an inflated type 1 (fixed Huffman codes) block.  We should
-   either replace this with a custom decoder, or at least precompute the
-   Huffman tables. */
 {
     int i;                /* temporary variable */
     struct huft *tl;      /* literal/length code table */
@@ -752,7 +756,6 @@ static int noinline __init inflate_fixed(void)
         return i;
     }
 
-
     /* decompress until an end-of-block code */
     if (inflate_codes(tl, td, bl, bd)) {
         free(l);
@@ -766,12 +769,12 @@ static int noinline __init inflate_fixed(void)
     return 0;
 }
 
-
 /*
  * We use `noinline' here to prevent gcc-3.5 from using too much stack space
  */
-static int noinline __init inflate_dynamic(void)
+
 /* decompress an inflated type 2 (dynamic Huffman codes) block. */
+static int noinline __init inflate_dynamic(void)
 {
     int i;                /* temporary variables */
     unsigned j;
@@ -801,32 +804,31 @@ static int noinline __init inflate_dynamic(void)
     b = bb;
     k = bk;
 
-
     /* read in table lengths */
-    NEEDBITS(5)
-        nl = 257 + ((unsigned)b & 0x1f);      /* number of literal/length codes */
-    DUMPBITS(5)
-        NEEDBITS(5)
-        nd = 1 + ((unsigned)b & 0x1f);        /* number of distance codes */
-    DUMPBITS(5)
-        NEEDBITS(4)
-        nb = 4 + ((unsigned)b & 0xf);         /* number of bit length codes */
-    DUMPBITS(4)
-            if (nl > 286 || nd > 30)
-            {
-                ret = 1;             /* bad lengths */
-                goto out;
-            }
+    NEEDBITS(5);
+    nl = 257 + ((unsigned)b & 0x1f);      /* number of literal/length codes */
+    DUMPBITS(5);
+    NEEDBITS(5);
+    nd = 1 + ((unsigned)b & 0x1f);        /* number of distance codes */
+    DUMPBITS(5);
+    NEEDBITS(4);
+    nb = 4 + ((unsigned)b & 0xf);         /* number of bit length codes */
+    DUMPBITS(4);
+    if (nl > 286 || nd > 30)
+    {
+        ret = 1;             /* bad lengths */
+        goto out;
+    }
 
     DEBG("dyn1 ");
 
     /* read in bit-length-code lengths */
     for (j = 0; j < nb; j++)
     {
-        NEEDBITS(3)
-            ll[border[j]] = (unsigned)b & 7;
-        DUMPBITS(3)
-            }
+        NEEDBITS(3);
+        ll[border[j]] = (unsigned)b & 7;
+        DUMPBITS(3);
+    }
     for (; j < 19; j++)
         ll[border[j]] = 0;
 
@@ -850,46 +852,46 @@ static int noinline __init inflate_dynamic(void)
     i = l = 0;
     while ((unsigned)i < n)
     {
-        NEEDBITS((unsigned)bl)
-            j = (td = tl + ((unsigned)b & m))->b;
-        DUMPBITS(j)
-            j = td->v.n;
+        NEEDBITS((unsigned)bl);
+        j = (td = tl + ((unsigned)b & m))->b;
+        DUMPBITS(j);
+        j = td->v.n;
         if (j < 16)                 /* length of code in bits (0..15) */
             ll[i++] = l = j;          /* save last length in l */
         else if (j == 16)           /* repeat last length 3 to 6 times */
         {
-            NEEDBITS(2)
-                j = 3 + ((unsigned)b & 3);
-            DUMPBITS(2)
-                if ((unsigned)i + j > n) {
-                    ret = 1;
-                    goto out;
-                }
+            NEEDBITS(2);
+            j = 3 + ((unsigned)b & 3);
+            DUMPBITS(2);
+            if ((unsigned)i + j > n) {
+                ret = 1;
+                goto out;
+            }
             while (j--)
                 ll[i++] = l;
         }
         else if (j == 17)           /* 3 to 10 zero length codes */
         {
-            NEEDBITS(3)
-                j = 3 + ((unsigned)b & 7);
-            DUMPBITS(3)
-                if ((unsigned)i + j > n) {
-                    ret = 1;
-                    goto out;
-                }
+            NEEDBITS(3);
+            j = 3 + ((unsigned)b & 7);
+            DUMPBITS(3);
+            if ((unsigned)i + j > n) {
+                ret = 1;
+                goto out;
+            }
             while (j--)
                 ll[i++] = 0;
             l = 0;
         }
         else                        /* j == 18: 11 to 138 zero length codes */
         {
-            NEEDBITS(7)
-                j = 11 + ((unsigned)b & 0x7f);
-            DUMPBITS(7)
-                if ((unsigned)i + j > n) {
-                    ret = 1;
-                    goto out;
-                }
+            NEEDBITS(7);
+            j = 11 + ((unsigned)b & 0x7f);
+            DUMPBITS(7);
+            if ((unsigned)i + j > n) {
+                ret = 1;
+                goto out;
+            }
             while (j--)
                 ll[i++] = 0;
             l = 0;
@@ -928,67 +930,64 @@ static int noinline __init inflate_dynamic(void)
         DEBG("dyn5d ");
         if (i == 1) {
             error("incomplete distance tree");
-        huft_free(td);
+            huft_free(td);
+        }
+        huft_free(tl);
+        ret = i;                   /* incomplete code set */
+        goto out;
     }
-    huft_free(tl);
-    ret = i;                   /* incomplete code set */
-    goto out;
-}
 
-DEBG("dyn6 ");
+    DEBG("dyn6 ");
 
-  /* decompress until an end-of-block code */
-if (inflate_codes(tl, td, bl, bd)) {
-    ret = 1;
-    goto out;
-}
+    /* decompress until an end-of-block code */
+    if (inflate_codes(tl, td, bl, bd)) {
+        ret = 1;
+        goto out;
+    }
 
-DEBG("dyn7 ");
+    DEBG("dyn7 ");
 
-  /* free the decoding tables, return */
-huft_free(tl);
-huft_free(td);
+    /* free the decoding tables, return */
+    huft_free(tl);
+    huft_free(td);
 
-DEBG(">");
-ret = 0;
-out:
-free(ll);
-return ret;
+    DEBG(">");
+    ret = 0;
+ out:
+    free(ll);
+    return ret;
 
-underrun:
-ret = 4;   /* Input underrun */
-goto out;
+ underrun:
+    ret = 4;   /* Input underrun */
+    goto out;
 }
 
-
-
-static int __init inflate_block(
-int *e                  /* last block flag */
-)
-/* decompress an inflated block */
+/*
+ * decompress an inflated block
+ *
+ * @param e Last block flag
+ */
+static int __init inflate_block(int *e)
 {
-unsigned t;           /* block type */
-register ulg b;       /* bit buffer */
-register unsigned k;  /* number of bits in bit buffer */
-
-DEBG("<blk");
+    unsigned t;           /* block type */
+    register ulg b;       /* bit buffer */
+    register unsigned k;  /* number of bits in bit buffer */
 
-/* make local bit buffer */
-b = bb;
-k = bk;
+    DEBG("<blk");
 
+    /* make local bit buffer */
+    b = bb;
+    k = bk;
 
-/* read in last block bit */
-NEEDBITS(1)
+    /* read in last block bit */
+    NEEDBITS(1);
     *e = (int)b & 1;
-    DUMPBITS(1)
-
+    DUMPBITS(1);
 
     /* read in block type */
-    NEEDBITS(2)
+    NEEDBITS(2);
     t = (unsigned)b & 3;
-    DUMPBITS(2)
-
+    DUMPBITS(2);
 
     /* restore the global bit buffer */
     bb = b;
@@ -996,25 +995,23 @@ NEEDBITS(1)
 
     /* inflate that block type */
     if (t == 2)
-    return inflate_dynamic();
+        return inflate_dynamic();
     if (t == 0)
-    return inflate_stored();
+        return inflate_stored();
     if (t == 1)
-    return inflate_fixed();
+        return inflate_fixed();
 
     DEBG(">");
 
     /* bad block type */
     return 2;
 
-    underrun:
+ underrun:
     return 4;   /* Input underrun */
 }
 
-
-
-static int __init inflate(void)
 /* decompress an inflated entry */
+static int __init inflate(void)
 {
     int e;                /* last block flag */
     int r;                /* result code */
@@ -1024,7 +1021,6 @@ static int __init inflate(void)
     bk = 0;
     bb = 0;
 
-
     /* decompress until the last block */
     do {
         r = inflate_block(&e);
@@ -1043,7 +1039,6 @@ static int __init inflate(void)
     /* flush out slide */
     flush_output(wp);
 
-
     /* return success */
     return 0;
 }
@@ -1059,12 +1054,11 @@ static ulg __initdata crc;  /* initialized in makecrc() so it'll reside in bss *
 #define CRC_VALUE (crc ^ 0xffffffffUL)
 
 /*
- * Code to compute the CRC-32 table. Borrowed from 
+ * Code to compute the CRC-32 table. Borrowed from
  * gzip-1.0.3/makecrc.c.
  */
 
-static void __init
-makecrc(void)
+static void __init makecrc(void)
 {
 /* Not copyrighted 1990 Mark Adler */
 
@@ -1167,7 +1161,7 @@ static int __init gunzip(void)
     if ((flags & ORIG_NAME) != 0) {
         /* Discard the old name */
         while (NEXTBYTE() != 0) /* null */ ;
-    } 
+    }
 
     /* Discard file comment if any */
     if ((flags & COMMENT) != 0) {
@@ -1196,7 +1190,7 @@ static int __init gunzip(void)
         }
         return -1;
     }
-     
+
     /* Get the crc and original length */
     /* crc32  (see algorithm.doc)
      * uncompressed input size modulo 2^32
@@ -1205,12 +1199,12 @@ static int __init gunzip(void)
     orig_crc |= (ulg) NEXTBYTE() << 8;
     orig_crc |= (ulg) NEXTBYTE() << 16;
     orig_crc |= (ulg) NEXTBYTE() << 24;
-    
+
     orig_len = (ulg) NEXTBYTE();
     orig_len |= (ulg) NEXTBYTE() << 8;
     orig_len |= (ulg) NEXTBYTE() << 16;
     orig_len |= (ulg) NEXTBYTE() << 24;
-    
+
     /* Validate decompression */
     if (orig_crc != CRC_VALUE) {
         error("crc error");
@@ -1226,3 +1220,12 @@ static int __init gunzip(void)
     error("out of input data");
     return -1;
 }
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.30.2


