Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D12ACC6D6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004291.1384001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyM-0006Wk-Kk; Tue, 03 Jun 2025 12:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004291.1384001; Tue, 03 Jun 2025 12:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyM-0006Ty-Ff; Tue, 03 Jun 2025 12:42:30 +0000
Received: by outflank-mailman (input) for mailman id 1004291;
 Tue, 03 Jun 2025 12:42:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyK-00066r-MJ
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyK-000CGl-1W;
 Tue, 03 Jun 2025 12:42:28 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyK-005di7-2B;
 Tue, 03 Jun 2025 12:42:28 +0000
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
	bh=XI7mlfkKcVIHJ932YmivIqQFqrUIzKTKRZOSU/o2lrQ=; b=poHaAv0IEhUpNUVscRbLzGInV3
	rvUfPkAgf37JW1npPo2FVxSxxZ8HKpm9jI0pQm1x6OkOB8ao2g89VCTza2owTPRVuWenKJxEd1EyA
	59ZCITkcJkqNZitx0OSQ4EjQQLwJKNy+x6iq8IJbHBxAGmyuPZnRqZK04F2GZzRTX8Rg=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 4/9] CI: Ignore run-tools-test return value
Date: Tue,  3 Jun 2025 14:42:17 +0200
Message-Id: <20250603124222.52057-5-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603124222.52057-1-anthony@xenproject.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

The main script expect to find the string "$passed" or it just
timeout. Then, it doesn't try to download the junit file.
So ignore the return value of run-tools-test for now.

This mean the job will not fail, but at least we should have the junit
files with the error messages.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    On failure from a tests after this patch, the gitlab job succeed. But
    the junit file is collected.

 automation/scripts/qubes-x86-64.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 2750d24eba..046137a4a6 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -135,10 +135,11 @@ done
     ### tests: tools-tests-pv, tools-tests-pvh
     "tools-tests-pv"|"tools-tests-pvh")
         retrieve_xml=1
-        passed="test passed"
+        passed="run-tools-test over"
         domU_check=""
         dom0_check="
-/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml && echo \"${passed}\"
+/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml ||:
+echo \"${passed}\"
 nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
 "
         if [ "${test_variant}" = "tools-tests-pvh" ]; then
-- 
Anthony PERARD


