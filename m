Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C171B277423
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 16:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLSMe-0005sY-OJ; Thu, 24 Sep 2020 14:36:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UqNy=DB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLSMd-0005sT-S9
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 14:36:51 +0000
X-Inumbo-ID: 2d118b29-8823-47c6-9f5d-89b777b71c56
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d118b29-8823-47c6-9f5d-89b777b71c56;
 Thu, 24 Sep 2020 14:36:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600958210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=a11iZA66fIZPc+peMoqf4lIlo+fGT/XEXYOUUx0CayM=;
 b=Jt8aa8OgAONs2V9LzScXrXjIr/fWS78sI2j74IDHxd4uu2O14YWrVDSQ7Cidi0z2wWWRkM
 qv6XnmLlDUDXZAOWnzw/yB8/uTa37HBfHOjNQH0pQpHngrL73iydYOz22sG9T1d9qzlRQS
 Hetsw9XFeaBtUgVuxwBoaVXfJT0du7A=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49BA9AAC7;
 Thu, 24 Sep 2020 14:36:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH] tools/xenstore: set maximum number of grants needed
Date: Thu, 24 Sep 2020 16:36:48 +0200
Message-Id: <20200924143648.27861-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When running as a stubdom Xenstore should set the maximum number of
grants needed via a call of xengnttab_set_max_grants(), as otherwise
the number of domains which can be supported will be 128 only (the
default number of grants supported by Mini-OS).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
This is a backport candidate IMO.
---
 tools/xenstore/xenstored_domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 06359503f0..f740aa02f5 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -630,6 +630,8 @@ void domain_init(void)
 	*xgt_handle = xengnttab_open(NULL, 0);
 	if (*xgt_handle == NULL)
 		barf_perror("Failed to open connection to gnttab");
+	/* Allow max number of domains for mappings. */
+	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);
 
 	talloc_set_destructor(xgt_handle, close_xgt_handle);
 
-- 
2.26.2


