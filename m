Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E093F089
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 11:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766474.1177013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEz-0001zj-DQ; Mon, 29 Jul 2024 09:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766474.1177013; Mon, 29 Jul 2024 09:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEy-0001sH-V0; Mon, 29 Jul 2024 09:00:24 +0000
Received: by outflank-mailman (input) for mailman id 766474;
 Mon, 29 Jul 2024 09:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqVw=O5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sYMEw-0000M4-6r
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 09:00:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fadf6cce-4d88-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 11:00:19 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-87-20-207-105.retail.telecomitalia.it [87.20.207.105])
 by support.bugseng.com (Postfix) with ESMTPSA id D3B3A4EE0763;
 Mon, 29 Jul 2024 11:00:18 +0200 (CEST)
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
X-Inumbo-ID: fadf6cce-4d88-11ef-8776-851b0ebba9a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v5 7/8] x86/mm: add defensive return
Date: Mon, 29 Jul 2024 11:00:08 +0200
Message-Id: <24501d2e7f5d82d8e5a483a80b35e04ce765a7cf.1722239813.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722239813.git.federico.serafini@bugseng.com>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defensive return statement at the end of an unreachable
default case. Other than improve safety, this meets the requirements
to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
statement shall terminate every switch-clause".

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
No changes from v3 and v4, further feedback on this thread would be appreciated:
https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00474.html
---
 xen/arch/x86/mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 95795567f2..8973e76dff 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -917,6 +917,7 @@ get_page_from_l1e(
                 return 0;
             default:
                 ASSERT_UNREACHABLE();
+                return -EPERM;
             }
         }
         else if ( l1f & _PAGE_RW )
-- 
2.34.1


