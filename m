Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DBB096BD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 00:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047561.1418009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucWgI-0006QB-U5; Thu, 17 Jul 2025 22:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047561.1418009; Thu, 17 Jul 2025 22:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucWgI-0006N6-R9; Thu, 17 Jul 2025 22:02:22 +0000
Received: by outflank-mailman (input) for mailman id 1047561;
 Thu, 17 Jul 2025 22:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqsb=Z6=redhat.com=awilliam@srs-se1.protection.inumbo.net>)
 id 1ucWgH-0006Kw-9i
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 22:02:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4c8672a-6359-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 00:02:19 +0200 (CEST)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-490-vsZ3QOn1PSKJ2iYi8B5fqQ-1; Thu,
 17 Jul 2025 18:02:14 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BFFCD19560AD; Thu, 17 Jul 2025 22:02:12 +0000 (UTC)
Received: from toolbx.redhat.com (unknown [10.22.88.95])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 14D831800D82; Thu, 17 Jul 2025 22:02:10 +0000 (UTC)
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
X-Inumbo-ID: b4c8672a-6359-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752789738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hosMPFD9DjbGtRmFRvT2OvwkrUJr/nIyXgIjKqas5bE=;
	b=Q3SWvE0UuLtGlMotBlpVMMBE1QIRxc8iiOXEiobbPIL9sH9xfcRYBf07A/5TFryUaRqApz
	KTHvmf5GLMtCuToMkHIxwrxbl6EdYphL1RkdsnSwLlScLdVHojFIU8f/C3K+9FhVXH5s3x
	6UYa4Ofr4MRZCGfTza5cugOpTc2RHgE=
X-MC-Unique: vsZ3QOn1PSKJ2iYi8B5fqQ-1
X-Mimecast-MFC-AGG-ID: vsZ3QOn1PSKJ2iYi8B5fqQ_1752789733
From: Adam Williamson <awilliam@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH] xen/passthrough: add missing error-report include
Date: Thu, 17 Jul 2025 15:02:07 -0700
Message-ID: <20250717220207.171040-1-awilliam@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

In cfcacba an `error_report` was added to this file, but the
corresponding include of `qemu/error-report.h` was missed. This
only becomes apparent when building against Xen 4.20+.

Signed-off-by: Adam Williamson <awilliam@redhat.com>
---
 hw/xen/xen_pt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 9d16644d82..006b5b55f2 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -54,6 +54,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include <sys/ioctl.h>
 
 #include "hw/pci/pci.h"
-- 
2.50.1


