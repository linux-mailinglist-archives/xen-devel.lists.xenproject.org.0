Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF877759C3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580898.909383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxu-0007Ym-LQ; Wed, 09 Aug 2023 11:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580898.909383; Wed, 09 Aug 2023 11:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxu-0007TQ-HF; Wed, 09 Aug 2023 11:02:58 +0000
Received: by outflank-mailman (input) for mailman id 580898;
 Wed, 09 Aug 2023 11:02:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTgxt-0007Jy-En
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:02:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bbc57ce-36a4-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 13:02:57 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 16C204EE0743;
 Wed,  9 Aug 2023 13:02:56 +0200 (CEST)
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
X-Inumbo-ID: 4bbc57ce-36a4-11ee-b280-6b7b168915f2
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
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/8] xen: address MISRA C:2012 Rule 8.4
Date: Wed,  9 Aug 2023 13:02:36 +0200
Message-Id: <c010bbb270ff3b546d4790487cf973413ca2af26.1691575243.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691575243.git.nicola.vetrini@bugseng.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'saved_cmdline' can be defined static,
as its only uses are within the same file. This in turn avoids
violating Rule 8.4 because no declaration is present.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/kernel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index fb919f3d9c..52aa287627 100644
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


