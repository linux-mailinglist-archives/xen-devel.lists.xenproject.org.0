Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DBD59FDA6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392783.631389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrpM-0005M4-SF; Wed, 24 Aug 2022 14:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392783.631389; Wed, 24 Aug 2022 14:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrpM-0005Gy-LZ; Wed, 24 Aug 2022 14:57:56 +0000
Received: by outflank-mailman (input) for mailman id 392783;
 Wed, 24 Aug 2022 14:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oQrpK-0004Xz-FP
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:57:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 212b727c-23bd-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 16:57:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B546415A1;
 Wed, 24 Aug 2022 07:57:56 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B8A53F67D;
 Wed, 24 Aug 2022 07:57:51 -0700 (PDT)
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
X-Inumbo-ID: 212b727c-23bd-11ed-bd2e-47488cf2e6aa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 4/4] automation: Add a clean rule for containers
Date: Wed, 24 Aug 2022 15:57:20 +0100
Message-Id: <3942d90afde0714a7c4d28d92ed31624773cb933.1661352827.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661352827.git.bertrand.marquis@arm.com>
References: <cover.1661352827.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add make clean support to remove the containers from the local docker
registry:
- make clean: remove all images
- clean-yocto/kirkstone-qemuarm: remove yocto kirkstone for qemuarm
image

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v1:
- patch added
---
 automation/build/Makefile | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/automation/build/Makefile b/automation/build/Makefile
index b0dc68f00b70..9fbb49c8717e 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -4,6 +4,17 @@ REGISTRY := registry.gitlab.com/xen-project/xen
 CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
 DOCKER_CMD ?= docker
 
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
 help:
 	@echo "Builds containers for building Xen based on different distros"
 	@echo "To build one run 'make DISTRO/VERSION'. Available containers:"
@@ -18,5 +29,9 @@ help:
 
 $(subst .dockerfile,,$(wildcard yocto/kirkstone-*)): yocto/kirkstone
 
-.PHONY: all
+.PHONY: all clean
 all: $(CONTAINERS)
+
+clean:
+
+$(eval $(foreach img,$(CONTAINERS),$(call CLEAN_RULE,$(img))))
-- 
2.25.1


