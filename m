Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DDC3393E1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 17:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97243.184656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkzM-0001B0-5o; Fri, 12 Mar 2021 16:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97243.184656; Fri, 12 Mar 2021 16:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkzM-0001Ab-23; Fri, 12 Mar 2021 16:50:12 +0000
Received: by outflank-mailman (input) for mailman id 97243;
 Fri, 12 Mar 2021 16:50:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKkzK-0001AW-Aa
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:50:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfdeb2b2-ce53-4633-b7a2-758ae8234b04;
 Fri, 12 Mar 2021 16:50:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5311EAF6C;
 Fri, 12 Mar 2021 16:50:08 +0000 (UTC)
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
X-Inumbo-ID: cfdeb2b2-ce53-4633-b7a2-758ae8234b04
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615567808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmGPfV8DwHMB3Z9ZDZqRR5s22asV4IuA5dkHojkwLiI=;
	b=ssjRyOHivjERsl5WB/JR1yXJAQ7r4nj/wbnRmqAhz4bZ+mgNqLF/oLhDvza9Kx0jLVokhq
	EFCwujMf6zFyotBXQfwh560Fl9kJQFQCm/mvqNYLiWYTj79WihrsL5GIA5DVjvVoOsbGWt
	DY83wqVWWOwMkDjBGPvG8V286FZBuCk=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3][4.15] tools/x86: don't rebuild cpuid-autogen.h every time
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
Message-ID: <96ad6d6e-84f0-89dd-f7b1-1e1ddc2183fd@suse.com>
Date: Fri, 12 Mar 2021 17:50:09 +0100
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
v3: Don't use xargs. Don't hide errors.
v2: Different approach.

--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -19,8 +19,8 @@ xen-foreign:
 	$(MAKE) -C xen-foreign
 
 xen-dir:
-	@rm -rf xen acpi
 	mkdir -p xen/libelf acpi
+	find xen/ acpi/ -type l -exec rm '{}' +
 	ln -s $(XEN_ROOT)/xen/include/public/COPYING xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*.h xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*/ xen/

