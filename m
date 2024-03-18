Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C67287E902
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694615.1083560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZA-0002xF-VB; Mon, 18 Mar 2024 11:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694615.1083560; Mon, 18 Mar 2024 11:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZA-0002uf-LC; Mon, 18 Mar 2024 11:54:08 +0000
Received: by outflank-mailman (input) for mailman id 694615;
 Mon, 18 Mar 2024 11:54:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QoDm=KY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rmBZ8-0001F2-QW
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:54:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37a10472-e51e-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 12:54:04 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 0A9304EE0748;
 Mon, 18 Mar 2024 12:54:02 +0100 (CET)
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
X-Inumbo-ID: 37a10472-e51e-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 07/10] xen/efi: efibind: address violations of MISRA C Rule 20.7
Date: Mon, 18 Mar 2024 12:53:50 +0100
Message-Id: <d2bc16c1b2d00b85f4b1a96bd855bbfe38861e87.1710762555.git.nicola.vetrini@bugseng.com>
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
and impacts code that in under the scope of MISRA compliance.
---
 xen/arch/arm/include/asm/arm64/efibind.h  | 4 ++--
 xen/arch/x86/include/asm/x86_64/efibind.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
index f13eadd4f0ab..a1323d452e2e 100644
--- a/xen/arch/arm/include/asm/arm64/efibind.h
+++ b/xen/arch/arm/include/asm/arm64/efibind.h
@@ -22,9 +22,9 @@ Revision History
 #pragma pack()
 #endif
 
-#define EFIERR(a)           (0x8000000000000000ULL | a)
+#define EFIERR(a)           (0x8000000000000000ULL | (a))
 #define EFI_ERROR_MASK      0x8000000000000000ULL
-#define EFIERR_OEM(a)       (0xc000000000000000ULL | a)
+#define EFIERR_OEM(a)       (0xc000000000000000ULL | (a))
 
 #define BAD_POINTER         0xFBFBFBFBFBFBFBFBULL
 #define MAX_ADDRESS         0xFFFFFFFFFFFFFFFFULL
diff --git a/xen/arch/x86/include/asm/x86_64/efibind.h b/xen/arch/x86/include/asm/x86_64/efibind.h
index e23cd16cb6a0..28bc18c24bb3 100644
--- a/xen/arch/x86/include/asm/x86_64/efibind.h
+++ b/xen/arch/x86/include/asm/x86_64/efibind.h
@@ -117,9 +117,9 @@ typedef uint64_t   UINTN;
     #endif
 #endif
 
-#define EFIERR(a)           (0x8000000000000000 | a)
+#define EFIERR(a)           (0x8000000000000000 | (a))
 #define EFI_ERROR_MASK      0x8000000000000000
-#define EFIERR_OEM(a)       (0xc000000000000000 | a)
+#define EFIERR_OEM(a)       (0xc000000000000000 | (a))
 
 
 #define BAD_POINTER         0xFBFBFBFBFBFBFBFB
-- 
2.34.1


