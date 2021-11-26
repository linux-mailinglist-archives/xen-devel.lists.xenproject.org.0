Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9445F24C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 17:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233255.404628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqeGM-0002Ke-Og; Fri, 26 Nov 2021 16:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233255.404628; Fri, 26 Nov 2021 16:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqeGM-0002Iq-LN; Fri, 26 Nov 2021 16:39:50 +0000
Received: by outflank-mailman (input) for mailman id 233255;
 Fri, 26 Nov 2021 16:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqeGL-0002Id-21
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 16:39:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76aaaa14-4ed7-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 17:39:47 +0100 (CET)
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
X-Inumbo-ID: 76aaaa14-4ed7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637944787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h9LW2Z7OcjobSQpDdRkOtRJfqxEd9wK31rMUqlrU7c8=;
  b=Vr36gQrAm+3Bj+YuBtUMXDkrBEcHQ7pGUydi6t9DnaTSCElwEfux9Zwl
   P8cnd78xbWm6IypTW8BVS3/Q62wDoNP6XU/LhLbcNgCl1rlOIb1Fw+gKg
   Q8sXWEnDDYCyHDsQIgeuVYxendCONjEQIbOqIVAZvZ4vduQskJB4KfIqz
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wQ/zICD1qPxh/hItQiU9uzFMfE6yks6v2nQ9+901uzFNUQ77QWiMqEaPN/S/pLuxW9GJUaHsNs
 0oBvNVO7I/zheiFTH4RoVwKbI7K3fws7owBYhTRPqRhJ9FHUhGLN724+/mdNqkPkUOyNoRwZ5J
 wS5gcSA9cFKY/4KxQAENIhbnKT9OzOQL2L+tRpjrkhgygNrHFBJ58W1ZxhbaLzCRR5Xuc016Pw
 vZsCH73VRJWaHw0MPSzBH3Fx2Gr8ZJb3vYgS37FvMZgGrayNGZp0IwA8qvMc/Ltn8MyGFCFnaY
 ozNKFMctqC15RKFoJPqqFUFh
X-SBRS: 5.1
X-MesageID: 58708258
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FtgpyaujDDRUaKBLHqgtBNFIMOfnVJtZMUV32f8akzHdYApBsoF/q
 tZmKTrTaPfZM2Wmc49/a4vjph9U6sXQy99lSwY//i8yFi8Q+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5bnpciYEHZz1xKciXyUfEAFhMbMa9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5VBOWAyPHwsZTVLJlwONdVisdyuuUnvXyd1tBGZqvMotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO70fsTqs54nl2lraOWQ4CT1hd9A46MBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSEhRqjBNzAJrVkg
 JTis5PFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlUJ2K2M
 RON5Vg5CHpv0J2CNvQfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9INc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:OPMoEK18qYQ4mrhQPmqJCAqjBIgkLtp133Aq2lEZdPRUGvb4qy
 nIpoVi6faUskdpZJhOo6HiBEDtexzhHNtOkO0s1NSZLW/bUQmTXeNfBOLZqlWKcUCTygce79
 YGT0EXMqyKMbEQt6bHCWeDferIuOP3lZyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58708258"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1.1 64/65] x86/efi: Disable CET-IBT around Runtime Services calls
Date: Fri, 26 Nov 2021 16:38:30 +0000
Message-ID: <20211126163830.30151-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

At least one TigerLake NUC has UEFI firmware which isn't CET-IBT compatible.
Read under a function pointer to see whether an endbr64 instruction is
present, and use this as a heuristic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This was disappointing to discover.  I've pestered some folk and maybe
something will improve in due course, but it remains an open question how best
to discover that Runtime Services are CET-IBT compatible.

v2:
 * Switch to endbr helpers.
---
 xen/arch/x86/efi/stub.c  |  2 ++
 xen/common/efi/boot.c    |  9 +++++++++
 xen/common/efi/runtime.c | 17 +++++++++++++++++
 xen/include/xen/efi.h    |  1 +
 4 files changed, 29 insertions(+)

diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
index 998493262641..5e44913e52db 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -11,6 +11,8 @@
 #include <efi/efidevp.h>
 #include <efi/efiapi.h>
 
+bool __initdata efi_no_cet_ibt;
+
 /*
  * Here we are in EFI stub. EFI calls are not supported due to lack
  * of relevant functionality in compiler and/or linker.
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index f5af71837d5a..c19f993af922 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -21,6 +21,7 @@
 #include <xen/string.h>
 #include <xen/stringify.h>
 #ifdef CONFIG_X86
+#include <asm/endbr.h>
 /*
  * Keep this arch-specific modified include in the common file, as moving
  * it to the arch specific include file would obscure that special care is
@@ -735,6 +736,14 @@ static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTabl
 
     StdOut = SystemTable->ConOut;
     StdErr = SystemTable->StdErr ?: StdOut;
+
+#ifdef CONFIG_X86
+    /*
+     * Heuristic.  Look under an arbitrary function pointer to see if UEFI was
+     * compiled with CET-IBT support.  Experimentally some are not.
+     */
+    efi_no_cet_ibt = !is_endbr64(efi_rs->GetTime);
+#endif
 }
 
 static void __init efi_console_set_mode(void)
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index d2fdc28df3e0..ef54863542db 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -21,6 +21,7 @@ struct efi_rs_state {
   * don't strictly need that.
   */
  unsigned long __aligned(32) cr3;
+    unsigned long msr_s_cet;
 #endif
 };
 
@@ -61,6 +62,7 @@ UINTN __read_mostly efi_apple_properties_len;
 
 /* Bit field representing available EFI features/properties. */
 unsigned int efi_flags;
+bool __read_mostly efi_no_cet_ibt;
 
 struct efi __read_mostly efi = {
 	.acpi   = EFI_INVALID_TABLE_ADDR,
@@ -113,6 +115,17 @@ struct efi_rs_state efi_rs_enter(void)
 
     switch_cr3_cr4(mfn_to_maddr(efi_l4_mfn), read_cr4());
 
+    /*
+     * If UEFI doesn't appear to be CET-IBT compatible, stash and clobber
+     * ENDBR_EN.  Always read the current CET setting, because CET-SS isn't
+     * configured until very late on the BSP.
+     */
+    if ( cpu_has_xen_ibt && efi_no_cet_ibt )
+    {
+        rdmsrl(MSR_S_CET, state.msr_s_cet);
+        wrmsrl(MSR_S_CET, state.msr_s_cet & ~CET_ENDBR_EN);
+    }
+
     return state;
 }
 
@@ -122,6 +135,10 @@ void efi_rs_leave(struct efi_rs_state *state)
 
     if ( !state->cr3 )
         return;
+
+    if ( state->msr_s_cet )
+        wrmsrl(MSR_S_CET, state->msr_s_cet);
+
     switch_cr3_cr4(state->cr3, read_cr4());
     if ( is_pv_vcpu(curr) && !is_idle_vcpu(curr) )
     {
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 94a7e547f97b..8c14f7f18718 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -30,6 +30,7 @@ union compat_pf_efi_info;
 
 struct xenpf_efi_runtime_call;
 struct compat_pf_efi_runtime_call;
+extern bool efi_no_cet_ibt;
 
 bool efi_enabled(unsigned int feature);
 void efi_init_memory(void);
-- 
2.11.0


