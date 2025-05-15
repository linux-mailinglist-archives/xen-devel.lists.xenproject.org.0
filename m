Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E8BAB87DB
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985414.1371399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYYU-0003gX-AE; Thu, 15 May 2025 13:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985414.1371399; Thu, 15 May 2025 13:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYYU-0003eB-70; Thu, 15 May 2025 13:23:22 +0000
Received: by outflank-mailman (input) for mailman id 985414;
 Thu, 15 May 2025 13:23:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYYT-0003FO-7O
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:23:21 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c43d0db4-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:23:20 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315204898137.1461395774836;
 Thu, 15 May 2025 06:20:04 -0700 (PDT)
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
X-Inumbo-ID: c43d0db4-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315208; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BzxyQjXRY00clL21ob1gVJLY385JcYVyBn1Hx/iww+l7hoZBGVRkpPQieqc/VxVACzL4Vevu7RVzqcQCyYxMf9vBB/DPDzJwMyOzYOu9Uzd9YO2DrHfAfxEvHb4YvAd1RUp06ZoEodfeLckRC5NLir+cKosDbkApxcb2GektUeY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315208; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TH0TMFdedjMThleKM+wTQxxJrcskN+YzfLSHIdAn7Rk=; 
	b=KLs05idmmBdlzfIwimUS5Hb49kjwHEonBlp5vATQ5rH2gp0tNkCxUCOUXaER0FLen2LbtphFGcMJkCV4hPGi0Gns1fNDa1oRsDkeUGOcHzFPpvr2BvZV+tDPsmMAR9VN4mYtVaUVnQ8W2xLoWeHdlHs8Vzj1YhkGS23ptwFqRNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315208;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=TH0TMFdedjMThleKM+wTQxxJrcskN+YzfLSHIdAn7Rk=;
	b=pDUcIuL5WktDikVhom0GsRJ5sWMuWIc5Vrycr6AEk52cILKY4X0DpCwZyZEVu8IJ
	T/a+klYONmKS4Oeux8QqeANFYc5vDNcJ7JuDFzFWXs3G3eIInDC9T6yPKAsHqoxWNf9
	Rp5rha7YVsXOcmPOJlhVQg0QskRcjz9A4gLnJG5I=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFCv2 31/38] common/gzip: add function to read isize field
Date: Thu, 15 May 2025 09:19:43 -0400
Message-Id: <20250515131951.5594-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131951.5594-1-dpsmith@apertussolutions.com>
References: <20250515131951.5594-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The gzip specification dictates that the last four bytes of a gzip
file will contain the modulo 2^32 of the original image size. Since
this is a function of gzip, relocate the logic under a gzip function.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/bzimage.c   | 10 +++-------
 xen/common/gzip/gunzip.c | 12 ++++++++++++
 xen/include/xen/gunzip.h |  3 +++
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311e4..eaea64b9c014 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -8,11 +8,6 @@
 #include <xen/libelf.h>
 #include <asm/bzimage.h>
 
-static __init unsigned long output_length(void *image, unsigned long image_len)
-{
-    return *(uint32_t *)(image + image_len - 4);
-}
-
 struct __packed setup_header {
         uint8_t         _pad0[0x1f1];           /* skip uninteresting stuff */
         uint8_t         setup_sects;
@@ -91,7 +86,8 @@ unsigned long __init bzimage_headroom(void *image_start,
         return 0;
 
     orig_image_len = image_length;
-    headroom = output_length(image_start, image_length);
+    /* Linux build system mimics gzip isize field for bzip2/lzma algos */
+    headroom = gzip_isize(image_start, image_length);
     if (gzip_check(image_start, image_length))
     {
         headroom += headroom >> 12; /* Add 8 bytes for every 32K input block */
@@ -124,7 +120,7 @@ int __init bzimage_parse(void *image_base, void **image_start,
 
     BUG_ON(!(image_base < *image_start));
 
-    output_len = output_length(*image_start, orig_image_len);
+    output_len = gzip_isize(*image_start, orig_image_len);
 
     if ( (err = perform_gunzip(image_base, *image_start, orig_image_len)) > 0 )
         err = decompress(*image_start, orig_image_len, image_base);
diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 89f45d4050ba..0963fe7bbd17 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -3,6 +3,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
+#include <xen/unaligned.h>
 
 #define WSIZE           0x80000000U
 
@@ -106,6 +107,17 @@ __init int gzip_check(char *image, unsigned long image_len)
     return (magic0 == 0x1f) && ((magic1 == 0x8b) || (magic1 == 0x9e));
 }
 
+/*
+ * RFC 1952 specifies the last four bytes as the isize field, the size of the
+ * original (uncompressed) input data modulo 2^32.
+ */
+__init uint32_t gzip_isize(char *image, unsigned long image_len)
+{
+    uint32_t *ptr = (uint32_t *)(image + image_len - 4);
+
+    return get_unaligned(ptr);
+}
+
 __init int perform_gunzip(char *output, char *image, unsigned long image_len)
 {
     struct gunzip_state *s;
diff --git a/xen/include/xen/gunzip.h b/xen/include/xen/gunzip.h
index 805833127aba..1b45350c195f 100644
--- a/xen/include/xen/gunzip.h
+++ b/xen/include/xen/gunzip.h
@@ -1,7 +1,10 @@
 #ifndef __XEN_GUNZIP_H
 #define __XEN_GUNZIP_H
 
+#include <xen/types.h>
+
 int gzip_check(char *image, unsigned long image_len);
+uint32_t gzip_isize(char *image, unsigned long image_len);
 int perform_gunzip(char *output, char *image, unsigned long image_len);
 
 #endif
-- 
2.30.2


