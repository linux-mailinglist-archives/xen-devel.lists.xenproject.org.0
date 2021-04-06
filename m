Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F83354F01
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 10:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105706.202177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lThPr-0008K8-91; Tue, 06 Apr 2021 08:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105706.202177; Tue, 06 Apr 2021 08:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lThPr-0008Jj-5t; Tue, 06 Apr 2021 08:50:31 +0000
Received: by outflank-mailman (input) for mailman id 105706;
 Tue, 06 Apr 2021 08:50:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lThPq-0008Je-CB
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 08:50:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3d3f93f-2b6e-4e6c-a03b-ae529ff7086c;
 Tue, 06 Apr 2021 08:50:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C48E1AE06;
 Tue,  6 Apr 2021 08:50:28 +0000 (UTC)
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
X-Inumbo-ID: e3d3f93f-2b6e-4e6c-a03b-ae529ff7086c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617699028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5u7mnATsOHEwtJcO87Og7ZVqkhZiBkCd9r/JcsIFqzw=;
	b=bbGRrpgfrWtcCoeepinsT0AQkm/Siwr6fgDqubRVJErNzhkwlV7OXM0SPYQPlwFfF5xbOj
	2Nrztxp//upBl0e/SYOoViKWAebj5k8KuAq/JvCOqFzh2y86NSVI30jiHDH0kyDPEz2gPb
	kXOSAviWRvTZJjbcKKsEVB/QAvtEL9Q=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] rangeset: no need to use snprintf()
Message-ID: <2338703b-3613-41c6-8ae6-387ba2869408@suse.com>
Date: Tue, 6 Apr 2021 10:50:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

As of the conversion to safe_strcpy() years ago there has been no need
anymore to use snprintf() to prevent storing a not-nul-terminated string.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -436,14 +436,7 @@ struct rangeset *rangeset_new(
     BUG_ON(flags & ~RANGESETF_prettyprint_hex);
     r->flags = flags;
 
-    if ( name != NULL )
-    {
-        safe_strcpy(r->name, name);
-    }
-    else
-    {
-        snprintf(r->name, sizeof(r->name), "(no name)");
-    }
+    safe_strcpy(r->name, name ?: "(no name)");
 
     if ( (r->domain = d) != NULL )
     {

