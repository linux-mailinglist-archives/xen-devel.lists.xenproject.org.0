Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95326A083B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 13:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500289.771589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAOQ-0001J3-1Q; Thu, 23 Feb 2023 12:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500289.771589; Thu, 23 Feb 2023 12:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAOP-0001Fx-U3; Thu, 23 Feb 2023 12:08:09 +0000
Received: by outflank-mailman (input) for mailman id 500289;
 Thu, 23 Feb 2023 12:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fv/5=6T=citrix.com=prvs=411d40f12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVAOP-0001Fr-0F
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 12:08:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba772833-b372-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 13:08:07 +0100 (CET)
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
X-Inumbo-ID: ba772833-b372-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677154087;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gcGm9sX4C2ic4BC30znLqSF6dJw5dy/dwxCzhGmQST0=;
  b=YhroC3YokSdaGlZmpcObW4Rx1y4KZ7+GDQYVGgANDyiYBw/xcVBTr4ZP
   PXDawrbXwpkQGg8n0ok3ApW6QuTFFZPBZUwYSSWWEvO3T9K9gtVvX9b1W
   Zr5w1daIhZuUC0m2vD4xT9htUOSDK6kk15f+LxyTocmpoqicnlvE649Cd
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98214997
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:iAcpb62SHjTUn5PirPbD5Q5xkn2cJEfYwER7XKvMYLTBsI5bpzFUx
 jcaCj3QMq6DYmL0eohyOdjloRsGv5bdx9RiSANkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIURt/
 MYyBxYxfgGxrry52oi/Cep+mZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFJUPxxrJ9
 z2uE2LRHisqKfyE7wW52CzyoebhmR+iZZ89C+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQgy
 0WbltfuCTtwuZWaTHuc8vGfqjbaESoIKykEbCwNTwoA6vHipp0+ilTESdMLOK24kNzzXy3xy
 jairS4iirFVhskOv5hX5nie3Wjq/MKQCFdouEOOBDnNAh5FiJCNR6mL4GLxwtB8PJerZweOp
 kIA2MuM87VbZX2SrxClTOIIFbCvwv+KNjzAnFJid6UcGySRF22LJt4JvmwnTKt9GoNdIGKyP
 heP0e9EzMULVEZGe5ObdG5Y5y4C6aH7XeroWfnPBjalSsggLVTXlM2CiKP54owMrKTOuftjU
 Xt4WZz2ZZr/NUiA5Gveegvl+eV3rh3SPEuKLXwB8zyp0KCFeFmeQqofPV2FY4gRtf3b/12Eq
 4cGb5TVl32ztdEShQGNrOYuwa0idyBnVfgaVeQKHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1E
 oKVAydlJK7ErSSfc22iMykzAI4DqL4j9RrXywRwZwf3s5XiCK7zhJoim2wfJON4r705k6YkF
 ZHouayoW5xyd9gOwBxFBbGVkWCoXE317e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:8o3vxq9sytK7cHu6tbBuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+8jztCWE7Ar5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslvd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.97,320,1669093200"; 
   d="scan'208";a="98214997"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH] x86/vmx: Correct the declaration of vmx_asm_vmexit_handler()
Date: Thu, 23 Feb 2023 12:07:57 +0000
Message-ID: <20230223120757.2549079-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Taking struct cpu_user_regs as a full object is bogus, and while what was
probably meant was to take a struct cpu_user_regs pointer, that's still wrong.

This isn't a function; its an address stored in the VMCS that the CPU resumes
from on VMExit, meaning that it doesn't conform to a normal C API/ABI.

Annotate it with `nocall`, and move the declaration into vmcs.c next to its
sole user.

Fixes: 9c3118a82523 ("bitkeeper revision 1.1159.1.483 (41c0c417XYObowWqbfqU0cdLx30C9w)")
                 `-> "Initial Intel VMX support"
Reported-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c            | 2 ++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index e1c268789e7e..ed71ecfb6284 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1074,6 +1074,8 @@ static void pi_desc_init(struct vcpu *v)
     v->arch.hvm.vmx.pi_desc.ndst = APIC_INVALID_DEST;
 }
 
+void nocall vmx_asm_vmexit_handler(void);
+
 static int construct_vmcs(struct vcpu *v)
 {
     struct domain *d = v->domain;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 97d6b810ec55..f6308ed65601 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -82,7 +82,6 @@ typedef enum {
 
 #define PI_xAPIC_NDST_MASK      0xFF00
 
-void vmx_asm_vmexit_handler(struct cpu_user_regs);
 void vmx_intr_assist(void);
 void noreturn cf_check vmx_do_resume(void);
 void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
-- 
2.30.2


