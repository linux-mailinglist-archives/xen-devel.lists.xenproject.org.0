Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CA1B163B4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 17:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064146.1429922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8gz-0001qi-S4; Wed, 30 Jul 2025 15:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064146.1429922; Wed, 30 Jul 2025 15:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8gz-0001oJ-OT; Wed, 30 Jul 2025 15:26:09 +0000
Received: by outflank-mailman (input) for mailman id 1064146;
 Wed, 30 Jul 2025 15:26:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uh8gy-0001aP-OS
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 15:26:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8gy-009CS3-1a;
 Wed, 30 Jul 2025 15:26:08 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8gy-00H2I4-0i;
 Wed, 30 Jul 2025 15:26:08 +0000
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
	bh=SJ8Q0YZBG9Hjpz8ROy4E6w65UdeOskQvBHIbE84vhW4=; b=BUyMokG1Pvjzz/6xext42AZ6JS
	S63Ww+ahD2G5LOdIgBz7tWsEb6mCJESgVR/nibvHJE+IM8XeshlYhtqtyLHHMmT1UPIDHqczNFke9
	M/ZDWcuRq0glWKg66W9RMRzuDOZfHwL7g3o2k3tqIL1hrGTtAcfHLxhgSXXQWNMQ9oiA=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 3/3] CI: Workaround extra content in junit
Date: Wed, 30 Jul 2025 17:26:02 +0200
Message-Id: <20250730152602.45436-4-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152602.45436-1-anthony@xenproject.org>
References: <20250730152602.45436-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/scripts/qubes-x86-64.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 21dcd9b063..f1b7e02e63 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -298,6 +298,12 @@ TEST_RESULT=$?
 
 if [ -n "$retrieve_xml" ]; then
     nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
+    # Workaround duplicated data been received
+    sed -i.old '/^<\/testsuites>/q' tests-junit.xml > /dev/null
+    extra_line_in_junit=$(($(wc -l < tests-junit.xml.old) - $(wc -l < tests-junit.xml)))
+    if [ $extra_line_in_junit -gt 0 ]; then
+        echo "WARNING: Found $extra_line_in_junit too many lines in junit."
+    fi
     # Findout if one of the test failed
     if ! grep -q '</testsuites>' tests-junit.xml; then
         echo "ERROR: tests-junit.xml is incomplete or missing."
-- 
Anthony PERARD


