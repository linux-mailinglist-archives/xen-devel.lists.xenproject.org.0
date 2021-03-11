Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3B3375E3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:40:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96640.183046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMTv-0007dF-Ts; Thu, 11 Mar 2021 14:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96640.183046; Thu, 11 Mar 2021 14:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMTv-0007cq-Qt; Thu, 11 Mar 2021 14:40:07 +0000
Received: by outflank-mailman (input) for mailman id 96640;
 Thu, 11 Mar 2021 14:40:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKMTu-0007cj-Q9
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:40:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac6cdb5c-38a0-4866-bacc-06f2e1926510;
 Thu, 11 Mar 2021 14:40:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3069CAC16;
 Thu, 11 Mar 2021 14:40:05 +0000 (UTC)
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
X-Inumbo-ID: ac6cdb5c-38a0-4866-bacc-06f2e1926510
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615473605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SpCLboR3rdGxQgHP4USmwjA3IAZd5oALlQEmZb2qbDQ=;
	b=uTjgsNBNMTB05iipx9Ld7t+JrAcOmC12AQYRAKUIjvhmDqNsP6AVmeY/0C/1w0OMtMnFCG
	l7eVUZBdVeSzGMenZMDNxXVpR7Oiwf9MPapbcWzvzt2CYf/MwUbQs5QMUHcsSWWAA5tUpn
	s03bkfma65oz9ehZVfSa8UC1d2o1JDI=
Subject: [PATCH v2 1/2][4.15] tools/x86: don't rebuild cpuid-autogen.h every
 time
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
Message-ID: <1b8aee19-9194-153c-8dbb-0aec3412e255@suse.com>
Date: Thu, 11 Mar 2021 15:40:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The first thing the "xen-dir" rule does is delete the entire xen/
subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
result there's no original version for $(move-if-changed ...) to compare
against, and hence the file and all its consumers would get rebuilt
every time. Instead only find and delete all the symlinks.

Fixes: eddf9559c977 ("libx86: generate cpuid-autogen.h in the libx86 include dir")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Different approach.
---
Ian did suggest to pass -0r to xargs (and -print0 to find), but I
couldn't convince myself that these are standard compliant options. We
don't use any special characters in file names, so -print0 / -0
shouldn't be necessary at all. The stray rm invocation when there is no
output from find can be taken care of by passing -f to it.

--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -19,7 +19,7 @@ xen-foreign:
 	$(MAKE) -C xen-foreign
 
 xen-dir:
-	@rm -rf xen acpi
+	find xen/ acpi/ -type l 2>/dev/null | xargs rm -f --
 	mkdir -p xen/libelf acpi
 	ln -s $(XEN_ROOT)/xen/include/public/COPYING xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*.h xen/


