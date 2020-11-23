Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F12C0EB9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34660.65847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDgQ-00077Z-CH; Mon, 23 Nov 2020 15:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34660.65847; Mon, 23 Nov 2020 15:23:14 +0000
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
	id 1khDgQ-000776-8w; Mon, 23 Nov 2020 15:23:14 +0000
Received: by outflank-mailman (input) for mailman id 34660;
 Mon, 23 Nov 2020 15:23:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDgO-00073t-Oc
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:23:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bc9a156-806b-4d8c-9393-0b56d5cc388c;
 Mon, 23 Nov 2020 15:23:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89CDCAE42;
 Mon, 23 Nov 2020 15:23:10 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDgO-00073t-Oc
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:23:12 +0000
X-Inumbo-ID: 1bc9a156-806b-4d8c-9393-0b56d5cc388c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1bc9a156-806b-4d8c-9393-0b56d5cc388c;
	Mon, 23 Nov 2020 15:23:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606144990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDkXTDAOobi6xJ5cnvbE+OQk8dJ5rRtfEWvkVEPSe/g=;
	b=fHNjIIwoFNC7QCFV0gmsGacLniA7WxmVKEa9wJhKeTuyLL28Nyd7eRk6ErHjwG0nr8aXCu
	XxzOy6heVKvj/P6p8XUsLV7LkhtiBUJIWjZg7tvO7PqnFkL3Svje7YoDdAB8mcqGbbcP4+
	paH8s42GVGmzdI0cA+ZE5fQBrwvhbOU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 89CDCAE42;
	Mon, 23 Nov 2020 15:23:10 +0000 (UTC)
Subject: [PATCH v3 6/8] lib: move rbtree code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Message-ID: <749adfdd-70d6-c653-7fcf-dad13fd8463f@suse.com>
Date: Mon, 23 Nov 2020 16:23:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Build this code into an archive, which results in not linking it into
x86 final binaries. This saves about 1.5k of dead code.

While moving the source file, take the opportunity and drop the
pointless EXPORT_SYMBOL() and an instance of trailing whitespace.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/Makefile          | 1 -
 xen/lib/Makefile             | 1 +
 xen/{common => lib}/rbtree.c | 9 +--------
 3 files changed, 2 insertions(+), 9 deletions(-)
 rename xen/{common => lib}/rbtree.c (98%)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 332e7d667cec..d65c9fe9cb4e 100644
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
index 72c72fffecf2..b0fe8c72acf5 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -4,3 +4,4 @@ lib-y += ctors.o
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


