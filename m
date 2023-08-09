Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E9D7759BE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580899.909401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxw-00085v-0L; Wed, 09 Aug 2023 11:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580899.909401; Wed, 09 Aug 2023 11:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgxv-00080q-Rx; Wed, 09 Aug 2023 11:02:59 +0000
Received: by outflank-mailman (input) for mailman id 580899;
 Wed, 09 Aug 2023 11:02:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTgxu-0007K6-1h
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:02:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b441916-36a4-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 13:02:56 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4F6E74EE0742;
 Wed,  9 Aug 2023 13:02:55 +0200 (CEST)
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
X-Inumbo-ID: 4b441916-36a4-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH 2/8] xen/memory: address MISRA C:2012 Rule 8.4
Date: Wed,  9 Aug 2023 13:02:35 +0200
Message-Id: <844e7bf57c2eb7b20d8b1f81a7730a7612f1b6ac.1691575243.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691575243.git.nicola.vetrini@bugseng.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function 'ioreq_server_max_frames' can be defined static,
as its only uses are within the same file. This in turn avoids
violating Rule 8.4 because no declaration is present.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index c206fa4808..b1dcbaf551 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1120,7 +1120,7 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
     return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
 }
 
-unsigned int ioreq_server_max_frames(const struct domain *d)
+static unsigned int ioreq_server_max_frames(const struct domain *d)
 {
     unsigned int nr = 0;
 
-- 
2.34.1


