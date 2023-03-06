Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CAB6AD2DA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 00:33:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507155.780393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZKKU-0005vI-W3; Mon, 06 Mar 2023 23:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507155.780393; Mon, 06 Mar 2023 23:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZKKU-0005t3-QR; Mon, 06 Mar 2023 23:33:18 +0000
Received: by outflank-mailman (input) for mailman id 507155;
 Mon, 06 Mar 2023 23:33:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xk/k=66=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pZKKS-0005af-L4
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 23:33:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44296f09-bc77-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 00:33:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50DAC61183;
 Mon,  6 Mar 2023 23:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13912C433D2;
 Mon,  6 Mar 2023 23:33:12 +0000 (UTC)
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
X-Inumbo-ID: 44296f09-bc77-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678145593;
	bh=M+QhWGuUbzDwVJWG4MjZlhHdrqDNz+IKRDebRuiLYvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGUcZrP22a/1n9ksr5ZPhfmZILFtHTqoUKGsZC6tZIMTjkS60pYJIQak1TWe79JK8
	 xSZnSYzr0hLJycVeyiKhNsnlw0jGnuY8mgNVrp82OTy2aOewQbr8gHbi+k8K93ZR7G
	 khQP9Yk3BHFYQ/YHv5EEdwav7zpQ2wH4rDqOyfXXfHQdEdMd297Rf+8JIWzRkqj6Br
	 sohbWcp4SMrnaSiNW5CYuIuHo/9mtvlWwnCznInFYJfadW7CuNby1LTE0jHMhSXoPC
	 KF2jIl7iCQo94S9sZU6L16viT5tL8vzQ5dyMSgGWr2d4YcHj3tu54cCgGqLl8eTfIS
	 qFDt4JmrntU7w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3 1/2] automation: add Ubuntu container for Xilinx hardware tests
Date: Mon,  6 Mar 2023 15:33:09 -0800
Message-Id: <20230306233310.1993693-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2303061531240.863724@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2303061531240.863724@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

This container is only run on the controller PC (x86) to trigger the
test on a connected Xilinx ZCU102 physical board.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v3:
- improve in-code comment
- add reviewed-by
---
 .../build/ubuntu/xenial-xilinx.dockerfile     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 automation/build/ubuntu/xenial-xilinx.dockerfile

diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
new file mode 100644
index 0000000000..5f70871352
--- /dev/null
+++ b/automation/build/ubuntu/xenial-xilinx.dockerfile
@@ -0,0 +1,25 @@
+FROM ubuntu:16.04
+LABEL maintainer.name="The Xen Project " \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# board bringup depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        snmp \
+        snmp-mibs-downloader \
+        u-boot-tools \
+        device-tree-compiler \
+        cpio \
+        git \
+        gzip \
+        file \
+        && \
+        apt-get autoremove -y && \
+        apt-get clean && \
+        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-- 
2.25.1


