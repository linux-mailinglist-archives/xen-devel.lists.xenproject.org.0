Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A321E3C762B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155559.287300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mo9-0002PI-Fv; Tue, 13 Jul 2021 18:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155559.287300; Tue, 13 Jul 2021 18:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mo9-0002JA-4R; Tue, 13 Jul 2021 18:07:01 +0000
Received: by outflank-mailman (input) for mailman id 155559;
 Tue, 13 Jul 2021 18:06:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mo7-0002UL-H7
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:59 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 045a64bf-ada9-407e-9b5b-9982c9b9430b;
 Tue, 13 Jul 2021 18:06:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6LtB5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:21 +0200 (CEST)
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
X-Inumbo-ID: 045a64bf-ada9-407e-9b5b-9982c9b9430b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199581;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=0LMXyjqr5dhJU6Kt86LbarPPbfCTtmro+NAOq1cH7Ts=;
    b=NbJSr7qRx5y1Mp3a4m25zYbTv6HLGzbHHCVKMN+Gg8MyFXyxcPyht+QXzJ/+z5T6zU
    Bb8DfaI6GiJI5/jS/wALXD20j2+0sW1hozlazEnDKC+tJnXSWu60yOx9nAfDgI7v6TDX
    pdbbtJwg/s1xY8Hoj467EEDmaO+Q73184qCKLKrdRo/FK+axgcjLLQRYuiR0xp8noVzt
    j0vxOn3RAGxzg9QiTI2F7BLA5TAT5FcNwHoHfiGq2xZjVJ65/8fsuQpEnNS3sVLKPPqi
    8br5s2ILbnfAY5Mv1KpQ+D/xW6fDIChi+WE646SoQluHjj6s3yFXDQU3EDsmrWY1bOZ9
    M34w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210713 23/31] tools: recognize LIBXL_API_VERSION for 4.16
Date: Tue, 13 Jul 2021 20:05:57 +0200
Message-Id: <20210713180605.12096-24-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
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

