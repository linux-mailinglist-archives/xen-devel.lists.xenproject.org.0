Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7936A809BCF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 06:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650348.1015811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBThM-0001d3-Uj; Fri, 08 Dec 2023 05:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650348.1015811; Fri, 08 Dec 2023 05:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBThM-0001am-RE; Fri, 08 Dec 2023 05:46:52 +0000
Received: by outflank-mailman (input) for mailman id 650348;
 Fri, 08 Dec 2023 05:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBThL-0001af-F2
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 05:46:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2e5653c6-958d-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 06:46:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D524111FB;
 Thu,  7 Dec 2023 21:47:34 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2CF013F5A1;
 Thu,  7 Dec 2023 21:46:45 -0800 (PST)
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
X-Inumbo-ID: 2e5653c6-958d-11ee-98e8-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v2 0/5] automation: Support running FVP Dom0 smoke test for Arm
Date: Fri,  8 Dec 2023 13:46:32 +0800
Message-Id: <20231208054637.1973424-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the support for running FVP Dom0 smoke test for Arm on
the Arm64 GitLab CI runner. Detailed changes please refer to the commit
message of each commit.

An example test pipeline with these patches applied (with the docker
registry changed to my own registry and unrelated job removed) can be
found at:
https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1099757245

The second example of a negative test with breaking the expect script
by a "never met" condition can be found at:
https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1099757601
The job will fail as expected after the timeout set by the expect
script.

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
 .../scripts/fvp-base-smoke-dom0-arm64.sh      | 120 ++++++++++++++++++
 .../2023.10-2.9.0-arm64v8.dockerfile          |  48 +++++++
 6 files changed, 344 insertions(+)
 create mode 100644 automation/build/debian/bookworm-arm64v8-fvp.dockerfile
 create mode 100755 automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
 create mode 100755 automation/scripts/fvp-base-smoke-dom0-arm64.sh
 create mode 100644 automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile

-- 
2.25.1


