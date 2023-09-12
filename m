Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3079D51F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 17:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600553.936314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5Uw-0000PQ-M6; Tue, 12 Sep 2023 15:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600553.936314; Tue, 12 Sep 2023 15:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5Uw-0000MD-G6; Tue, 12 Sep 2023 15:40:18 +0000
Received: by outflank-mailman (input) for mailman id 600553;
 Tue, 12 Sep 2023 15:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qg5Uu-0005yG-UF
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 15:40:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab1114c4-5182-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 17:40:15 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C95B24EE074A;
 Tue, 12 Sep 2023 17:40:14 +0200 (CEST)
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
X-Inumbo-ID: ab1114c4-5182-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Gianluca Luparini <gianluca.luparini@bugseng.com>
Subject: [XEN PATCH v6 7/7] x86/efi: address violations of MISRA C:2012 Rule 7.2
Date: Tue, 12 Sep 2023 17:39:04 +0200
Message-Id: <176532a92dd159f9b6d189139e738e1cc8aebcbc.1694532795.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694532795.git.simone.ballarin@bugseng.com>
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Addi the 'U' suffix to integers literals with unsigned type.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

---
Changes in v6:
- new patch obtained by splitting EFI related changes from
"xen/x86: address violations of MISRA C:2012 Rule 7.2 (v5)"
---
 xen/arch/x86/efi/efi-boot.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 92f4cfe8bd..eebc54180b 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -740,16 +740,16 @@ static void __init efi_arch_handle_module(const struct file *file,
 
 static void __init efi_arch_cpu(void)
 {
-    uint32_t eax = cpuid_eax(0x80000000);
+    uint32_t eax = cpuid_eax(0x80000000U);
     uint32_t *caps = boot_cpu_data.x86_capability;
 
     boot_tsc_stamp = rdtsc();
 
     caps[FEATURESET_1c] = cpuid_ecx(1);
 
-    if ( (eax >> 16) == 0x8000 && eax > 0x80000000 )
+    if ( (eax >> 16) == 0x8000 && eax > 0x80000000U )
     {
-        caps[FEATURESET_e1d] = cpuid_edx(0x80000001);
+        caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
 
         /*
          * This check purposefully doesn't use cpu_has_nx because
-- 
2.34.1


