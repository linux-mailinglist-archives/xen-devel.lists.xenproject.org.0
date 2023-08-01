Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4676B013
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574024.899194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQm8H-0000yc-8R; Tue, 01 Aug 2023 09:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574024.899194; Tue, 01 Aug 2023 09:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQm8H-0000wR-50; Tue, 01 Aug 2023 09:57:37 +0000
Received: by outflank-mailman (input) for mailman id 574024;
 Tue, 01 Aug 2023 09:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u66X=DS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qQm8F-0000wJ-9y
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:57:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d647499f-3051-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 11:57:34 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 81CB64EE0737;
 Tue,  1 Aug 2023 11:57:33 +0200 (CEST)
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
X-Inumbo-ID: d647499f-3051-11ee-b259-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/4] automation/eclair: improvements to the ECLAIR integration
Date: Tue,  1 Aug 2023 11:57:00 +0200
Message-Id: <cover.1690881495.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains a series of improvements to the ECLAIR integration.

The integration was not initially intended to operate in tag pipelines,
for this reason the analyses fail when triggered from xen-project/patchew.
This series add support for such pipelines.

The summary() reporting facility in action.helpers has been partially
rewritten to make it more readable and easier to follow. The utility
has been extended to print directs links to the findings in the GitLab
console log.

Six new ECLAIR jobs have been added, these jobs run only when triggered
by a scheduled pipeline.

This series avoids failures when a merge point with xen-project/xen(staging)
is not found.

Simone Ballarin (4):
  automation/eclair: add support for tag pipelines
  automation/eclair: add direct link to reports
  automation/eclair: add scheduled pipelines
  automation/eclair: avoid failure in case of missing merge point

 .../eclair_analysis/ECLAIR/action.helpers     | 84 ++++++++++++++-----
 .../eclair_analysis/ECLAIR/action.settings    | 30 ++++---
 automation/gitlab-ci/analyze.yaml             | 65 +++++++++++++-
 3 files changed, 145 insertions(+), 34 deletions(-)

-- 
2.34.1


