Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC01229F301
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14495.35843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBeX-0005pS-PP; Thu, 29 Oct 2020 17:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14495.35843; Thu, 29 Oct 2020 17:23:57 +0000
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
	id 1kYBeX-0005p1-MA; Thu, 29 Oct 2020 17:23:57 +0000
Received: by outflank-mailman (input) for mailman id 14495;
 Thu, 29 Oct 2020 17:23:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbm-0003MC-Mt
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:21:06 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6679421a-6802-44fa-a291-31bfe98f6a5f;
 Thu, 29 Oct 2020 17:20:22 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKG3fR
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:16 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbm-0003MC-Mt
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:21:06 +0000
X-Inumbo-ID: 6679421a-6802-44fa-a291-31bfe98f6a5f
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6679421a-6802-44fa-a291-31bfe98f6a5f;
	Thu, 29 Oct 2020 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992021;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=fJgEN/Sdwhd/b4yPCS/UDhsI4V1GTM00uHRSqwAWm0w=;
	b=IjVk1PEgemRk3g/+LcWdQ9aonZPORdQ2b+s2uZPEM6Hx2TOAe2MuO7Ep+0wSbYj4Km
	pXjg8y/C7hpw78RY1DYFwKOPZDEdpt6IflhlkLyq/qxx9GcF8YKDoRpWzbaFIlgLV8qM
	4+oS9o6+fa7jxZ6IISDEYeBxeFt2tRHHg1/QTXgdpb6yeD5F4cgebDuzponeBSefrjDN
	rlgNz31WfZ4+fhIWxuT6vkGNkGXAzBA49rYadTHwTG49fmp9QRPnuAhaI2MlmoBSqnL4
	ODCYnoMyOLmInMCnUIzzuijTGPS9ph5l8H33XIJ7n6CG3yNnCMIYO0TCe1dxLJIK9FvP
	B0Yg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKG3fR
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:16 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 19/23] tools/guest: restore: move mfns array in populate_pfns
Date: Thu, 29 Oct 2020 18:19:59 +0100
Message-Id: <20201029172004.17219-20-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move populate_pfns mfns array into preallocated space.
Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  | 2 ++
 tools/libs/guest/xg_sr_restore.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index eba3a49877..96a77b5969 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -230,6 +230,8 @@ struct xc_sr_restore_arrays {
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     int map_errs[MAX_BATCH_SIZE];
+    /* populate_pfns */
+    xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 94c329032f..85a32aaed2 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
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

