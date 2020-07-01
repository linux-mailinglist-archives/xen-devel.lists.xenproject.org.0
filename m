Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA5E210942
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 12:28:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqZyL-00023V-0l; Wed, 01 Jul 2020 10:28:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFmw=AM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqZyJ-00023G-Tn
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:28:07 +0000
X-Inumbo-ID: 8d8314e5-bb85-11ea-86e8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d8314e5-bb85-11ea-86e8-12813bfff9fa;
 Wed, 01 Jul 2020 10:28:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6AED6AD25;
 Wed,  1 Jul 2020 10:28:06 +0000 (UTC)
Subject: [PATCH v2 6/7] flask: drop dead compat translation code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
Message-ID: <7711f68d-394e-a74f-81fa-51f8447174ce@suse.com>
Date: Wed, 1 Jul 2020 12:28:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Translation macros aren't needed at all (or else a devicetree_label
entry would have been missing), and userlist has been removed quite some
time ago.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -148,14 +148,11 @@
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

