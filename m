Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663F366E9E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114807.218873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEK6-00007x-0I; Wed, 21 Apr 2021 14:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114807.218873; Wed, 21 Apr 2021 14:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEK5-00007Y-T5; Wed, 21 Apr 2021 14:59:25 +0000
Received: by outflank-mailman (input) for mailman id 114807;
 Wed, 21 Apr 2021 14:59:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEK4-00007P-2L
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:59:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb545c1f-b181-4c0d-8095-121634ccc030;
 Wed, 21 Apr 2021 14:59:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 96707B2E8;
 Wed, 21 Apr 2021 14:59:22 +0000 (UTC)
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
X-Inumbo-ID: eb545c1f-b181-4c0d-8095-121634ccc030
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619017162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nhFCzQarQALIvmpTT7NHPYBbPtP6KFRVyXEIq1mQnM0=;
	b=GhiK152G4eeoBnhZPFiTgN3IYWdzhp+HZSNtN1UyFJWY5l6C8SAUjYkEptpyyJ2dS5g7Uc
	LcXzQsB1yhXfBrT7CIwcOvepJKqoFbEQghzv7QF94iqB6axNI320hTjXexsPSdZHihUjeg
	eub1OGxUWCoWwRywXgpTSJ+G+CVWRV8=
Subject: [PATCH v2 7/8] video/lfb: avoid effectively open-coding
 xzalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Message-ID: <73db0f74-438e-d99f-35d7-76679df75e40@suse.com>
Date: Wed, 21 Apr 2021 16:59:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xzalloc_bytes() forces
SMP_CACHE_BYTES alignment. But if code really cared about such higher
than default alignment, it should request so explicitly rather than
using a type-unsafe interface. And if e.g. cache line sharing was a
concern, the allocator itself should arrange to avoid such.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/video/lfb.c
+++ b/xen/drivers/video/lfb.c
@@ -147,8 +147,9 @@ int __init lfb_init(struct lfb_prop *lfb
 {
     lfb.lfbp = *lfbp;
 
-    lfb.lbuf = xmalloc_bytes(lfb.lfbp.bytes_per_line);
-    lfb.text_buf = xzalloc_bytes(lfb.lfbp.text_columns * lfb.lfbp.text_rows);
+    lfb.lbuf = xmalloc_array(unsigned char, lfb.lfbp.bytes_per_line);
+    lfb.text_buf = xzalloc_array(unsigned char,
+                                 lfb.lfbp.text_columns * lfb.lfbp.text_rows);
     lfb.line_len = xzalloc_array(unsigned int, lfb.lfbp.text_columns);
 
     if ( !lfb.lbuf || !lfb.text_buf || !lfb.line_len )


