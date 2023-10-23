Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4B7D2DAF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621108.967210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqwy-0004re-Iw; Mon, 23 Oct 2023 09:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621108.967210; Mon, 23 Oct 2023 09:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqwy-0004og-F1; Mon, 23 Oct 2023 09:10:16 +0000
Received: by outflank-mailman (input) for mailman id 621108;
 Mon, 23 Oct 2023 09:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DOxK=GF=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1quqww-0003eK-N7
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:10:14 +0000
Received: from out0-198.mail.aliyun.com (out0-198.mail.aliyun.com
 [140.205.0.198]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1fe0707-7183-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:10:12 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.V5qfj3u_1698052197) by smtp.aliyun-inc.com;
 Mon, 23 Oct 2023 17:09:58 +0800
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
X-Inumbo-ID: f1fe0707-7183-11ee-9b0e-b553b5be7939
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R621e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047194;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---.V5qfj3u_1698052197;
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
Subject: [PATCH 2/2] x86/xen/pvh: Use fixed_percpu_data to set up GS base
Date: Mon, 23 Oct 2023 17:09:39 +0800
Message-Id: <f3943c3bbcdfea836064d3556a979ad6f015c835.1698051454.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1698051454.git.houwenlong.hwl@antgroup.com>
References: <cover.1698051454.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

startup_64() and startup_xen() both use "fixed_percpu_data" to set up GS
base. So for consitency, use it too in PVH entry and remove the
temporary variable "canary".

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/platform/pvh/head.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index cee4dadf5344..591ba165215f 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -96,7 +96,7 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 1:
 	/* Set base address in stack canary descriptor. */
 	mov $MSR_GS_BASE,%ecx
-	mov $_pa(canary), %eax
+	mov $_pa(INIT_PER_CPU_VAR(fixed_percpu_data)), %eax
 	xor %edx, %edx
 	wrmsr
 
@@ -160,8 +160,6 @@ SYM_DATA_START_LOCAL(gdt_start)
 SYM_DATA_END_LABEL(gdt_start, SYM_L_LOCAL, gdt_end)
 
 	.balign 16
-SYM_DATA_LOCAL(canary, .fill 48, 1, 0)
-
 SYM_DATA_START_LOCAL(early_stack)
 	.fill BOOT_STACK_SIZE, 1, 0
 SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
-- 
2.31.1


