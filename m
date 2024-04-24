Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06E8B101F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711577.1111637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfjv-0000xW-W9; Wed, 24 Apr 2024 16:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711577.1111637; Wed, 24 Apr 2024 16:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfjv-0000vJ-S5; Wed, 24 Apr 2024 16:44:59 +0000
Received: by outflank-mailman (input) for mailman id 711577;
 Wed, 24 Apr 2024 16:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfbl-0003bR-Tk
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:36:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdf34ca4-0258-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 18:36:32 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 171397648270479.70664995052266;
 Wed, 24 Apr 2024 09:34:42 -0700 (PDT)
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
X-Inumbo-ID: cdf34ca4-0258-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713976484; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AlyBkr7vRELb9OZgKoY86rk/e8RHTEPl8vsjYxS057ZiJ8Jwhw2KctazvrNKEUIRKaJI7H5Dk3bnsq2Dq6/dHkKyprTP5POhx7SSyCQw2a6ZAwWG88VycbXwO0shXU/F0ZAXKKXRK0g/DZqw4B4MTygBP0P/oKUtQwsTON4qMHc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713976484; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M8gAJdmgMZCBZZxYvLiNHfqbdQwdAs2zGNh3/Notb+Q=; 
	b=YuOFaZzZyA56ZcB/4AUMOKbwUHZbZjgYYpJ1eQWiNGeqzwpdj1IRXv93DNpFAA/POUXlXWSv/IDCLMzNjbxK9WK/N5FO/i0JBMHI//guSf4VbwQLJvh4yQaQm/MjHzycapq/az/y6pUC527ak7L6qn6X2n6xyR8o8hgZrlD6VBM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713976484;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=M8gAJdmgMZCBZZxYvLiNHfqbdQwdAs2zGNh3/Notb+Q=;
	b=AYxzNcO0LTEyzbNbhYa0uxnRag4ITs6oUa+vX4id7Wzo3dMCHFbaw9ksfwAbAIG2
	BAVr2sLvU+mu5mezc6n4cVoPkVv89ijksnG+NiX3n36d/c9o4Qhne1YsAatR71P+OEp
	RDIJbNCDNeW/BSkvElujuSDdJ/Z0/9S78XEWYneQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 8/8] gzip: move crc state into gunzip state
Date: Wed, 24 Apr 2024 12:34:22 -0400
Message-Id: <20240424163422.23276-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move the crc and its state into struct gunzip_state. In the process, expand the
only use of CRC_VALUE as it is hides what is being compared.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  | 11 +++++++----
 xen/common/gzip/inflate.c | 14 +++++---------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 0043ff8ac886..26d2a4aa9d36 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -20,6 +20,9 @@ struct gunzip_state {
 
     unsigned long bb;      /* bit buffer */
     unsigned int  bk;      /* bits in bit buffer */
+
+    uint32_t crc_32_tab[256];
+    uint32_t crc;
 };
 
 #define malloc(a)       xmalloc_bytes(a)
@@ -72,7 +75,7 @@ static __init void flush_window(struct gunzip_state *s)
      * The window is equal to the output buffer therefore only need to
      * compute the crc.
      */
-    unsigned long c = crc;
+    unsigned int c = s->crc;
     unsigned int n;
     unsigned char *in, ch;
 
@@ -80,9 +83,9 @@ static __init void flush_window(struct gunzip_state *s)
     for ( n = 0; n < s->wp; n++ )
     {
         ch = *in++;
-        c = crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
+        c = s->crc_32_tab[((int)c ^ ch) & 0xff] ^ (c >> 8);
     }
-    crc = c;
+    s->crc = c;
 
     s->bytes_out += (unsigned long)s->wp;
     s->wp = 0;
@@ -119,7 +122,7 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
     s->inptr = 0;
     s->bytes_out = 0;
 
-    makecrc();
+    makecrc(s);
 
     if ( gunzip(s) < 0 )
     {
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 8da14880cfbe..dc940e59d853 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -1032,16 +1032,12 @@ static int __init inflate(struct gunzip_state *s)
  *
  **********************************************************************/
 
-static ulg __initdata crc_32_tab[256];
-static ulg __initdata crc;  /* initialized in makecrc() so it'll reside in bss */
-#define CRC_VALUE (crc ^ 0xffffffffUL)
-
 /*
  * Code to compute the CRC-32 table. Borrowed from
  * gzip-1.0.3/makecrc.c.
  */
 
-static void __init makecrc(void)
+static void __init makecrc(struct gunzip_state *s)
 {
 /* Not copyrighted 1990 Mark Adler */
 
@@ -1058,7 +1054,7 @@ static void __init makecrc(void)
     for (i = 0; i < sizeof(p)/sizeof(int); i++)
         e |= 1L << (31 - p[i]);
 
-    crc_32_tab[0] = 0;
+    s->crc_32_tab[0] = 0;
 
     for (i = 1; i < 256; i++)
     {
@@ -1069,11 +1065,11 @@ static void __init makecrc(void)
             if (k & 1)
                 c ^= e;
         }
-        crc_32_tab[i] = c;
+        s->crc_32_tab[i] = c;
     }
 
     /* this is initialized here so this code could reside in ROM */
-    crc = (ulg)0xffffffffUL; /* shift register contents */
+    s->crc = (ulg)~0u; /* shift register contents */
 }
 
 /* gzip flag byte */
@@ -1189,7 +1185,7 @@ static int __init gunzip(struct gunzip_state *s)
     orig_len |= (ulg) NEXTBYTE(s) << 24;
 
     /* Validate decompression */
-    if (orig_crc != CRC_VALUE) {
+    if (orig_crc != (s->crc ^ ~0u)) {
         error("crc error");
         return -1;
     }
-- 
2.30.2


