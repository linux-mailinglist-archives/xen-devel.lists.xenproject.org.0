Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8F976F6C5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 03:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576718.903179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRjKk-00082u-Li; Fri, 04 Aug 2023 01:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576718.903179; Fri, 04 Aug 2023 01:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRjKk-00080z-I3; Fri, 04 Aug 2023 01:10:26 +0000
Received: by outflank-mailman (input) for mailman id 576718;
 Fri, 04 Aug 2023 01:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRjKj-00080t-TS
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 01:10:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b058e5ca-3263-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 03:10:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D923661F09;
 Fri,  4 Aug 2023 01:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653A4C433C8;
 Fri,  4 Aug 2023 01:10:21 +0000 (UTC)
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
X-Inumbo-ID: b058e5ca-3263-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691111422;
	bh=oO0A3Ds5bT3/spXLHUEyqr8Wo0ZUsDh6x1xvfua1OlQ=;
	h=From:To:Cc:Subject:Date:From;
	b=jeFh6bLQ/4V3UmryprzFr7RaE7mUBoMoJo/nfqWsJGk/pyINWQihgYPP/IbVc7sOm
	 VggWil7VUm2+4FjLRHKYnMbys0k2UYiWecLQ/IYQhQ+yYT36amhywU/NDqSxsHFb+G
	 OBy3zjz7HiVxiRvedeKTsMdGBfKsUGytLao5ZyNLBGvB/C1rV9RgeRjTI7CjiFbpT/
	 5YnYyrRW/smilYTigX3WXcHBm07NAFZf8Irh6OnS/AytbfkplGCHSovUl8MCy9zgk6
	 iGRO/f9W17BHXy+kH6+oSBQE1Z6HBLIHK2fNK8PqtvAjrnOPekJU248G4/1QbVTtNM
	 +0ZVFjuVvVvwA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: cardoe@cardoe.com
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	simone.ballarin@bugseng.com,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] automation: add missing "needs"
Date: Thu,  3 Aug 2023 18:10:18 -0700
Message-Id: <20230804011018.2888869-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

The test artifacts export jobs don't need prerequisites, so we should
specify "needs" with an empty array for them. That way, they are not
going to fruitlessly wait for previous jobs (ECLAIR jobs) to complete
before continuing.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/gitlab-ci/build.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f01e2c32bb..af64a53ead 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -268,6 +268,7 @@
 
 .test-jobs-artifact-common:
   stage: build
+  needs: []
   except: !reference [.test-jobs-common, except]
 
 # Arm test artifacts
-- 
2.25.1


