Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766047E07E0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 18:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627301.978250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyyRo-0008In-2C; Fri, 03 Nov 2023 17:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627301.978250; Fri, 03 Nov 2023 17:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyyRn-0008HX-Vr; Fri, 03 Nov 2023 17:59:07 +0000
Received: by outflank-mailman (input) for mailman id 627301;
 Fri, 03 Nov 2023 17:59:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozhd=GQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qyyRm-0008HR-ID
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 17:59:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac64f3c5-7a72-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 18:59:04 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 63FF74EE0744;
 Fri,  3 Nov 2023 18:59:01 +0100 (CET)
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
X-Inumbo-ID: ac64f3c5-7a72-11ee-98d8-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis tools
Date: Fri,  3 Nov 2023 18:58:58 +0100
Message-Id: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static analysis tools may detect a possible null
pointer dereference at line 760 (the memcpy call)
of xen/common/domain.c. This ASSERT helps them in
detecting that such a condition is not possible
and also provides a basic sanity check.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
The check may be later improved by proper error checking
instead of relying on the semantics explained here:
https://lore.kernel.org/xen-devel/61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com/

This addresses the caution reported by ECLAIR for MISRA C:2012 D4.11
---
 xen/common/domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8f9ab01c0cb7..9378c0417645 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -700,6 +700,8 @@ struct domain *domain_create(domid_t domid,
 
     if ( !is_idle_domain(d) )
     {
+        ASSERT(config);
+
         watchdog_domain_init(d);
         init_status |= INIT_watchdog;
 
-- 
2.34.1

