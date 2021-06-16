Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A783A9B13
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142939.263630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1I-0008JC-J3; Wed, 16 Jun 2021 12:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142939.263630; Wed, 16 Jun 2021 12:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1I-0008BS-99; Wed, 16 Jun 2021 12:51:48 +0000
Received: by outflank-mailman (input) for mailman id 142939;
 Wed, 16 Jun 2021 12:51:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1G-00075D-58
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:51:46 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f18633fe-d4db-43d5-bfab-8fd491179c21;
 Wed, 16 Jun 2021 12:51:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpdtm3
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:39 +0200 (CEST)
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
X-Inumbo-ID: f18633fe-d4db-43d5-bfab-8fd491179c21
ARC-Seal: i=1; a=rsa-sha256; t=1623847899; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=V9RtZbf8C1wCglPYTnqfkxIgmvIai9m1C0WragE6L8TdkzfjYumF7NNu+mG+JUHAk4
    QXWqeR2xquVh1uVG/VkbLL2j4nGs57IJ1xwFck5cvPZbKkNO0QvysEfAyIgbwT3l9Y4Z
    dJZPv4YXeDdDdhJhRIHptkE/HTeegGIfOaSX+wzIjdesa1YWoFjY+3GheapIdaOJJZL0
    d0Iq+se2UH0Br2RQBI73EsqjeK8WZJGg/sLxcpXGZBYND2PjovgbaIyL8nFcuIU3myOG
    J/Awj6LCZq5uCLxRdR/PEN+JTAa+MT6t3ZVSe1K7m30vtb4Dd6s2mK+qxTTEHLLFWtsX
    FDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847899;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6QhLsTHKnGLq8ej3+19WMGRz5FDjlHYnvJVyc5tVB4g=;
    b=h0z+eiF/8OC+LqIJRm8ILXtBw7ot3Z8f+f6U6rVifrn5AlWSjCOFCLemkoRi+37BfG
    698ydSzAHVBHMHx5PWd4EPzAmexuuhyA+6ED2c/HXOIhgSjGOmGmxFWwvhP8eZ/DbLyH
    BKoVPTcOLU5gDwVUnLjWmnognqBp8a3e7Ds7JRd9laVwwlrTR4xpaMFO8YixXK9tEVX/
    wXskzK7shBvG+54OXBGB3+85HBLpuJUvd4qTgpZRh0spnhDHbqDNLhnrTAaLZBRzeKRA
    xZzYc5GwZGdJW/c7Lri9BW/FWfzNBiPG/x7dy5ALMmS4yRC+GpqATtYl3FtaCn0LuiOE
    qsBQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847899;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6QhLsTHKnGLq8ej3+19WMGRz5FDjlHYnvJVyc5tVB4g=;
    b=olx76e+wLmQTdJGVtYcWr7CZ+zPZc2Px6jO/FrjyPpGQpK3OA4lw2zvWycFRaokYNK
    3yeJKYqQj6FvNf/EQRtio/ooBjYBBvvwDpVrdp4oUc5uxMaIwbPpUakOmLR90585EF2Y
    CNIWA29se7WZKhW1tkj63t87JZiGLqWBQm9H9w3/d7h9PqF9IPvNPruSI32xXxqlVpLS
    ZoymyoBb/ZqTWzGG+F6zsZPsL07md2yjbkxiCkiSTDKYWIUzHG1PwYsmb9ju3gmkeyk8
    fDNJDQ0YVSqpicsIz70bRRhtDhju+GxQHXSGySp05PoULlFDcZfghtcSP5sCmFUenNPl
    oTcw==
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
Subject: [PATCH v20210616 13/36] tools: save: move types array
Date: Wed, 16 Jun 2021 14:51:06 +0200
Message-Id: <20210616125129.26563-14-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move types array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 6129710a3f..1df684acb9 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -227,6 +227,8 @@ struct sr_save_arrays {
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
     /* write_batch: Mfns of the batch pfns. */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
+    /* write_batch: Types of the batch pfns. */
+    xen_pfn_t types[MAX_BATCH_SIZE];
 };
 
 struct sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 6b09784be8..0883c1fac0 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -88,7 +88,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = ctx->save.m->mfns, *types = NULL;
+    xen_pfn_t *mfns = ctx->save.m->mfns, *types = ctx->save.m->types;
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Types of the batch pfns. */
-    types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
     errors = malloc(nr_pfns * sizeof(*errors));
     /* Pointers to page data to send.  Mapped gfns or local allocations. */
@@ -116,7 +114,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !errors || !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -274,7 +272,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(local_pages);
     free(guest_data);
     free(errors);
-    free(types);
 
     return rc;
 }

