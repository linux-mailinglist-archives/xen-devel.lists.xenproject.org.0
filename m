Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D2338EC5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 14:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97115.184299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhpv-0002Uj-Sk; Fri, 12 Mar 2021 13:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97115.184299; Fri, 12 Mar 2021 13:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhpv-0002UK-Od; Fri, 12 Mar 2021 13:28:15 +0000
Received: by outflank-mailman (input) for mailman id 97115;
 Fri, 12 Mar 2021 13:28:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKhpu-0002UF-Dn
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:28:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a1ae1bb-2291-437d-8b45-ec1334cf1d9b;
 Fri, 12 Mar 2021 13:28:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D962AAF4D;
 Fri, 12 Mar 2021 13:28:12 +0000 (UTC)
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
X-Inumbo-ID: 6a1ae1bb-2291-437d-8b45-ec1334cf1d9b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615555693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SB6cjRcfANDSZoA5AjSpD/ZyaGqTkyrX+8xNZEZp/CM=;
	b=dzGZOfmSWx55h8P8MVGUKvweRhEXiqvHPGlHGKhMJg2894UaU1kESPpsbXSGurTILUJc8K
	eaFV3xpKnlPZZydrb5jT515fcXyWvyJPwrUWLbn8ohfmu3u7Jxqf4IJsYj6o6jXECO9maH
	DwGpk0QBKoJI9zaZoAqML4wNMziW/oY=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2][4.15] gnttab: work around "may be used uninitialized"
 warning
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <099e79c0-6443-2199-1242-3cfc4d93c367@suse.com>
Date: Fri, 12 Mar 2021 14:28:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sadly I was wrong to suggest dropping vaddrs' initializer during review
of v2 of the patch introducing this code. gcc 4.3 can't cope.

Fixes: 52531c734ea1 ("xen/gnttab: Rework resource acquisition")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Re-insert the other half of what Andrew had in his original patch.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
     struct grant_table *gt = d->grant_table;
     unsigned int i, final_frame;
     mfn_t tmp;
-    void **vaddrs;
+    void **vaddrs = NULL;
     int rc = -EINVAL;
 
     if ( !nr_frames )
@@ -4055,6 +4055,17 @@ int gnttab_acquire_resource(
         break;
     }
 
+    /*
+     * Some older toolchains can't spot that vaddrs won't remain uninitialized
+     * on non-error paths, and hence it needs setting to NULL at the top of the
+     * function.  Leave some runtime safety.
+     */
+    if ( !vaddrs )
+    {
+        ASSERT_UNREACHABLE();
+        rc = -ENODATA;
+    }
+
     /* Any errors?  Bad id, or from growing the table? */
     if ( rc )
         goto out;

