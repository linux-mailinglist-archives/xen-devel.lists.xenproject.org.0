Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2501FACC6D2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004296.1384050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyS-0007tB-Mb; Tue, 03 Jun 2025 12:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004296.1384050; Tue, 03 Jun 2025 12:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyS-0007nZ-HD; Tue, 03 Jun 2025 12:42:36 +0000
Received: by outflank-mailman (input) for mailman id 1004296;
 Tue, 03 Jun 2025 12:42:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyQ-0007Kz-6y
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyP-000CHQ-35;
 Tue, 03 Jun 2025 12:42:33 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyQ-005di7-0X;
 Tue, 03 Jun 2025 12:42:33 +0000
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
	bh=9+GoEHcrcXffSGesQEWI0GuwFDcV6Q4bPLnJ++8/OYE=; b=p+uT9LUN/v9pU5ZWashSBZfh84
	aKhiQCaYRmLhAFhGtkb5tSNtqFAWtzqgm8AMK2L4M7VpjpGXc2TsV3dWW/hV5Ph4IiXp8T1ztGMV2
	OqliyP0BaRKQ/SqMGKNkeBZxQ1cc9C0si3FG5d/pkVMFzcllRusAzGWLZXcGZy91BIZ8=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 9/9] CI: Add timing to junit
Date: Tue,  3 Jun 2025 14:42:22 +0200
Message-Id: <20250603124222.52057-10-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603124222.52057-1-anthony@xenproject.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/scripts/run-tools-tests | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
index 852c1cfbcf..e38cc4068c 100755
--- a/automation/scripts/run-tools-tests
+++ b/automation/scripts/run-tools-tests
@@ -18,9 +18,12 @@ for f in "$1"/*; do
         continue
     fi
     echo "Running $f"
-    printf '  <testcase name="%s">\n' "$f" >> "$xml_out"
+    time_start=$EPOCHREALTIME
     "$f" 2>&1 | tee /tmp/out
     ret=${PIPESTATUS[0]}
+    time_end=$EPOCHREALTIME
+    time_test="$(bc <<<"$time_end - $time_start")"
+    printf '  <testcase name="%s" time="%f">\n' "$f" "$time_test" >> "$xml_out"
     if [ "$ret" -ne 0 ]; then
         echo "FAILED: $f"
         failed+=" $f"
-- 
Anthony PERARD


