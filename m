Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE02C0D27
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34429.65476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCkK-0006qW-9t; Mon, 23 Nov 2020 14:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34429.65476; Mon, 23 Nov 2020 14:23:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCkK-0006q7-6T; Mon, 23 Nov 2020 14:23:12 +0000
Received: by outflank-mailman (input) for mailman id 34429;
 Mon, 23 Nov 2020 14:23:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCkI-0006pI-DW
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:23:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e20a46a5-a302-45d1-89ed-37c5c2fcae21;
 Mon, 23 Nov 2020 14:23:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B75F5AC23;
 Mon, 23 Nov 2020 14:23:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCkI-0006pI-DW
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:23:10 +0000
X-Inumbo-ID: e20a46a5-a302-45d1-89ed-37c5c2fcae21
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e20a46a5-a302-45d1-89ed-37c5c2fcae21;
	Mon, 23 Nov 2020 14:23:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fPG7s3RVZ6z8F+rd3NAtEN5uxWJlCimqeKe7pK6kmg=;
	b=mKy0e5uMoZ5S3ZAFw6jSf7ANERrttbAHKAj2dboOr2KIcyUexOsj/absppgkhHaQA7raXT
	k+Q20HfPkX+DKY4qSe5FplL5C4yZaX2SXr2JYha8AnFwvNADt9vlFWVJmg370IzUuBy1Qs
	y7wR1grjwgab4b7t4t5ip6Ah06XYVAQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B75F5AC23;
	Mon, 23 Nov 2020 14:23:08 +0000 (UTC)
Subject: [PATCH v2 01/17] mm: check for truncation in vmalloc_type()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <5adb0089-ef9b-cfe2-db0d-7142eccc914f@suse.com>
Date: Mon, 23 Nov 2020 15:23:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While it's currently implied from the checking xmalloc_array() does,
let's make this more explicit in the function itself. As a result both
involved local variables don't need to have size_t type anymore. This
brings them in line with the rest of the code in this file.

Requested-by: Julien Grall <julien@xen.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -242,13 +242,15 @@ void vunmap(const void *va)
 static void *vmalloc_type(size_t size, enum vmap_region type)
 {
     mfn_t *mfn;
-    size_t pages, i;
+    unsigned int i, pages = PFN_UP(size);
     struct page_info *pg;
     void *va;
 
     ASSERT(size);
 
-    pages = PFN_UP(size);
+    if ( PFN_DOWN(size) > pages )
+        return NULL;
+
     mfn = xmalloc_array(mfn_t, pages);
     if ( mfn == NULL )
         return NULL;


