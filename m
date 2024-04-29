Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2957D8B5D65
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714218.1115346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SpW-00034C-Gc; Mon, 29 Apr 2024 15:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714218.1115346; Mon, 29 Apr 2024 15:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SpW-00030R-Cx; Mon, 29 Apr 2024 15:22:10 +0000
Received: by outflank-mailman (input) for mailman id 714218;
 Mon, 29 Apr 2024 15:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDZ7=MC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s1SpV-0002rB-F5
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:22:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d59800d-063c-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:22:07 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 810C84EE0751;
 Mon, 29 Apr 2024 17:22:06 +0200 (CEST)
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
X-Inumbo-ID: 3d59800d-063c-11ef-909b-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/3] automation: do not allow failure for triggered analyses
Date: Mon, 29 Apr 2024 17:21:58 +0200
Message-Id: <34d8782629fc8cb1fe09060eb1aac2d6efab8096.1714401209.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714401209.git.federico.serafini@bugseng.com>
References: <cover.1714401209.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not allow_failure for triggered analyses:
introducing regressions of clean guidelines will cause a CI failure.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/gitlab-ci/analyze.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 46c9d8e2e5..32bf570149 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -26,7 +26,6 @@
 
 .eclair-analysis:triggered:
   extends: .eclair-analysis
-  allow_failure: true
   rules:
     - if: $CI_PIPELINE_SOURCE == "schedule"
       when: never
-- 
2.34.1


