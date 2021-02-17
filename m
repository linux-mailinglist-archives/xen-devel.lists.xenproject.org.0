Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9031D7B1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 11:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86206.161633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKMG-0000Pq-32; Wed, 17 Feb 2021 10:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86206.161633; Wed, 17 Feb 2021 10:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKMF-0000PP-Vz; Wed, 17 Feb 2021 10:46:59 +0000
Received: by outflank-mailman (input) for mailman id 86206;
 Wed, 17 Feb 2021 10:46:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCKMD-0000PB-Ua
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 10:46:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f951a317-8485-4d2b-a593-4ce277995d9c;
 Wed, 17 Feb 2021 10:46:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4855CB1AD;
 Wed, 17 Feb 2021 10:46:55 +0000 (UTC)
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
X-Inumbo-ID: f951a317-8485-4d2b-a593-4ce277995d9c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613558815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJzykk1fycKpMnuMtQ/GtfxP7KxLImeCXhtduVS0e7A=;
	b=pO4jeeQnzTStydoed62HEhA5D0tBkXOa4xYfhDPT9njPu/0Wn9V3MNtsC9KAp7agIBJT4t
	fVQpZLxB//2DS5cmvDXM4dRg1nPkQbE1HMU2PYlaVGiOfiiGM9cX0vq22dZM1UoZURHRwO
	Yiuym74dE3n/Hy9lpKEG/OQOpBpUXmo=
Subject: [PATCH 3/3] gnttab: GTF_sub_page is a v2-only flag
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
Message-ID: <2bf46266-785d-0de3-5f61-48c3fd191a5c@suse.com>
Date: Wed, 17 Feb 2021 11:46:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Prior to its introduction, v1 entries weren't checked for this flag, and
the flag also has been meaningless for v1 entries. Therefore it also
shouldn't be checked. (The only consistent alternative would be to also
check for all currently undefined flags to be clear.)

Fixes: b545941b6638 ("Implement sub-page grant support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -762,13 +762,11 @@ static int _set_status_v1(const grant_en
                           struct domain *rd,
                           struct active_grant_entry *act,
                           int readonly,
-                          int mapflag,
-                          domid_t  ldomid)
+                          domid_t ldomid)
 {
     int rc = GNTST_okay;
     uint32_t *raw_shah = (uint32_t *)shah;
     union grant_combo scombo;
-    uint16_t mask = GTF_type_mask;
 
     /*
      * We bound the number of times we retry CMPXCHG on memory locations that
@@ -780,11 +778,6 @@ static int _set_status_v1(const grant_en
      */
     int retries = 0;
 
-    /* if this is a grant mapping operation we should ensure GTF_sub_page
-       is not set */
-    if ( mapflag )
-        mask |= GTF_sub_page;
-
     scombo.raw = ACCESS_ONCE(*raw_shah);
 
     /*
@@ -798,8 +791,9 @@ static int _set_status_v1(const grant_en
         union grant_combo prev, new;
 
         /* If not already pinned, check the grant domid and type. */
-        if ( !act->pin && (((scombo.flags & mask) != GTF_permit_access) ||
-                           (scombo.domid != ldomid)) )
+        if ( !act->pin &&
+             (((scombo.flags & GTF_type_mask) != GTF_permit_access) ||
+              (scombo.domid != ldomid)) )
             PIN_FAIL(done, GNTST_general_error,
                      "Bad flags (%x) or dom (%d); expected d%d\n",
                      scombo.flags, scombo.domid, ldomid);
@@ -916,7 +910,7 @@ static int _set_status(const grant_entry
 {
 
     if ( evaluate_nospec(rgt_version == 1) )
-        return _set_status_v1(shah, rd, act, readonly, mapflag, ldomid);
+        return _set_status_v1(shah, rd, act, readonly, ldomid);
     else
         return _set_status_v2(shah, status, rd, act, readonly, mapflag, ldomid);
 }
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -175,7 +175,7 @@ typedef struct grant_entry_v1 grant_entr
  *                             mappings of the grant [GST]
  *  GTF_sub_page: Grant access to only a subrange of the page.  @domid
  *                will only be allowed to copy from the grant, and not
- *                map it. [GST]
+ *                map it. [GST, v2]
  */
 #define _GTF_readonly       (2)
 #define GTF_readonly        (1U<<_GTF_readonly)


