Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E833296CAF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 12:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10853.28994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVuAV-0001Uh-7R; Fri, 23 Oct 2020 10:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10853.28994; Fri, 23 Oct 2020 10:19:31 +0000
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
	id 1kVuAV-0001UK-4E; Fri, 23 Oct 2020 10:19:31 +0000
Received: by outflank-mailman (input) for mailman id 10853;
 Fri, 23 Oct 2020 10:19:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVuAU-0001UA-AA
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:19:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6efcfda2-f466-4fd9-9f2b-d863559826d4;
 Fri, 23 Oct 2020 10:19:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67F9FABD1;
 Fri, 23 Oct 2020 10:19:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVuAU-0001UA-AA
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:19:30 +0000
X-Inumbo-ID: 6efcfda2-f466-4fd9-9f2b-d863559826d4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6efcfda2-f466-4fd9-9f2b-d863559826d4;
	Fri, 23 Oct 2020 10:19:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603448368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCENBea3g/sHEZshbnkZNqrNEizuK/QJ9N/S6MkmEq8=;
	b=oIEzmmO3m16L6bX9CkxGbuw5XprILZWZyYFfix657HEk4sWWwuiCSFyRxGrbHpPD0prqxA
	UYKKEW8P3iZK5z6D6GcBlJRKroj0pIEHFZ208aj/bBn+Fvehfp+StKOCdbLkVX5Orn+4nc
	bXMW2Kdrs79PHkiYZ1pezYcyFhDcQDg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 67F9FABD1;
	Fri, 23 Oct 2020 10:19:28 +0000 (UTC)
Subject: [PATCH v2 8/8] lib: move sort code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Message-ID: <293585a3-5475-0c02-19ce-c2080b2deab1@suse.com>
Date: Fri, 23 Oct 2020 12:19:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Build this code into an archive, partly paralleling bsearch().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/Makefile        | 1 -
 xen/lib/Makefile           | 1 +
 xen/{common => lib}/sort.c | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename xen/{common => lib}/sort.c (100%)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index d8519a2cc163..90c679958965 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -36,7 +36,6 @@ obj-y += rcupdate.o
 obj-y += rwlock.o
 obj-y += shutdown.o
 obj-y += softirq.o
-obj-y += sort.o
 obj-y += smp.o
 obj-y += spinlock.o
 obj-y += stop_machine.o
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 122eeb3d327b..33ff322b1655 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -6,3 +6,4 @@ lib-y += ctype.o
 lib-y += list-sort.o
 lib-y += parse-size.o
 lib-y += rbtree.o
+lib-y += sort.o
diff --git a/xen/common/sort.c b/xen/lib/sort.c
similarity index 100%
rename from xen/common/sort.c
rename to xen/lib/sort.c
-- 
2.22.0



