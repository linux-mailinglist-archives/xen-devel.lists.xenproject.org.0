Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A39ACC6D5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004287.1383961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyI-0005bf-N0; Tue, 03 Jun 2025 12:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004287.1383961; Tue, 03 Jun 2025 12:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyI-0005Zd-JV; Tue, 03 Jun 2025 12:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1004287;
 Tue, 03 Jun 2025 12:42:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyG-0005ZR-Ra
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyG-000CGB-1M;
 Tue, 03 Jun 2025 12:42:24 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyG-005di7-1f;
 Tue, 03 Jun 2025 12:42:24 +0000
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
	Message-Id:Date:Subject:Cc:To:From;
	bh=H91GbEN+aoGGPPzwFtL5rgVS6VFOCpx4W1spHRaIpZ4=; b=cN5apCXUU90TZLTZV9/Fvi+BYs
	i5+DQDjsTupfyZmYFL6XUsDPgg15sJjSPTFHJQLqqbMI0MAoQVjAPybcPIgbao3uSGRHCvyZ7VwE/
	EoyM2d2mK+FwdJKi3HX+LSAamWFRxTqXxve5i+mO9BRNWxh1UHV2QvqgndFVrAXh6Rvo=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 0/9] CI: Fixes for tools/tests and junit and other
Date: Tue,  3 Jun 2025 14:42:13 +0200
Message-Id: <20250603124222.52057-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Patch series available in this git branch:
https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.ci-tools-tests-junit-fixes-v1

All the *-tools-tests-* are currently only checking automatically if the
machine as booted. The only way to find out if one of the tools/tests failed is
to read the console output by hand.

Also, tests-rangeset always return success even if there's a failure.

Fix all that, and add some improvement, and add SELECTED_JOBS_ONLY to
analyze.yaml

How it looks:
success:
    https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1850830262/test_report
failure:
    https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1850830637/test_report

Cheers,

Anthony PERARD (9):
  CI: Add SELECTED_JOBS_ONLY to analyze.yaml
  tools/tests: Fix return value of test-rangeset
  CI: Fix status check for tools/tests
  CI: Ignore run-tools-test return value
  CI: Have the gitlab job fail on tools/tests failure
  CI: Upload junit result as artefact
  CI: Use CDATA avoid the need to escape tests outputs
  CI: Workaround extra content in junit
  CI: Add timing to junit

 automation/gitlab-ci/analyze.yaml    |  3 +++
 automation/gitlab-ci/test.yaml       |  1 +
 automation/scripts/qubes-x86-64.sh   | 18 ++++++++++++++++--
 automation/scripts/run-tools-tests   | 11 +++++++----
 tools/tests/rangeset/test-rangeset.c |  2 +-
 5 files changed, 28 insertions(+), 7 deletions(-)

-- 
Anthony PERARD


