Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D776347B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 13:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570312.892083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOcJk-0006is-GO; Wed, 26 Jul 2023 11:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570312.892083; Wed, 26 Jul 2023 11:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOcJk-0006fU-C4; Wed, 26 Jul 2023 11:04:32 +0000
Received: by outflank-mailman (input) for mailman id 570312;
 Wed, 26 Jul 2023 11:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0A2=DM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qOcJi-000611-7q
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 11:04:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3085ba2e-2ba4-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 13:04:28 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.26.92])
 by support.bugseng.com (Postfix) with ESMTPSA id 7CA684EE0738;
 Wed, 26 Jul 2023 13:04:27 +0200 (CEST)
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
X-Inumbo-ID: 3085ba2e-2ba4-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v4 3/4] x86/viridian: address violations of MISRA C:2012 Rule 7.2
Date: Wed, 26 Jul 2023 13:03:38 +0200
Message-Id: <3007febabe8a13259dc10b566d23a27a89b75358.1690368810.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690368810.git.simone.ballarin@bugseng.com>
References: <cover.1690368810.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v4:
- change commit headline
- add Reviewed-by

Changes in v3:
- create this commit for 'viridian.c' and 'hyperv-tlfs.h'
---
 xen/arch/x86/hvm/viridian/viridian.c         |  2 +-
 xen/arch/x86/include/asm/guest/hyperv-tlfs.h | 28 ++++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 7405c117bc..61171e3363 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -291,7 +291,7 @@ static void enable_hypercall_page(struct domain *d)
      * calling convention) to differentiate Xen and Viridian hypercalls.
      */
     *(u8  *)(p + 0) = 0x0d; /* orl $0x80000000, %eax */
-    *(u32 *)(p + 1) = 0x80000000;
+    *(u32 *)(p + 1) = 0x80000000U;
     *(u8  *)(p + 5) = 0x0f; /* vmcall/vmmcall */
     *(u8  *)(p + 6) = 0x01;
     *(u8  *)(p + 7) = (cpu_has_vmx ? 0xc1 : 0xd9);
diff --git a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
index 38f997a0c8..a6915ad731 100644
--- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
@@ -471,30 +471,30 @@ typedef struct _HV_REFERENCE_TSC_PAGE {
 
 /* Define hypervisor message types. */
 enum hv_message_type {
-	HVMSG_NONE			= 0x00000000,
+	HVMSG_NONE			= 0x00000000U,
 
 	/* Memory access messages. */
-	HVMSG_UNMAPPED_GPA		= 0x80000000,
-	HVMSG_GPA_INTERCEPT		= 0x80000001,
+	HVMSG_UNMAPPED_GPA		= 0x80000000U,
+	HVMSG_GPA_INTERCEPT		= 0x80000001U,
 
 	/* Timer notification messages. */
-	HVMSG_TIMER_EXPIRED			= 0x80000010,
+	HVMSG_TIMER_EXPIRED			= 0x80000010U,
 
 	/* Error messages. */
-	HVMSG_INVALID_VP_REGISTER_VALUE	= 0x80000020,
-	HVMSG_UNRECOVERABLE_EXCEPTION	= 0x80000021,
-	HVMSG_UNSUPPORTED_FEATURE		= 0x80000022,
+	HVMSG_INVALID_VP_REGISTER_VALUE	= 0x80000020U,
+	HVMSG_UNRECOVERABLE_EXCEPTION	= 0x80000021U,
+	HVMSG_UNSUPPORTED_FEATURE		= 0x80000022U,
 
 	/* Trace buffer complete messages. */
-	HVMSG_EVENTLOG_BUFFERCOMPLETE	= 0x80000040,
+	HVMSG_EVENTLOG_BUFFERCOMPLETE	= 0x80000040U,
 
 	/* Platform-specific processor intercept messages. */
-	HVMSG_X64_IOPORT_INTERCEPT		= 0x80010000,
-	HVMSG_X64_MSR_INTERCEPT		= 0x80010001,
-	HVMSG_X64_CPUID_INTERCEPT		= 0x80010002,
-	HVMSG_X64_EXCEPTION_INTERCEPT	= 0x80010003,
-	HVMSG_X64_APIC_EOI			= 0x80010004,
-	HVMSG_X64_LEGACY_FP_ERROR		= 0x80010005
+	HVMSG_X64_IOPORT_INTERCEPT		= 0x80010000U,
+	HVMSG_X64_MSR_INTERCEPT		= 0x80010001U,
+	HVMSG_X64_CPUID_INTERCEPT		= 0x80010002U,
+	HVMSG_X64_EXCEPTION_INTERCEPT	= 0x80010003U,
+	HVMSG_X64_APIC_EOI			= 0x80010004U,
+	HVMSG_X64_LEGACY_FP_ERROR		= 0x80010005U
 };
 
 /* Define synthetic interrupt controller message flags. */
-- 
2.34.1


