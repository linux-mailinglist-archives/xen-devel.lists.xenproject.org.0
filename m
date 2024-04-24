Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C9D8B0FFB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711549.1111598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfb0-0005Rx-9a; Wed, 24 Apr 2024 16:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711549.1111598; Wed, 24 Apr 2024 16:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfb0-0005Pw-6J; Wed, 24 Apr 2024 16:35:46 +0000
Received: by outflank-mailman (input) for mailman id 711549;
 Wed, 24 Apr 2024 16:35:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfaz-0003bR-6Q
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:35:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0bea6e8-0258-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 18:35:43 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713976477505550.3663677305303;
 Wed, 24 Apr 2024 09:34:37 -0700 (PDT)
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
X-Inumbo-ID: b0bea6e8-0258-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713976479; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cHvAo8SAjcDCHl0ltCjxca0dA/eTWmBjdjxSPD782ELuo64HhzzPcKWAV2lQA7thAyPb0jHfAUF4ciDwNXddoqYmVCdDEQYrU2Ppt87kQBxWc552JtuIiLrVfhs/dlZC66kHrjXnuNTk1oi7PEwo2VxzYkwqoWhudV8RL6g5qYk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713976479; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0AUXswEKZ492CVNKbtY21+GmWSjq8y8qXSbtGsUVrVA=; 
	b=cyNg+LmUrJ5ai4A4DR9u9gTt05BshUwz4xVq5bnxrPO+ngXmOnCoWAvHeIpDHt03plfeeyns33m5uC9FJrLwDMgF4mbK64CjCFLTBfX+4wHEDE+kzkpKIc6cq1SEov0dp0eUj4RSwlOaSTgEer2xHAYXxmGoRJDVWSajoLLTPeU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713976479;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=0AUXswEKZ492CVNKbtY21+GmWSjq8y8qXSbtGsUVrVA=;
	b=dJD1oQuD0DVvj8pWQ1NzJRfSgnj0MFgYlLLudFxqfgrwVFcoFfUYm8TSe6AnIB7R
	KgvPonLs/k3//eRJJb3ltz42zsHw0gEp6knu1tjwcdjSYQlsOya+JPnYRC4ox/Pn69O
	h25hla0xTL4Qqs8xY4/ehMWLkP4ZhOHTXR96nHSE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/8] gzip: move window pointer into gunzip state
Date: Wed, 24 Apr 2024 12:34:18 -0400
Message-Id: <20240424163422.23276-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move the window pointer, outcnt/wp, into struct gunzip_data. It was erroneously
labeled as outcnt and then define aliased to wp, this eliminates the aliasing
and only refers to as wp, the window pointer.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  | 11 +++++------
 xen/common/gzip/inflate.c | 17 ++++++++---------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index e47f10ae19ad..11bfe45d8222 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -8,6 +8,8 @@
 
 struct gunzip_state {
     unsigned char *window;
+    /* window pointer: */
+    unsigned int wp;
 };
 
 static unsigned char *__initdata inbuf;
@@ -16,9 +18,6 @@ static unsigned int __initdata insize;
 /* Index of next byte to be processed in inbuf: */
 static unsigned int __initdata inptr;
 
-/* Bytes in output buffer: */
-static unsigned int __initdata outcnt;
-
 #define malloc(a)       xmalloc_bytes(a)
 #define free(a)         xfree(a)
 #define memzero(s, n)   memset((s), 0, (n))
@@ -75,15 +74,15 @@ static __init void flush_window(struct gunzip_state *s)
     unsigned char *in, ch;
 
     in = s->window;
-    for ( n = 0; n < outcnt; n++ )
+    for ( n = 0; n < s->wp; n++ )
     {
         ch = *in++;
         c = crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
     }
     crc = c;
 
-    bytes_out += (unsigned long)outcnt;
-    outcnt = 0;
+    bytes_out += (unsigned long)s->wp;
+    s->wp = 0;
 }
 
 __init int gzip_check(char *image, unsigned long image_len)
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 5fa5c039c6d1..78b2f20a97ba 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -130,7 +130,6 @@ static char rcsid[] = "#Id: inflate.c,v 0.14 1993/06/10 13:27:04 jloup Exp #";
  * "uch *window;" and then malloc'ed in the latter case.  The definition
  * must be in unzip.h, included above.
  */
-#define wp outcnt
 
 /*
  * Huffman code lookup table entry--this entry is four bytes for machines
@@ -556,7 +555,7 @@ static int __init inflate_codes(
     /* make local copies of globals */
     b = bb;                       /* initialize bit buffer */
     k = bk;
-    w = wp;                       /* initialize window position */
+    w = s->wp;                    /* initialize window position */
 
     /* inflate the coded data */
     ml = mask_bits[bl];           /* precompute masks for speed */
@@ -579,7 +578,7 @@ static int __init inflate_codes(
             Tracevv((stderr, "%c", s->window[w-1]));
             if (w == WSIZE)
             {
-                wp = w;
+                s->wp = w;
                 flush_window(s);
                 w = 0;
             }
@@ -627,7 +626,7 @@ static int __init inflate_codes(
                     } while (--e);
                 if (w == WSIZE)
                 {
-                    wp = w;
+                    s->wp = w;
                     flush_window(s);
                     w = 0;
                 }
@@ -636,7 +635,7 @@ static int __init inflate_codes(
     }
 
     /* restore the globals from the locals */
-    wp = w;                       /* restore global window pointer */
+    s->wp = w;                    /* restore global window pointer */
     bb = b;                       /* restore global bit buffer */
     bk = k;
 
@@ -657,7 +656,7 @@ static int __init inflate_stored(struct gunzip_state *s)
     /* make local copies of globals */
     b = bb;                       /* initialize bit buffer */
     k = bk;
-    w = wp;                       /* initialize window position */
+    w = s->wp;                    /* initialize window position */
 
 
     /* go to byte boundary */
@@ -681,7 +680,7 @@ static int __init inflate_stored(struct gunzip_state *s)
         s->window[w++] = (uch)b;
         if (w == WSIZE)
         {
-            wp = w;
+            s->wp = w;
             flush_window(s);
             w = 0;
         }
@@ -689,7 +688,7 @@ static int __init inflate_stored(struct gunzip_state *s)
     }
 
     /* restore the globals from the locals */
-    wp = w;                       /* restore global window pointer */
+    s->wp = w;                    /* restore global window pointer */
     bb = b;                       /* restore global bit buffer */
     bk = k;
 
@@ -1004,7 +1003,7 @@ static int __init inflate(struct gunzip_state *s)
     int r;                /* result code */
 
     /* initialize window, bit buffer */
-    wp = 0;
+    s->wp = 0;
     bk = 0;
     bb = 0;
 
-- 
2.30.2


