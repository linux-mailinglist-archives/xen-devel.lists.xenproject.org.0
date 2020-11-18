Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB43E2B8351
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 18:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30184.59988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRXN-0002Fb-Mh; Wed, 18 Nov 2020 17:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30184.59988; Wed, 18 Nov 2020 17:46:33 +0000
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
	id 1kfRXN-0002FC-IT; Wed, 18 Nov 2020 17:46:33 +0000
Received: by outflank-mailman (input) for mailman id 30184;
 Wed, 18 Nov 2020 17:46:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfRXM-0002F6-9O
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:46:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRXJ-0007DO-Eo; Wed, 18 Nov 2020 17:46:29 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRXJ-000793-4d; Wed, 18 Nov 2020 17:46:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRXM-0002F6-9O
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Y6NuYGWWy57XvYFSOtY7ipXnIsY+BgksXFq/bf3BCk8=; b=DwRbkCgs+IoWjG+D97HvH/L4pe
	3rfW4Cgn3urF7wB6SBzB8R43wNx5nNxaX71RPRP1PBagv+7t/fTNzBWJODv14zk5716I8jE3UGU1l
	/mNXt5oWa1Ljn9GI38QOemuKqrkkM/Z2zR9XxcfEG/CVX235EPnXseraeuKJDgJLwtus=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRXJ-0007DO-Eo; Wed, 18 Nov 2020 17:46:29 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRXJ-000793-4d; Wed, 18 Nov 2020 17:46:29 +0000
Subject: Re: [PATCH v2 6/8] lib: move rbtree code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <e16975d3-c34b-1b3f-743f-1abe13aa06f7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eae3d402-b1d4-6fcb-06b8-ea337a26ab50@xen.org>
Date: Wed, 18 Nov 2020 17:46:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <e16975d3-c34b-1b3f-743f-1abe13aa06f7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2020 11:18, Jan Beulich wrote:
> Build this code into an archive, which results in not linking it into
> x86 final binaries. This saves about 1.5k of dead code.
> 
> While moving the source file, take the opportunity and drop the
> pointless EXPORT_SYMBOL().

Given this code is borrowed from Linux, I don't think we want to remove 
them. This is to make easier to re-sync.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/common/Makefile          | 1 -
>   xen/lib/Makefile             | 1 +
>   xen/{common => lib}/rbtree.c | 9 +--------
>   3 files changed, 2 insertions(+), 9 deletions(-)
>   rename xen/{common => lib}/rbtree.c (98%)
> 
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 52d3c2aa9384..7bb779f780a1 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -33,7 +33,6 @@ obj-y += preempt.o
>   obj-y += random.o
>   obj-y += rangeset.o
>   obj-y += radix-tree.o
> -obj-y += rbtree.o
>   obj-y += rcupdate.o
>   obj-y += rwlock.o
>   obj-y += shutdown.o
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index ba1fb7bcdee2..b469d2dff7b8 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_X86) += x86/
>   lib-y += ctype.o
>   lib-y += list-sort.o
>   lib-y += parse-size.o
> +lib-y += rbtree.o
> diff --git a/xen/common/rbtree.c b/xen/lib/rbtree.c
> similarity index 98%
> rename from xen/common/rbtree.c
> rename to xen/lib/rbtree.c
> index 9f5498a89d4e..95e045d52461 100644
> --- a/xen/common/rbtree.c
> +++ b/xen/lib/rbtree.c
> @@ -25,7 +25,7 @@
>   #include <xen/rbtree.h>
>   
>   /*
> - * red-black trees properties:  http://en.wikipedia.org/wiki/Rbtree
> + * red-black trees properties:  http://en.wikipedia.org/wiki/Rbtree

This looks like a spurious change.

>    *
>    *  1) A node is either red or black
>    *  2) The root is black
> @@ -223,7 +223,6 @@ void rb_insert_color(struct rb_node *node, struct rb_root *root)
>   		}
>   	}
>   }
> -EXPORT_SYMBOL(rb_insert_color);
>   
>   static void __rb_erase_color(struct rb_node *parent, struct rb_root *root)
>   {
> @@ -467,7 +466,6 @@ void rb_erase(struct rb_node *node, struct rb_root *root)
>   	if (rebalance)
>   		__rb_erase_color(rebalance, root);
>   }
> -EXPORT_SYMBOL(rb_erase);
>   
>   /*
>    * This function returns the first node (in sort order) of the tree.
> @@ -483,7 +481,6 @@ struct rb_node *rb_first(const struct rb_root *root)
>   		n = n->rb_left;
>   	return n;
>   }
> -EXPORT_SYMBOL(rb_first);
>   
>   struct rb_node *rb_last(const struct rb_root *root)
>   {
> @@ -496,7 +493,6 @@ struct rb_node *rb_last(const struct rb_root *root)
>   		n = n->rb_right;
>   	return n;
>   }
> -EXPORT_SYMBOL(rb_last);
>   
>   struct rb_node *rb_next(const struct rb_node *node)
>   {
> @@ -528,7 +524,6 @@ struct rb_node *rb_next(const struct rb_node *node)
>   
>   	return parent;
>   }
> -EXPORT_SYMBOL(rb_next);
>   
>   struct rb_node *rb_prev(const struct rb_node *node)
>   {
> @@ -557,7 +552,6 @@ struct rb_node *rb_prev(const struct rb_node *node)
>   
>   	return parent;
>   }
> -EXPORT_SYMBOL(rb_prev);
>   
>   void rb_replace_node(struct rb_node *victim, struct rb_node *new,
>   		     struct rb_root *root)
> @@ -574,4 +568,3 @@ void rb_replace_node(struct rb_node *victim, struct rb_node *new,
>   	/* Copy the pointers/colour from the victim to the replacement */
>   	*new = *victim;
>   }
> -EXPORT_SYMBOL(rb_replace_node);
> 

Cheers,

-- 
Julien Grall

