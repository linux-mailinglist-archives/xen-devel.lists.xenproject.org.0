Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C913977B0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135007.251175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo704-0005G0-W3; Tue, 01 Jun 2021 16:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135007.251175; Tue, 01 Jun 2021 16:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo704-00052v-MC; Tue, 01 Jun 2021 16:12:16 +0000
Received: by outflank-mailman (input) for mailman id 135007;
 Tue, 01 Jun 2021 16:12:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo702-0005X1-0H
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:14 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.103])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ea60976-470e-41f2-a4d4-de729ddb777a;
 Tue, 01 Jun 2021 16:11:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBb1BW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:37 +0200 (CEST)
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
X-Inumbo-ID: 9ea60976-470e-41f2-a4d4-de729ddb777a
ARC-Seal: i=1; a=rsa-sha256; t=1622563897; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DceQnoMD1LPxJK7nDDoI5jY7qyrJO2b8pj9TXL3fxAY8NxT/G8fHE1LT7IyYYEUgsk
    VC2V36pU/F/9Uu7l/TmVZxOy1inNDMA/+R6ewt/qsmeC2fHkp+rIKrcEItQ1iFVmWhc3
    0iG6DTYDmR0dAvQua+fBjIQ3TfjNi2StaB/clALrkHKoHltA84Nqa7Rtso+UMaDDbFpK
    LoPcnwCPDXbaJFV3H/flgac9SE/CtOTTViWNLD3lwgQXjE7//B/mHqc2dd4XZJVpC5z4
    DnhGlj00Hxzs2qKPPyUJBiF2newFmudvMsY0l1LGqvAeYU4rfZEGdSfHErp+bdm8uMuQ
    15/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563897;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=0LMXyjqr5dhJU6Kt86LbarPPbfCTtmro+NAOq1cH7Ts=;
    b=MxhvzI3nXOCmBeAiRJFUchsTY/iiFWK16afmVmO7QesHmwQsU/ZIum/e4kJxpkINwb
    DC2yJT/j4a7ebhe0H3SdWCI8BR1/pfzoH2YgHWKXGYSbwAmzSE41S0cH1CjToAu4mjNl
    J0jzndpOI2m9J1AIZ/C17acSy/0DIUf/vHWC/ouT7If9g/tw0CFiUhCZFJtLhJUnUA3W
    s9N0eYzO8/sClRLqA+zFrpPoR/YVmWRU/FSM5CT3blvk3GedmOYavbHM6XoDULwBqrTF
    EjUwV+ejaa7rM2+J9SrBAl5U3OvqzxPzQS73GduI0vOOT9GcMpw8d63gqK/BS7AROldV
    2umQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563897;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=0LMXyjqr5dhJU6Kt86LbarPPbfCTtmro+NAOq1cH7Ts=;
    b=a3XGOIo9gK0sthRo1QW/ge3Lkbka6xS371SdjVtTG/iXT5nFIlwa7ngxBPwuIPAr3C
    L64Vvat9i1dmTDh1iEVYeDmuHVXnSkbiIiKGPChYjogOQug5W4x4lc6QXUX2XKZiwfX+
    6JUCJM2cSA8y0xDAzqKajAnh5WpmMJ+XyglmRTpyi8N0ytP8b8PJ+OYlz4SCxgypjTTs
    Fi47XB9TJ2M8js49koTSW4cYbjafFJl/itk5QIHxRfl94FgN2AOhU4v/bRkZmvEWY0Gj
    tjE0HNGOPC4mkzS5VegXe8nbhJuTH0Yc0THPtZe2SGRxYdqZ2kwPYeww6lFrBNGZF7E3
    IfVQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 27/38] tools: recognize LIBXL_API_VERSION for 4.16
Date: Tue,  1 Jun 2021 18:11:07 +0200
Message-Id: <20210601161118.18986-28-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
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

