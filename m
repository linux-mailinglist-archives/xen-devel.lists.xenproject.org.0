Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588437D5416
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622037.969162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRm-0006u1-8j; Tue, 24 Oct 2023 14:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622037.969162; Tue, 24 Oct 2023 14:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIRm-0006q9-4N; Tue, 24 Oct 2023 14:31:54 +0000
Received: by outflank-mailman (input) for mailman id 622037;
 Tue, 24 Oct 2023 14:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CvU=GG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvIRj-0006O8-Fy
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:31:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ff47a84-727a-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 16:31:47 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id BE6584EE074A;
 Tue, 24 Oct 2023 16:31:46 +0200 (CEST)
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
X-Inumbo-ID: 0ff47a84-727a-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [RFC 4/4] amd/iommu: fully initialize array in 'flush_command_buffer'
Date: Tue, 24 Oct 2023 16:31:38 +0200
Message-Id: <b772842fccacc4fb108ff515bdcad6f2877b6b12.1698155925.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698155925.git.nicola.vetrini@bugseng.com>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fully explicit initialization of the cmd array resolves a violation of
MISRA C:2012 Rule 9.3.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/passthrough/amd/iommu_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index cb28b36abc38..49b9fcac9410 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -66,7 +66,8 @@ static void flush_command_buffer(struct amd_iommu *iommu,
                          IOMMU_COMP_WAIT_S_FLAG_MASK),
         (addr >> 32) | MASK_INSR(IOMMU_CMD_COMPLETION_WAIT,
                                  IOMMU_CMD_OPCODE_MASK),
-        CMD_COMPLETION_DONE
+        CMD_COMPLETION_DONE,
+        0
     };
     s_time_t start, timeout;
     static unsigned int __read_mostly threshold = 1;
--
2.34.1

