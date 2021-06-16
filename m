Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C93A9B1F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142952.263724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1g-0004j3-E3; Wed, 16 Jun 2021 12:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142952.263724; Wed, 16 Jun 2021 12:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1g-0004d3-4h; Wed, 16 Jun 2021 12:52:12 +0000
Received: by outflank-mailman (input) for mailman id 142952;
 Wed, 16 Jun 2021 12:52:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1e-00075D-88
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:10 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3133b3a-05ca-476e-a4d8-03107f301f32;
 Wed, 16 Jun 2021 12:51:48 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCphtmF
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
X-Inumbo-ID: c3133b3a-05ca-476e-a4d8-03107f301f32
ARC-Seal: i=1; a=rsa-sha256; t=1623847903; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ohS/KAgS1qnECx4K8vUIAIRYQKCo0QYE9XXnqRt6loKSUMq5Af3ZMwucSSyU4hidku
    mQlWc/m0IPMaMuS60Kz+vXTUjg6az/PvkNew1U0vwz05NTofNK5EHKCCtpKPQVQk+vGY
    SaBcqIg+XXdVL3rCg5mNFhX2VIvPZNswDCoKUNXzxqEsI1FWVpJAnS3ketn9gxYc58WR
    2jfMZUmrNSHS8rsMksgvsD+9fAKYBfV85U/QcJqk9teC6XQX19yHms13x5I5FfnV+3Yc
    uqu54dHC2WlJOaiulF6eXl65vw7Owj1joqeII3kqa5b+YL2m74W75yuyBeJARZvbtXYL
    MRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847903;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=jECKf3sL2DTnpGqAznPVbUN7tLXZQbgjgWqGsEtA4iA=;
    b=GjR90vz9RCP0DIoOSuG1FugVmpRs1Gl2p0tn70f7eDGTIuc12jdOGUDAYVhAWPTWct
    x1eFWvAXGaZH33DWYP90UNrhm01LI7cjr7kjVNfZkB2rjo1q2Lj4y9A45gQweWNmJIKJ
    jWOqvrk4kokNbUhawJMK/k0CiTJAhRz2M7y3YjQZgd23lrtwvhnxxn6qDtPsFtHMUN8y
    bMYXJUWpd+EGBbQ+t6gC+WW3cq43iNCL3qywx1rILWsv6m6bGILhjHvvlzDq5Ec47Z8Y
    nVTqpFz4jcUOEL7sE7qJiYvwLFeumJWHAzkCdVNnCw3YWeqFij97Br6d+T5GFy+85ANr
    HFkA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847903;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=jECKf3sL2DTnpGqAznPVbUN7tLXZQbgjgWqGsEtA4iA=;
    b=F54RWxRU+WpmRT4Yk7Xy3BUNbHQQpm2uV1w+WnAQVsgZK2YZvBeQak043u5WfqVdTc
    XowzbQlDxibs0LBDp2jMjKmjI6Cg87lDGHxm1MuG95q0hhy8DLxeOsBYd08fTFsJu4MR
    Jh6/TOl9mx/CE7/Jkco/bY7/sy9zkNCp2chtOXjF7iB365k5LXIoR9DLNDDmIMsXaPNa
    xuQl6UlWTKuPKTHWZh0tzy7eLhLVsFmK2TS7jeAgFDZ9TR4+z01XryyEznJ2d321OS+S
    sV3xTazczZiYlWjY8lxyck5VSx56nCtowrNo+TRn11K7QjFoNnbG+v9/unXH3dIWSr0H
    ylNg==
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
Subject: [PATCH v20210616 21/36] tools: restore: move map_errs array
Date: Wed, 16 Jun 2021 14:51:14 +0200
Message-Id: <20210616125129.26563-22-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move map_errs array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h  |  1 +
 tools/libs/saverestore/restore.c | 12 +-----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 54352f5427..34042c2b90 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -241,6 +241,7 @@ struct sr_restore_arrays {
     uint32_t types[MAX_BATCH_SIZE];
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
+    int map_errs[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 1a7cfbcd47..6eb955423c 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -206,21 +206,13 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->restore.m->mfns;
-    int *map_errs = malloc(count * sizeof(*map_errs));
+    int *map_errs = ctx->restore.m->map_errs;
     int rc;
     void *mapping = NULL, *guest_page = NULL;
     unsigned int i, /* i indexes the pfns from the record. */
         j,          /* j indexes the subset of pfns we decide to map. */
         nr_pages = 0;
 
-    if ( !map_errs )
-    {
-        rc = -1;
-        ERROR("Failed to allocate %zu bytes to process page data",
-              count * (sizeof(*mfns) + sizeof(*map_errs)));
-        goto err;
-    }
-
     rc = populate_pfns(ctx, count, pfns, types);
     if ( rc )
     {
@@ -298,8 +290,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     if ( mapping )
         xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
 
-    free(map_errs);
-
     return rc;
 }
 

