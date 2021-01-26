Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A115A303978
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74735.134351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L0Q-0001Gq-1R; Tue, 26 Jan 2021 09:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74735.134351; Tue, 26 Jan 2021 09:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L0P-0001GT-Tq; Tue, 26 Jan 2021 09:51:25 +0000
Received: by outflank-mailman (input) for mailman id 74735;
 Tue, 26 Jan 2021 09:51:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4L0O-0001G7-Cw
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:51:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddf7a50c-8962-4546-b371-1dcafdcb598a;
 Tue, 26 Jan 2021 09:51:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1BC6AE40;
 Tue, 26 Jan 2021 09:51:22 +0000 (UTC)
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
X-Inumbo-ID: ddf7a50c-8962-4546-b371-1dcafdcb598a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ei0fpeiiAKGtY8+oZt/tf9Q3mew4s0SgaZQoWt8z3PE=;
	b=M7WhP6UKn/HeIuyo1huiOoOsgDFjRhWachYqvl1wrvtoS2Ho8a0VGsHuKV1j5xc4LFqWOA
	zyjrd0cUYpDAdLZXkh/qQgq/NIMOM/gghs7SaLJvgH48cKQouLIML98dzl31YmcqgnDstz
	2CGVfvv7hJLsoAsH4s2kCw3xa3vgdEY=
Subject: [PATCH v3 09/15] unlzo: replace INIT
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <e9f80b21-dff6-d6f0-3e69-c42219a3aaa9@suse.com>
Date: Tue, 26 Jan 2021 10:51:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need for this abstraction.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/common/lzo.c
+++ b/xen/common/lzo.c
@@ -135,8 +135,8 @@
  */
 #define MAX_255_COUNT      ((((size_t)~0) / 255) - 2)
 
-int INIT lzo1x_decompress_safe(const unsigned char *in, size_t in_len,
-                               unsigned char *out, size_t *out_len)
+int __init lzo1x_decompress_safe(const unsigned char *in, size_t in_len,
+                                 unsigned char *out, size_t *out_len)
 {
     unsigned char *op;
     const unsigned char *ip;
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -57,7 +57,7 @@ static const unsigned char lzop_magic[]
 #define HEADER_SIZE_MIN       (9 + 7     + 4 + 8     + 1       + 4)
 #define HEADER_SIZE_MAX       (9 + 7 + 1 + 8 + 8 + 4 + 1 + 255 + 4)
 
-static int INIT parse_header(u8 *input, int *skip, int in_len)
+static int __init parse_header(u8 *input, int *skip, int in_len)
 {
 	int l;
 	u8 *parse = input;
@@ -114,11 +114,11 @@ static int INIT parse_header(u8 *input,
 	return 1;
 }
 
-int INIT unlzo(unsigned char *input, unsigned int in_len,
-	       int (*fill) (void *, unsigned int),
-	       int (*flush) (void *, unsigned int),
-	       unsigned char *output, unsigned int *posp,
-	       void (*error) (const char *x))
+int __init unlzo(unsigned char *input, unsigned int in_len,
+		 int (*fill) (void *, unsigned int),
+		 int (*flush) (void *, unsigned int),
+		 unsigned char *output, unsigned int *posp,
+		 void (*error) (const char *x))
 {
 	u8 r = 0;
 	int skip = 0;


