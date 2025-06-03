Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F81BACC6D3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004293.1384022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyP-00072t-Cz; Tue, 03 Jun 2025 12:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004293.1384022; Tue, 03 Jun 2025 12:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyP-00070a-6i; Tue, 03 Jun 2025 12:42:33 +0000
Received: by outflank-mailman (input) for mailman id 1004293;
 Tue, 03 Jun 2025 12:42:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyM-0006cT-Ru
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyM-000CH1-2A;
 Tue, 03 Jun 2025 12:42:30 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyM-005di7-2p;
 Tue, 03 Jun 2025 12:42:30 +0000
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
	bh=zrPvG8IMBYXQG2B7hfodQ0aQa554NWza+LSe4vglB3o=; b=X9oVUvZSmI2c/8sOSwngBg1Y13
	r8Ewzd1fg0rH0R8fGMpg65/nRh3jTpSsTuacyDggXZpeGxCCldf0XWYc7+tWPmtgYXMBRPSCpeuFW
	sIp+ItMj7Ksd7mhbr0ZKSTp5zQINTtj/5/DLh6DchoQeEDGwSda06weKooMX6modGcXg=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 6/9] CI: Upload junit result as artefact
Date: Tue,  3 Jun 2025 14:42:19 +0200
Message-Id: <20250603124222.52057-7-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603124222.52057-1-anthony@xenproject.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

This allow to investigate the file in cases of error. Not all
jobs that extend ".adl-x86-64" are creating a "tests-junit.xml" but
Gitlab only produce a warning when the file isn't found.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/gitlab-ci/test.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 842cecf713..2b4b8c021b 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -155,6 +155,7 @@
     paths:
       - smoke.serial
       - '*.log'
+      - tests-junit.xml
     when: always
   rules:
     - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
-- 
Anthony PERARD


