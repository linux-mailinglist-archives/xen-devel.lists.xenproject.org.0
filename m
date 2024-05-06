Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE818BCA12
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717335.1119443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3u5P-0000Rx-H8; Mon, 06 May 2024 08:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717335.1119443; Mon, 06 May 2024 08:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3u5P-0000P0-EO; Mon, 06 May 2024 08:52:39 +0000
Received: by outflank-mailman (input) for mailman id 717335;
 Mon, 06 May 2024 08:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNYQ=MJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s3u5O-0000Ou-7m
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:52:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc89a03c-0b85-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 10:52:37 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id 24D244EE074D;
 Mon,  6 May 2024 10:52:35 +0200 (CEST)
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
X-Inumbo-ID: fc89a03c-0b85-11ef-909c-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	andrew.cooper3@citrix.com,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH] automation/eclair_analysis: unblock pipelines from certain repositories
Date: Mon,  6 May 2024 10:52:31 +0200
Message-Id: <b599441c1678d11cfaa43b679bacbd5a1b886d3f.1714983088.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Repositories under people/* only execute the analyze step if manually
triggered, but in order to avoid blocking the rest of the pipeline
if such step is not run, allow it to fail.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
See https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/1278550868
for a sample pipeline with this change applied.
---
 automation/gitlab-ci/analyze.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 32bf57014961..02e0ea692c66 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -31,6 +31,7 @@
       when: never
     - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
       when: manual
+      allow_failure: true
     - !reference [.eclair-analysis, rules]
 
 eclair-x86_64:
-- 
2.34.1

