Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C22209A2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:15:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveRU-0007PX-TY; Wed, 15 Jul 2020 10:15:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveRT-0007PS-UR
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:15:11 +0000
X-Inumbo-ID: 10cd5f18-c684-11ea-93af-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10cd5f18-c684-11ea-93af-12813bfff9fa;
 Wed, 15 Jul 2020 10:15:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9793EB090;
 Wed, 15 Jul 2020 10:15:13 +0000 (UTC)
Subject: [PATCH 1/2] common: map_vcpu_info() cosmetics
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
Message-ID: <2a0341c7-3836-a8c0-9516-b6a08e2720ec@suse.com>
Date: Wed, 15 Jul 2020 12:15:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
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
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use ENXIO instead of EINVAL to cover the two cases of the address not
satisfying the requirements. This will make an issue here better stand
out at the call site.

Also add a missing compat-mode related size check: If the sizes
differed, other code in the function would need changing. Accompany this
by a change to the initial sizeof() expression, tying it to the type of
the variable we're actually after (matching e.g. the alignof() added by
XSA-327).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1229,17 +1229,18 @@ int map_vcpu_info(struct vcpu *v, unsign
     struct page_info *page;
     unsigned int align;
 
-    if ( offset > (PAGE_SIZE - sizeof(vcpu_info_t)) )
-        return -EINVAL;
+    if ( offset > (PAGE_SIZE - sizeof(*new_info)) )
+        return -ENXIO;
 
 #ifdef CONFIG_COMPAT
+    BUILD_BUG_ON(sizeof(*new_info) != sizeof(new_info->compat));
     if ( has_32bit_shinfo(d) )
         align = alignof(new_info->compat);
     else
 #endif
         align = alignof(*new_info);
     if ( offset & (align - 1) )
-        return -EINVAL;
+        return -ENXIO;
 
     if ( !mfn_eq(v->vcpu_info_mfn, INVALID_MFN) )
         return -EINVAL;


