Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0516917C7A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748591.1156409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwv-0006QV-Mc; Wed, 26 Jun 2024 09:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748591.1156409; Wed, 26 Jun 2024 09:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwv-0006Cz-3S; Wed, 26 Jun 2024 09:28:21 +0000
Received: by outflank-mailman (input) for mailman id 748591;
 Wed, 26 Jun 2024 09:28:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMOwt-0004l0-EE
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:28:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c632e85-339e-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 11:28:19 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.209.199.41])
 by support.bugseng.com (Postfix) with ESMTPSA id 264DB4EE0754;
 Wed, 26 Jun 2024 11:28:18 +0200 (CEST)
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
X-Inumbo-ID: 6c632e85-339e-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 09/12] x86/mm: add defensive return
Date: Wed, 26 Jun 2024 11:28:02 +0200
Message-Id: <acb26329a980809dda100825f52b05d0cc295315.1719383180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719383180.git.federico.serafini@bugseng.com>
References: <cover.1719383180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defensive return statement at the end of an unreachable
default case. Other than improve safety, this meets the requirements
to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
statement shall terminate every switch-clause".

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v3:
- do not return 0 (success).

Al least this version returns an error code but I am not sure about
which one to use.
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


