Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F62ACC6D4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004288.1383971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyJ-0005pT-Vv; Tue, 03 Jun 2025 12:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004288.1383971; Tue, 03 Jun 2025 12:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyJ-0005nD-Pv; Tue, 03 Jun 2025 12:42:27 +0000
Received: by outflank-mailman (input) for mailman id 1004288;
 Tue, 03 Jun 2025 12:42:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyH-0005ZX-Pt
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyH-000CGH-1P;
 Tue, 03 Jun 2025 12:42:25 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyH-005di7-1z;
 Tue, 03 Jun 2025 12:42:25 +0000
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
	bh=E+UTBqVT4ataITEs2z99MCcjBJjVKQSs1JAGcPyP+AE=; b=LRUze+1QWU+0/9XYKBT+2jZ4hF
	dWaHhMw4rqE6hdBqeEuzZ+ZRaRhcud9BaCecK19RlXQE11F8brOyjDitIGsq9oEIPMONvUywKuN1+
	GYkondxAGCndW9YPwnDhrK+z9BmiAP/iyiODtilkuCtAeMQf6vdHaUvWelQW9oi+2pyc=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/9] CI: Add SELECTED_JOBS_ONLY to analyze.yaml
Date: Tue,  3 Jun 2025 14:42:14 +0200
Message-Id: <20250603124222.52057-2-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603124222.52057-1-anthony@xenproject.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/gitlab-ci/analyze.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 35ff3620cf..5b00b9f25c 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -29,6 +29,9 @@
   rules:
     - if: $CI_PIPELINE_SOURCE == "schedule"
       when: never
+    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+    - if: $SELECTED_JOBS_ONLY
+      when: never
     - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
       when: manual
       allow_failure: true
-- 
Anthony PERARD


