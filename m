Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322B92F629A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 15:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67040.119332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l03Ct-0007NK-Vn; Thu, 14 Jan 2021 14:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67040.119332; Thu, 14 Jan 2021 14:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l03Ct-0007Mu-S9; Thu, 14 Jan 2021 14:02:35 +0000
Received: by outflank-mailman (input) for mailman id 67040;
 Thu, 14 Jan 2021 14:02:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l03Cs-0007Mp-Cq
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 14:02:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31151c5e-baee-452b-9a55-b0bcee4013f5;
 Thu, 14 Jan 2021 14:02:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1FF6ACB0;
 Thu, 14 Jan 2021 14:02:31 +0000 (UTC)
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
X-Inumbo-ID: 31151c5e-baee-452b-9a55-b0bcee4013f5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610632952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2jUhgF0ak9MLvHUH1tdbmCeMP2HyJzmt3uYCQSjCXew=;
	b=uMC6Ls0Cp8ismuSrU+VTPMTOGNWWnBHt9KVtKFc6+lAzUk2JE5yzBY+1kBptjaoMX8zXCZ
	IgI5nvJQM3s8tHSYKWQWxrvl6DrlcpafKGCx+4mMWC8F9jbejDNY5NV+6YTvf3p9wbqgji
	OdhoujhcWmRZWleYTl0Ks0vUMrbaHYM=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] common: don't require use of DOMID_SELF
Message-ID: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
Date: Thu, 14 Jan 2021 15:02:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It's not overly difficult for a domain to figure out its ID, so
requiring the use of DOMID_SELF in a very limited set of places isn't
really helpful towards keeping the ID opaque to the guest.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2776,15 +2776,19 @@ struct gnttab_copy_buf {
 static int gnttab_copy_lock_domain(domid_t domid, bool is_gref,
                                    struct gnttab_copy_buf *buf)
 {
-    /* Only DOMID_SELF may reference via frame. */
-    if ( domid != DOMID_SELF && !is_gref )
-        return GNTST_permission_denied;
-
     buf->domain = rcu_lock_domain_by_any_id(domid);
 
     if ( !buf->domain )
         return GNTST_bad_domain;
 
+    /* Only the local domain may reference via frame. */
+    if ( buf->domain != current->domain && !is_gref )
+    {
+        rcu_unlock_domain(buf->domain);
+        buf->domain = NULL;
+        return GNTST_permission_denied;
+    }
+
     buf->ptr.domid = domid;
 
     return GNTST_okay;
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2566,13 +2566,7 @@ __initcall(register_heap_trigger);
 
 struct domain *get_pg_owner(domid_t domid)
 {
-    struct domain *pg_owner = NULL, *curr = current->domain;
-
-    if ( unlikely(domid == curr->domain_id) )
-    {
-        gdprintk(XENLOG_WARNING, "Cannot specify itself as foreign domain\n");
-        goto out;
-    }
+    struct domain *pg_owner;
 
     switch ( domid )
     {
@@ -2590,7 +2584,6 @@ struct domain *get_pg_owner(domid_t domi
         break;
     }
 
- out:
     return pg_owner;
 }
 

