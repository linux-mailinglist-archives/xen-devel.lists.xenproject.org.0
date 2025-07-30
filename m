Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E16B163B1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 17:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064144.1429901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8gy-0001NT-8m; Wed, 30 Jul 2025 15:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064144.1429901; Wed, 30 Jul 2025 15:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8gy-0001Ln-5S; Wed, 30 Jul 2025 15:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1064144;
 Wed, 30 Jul 2025 15:26:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uh8gw-000182-DV
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 15:26:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8gw-009CRn-0e;
 Wed, 30 Jul 2025 15:26:06 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8gv-00H2I4-2x;
 Wed, 30 Jul 2025 15:26:06 +0000
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
	bh=MIYbHa/6UkyjSyxP87Vd8S0DL7hvgl8cGe6zaQ3oB5Q=; b=d8CiOdEAtQGZ85dnMb2b/K5xFM
	F4WxXa1uRH1iP8vLEXUyxV0vimTVYOx9NB/jiN6NbjZ26Ulsj6a1u+Cy90ciO2iMoMuPVfAL36b7X
	gowYPpTk8u+SsIMO2kn7fS2zWe5ReqUO7QCDSeoD99AFQzHrNqbHDYDpk7UNoxBYGGQ8=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/3] CI: Rework run-tools-test exit path
Date: Wed, 30 Jul 2025 17:26:00 +0200
Message-Id: <20250730152602.45436-2-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152602.45436-1-anthony@xenproject.org>
References: <20250730152602.45436-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

The main script expect to find the string "$passed" or it just timeout
and doesn't try to download the junit file in this case. So we ignore
the return value of run-tools-test to always print "$passed" and
instead look for failure in the generated junit file. If the junit
report is incomplete, this will also result in a failure of the job.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    Changes in v2:
    - This squash both patch "CI: Ignore run-tools-test return value" and
      "CI: Have the gitlab job fail on tools/tests failure"
    - grep for '<failure type="failure"' instead of '</failure>'

 automation/scripts/qubes-x86-64.sh | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 2750d24eba..21dcd9b063 100755
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
@@ -297,6 +298,14 @@ TEST_RESULT=$?
 
 if [ -n "$retrieve_xml" ]; then
     nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
+    # Findout if one of the test failed
+    if ! grep -q '</testsuites>' tests-junit.xml; then
+        echo "ERROR: tests-junit.xml is incomplete or missing."
+        TEST_RESULT=1
+    # Only match "type=failure" to allow to "tolerable" for example.
+    elif grep -q '<failure type="failure"' tests-junit.xml; then
+        TEST_RESULT=1
+    fi
 fi
 
 exit "$TEST_RESULT"
-- 
Anthony PERARD


