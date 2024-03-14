Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E688F87BCBF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 13:25:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693179.1080907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkk95-0004pv-VP; Thu, 14 Mar 2024 12:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693179.1080907; Thu, 14 Mar 2024 12:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkk95-0004ml-SD; Thu, 14 Mar 2024 12:25:15 +0000
Received: by outflank-mailman (input) for mailman id 693179;
 Thu, 14 Mar 2024 12:25:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujj0=KU=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rkk94-0004mf-U1
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 12:25:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7c3289b-e1fd-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 13:25:12 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [78.209.105.118])
 by support.bugseng.com (Postfix) with ESMTPSA id 805554EE0739;
 Thu, 14 Mar 2024 13:25:11 +0100 (CET)
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
X-Inumbo-ID: e7c3289b-e1fd-11ee-a1ee-f123f15fe8a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] perfc: add pseudo-keyword fallthrough
Date: Thu, 14 Mar 2024 13:25:02 +0100
Message-Id: <47eb1f8316672af172d9c34bfa6e7dda6bd7ce37.1710403601.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pseudo-keyword fallthrough to make explicit the intention of the
code and meet requirements to deviate MISRA C:2012 Rule 16.3
("An unconditional `break' statement shall terminate every
switch-clause").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/perfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 7400667bf0..80480aa776 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -134,6 +134,7 @@ void cf_check perfc_reset(unsigned char key)
         case TYPE_SINGLE:
             for_each_online_cpu ( cpu )
                 per_cpu(perfcounters, cpu)[j] = 0;
+            fallthrough;
         case TYPE_S_SINGLE:
             ++j;
             break;
@@ -141,6 +142,7 @@ void cf_check perfc_reset(unsigned char key)
             for_each_online_cpu ( cpu )
                 memset(per_cpu(perfcounters, cpu) + j, 0,
                        perfc_info[i].nr_elements * sizeof(perfc_t));
+            fallthrough;
         case TYPE_S_ARRAY:
             j += perfc_info[i].nr_elements;
             break;
-- 
2.34.1


