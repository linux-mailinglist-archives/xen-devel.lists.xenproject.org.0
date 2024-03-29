Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36408891584
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 10:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699279.1091999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H4-0001KH-9u; Fri, 29 Mar 2024 09:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699279.1091999; Fri, 29 Mar 2024 09:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H4-0001DO-5t; Fri, 29 Mar 2024 09:11:46 +0000
Received: by outflank-mailman (input) for mailman id 699279;
 Fri, 29 Mar 2024 09:11:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LGMC=LD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rq8H3-0000x2-0j
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 09:11:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c11d5b4-edac-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 10:11:43 +0100 (CET)
Received: from nico.bugseng.com (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id 4DB7C4EE0744;
 Fri, 29 Mar 2024 10:11:42 +0100 (CET)
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
X-Inumbo-ID: 5c11d5b4-edac-11ee-afe3-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3 2/7] arm/public: address violations of MISRA C Rule 20.7
Date: Fri, 29 Mar 2024 10:11:30 +0100
Message-Id: <142c27a41cea7402a68035dd466db0b47487fb06.1711700095.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711700095.git.nicola.vetrini@bugseng.com>
References: <cover.1711700095.git.nicola.vetrini@bugseng.com>
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
 xen/include/public/arch-arm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index a25e87dbda3a..e167e14f8df9 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -209,7 +209,7 @@
     do {                                                    \
         __typeof__(&(hnd)) _sxghr_tmp = &(hnd);             \
         _sxghr_tmp->q = 0;                                  \
-        _sxghr_tmp->p = val;                                \
+        _sxghr_tmp->p = (val);                              \
     } while ( 0 )
 #define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
 
-- 
2.34.1


