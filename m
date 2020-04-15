Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F931A9780
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:53:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdn6-0001nF-3X; Wed, 15 Apr 2020 08:53:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOdn4-0001nA-Ba
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:53:02 +0000
X-Inumbo-ID: 82f4d664-7ef6-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82f4d664-7ef6-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 08:53:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9F231AF92;
 Wed, 15 Apr 2020 08:52:59 +0000 (UTC)
Subject: [PATCH 1/3] xenoprof: adjust ordering of page sharing vs domain type
 setting
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
Message-ID: <0a7d6a97-7093-6cec-4c8d-d1ca39e0815e@suse.com>
Date: Wed, 15 Apr 2020 10:52:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Buffer pages should be shared with "ignored" or "active" guests only
(besides, obviously, the primary profiling domain). Hence domain type
should be set to "ignored" before unsharing from the primary domain
(which implies even a previously "passive" domain may then access its
buffers, albeit that's not very useful unless it gets promoted to
"active" subsequently), i.e. such that no further writes of records to
the buffer would occur, and (at least for consistency) also before
sharing it (with the calling domain) from the XENOPROF_get_buffer path.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Wei Liu <wl@xen.org>

--- a/xen/common/xenoprof.c
+++ b/xen/common/xenoprof.c
@@ -372,8 +372,8 @@ static void reset_passive(struct domain
     if ( x == NULL )
         return;
 
-    unshare_xenoprof_page_with_guest(x);
     x->domain_type = XENOPROF_DOMAIN_IGNORED;
+    unshare_xenoprof_page_with_guest(x);
 }
 
 static void reset_active_list(void)
@@ -654,6 +654,13 @@ static int xenoprof_op_get_buffer(XEN_GU
         if ( ret < 0 )
             return ret;
     }
+    else
+    {
+        d->xenoprof->domain_ready = 0;
+        d->xenoprof->domain_type = XENOPROF_DOMAIN_IGNORED;
+    }
+
+    d->xenoprof->is_primary = (xenoprof_primary_profiler == d);
 
     ret = share_xenoprof_page_with_guest(
         d, virt_to_mfn(d->xenoprof->rawbuf), d->xenoprof->npages);
@@ -662,10 +669,6 @@ static int xenoprof_op_get_buffer(XEN_GU
 
     xenoprof_reset_buf(d);
 
-    d->xenoprof->domain_type  = XENOPROF_DOMAIN_IGNORED;
-    d->xenoprof->domain_ready = 0;
-    d->xenoprof->is_primary   = (xenoprof_primary_profiler == current->domain);
-        
     xenoprof_get_buffer.nbuf = d->xenoprof->nbuf;
     xenoprof_get_buffer.bufsize = d->xenoprof->bufsize;
     if ( !paging_mode_translate(d) )


