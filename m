Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410DACC6D8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004295.1384041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyR-0007Xw-5S; Tue, 03 Jun 2025 12:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004295.1384041; Tue, 03 Jun 2025 12:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyQ-0007Qh-Ul; Tue, 03 Jun 2025 12:42:34 +0000
Received: by outflank-mailman (input) for mailman id 1004295;
 Tue, 03 Jun 2025 12:42:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyO-00070R-Tm
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyO-000CHH-2l;
 Tue, 03 Jun 2025 12:42:32 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyP-005di7-0E;
 Tue, 03 Jun 2025 12:42:32 +0000
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
	bh=Z+KO5MEJLmLiDR6R7GxGmFnSMjUykYCseZZs3veeZOI=; b=iXva1RAcd06eYvvWX3764g/BQT
	CEKH9Rh3GW00tIYmN+WE5+qEnD7HZy0re8WhwjhieMSRVZn+nt+uEY+dBFKg/+yca34D5LiKkZ9ih
	4SQzd++6JC2LBJHlqq9JUBapr9EXeoGBjebLJtuMZ+Mf7c8gwNLtQTDB1K0nWXQibyvU=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 8/9] CI: Workaround extra content in junit
Date: Tue,  3 Jun 2025 14:42:21 +0200
Message-Id: <20250603124222.52057-9-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603124222.52057-1-anthony@xenproject.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/scripts/qubes-x86-64.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 7a4c5ae489..6ab8412f45 100755
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


