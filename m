Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B97A21AD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603209.940165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJZ-0005dn-AL; Fri, 15 Sep 2023 15:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603209.940165; Fri, 15 Sep 2023 15:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJZ-0005b8-6B; Fri, 15 Sep 2023 15:01:01 +0000
Received: by outflank-mailman (input) for mailman id 603209;
 Fri, 15 Sep 2023 15:00:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJX-0004UV-MC
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:00:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad71710e-53d8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 17:00:58 +0200 (CEST)
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
X-Inumbo-ID: ad71710e-53d8-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pf82kjUXJ6jZJAJI5DPaVOzFlKCNTwtgYRVi04CNhmw=;
  b=WZ6ghBkDxbMesPnGG3WRo9zSvieQB42p83V2eoEcSOR+apHVmVozBPOJ
   383kYrnSKlE8uSkhHoYwHnQ8BGB96PshmIANyqviBXMQvg1VxM2+U7X5b
   EuMgFxRJvBJ1+gNHoU/JBBJEwTmmynJ6AIzkjpj3kfIlgs+JqOKCZuvAI
   A=;
X-CSE-ConnectionGUID: T6/GhXioRSe6SFi4s144KQ==
X-CSE-MsgGUID: XvE0CHgRTJij4wJOTrLyEw==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125509276
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:rnYqYaih39rx7pHhYPaMPSFmX161fxAKZh0ujC45NGQN5FlHY01je
 htvXT/VOvrYM2Gnco1zbd60pEkP78TRy4dkGQRu/CwwHyMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyo0N8klgZmP6sT7QaDzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQkdncibiCCgNiNzeyAZOgwnZ1/cOrSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 D+bpzWjXU9y2Nq3+SSoqlmMidXzvyL5BJ0wM4Gi0u9HnwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEscVVCzNnToYYJtR+RdfhiTLXs0oHWIGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGsuTKuKGpxeEdMMX
 KM0kVoKjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwNBLJhjmxwBB3zflX1
 XKnnSCEVyZy5UNPlmbeegvg+eVzmnBWKZ37GvgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 483Cid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6eh9I9Y/xvUPx7egE
 7PUchYw9WcTTEbvcW2iAk2PopuyNXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:y5DG+qnuLm++I8yHzvsl/6B+S4TpDfLT3DAbv31ZSRFFG/Fw9v
 re5cjzuiWE7Qr5NEtQ++xoW5PwIk80l6QFhbX5VI3KNGKN1VdAR7sSircKrQeQfREWNdQz6U
 6jScRD4RHLbGRSvILC2y+fPO8H4P67mZrY/dv2/jNVVgdtZLhn7wBlTiimMmAefng8ObMJUK
 OG4MxJvjyhfmlSSP+aKD0qY8jvzue77q4PR3Y9dmIaAc21/E6VAXfBfXil4is=
X-Talos-CUID: 9a23:NVMriWMKTVk4sO5DZHcg204kG8cfSXCD91nRf1ThVTpKcejA
X-Talos-MUID: 9a23:TXBhhAb5YlfkOOBThyHB3BpCO/1UwaWsVF8vtqkcn9ipKnkl
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="125509276"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 2/9] x86/spec-ctrl: Fold DO_SPEC_CTRL_EXIT_TO_XEN into it's single user
Date: Fri, 15 Sep 2023 16:00:31 +0100
Message-ID: <20230915150038.602577-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915150038.602577-1-andrew.cooper3@citrix.com>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With the SPEC_CTRL_EXIT_TO_XEN{,_IST} confusion fixed, it's now obvious that
there's only a single EXIT_TO_XEN path.  Fold DO_SPEC_CTRL_EXIT_TO_XEN into
SPEC_CTRL_EXIT_TO_XEN to simplify further fixes.

When merging labels, switch the name to .L\@_skip_sc_msr as "skip" on its own
is going to be too generic shortly.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 40 ++++++++++--------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index cfba35560333..72e7046f70d6 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -199,27 +199,6 @@
     wrmsr
 .endm
 
-.macro DO_SPEC_CTRL_EXIT_TO_XEN
-/*
- * Requires %rbx=stack_end
- * Clobbers %rax, %rcx, %rdx
- *
- * When returning to Xen context, look to see whether SPEC_CTRL shadowing is
- * in effect, and reload the shadow value.  This covers race conditions which
- * exist with an NMI/MCE/etc hitting late in the return-to-guest path.
- */
-    xor %edx, %edx
-
-    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%rbx)
-    jz .L\@_skip
-
-    mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%rbx), %eax
-    mov $MSR_SPEC_CTRL, %ecx
-    wrmsr
-
-.L\@_skip:
-.endm
-
 .macro DO_SPEC_CTRL_EXIT_TO_GUEST
 /*
  * Requires %eax=spec_ctrl, %rsp=regs/cpuinfo
@@ -328,11 +307,24 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
  * Clobbers %rax, %rcx, %rdx
  */
     testb $SCF_ist_sc_msr, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%rbx)
-    jz .L\@_skip
+    jz .L\@_skip_sc_msr
 
-    DO_SPEC_CTRL_EXIT_TO_XEN
+    /*
+     * When returning to Xen context, look to see whether SPEC_CTRL shadowing
+     * is in effect, and reload the shadow value.  This covers race conditions
+     * which exist with an NMI/MCE/etc hitting late in the return-to-guest
+     * path.
+     */
+    xor %edx, %edx
 
-.L\@_skip:
+    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%rbx)
+    jz .L\@_skip_sc_msr
+
+    mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%rbx), %eax
+    mov $MSR_SPEC_CTRL, %ecx
+    wrmsr
+
+.L\@_skip_sc_msr:
 .endm
 
 #endif /* __ASSEMBLY__ */
-- 
2.30.2


