Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6839330395D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74702.134255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kxk-00083o-EZ; Tue, 26 Jan 2021 09:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74702.134255; Tue, 26 Jan 2021 09:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kxk-00083S-Az; Tue, 26 Jan 2021 09:48:40 +0000
Received: by outflank-mailman (input) for mailman id 74702;
 Tue, 26 Jan 2021 09:48:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Kxi-00083J-M6
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:48:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a388354e-e6a0-4e78-94f2-546165a81326;
 Tue, 26 Jan 2021 09:48:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 233FBAC4F;
 Tue, 26 Jan 2021 09:48:37 +0000 (UTC)
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
X-Inumbo-ID: a388354e-e6a0-4e78-94f2-546165a81326
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LNszWFUAzLqr7lzoTEEIij7QH8NvHbiS55vXjywYvs=;
	b=TbIMgSUJi8H5jOVhyJV7dPdh87gLkGgplEA9OOswTALic7olkcUOIpoZJtzuvKnlTwsKM+
	KrAygWQEAkzJn1mKJ1YwpoQO7XcEp5x+ZXO4OIS9XvXjEmb4RxoWanXo5/F0aU2Ye1rh7N
	RyBwBTPKNq7YpbHal6j8rXJNx2PyJSI=
Subject: [PATCH v3 01/15] libxenguest: add get_unaligned_le32()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <a6cafbb2-9a85-e83a-7954-de5f8962c9a6@suse.com>
Date: Tue, 26 Jan 2021 10:48:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Abstract xc_dom_check_gzip()'s reading of the uncompressed size into a
helper re-usable, in particular, by other decompressor code.

Sadly in the mini-os case this conflicts with other functions of the
same name (and purpose), which can't be easily replaced individually.
Yet it was requested that no full set of helpers be introduced at this
point in the release cycle. Hence the awkward XG_NEED_UNALIGNED.

Requested-by: Ian Jackson <iwj@xenproject.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -31,6 +31,7 @@
 #include <zlib.h>
 #include <assert.h>
 
+#define XG_NEED_UNALIGNED
 #include "xg_private.h"
 #include "_paths.h"
 
@@ -325,7 +326,6 @@ int xc_dom_kernel_check_size(struct xc_d
 
 size_t xc_dom_check_gzip(xc_interface *xch, void *blob, size_t ziplen)
 {
-    unsigned char *gzlen;
     size_t unziplen;
 
     if ( ziplen < 6 )
@@ -337,8 +337,7 @@ size_t xc_dom_check_gzip(xc_interface *x
         /* not gzipped */
         return 0;
 
-    gzlen = blob + ziplen - 4;
-    unziplen = (size_t)gzlen[3] << 24 | gzlen[2] << 16 | gzlen[1] << 8 | gzlen[0];
+    unziplen = get_unaligned_le32(blob + ziplen - 4);
     if ( unziplen > XC_DOM_DECOMPRESS_MAX )
     {
         xc_dom_printf
--- a/tools/libs/guest/xg_dom_decompress_lz4.c
+++ b/tools/libs/guest/xg_dom_decompress_lz4.c
@@ -3,6 +3,7 @@
 #include <inttypes.h>
 #include <stdint.h>
 
+#define XG_NEED_UNALIGNED
 #include "xg_private.h"
 #include "xg_dom_decompress.h"
 
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -62,6 +62,15 @@ char *xc_inflate_buffer(xc_interface *xc
                         unsigned long in_size,
                         unsigned long *out_size);
 
+#if !defined(__MINIOS__) || defined(XG_NEED_UNALIGNED)
+
+static inline unsigned int get_unaligned_le32(const uint8_t *buf)
+{
+    return ((unsigned int)buf[3] << 24) | (buf[2] << 16) | (buf[1] << 8) | buf[0];
+}
+
+#endif /* !__MINIOS__ || XG_NEED_UNALIGNED */
+
 unsigned long csum_page (void * page);
 
 #define _PAGE_PRESENT   0x001
--- a/xen/common/lz4/defs.h
+++ b/xen/common/lz4/defs.h
@@ -18,11 +18,6 @@ static inline u16 get_unaligned_le16(con
 	return le16_to_cpup(p);
 }
 
-static inline u32 get_unaligned_le32(const void *p)
-{
-	return le32_to_cpup(p);
-}
-
 #endif
 
 /*


