Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010927AE1D3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 00:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608149.946464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuHt-0006gC-Dv; Mon, 25 Sep 2023 22:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608149.946464; Mon, 25 Sep 2023 22:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuHt-0006eE-BE; Mon, 25 Sep 2023 22:42:45 +0000
Received: by outflank-mailman (input) for mailman id 608149;
 Mon, 25 Sep 2023 22:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxCo=FJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qkuHs-0006e1-Al
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 22:42:44 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6a985b1-5bf4-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 00:42:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4398F828562B;
 Mon, 25 Sep 2023 17:42:42 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0GI1UFaH0A4L; Mon, 25 Sep 2023 17:42:41 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6B5918285640;
 Mon, 25 Sep 2023 17:42:41 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id C24nnOLqsfs2; Mon, 25 Sep 2023 17:42:41 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C2CDD828558A;
 Mon, 25 Sep 2023 17:42:40 -0500 (CDT)
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
X-Inumbo-ID: d6a985b1-5bf4-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6B5918285640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695681761; bh=KzJBYh4Ckh5yuJq8bIq+BDM2miqytFWcHal4Xa9U6ug=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=TEkHgkmtykC32CRyqrsbP6AX5yY9UoWJey4mn0WwabDeHXuF9uZEznrIYRpTxUzKX
	 5IWHZsh2cX0GUZbyb0IiGG8Tps25RkoaikbzNhugOmerEZZZ0bI11Frv2EPLnWeO7a
	 2Bn67vy1RVo62yK1DxdeEh4rGgiiIb6cdUR/yby0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/3] Fix Power CI build
Date: Mon, 25 Sep 2023 17:42:27 -0500
Message-Id: <cover.1695681330.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This series contains a few minor fixes to the CI config and one
additional patch to common/ that resolve ppc64-specific CI failures
that Jan discovered.

Thanks,

Shawn Anastasio (3):
  automation: Drop ppc64le-*randconfig jobs
  automation: Change build script to use arch defconfig
  xen/common: Add NUMA node id bounds check to
    page_alloc.c/node_to_scrub

 automation/gitlab-ci/build.yaml | 18 ------------------
 automation/scripts/build        |  7 ++++++-
 xen/common/page_alloc.c         |  3 +++
 3 files changed, 9 insertions(+), 19 deletions(-)

--
2.30.2


