Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B875762D737
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 10:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444828.699928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbO1-0002T4-OG; Thu, 17 Nov 2022 09:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444828.699928; Thu, 17 Nov 2022 09:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbO1-0002PW-LF; Thu, 17 Nov 2022 09:40:45 +0000
Received: by outflank-mailman (input) for mailman id 444828;
 Thu, 17 Nov 2022 09:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sbrt=3R=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1ovbNz-0001D0-QU
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 09:40:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e74c36f9-665b-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 10:40:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A247B1477;
 Thu, 17 Nov 2022 01:40:48 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A08ED3F73B;
 Thu, 17 Nov 2022 01:40:41 -0800 (PST)
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
X-Inumbo-ID: e74c36f9-665b-11ed-8fd2-01056ac49cbb
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/3] automation: Add a clean rule for containers
Date: Thu, 17 Nov 2022 09:39:50 +0000
Message-Id: <3a127e836d744fbb2954690293ee47d2c0c899e2.1668677493.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668677493.git.bertrand.marquis@arm.com>
References: <cover.1668677493.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add make clean support to remove the containers from the local docker
registry:
- make clean: remove all images
- clean-yocto/kirkstone-qemuarm: remove yocto kirkstone for qemuarm
image

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v4:
- also generate clean rule for CONTAINERS_EXTRA
Changes in v3:
- none
Changes in v2:
- none
Changes in v1:
- patch added
---
 automation/build/Makefile | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/automation/build/Makefile b/automation/build/Makefile
index 72a5335baec1..5b5f10c63ea4 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -28,3 +28,15 @@ all: $(CONTAINERS)
 clean:
 	rm -f yocto/*.dockerfiles
 
+define CLEAN_RULE
+.PHONY: clean-$(1)
+clean-$(1):
+ifneq ($$(shell docker image ls -q $(REGISTRY)/$(subst /,:,$(1))),)
+	docker image rm $(REGISTRY)/$(subst /,:,$(1))
+endif
+
+clean: clean-$(1)
+
+endef
+
+$(eval $(foreach img,$(CONTAINERS) $(CONTAINERS_EXTRA),$(call CLEAN_RULE,$(img))))
-- 
2.25.1


