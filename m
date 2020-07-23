Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D287A22B2F1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:51:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydVM-0007ME-Dk; Thu, 23 Jul 2020 15:51:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jydVK-0007M0-E0
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:51:30 +0000
X-Inumbo-ID: 5ea71ba8-ccfc-11ea-873e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ea71ba8-ccfc-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 15:51:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18490AC83;
 Thu, 23 Jul 2020 15:51:37 +0000 (UTC)
Subject: [PATCH v3 7/8] flask: drop dead compat translation code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Message-ID: <533889b9-7cbc-2df4-f308-861536902689@suse.com>
Date: Thu, 23 Jul 2020 17:51:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Translation macros aren't used (and hence needed) at all (or else a
devicetree_label entry would have been missing), and userlist has been
removed quite some time ago.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -171,14 +171,11 @@
 ?	xenoprof_init			xenoprof.h
 ?	xenoprof_passive		xenoprof.h
 ?	flask_access			xsm/flask_op.h
-!	flask_boolean			xsm/flask_op.h
 ?	flask_cache_stats		xsm/flask_op.h
 ?	flask_hash_stats		xsm/flask_op.h
-!	flask_load			xsm/flask_op.h
 ?	flask_ocontext			xsm/flask_op.h
 ?	flask_peersid			xsm/flask_op.h
 ?	flask_relabel			xsm/flask_op.h
 ?	flask_setavc_threshold		xsm/flask_op.h
 ?	flask_setenforce		xsm/flask_op.h
-!	flask_sid_context		xsm/flask_op.h
 ?	flask_transition		xsm/flask_op.h
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -790,8 +790,6 @@ CHECK_flask_transition;
 #define xen_flask_load compat_flask_load
 #define flask_security_load compat_security_load
 
-#define xen_flask_userlist compat_flask_userlist
-
 #define xen_flask_sid_context compat_flask_sid_context
 #define flask_security_context compat_security_context
 #define flask_security_sid compat_security_sid


