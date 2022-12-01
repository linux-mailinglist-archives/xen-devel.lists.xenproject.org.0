Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE663F2CB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 15:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450780.708240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kVl-00028s-8R; Thu, 01 Dec 2022 14:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450780.708240; Thu, 01 Dec 2022 14:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kVl-00024m-2u; Thu, 01 Dec 2022 14:26:01 +0000
Received: by outflank-mailman (input) for mailman id 450780;
 Thu, 01 Dec 2022 14:26:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecKG=37=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1p0kVk-0001kY-0X
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 14:26:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 134ff323-7184-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 15:25:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 646AFED1;
 Thu,  1 Dec 2022 06:26:05 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CCC43F73D;
 Thu,  1 Dec 2022 06:25:58 -0800 (PST)
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
X-Inumbo-ID: 134ff323-7184-11ed-8fd2-01056ac49cbb
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 2/3] automation: Add a clean rule for containers
Date: Thu,  1 Dec 2022 14:25:31 +0000
Message-Id: <b802d2523af791acfdb68b6f8603ff2f0f8573d6.1669904508.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904508.git.bertrand.marquis@arm.com>
References: <cover.1669904508.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add make clean support to remove the containers from the local docker
registry.
make clean-<image_name> must be called to remove an image:
make clean-yocto/kirkstone-qemuarm: remove yocto kirkstone for qemuarm
image

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v6:
- Rework clean rule to prevent calling docker during make parsing
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
index c4aaa747ffdf..f1d56ce532a1 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -28,3 +28,13 @@ all: $(CONTAINERS)
 clean:
 	rm -f yocto/*.dockerfile
 
+define CLEAN_RULE
+.PHONY: clean-$(1)
+clean-$(1):
+	if [ -n "$$$$(docker image ls -q $(REGISTRY)/$(subst /,:,$(1)))" ]; then \
+		docker image rm $(REGISTRY)/$(subst /,:,$(1)); \
+	fi
+
+endef
+
+$(eval $(foreach img,$(CONTAINERS) $(CONTAINERS_EXTRA),$(call CLEAN_RULE,$(img))))
-- 
2.25.1


