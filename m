Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD64D0CE68
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jan 2026 05:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199325.1515874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veQ9R-0002Fu-4W; Sat, 10 Jan 2026 04:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199325.1515874; Sat, 10 Jan 2026 04:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veQ9R-0002ET-1g; Sat, 10 Jan 2026 04:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1199325;
 Sat, 10 Jan 2026 04:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gC3=7P=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1veQ9O-0002ED-Ve
 for xen-devel@lists.xenproject.org; Sat, 10 Jan 2026 04:00:31 +0000
Received: from out28-77.mail.aliyun.com (out28-77.mail.aliyun.com
 [115.124.28.77]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e39f1a0b-edd8-11f0-9ccf-f158ae23cfc8;
 Sat, 10 Jan 2026 05:00:26 +0100 (CET)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.g2udv12_1768017621 cluster:ay29) by smtp.aliyun-inc.com;
 Sat, 10 Jan 2026 12:00:21 +0800
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
X-Inumbo-ID: e39f1a0b-edd8-11f0-9ccf-f158ae23cfc8
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1768017623; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=A6dPHnR7FvaayZTlFNBJHodwAg7ZKvD60GtSZKVizUI=;
	b=kr0oejG0VHA98SVlNkPKz0CRuH2liazdL+MHNYTI2m4bKCXgyalJlsILGigcPXmIgmlOJ1Dc/n838lcuHVggu5PcpxTvN1ZvEKs+CghsCam3xNV578Ksg0j7Ig1OvCa+uGIxFB+9we7TUCGO8Ki6RGqN56At+yAXXzerzCnVN5s=
From: Hou Wenlong <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH RESEND v2] x86/xen/pvh: Enable PAE mode for 32-bit guest only when CONFIG_X86_PAE is set
Date: Sat, 10 Jan 2026 12:00:08 +0800
Message-Id: <d09ce9a134eb9cbc16928a5b316969f8ba606b81.1768017442.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PVH entry is available for 32-bit KVM guests, and 32-bit KVM guests
do not depend on CONFIG_X86_PAE. However, mk_early_pgtbl_32() builds
different pagetables depending on whether CONFIG_X86_PAE is set.
Therefore, enabling PAE mode for 32-bit KVM guests without
CONFIG_X86_PAE being set would result in a boot failure during CR3
loading.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
I resend this because I encountered the 32-bit KVM guest PVH booting failure again. I
hope this can be fixed.
original v2:
https://lore.kernel.org/all/0469c27833be58aa66471920aa77922489d86c63.1713873613.git.houwenlong.hwl@antgroup.com
---
 arch/x86/platform/pvh/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 344030c1a81d..53ee2d53fcf8 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -91,10 +91,12 @@ SYM_CODE_START(pvh_start_xen)
 
 	leal rva(early_stack_end)(%ebp), %esp
 
+#if defined(CONFIG_X86_64) || defined(CONFIG_X86_PAE)
 	/* Enable PAE mode. */
 	mov %cr4, %eax
 	orl $X86_CR4_PAE, %eax
 	mov %eax, %cr4
+#endif
 
 #ifdef CONFIG_X86_64
 	/* Enable Long mode. */

base-commit: b7dccac786071bba98b0d834c517fd44a22c50f9
prerequisite-patch-id: 590fa7e96c6bb8e0b9d15017cfa5ce1eb314957a
-- 
2.31.1


