Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C677B9BE7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 10:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612885.953032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJzU-0001uQ-2k; Thu, 05 Oct 2023 08:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612885.953032; Thu, 05 Oct 2023 08:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJzT-0001pM-UD; Thu, 05 Oct 2023 08:45:51 +0000
Received: by outflank-mailman (input) for mailman id 612885;
 Thu, 05 Oct 2023 08:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA9v=FT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qoJzS-0001nQ-5v
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 08:45:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955a36f4-635b-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 10:45:49 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 9D8734EE073A;
 Thu,  5 Oct 2023 10:45:48 +0200 (CEST)
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
X-Inumbo-ID: 955a36f4-635b-11ee-98d3-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 2/2] xen/spinlock: fix use of 0 as a null pointer constant
Date: Thu,  5 Oct 2023 10:45:20 +0200
Message-Id: <44395904e6cca0cc83a9d01abbc50047ecba961e.1696494834.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696494834.git.nicola.vetrini@bugseng.com>
References: <cover.1696494834.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The constant 0 is used as a null pointer constant, in
violation of MISRA C:2012 Rule 11.9, in builds with
CONFIG_DEBUG_LOCK_PROFILE defined.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Release builds should not be impacted by this
---
 xen/include/xen/spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index e7a1c1aa8988..16d933ae7ebe 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -94,7 +94,7 @@ struct lock_profile_qhead {
     int32_t                   idx;     /* index for printout */
 };
 
-#define _LOCK_PROFILE(name) { 0, #name, &name, 0, 0, 0, 0, 0 }
+#define _LOCK_PROFILE(name) { NULL, #name, &name, 0, 0, 0, 0, 0 }
 #define _LOCK_PROFILE_PTR(name)                                               \
     static struct lock_profile * const __lock_profile_##name                  \
     __used_section(".lockprofile.data") =                                     \
-- 
2.34.1


