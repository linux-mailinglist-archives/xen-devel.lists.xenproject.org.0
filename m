Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0BE3A9B21
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142957.263746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1l-0005mx-Aq; Wed, 16 Jun 2021 12:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142957.263746; Wed, 16 Jun 2021 12:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1l-0005kQ-0C; Wed, 16 Jun 2021 12:52:17 +0000
Received: by outflank-mailman (input) for mailman id 142957;
 Wed, 16 Jun 2021 12:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1j-00075D-8G
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:15 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 369b540b-50dd-4914-92b8-e2f355492428;
 Wed, 16 Jun 2021 12:51:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCphtmH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:43 +0200 (CEST)
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
X-Inumbo-ID: 369b540b-50dd-4914-92b8-e2f355492428
ARC-Seal: i=1; a=rsa-sha256; t=1623847903; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=N9SFQiycwUqMVroio62f217jPoVGGdQJPf+D4dC5ewl1zRi6GWZOq5/LTLwxJbNuF1
    9BfpbqPX6LQPB4vOcV5UPcNv4ZDrHaYcxfQhfG9hmP7QCeTMYYGIZVZQvtap80KRLHqX
    Jj4kVAMFAjF+X9iA05oIcmhnXZK1FqFzaoe5/j4wLIjeaNR/glhGnGrD0VQZESX+opfM
    GDAq4bwCedM48Jo8Na7rwEAciY81rkFfrUNAE78psUmav+Ruz1cWMZRS064C9wXrGOlL
    5eBChx/a46rzypa89VzkNt9S1hdPVtwm+OZn3v/VUCEEN2nGbI1CjOUSd/yg7mRIlG58
    /AUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847903;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=2Gn1MT0Bi1Jqgmn6EP44HuJomJlyOc6/uRvNu601HFs=;
    b=TTyH7AS0EYebV694Lh3ak/7t7MpNELS967/d4eOPxKcUOU8PGLBzIivhH89OA/R3jC
    vz9f3/ke1SiOubqneeASXXLI/T9s4cH05Djx7giPr3m6x2keMKisCzwPZGEWxVQAR0Fd
    NQHBuTBuHu3HQhcb12hNY/WVcB3lfKHGzlR72v63f6hq6pQ0gGCCYC5XjIf255A6kAk2
    ytL2PW6LB09Uc2uWJPWcZ3FsbVFDvaezeOcN9MrP7w9Ix/yrFKelf8PzqLYx8m0GhFdE
    ivA3x4o+bXEFXA5KeJyyaDr+zpq3J24MmwHK3kvWHp+bIIVIy08xDg2K/iWox1hWyWMS
    y2eQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847903;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=2Gn1MT0Bi1Jqgmn6EP44HuJomJlyOc6/uRvNu601HFs=;
    b=HsPEmMwcLZBl7ViPln50aU/C9dmPPsiFdX7Gu+BIHYlvtmUwrzRTVn5aUVIOotoJUa
    xY+D0/ZdQEMjoBTz+nMkMBKTcWgY2JwXMrbUImBIcgmN/sIo+/Tr66fychQ1WT/tqkjH
    G0tQzl3iZ849Ok4KZ9vi50aRFysBJ/6fmswu2BbCg/PeftVFLIkBUAytM4VgSAd07o00
    VKy9vYaxcL0Ay9/a33XngyJL0YFAHrVEprB392l6WRypprNQdUVdqCABDbDjIgHWJfbC
    GNj5Bjdn/QD0x5V32rlAjVN3DDMLQEsFv4NotZMHtCvQDsbCIQM+0gUO/N5zMqTgrUTL
    eoTQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210616 22/36] tools: restore: move mfns array in populate_pfns
Date: Wed, 16 Jun 2021 14:51:15 +0200
Message-Id: <20210616125129.26563-23-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move populate_pfns mfns array into preallocated space.
Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h  | 2 ++
 tools/libs/saverestore/restore.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 34042c2b90..3cfb23861f 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -242,6 +242,8 @@ struct sr_restore_arrays {
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     int map_errs[MAX_BATCH_SIZE];
+    /* populate_pfns */
+    xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 6eb955423c..0c29478ccb 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -138,12 +138,12 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
                   const xen_pfn_t *original_pfns, const uint32_t *types)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
+    xen_pfn_t *mfns = ctx->restore.m->pp_mfns,
         *pfns = malloc(count * sizeof(*pfns));
     unsigned int i, nr_pfns = 0;
     int rc = -1;
 
-    if ( !mfns || !pfns )
+    if ( !pfns )
     {
         ERROR("Failed to allocate %zu bytes for populating the physmap",
               2 * count * sizeof(*mfns));
@@ -191,7 +191,6 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
  err:
     free(pfns);
-    free(mfns);
 
     return rc;
 }

