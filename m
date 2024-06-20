Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B25F9106C6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 15:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744505.1151546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICk-0008C7-DZ; Thu, 20 Jun 2024 13:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744505.1151546; Thu, 20 Jun 2024 13:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICk-0008Aa-A3; Thu, 20 Jun 2024 13:51:58 +0000
Received: by outflank-mailman (input) for mailman id 744505;
 Thu, 20 Jun 2024 13:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKICi-0008AF-Ot
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 13:51:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4185b786-2f0c-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 15:51:55 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id 384184EE0739;
 Thu, 20 Jun 2024 15:51:55 +0200 (CEST)
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
X-Inumbo-ID: 4185b786-2f0c-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>
Subject: [XEN PATCH 03/13] x86/domctl: address a violation of MISRA C Rule 16.3
Date: Thu, 20 Jun 2024 15:51:37 +0200
Message-Id: <a9a7eefc36c74bc16d7ce8ce10be188974667379.1718890095.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
References: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statement to address a violation of MISRA C Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/domctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9190e11faa..68b5b46d1a 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -517,6 +517,7 @@ long arch_do_domctl(
 
         default:
             ret = -ENOSYS;
+            break;
         }
         break;
     }
-- 
2.34.1


