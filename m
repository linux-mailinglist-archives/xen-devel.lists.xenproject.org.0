Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574877825DB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:54:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587406.918784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0gK-0007Ws-B7; Mon, 21 Aug 2023 08:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587406.918784; Mon, 21 Aug 2023 08:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0gK-0007Uu-6T; Mon, 21 Aug 2023 08:54:40 +0000
Received: by outflank-mailman (input) for mailman id 587406;
 Mon, 21 Aug 2023 08:54:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixuA=EG=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qY0gJ-0007FO-49
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:54:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b5077e5-4000-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 10:54:37 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 6D4DB4EE0737;
 Mon, 21 Aug 2023 10:54:36 +0200 (CEST)
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
X-Inumbo-ID: 5b5077e5-4000-11ee-9b0c-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	andrew.cooper3@citrix.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/2] automation: avoid unnecessary analyses
Date: Mon, 21 Aug 2023 10:54:05 +0200
Message-Id: <cover.1692607487.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to reduce the analyses performed by the ECLAIR
runner by avoiding some branches already excluded by other jobs
and requiring analyses on people/.* to be manually triggered.

---
Changes in v2:
- move some changes from 1/2 to 2/2.
- remove useless except clause in .yocto-test
- avoid ECLAIR jobs if the WTOKEN variable is not defined

Simone Ballarin (2):
  automation/eclair: avoid unintentional ECLAIR analysis
  automation: avoid pipelines on specific branches

 .gitlab-ci.yml                    |  6 ++++++
 automation/gitlab-ci/analyze.yaml | 22 +++++++++++++++++-----
 automation/gitlab-ci/build.yaml   | 11 -----------
 automation/gitlab-ci/test.yaml    |  5 -----
 automation/scripts/eclair         |  5 -----
 5 files changed, 23 insertions(+), 26 deletions(-)

-- 
2.34.1


