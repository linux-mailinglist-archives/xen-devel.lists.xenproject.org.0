Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97DB163B3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 17:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064145.1429909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8gy-0001U3-Kc; Wed, 30 Jul 2025 15:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064145.1429909; Wed, 30 Jul 2025 15:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8gy-0001Px-HA; Wed, 30 Jul 2025 15:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1064145;
 Wed, 30 Jul 2025 15:26:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uh8gx-0001LF-Lu
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 15:26:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8gx-009CRv-14;
 Wed, 30 Jul 2025 15:26:07 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8gx-00H2I4-0D;
 Wed, 30 Jul 2025 15:26:07 +0000
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
	bh=FGhlhnnA/UY57kgH1UOTTJizQb27/f6qp8QYokK43kg=; b=zgSeii7A3gOQ0UnmAPQfsGF8d0
	9Gbv2gUGtpiDMw36EfR46Q46LR6hIFDlQRSukkvUHZfhprVOYQ1R0P1fLm5hTVsdCDz9nTnm/F7BI
	yAbNjOLwNQDM+kbstLCBeOsf2VnQUyd9Sj5FVwnajVQFZ2PoEuySoGZkb3WFoGP/7hDg=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 2/3] CI: Upload junit result as artefact
Date: Wed, 30 Jul 2025 17:26:01 +0200
Message-Id: <20250730152602.45436-3-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152602.45436-1-anthony@xenproject.org>
References: <20250730152602.45436-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

This allows to investigate the junit file in cases of parse error.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    Changes in v2:
    - more concise patch description.

 automation/gitlab-ci/test.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1f0b27b237..feb03cc7ed 100644
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


