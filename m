Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 290EF8B0FF3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711542.1111577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfaY-0004U4-Pc; Wed, 24 Apr 2024 16:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711542.1111577; Wed, 24 Apr 2024 16:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfaY-0004RV-MU; Wed, 24 Apr 2024 16:35:18 +0000
Received: by outflank-mailman (input) for mailman id 711542;
 Wed, 24 Apr 2024 16:35:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfaY-0003bR-5u
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:35:18 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0b8af32-0258-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 18:35:16 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713976475032507.12087765943556;
 Wed, 24 Apr 2024 09:34:35 -0700 (PDT)
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
X-Inumbo-ID: a0b8af32-0258-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713976476; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E8H9lGEt4Ey9UT2f26xsuP9rMdYbs1/cEGKkSmM2driZi/uwT/k+oeueW6gB2qMTcigjCqjTwdnHqPDzIz3uTT+WT6B8IqIXnb9yIeB/3QlbpPE9KU2ruKaLtpkFFGpW4y7T6MJSi5C+FEFJatNeO43HhypFjwRX53P/m/1alRc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713976476; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cOmaDNGXv/TRorh7Z/jIaiR6qK0G3rYf1DO1xU/BTKU=; 
	b=Rt1a+pFpDxutA4VCldGh2CXvPayeWr/GrubkWCJfq+kO81sB0/UrPvCfzE37HuGZsI2C45DdFvtFGP8zButFIYWtnk0r8ElqCGZfeI0C8x3qS6aXmXEjECPATbo0XMC9O4lrdnA3qF5bq7W+54kapTmRIOw8VMBM8PO1E2PpP8Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713976476;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=cOmaDNGXv/TRorh7Z/jIaiR6qK0G3rYf1DO1xU/BTKU=;
	b=oRBb56pvGuqRJhsNIRrkNl+eRvzGtYnYgL0C9+HzuoxejCpZ3CH5nXlGbbU7NdrL
	6mUMUdKtXpn+5TAgiV5KdIkK/T9jssQsDEaTpkawheQcfNGOk5hrMQkbonyezYryLCG
	Xi/d9tuiS1D1ny5jDX9SOS4JJQJxiNPEjcfJLibg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/8] gzip: refactor and expand macros
Date: Wed, 24 Apr 2024 12:34:16 -0400
Message-Id: <20240424163422.23276-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit refactors macros into proper static functions. It in-place expands
the `flush_output` macro, allowing the clear removal of the dead code
underneath the `underrun` label.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  | 14 +++++----
 xen/common/gzip/inflate.c | 61 ++++++++++++++-------------------------
 2 files changed, 30 insertions(+), 45 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index d07c451cd875..b7cadadcca8b 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -25,8 +25,6 @@ typedef unsigned char   uch;
 typedef unsigned short  ush;
 typedef unsigned long   ulg;
 
-#define get_byte()      (inptr < insize ? inbuf[inptr++] : fill_inbuf())
-
 /* Diagnostic functions */
 #ifdef DEBUG
 #  define Assert(cond, msg) do { if (!(cond)) error(msg); } while (0)
@@ -52,10 +50,14 @@ static __init void error(const char *x)
     panic("%s\n", x);
 }
 
-static __init int fill_inbuf(void)
-{
-    error("ran out of input data");
-    return 0;
+static __init uch get_byte(void) {
+    if ( inptr >= insize )
+    {
+        error("ran out of input data");
+        return 0; /* should never reach */
+    }
+
+    return inbuf[inptr++];
 }
 
 #include "inflate.c"
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 220d2ff4d9d9..02a395aeb86a 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -119,6 +119,18 @@ static char rcsid[] = "#Id: inflate.c,v 0.14 1993/06/10 13:27:04 jloup Exp #";
 
 #endif /* !__XEN__ */
 
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
+#define wp outcnt
 #define slide window
 
 /*
@@ -150,21 +162,6 @@ static int inflate_dynamic(void);
 static int inflate_block(int *);
 static int inflate(void);
 
-/*
- * The inflate algorithm uses a sliding 32 K byte window on the uncompressed
- * stream to find repeated byte strings.  This is implemented here as a
- * circular buffer.  The index is updated simply by incrementing and then
- * ANDing with 0x7fff (32K-1).
- *
- * It is left to other modules to supply the 32 K area.  It is assumed
- * to be usable as if it were declared "uch slide[32768];" or as just
- * "uch *slide;" and then malloc'ed in the latter case.  The definition
- * must be in unzip.h, included above.
- */
-/* unsigned wp;             current position in slide */
-#define wp outcnt
-#define flush_output(w) (wp=(w),flush_window())
-
 /* Tables for deflate from PKZIP's appnote.txt. */
 static const unsigned border[] = {    /* Order of the bit length code lengths */
     16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15};
@@ -224,7 +221,7 @@ static const ush mask_bits[] = {
     0x01ff, 0x03ff, 0x07ff, 0x0fff, 0x1fff, 0x3fff, 0x7fff, 0xffff
 };
 
-#define NEXTBYTE()  ({ int v = get_byte(); if (v < 0) goto underrun; (uch)v; })
+#define NEXTBYTE()  (get_byte()) /* get_byte will panic on failure */
 #define NEEDBITS(n) {while(k<(n)){b|=((ulg)NEXTBYTE())<<k;k+=8;}}
 #define DUMPBITS(n) {b>>=(n);k-=(n);}
 
@@ -582,7 +579,8 @@ static int __init inflate_codes(
             Tracevv((stderr, "%c", slide[w-1]));
             if (w == WSIZE)
             {
-                flush_output(w);
+                wp = w;
+                flush_window();
                 w = 0;
             }
         }
@@ -629,7 +627,8 @@ static int __init inflate_codes(
                     } while (--e);
                 if (w == WSIZE)
                 {
-                    flush_output(w);
+                    wp = w;
+                    flush_window();
                     w = 0;
                 }
             } while (n);
@@ -643,9 +642,6 @@ static int __init inflate_codes(
 
     /* done */
     return 0;
-
- underrun:
-    return 4;   /* Input underrun */
 }
 
 /* "decompress" an inflated type 0 (stored) block. */
@@ -685,7 +681,8 @@ static int __init inflate_stored(void)
         slide[w++] = (uch)b;
         if (w == WSIZE)
         {
-            flush_output(w);
+            wp = w;
+            flush_window();
             w = 0;
         }
         DUMPBITS(8);
@@ -698,9 +695,6 @@ static int __init inflate_stored(void)
 
     DEBG(">");
     return 0;
-
- underrun:
-    return 4;   /* Input underrun */
 }
 
 
@@ -956,10 +950,6 @@ static int noinline __init inflate_dynamic(void)
  out:
     free(ll);
     return ret;
-
- underrun:
-    ret = 4;   /* Input underrun */
-    goto out;
 }
 
 /*
@@ -1005,9 +995,6 @@ static int __init inflate_block(int *e)
 
     /* bad block type */
     return 2;
-
- underrun:
-    return 4;   /* Input underrun */
 }
 
 /* decompress an inflated entry */
@@ -1037,7 +1024,7 @@ static int __init inflate(void)
     }
 
     /* flush out slide */
-    flush_output(wp);
+    flush_window();
 
     /* return success */
     return 0;
@@ -1148,8 +1135,8 @@ static int __init gunzip(void)
     NEXTBYTE();
     NEXTBYTE();
 
-    (void)NEXTBYTE();  /* Ignore extra flags for the moment */
-    (void)NEXTBYTE();  /* Ignore OS type for the moment */
+    NEXTBYTE();  /* Ignore extra flags for the moment */
+    NEXTBYTE();  /* Ignore OS type for the moment */
 
     if ((flags & EXTRA_FIELD) != 0) {
         unsigned len = (unsigned)NEXTBYTE();
@@ -1215,10 +1202,6 @@ static int __init gunzip(void)
         return -1;
     }
     return 0;
-
- underrun:   /* NEXTBYTE() goto's here if needed */
-    error("out of input data");
-    return -1;
 }
 
 /*
-- 
2.30.2


