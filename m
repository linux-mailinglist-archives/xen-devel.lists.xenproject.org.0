Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22143B9029
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148372.274354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRu-00054r-JB; Thu, 01 Jul 2021 09:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148372.274354; Thu, 01 Jul 2021 09:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRu-0004vX-C7; Thu, 01 Jul 2021 09:57:34 +0000
Received: by outflank-mailman (input) for mailman id 148372;
 Thu, 01 Jul 2021 09:57:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRs-0004r4-Gv
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:32 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.174])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 939893d0-0ec4-4a0f-851d-a8ce2ba947db;
 Thu, 01 Jul 2021 09:56:58 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ur5NU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:53 +0200 (CEST)
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
X-Inumbo-ID: 939893d0-0ec4-4a0f-851d-a8ce2ba947db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133413;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=0LMXyjqr5dhJU6Kt86LbarPPbfCTtmro+NAOq1cH7Ts=;
    b=seFXjeMiXQjNm4nJiNtEFRc+qmrE0unG8gUnEIVDqgAeVpEvsTsvGZSg4/4ql9gK8g
    cdFrWui1BKKNZGYpm40Ag3p60mxyBCejkMlVaK/sVCdOsCK8dMAG2+mHagXV4SI3yqh8
    UZsS1DtArQncExBuQWRlMmpBc4oCSmmIDhlT3Fza8Zwpv1GYEXZU7ZuOnyhGYOA3etGI
    CIg6Y/lHH3UpqRrT45x+1nI6IFWL4RGo4yxOVk0/gvPL+lFDJyOoKwRIK9lUyFiHj9Cn
    ruKBzH319FojoxPzWwdJxefYUWRPoursepKTRW6/ePrJizBiGdusb6Y7I+DtbZeC45zA
    2yNA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210701 31/40] tools: recognize LIBXL_API_VERSION for 4.16
Date: Thu,  1 Jul 2021 11:56:26 +0200
Message-Id: <20210701095635.15648-32-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required by upcoming API changes.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/libxl.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ae7fe27c1f..29931626a2 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -729,7 +729,8 @@ typedef struct libxl__ctx libxl_ctx;
 #if LIBXL_API_VERSION != 0x040200 && LIBXL_API_VERSION != 0x040300 && \
     LIBXL_API_VERSION != 0x040400 && LIBXL_API_VERSION != 0x040500 && \
     LIBXL_API_VERSION != 0x040700 && LIBXL_API_VERSION != 0x040800 && \
-    LIBXL_API_VERSION != 0x041300 && LIBXL_API_VERSION != 0x041400
+    LIBXL_API_VERSION != 0x041300 && LIBXL_API_VERSION != 0x041400 && \
+    LIBXL_API_VERSION != 0x041600
 #error Unknown LIBXL_API_VERSION
 #endif
 #endif

