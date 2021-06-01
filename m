Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B03977C1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135032.251254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71Y-000331-Sv; Tue, 01 Jun 2021 16:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135032.251254; Tue, 01 Jun 2021 16:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71Y-000301-OZ; Tue, 01 Jun 2021 16:13:48 +0000
Received: by outflank-mailman (input) for mailman id 135032;
 Tue, 01 Jun 2021 16:13:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70B-0005Ec-2Z
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:23 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c93f827c-c556-4e0e-b6de-2562934ba459;
 Tue, 01 Jun 2021 16:11:37 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBX1BN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:33 +0200 (CEST)
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
X-Inumbo-ID: c93f827c-c556-4e0e-b6de-2562934ba459
ARC-Seal: i=1; a=rsa-sha256; t=1622563893; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NpnnLGqmKCVUQlrMkSAxwv++mpIPTiUMxYC7kJiZVaiJDEP3oT0dtrLAAfd6l4x6di
    yhfyFRysyH77HR5I0ndRZx0KCYWp97MSEzSl9OAfgCmU9NPbORVZjFWam4ePPSCdKhFx
    1KMKXhhrwK7yKcCIhdpn+qLGk01i9XzX5ItSczWj9VgOXGCeJknJMnKcwXpj0mZBj0Dq
    nj14BTT61TUgHER1aApkp/8UiOo7fyxDmn6hT3gW9YiRSmAMWIqtbFSfTmul/OlvszJE
    iZuSRbNLn3SRQVOWTrfIVF4TgylKQonKfsc24dk/Hmgcn0wKqpWu5ervz5Btb6CFYzfL
    4/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563893;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yMk7eA+P/3dbcIUts8vVxsnRdZMI0VGT4aHfrLA5Vm0=;
    b=pFtNbtmH4REr819pBxs6SzUv+AU/vAJ+tuUsrKPOlVkHmxuV7cwde7Lpc42PrRuqQF
    hIN/J18CK8/eQ5TyFS5VmoD/R8Si2F15MZJlH882EI+jHL2ZlpcSIYN8NjZwr65ra25l
    Hehz17AlrVFORkZC5fszCCMlOvgttk3SfMXbCjqBvUXO7tDpyx1iITXjXFqvqizxwJQt
    ZNSG9vuK3zmOWZ6Kgy6uPwD99y+8Wcsbp8V+2ea+MDTHjTkyHNtbGar3pyM4l1VfhEN/
    f2dAV845M6Wwtd5k/knWona6J7AbiKmZl/djct1nIDlTYwLlKb4GSz9tS2Yr5Sy+3i9N
    sW6A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563893;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yMk7eA+P/3dbcIUts8vVxsnRdZMI0VGT4aHfrLA5Vm0=;
    b=ippzeAWbK2faCr3B2s6o05Bzhj8iWFbH8CU8ygiVTZFHevXTYqUJ/AEMROc72AB1hw
    lpgjaCdv0xJBRhrq7w020hzQRQ4NzJzsWKrePNmC52lwIlwTAb+9/Q4kcbY7T1rWsWyH
    uj/2T8xgi28RAm1UkNYKFCGsd47G45abVj8SoISCVbqxwBTBKLeILro5U/7TGl8RykhA
    mmaPWYes2Vby3pSibNYcjBOl66BwjJ3CCBFtsXuBIfyNpPEw6iRsQkHtjaBy61GWLtSv
    7nB1XEB6WmHY69KFTvSfsFsrdQuwAq+QOqXX60+vnSFaNkuUPBS4doabOZ9QxE96BRad
    BgEQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 18/38] tools/guest: restore: move pfns array
Date: Tue,  1 Jun 2021 18:10:58 +0200
Message-Id: <20210601161118.18986-19-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move pfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  | 2 ++
 tools/libs/saverestore/restore.c | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 0e03b0731c..be6f98af7f 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -236,6 +236,8 @@ struct xc_sr_save_arrays {
 };
 
 struct xc_sr_restore_arrays {
+    /* handle_page_data */
+    xen_pfn_t pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index a6cf9ee41c..4d8ee19adf 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -315,7 +315,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     unsigned int i, pages_of_data = 0;
     int rc = -1;
 
-    xen_pfn_t *pfns = NULL, pfn;
+    xen_pfn_t *pfns = ctx->restore.m->pfns, pfn;
     uint32_t *types = NULL, type;
 
     /*
@@ -363,9 +363,8 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    pfns = malloc(pages->count * sizeof(*pfns));
     types = malloc(pages->count * sizeof(*types));
-    if ( !pfns || !types )
+    if ( !types )
     {
         ERROR("Unable to allocate enough memory for %u pfns",
               pages->count);
@@ -412,7 +411,6 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
                            &pages->pfn[pages->count]);
  err:
     free(types);
-    free(pfns);
 
     return rc;
 }

