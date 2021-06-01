Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0321E3977C3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135038.251276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71f-0003rr-KH; Tue, 01 Jun 2021 16:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135038.251276; Tue, 01 Jun 2021 16:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71f-0003nG-Dg; Tue, 01 Jun 2021 16:13:55 +0000
Received: by outflank-mailman (input) for mailman id 135038;
 Tue, 01 Jun 2021 16:13:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70V-0005Ec-2v
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:43 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.173])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81bee282-d57c-4860-a341-5a7dd6617a8c;
 Tue, 01 Jun 2021 16:11:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBZ1BS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:35 +0200 (CEST)
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
X-Inumbo-ID: 81bee282-d57c-4860-a341-5a7dd6617a8c
ARC-Seal: i=1; a=rsa-sha256; t=1622563895; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BhWx2Lzvkn8drrWiY9EL+zi8qGJasAKHBfLwAQ4xsCYXjaeUmkQLcSbxo0/q8HUN0o
    Em0Ad4PkM3dTa+nIhfXrFfxGvNvQJgOcpVgJMvqNGYUHoVQURkGI/KemvE/s/qb0XJVY
    8cjZoUQU7lHTAsarC20/kDl0upgArQ3953JQwn2J6U3v/PvyQ31tWbs8Or3BbCUygqxS
    YjLw+GSIWihXeRtKlzfb3sHsvBJPjrLPC7A02eaJ3kTovml5Ixp6shM+x/Xy78Yvmg7j
    JMnr38LrnyujJCWYm87psmkzhjRpwHNmzX7kD21HG36XBHozKhaZh+megSbSMweRR0u+
    xe5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563895;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pHLUvMX7U6lUA9on8DVqvFH+okBXqcoC5FrFwr0VWLE=;
    b=Mol42r7yOgKyOSeNd6LYWFOCEO41h5/ExFJ3B9CD+Fj/3SFQt1Ml0Ig3yQ/emp1xyz
    qC/0qjvLV8QoI0WQAjHTCJmch+N3z4JY5BhpxnZcMjatuBZV+CdyAjQGothm9W6JShsB
    pKTC/8rEREm9FdtGb3YxbmPDAv7QIN3AGZor0jC8uFDmGOGsdehxszPXsxYIRxkhkcFr
    3PKsuW+XAQPRmt/Lyxfzn6sy8sm3yISsUGYcWe9Or17DtK6OCZal+kSqJERrrEv2duUY
    WXloG2LrddUjm0bUwe1TrPEM+ZgiLPBrk64BDNHY6B+As0Eo1FEI9dHgw8HanjKxnLeS
    WxeQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563895;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pHLUvMX7U6lUA9on8DVqvFH+okBXqcoC5FrFwr0VWLE=;
    b=HTQbY5Y4vm6yKSuHhB6y3ow6W7nY8IpOM8WlqG+2UvpGk8r4GabQfKcGkpodR9HsVd
    7cL/9R4ayd5znMGMzFR/6ATu8j6CbHWA3RMCyVj+y+XuLANEW6tMBO1Eiu9hlik5vFkR
    GPI8oT0LODTI6NMYocy9jAcW9tqlqJbIsamBAkjFgkYmrFdhRF8KvGN3IiFJCvD8RNGr
    RcYtLxLN1nXsJqDSuUaCac+Wh0J646tdaPIEywDcuniaTda78uq77fBgoJwjcSnxZohn
    XNL5vCFQgIG+FnXCVHOdnsOqUAWgx2nNKxJcA5AtxC3Pr3yV+esMK7/hkFjR2v2Yag8v
    hYzg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 23/38] tools/guest: restore: move pfns array in populate_pfns
Date: Tue,  1 Jun 2021 18:11:03 +0200
Message-Id: <20210601161118.18986-24-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move populate_pfns' pfns array into preallocated space.
Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  |  1 +
 tools/libs/saverestore/restore.c | 11 +----------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 6ed213e14f..9de09ae64a 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -244,6 +244,7 @@ struct xc_sr_restore_arrays {
     int map_errs[MAX_BATCH_SIZE];
     /* populate_pfns */
     xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
+    xen_pfn_t pp_pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 2ab9f792ef..598a4aa06d 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -139,17 +139,10 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->restore.m->pp_mfns,
-        *pfns = malloc(count * sizeof(*pfns));
+        *pfns = ctx->restore.m->pp_pfns;
     unsigned int i, nr_pfns = 0;
     int rc = -1;
 
-    if ( !pfns )
-    {
-        ERROR("Failed to allocate %zu bytes for populating the physmap",
-              2 * count * sizeof(*mfns));
-        goto err;
-    }
-
     for ( i = 0; i < count; ++i )
     {
         if ( (!types ||
@@ -190,8 +183,6 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     rc = 0;
 
  err:
-    free(pfns);
-
     return rc;
 }
 

