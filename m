Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06E2C0EBB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34676.65871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDhE-0007ON-4Q; Mon, 23 Nov 2020 15:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34676.65871; Mon, 23 Nov 2020 15:24:04 +0000
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
	id 1khDhE-0007Nx-0w; Mon, 23 Nov 2020 15:24:04 +0000
Received: by outflank-mailman (input) for mailman id 34676;
 Mon, 23 Nov 2020 15:24:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDhD-0007Nk-3B
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:24:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7c51524-a4e1-4201-a3c3-4e2a0362897b;
 Mon, 23 Nov 2020 15:24:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9EBE7AC23;
 Mon, 23 Nov 2020 15:24:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDhD-0007Nk-3B
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:24:03 +0000
X-Inumbo-ID: d7c51524-a4e1-4201-a3c3-4e2a0362897b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d7c51524-a4e1-4201-a3c3-4e2a0362897b;
	Mon, 23 Nov 2020 15:24:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606145041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0KlMYiiW0WboZScCSGBoeGaSU9YjcD5lFMncp+ZtPw=;
	b=Xq4CA1XdpUFDcZy4KorttAc/zYWs+iDVnlavwZOdcJ3QkM96U03rfqf7UTyTH991ZOOPSw
	TfaL626urcyZPycV82CCKE4UILOAOi/7ZNOXlmknassHLKq95NYRFQZGOBQSCBlZWIyddh
	Pv7nkKz/qTJNkpvM6YyPxWu1MQclMpA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9EBE7AC23;
	Mon, 23 Nov 2020 15:24:01 +0000 (UTC)
Subject: [PATCH v3 8/8] lib: move sort code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Message-ID: <84bd9aaf-e94d-da6b-f2f9-c2da64df5312@suse.com>
Date: Mon, 23 Nov 2020 16:24:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Build this code into an archive, partly paralleling bsearch().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/Makefile        | 1 -
 xen/lib/Makefile           | 1 +
 xen/{common => lib}/sort.c | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename xen/{common => lib}/sort.c (100%)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index e8ce23acea67..7a4e652b575e 100644
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
index f12dab7a737a..42cf7a1164ef 100644
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


