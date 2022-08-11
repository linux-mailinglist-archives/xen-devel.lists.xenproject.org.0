Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F759072E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 22:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385157.620711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMELL-0002gz-DS; Thu, 11 Aug 2022 19:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385157.620711; Thu, 11 Aug 2022 19:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMELL-0002dd-AH; Thu, 11 Aug 2022 19:59:47 +0000
Received: by outflank-mailman (input) for mailman id 385157;
 Thu, 11 Aug 2022 19:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMELK-00024H-BH
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 19:59:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24857ae3-19b0-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 21:59:45 +0200 (CEST)
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
X-Inumbo-ID: 24857ae3-19b0-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660247985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KqmmLAV1fvNf0oBH4lqcnCZIyCym+wndXbWemJjGv9k=;
  b=An7bHQGVImhToWA5kURC5Qym55fPU6wNhVV6V+MfsBa4lEsnxD2SBtPN
   0jGkbUHLZP2/Z8CwPjYi8baVcY316XndDEhDv1VH5onaVgEuHNKLsjxUy
   X7oZ8BU119EcS8diIcc34HKYQixEoBFAuIR2KzW3kEuw7jzu7SgemyWYS
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77912369
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ANotJXqjJ3mrf7PzgkV/5MdGJX17brhtdyRrau?=
 =?us-ascii?q?qucSGfot9Go9fgcEakywXxxQyOjNFhxPkljTP6bFW25pS+9ulAPs3xUIucbH?=
 =?us-ascii?q?vvzWNVykLxy4vp2jvjRqeQtbf0FzuW0+S8j7v4RyZsu6L3zlaqkYpjA1iwa5?=
 =?us-ascii?q?/YFhfqyHuERCyUGMssI0eM2zLkCwG+afzIVeHItNofOuv1lYObgxFOLAecQN?=
 =?us-ascii?q?OV3IDbmIAdI9MO8de0CXOoTfc7drjqanKBqQaHJiFvUf6kuCXBThJaRR1OH4?=
 =?us-ascii?q?+RHDTnPJBiYkzttZeorOv4eA8+fU0ej4HZTzBRYhAvZgmdUj/l7SuxZcel8Y?=
 =?us-ascii?q?jvxK9p7tkdHBKWwRWS4nresLtvR3hhERsr1SWEdR2u8BAyMYLaKIZ7HuSCZf?=
 =?us-ascii?q?sekF67vnCve9Zmmt4ZU7r0QJ1LO2bCKjOZ/eWpwQRsBgyHBW5AZorQaGF6mQ?=
 =?us-ascii?q?jD5i3roBsdlZmFYMFEMclzmoGaGTuCXCIAoiMkzqlhdDxRElGASyvC/Prgh+?=
 =?us-ascii?q?52o6GKTIPEVqAuypmie1dfyn18cpYRo6mg83t8MNq/Ugmpho0NhettN9OGc4?=
 =?us-ascii?q?cffysQkhLrs+5OOLY55AWHF09GLCVeUFX3xVhcF6h9PrQFot2nUtYqvL1iNa?=
 =?us-ascii?q?T/hR3NexEyEXYXeK64XN/84jxVBya5pNAxO4RY+PKdWIZ+WnKvdziR+xlH54?=
 =?us-ascii?q?95P9I6yEgN6PCmIwPpe0I9EE1sxAvGCXhqvDJWXO5KxgG2CZ+5RJDWMDIFJx?=
 =?us-ascii?q?Ez3lMphrZiWrFHDCNgSqLhIZ/oyQCpGAUJmrC0VBK4v55yJ+GEVrT7FfCP0o?=
 =?us-ascii?q?7rlePhvlT7VqV3aAtimwRwmrNbnw7KITzGWbXy0P8VmDLdim73MwQ1y1tKFY?=
 =?us-ascii?q?Nh1qtvRmHF+c6cIfM0VKPh2KqP360/wt0WW/Tsb0EnmKQAdABXKxSv3TbxNI?=
 =?us-ascii?q?sQIlqqn3/wxOgsTWqeTSUCq2hk91YyAjz95fOnmBHU8x/+ZJYbVytBo+EgPn?=
 =?us-ascii?q?ORc3iXhVnUisyAKlHn0An7YkNNOcJiNSf52ch+DUiC20wtBB3eLMvMhb3AWk?=
 =?us-ascii?q?zYbqi9os1kETgFAgzr+EtTEIHT2Kcp1k3THvNKOtsH0Dm2uDDqUnRCEVKXEn?=
 =?us-ascii?q?Lc4DoQQPxnvNsr+JS3bKsmmlPFtV2ulslBJqWVCK9C7o1m4NY2k9jmZgpIJm?=
 =?us-ascii?q?kv6Xn+hicTEhaJp5WU1Dy+htHfORf7iZobAmki2o2OtbCfLB2+hcpibG0D+F?=
 =?us-ascii?q?WkwWrLAZOVzlRAnneUeArJMyekzLr33U35SXyCpLnOUPiBv3gqgegpA+8FjE?=
 =?us-ascii?q?kIo4qEOqdFJTpCljLFCJHwXqKy7TiC91i32PjSQdHavdU5XLpxMWDXAN59Mj?=
 =?us-ascii?q?r83S9i9/5xvfKdZMgijehydHdB2hKwbIJui4keNMBS+f6+3Z5QPZcdXAvnfH?=
 =?us-ascii?q?qwcD3JlqCcGtV1QcYF3viZ+99G/RnBHrGxWwavjtJqkc/P3fLo/ozw5lQ8QR?=
 =?us-ascii?q?jxjICUi0vdPSzJyBYgupXHo48iLENhOds/Y0hCi9Z3eDHWNUFYkaD0CZiHNo?=
 =?us-ascii?q?LwOy+gZMsepumErqtsqturFRwD6EVG1m5hlEuov7Y/V+GG44LX6aS9afM+g/?=
 =?us-ascii?q?KYQ4TIkEew97sVPRUbSRu1WPSh/Nz6aIG4sp7Wtd8gUqSZt4yTBSRklVMbjg?=
 =?us-ascii?q?qi5Tsc3HjR5qvWHlg+8PP/uCsRTsomtHWTyOEMF0vbSibLAbW3YkAv+UNOTm?=
 =?us-ascii?q?PQXZrvq+VkySGa5TOC4w1ADX/TWQ7hzB9HtX53joXY0yfiVByj8bUShJLSrf?=
 =?us-ascii?q?hX0Ybt53FBWiOG/6lnjtb+kTTZu/SoUf15ihoIxgRV3GVT6wD+BcO7HGSbB9?=
 =?us-ascii?q?0K2esh1m5E4R2wgE8e9KhCPqLwA1t05CoMrLYpOEhdwWfJTIgesV5brL55l6?=
 =?us-ascii?q?nDM5SxjnJPtYNwg7kKduDecd5r8rDuuDxfqW6CtJIIWCyHjhHHkdtPiD2Wxy?=
 =?us-ascii?q?FFX7DXsU8gZT/UQhQ346dkAAUOxdXWTPZOY3wYAN0ia5K6cibKE1vyr3Owk+?=
 =?us-ascii?q?/+MHOnRN8uU1hX+Thd28Na3wCy0i+v0VIBCR2byPCVFAk9U0Vk/+lzAs0Z0G?=
 =?us-ascii?q?GcVVMrCLiNqtAN/+xl+xNtYZFZ5V8dx4nkBnnc1sqSTx0bXDaGePZDAUto3f?=
 =?us-ascii?q?BjF1y88sGEk54eMroBuh/QUom1BeR7UL0BhSxgEVBk6lLytfVENLySrdoTSp?=
 =?us-ascii?q?EVq0OQCG9+YosecCP5UqlLK9OFWShArjFRhDCWVsgpvGw3foLFW1VsPyM7ZI?=
 =?us-ascii?q?LhwOGoIIKGOEFMItFlzYdv8Q+cTsUde6/L9qwwn7bw6ptxzq2VvZFKBe/eVq?=
 =?us-ascii?q?32VzFFOIE2eYjZ6Nfwj3T10btl99vmiEL0LnnzQNTfOPL7rXJAuOn9bfWAc3?=
 =?us-ascii?q?dzuJycS3frLliKii8dDxHutpt6QryiNyJvSeq9Z9qtTvQStYJSkkXElaG/8F?=
 =?us-ascii?q?FTJV97j5OUpD8NsXxIh828J16ery2xiiIO8N+htlYowx0g470aoPnLk2L9KJ?=
 =?us-ascii?q?RflXhVveL5uRMtEn6exfeYWC+LLHjB1D+uNOMJBfeQS5uXdiCGZCqO+4+bTi?=
 =?us-ascii?q?20V90MgbJxq+o4N6dENn0Jr2WWqlKBk2LGh5jbVvG68Hwx380MLNtaiC2yK+?=
 =?us-ascii?q?1/sGoQ5q7nviIfV1a3wG5jW6iXu4fPjOUW7LvaPUcn7eXLloRmqCx9JMcqil?=
 =?us-ascii?q?KOSlf8jhoeNV8+tkqER7dQq+VAveHwDvSYCZ8a4kIwZq+xabCw=3D?=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77912369"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/svm: Remove regs param from asm-called functions
Date: Thu, 11 Aug 2022 20:59:04 +0100
Message-ID: <20220811195905.7780-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220811195905.7780-1-andrew.cooper3@citrix.com>
References: <20220811195905.7780-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A optimisation is going to want to conditionally have extra data on the stack
around VMExit.

We could alternative between `mov %rsp, %rdi` and `lea 8(%rsp), %rdi`, but it
is easier just to make the functions void and let the compiler do the (not
very) hard work.

Passing regs is a bit weird for HVM guests anyway, because the resulting
pointer is invariant (this isn't native exception handling where the regs
pointers *are* important), and all functions calculate `current` themselves
which is another invariant.

Finally, the compiler can merge the get_cpu_info() calculation which is common
to both `current` and guest_cpu_user_regs(), meaning the delta in C really is
just one `lea`, and not any more expensive than `mov`'s in ASM anyway.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/entry.S     | 3 ---
 xen/arch/x86/hvm/svm/nestedsvm.c | 3 ++-
 xen/arch/x86/hvm/svm/svm.c       | 6 ++++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index a60d759f7108..be4ce52bd81d 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -26,7 +26,6 @@ ENTRY(svm_asm_do_resume)
         GET_CURRENT(bx)
 .Lsvm_do_resume:
         call svm_intr_assist
-        mov  %rsp,%rdi
         call nsvm_vcpu_switch
         ASSERT_NOT_IN_ATOMIC
 
@@ -52,7 +51,6 @@ UNLIKELY_START(ne, nsvm_hap)
         jmp  .Lsvm_do_resume
 __UNLIKELY_END(nsvm_hap)
 
-        mov  %rsp, %rdi
         call svm_vmenter_helper
 
         clgi
@@ -132,7 +130,6 @@ __UNLIKELY_END(nsvm_hap)
          */
         stgi
 GLOBAL(svm_stgi_label)
-        mov  %rsp,%rdi
         call svm_vmexit_handler
         jmp  .Lsvm_do_resume
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 9f5f35f16aff..77f754736023 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1460,8 +1460,9 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
 }
 
 /* VCPU switch */
-void nsvm_vcpu_switch(struct cpu_user_regs *regs)
+void nsvm_vcpu_switch(void)
 {
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *v = current;
     struct nestedvcpu *nv;
     struct nestedsvm *svm;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 0849a9dc5f41..81f0cf55676b 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1040,8 +1040,9 @@ static void noreturn cf_check svm_do_resume(void)
     reset_stack_and_jump(svm_asm_do_resume);
 }
 
-void svm_vmenter_helper(const struct cpu_user_regs *regs)
+void svm_vmenter_helper(void)
 {
+    const struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *curr = current;
     struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
 
@@ -2570,8 +2571,9 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     },
 };
 
-void svm_vmexit_handler(struct cpu_user_regs *regs)
+void svm_vmexit_handler(void)
 {
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
     uint64_t exit_reason;
     struct vcpu *v = current;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-- 
2.11.0


