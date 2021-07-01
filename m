Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362A3B901D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148351.274234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRT-0007bS-MU; Thu, 01 Jul 2021 09:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148351.274234; Thu, 01 Jul 2021 09:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRT-0007ZV-EI; Thu, 01 Jul 2021 09:57:07 +0000
Received: by outflank-mailman (input) for mailman id 148351;
 Thu, 01 Jul 2021 09:57:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRR-0004XT-S0
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:05 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.170])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0941045a-39ea-4084-bd5e-22ff734b2a6c;
 Thu, 01 Jul 2021 09:56:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ui5Ms
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
X-Inumbo-ID: 0941045a-39ea-4084-bd5e-22ff734b2a6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133404;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ex4r4d11Mg1k2Zn9qFLItgRI9LdfJn43Y1sVEepvWiU=;
    b=MINrfXc5iyKU6L0b0y1toSzNvOC3EMNFBf2mAqFKmcHh5kEPrAhRw/niCitYKxPoD3
    AowdVRraJeFi3mHit3amy7y4SjQAE+dxJG4R3Nq/bPV+R8iXK8btER1ImH6EO9Bqpkkq
    U1AgaOznJ0o9KcNiU6NNBxp6wu5AcYQoAYCTooDiCKF7U572lWW117vDDYNKpcYQay6h
    fOVZS8/EYQ1ggUZDguUR8z3Ap0/M80632/OnVF4Jw81Uy6Dh22jVKkh+KhGZjXAEJlZI
    tTk33dwwugQ4fd9FTNsqK3od7UFonplaU7wAzYOBL9QzoK3RBWRc6z/L8nqKUco8XBCd
    KzBA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210701 11/40] tools: use sr_is_known_page_type
Date: Thu,  1 Jul 2021 11:56:06 +0200
Message-Id: <20210701095635.15648-12-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify pfn type on sending side, also verify incoming batch of pfns.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>

v02:
- use sr_is_known_page_type instead of xc_is_known_page_type
---
 tools/libs/saverestore/restore.c | 3 +--
 tools/libs/saverestore/save.c    | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index be259a1c6b..324b9050e2 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -406,8 +406,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         }
 
         type = (pages->pfn[i] & PAGE_DATA_TYPE_MASK) >> 32;
-        if ( ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) >= 5) &&
-             ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) <= 8) )
+        if ( sr_is_known_page_type(type) == false )
         {
             ERROR("Invalid type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
                   type, pfn, i);
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index ae3e8797d0..6f820ea432 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -147,6 +147,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
+        if ( sr_is_known_page_type(types[i]) == false )
+        {
+            ERROR("Wrong type %#"PRIpfn" for pfn %#"PRIpfn, types[i], mfns[i]);
+            goto err;
+        }
+
         switch ( types[i] )
         {
         case XEN_DOMCTL_PFINFO_BROKEN:

