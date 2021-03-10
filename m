Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485DD333A83
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95989.181332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwM4-0003x9-Gg; Wed, 10 Mar 2021 10:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95989.181332; Wed, 10 Mar 2021 10:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwM4-0003wl-Cx; Wed, 10 Mar 2021 10:46:16 +0000
Received: by outflank-mailman (input) for mailman id 95989;
 Wed, 10 Mar 2021 10:46:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJwM2-0003wc-Dt
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:46:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74e6b74e-0ced-4df2-982c-200d980c9508;
 Wed, 10 Mar 2021 10:46:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 017F9AC24;
 Wed, 10 Mar 2021 10:46:13 +0000 (UTC)
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
X-Inumbo-ID: 74e6b74e-0ced-4df2-982c-200d980c9508
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615373173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvUHprKx53TaVD+UfRnNYW7HFBxwI5hyLFfjImK+NmI=;
	b=a08Avz/NSZFWEZLSEKggtjR0QaOpO0YEpvzKqyclVcRIFKKhJbYKiTYvp9GBR9sKc42uD9
	7kH517gdlU6BcVbC0XhfYHMVO3pKWDGRVamM3iP6bt4YNG+m07xcUlKLf9x8yUJ5ytwsNC
	29dfs0qEwcXQfvpA3NXgXe5G6i84mDU=
Subject: [PATCH 3/3] Xen/gntdev: don't needlessly use kvcalloc()
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2b326dc6-c624-c97b-f9c4-4cc68dd013ba@suse.com>
Message-ID: <9a726be2-4893-8ffe-0ef1-b70dd1c229b1@suse.com>
Date: Wed, 10 Mar 2021 11:46:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2b326dc6-c624-c97b-f9c4-4cc68dd013ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Requesting zeroed memory when all of it will be overwritten subsequently
by all ones is a waste of processing bandwidth. In fact, rather than
recording zeroed ->grants[], fill that array too with more appropriate
"invalid" indicators.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use (now generalized) INVALID_GRANT_REF.

--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -133,9 +133,12 @@ struct gntdev_grant_map *gntdev_alloc_ma
 	if (NULL == add)
 		return NULL;
 
-	add->grants    = kvcalloc(count, sizeof(add->grants[0]), GFP_KERNEL);
-	add->map_ops   = kvcalloc(count, sizeof(add->map_ops[0]), GFP_KERNEL);
-	add->unmap_ops = kvcalloc(count, sizeof(add->unmap_ops[0]), GFP_KERNEL);
+	add->grants    = kvmalloc_array(count, sizeof(add->grants[0]),
+					GFP_KERNEL);
+	add->map_ops   = kvmalloc_array(count, sizeof(add->map_ops[0]),
+					GFP_KERNEL);
+	add->unmap_ops = kvmalloc_array(count, sizeof(add->unmap_ops[0]),
+					GFP_KERNEL);
 	add->pages     = kvcalloc(count, sizeof(add->pages[0]), GFP_KERNEL);
 	if (NULL == add->grants    ||
 	    NULL == add->map_ops   ||
@@ -143,10 +146,10 @@ struct gntdev_grant_map *gntdev_alloc_ma
 	    NULL == add->pages)
 		goto err;
 	if (use_ptemod) {
-		add->kmap_ops   = kvcalloc(count, sizeof(add->kmap_ops[0]),
-					   GFP_KERNEL);
-		add->kunmap_ops = kvcalloc(count, sizeof(add->kunmap_ops[0]),
-					   GFP_KERNEL);
+		add->kmap_ops   = kvmalloc_array(count, sizeof(add->kmap_ops[0]),
+						 GFP_KERNEL);
+		add->kunmap_ops = kvmalloc_array(count, sizeof(add->kunmap_ops[0]),
+						 GFP_KERNEL);
 		if (NULL == add->kmap_ops || NULL == add->kunmap_ops)
 			goto err;
 	}
@@ -186,6 +189,8 @@ struct gntdev_grant_map *gntdev_alloc_ma
 		goto err;
 
 	for (i = 0; i < count; i++) {
+		add->grants[i].domid = DOMID_INVALID;
+		add->grants[i].ref = INVALID_GRANT_REF;
 		add->map_ops[i].handle = INVALID_GRANT_HANDLE;
 		add->unmap_ops[i].handle = INVALID_GRANT_HANDLE;
 		if (use_ptemod) {


