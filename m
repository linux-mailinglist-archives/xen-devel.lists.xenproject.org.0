Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED8B6F14C2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 11:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527220.819578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psKql-0001ox-BH; Fri, 28 Apr 2023 09:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527220.819578; Fri, 28 Apr 2023 09:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psKql-0001nF-88; Fri, 28 Apr 2023 09:57:11 +0000
Received: by outflank-mailman (input) for mailman id 527220;
 Fri, 28 Apr 2023 09:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCeu=AT=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1psKmQ-0001fa-6g
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 09:52:42 +0000
Received: from out0-199.mail.aliyun.com (out0-199.mail.aliyun.com
 [140.205.0.199]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66dc1d4b-e5aa-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 11:52:37 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.STCEPV9_1682675548) by smtp.aliyun-inc.com;
 Fri, 28 Apr 2023 17:52:29 +0800
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
X-Inumbo-ID: 66dc1d4b-e5aa-11ed-8611-37d641c3527e
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047198;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.STCEPV9_1682675548;
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Thomas Garnier" <thgarnie@chromium.org>,
  "Lai Jiangshan" <jiangshan.ljs@antgroup.com>,
  "Kees Cook" <keescook@chromium.org>,
  "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Juergen Gross" <jgross@suse.com>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Darren Hart" <dvhart@infradead.org>,
  "Andy Shevchenko" <andy@infradead.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
   <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
   <xen-devel@lists.xenproject.org>,
   <platform-driver-x86@vger.kernel.org>
Subject: [PATCH RFC 15/43] x86/PVH: Use fixed_percpu_data to set up GS base
Date: Fri, 28 Apr 2023 17:50:55 +0800
Message-Id: <4fdb800ce6f1a2315918cb02eec3efbec1032cb8.1682673543.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
References: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

startup_64() and startup_xen() both use fixed_percpu_data to set up GS
base. So for consitency, use it too in PVH entry.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: Thomas Garnier <thgarnie@chromium.org>
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/x86/platform/pvh/head.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index c4365a05ab83..b093996b7e19 100644
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
 
@@ -156,8 +156,6 @@ SYM_DATA_START_LOCAL(gdt_start)
 SYM_DATA_END_LABEL(gdt_start, SYM_L_LOCAL, gdt_end)
 
 	.balign 16
-SYM_DATA_LOCAL(canary, .fill 48, 1, 0)
-
 SYM_DATA_START_LOCAL(early_stack)
 	.fill BOOT_STACK_SIZE, 1, 0
 SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
-- 
2.31.1


