Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12069318D5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759101.1168790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOtD-0006F4-FA; Mon, 15 Jul 2024 16:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759101.1168790; Mon, 15 Jul 2024 16:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOtD-0006BC-BM; Mon, 15 Jul 2024 16:49:27 +0000
Received: by outflank-mailman (input) for mailman id 759101;
 Mon, 15 Jul 2024 16:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3wo=OP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sTOtA-0003ll-TQ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:49:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 304cbd67-42ca-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 18:49:23 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.163.111.28])
 by support.bugseng.com (Postfix) with ESMTPSA id 83A7D4EE073E;
 Mon, 15 Jul 2024 18:49:21 +0200 (CEST)
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
X-Inumbo-ID: 304cbd67-42ca-11ef-8776-851b0ebba9a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v4 8/9] x86/mm: add defensive return
Date: Mon, 15 Jul 2024 18:48:59 +0200
Message-Id: <de98fe0d6b36383b6eb8d1a9b077b0b387ae0848.1721050709.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721050709.git.federico.serafini@bugseng.com>
References: <cover.1721050709.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defensive return statement at the end of an unreachable
default case. Other than improve safety, this meets the requirements
to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
statement shall terminate every switch-clause".

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
No changes from v3, further feedback on this thread would be appreciated:
https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00474.html
---
 xen/arch/x86/mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 648d6dd475..a1e28b3360 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -916,6 +916,7 @@ get_page_from_l1e(
                 return 0;
             default:
                 ASSERT_UNREACHABLE();
+                return -EPERM;
             }
         }
         else if ( l1f & _PAGE_RW )
-- 
2.34.1


