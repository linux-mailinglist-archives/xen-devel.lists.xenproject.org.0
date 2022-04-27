Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A73511862
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315051.533385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhm4-0006bW-HW; Wed, 27 Apr 2022 13:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315051.533385; Wed, 27 Apr 2022 13:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhm4-0006YI-Dg; Wed, 27 Apr 2022 13:32:08 +0000
Received: by outflank-mailman (input) for mailman id 315051;
 Wed, 27 Apr 2022 13:32:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nU4i=VF=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1njhm2-0006Y8-5h
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:32:06 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a5fd090-c62e-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 15:32:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-nK8wegdCPM-TDGnzXO5hFQ-1; Wed, 27 Apr 2022 09:31:59 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B59E9804184;
 Wed, 27 Apr 2022 13:31:58 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B24C257AF7C;
 Wed, 27 Apr 2022 13:31:57 +0000 (UTC)
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
X-Inumbo-ID: 6a5fd090-c62e-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651066322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zYhgACUWQgq9l8pXl+6GzDv56SU2M/vIYGGXa0gaxtU=;
	b=fAnRZqzF7JoZgHHt0AvemjreflGrWGOcEkYe0hM2PplP2vLxvhhcvD4hC9/GdM5Bm/ncg3
	trHTGQLqXne9SnGww8rIGd9at9T8Z3jxSq8BIVrBLYS3upwwnYcAgBvgqw2IRMZ7wWvLqa
	omcGNp4SqgWCR00dLQXfO2R6kq4fp1w=
X-MC-Unique: nK8wegdCPM-TDGnzXO5hFQ-1
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH] qemu-options: Limit the -xen options to x86 and arm
Date: Wed, 27 Apr 2022 15:31:56 +0200
Message-Id: <20220427133156.344418-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9

The Xen hypervisor is only available on x86 and arm - thus let's
limit the related options to these targets.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 1764eebfaf..cc3a39d21a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4184,16 +4184,17 @@ SRST
 ERST
 
 DEF("xen-domid", HAS_ARG, QEMU_OPTION_xen_domid,
-    "-xen-domid id   specify xen guest domain id\n", QEMU_ARCH_ALL)
+    "-xen-domid id   specify xen guest domain id\n",
+    QEMU_ARCH_ARM | QEMU_ARCH_I386)
 DEF("xen-attach", 0, QEMU_OPTION_xen_attach,
     "-xen-attach     attach to existing xen domain\n"
     "                libxl will use this when starting QEMU\n",
-    QEMU_ARCH_ALL)
+    QEMU_ARCH_ARM | QEMU_ARCH_I386)
 DEF("xen-domid-restrict", 0, QEMU_OPTION_xen_domid_restrict,
     "-xen-domid-restrict     restrict set of available xen operations\n"
     "                        to specified domain id. (Does not affect\n"
     "                        xenpv machine type).\n",
-    QEMU_ARCH_ALL)
+    QEMU_ARCH_ARM | QEMU_ARCH_I386)
 SRST
 ``-xen-domid id``
     Specify xen guest domain id (XEN only).
-- 
2.27.0


