Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D018B1020
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711576.1111628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfjm-0000ci-Ma; Wed, 24 Apr 2024 16:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711576.1111628; Wed, 24 Apr 2024 16:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfjm-0000Zo-Jn; Wed, 24 Apr 2024 16:44:50 +0000
Received: by outflank-mailman (input) for mailman id 711576;
 Wed, 24 Apr 2024 16:44:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfbb-0003bR-9M
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:36:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c77b1c2d-0258-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 18:36:21 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713976481520663.263161516237;
 Wed, 24 Apr 2024 09:34:41 -0700 (PDT)
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
X-Inumbo-ID: c77b1c2d-0258-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713976483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JH6QU0I/6YPh0mArAMv8iBmrUi2NsE39dmjtiINwiG9XyhF2nfomiS9ycH4UsFpkyktSm9BgyNqkcEHJO0hxK5paNgpWkSuhv76gyNopLP5YTStKihQny+T0omOaiAaZ+ZqSqTIWjH/Fbf3+Q+qaktSSPRGWrnPebwa1jY+84Js=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713976483; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8pldy3TNL6KFRY4ywvIzOgCA04ifZ9Z2rJCVrvqIcNc=; 
	b=c/ObueBeUbKZ+w/Hkoe2CTZR5Gx2SFRVaoXgGCjfq2l4OiD+CVUJ79MUE2GfN4w8hdQN+JWT/SbsEPVkB6k7n/9Ppb65wzfHxuRfkYK/4QDBMGPTzFgAJToxIHflciQoX8tJnWT2nZgcyMJVtcUfOWdJas6BQda+4+UhpNLACSM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713976483;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8pldy3TNL6KFRY4ywvIzOgCA04ifZ9Z2rJCVrvqIcNc=;
	b=WWO/TV/AroDuKOsS4UzJdwrd5c5D0vtnrcM91XPZHlBsNRn2D6YjaPeiI/TI1jrc
	owfpfBnNO47HKseS4htLfPzwPXow/QTLiagRFY6l2atdk7UjGikYYqDanNVS9yxqqwn
	xeja0CEejn2LyRDjs827M8knG92uQied2JH9bV3o=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 7/8] gzip: move bitbuffer into gunzip state
Date: Wed, 24 Apr 2024 12:34:21 -0400
Message-Id: <20240424163422.23276-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  |  3 +++
 xen/common/gzip/inflate.c | 43 ++++++++++++++++++---------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 95d924d36726..0043ff8ac886 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -17,6 +17,9 @@ struct gunzip_state {
     unsigned int inptr;
 
     unsigned long bytes_out;
+
+    unsigned long bb;      /* bit buffer */
+    unsigned int  bk;      /* bits in bit buffer */
 };
 
 #define malloc(a)       xmalloc_bytes(a)
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index bec8801df487..8da14880cfbe 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -211,9 +211,6 @@ static const ush cpdext[] = {         /* Extra bits for distance codes */
  * the stream.
  */
 
-static ulg __initdata bb;                /* bit buffer */
-static unsigned __initdata bk;           /* bits in bit buffer */
-
 static const ush mask_bits[] = {
     0x0000,
     0x0001, 0x0003, 0x0007, 0x000f, 0x001f, 0x003f, 0x007f, 0x00ff,
@@ -553,8 +550,8 @@ static int __init inflate_codes(
 
 
     /* make local copies of globals */
-    b = bb;                       /* initialize bit buffer */
-    k = bk;
+    b = s->bb;                    /* initialize bit buffer */
+    k = s->bk;
     w = s->wp;                    /* initialize window position */
 
     /* inflate the coded data */
@@ -636,8 +633,8 @@ static int __init inflate_codes(
 
     /* restore the globals from the locals */
     s->wp = w;                    /* restore global window pointer */
-    bb = b;                       /* restore global bit buffer */
-    bk = k;
+    s->bb = b;                    /* restore global bit buffer */
+    s->bk = k;
 
     /* done */
     return 0;
@@ -654,8 +651,8 @@ static int __init inflate_stored(struct gunzip_state *s)
     DEBG("<stor");
 
     /* make local copies of globals */
-    b = bb;                       /* initialize bit buffer */
-    k = bk;
+    b = s->bb;                    /* initialize bit buffer */
+    k = s->bk;
     w = s->wp;                    /* initialize window position */
 
 
@@ -689,8 +686,8 @@ static int __init inflate_stored(struct gunzip_state *s)
 
     /* restore the globals from the locals */
     s->wp = w;                    /* restore global window pointer */
-    bb = b;                       /* restore global bit buffer */
-    bk = k;
+    s->bb = b;                    /* restore global bit buffer */
+    s->bk = k;
 
     DEBG(">");
     return 0;
@@ -794,8 +791,8 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
         return 1;
 
     /* make local bit buffer */
-    b = bb;
-    k = bk;
+    b = s->bb;
+    k = s->bk;
 
     /* read in table lengths */
     NEEDBITS(s, 5);
@@ -899,8 +896,8 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
     DEBG("dyn5 ");
 
     /* restore the global bit buffer */
-    bb = b;
-    bk = k;
+    s->bb = b;
+    s->bk = k;
 
     DEBG("dyn5a ");
 
@@ -965,8 +962,8 @@ static int __init inflate_block(struct gunzip_state *s, int *e)
     DEBG("<blk");
 
     /* make local bit buffer */
-    b = bb;
-    k = bk;
+    b = s->bb;
+    k = s->bk;
 
     /* read in last block bit */
     NEEDBITS(s, 1);
@@ -979,8 +976,8 @@ static int __init inflate_block(struct gunzip_state *s, int *e)
     DUMPBITS(2);
 
     /* restore the global bit buffer */
-    bb = b;
-    bk = k;
+    s->bb = b;
+    s->bk = k;
 
     /* inflate that block type */
     if (t == 2)
@@ -1004,8 +1001,8 @@ static int __init inflate(struct gunzip_state *s)
 
     /* initialize window, bit buffer */
     s->wp = 0;
-    bk = 0;
-    bb = 0;
+    s->bk = 0;
+    s->bb = 0;
 
     /* decompress until the last block */
     do {
@@ -1017,8 +1014,8 @@ static int __init inflate(struct gunzip_state *s)
     /* Undo too much lookahead. The next read will be byte aligned so we
      * can discard unused bits in the last meaningful byte.
      */
-    while (bk >= 8) {
-        bk -= 8;
+    while (s->bk >= 8) {
+        s->bk -= 8;
         s->inptr--;
     }
 
-- 
2.30.2


