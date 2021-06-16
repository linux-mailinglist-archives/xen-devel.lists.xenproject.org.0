Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B273A9B19
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142943.263657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1Q-0001Ak-Oi; Wed, 16 Jun 2021 12:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142943.263657; Wed, 16 Jun 2021 12:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1Q-000166-He; Wed, 16 Jun 2021 12:51:56 +0000
Received: by outflank-mailman (input) for mailman id 142943;
 Wed, 16 Jun 2021 12:51:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1P-00075D-7R
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:51:55 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.103])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e9aa579-d54f-4978-9ff7-95a20453cfd6;
 Wed, 16 Jun 2021 12:51:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpftm8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:41 +0200 (CEST)
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
X-Inumbo-ID: 4e9aa579-d54f-4978-9ff7-95a20453cfd6
ARC-Seal: i=1; a=rsa-sha256; t=1623847901; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qCP7K0VPh2lHPt79phYQtfJ3EltvJWbyp0vzsiw+Fw+2qvCl8ffjTn5xcfLXt0xc1D
    QQa6oMySIG0UkhNDF/8UaRvKrzz/l3SOuJDrg1VnJRQc81kiazRCt7W4FdQdIFW062m7
    gWsqAHy7u5fy4HE4VJR/H3XYBkztAOBUtgcih/DXoe5KazWq+CDGvEPUMYn8/FiR9JEX
    KmarUltqJQJXmxsu27htAqEMsmIDhWZJzo34EmYkZyxI4l22B0w4kWszBiPLbqENv6mZ
    SGRNDG/mxdQDVizfJWYLYAYVU4Luvd0qFnkS7sEh1eMEPTplU1OvwjGyiM3Ns5YdV545
    xwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847901;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=1Q2pJ96Q87Yp6O1o39i2QtRnldFx2Zb75m3igVfGdxc=;
    b=k4gvs2RDpyNND1f4GpB6oSepQQYDcTFhqb2RBKuk6bOCbCRTnyYsgOUhLEGNsQ6AwI
    SqQoXzr/oGmQUw6qps4VpbuuO4rCldWmBmGgLjucP0RA2p4GFSKqK9FiNRevnqzIQ7M1
    iHRygBWy+Q/kBtb0FStU36HO4kFotnlDFvJZi7455wKEPECB4n1YDKt2289j71VLFVLv
    DeqZAN7JlUk85Ld/ctIF0AA1sXdKw5Yi0muUGIqwOZqg8KJfSGQfRMn/yVHWNUcFIfC4
    lUw3yd9Gbpr2Nq+zJIx5jMlskDcod/4Qd3bpP6TNp+uqN3Dwtna3DSkIemOzR67iog4s
    2JKg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847901;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=1Q2pJ96Q87Yp6O1o39i2QtRnldFx2Zb75m3igVfGdxc=;
    b=QKkWE1Bzcmtf0jW7m9uSoGmmmOUeB8TXyU+CG6V7YfLCe5aRu7G2qU8FSbOr/RS+VL
    g5AcZrl6G7mBr13qHK1wNdPaB65vIkj18GJo8T5lA9f7/KKIMymaFDxMmpDEgFLJvGuO
    wUi1HTcaKS6pfaIvYISq4d+gi2yc+XyZW7zeAn8SPTYvbfCKljlhHh/fetlqc/C5tDCP
    8V30LgxIVgKukdE9UygjrTG2nRQPuIDSqjzF8ak4mz0TRUFGYzJKFOx38EjzBBdjAHQR
    DwomF2T4j1F0ehToUyHRYinv0J8JAEfs/lDfihm2A1LDt/MZIT15ysSngVk0AVTIsTZM
    P/Qw==
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
Subject: [PATCH v20210616 17/36] tools: save: move guest_data array
Date: Wed, 16 Jun 2021 14:51:10 +0200
Message-Id: <20210616125129.26563-18-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move guest_data array into preallocated space.

Because this was allocated with calloc:
Adjust the loop to clear unused entries as needed.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h |  2 ++
 tools/libs/saverestore/save.c   | 11 ++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 2950947f1d..c4ab843c77 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -235,6 +235,8 @@ struct sr_save_arrays {
     struct iovec iov[MAX_BATCH_SIZE + 4];
     /* write_batch */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
+    /* write_batch: Pointers to page data to send. Mapped gfns or local allocations. */
+    void *guest_data[MAX_BATCH_SIZE];
 };
 
 struct sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 0f02988ff9..ea04cb1a74 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -90,7 +90,7 @@ static int write_batch(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->save.m->mfns, *types = ctx->save.m->types;
     void *guest_mapping = NULL;
-    void **guest_data = NULL;
+    void **guest_data = ctx->save.m->guest_data;
     void **local_pages = NULL;
     int *errors = ctx->save.m->errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
@@ -105,12 +105,10 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
 
-    if ( !guest_data || !local_pages )
+    if ( !local_pages )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -166,7 +164,10 @@ static int write_batch(struct xc_sr_context *ctx)
         for ( i = 0, p = 0; i < nr_pfns; ++i )
         {
             if ( page_type_has_stream_data(types[i]) == false )
+            {
+                guest_data[i] = NULL;
                 continue;
+            }
 
             if ( errors[p] )
             {
@@ -183,6 +184,7 @@ static int write_batch(struct xc_sr_context *ctx)
 
             if ( rc )
             {
+                guest_data[i] = NULL;
                 if ( rc == -1 && errno == EAGAIN )
                 {
                     set_bit(ctx->save.m->batch_pfns[i], ctx->save.deferred_pages);
@@ -256,7 +258,6 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; local_pages && i < nr_pfns; ++i )
         free(local_pages[i]);
     free(local_pages);
-    free(guest_data);
 
     return rc;
 }

