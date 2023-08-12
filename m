Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE5F779C7D
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 04:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582756.912678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUe1r-0002KG-5m; Sat, 12 Aug 2023 02:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582756.912678; Sat, 12 Aug 2023 02:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUe1r-0002HR-2E; Sat, 12 Aug 2023 02:06:59 +0000
Received: by outflank-mailman (input) for mailman id 582756;
 Sat, 12 Aug 2023 02:06:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WvX7=D5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUe1p-0001ue-Vt
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 02:06:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9dc5912-38b4-11ee-b286-6b7b168915f2;
 Sat, 12 Aug 2023 04:06:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E608650DE;
 Sat, 12 Aug 2023 02:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC15BC433C9;
 Sat, 12 Aug 2023 02:06:54 +0000 (UTC)
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
X-Inumbo-ID: e9dc5912-38b4-11ee-b286-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691806015;
	bh=G9CGB4WjL6b1fUK05672SR0exlr7l5QtL28sknt/JmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gE8E6xEIMab81FlM5nPwQ9WABCBg9sCUoJpN0wVf3UTBvLPYeBAncEeoAgTnuJceG
	 dPQlFtsQOEzZy+mAyCdgdxuSXxhtv5aEe/PwWoYsnVJTictH9mGy6D2YO7T/kNo4a3
	 gzcdGVLOKtXQTMXIyxm4wQczssFZV3ilS+E0IQdrZALfZU+n1+N7TmsV/VFIjV3jPf
	 Ww6KboAgJskpO0OC4C4oYSMdBVKXSGPUPZistL3TxdfA6CGebX1hYaSG6+tNs2vIEc
	 SG1VjnWiQEm2NCq99atnIO43LtvTyzUlrVuwY2IzcXz7vyZnREDmoJEy3XGuunWkkX
	 eu+1mzYbud/vA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 2/3] automation: update test-artifacts to use Debian Bookworm instead of unstable
Date: Fri, 11 Aug 2023 19:06:50 -0700
Message-Id: <20230812020651.11608-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktopa>
References: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktopa>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile       | 2 +-
 automation/tests-artifacts/kernel/6.1.19.dockerfile             | 2 +-
 .../qemu-system-aarch64/6.0.0-arm64v8.dockerfile                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
index e445c1f03a..a53a97d727 100644
--- a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
+++ b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:unstable
+FROM arm64v8/debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
index c2171555a0..d5b787c1cb 100644
--- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
+++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:unstable
+FROM debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
index 793432d40b..e277e13b60 100644
--- a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
+++ b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:unstable
+FROM arm64v8/debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-- 
2.25.1


