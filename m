Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADE82F1D0E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65236.115642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Kg-00071g-QI; Mon, 11 Jan 2021 17:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65236.115642; Mon, 11 Jan 2021 17:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Kg-00070j-KC; Mon, 11 Jan 2021 17:50:22 +0000
Received: by outflank-mailman (input) for mailman id 65236;
 Mon, 11 Jan 2021 17:50:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1ER-0002a6-1v
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:55 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9070af57-470a-4aaa-9972-6c4c279e8dde;
 Mon, 11 Jan 2021 17:42:47 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgfM3n
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:41 +0100 (CET)
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
X-Inumbo-ID: 9070af57-470a-4aaa-9972-6c4c279e8dde
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386966;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=ZrY4F+Z97DodR8ZLFHxXYd7a5LOYfYJV0zQQMQgam+k=;
	b=jeJ3sTepot6doln+gv5yTEI0J0AcpdLw2vIp9p6uo6uftzMKW6TaSQfxCHi+6g0pM8
	dV/7wAoCg7IYFiWjVRentxNMDeXb1JpDat4FrPSvhBBDEtn4Er5BPzJIn2/owo8ESuF2
	K78U4OGMJCYCewOkUdL8W1nBGtZA/W8A6we9pTBDTt2VIqdDOTdfyeBGTf4wEatc1aLE
	oh2sddCGwTWkVzGhA/gp7qyoTDaWxc+eAJmJMM8u8EdVRIoC/mmHmF94Nz5BNWcpCyE2
	98PTt0F8LMe8vSiacTOIEgVIRmRDsX7kss4NYDE9L6vSSoHwCDcuYiBgVjk5qzhx31fb
	l3Iw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210111 33/39] tools: recognize LIBXL_API_VERSION for 4.15
Date: Mon, 11 Jan 2021 18:42:18 +0100
Message-Id: <20210111174224.24714-34-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required by upcoming API changes.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/libxl.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 3433c950f9..6546dcd819 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -690,7 +690,8 @@ typedef struct libxl__ctx libxl_ctx;
 #if LIBXL_API_VERSION != 0x040200 && LIBXL_API_VERSION != 0x040300 && \
     LIBXL_API_VERSION != 0x040400 && LIBXL_API_VERSION != 0x040500 && \
     LIBXL_API_VERSION != 0x040700 && LIBXL_API_VERSION != 0x040800 && \
-    LIBXL_API_VERSION != 0x041300 && LIBXL_API_VERSION != 0x041400
+    LIBXL_API_VERSION != 0x041300 && LIBXL_API_VERSION != 0x041400 && \
+    LIBXL_API_VERSION != 0x041500
 #error Unknown LIBXL_API_VERSION
 #endif
 #endif

