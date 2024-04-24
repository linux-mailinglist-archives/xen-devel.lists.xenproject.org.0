Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CF8B0FFF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711556.1111618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfbQ-0006WA-TC; Wed, 24 Apr 2024 16:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711556.1111618; Wed, 24 Apr 2024 16:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfbQ-0006TL-PR; Wed, 24 Apr 2024 16:36:12 +0000
Received: by outflank-mailman (input) for mailman id 711556;
 Wed, 24 Apr 2024 16:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfbQ-0004Nw-8L
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:36:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c16e6c75-0258-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 18:36:11 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 171397648019646.93850897623827;
 Wed, 24 Apr 2024 09:34:40 -0700 (PDT)
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
X-Inumbo-ID: c16e6c75-0258-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1713976481; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dxilOEIuuqYyyic74PF4BudElh/dyY/OViM75l9ofaXLnmaRhs05MsbZgRAGVJTMAmwFsWBal8t4mSyrJnpbMEExq3wOCIDNQGwkGIOUsoSdI4gBUJ2Xc04bQ+poByHI4bgoX2cb6Fim7ICWg2BoD2d3JYHhZU8eG82ThfeG1uQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713976481; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WfcMj3qazSdzkU6dFM26hg04wmGK/gWTZz4wD/ytpcY=; 
	b=AJX/SJcXOCzkBTso6hSAlOLe4oLja+dCaw4zNNpYuSgMHK206t5dMD96V9yinphBBC8x+YEV0DaSz5WyDLI8LO4+DvJCg/soHINLgTZ8YgB4bQw6Ugwtsj80oyqGOPsFmb60cLahZE7HrHBK5tmM2R10ofXLSnVaumk3UhY0I3w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713976481;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=WfcMj3qazSdzkU6dFM26hg04wmGK/gWTZz4wD/ytpcY=;
	b=WnRohkOe4Dnx8i+rfQ2gRrFxJC5FnzVDHwaw6cQ5zhwRgw7andrFfYTY3moHFCh1
	ntP/n4WD5KhY9xZCuxonBOiRl4UyFFtWZO1uNKxRzIrYsGJxOkD9SM4vddyVxwhKqd3
	9S+UJFDQZS840BVgsekVn7d0kREDTqoyndno3+XA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 6/8] gzip: move output buffer into gunzip state
Date: Wed, 24 Apr 2024 12:34:20 -0400
Message-Id: <20240424163422.23276-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  | 7 ++++---
 xen/common/gzip/inflate.c | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 3fb9589b069e..95d924d36726 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -15,6 +15,8 @@ struct gunzip_state {
     size_t insize;
     /* Index of next byte to be processed in inbuf: */
     unsigned int inptr;
+
+    unsigned long bytes_out;
 };
 
 #define malloc(a)       xmalloc_bytes(a)
@@ -42,7 +44,6 @@ typedef unsigned long   ulg;
 #  define Tracecv(c, x)
 #endif
 
-static long __initdata bytes_out;
 static void flush_window(struct gunzip_state *s);
 
 static __init void error(const char *x)
@@ -80,7 +81,7 @@ static __init void flush_window(struct gunzip_state *s)
     }
     crc = c;
 
-    bytes_out += (unsigned long)s->wp;
+    s->bytes_out += (unsigned long)s->wp;
     s->wp = 0;
 }
 
@@ -113,7 +114,7 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
     s->inbuf = (unsigned char *)image;
     s->insize = image_len;
     s->inptr = 0;
-    bytes_out = 0;
+    s->bytes_out = 0;
 
     makecrc();
 
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index f1a3b04cef8f..bec8801df487 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -1196,7 +1196,7 @@ static int __init gunzip(struct gunzip_state *s)
         error("crc error");
         return -1;
     }
-    if (orig_len != bytes_out) {
+    if (orig_len != s->bytes_out) {
         error("length error");
         return -1;
     }
-- 
2.30.2


