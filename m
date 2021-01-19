Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10FA2FBAD8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:16:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70483.126527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1skJ-0004K4-6c; Tue, 19 Jan 2021 15:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70483.126527; Tue, 19 Jan 2021 15:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1skJ-0004Jf-3H; Tue, 19 Jan 2021 15:16:39 +0000
Received: by outflank-mailman (input) for mailman id 70483;
 Tue, 19 Jan 2021 15:16:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1skH-0004JW-EF
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:16:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1eb8ccf4-b007-45e3-85a5-a54262a868fc;
 Tue, 19 Jan 2021 15:16:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A92DAB7BB;
 Tue, 19 Jan 2021 15:16:35 +0000 (UTC)
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
X-Inumbo-ID: 1eb8ccf4-b007-45e3-85a5-a54262a868fc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611069395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XzQQDvN2oOpxpLvfBkCEem0nzWZsBYK3ZsdptFa+w+4=;
	b=RvMlnR4RAjkVMh5shIXBPI5mLQJesN+Oa7NtpuyHo8pQavCKjiL53kxy/GqSO9MgQhaw4c
	Y1xiNSZFOBAZtgo7m+rak3FC1tvw8hg25NWGNRg1ZzUFrLKW+iWeKpKINCnIyj7psMSp4X
	di72f3E3bqREdDdJQL8Ku/bBYNbtv4A=
Subject: [PATCH v2 3/5] libxenguest: "standardize" LZO kernel decompression
 code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
Message-ID: <4fb01879-4b9c-e711-ecd0-39b0e4d50878@suse.com>
Date: Tue, 19 Jan 2021 16:16:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Add a DOMPRINTF() other methods have, indicating success. To facilitate
this, introduce an "outsize" local variable and update *size as well as
*blob only once done. The latter then also avoids leaving a pointer to
freed memory in dom->kernel_blob in case of a decompression error.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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


