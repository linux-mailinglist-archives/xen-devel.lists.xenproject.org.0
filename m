Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4D8ACC6D9
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004289.1383977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyK-0005tF-88; Tue, 03 Jun 2025 12:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004289.1383977; Tue, 03 Jun 2025 12:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyK-0005pk-2D; Tue, 03 Jun 2025 12:42:28 +0000
Received: by outflank-mailman (input) for mailman id 1004289;
 Tue, 03 Jun 2025 12:42:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyI-0005a1-Iw
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyI-000CGP-14;
 Tue, 03 Jun 2025 12:42:26 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyI-005di7-1Y;
 Tue, 03 Jun 2025 12:42:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=L2rim9EpWcyPqx+pQDGmf2dIc++S82aIcPIQL9cYoMU=; b=45OnV/V7RYa2Ka85Y0ga0LXkh7
	XOwtWfBU3Ec/xLRXAqm1WiIByU0XazsvW/SrqZSVnfl22VuBFdBPpj8u8LesRJmecwvc7BRPbpHzk
	o31iiQgshxcB1CiPsKX1jxUiEWhLqjlKbLamBoJncuLZHOpEba4dRO3fbDZYNPJ0iIeY=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN PATCH 2/9] tools/tests: Fix return value of test-rangeset
Date: Tue,  3 Jun 2025 14:42:15 +0200
Message-Id: <20250603124222.52057-3-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603124222.52057-1-anthony@xenproject.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Otherwise, failed tests are ignored by automated test.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/tests/rangeset/test-rangeset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tests/rangeset/test-rangeset.c b/tools/tests/rangeset/test-rangeset.c
index 8b580e14eb..c14a908b4f 100644
--- a/tools/tests/rangeset/test-rangeset.c
+++ b/tools/tests/rangeset/test-rangeset.c
@@ -215,7 +215,7 @@ int main(int argc, char **argv)
         }
     }
 
-    return 0;
+    return ret_code;
 }
 
 /*
-- 
Anthony PERARD


