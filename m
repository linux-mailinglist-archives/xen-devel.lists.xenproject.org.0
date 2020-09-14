Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C01726891C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:18:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlZN-0004sr-VB; Mon, 14 Sep 2020 10:18:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHlZM-0004sW-2L
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:18:44 +0000
X-Inumbo-ID: f30a21d5-f3d6-40ef-9dc6-04aed49707b7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f30a21d5-f3d6-40ef-9dc6-04aed49707b7;
 Mon, 14 Sep 2020 10:18:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FD86B26E;
 Mon, 14 Sep 2020 10:18:48 +0000 (UTC)
Subject: [PATCH 8/9] lib: move bsearch code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Message-ID: <13e17bbd-4e58-d953-87c5-5fabafa21de2@suse.com>
Date: Mon, 14 Sep 2020 12:18:32 +0200
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

Build this code into an archive, which results in not linking it into
x86 final binaries. This saves a little bit of dead code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/Makefile           | 1 -
 xen/lib/Makefile              | 1 +
 xen/{common => lib}/bsearch.c | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename xen/{common => lib}/bsearch.c (100%)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 46406dccdfd4..149466b473a8 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,6 +1,5 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
-obj-y += bsearch.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index b469d2dff7b8..122eeb3d327b 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,6 +1,7 @@
 obj-y += ctors.o
 obj-$(CONFIG_X86) += x86/
 
+lib-y += bsearch.o
 lib-y += ctype.o
 lib-y += list-sort.o
 lib-y += parse-size.o
diff --git a/xen/common/bsearch.c b/xen/lib/bsearch.c
similarity index 100%
rename from xen/common/bsearch.c
rename to xen/lib/bsearch.c
-- 
2.22.0



