Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0DF2EA697
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 09:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61762.108768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwhk3-0004uT-MM; Tue, 05 Jan 2021 08:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61762.108768; Tue, 05 Jan 2021 08:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwhk3-0004u4-J5; Tue, 05 Jan 2021 08:30:59 +0000
Received: by outflank-mailman (input) for mailman id 61762;
 Tue, 05 Jan 2021 08:30:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YjHi=GI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kwhk1-0004tz-KK
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 08:30:57 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0b362b5-42db-468b-a97c-c864d1d63fe6;
 Tue, 05 Jan 2021 08:30:56 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id z02ae7x058Uo2ky
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Jan 2021 09:30:50 +0100 (CET)
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
X-Inumbo-ID: c0b362b5-42db-468b-a97c-c864d1d63fe6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609835455;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=4Zl2E6ZxkRSC3IePmxmtSgf7VmMt0ue3jscdTmOJQ/g=;
	b=gk2yc0RCMnFCgw9a1MI8JoBBGf5yAp0Bduvd/wzMUoISBldAnDPHSa+1Q1tPjuS3aR
	KFTJxEnUkUn7yUU6JaHOCemm0a/oofZCgqJaZYMWsA+fFkPq+fvq94PqcAW1zFWYh0a8
	Z0wDVvnH7NBe1fYYwoNJ3Uif9eAq6xhGjNt4QXZ8nLeTDxetssAbHNjU/Q5+X6pI12k4
	Cc6KXOdxWkj5Trz/qGulNPvjJTqgt1mtOh56hnJSu2okqr/EJviGczR8rYgDTF36hgRv
	IMsmRBlk03LgfyKFGtgy78hUpmO6Kl8Uua5KMxgQNU+/qK/1dUXBufkJIsgHJt7+qZIN
	2atQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS321Mjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: handle more than 16T in precopy_stats
Date: Tue,  5 Jan 2021 09:30:48 +0100
Message-Id: <20210105083048.19568-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

total_written tracks the number of transferred dirty pages.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/xenguest.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index a9984dbea5..775cf34c04 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -438,7 +438,7 @@ struct xenevtchn_handle;
 struct precopy_stats
 {
     unsigned int iteration;
-    unsigned int total_written;
+    unsigned long total_written;
     long dirty_count; /* -1 if unknown */
 };
 

