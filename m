Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2D33B9024
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148361.274301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRj-0002WK-QN; Thu, 01 Jul 2021 09:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148361.274301; Thu, 01 Jul 2021 09:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRj-0002Nz-FD; Thu, 01 Jul 2021 09:57:23 +0000
Received: by outflank-mailman (input) for mailman id 148361;
 Thu, 01 Jul 2021 09:57:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRg-0004XT-SM
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:20 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a889ee9-8a7f-45e2-9550-29b8986b84eb;
 Thu, 01 Jul 2021 09:56:50 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ui5Mt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:44 +0200 (CEST)
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
X-Inumbo-ID: 8a889ee9-8a7f-45e2-9550-29b8986b84eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133405;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ZxRdsP8qr4H2zPhSJi5htgzgprczUQRiHOrKeRY262U=;
    b=pySoDWwLANK1H+EV2djdxCEct7RE0o92/5MBJbj9uBZ20QaDBrkor4fsJbbwF94Qn9
    oF1R0s3ZGgNTnRhVBs2zFr9xUaFrc05L/dLZ9Nzt/Dm8OED46IxiswjcVursv+j1XV33
    AoGb2AbwrJHSbv3JRr2z5oLqykleezJJsMFrzc2GynrNFEQuCPjitiAdlsMojAPB7yCD
    Vm75lhMVX30wiJ8nX34ukRMOo4OMFU9JS0L4jqN62m9qq9MbSqo9C+whOKhmgYkc1nb+
    K8s6BcDCbkJD5IEq2RrYG7wuVdlm9mtUdqVg3VuHlqDnCWXxPdwBIkdYWk2BL3NfKV9e
    7m2A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210701 12/40] tools: unify type checking for data pfns in migration stream
Date: Thu,  1 Jul 2021 11:56:07 +0200
Message-Id: <20210701095635.15648-13-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a helper which decides if a given pfn in the migration
stream is backed by memory.

This specifically deals with type XEN_DOMCTL_PFINFO_XALLOC, which was
a synthetic toolstack-only type used in Xen 4.2 to 4.5. It indicated a
dirty page on the sending side for which no data will be send in the
initial iteration.

No change in behavior intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  | 17 +++++++++++++++++
 tools/libs/saverestore/restore.c |  5 ++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 07c506360c..fa242e808d 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -500,6 +500,23 @@ static inline bool sr_is_known_page_type(xen_pfn_t type)
     return ret;
 }
 
+static inline bool page_type_to_populate(uint32_t type)
+{
+    bool ret;
+
+    switch (type)
+    {
+    case XEN_DOMCTL_PFINFO_XTAB:
+    case XEN_DOMCTL_PFINFO_BROKEN:
+        ret = false;
+        break;
+    case XEN_DOMCTL_PFINFO_XALLOC:
+    default:
+        ret = true;
+        break;
+    }
+    return ret;
+}
 #endif
 /*
  * Local variables:
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 324b9050e2..477b7527a1 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -152,9 +152,8 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
     for ( i = 0; i < count; ++i )
     {
-        if ( (!types || (types &&
-                         (types[i] != XEN_DOMCTL_PFINFO_XTAB &&
-                          types[i] != XEN_DOMCTL_PFINFO_BROKEN))) &&
+        if ( (!types ||
+              (types && page_type_to_populate(types[i]) == true)) &&
              !pfn_is_populated(ctx, original_pfns[i]) )
         {
             rc = pfn_set_populated(ctx, original_pfns[i]);

