Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87382777325
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581925.911410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DJ-0005ju-0l; Thu, 10 Aug 2023 08:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581925.911410; Thu, 10 Aug 2023 08:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DI-0005gS-SG; Thu, 10 Aug 2023 08:40:12 +0000
Received: by outflank-mailman (input) for mailman id 581925;
 Thu, 10 Aug 2023 08:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZIv=D3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qU1DH-0005Mc-Aj
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:40:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d9acf43-3759-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 10:39:59 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D242D4EE0742;
 Thu, 10 Aug 2023 10:40:08 +0200 (CEST)
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
X-Inumbo-ID: 7d9acf43-3759-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [XEN PATCH v2 2/7] xen: make 'saved_cmdline' static
Date: Thu, 10 Aug 2023 10:39:42 +0200
Message-Id: <3a3f56b54b7051a9a741f5b54e8bc266b451c5e4.1691655814.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691655814.git.nicola.vetrini@bugseng.com>
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'saved_cmdline' can be defined static,
as its only uses are within the same file. This in turn avoids
violating Rule 8.4 because no declaration is present.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: e6ee01ad24b6 ("xen/version: Drop compat/kernel.c")
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Revised commit message
---
 xen/common/kernel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index fb919f3d9c38..52aa28762782 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -28,7 +28,7 @@ CHECK_feature_info;
 
 enum system_state system_state = SYS_STATE_early_boot;
 
-xen_commandline_t saved_cmdline;
+static xen_commandline_t saved_cmdline;
 static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
 
 static int assign_integer_param(const struct kernel_param *param, uint64_t val)
-- 
2.34.1


