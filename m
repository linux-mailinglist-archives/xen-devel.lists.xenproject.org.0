Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B28296CA9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 12:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10844.28971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVu9l-0001FJ-H0; Fri, 23 Oct 2020 10:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10844.28971; Fri, 23 Oct 2020 10:18:45 +0000
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
	id 1kVu9l-0001Eo-DW; Fri, 23 Oct 2020 10:18:45 +0000
Received: by outflank-mailman (input) for mailman id 10844;
 Fri, 23 Oct 2020 10:18:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVu9j-0001EP-C1
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:18:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 473feced-7ce0-4248-b48d-f757c6930424;
 Fri, 23 Oct 2020 10:18:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9433AD04;
 Fri, 23 Oct 2020 10:18:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVu9j-0001EP-C1
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:18:43 +0000
X-Inumbo-ID: 473feced-7ce0-4248-b48d-f757c6930424
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 473feced-7ce0-4248-b48d-f757c6930424;
	Fri, 23 Oct 2020 10:18:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603448321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNlq7Fb23c+zpnGBIkWqGuhMfVaSAd3Up+ZrIih1Y4E=;
	b=qObMJquwH1Tb1DW/N461rruhf7lhaKuVIgOKvX0YkCBKrCg89wETxoBJIXsh8CU9dfyYZf
	Lsc7KBu33ppafNgYp5jTFF2w7R4gb5ymA9/+DbcZo1gPUUGnaUDyxdAOpvwpihQ3WNKUA2
	miLupi02MxxkHsHzsB+6vmYKpUMoVYo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A9433AD04;
	Fri, 23 Oct 2020 10:18:41 +0000 (UTC)
Subject: [PATCH v2 6/8] lib: move rbtree code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Message-ID: <e16975d3-c34b-1b3f-743f-1abe13aa06f7@suse.com>
Date: Fri, 23 Oct 2020 12:18:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Build this code into an archive, which results in not linking it into
x86 final binaries. This saves about 1.5k of dead code.

While moving the source file, take the opportunity and drop the
pointless EXPORT_SYMBOL().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/Makefile          | 1 -
 xen/lib/Makefile             | 1 +
 xen/{common => lib}/rbtree.c | 9 +--------
 3 files changed, 2 insertions(+), 9 deletions(-)
 rename xen/{common => lib}/rbtree.c (98%)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 52d3c2aa9384..7bb779f780a1 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -33,7 +33,6 @@ obj-y += preempt.o
 obj-y += random.o
 obj-y += rangeset.o
 obj-y += radix-tree.o
-obj-y += rbtree.o
 obj-y += rcupdate.o
 obj-y += rwlock.o
 obj-y += shutdown.o
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index ba1fb7bcdee2..b469d2dff7b8 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_X86) += x86/
 lib-y += ctype.o
 lib-y += list-sort.o
 lib-y += parse-size.o
+lib-y += rbtree.o
diff --git a/xen/common/rbtree.c b/xen/lib/rbtree.c
similarity index 98%
rename from xen/common/rbtree.c
rename to xen/lib/rbtree.c
index 9f5498a89d4e..95e045d52461 100644
--- a/xen/common/rbtree.c
+++ b/xen/lib/rbtree.c
@@ -25,7 +25,7 @@
 #include <xen/rbtree.h>
 
 /*
- * red-black trees properties:  http://en.wikipedia.org/wiki/Rbtree 
+ * red-black trees properties:  http://en.wikipedia.org/wiki/Rbtree
  *
  *  1) A node is either red or black
  *  2) The root is black
@@ -223,7 +223,6 @@ void rb_insert_color(struct rb_node *node, struct rb_root *root)
 		}
 	}
 }
-EXPORT_SYMBOL(rb_insert_color);
 
 static void __rb_erase_color(struct rb_node *parent, struct rb_root *root)
 {
@@ -467,7 +466,6 @@ void rb_erase(struct rb_node *node, struct rb_root *root)
 	if (rebalance)
 		__rb_erase_color(rebalance, root);
 }
-EXPORT_SYMBOL(rb_erase);
 
 /*
  * This function returns the first node (in sort order) of the tree.
@@ -483,7 +481,6 @@ struct rb_node *rb_first(const struct rb_root *root)
 		n = n->rb_left;
 	return n;
 }
-EXPORT_SYMBOL(rb_first);
 
 struct rb_node *rb_last(const struct rb_root *root)
 {
@@ -496,7 +493,6 @@ struct rb_node *rb_last(const struct rb_root *root)
 		n = n->rb_right;
 	return n;
 }
-EXPORT_SYMBOL(rb_last);
 
 struct rb_node *rb_next(const struct rb_node *node)
 {
@@ -528,7 +524,6 @@ struct rb_node *rb_next(const struct rb_node *node)
 
 	return parent;
 }
-EXPORT_SYMBOL(rb_next);
 
 struct rb_node *rb_prev(const struct rb_node *node)
 {
@@ -557,7 +552,6 @@ struct rb_node *rb_prev(const struct rb_node *node)
 
 	return parent;
 }
-EXPORT_SYMBOL(rb_prev);
 
 void rb_replace_node(struct rb_node *victim, struct rb_node *new,
 		     struct rb_root *root)
@@ -574,4 +568,3 @@ void rb_replace_node(struct rb_node *victim, struct rb_node *new,
 	/* Copy the pointers/colour from the victim to the replacement */
 	*new = *victim;
 }
-EXPORT_SYMBOL(rb_replace_node);
-- 
2.22.0



