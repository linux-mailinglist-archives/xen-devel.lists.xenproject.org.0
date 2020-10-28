Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C09B29CF33
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 10:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13431.34073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhgk-0005ZQ-J2; Wed, 28 Oct 2020 09:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13431.34073; Wed, 28 Oct 2020 09:24:14 +0000
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
	id 1kXhgk-0005Yz-Fg; Wed, 28 Oct 2020 09:24:14 +0000
Received: by outflank-mailman (input) for mailman id 13431;
 Wed, 28 Oct 2020 09:24:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXhgj-0005Yr-IG
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:24:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca21e3f6-7e57-4e2c-be35-2f85bffc0e51;
 Wed, 28 Oct 2020 09:24:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14286ACAC;
 Wed, 28 Oct 2020 09:24:12 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXhgj-0005Yr-IG
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:24:13 +0000
X-Inumbo-ID: ca21e3f6-7e57-4e2c-be35-2f85bffc0e51
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ca21e3f6-7e57-4e2c-be35-2f85bffc0e51;
	Wed, 28 Oct 2020 09:24:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603877052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtLLY79rVz1/b+gt5Ib9A6igOOIy5NEZdkH5oVbCQnk=;
	b=VJI6vy9R90Vs2E3wVekuCxGJTGtQbMA4OcA0MkysEL29mIv9ddl22Dg2FTzRuu9F7+yyZf
	YZXwFWeCwK6agSPEID1Bc/CPdV4b0T3p8fvmZN/JucbKeOGA2IhHk3RlzULuld3IebIm4u
	DDcocneMpPBPVgjW78gYTUevI12lO4Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 14286ACAC;
	Wed, 28 Oct 2020 09:24:12 +0000 (UTC)
Subject: [PATCH 4/5] x86/HAP: move nested-P2M flush calculations out of locked
 region
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
Message-ID: <551dc0a2-f5ef-a646-26eb-8a67ae428745@suse.com>
Date: Wed, 28 Oct 2020 10:24:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

By latching the old MFN into a local variable, these calculations don't
depend on anything but local variables anymore. Hence the point in time
when they get performed doesn't matter anymore, so they can be moved
past the locked region.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -780,7 +780,7 @@ hap_write_p2m_entry(struct p2m_domain *p
 {
     struct domain *d = p2m->domain;
     uint32_t old_flags;
-    bool_t flush_nestedp2m = 0;
+    mfn_t omfn;
     int rc;
 
     /* We know always use the host p2m here, regardless if the vcpu
@@ -790,21 +790,11 @@ hap_write_p2m_entry(struct p2m_domain *p
 
     paging_lock(d);
     old_flags = l1e_get_flags(*p);
-
-    if ( nestedhvm_enabled(d) && (old_flags & _PAGE_PRESENT) 
-         && !p2m_get_hostp2m(d)->defer_nested_flush ) {
-        /* We are replacing a valid entry so we need to flush nested p2ms,
-         * unless the only change is an increase in access rights. */
-        mfn_t omfn = l1e_get_mfn(*p);
-        mfn_t nmfn = l1e_get_mfn(new);
-
-        flush_nestedp2m = !(mfn_eq(omfn, nmfn)
-            && perms_strictly_increased(old_flags, l1e_get_flags(new)) );
-    }
+    omfn = l1e_get_mfn(*p);
 
     rc = p2m_entry_modify(p2m, p2m_flags_to_type(l1e_get_flags(new)),
                           p2m_flags_to_type(old_flags), l1e_get_mfn(new),
-                          l1e_get_mfn(*p), level);
+                          omfn, level);
     if ( rc )
     {
         paging_unlock(d);
@@ -817,7 +807,14 @@ hap_write_p2m_entry(struct p2m_domain *p
 
     paging_unlock(d);
 
-    if ( flush_nestedp2m )
+    if ( nestedhvm_enabled(d) && (old_flags & _PAGE_PRESENT) &&
+         !p2m_get_hostp2m(d)->defer_nested_flush &&
+         /*
+          * We are replacing a valid entry so we need to flush nested p2ms,
+          * unless the only change is an increase in access rights.
+          */
+         (!mfn_eq(omfn, l1e_get_mfn(new)) ||
+          !perms_strictly_increased(old_flags, l1e_get_flags(new))) )
         p2m_flush_nestedp2m(d);
 
     return 0;


