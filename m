Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E332D9F3B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52463.91864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshw-0003kw-BY; Mon, 14 Dec 2020 18:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52463.91864; Mon, 14 Dec 2020 18:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshv-0003g8-Gp; Mon, 14 Dec 2020 18:36:27 +0000
Received: by outflank-mailman (input) for mailman id 52463;
 Mon, 14 Dec 2020 17:06:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O6EJ=FS=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1korJ0-0001x2-3B
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 17:06:38 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9ad1bd6e-18cc-453b-bac9-306d71786958;
 Mon, 14 Dec 2020 17:06:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-D0CmhjvTOY6pEL_0tz-PPA-1; Mon, 14 Dec 2020 12:06:33 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6511012EA3;
 Mon, 14 Dec 2020 17:06:19 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-231.rdu2.redhat.com
 [10.10.112.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9AEB5D6AB;
 Mon, 14 Dec 2020 17:05:37 +0000 (UTC)
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
X-Inumbo-ID: 9ad1bd6e-18cc-453b-bac9-306d71786958
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607965597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/WpOYjMEI+uu6Ezu621PcgD7x1p7LtSJUlUJzLyqhGc=;
	b=GDKALjNQdTUuK4lCz8sOK7Ds7EM8Kw3WgME4H6+oOwUCaDYsXjzGjQ6rxn81lQy3+saEZ3
	rfdLTGdkOZMOh7w9JHKG5sSnKtqupk0VUeCHYo5HcJ1tjZ4PE2KE1vlZv+aPVirnLBGGyv
	NuwUIM78Rklg4sjogSAFOTZzTeFjTRI=
X-MC-Unique: D0CmhjvTOY6pEL_0tz-PPA-1
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 2/4] block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()
Date: Mon, 14 Dec 2020 18:05:17 +0100
Message-Id: <20201214170519.223781-3-slp@redhat.com>
In-Reply-To: <20201214170519.223781-1-slp@redhat.com>
References: <20201214170519.223781-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

While processing the parents of a BDS, one of the parents may process
the child that's doing the tail recursion, which leads to a BDS being
processed twice. This is especially problematic for the aio_notifiers,
as they might attempt to work on both the old and the new AIO
contexts.

To avoid this, add the BDS pointer to the ignore list, and check the
child BDS pointer while iterating over the children.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 block.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index f1cedac362..bc8a66ab6e 100644
--- a/block.c
+++ b/block.c
@@ -6465,12 +6465,17 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
     bdrv_drained_begin(bs);
 
     QLIST_FOREACH(child, &bs->children, next) {
-        if (g_slist_find(*ignore, child)) {
+        if (g_slist_find(*ignore, child) || g_slist_find(*ignore, child->bs)) {
             continue;
         }
         *ignore = g_slist_prepend(*ignore, child);
         bdrv_set_aio_context_ignore(child->bs, new_context, ignore);
     }
+    /*
+     * Add a reference to this BS to the ignore list, so its
+     * parents won't attempt to process it again.
+     */
+    *ignore = g_slist_prepend(*ignore, bs);
     QLIST_FOREACH(child, &bs->parents, next_parent) {
         if (g_slist_find(*ignore, child)) {
             continue;
-- 
2.26.2


