Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED56891586
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 10:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699284.1092053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H8-0002d2-4m; Fri, 29 Mar 2024 09:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699284.1092053; Fri, 29 Mar 2024 09:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H8-0002XR-0S; Fri, 29 Mar 2024 09:11:50 +0000
Received: by outflank-mailman (input) for mailman id 699284;
 Fri, 29 Mar 2024 09:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LGMC=LD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rq8H6-0000ww-5X
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 09:11:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5de8bcc3-edac-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 10:11:46 +0100 (CET)
Received: from nico.bugseng.com (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id 8F3F84EE0C8D;
 Fri, 29 Mar 2024 10:11:45 +0100 (CET)
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
X-Inumbo-ID: 5de8bcc3-edac-11ee-a1ef-f123f15fe8a2
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
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 7/7] x86/amd: address violations of MISRA C Rule 20.7
Date: Fri, 29 Mar 2024 10:11:35 +0100
Message-Id: <aa2c6d47927f76b12d1f30dc2eb1a6f15ba34dea.1711700095.git.nicola.vetrini@bugseng.com>
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
 xen/arch/x86/include/asm/amd.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 2cc0ce2e9fd2..fa4e0fc766aa 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -119,7 +119,8 @@
 #define AMD_LEGACY_ERRATUM(...)         -1 /* legacy */, __VA_ARGS__, 0
 #define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
 #define AMD_MODEL_RANGE(f, m_start, s_start, m_end, s_end)              \
-    ((f << 24) | (m_start << 16) | (s_start << 12) | (m_end << 4) | (s_end))
+    (((f) << 24) | ((m_start) << 16) | ((s_start) << 12) | \
+     ((m_end) << 4) | (s_end))
 #define AMD_MODEL_RANGE_FAMILY(range)   (((range) >> 24) & 0xff)
 #define AMD_MODEL_RANGE_START(range)    (((range) >> 12) & 0xfff)
 #define AMD_MODEL_RANGE_END(range)      ((range) & 0xfff)
-- 
2.34.1


