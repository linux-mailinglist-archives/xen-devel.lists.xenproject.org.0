Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A013DA613BD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 15:35:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914735.1320409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt683-0000Av-P0; Fri, 14 Mar 2025 14:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914735.1320409; Fri, 14 Mar 2025 14:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt683-0008VG-KD; Fri, 14 Mar 2025 14:35:15 +0000
Received: by outflank-mailman (input) for mailman id 914735;
 Fri, 14 Mar 2025 14:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iXy+=WB=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1tt682-0008TQ-82
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 14:35:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8965783a-00e1-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 15:35:13 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-8BdvRzc8NNqYnKGyFlUU7Q-1; Fri,
 14 Mar 2025 10:35:06 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 75B7219560BD; Fri, 14 Mar 2025 14:35:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.22.74.4])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D88BF1955D88; Fri, 14 Mar 2025 14:35:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2285121E669B; Fri, 14 Mar 2025 15:35:00 +0100 (CET)
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
X-Inumbo-ID: 8965783a-00e1-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741962911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSnAFyHbXjYvoKbSaLlW0KNyvNRMW+n7e7ObBx98y04=;
	b=A8lx0ja4K5GH8YI8/ik+LpcrUa7BxEmGFnFBtQ8A/mYWrprsZofS0rriA7xNT6ZApb2Kf9
	YU6sleAygAdljwI4PFIQL3/oYFpv+4hmQGjW6/cReN9CImZjO5XXxh7NzYBHoylapDaSko
	1D1bvtccHKlaLQuroluwucuN0tc3dDI=
X-MC-Unique: 8BdvRzc8NNqYnKGyFlUU7Q-1
X-Mimecast-MFC-AGG-ID: 8BdvRzc8NNqYnKGyFlUU7Q_1741962905
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@gmail.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] hw/xen: Fix xen_bus_realize() error handling
Date: Fri, 14 Mar 2025 15:34:59 +0100
Message-ID: <20250314143500.2449658-2-armbru@redhat.com>
In-Reply-To: <20250314143500.2449658-1-armbru@redhat.com>
References: <20250314143500.2449658-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

xen_bus_realize() is wrong that way: it passes &local_err to
xs_node_watch() in a loop.  If this fails in more than one iteration,
it can trip error_setv()'s assertion.

Fix by clearing @local_err.

Fixes: c4583c8c394e (xen-bus: reduce scope of backend watch)
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/xen/xen-bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 8260f1e1bb..2aacc1436f 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -357,6 +357,7 @@ static void xen_bus_realize(BusState *bus, Error **errp)
             error_reportf_err(local_err,
                               "failed to set up '%s' enumeration watch: ",
                               type[i]);
+            local_err = NULL;
         }
 
         g_free(node);
-- 
2.48.1


