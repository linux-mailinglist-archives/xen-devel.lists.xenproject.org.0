Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEBE718F2B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 01:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542185.845753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4VZK-00077L-KU; Wed, 31 May 2023 23:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542185.845753; Wed, 31 May 2023 23:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4VZK-00075g-HX; Wed, 31 May 2023 23:49:30 +0000
Received: by outflank-mailman (input) for mailman id 542185;
 Wed, 31 May 2023 23:49:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVj=BU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q4VZI-00075G-ST
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 23:49:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c672212f-000d-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 01:49:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8310460EBB;
 Wed, 31 May 2023 23:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426F2C433D2;
 Wed, 31 May 2023 23:49:24 +0000 (UTC)
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
X-Inumbo-ID: c672212f-000d-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685576965;
	bh=V0LVJpm6gqhdWdM3hxlzoeWek7HH89EI9IWkTveLUA8=;
	h=From:To:Cc:Subject:Date:From;
	b=NVeHRxP/H2HTrRscF/S9BiyU/iL8QTU8boHd0nmyVUm/dW+JnWghGdRIA23/sxOwg
	 dzYWJl8YsmGGVaV3/zMCeDLfZfTqcLRIVIwK2BXtJ8uYC66IzaZkNHKe/gPvkpJsGG
	 RrUnS+4mxazmrrKqWvrm+D5K197ZBwRQZqqSAw8n59x/OrlascWtbBZP9bIOamVb2+
	 1MXu362X4YtBYDYNui0vdXq5+5CBXdwakrQADBcLkNTiMjAjz2hImvTlvp92bIYPqY
	 muAdK/sbIQf61g9Q+XycNzhvc2npjPwKcLNiUTetWuOgw1tL4Q3ZCUFb+z1OK3uuDS
	 KrqKE7krTvI6g==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	marmarek@invisiblethingslab.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] automation: zen3 dom0pvh test
Date: Wed, 31 May 2023 16:49:21 -0700
Message-Id: <20230531234921.2291367-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Add a PVH Dom0 test for the zen3 runner.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/gitlab-ci/test.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index fbe2c0589a..d5cb238b0a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -202,6 +202,14 @@ zen3p-smoke-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.12-gcc-debug
 
+zen3p-smoke-x86-64-dom0pvh-gcc-debug:
+  extends: .zen3p-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc-debug
+
 zen3p-pci-hvm-x86-64-gcc-debug:
   extends: .zen3p-x86-64
   script:
-- 
2.25.1


