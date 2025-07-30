Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0576B163B2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 17:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064143.1429892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8gx-0001AV-1T; Wed, 30 Jul 2025 15:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064143.1429892; Wed, 30 Jul 2025 15:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8gw-000188-UT; Wed, 30 Jul 2025 15:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1064143;
 Wed, 30 Jul 2025 15:26:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uh8gv-00017w-Kn
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 15:26:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8gv-009CRh-0D;
 Wed, 30 Jul 2025 15:26:05 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8gu-00H2I4-2R;
 Wed, 30 Jul 2025 15:26:04 +0000
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
	bh=mec5CA9Qc4IYXleyViiqthacNW+NpDTVdWy4MZxyiSk=; b=pcfRbo4rwJNBWDqkur7aYQq1C5
	K2naYKgnEfjcWtUZxMHXHYgpHCg6axPAH9eZIV+6rnbQbfnIHRZOB+0quCo6mtL9tnd/m0LgzcOx+
	CMSsZzvYeIjvziQCdJRRQuh/UziNqMjnCqFy5BvMiTNd1hPTIEeFKvtwZ688vflFZFgU=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/3] CI: Fixes for tools/tests and junit and other
Date: Wed, 30 Jul 2025 17:25:59 +0200
Message-Id: <20250730152602.45436-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Patch series available in this git branch:
https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.ci-tools-tests-junit-fixes-v2

All the *-tools-tests-* are currently only checking automatically if the
machine as booted. The only way to find out if one of the tools/tests failed is
to read the console output by hand. Fix that.

Cheers,

Anthony PERARD (3):
  CI: Rework run-tools-test exit path
  CI: Upload junit result as artefact
  CI: Workaround extra content in junit

 automation/gitlab-ci/test.yaml     |  1 +
 automation/scripts/qubes-x86-64.sh | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

-- 
Anthony PERARD


