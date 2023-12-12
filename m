Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F348780F137
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653194.1019570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4pg-00011D-KH; Tue, 12 Dec 2023 15:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653194.1019570; Tue, 12 Dec 2023 15:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4pg-0000rm-C1; Tue, 12 Dec 2023 15:38:04 +0000
Received: by outflank-mailman (input) for mailman id 653194;
 Tue, 12 Dec 2023 15:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0UEi=HX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rD4pe-0000ZS-KY
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:38:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e0817e9-9904-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 16:38:00 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-82-60-45-193.retail.telecomitalia.it [82.60.45.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 891544EE0C8D;
 Tue, 12 Dec 2023 16:37:59 +0100 (CET)
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
X-Inumbo-ID: 6e0817e9-9904-11ee-9b0f-b553b5be7939
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
Subject: [XEN PATCH 1/4] xen/compat: address violations of MISRA C:2012 Rule 8.2
Date: Tue, 12 Dec 2023 16:37:39 +0100
Message-Id: <6a3bd7a3e4fa83c2c176894f756bd2e24c0f3ee0.1702394721.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702394721.git.federico.serafini@bugseng.com>
References: <cover.1702394721.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/compat.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/compat.h b/xen/include/xen/compat.h
index 41a5d61eef..7ec9d6567e 100644
--- a/xen/include/xen/compat.h
+++ b/xen/include/xen/compat.h
@@ -232,9 +232,10 @@ int hypercall_xlat_continuation(unsigned int *id, unsigned int nr,
 
 /* In-place translation functons: */
 struct start_info;
-void xlat_start_info(struct start_info *, enum XLAT_start_info_console);
+void xlat_start_info(struct start_info *native,
+                     enum XLAT_start_info_console console);
 struct vcpu_runstate_info;
-void xlat_vcpu_runstate_info(struct vcpu_runstate_info *);
+void xlat_vcpu_runstate_info(struct vcpu_runstate_info *native);
 
 #else
 
-- 
2.34.1


