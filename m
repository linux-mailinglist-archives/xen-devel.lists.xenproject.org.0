Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A23A9B20
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142954.263730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1h-0004pk-06; Wed, 16 Jun 2021 12:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142954.263730; Wed, 16 Jun 2021 12:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1g-0004hl-LD; Wed, 16 Jun 2021 12:52:12 +0000
Received: by outflank-mailman (input) for mailman id 142954;
 Wed, 16 Jun 2021 12:52:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1f-0006lZ-0a
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:11 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34cb16d1-5820-4808-abfe-5c8756b5df6d;
 Wed, 16 Jun 2021 12:51:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpctm2
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:38 +0200 (CEST)
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
X-Inumbo-ID: 34cb16d1-5820-4808-abfe-5c8756b5df6d
ARC-Seal: i=1; a=rsa-sha256; t=1623847899; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ks+H/9Lq48itLgjkf43MKm2w6YqTU5BIgnXYJ95Akrg3HFrIyzoYuFeJAD8DuBVYlW
    gk/LNSYNDIbE2Ms4+0hEnvUIUBDwg6dRVLN97pBqIFh2BSlA4O/3sSRLjl7xEq+YcVAO
    I7KZNsDnWzgH3didlsLqY+3Ze9NjmrXitsiVCBfk9I4/eBl9Zb1HRf8T4L+TiROYvdbk
    VBF5Ice1XM9iA/V+FQrGuBcrOAmAEOhNLwnxjm1rLcm5MdBK7eT1dIknANUQtNw1H0SN
    CrmljYo5r/LJbgNxRIBpFK2+ZihzvovaQnrrQQLVDZwUB1dTBLeO3NFhhfKA08otRFV3
    I63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847899;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=aebmW30p8aSy8ZbiG8FVV1BV3qJw8YQmzxiu0pIwFxU=;
    b=c/MaKwTpb25k2Ii/WPKi5bRa3dhl2xMCIc44Gpim9vNbWGOCL1TnR1es7KF0X/Grbb
    6cumaaxEYSHr3bzlDNYvGvn53Zvjt65NE+KW3PHVEAq3tqdtEpiKs1UE8f8svC8ysRJB
    Q+9BToDThANxVxIU9Whc3+4qSegFTLSWwJvHMDgr2QufxEYRpW0LN+ohxkwUfCf0iyJC
    Dc4v1UQOnoyUzSLkaxDSybfjpC6xRN/QfIKLhNrJPs8kQYMC8O26AYVAEv3I0I+vqTTs
    MGIO0LXhyLdBkUWOO5xDlPONpeEeBkxfJZjDxe9T1iywjcgkykwD8ax/5jYi+nLY6Pvq
    YU8g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847899;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=aebmW30p8aSy8ZbiG8FVV1BV3qJw8YQmzxiu0pIwFxU=;
    b=I0fK91BTFb+YLpjAxmw4SLrJF10jLgNtr2YzluulSr0rNp+lZvDkd/6A2v19c/5y3M
    iEHRslKvBIUfw94aXpnZfywrZay0EbLX04diucJ2ZaEmM+1WWNEREygAyyssI5Q4lHvi
    oDfXeE3reWqHLeN8tUJRam366HvfHempVythqpZWBQasaXmVfV8HfafGoR3aZqwXNVLT
    Cy35d9X3Ju3GDw44OzzAeanSobNQ5lgoJ7WuZhQsiw/remW0bS/Cuf+RpRJ/QsIoQLGy
    Ye2S3/J0nYPOP738PpZNlnvqcHBtcxlGAadMtUOAVEZ/R6ZgWbMDG9OX6hcy6ooiq6qf
    Jd5A==
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
Subject: [PATCH v20210616 12/36] tools: save: move mfns array
Date: Wed, 16 Jun 2021 14:51:05 +0200
Message-Id: <20210616125129.26563-13-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move mfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index b3941af537..6129710a3f 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -225,6 +225,8 @@ static inline int update_blob(struct xc_sr_blob *blob,
 
 struct sr_save_arrays {
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+    /* write_batch: Mfns of the batch pfns. */
+    xen_pfn_t mfns[MAX_BATCH_SIZE];
 };
 
 struct sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index e29b6e1d66..6b09784be8 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -88,7 +88,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = NULL, *types = NULL;
+    xen_pfn_t *mfns = ctx->save.m->mfns, *types = NULL;
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
     /* Types of the batch pfns. */
     types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
@@ -118,7 +116,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !types || !errors || !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -277,7 +275,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(guest_data);
     free(errors);
     free(types);
-    free(mfns);
 
     return rc;
 }

