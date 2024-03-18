Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1436087E8FC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694618.1083587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZD-0003bw-3e; Mon, 18 Mar 2024 11:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694618.1083587; Mon, 18 Mar 2024 11:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZC-0003YJ-Po; Mon, 18 Mar 2024 11:54:10 +0000
Received: by outflank-mailman (input) for mailman id 694618;
 Mon, 18 Mar 2024 11:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QoDm=KY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rmBZA-0001F2-Qm
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:54:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 396893e5-e51e-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 12:54:07 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 3870D4EE0C8A;
 Mon, 18 Mar 2024 12:54:06 +0100 (CET)
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
X-Inumbo-ID: 396893e5-e51e-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 10/10] xen/sched: address violations of MISRA C Rule 20.7
Date: Mon, 18 Mar 2024 12:53:53 +0100
Message-Id: <0c584c738f744a583497f1fb862d753836d8b249.1710762555.git.nicola.vetrini@bugseng.com>
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
 xen/common/sched/private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 459d1dfb11a5..c0e7c96d24f4 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -540,7 +540,7 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
 }
 
 #define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
-  __used_section(".data.schedulers") = &x
+  __used_section(".data.schedulers") = &(x)
 
 struct cpupool
 {
-- 
2.34.1


