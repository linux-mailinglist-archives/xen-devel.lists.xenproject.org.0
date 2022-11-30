Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0773863D554
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 13:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449848.706865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0M0H-0006Gn-SG; Wed, 30 Nov 2022 12:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449848.706865; Wed, 30 Nov 2022 12:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0M0H-0006Dr-O4; Wed, 30 Nov 2022 12:15:53 +0000
Received: by outflank-mailman (input) for mailman id 449848;
 Wed, 30 Nov 2022 12:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz7r=36=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1p0M0G-0005h2-8z
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 12:15:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b9e5904a-70a8-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 13:15:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 932D21042;
 Wed, 30 Nov 2022 04:15:55 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51D583F73D;
 Wed, 30 Nov 2022 04:15:48 -0800 (PST)
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
X-Inumbo-ID: b9e5904a-70a8-11ed-91b6-6bf2151ebd3b
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 2/3] automation: Add a clean rule for containers
Date: Wed, 30 Nov 2022 12:15:08 +0000
Message-Id: <f793cc70fdb6802b66156a8756bf676fbac0d809.1669810269.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669810269.git.bertrand.marquis@arm.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add make clean support to remove the containers from the local docker
registry.
make clean-<image_name> must be called to remove an image:
make clean-yocto/kirkstone-qemuarm: remove yocto kirkstone for qemuarm
image

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v5:
- remove cleaning of all images using make clean
Changes in v4:
- also generate clean rule for CONTAINERS_EXTRA
Changes in v3:
- none
Changes in v2:
- none
Changes in v1:
- patch added
---
 automation/build/Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/automation/build/Makefile b/automation/build/Makefile
index 72a5335baec1..4cbb1365f94e 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -28,3 +28,13 @@ all: $(CONTAINERS)
 clean:
 	rm -f yocto/*.dockerfiles
 
+define CLEAN_RULE
+.PHONY: clean-$(1)
+clean-$(1):
+ifneq ($$(shell docker image ls -q $(REGISTRY)/$(subst /,:,$(1))),)
+	docker image rm $(REGISTRY)/$(subst /,:,$(1))
+endif
+
+endef
+
+$(eval $(foreach img,$(CONTAINERS) $(CONTAINERS_EXTRA),$(call CLEAN_RULE,$(img))))
-- 
2.25.1


