Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854F691074A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744618.1151763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN9-0001UK-Ng; Thu, 20 Jun 2024 14:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744618.1151763; Thu, 20 Jun 2024 14:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN9-0001PU-82; Thu, 20 Jun 2024 14:02:43 +0000
Received: by outflank-mailman (input) for mailman id 744618;
 Thu, 20 Jun 2024 14:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKIN7-0007p3-8W
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:02:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1323561-2f0d-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 16:02:39 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id 9B80D4EE0755;
 Thu, 20 Jun 2024 16:02:38 +0200 (CEST)
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
X-Inumbo-ID: c1323561-2f0d-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 09/13] x86/mm: add defensive return
Date: Thu, 20 Jun 2024 16:02:20 +0200
Message-Id: <282da9981826370ca839503477fb515af14ff4b5.1718892030.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718892030.git.federico.serafini@bugseng.com>
References: <cover.1718892030.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defensive return statement at the end of an unreachable
default case. Other than improve safety, this meets the requirements
to deviate a violation of MISRA C Rule 16.3.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 648d6dd475..2e19ced15e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -916,6 +916,7 @@ get_page_from_l1e(
                 return 0;
             default:
                 ASSERT_UNREACHABLE();
+                return 0;
             }
         }
         else if ( l1f & _PAGE_RW )
-- 
2.34.1


