Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE8A613BB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 15:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914736.1320422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt684-0000YO-VU; Fri, 14 Mar 2025 14:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914736.1320422; Fri, 14 Mar 2025 14:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt684-0000Uh-SH; Fri, 14 Mar 2025 14:35:16 +0000
Received: by outflank-mailman (input) for mailman id 914736;
 Fri, 14 Mar 2025 14:35:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iXy+=WB=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1tt683-0008TP-4x
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 14:35:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88192c88-00e1-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 15:35:10 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-g1pY-nTuMVmbWQzThjJd7Q-1; Fri,
 14 Mar 2025 10:35:06 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C24C218001E3; Fri, 14 Mar 2025 14:35:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.22.74.4])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0D7AC1955F2D; Fri, 14 Mar 2025 14:35:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 26E6621E669D; Fri, 14 Mar 2025 15:35:00 +0100 (CET)
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
X-Inumbo-ID: 88192c88-00e1-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741962909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOP2k/YvGRFFx3UKMWPK+4XpP/sMhbf4xDwkal25Q3k=;
	b=bafW6J3lT55egvCU7Na6zefMibKtJKpCgz8tOJ+ox1ceTxbUPeOdiU9Cld9mA4723lUq9z
	fxuGHgvtE/H1sZssVRRXGhzbdt4s9gQSwYhY29VookCK2H9+vaTZAovNL+bMPyAAIncaXu
	y1N6ZaUaSnUVjCe6aAAWXTrDCSEP2mE=
X-MC-Unique: g1pY-nTuMVmbWQzThjJd7Q-1
X-Mimecast-MFC-AGG-ID: g1pY-nTuMVmbWQzThjJd7Q_1741962905
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@gmail.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] hw/xen: Downgrade a xen_bus_realize() non-error to warning
Date: Fri, 14 Mar 2025 15:35:00 +0100
Message-ID: <20250314143500.2449658-3-armbru@redhat.com>
In-Reply-To: <20250314143500.2449658-1-armbru@redhat.com>
References: <20250314143500.2449658-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

xen_bus_realize() reports a failure to set up a watch as error, but it
doesn't treat it as one: it simply continues.  Report a warning
instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/xen/xen-bus.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 2aacc1436f..f808a01813 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -353,10 +353,9 @@ static void xen_bus_realize(BusState *bus, Error **errp)
             xs_node_watch(xenbus->xsh, node, key, xen_bus_backend_changed,
                           xenbus, &local_err);
         if (local_err) {
-            /* This need not be treated as a hard error so don't propagate */
-            error_reportf_err(local_err,
-                              "failed to set up '%s' enumeration watch: ",
-                              type[i]);
+            warn_reportf_err(local_err,
+                             "failed to set up '%s' enumeration watch: ",
+                             type[i]);
             local_err = NULL;
         }
 
-- 
2.48.1


