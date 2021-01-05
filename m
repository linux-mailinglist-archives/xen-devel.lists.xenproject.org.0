Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45AF2EABD0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61973.109381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmK2-0002fA-Ti; Tue, 05 Jan 2021 13:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61973.109381; Tue, 05 Jan 2021 13:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmK2-0002el-QJ; Tue, 05 Jan 2021 13:24:26 +0000
Received: by outflank-mailman (input) for mailman id 61973;
 Tue, 05 Jan 2021 13:24:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwmK1-0002ee-QB
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:24:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de0c8721-3cda-4453-9bb8-3d7f890e26ea;
 Tue, 05 Jan 2021 13:24:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CCC00AA35;
 Tue,  5 Jan 2021 13:24:23 +0000 (UTC)
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
X-Inumbo-ID: de0c8721-3cda-4453-9bb8-3d7f890e26ea
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609853063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3kJ8lnzTJXFsjomRl/bsKUPCoMI8X6eG3le2xlL6lg=;
	b=MOZU5mcCpF9Cbomc7b2AnjdU9Fh3+6F6/Ok8j9uLOKzgNGAOt7IPbcZd4gISQhpO+Lk/df
	80oGEOVuqg517pfDnMpfsBExf7iFHMDXB7PhYtQ69ZK9UVH4A49cIpmoctQaybBL4Rj+i1
	i1HGJTLFrP6NCpBDew4UzzMgLqg2Yy8=
Subject: [PATCH 1/5] common: don't (kind of) open-code
 rcu_lock_domain_by_any_id()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Message-ID: <12b46155-3b07-7ee2-3cda-160dda01e8fb@suse.com>
Date: Tue, 5 Jan 2021 14:24:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Even more so when using rcu_lock_domain_by_id() in place of the more
efficient rcu_lock_current_domain().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Besides get_pg_owner(), gnttab_copy_lock_domain() has similar strange(?)
behavior: They accept DOMID_SELF, but not the resolved ID of the caller.
---
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -353,10 +353,7 @@ static int evtchn_bind_interdomain(evtch
     evtchn_port_t  rport = bind->remote_port;
     domid_t        rdom = bind->remote_dom;
 
-    if ( rdom == DOMID_SELF )
-        rdom = current->domain->domain_id;
-
-    if ( (rd = rcu_lock_domain_by_id(rdom)) == NULL )
+    if ( (rd = rcu_lock_domain_by_any_id(rdom)) == NULL )
         return -ESRCH;
 
     write_lock(&ld->event_lock);
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2568,12 +2568,6 @@ struct domain *get_pg_owner(domid_t domi
 {
     struct domain *pg_owner = NULL, *curr = current->domain;
 
-    if ( likely(domid == DOMID_SELF) )
-    {
-        pg_owner = rcu_lock_current_domain();
-        goto out;
-    }
-
     if ( unlikely(domid == curr->domain_id) )
     {
         gdprintk(XENLOG_WARNING, "Cannot specify itself as foreign domain\n");
@@ -2591,7 +2585,7 @@ struct domain *get_pg_owner(domid_t domi
         break;
 
     default:
-        if ( (pg_owner = rcu_lock_domain_by_id(domid)) == NULL )
+        if ( (pg_owner = rcu_lock_domain_by_any_id(domid)) == NULL )
             gdprintk(XENLOG_WARNING, "Unknown domain d%d\n", domid);
         break;
     }


