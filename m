Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7EC6EB90
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 14:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165961.1492643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLhvt-0004Ix-Au; Wed, 19 Nov 2025 13:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165961.1492643; Wed, 19 Nov 2025 13:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLhvt-0004DX-5L; Wed, 19 Nov 2025 13:09:13 +0000
Received: by outflank-mailman (input) for mailman id 1165961;
 Wed, 19 Nov 2025 13:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aBqX=53=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vLhvr-0003w5-KG
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 13:09:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee9c0f27-c548-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 14:09:08 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-AWehYKanNrqJKV5WNRli2g-1; Wed,
 19 Nov 2025 08:09:04 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 664D91956096; Wed, 19 Nov 2025 13:09:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6C6D3195608E; Wed, 19 Nov 2025 13:08:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 84D1321E66EF; Wed, 19 Nov 2025 14:08:55 +0100 (CET)
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
X-Inumbo-ID: ee9c0f27-c548-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763557747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2/KZiPL6jFf6ZEf6LuTfoZJ9VDQwSYmfYUw5h6FWj8=;
	b=d9jsWNs817ctZjQ2q7OG5AQdAQcwqVhcdYVpF+G+WzI+f42B55AFI6X2oaGbFLYKbxz7lg
	JywkaTCzc2VHpMhgAY0sPBoRW1BdCSgwXKcoF4HLkpBEk+hNhPKjEUMte4mcJ02mowrhlc
	lHWSxSZAVHBwM4b0uy1iGjjlX0CqO/U=
X-MC-Unique: AWehYKanNrqJKV5WNRli2g-1
X-Mimecast-MFC-AGG-ID: AWehYKanNrqJKV5WNRli2g_1763557741
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	mst@redhat.com,
	imammedo@redhat.com,
	anisinha@redhat.com,
	gengdongjiu1@gmail.com,
	peter.maydell@linaro.org,
	alistair@alistair23.me,
	edgar.iglesias@gmail.com,
	npiggin@gmail.com,
	harshpb@linux.ibm.com,
	palmer@dabbelt.com,
	liwei1518@gmail.com,
	dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	berrange@redhat.com,
	peterx@redhat.com,
	farosas@suse.de,
	eblake@redhat.com,
	vsementsov@yandex-team.ru,
	eduardo@habkost.net,
	marcel.apfelbaum@gmail.com,
	philmd@linaro.org,
	wangyanan55@huawei.com,
	zhao1.liu@intel.com,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/5] nbd/client-connection: Replace error_propagate() by assignment
Date: Wed, 19 Nov 2025 14:08:53 +0100
Message-ID: <20251119130855.105479-4-armbru@redhat.com>
In-Reply-To: <20251119130855.105479-1-armbru@redhat.com>
References: <20251119130855.105479-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

connect_thread_func() sets a variable to null, then error_propagate()s
an Error * to it.  This is a roundabout way to assign the Error * to
it, so replace it by just that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 nbd/client-connection.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 79ea97e4cc..6a4f080717 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -207,8 +207,7 @@ static void *connect_thread_func(void *opaque)
         qemu_mutex_lock(&conn->mutex);
 
         error_free(conn->err);
-        conn->err = NULL;
-        error_propagate(&conn->err, local_err);
+        conn->err = local_err;
 
         if (ret < 0) {
             object_unref(OBJECT(conn->sioc));
-- 
2.49.0


