Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40786CCE9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687199.1070299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKY-0001cw-EU; Thu, 29 Feb 2024 15:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687199.1070299; Thu, 29 Feb 2024 15:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKY-0001Vj-43; Thu, 29 Feb 2024 15:28:18 +0000
Received: by outflank-mailman (input) for mailman id 687199;
 Thu, 29 Feb 2024 15:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfiKW-0008Ql-Nu
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:28:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27e30321-d717-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 16:28:15 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 2F2B24EE0750;
 Thu, 29 Feb 2024 16:28:14 +0100 (CET)
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
X-Inumbo-ID: 27e30321-d717-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 09/10] xen/include: tasklet: address violations of MISRA C Rule 20.7
Date: Thu, 29 Feb 2024 16:28:01 +0100
Message-Id: <952d13bdb830cb1d8d3282e49333323bc8755cd5.1709219010.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709219010.git.nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
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
 xen/include/xen/tasklet.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/tasklet.h b/xen/include/xen/tasklet.h
index 593d6a2400fb..78760b694a39 100644
--- a/xen/include/xen/tasklet.h
+++ b/xen/include/xen/tasklet.h
@@ -27,7 +27,7 @@ struct tasklet
 
 #define _DECLARE_TASKLET(name, func, data, softirq)                     \
     struct tasklet name = {                                             \
-        LIST_HEAD_INIT(name.list), -1, softirq, 0, 0, func, data }
+        LIST_HEAD_INIT((name).list), -1, softirq, 0, 0, func, data }
 #define DECLARE_TASKLET(name, func, data)               \
     _DECLARE_TASKLET(name, func, data, 0)
 #define DECLARE_SOFTIRQ_TASKLET(name, func, data)       \
-- 
2.34.1


