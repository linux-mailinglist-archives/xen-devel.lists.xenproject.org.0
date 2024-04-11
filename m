Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E312B8A18F2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704038.1100134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwXw-0008B8-6p; Thu, 11 Apr 2024 15:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704038.1100134; Thu, 11 Apr 2024 15:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwXw-00088F-4D; Thu, 11 Apr 2024 15:41:04 +0000
Received: by outflank-mailman (input) for mailman id 704038;
 Thu, 11 Apr 2024 15:41:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyOp=LQ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ruwKA-0001Lt-1t
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:26:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8aa9416-f817-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 17:26:48 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1712849134652616.8489386519366;
 Thu, 11 Apr 2024 08:25:34 -0700 (PDT)
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
X-Inumbo-ID: e8aa9416-f817-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1712849136; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E58Lf3xgoVtF86ugEj9CKlfrWiASx4+nrMGVQCvnNo8XZop1KtMxqHMT6flc+NtypXZMbCtz8r74B22VBdUPlhEynKBsa709JSPNMJsLfQNx15gfwyGftBhLzI56cNYVXe8qncOMUD3bAPRDby+Z33LkCql1cqNNNB5V4nLJhK0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712849136; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hJK+WJnd5udbin6GvR9ns7l4RIkHc9Dr7sf74H4OiFw=; 
	b=RcqtzxNLf3bh92nJY4cmbvwcC9V1HPrA0wYq8RY8c/AJBUyk3Xb5mgNg05Gw6/zBMK2DQdrXTUZ2Jy9IwMLXMUouvFIMEwTBmS/18ellofRZfdIUwKLWEsqUIk/zo68pF3gpQNslBZw5lF4lktUMqQ+gieuK+OT7OarcYvgW/ko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712849136;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=hJK+WJnd5udbin6GvR9ns7l4RIkHc9Dr7sf74H4OiFw=;
	b=nHgtEdiN21wyE1rw3uC5evU5pmgtuArpFTwlnGAn4BPyZUMTnkc1aQQTNWgenFFr
	4AzF6zcR9qF0LchSt8/hSpkvXlx6U/FjkmYoeEAffnRnnw/y2SCvTfJf6no1gInXnpb
	4GXYBT/D/IQMfZ0mjZmY4Nu/r8vilWtujapHkys8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/5] gzip: move huffman code table tracking into gzip state
Date: Thu, 11 Apr 2024 11:25:18 -0400
Message-Id: <20240411152518.2995-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411152518.2995-1-dpsmith@apertussolutions.com>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  |  2 ++
 xen/common/gzip/inflate.c | 26 ++++++++++++--------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index a1b516b925c9..79a641263597 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -31,6 +31,8 @@ struct gzip_data {
 
     unsigned long crc_32_tab[256];
     unsigned long crc;
+
+    unsigned hufts;        /* track memory usage */
 };
 
 #define OF(args)        args
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 6c8c7452a31f..53ee1d8ce1e3 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -140,7 +140,7 @@ struct huft {
 };
 
 /* Function prototypes */
-static int huft_build OF((unsigned *, unsigned, unsigned,
+static int huft_build OF((struct gzip_data *, unsigned *, unsigned, unsigned,
                           const ush *, const ush *, struct huft **, int *));
 static int huft_free OF((struct huft *));
 static int inflate_codes OF((struct gzip_data *, struct huft *, struct huft *, int, int));
@@ -311,8 +311,6 @@ static const int dbits = 6;          /* bits in base distance lookup table */
 #define BMAX 16         /* maximum bit length of any code (16 for explode) */
 #define N_MAX 288       /* maximum number of codes in any set */
 
-static unsigned __initdata hufts;      /* track memory usage */
-
 /*
  * Given a list of code lengths and a maximum table size, make a set of
  * tables to decode that set of codes.  Return zero on success, one if
@@ -329,8 +327,8 @@ static unsigned __initdata hufts;      /* track memory usage */
  * @param m Maximum lookup bits, returns actual
  */
 static int __init huft_build(
-    unsigned *b, unsigned n, unsigned s, const ush *d, const ush *e,
-    struct huft **t, int *m)
+    struct gzip_data *gd, unsigned *b, unsigned n, unsigned s, const ush *d,
+    const ush *e, struct huft **t, int *m)
 {
     unsigned a;                   /* counter for codes of length k */
     unsigned f;                   /* i repeats in table every f entries */
@@ -492,7 +490,7 @@ static int __init huft_build(
                     goto out;
                 }
                 DEBG1("4 ");
-                hufts += z + 1;         /* track memory usage */
+                gd->hufts += z + 1;         /* track memory usage */
                 *t = q + 1;             /* link to list for huft_free() */
                 *(t = &(q->v.t)) = (struct huft *)NULL;
                 u[h] = ++q;             /* table starts after link */
@@ -787,7 +785,7 @@ static int noinline __init inflate_fixed(struct gzip_data *gd)
     for (; i < 288; i++)          /* make a complete, but wrong code set */
         l[i] = 8;
     bl = 7;
-    if ((i = huft_build(l, 288, 257, cplens, cplext, &tl, &bl)) != 0) {
+    if ((i = huft_build(gd, l, 288, 257, cplens, cplext, &tl, &bl)) != 0) {
         free(l);
         return i;
     }
@@ -796,7 +794,7 @@ static int noinline __init inflate_fixed(struct gzip_data *gd)
     for (i = 0; i < 30; i++)      /* make an incomplete code set */
         l[i] = 5;
     bd = 5;
-    if ((i = huft_build(l, 30, 0, cpdist, cpdext, &td, &bd)) > 1)
+    if ((i = huft_build(gd, l, 30, 0, cpdist, cpdext, &td, &bd)) > 1)
     {
         huft_free(tl);
         free(l);
@@ -894,7 +892,7 @@ static int noinline __init inflate_dynamic(struct gzip_data *gd)
 
     /* build decoding table for trees--single level, 7 bit lookup */
     bl = 7;
-    if ((i = huft_build(ll, 19, 19, NULL, NULL, &tl, &bl)) != 0)
+    if ((i = huft_build(gd, ll, 19, 19, NULL, NULL, &tl, &bl)) != 0)
     {
         if (i == 1)
             huft_free(tl);
@@ -971,7 +969,7 @@ static int noinline __init inflate_dynamic(struct gzip_data *gd)
 
     /* build the decoding tables for literal/length and distance codes */
     bl = lbits;
-    if ((i = huft_build(ll, nl, 257, cplens, cplext, &tl, &bl)) != 0)
+    if ((i = huft_build(gd, ll, nl, 257, cplens, cplext, &tl, &bl)) != 0)
     {
         DEBG("dyn5b ");
         if (i == 1) {
@@ -983,7 +981,7 @@ static int noinline __init inflate_dynamic(struct gzip_data *gd)
     }
     DEBG("dyn5c ");
     bd = dbits;
-    if ((i = huft_build(ll + nl, nd, 0, cpdist, cpdext, &td, &bd)) != 0)
+    if ((i = huft_build(gd, ll + nl, nd, 0, cpdist, cpdext, &td, &bd)) != 0)
     {
         DEBG("dyn5d ");
         if (i == 1) {
@@ -1090,15 +1088,15 @@ static int __init inflate(struct gzip_data *gd)
     /* decompress until the last block */
     h = 0;
     do {
-        hufts = 0;
+        gd->hufts = 0;
 #ifdef ARCH_HAS_DECOMP_WDOG
         arch_decomp_wdog();
 #endif
         r = inflate_block(gd, &e);
         if (r)
             return r;
-        if (hufts > h)
-            h = hufts;
+        if (gd->hufts > h)
+            h = gd->hufts;
     } while (!e);
 
     /* Undo too much lookahead. The next read will be byte aligned so we
-- 
2.30.2


