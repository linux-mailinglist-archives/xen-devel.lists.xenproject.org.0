Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D08C29F2EE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14438.35768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbZ-0004QI-Gk; Thu, 29 Oct 2020 17:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14438.35768; Thu, 29 Oct 2020 17:20:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbZ-0004Ol-3O; Thu, 29 Oct 2020 17:20:53 +0000
Received: by outflank-mailman (input) for mailman id 14438;
 Thu, 29 Oct 2020 17:20:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbX-0003MC-M4
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:51 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.170])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c87f4a73-4a17-4d15-a0fc-66c914d8e5f4;
 Thu, 29 Oct 2020 17:20:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKE3fM
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:14 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbX-0003MC-M4
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:51 +0000
X-Inumbo-ID: c87f4a73-4a17-4d15-a0fc-66c914d8e5f4
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.170])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c87f4a73-4a17-4d15-a0fc-66c914d8e5f4;
	Thu, 29 Oct 2020 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992020;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=8HnEje+bi5L28ovh7GxYhMDV/iYGgk+hVnPKuTzQjbY=;
	b=Tz1p1IUBUd9B3S95popNAy44u2KWyhewJA6OQIaykQVWTfzCZMJK8k9C/YiGeJgmR8
	OPtpyy/H7A4kri4DKD/vQScMHpg75ec9ogZuVmsPz95l1LNBhkgBiA32wun1zylBdKrN
	1P504CQ3SdNpTjjqh4g8hE9i/FFhAKDTBJRMrII+g3FaNmOLR0rZJ9FF/b2PyC1yTRV9
	eoY4RLgSubMDPHbh5iiAWlruR4yuyz4Giz/0p/U4bpxnKdPQtaEDi78kJ3+FFePEhyxi
	RLd3Z1Fdp/P/ElRsqB3vHP2nqyFmbMa1BHF6hpCMl0EbywMUhgIS41+L8X9Taemqu8KW
	mVNQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKE3fM
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:14 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 15/23] tools/guest: restore: move pfns array
Date: Thu, 29 Oct 2020 18:19:55 +0100
Message-Id: <20201029172004.17219-16-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move pfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  | 2 ++
 tools/libs/guest/xg_sr_restore.c | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 2a020fef5c..516d9b9fb5 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -224,6 +224,8 @@ struct xc_sr_save_arrays {
 };
 
 struct xc_sr_restore_arrays {
+    /* handle_page_data */
+    xen_pfn_t pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 4a9ece9681..7d1447e86c 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
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

