Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF219613899
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432888.685595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVM5-0004sf-Q7; Mon, 31 Oct 2022 14:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432888.685595; Mon, 31 Oct 2022 14:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVM5-0004hm-HA; Mon, 31 Oct 2022 14:01:33 +0000
Received: by outflank-mailman (input) for mailman id 432888;
 Mon, 31 Oct 2022 14:01:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+oh=3A=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1opVM3-0004Ib-OT
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 14:01:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 83773202-5924-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 15:01:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ACE8113E;
 Mon, 31 Oct 2022 07:01:36 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 972413F5A1;
 Mon, 31 Oct 2022 07:01:29 -0700 (PDT)
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
X-Inumbo-ID: 83773202-5924-11ed-8fd0-01056ac49cbb
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/4] automation: Add a clean rule for containers
Date: Mon, 31 Oct 2022 14:00:55 +0000
Message-Id: <08c3c29a85d0857ec7652f86c66e801bf0bc3e89.1667224593.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667224593.git.bertrand.marquis@arm.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add make clean support to remove the containers from the local docker
registry:
- make clean: remove all images
- clean-yocto/kirkstone-qemuarm: remove yocto kirkstone for qemuarm
image

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v3:
- none
Changes in v2:
- none
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


