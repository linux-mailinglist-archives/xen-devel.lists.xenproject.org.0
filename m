Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4829318C5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759064.1168641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOrT-0007hU-Le; Mon, 15 Jul 2024 16:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759064.1168641; Mon, 15 Jul 2024 16:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOrT-0007fh-HP; Mon, 15 Jul 2024 16:47:39 +0000
Received: by outflank-mailman (input) for mailman id 759064;
 Mon, 15 Jul 2024 16:47:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3wo=OP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sTOrR-0006CY-AE
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:47:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f02873b5-42c9-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 18:47:35 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.163.111.28])
 by support.bugseng.com (Postfix) with ESMTPSA id 9C4B64EE0739;
 Mon, 15 Jul 2024 18:47:34 +0200 (CEST)
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
X-Inumbo-ID: f02873b5-42c9-11ef-8776-851b0ebba9a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v4 3/9] x86/domctl: address a violation of MISRA C Rule 16.3
Date: Mon, 15 Jul 2024 18:47:16 +0200
Message-Id: <759ef52606d90ec0efed9fc6d87fd432a42f7cc4.1721050709.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721050709.git.federico.serafini@bugseng.com>
References: <cover.1721050709.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statement to address a violation of
MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


