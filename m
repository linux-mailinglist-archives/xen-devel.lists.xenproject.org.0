Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D911303965
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74714.134292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kyo-0008S3-Ea; Tue, 26 Jan 2021 09:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74714.134292; Tue, 26 Jan 2021 09:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kyo-0008Rd-BB; Tue, 26 Jan 2021 09:49:46 +0000
Received: by outflank-mailman (input) for mailman id 74714;
 Tue, 26 Jan 2021 09:49:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Kym-0008RQ-Pf
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:49:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68cd4557-f601-4ef0-83d7-aa9c844d6dfb;
 Tue, 26 Jan 2021 09:49:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A3C1AE40;
 Tue, 26 Jan 2021 09:49:43 +0000 (UTC)
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
X-Inumbo-ID: 68cd4557-f601-4ef0-83d7-aa9c844d6dfb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QX8/cPAcmhUJDAaeMJZCNy+hflROg1060DEkwWtrtPo=;
	b=SZUO77Pe7gMAKaIweSIB6BYEF8CvRuCVMiAJPpYKS84vBGNxize0z01SDOnbGNJ9JjknYf
	QYWUz4PP0ql093s6DZJilHAdlt6FxmaG9R0RGWNHiar3/w2ZfOtI3iE2dNtYvoCpN5kOdx
	gAFc4z0XHqJT53wcwoIJIXHEtvB3X8A=
Subject: [PATCH v3 04/15] libxenguest: "standardize" LZO kernel decompression
 code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <44286280-0203-8eb9-8006-43125aeb77c7@suse.com>
Date: Tue, 26 Jan 2021 10:49:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Add a DOMPRINTF() other methods have, indicating success. To facilitate
this, introduce an "outsize" local variable and update *size as well as
*blob only once done. The latter then also avoids leaving a pointer to
freed memory in dom->kernel_blob in case of a decompression error.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Wei Liu <wl@xen.org>
Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2: New.

--- a/tools/libs/guest/xg_dom_bzimageloader.c
+++ b/tools/libs/guest/xg_dom_bzimageloader.c
@@ -409,7 +409,7 @@ static int xc_try_lzo1x_decode(
     int ret;
     const unsigned char *cur = dom->kernel_blob;
     unsigned char *out_buf = NULL;
-    size_t left = dom->kernel_size;
+    size_t left = dom->kernel_size, outsize;
     const char *msg;
     unsigned version;
     static const unsigned char magic[] = {
@@ -471,7 +471,7 @@ static int xc_try_lzo1x_decode(
     cur += ret;
     left -= ret;
 
-    for ( *size = 0; ; )
+    for ( outsize = 0; ; )
     {
         lzo_uint src_len, dst_len, out_len;
         unsigned char *tmp_buf;
@@ -484,9 +484,15 @@ static int xc_try_lzo1x_decode(
         if ( !dst_len )
         {
             msg = "Error registering stream output";
-            if ( xc_dom_register_external(dom, out_buf, *size) )
+            if ( xc_dom_register_external(dom, out_buf, outsize) )
                 break;
 
+            DOMPRINTF("%s: LZO decompress OK, 0x%zx -> 0x%zx",
+                      __FUNCTION__, *size, outsize);
+
+            *blob = out_buf;
+            *size = outsize;
+
             return 0;
         }
 
@@ -508,15 +514,15 @@ static int xc_try_lzo1x_decode(
             break;
 
         msg = "Output buffer overflow";
-        if ( *size > SIZE_MAX - dst_len )
+        if ( outsize > SIZE_MAX - dst_len )
             break;
 
         msg = "Decompressed image too large";
-        if ( xc_dom_kernel_check_size(dom, *size + dst_len) )
+        if ( xc_dom_kernel_check_size(dom, outsize + dst_len) )
             break;
 
         msg = "Failed to (re)alloc memory";
-        tmp_buf = realloc(out_buf, *size + dst_len);
+        tmp_buf = realloc(out_buf, outsize + dst_len);
         if ( tmp_buf == NULL )
             break;
 
@@ -524,7 +530,7 @@ static int xc_try_lzo1x_decode(
         out_len = dst_len;
 
         ret = lzo1x_decompress_safe(cur, src_len,
-                                    out_buf + *size, &out_len, NULL);
+                                    out_buf + outsize, &out_len, NULL);
         switch ( ret )
         {
         case LZO_E_OK:
@@ -532,8 +538,7 @@ static int xc_try_lzo1x_decode(
             if ( out_len != dst_len )
                 break;
 
-            *blob = out_buf;
-            *size += out_len;
+            outsize += out_len;
             cur += src_len;
             left -= src_len;
             continue;


