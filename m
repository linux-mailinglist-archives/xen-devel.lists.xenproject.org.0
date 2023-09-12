Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7079CC08
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600148.935774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzrA-0001xp-Q4; Tue, 12 Sep 2023 09:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600148.935774; Tue, 12 Sep 2023 09:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzrA-0001vY-N8; Tue, 12 Sep 2023 09:38:52 +0000
Received: by outflank-mailman (input) for mailman id 600148;
 Tue, 12 Sep 2023 09:38:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qfzr9-0000lh-TL
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:38:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e69508d-5150-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 11:38:51 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D4F9B4EE0746;
 Tue, 12 Sep 2023 11:38:50 +0200 (CEST)
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
X-Inumbo-ID: 2e69508d-5150-11ee-8786-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 06/10] x86/EFI: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 12 Sep 2023 11:36:52 +0200
Message-Id: <eced0ebcd8f96d87ccab0e4008e0f752121273de.1694510856.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694510856.git.simone.ballarin@bugseng.com>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guard to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- remove changes in "xen/arch/x86/efi/efi-boot.h"

Note:
Changes in efi-boot.h have been removed since the file is
intenteded to be included by common/efi/boot.c only. This motivation
is not enough to raise a deviation record, so the violation is
still present.
---
 xen/arch/x86/efi/runtime.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
index 77866c5f21..10b36bcb89 100644
--- a/xen/arch/x86/efi/runtime.h
+++ b/xen/arch/x86/efi/runtime.h
@@ -1,3 +1,6 @@
+#ifndef __X86_EFI_RUNTIME_H__
+#define __X86_EFI_RUNTIME_H__
+
 #include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <asm/atomic.h>
@@ -17,3 +20,5 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
     }
 }
 #endif
+
+#endif /* __X86_EFI_RUNTIME_H__ */
-- 
2.34.1


