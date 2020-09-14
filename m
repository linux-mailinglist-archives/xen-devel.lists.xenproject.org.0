Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673826891D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:19:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlZp-0004zS-8X; Mon, 14 Sep 2020 10:19:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHlZn-0004yw-1D
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:19:11 +0000
X-Inumbo-ID: 4eb91705-1e92-4330-83ae-01ad02185968
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4eb91705-1e92-4330-83ae-01ad02185968;
 Mon, 14 Sep 2020 10:19:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57F37B265;
 Mon, 14 Sep 2020 10:19:15 +0000 (UTC)
Subject: [PATCH 9/9] lib: move sort code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Message-ID: <8c086b99-9e0b-0469-b6d0-1190b072f109@suse.com>
Date: Mon, 14 Sep 2020 12:18:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Build this code into an archive, to parallel bsearch().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/Makefile        | 1 -
 xen/lib/Makefile           | 1 +
 xen/{common => lib}/sort.c | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename xen/{common => lib}/sort.c (100%)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 149466b473a8..efcfd4c34ecf 100644
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



