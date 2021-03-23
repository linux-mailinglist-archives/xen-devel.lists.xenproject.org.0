Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325F13470AA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 06:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100779.192434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOvr2-0004rp-6D; Wed, 24 Mar 2021 05:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100779.192434; Wed, 24 Mar 2021 05:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOvr2-0004rQ-32; Wed, 24 Mar 2021 05:14:52 +0000
Received: by outflank-mailman (input) for mailman id 100779;
 Tue, 23 Mar 2021 17:59:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTlP=IV=gmail.com=raphning@srs-us1.protection.inumbo.net>)
 id 1lOlJW-0002Dg-A4
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 17:59:34 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95661f9e-e72b-4c47-b530-4d0390675ec9;
 Tue, 23 Mar 2021 17:59:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x16so21714640wrn.4
 for <xen-devel@lists.xenproject.org>; Tue, 23 Mar 2021 10:59:33 -0700 (PDT)
Received: from dev-dsk-raphning-1b-d5e87e14.eu-west-1.amazon.com
 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id m9sm24630278wro.52.2021.03.23.10.59.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:59:31 -0700 (PDT)
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
X-Inumbo-ID: 95661f9e-e72b-4c47-b530-4d0390675ec9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JiAIBdlJzU3WbmB8nM5G05jP8/i0kPnmw043q33S3I0=;
        b=qklN+aFv15AVifhtELEw7XX5bb1b0Hs7yowF5kna1iBgtL6D5pn51ExjWLv0XWCHfq
         1HZlMoVMuwkcLqc7lOSYmUa2QO3vcBiUtY2sotvVTOzSGrYjbjOGm5C2zclgCN3pxrzQ
         a8vZamoowV1d4hEiHovuq4iwrsluqr4PTkVopE4u+4WUqkUuMUDpb8y5Y+OLTuPh51Gi
         XbEJff68uIEruLYnNBrkK6g92QDrhIcMP2XBE7XsQAJUXLrhGUdd/mxfOmFN8bf/JYLT
         TtvWyDTJRQDcQnrf4+CzpNfIUx6UmalWJbCsYacJYaa8tYDAT8/0eMOISZMZ3WtFNz4n
         09nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JiAIBdlJzU3WbmB8nM5G05jP8/i0kPnmw043q33S3I0=;
        b=ukMXTOoz2IiBoWmn1XjjAkbJWosiYihm/g6K9ZuL3Ttx2DSWc1r+tsFe7SmHhhWTbW
         Ra6RehU+pdf9CLbMh+Q1YQAtXe8p0UVaOLPw7NZQT2jg6oMzW3PoIhMQty1BxkgUx1DQ
         w7HkNiqkZfvn+N1lkA9aog7EhN1PYR22E1jXCW+Ca2rRQfw2jlRTlbscZ8To7VywNFYa
         7KmZ4dIOADK9PcVKtndyar3AQD0XHl0F1WlKJoZ5YjD+tHabVvN0oC0kr7Ak+coj14T+
         kS0YGkZzLdwe8OlprLIIIIk9814jv8/TpKXWR4R40POeC0NV1VAatjdK1qB3Xe8x3p4V
         Nxgg==
X-Gm-Message-State: AOAM530lVg9wkhjhox0Epqc8cjOq/obHPU901CViv1EmfYAT65him4TB
	cQnXtT1OJ2Aix0SKeJFHDnQ=
X-Google-Smtp-Source: ABdhPJy0+Mr9W14qNSf16p3qsaSvY17KjJP2S4lO1TQReU1iubMygywYyJNvklXYbx5HUUEm0MawJA==
X-Received: by 2002:a05:6000:1868:: with SMTP id d8mr5261962wri.301.1616522372331;
        Tue, 23 Mar 2021 10:59:32 -0700 (PDT)
From: Raphael Ning <raphning@gmail.com>
To: Simon Horman <horms@verge.net.au>
Cc: kexec@lists.infradead.org,
	Raphael Ning <raphning@gmail.com>,
	Julien Grall <julien@xen.org>,
	Hongyan Xia <hx242@xen.org>,
	xen-devel@lists.xenproject.org,
	Raphael Ning <raphning@amazon.com>
Subject: [PATCH] kexec-xen: Use correct image type for Live Update
Date: Tue, 23 Mar 2021 17:59:23 +0000
Message-Id: <20210323175923.7342-1-raphning@gmail.com>
X-Mailer: git-send-email 2.23.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Raphael Ning <raphning@amazon.com>

Unlike xen_kexec_load(), xen_kexec_unload() and xen_kexec_status()
fail to distinguish between normal kexec and Xen Live Update image
types.

Fix that by introducing a new helper function that maps internal
flags to KEXEC_TYPE_*, and using it throughout kexec-xen.c.

Signed-off-by: Raphael Ning <raphning@amazon.com>
---
 kexec/kexec-xen.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/kexec/kexec-xen.c b/kexec/kexec-xen.c
index da514d052e3d..47da3da466f0 100644
--- a/kexec/kexec-xen.c
+++ b/kexec/kexec-xen.c
@@ -91,6 +91,17 @@ out:
 	return rc;
 }
 
+static uint8_t xen_get_kexec_type(unsigned long kexec_flags)
+{
+	if (kexec_flags & KEXEC_ON_CRASH)
+		return KEXEC_TYPE_CRASH;
+
+	if (kexec_flags & KEXEC_LIVE_UPDATE)
+		return KEXEC_TYPE_LIVE_UPDATE;
+
+	return KEXEC_TYPE_DEFAULT;
+}
+
 #define IDENTMAP_1MiB (1024 * 1024)
 
 int xen_kexec_load(struct kexec_info *info)
@@ -177,12 +188,7 @@ int xen_kexec_load(struct kexec_info *info)
 		seg++;
 	}
 
-	if (info->kexec_flags & KEXEC_ON_CRASH)
-		type = KEXEC_TYPE_CRASH;
-	else if (info->kexec_flags & KEXEC_LIVE_UPDATE )
-		type = KEXEC_TYPE_LIVE_UPDATE;
-	else
-		type = KEXEC_TYPE_DEFAULT;
+	type = xen_get_kexec_type(info->kexec_flags);
 
 	arch = (info->kexec_flags & KEXEC_ARCH_MASK) >> 16;
 #if defined(__i386__) || defined(__x86_64__)
@@ -211,8 +217,7 @@ int xen_kexec_unload(uint64_t kexec_flags)
 	if (!xch)
 		return -1;
 
-	type = (kexec_flags & KEXEC_ON_CRASH) ? KEXEC_TYPE_CRASH
-		: KEXEC_TYPE_DEFAULT;
+	type = xen_get_kexec_type(kexec_flags);
 
 	ret = xc_kexec_unload(xch, type);
 
@@ -232,7 +237,7 @@ int xen_kexec_status(uint64_t kexec_flags)
 	if (!xch)
 		return -1;
 
-	type = (kexec_flags & KEXEC_ON_CRASH) ? KEXEC_TYPE_CRASH : KEXEC_TYPE_DEFAULT;
+	type = xen_get_kexec_type(kexec_flags);
 
 	ret = xc_kexec_status(xch, type);
 
-- 
2.23.3


