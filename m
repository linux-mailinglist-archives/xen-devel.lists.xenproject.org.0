Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D24B87E8FF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694611.1083514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ7-0001qf-CM; Mon, 18 Mar 2024 11:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694611.1083514; Mon, 18 Mar 2024 11:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ7-0001kp-71; Mon, 18 Mar 2024 11:54:05 +0000
Received: by outflank-mailman (input) for mailman id 694611;
 Mon, 18 Mar 2024 11:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QoDm=KY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rmBZ5-0001F2-KM
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:54:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3594ff97-e51e-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 12:54:00 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 17AE44EE073F;
 Mon, 18 Mar 2024 12:54:00 +0100 (CET)
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
X-Inumbo-ID: 3594ff97-e51e-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH 02/10] AMD/IOMMU: guest: address violations of MISRA C Rule 20.7
Date: Mon, 18 Mar 2024 12:53:45 +0100
Message-Id: <b207f43e618d19292aa95809d13fbf86cf5ba2a8.1710762555.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710762555.git.nicola.vetrini@bugseng.com>
References: <cover.1710762555.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This local helper may disappear as a follow-up to [1], if the function that
remains there after the cleanup ends up being removed, so this patch has a slight
dependency on what follows up from that thread (in which case it can be dropped).

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2403151724380.853156@ubuntu-linux-20-04-desktop/T/#m9474ad4f35830345a22acd4a665245f7085d4b46
---
 xen/drivers/passthrough/amd/iommu_guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
index 4c4252eea116..5bfaa48d9d65 100644
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -30,7 +30,7 @@
 #define GUEST_ADDRESS_SIZE_6_LEVEL              0x2
 #define HOST_ADDRESS_SIZE_6_LEVEL               0x2
 
-#define reg_to_u64(reg) (((uint64_t)reg.hi << 32) | reg.lo )
+#define reg_to_u64(reg) (((uint64_t)((reg).hi << 32)) | (reg).lo )
 #define u64_to_reg(reg, val) \
     do \
     { \
-- 
2.34.1


