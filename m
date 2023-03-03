Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2086AA602
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 01:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506265.779408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYFLK-0004YR-Jy; Sat, 04 Mar 2023 00:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506265.779408; Sat, 04 Mar 2023 00:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYFLK-0004Vq-GC; Sat, 04 Mar 2023 00:01:42 +0000
Received: by outflank-mailman (input) for mailman id 506265;
 Sat, 04 Mar 2023 00:01:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eaR=64=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pYFLI-0004VH-Kg
 for xen-devel@lists.xenproject.org; Sat, 04 Mar 2023 00:01:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc5e28cb-ba1f-11ed-a550-8520e6686977;
 Sat, 04 Mar 2023 01:01:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1DAAB819FA;
 Sat,  4 Mar 2023 00:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC1EC433EF;
 Sat,  4 Mar 2023 00:01:35 +0000 (UTC)
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
X-Inumbo-ID: bc5e28cb-ba1f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677888096;
	bh=l3p5CzfPCMHZRdXXtESCrWVMuXmzOEmp1Lvn+kITVB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WR5h64MaHyYtsxZnlfeW2BxYWnjOSjK0TC7jUUxjr4C7O2LeBb1D1kwtmPlA6sQZc
	 hM57rF+UcbY+gdzHKHdve7y8f9g2ivazi2K+nu2O7x/AMxEsSo842eINOVAn+TOOSZ
	 5H3Cd0KWjP8er+aWj0eqUD7SzFAqfWqJse6M+FLhwjBkJ2Vv+SkhNYoV1CIJsIKxKl
	 VYEfpMcKdTq7zRaqFRo646O/JJa59C+TUYo4/4lX0h3ECN+lIsorcusSXMY60CaJg6
	 A9uOxsBRJjxHVd7BS2Vc28iejCKI0iP3U+sojKUEtmr9DDj3YI5Uhs7XbA5csXrOAe
	 nOJvJoLx6IVOg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2 1/2] automation: add Ubuntu container for Xilinx hardware tests
Date: Fri,  3 Mar 2023 15:57:18 -0800
Message-Id: <20230303235719.1181690-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

This container is only run on the controller PC (x86) to trigger the
test on a connected Xilinx ZCU102 physical board.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 .../build/ubuntu/xenial-xilinx.dockerfile     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 automation/build/ubuntu/xenial-xilinx.dockerfile

diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
new file mode 100644
index 0000000000..7e4f5d6605
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
+# build depends
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


