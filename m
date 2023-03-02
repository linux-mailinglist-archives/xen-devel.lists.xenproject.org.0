Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7FF6A788F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 01:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504281.776889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXXGE-0004LW-L5; Thu, 02 Mar 2023 00:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504281.776889; Thu, 02 Mar 2023 00:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXXGE-0004JK-I2; Thu, 02 Mar 2023 00:57:30 +0000
Received: by outflank-mailman (input) for mailman id 504281;
 Thu, 02 Mar 2023 00:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tCB=62=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXXGD-00042w-BD
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 00:57:29 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c6d130-b895-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 01:57:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72948B811D5;
 Thu,  2 Mar 2023 00:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629F5C433EF;
 Thu,  2 Mar 2023 00:57:25 +0000 (UTC)
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
X-Inumbo-ID: 33c6d130-b895-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677718646;
	bh=l3p5CzfPCMHZRdXXtESCrWVMuXmzOEmp1Lvn+kITVB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=izzcOEiqP9KlXoUZkB5z8F3fqAXDDdsIU9xC6h4bIWOapRKqAW9rLo3ermWf5GDE9
	 PBlX73VYgwFE6LewERpJ2aRFogoYkS2eXrfEQKv08QeDHy2y0tUI2yZZvJXd9UlbL3
	 6NLcQS0JVNFSVlGlqD26CJZZUQpqoKoujH1HLqggfm10PHjdHCAwkNYrBH8zTGv3fb
	 1WUkZob0EA9P8GLfIoxMpwuCTqeAV6b3MHAoogVuRCo0uXfiEqXD5vgcTgrmxn5Eho
	 mvTFMXbU2oQs/Izg8y+D4ZfTDVz9C59vcxOe/cy9tzh7NXv3JdeTA7wqFA5frYvomQ
	 BK5v2CdfRIKOg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 1/2] automation: add Ubuntu container for Xilinx hardware tests
Date: Wed,  1 Mar 2023 16:57:21 -0800
Message-Id: <20230302005722.665641-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2303011652300.3680@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2303011652300.3680@ubuntu-linux-20-04-desktop>
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


