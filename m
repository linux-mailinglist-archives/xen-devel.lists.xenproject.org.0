Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD5787E906
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694613.1083530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ8-00028Z-9c; Mon, 18 Mar 2024 11:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694613.1083530; Mon, 18 Mar 2024 11:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ8-00023G-0Z; Mon, 18 Mar 2024 11:54:06 +0000
Received: by outflank-mailman (input) for mailman id 694613;
 Mon, 18 Mar 2024 11:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QoDm=KY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rmBZ6-0001F2-QP
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:54:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 368b82dd-e51e-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 12:54:02 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 7C43A4EE0747;
 Mon, 18 Mar 2024 12:54:01 +0100 (CET)
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
X-Inumbo-ID: 368b82dd-e51e-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH 05/10] EFI: address violations of MISRA C Rule 20.7
Date: Mon, 18 Mar 2024 12:53:48 +0100
Message-Id: <66095ff2496d9b2be701877a3df762293fc8708b.1710762555.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710762555.git.nicola.vetrini@bugseng.com>
References: <cover.1710762555.git.nicola.vetrini@bugseng.com>
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
This file is matched by exclude-list.json, but the fix is rather trivial
and actually benefits code that is in scope for compliance.
---
 xen/include/efi/efierr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/efi/efierr.h b/xen/include/efi/efierr.h
index dfd3d3cf4867..2ecde0b31302 100644
--- a/xen/include/efi/efierr.h
+++ b/xen/include/efi/efierr.h
@@ -22,7 +22,7 @@ Revision History
 
 
 #define EFIWARN(a)                            (a)
-#define EFI_ERROR(a)              (((INTN) a) < 0)
+#define EFI_ERROR(a)              (((INTN)(a)) < 0)
 
 
 #define EFI_SUCCESS                             0
-- 
2.34.1


