Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0CB808988
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 14:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649872.1014928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEon-0002P3-Hp; Thu, 07 Dec 2023 13:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649872.1014928; Thu, 07 Dec 2023 13:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEon-0002Mm-En; Thu, 07 Dec 2023 13:53:33 +0000
Received: by outflank-mailman (input) for mailman id 649872;
 Thu, 07 Dec 2023 13:53:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCsk=HS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBEol-0002Al-Vd
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 13:53:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0072ce90-9508-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 14:53:30 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92DA612FC;
 Thu,  7 Dec 2023 05:54:15 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EB5D83F6C4;
 Thu,  7 Dec 2023 05:53:26 -0800 (PST)
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
X-Inumbo-ID: 0072ce90-9508-11ee-98e7-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 0/5] automation: Support running FVP Dom0 smoke test for Arm
Date: Thu,  7 Dec 2023 21:53:13 +0800
Message-Id: <20231207135318.1912846-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the support for running FVP Dom0 smoke test for Arm on
the Arm64 GitLab CI runner. Detailed changes please refer to the commit
message of each commit.

An example test pipeline with these patches applied (with the docker
registry changed to my own registry and unrelated job removed) can be
found at:
https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1098531057

Henry Wang (5):
  automation: Add a Dockerfile for running FVP_Base jobs
  automation: Add the Dockerfile to build TF-A and U-Boot for FVP
  automation: Add the expect script with test case for FVP
  automation: Add the script for the FVP smoke test
  automation: Add the arm64 FVP build and Dom0 smoke test jobs

 .../debian/bookworm-arm64v8-fvp.dockerfile    |  64 ++++++++++
 automation/gitlab-ci/build.yaml               |  17 +++
 automation/gitlab-ci/test.yaml                |  22 ++++
 .../expect/fvp-base-smoke-dom0-arm64.exp      |  73 +++++++++++
 .../scripts/fvp-base-smoke-dom0-arm64.sh      | 117 ++++++++++++++++++
 .../2023.10-2.9.0-arm64v8.dockerfile          |  48 +++++++
 6 files changed, 341 insertions(+)
 create mode 100644 automation/build/debian/bookworm-arm64v8-fvp.dockerfile
 create mode 100755 automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
 create mode 100755 automation/scripts/fvp-base-smoke-dom0-arm64.sh
 create mode 100644 automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile

-- 
2.25.1


