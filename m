Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC1C7D0B24
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 11:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619732.965290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtlV5-00030L-Bs; Fri, 20 Oct 2023 09:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619732.965290; Fri, 20 Oct 2023 09:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtlV5-0002xx-9G; Fri, 20 Oct 2023 09:08:59 +0000
Received: by outflank-mailman (input) for mailman id 619732;
 Fri, 20 Oct 2023 09:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdx5=GC=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1qtlV4-0002xr-Aq
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 09:08:58 +0000
Received: from out0-194.mail.aliyun.com (out0-194.mail.aliyun.com
 [140.205.0.194]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a598ff1-6f28-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 11:08:55 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.V3aO7cu_1697792930) by smtp.aliyun-inc.com;
 Fri, 20 Oct 2023 17:08:51 +0800
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
X-Inumbo-ID: 4a598ff1-6f28-11ee-98d5-6d05b1d4d9a1
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R401e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047193;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---.V3aO7cu_1697792930;
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Juergen Gross" <jgross@suse.com>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Darren Hart" <dvhart@infradead.org>,
  "Andy Shevchenko" <andy@infradead.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
  "=?UTF-8?B?bWFpbnRhaW5lcjpYODYgQVJDSElURUNUVVJFIDMyLUJJVCBBTkQgNjQtQklU?=" <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
  "=?UTF-8?B?bW9kZXJhdGVkIGxpc3Q6WEVOIEhZUEVSVklTT1IgWDg2?=" <xen-devel@lists.xenproject.org>,
  "=?UTF-8?B?b3BlbiBsaXN0Olg4NiBQTEFURk9STSBEUklWRVJTIC0gQVJDSA==?=" <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] x86/xen/pvh: Enable PAE mode for 32-bit guest only when CONFIG_X86_PAE is set
Date: Fri, 20 Oct 2023 17:08:42 +0800
Message-Id: <8c5448eeebbba998a7fff9ed9b2f7e7f3e437967.1697792461.git.houwenlong.hwl@antgroup.com>
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
---
 arch/x86/platform/pvh/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index c4365a05ab83..085adb1b2313 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -70,10 +70,12 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 
 	mov $_pa(early_stack_end), %esp
 
+#if defined(CONFIG_X86_64) || defined(CONFIG_X86_PAE)
 	/* Enable PAE mode. */
 	mov %cr4, %eax
 	orl $X86_CR4_PAE, %eax
 	mov %eax, %cr4
+#endif
 
 #ifdef CONFIG_X86_64
 	/* Enable Long mode. */
-- 
2.31.1


