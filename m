Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083BFACC6D1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004292.1384012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyN-0006mq-VB; Tue, 03 Jun 2025 12:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004292.1384012; Tue, 03 Jun 2025 12:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyN-0006jB-OF; Tue, 03 Jun 2025 12:42:31 +0000
Received: by outflank-mailman (input) for mailman id 1004292;
 Tue, 03 Jun 2025 12:42:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyL-0006Pb-PY
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyL-000CGt-1p;
 Tue, 03 Jun 2025 12:42:29 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyL-005di7-2V;
 Tue, 03 Jun 2025 12:42:29 +0000
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
	bh=edUAqQTo7e+ICLWUgXscm8y7F2IcKiWAIoO6Hnv56ew=; b=XPu7i2TPH6u1UNZmhKmFtlG/nO
	cdMXUwAyFv1dKUwVITa12G+T6A/F+Dop/vUkRy1hiygWWqe99Gt6Kqriet8Lci9YyUElatf8qpDpL
	Lz/V53RpurWNXvV4+h/XOHlSEeSQQEhun+/yQgwzPrsVpKU4phE1Mdmmdkrj8fYZael4=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 5/9] CI: Have the gitlab job fail on tools/tests failure
Date: Tue,  3 Jun 2025 14:42:18 +0200
Message-Id: <20250603124222.52057-6-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603124222.52057-1-anthony@xenproject.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

We can't rely on an exit value from `run-tools-tests` since we only
have the console output. `console.exp` only look for success or it
times out. We could parse the console output, but the junit is more
concise. Also check if we have it or fail as well.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/scripts/qubes-x86-64.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 046137a4a6..7a4c5ae489 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -298,6 +298,13 @@ TEST_RESULT=$?
 
 if [ -n "$retrieve_xml" ]; then
     nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
+    # Findout if one of the test failed
+    if ! grep -q '</testsuites>' tests-junit.xml; then
+        echo "ERROR: tests-junit.xml is incomplete or missing."
+        TEST_RESULT=1
+    elif grep -q '</failure>' tests-junit.xml; then
+        TEST_RESULT=1
+    fi
 fi
 
 exit "$TEST_RESULT"
-- 
Anthony PERARD


