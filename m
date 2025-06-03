Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A10ACC6D7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004290.1383991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyL-0006HM-Bs; Tue, 03 Jun 2025 12:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004290.1383991; Tue, 03 Jun 2025 12:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyL-0006EP-8G; Tue, 03 Jun 2025 12:42:29 +0000
Received: by outflank-mailman (input) for mailman id 1004290;
 Tue, 03 Jun 2025 12:42:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyJ-0005oa-Q0
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyJ-000CGe-1f;
 Tue, 03 Jun 2025 12:42:27 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyJ-005di7-1r;
 Tue, 03 Jun 2025 12:42:27 +0000
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
	bh=kK1Tx9vm5iULGdSLvjqkBnXbzSdn9xeUjOcjEOgDs9I=; b=RfQjopJDxB0v5oOjsgVzYOnxOa
	qLO9U7tU3YklWnVN9ZpkCB5r7HGur5rNt1MVF+QUZfWVksWUvhFQMm+BEnBF+xCEPL+YYeb1AYH4Q
	gOcVg6hFWgouu82Gz24PF83hKj8Bu62PVwgEYi6z7N3QN37F0PUd7j/yGGyHmM4dYO6s=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 3/9] CI: Fix status check for tools/tests
Date: Tue,  3 Jun 2025 14:42:16 +0200
Message-Id: <20250603124222.52057-4-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603124222.52057-1-anthony@xenproject.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Without "pipefail", $? have the exit value of `tee`, which should
always be 0. But instead of using "pipefail", do collect the value of
from the test with $PIPESTATUS.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    Without the next patch "CI: Ignore run-tools-test return value", this
    just mean that if one test fail, the script `qubes-x86-64.sh` will
    detect a ERROR-Timeout because the expected string is never printed.

 automation/scripts/run-tools-tests | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
index 2bca1589db..695ed77e46 100755
--- a/automation/scripts/run-tools-tests
+++ b/automation/scripts/run-tools-tests
@@ -20,7 +20,7 @@ for f in "$1"/*; do
     echo "Running $f"
     printf '  <testcase name="%s">\n' "$f" >> "$xml_out"
     "$f" 2>&1 | tee /tmp/out
-    ret=$?
+    ret=${PIPESTATUS[0]}
     if [ "$ret" -ne 0 ]; then
         echo "FAILED: $f"
         failed+=" $f"
-- 
Anthony PERARD


