Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D592EAB1F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 13:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61899.109177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlib-0005bx-85; Tue, 05 Jan 2021 12:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61899.109177; Tue, 05 Jan 2021 12:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlib-0005bY-4p; Tue, 05 Jan 2021 12:45:45 +0000
Received: by outflank-mailman (input) for mailman id 61899;
 Tue, 05 Jan 2021 12:45:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwliZ-0005bT-1y
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:45:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fb48502-f697-4ea3-bf74-64e000de6207;
 Tue, 05 Jan 2021 12:45:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77196AA35;
 Tue,  5 Jan 2021 12:45:41 +0000 (UTC)
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
X-Inumbo-ID: 8fb48502-f697-4ea3-bf74-64e000de6207
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609850741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WQp8E8n51xhk9C5vJA3kZBzGJQtMkROCpNb1W2Ggqcc=;
	b=ReoZbKhX/UdzuMcJpNgZ4B5LDXSxsM8pR7y6yU99yBJZqs6ICaZ8S6usx72KyrprT76yba
	vDMsI1lMUGIyim2OQ7bj0T6kYplTZd2LLcFmlIdBoth1/GhqThlXyzzyd2vpfcV9Gpehkh
	zBydR+fcUyGwg0EJdNQDPJrboh6FPNo=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] lib: extend ASSERT()
Message-ID: <8afb661c-a2eb-3188-8351-01de16ff1b22@suse.com>
Date: Tue, 5 Jan 2021 13:45:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The increasing amount of constructs along the lines of

    if ( !condition )
    {
        ASSERT_UNREACHABLE();
        return;
    }

is not only longer than necessary, but also doesn't produce incident
specific console output (except for file name and line number). Allow
the intended effect to be achieved with ASSERT(), by giving it a second
parameter allowing specification of the action to take in release builds
in case an assertion would have triggered in a debug one. The example
above then becomes

    ASSERT(condition, return);

Make sure the condition will continue to not get evaluated when just a
single argument gets passed to ASSERT().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: The use of a control flow construct as a macro argument may be
     controversial.

--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -818,11 +818,7 @@ int xenmem_add_to_physmap(struct domain
     union add_to_physmap_extra extra = {};
     struct page_info *pages[16];
 
-    if ( !paging_mode_translate(d) )
-    {
-        ASSERT_UNREACHABLE();
-        return -EACCES;
-    }
+    ASSERT(paging_mode_translate(d), return -EACCES);
 
     if ( xatp->space == XENMAPSPACE_gmfn_foreign )
         extra.foreign_domid = DOMID_INVALID;
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -55,12 +55,14 @@
 #endif
 
 #ifndef NDEBUG
-#define ASSERT(p) \
+#define ASSERT(p, ...) \
     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
 #define ASSERT_UNREACHABLE() assert_failed("unreachable")
 #define debug_build() 1
 #else
-#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
+#define ASSERT(p, alt...) do { \
+        if ( !count_args(alt) || unlikely(!(p)) ) { alt; } \
+    } while ( 0 )
 #define ASSERT_UNREACHABLE() do { } while (0)
 #define debug_build() 0
 #endif

