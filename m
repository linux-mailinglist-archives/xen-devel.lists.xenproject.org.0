Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E9777322
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581922.911391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DI-0005Py-23; Thu, 10 Aug 2023 08:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581922.911391; Thu, 10 Aug 2023 08:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DH-0005Mu-VX; Thu, 10 Aug 2023 08:40:11 +0000
Received: by outflank-mailman (input) for mailman id 581922;
 Thu, 10 Aug 2023 08:40:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZIv=D3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qU1DF-0005MW-Om
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:40:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 833e8d0a-3759-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 10:40:09 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 03E094EE0741;
 Thu, 10 Aug 2023 10:40:07 +0200 (CEST)
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
X-Inumbo-ID: 833e8d0a-3759-11ee-b283-6b7b168915f2
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
Subject: [XEN PATCH v2 1/7] xen/memory: make 'ioreq_server_max_frames' static
Date: Thu, 10 Aug 2023 10:39:41 +0200
Message-Id: <7f0d3f4330a262ec17029b3d82a7a89409215fbf.1691655814.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691655814.git.nicola.vetrini@bugseng.com>
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The function 'ioreq_server_max_frames' can be defined static,
as its only uses are within the same file. This in turn avoids
violating Rule 8.4 because no declaration is present.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: 9244528955de ("xen/memory: Fix acquire_resource size semantics”)
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Revised commit message
---
 xen/common/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index c206fa48087d..b1dcbaf551e6 100644
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


