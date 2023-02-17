Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC269B208
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 18:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497216.768138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT4qh-0003fl-FO; Fri, 17 Feb 2023 17:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497216.768138; Fri, 17 Feb 2023 17:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT4qh-0003c6-Bq; Fri, 17 Feb 2023 17:48:43 +0000
Received: by outflank-mailman (input) for mailman id 497216;
 Fri, 17 Feb 2023 17:48:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZJw=6N=citrix.com=prvs=405a65846=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pT4qf-0003GN-6L
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 17:48:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c263dcb-aeeb-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 18:48:36 +0100 (CET)
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
X-Inumbo-ID: 4c263dcb-aeeb-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676656116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ti3YGuh5AB+DkoIjcnY6SodZUoUvn3qg2dzkSWt0iaU=;
  b=FVizbSmtPmHUn/RrywOSt0iHNUvIE6H5Xho4rvNw79p4tqr24AkAMuvQ
   XnBXukdiOjh0TGyQKsxxx3U7f4g773w3+O+2aawqt6AyAC1jhJPTGXq+j
   c7NqMZjBP+Uv0DO9snd0oP2ZRbYjRbWdJG1MKwH1wK/npCTatVAB/dY9C
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97511809
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tUaVdqh8VgjMdx6kNb1JOkzLX161cRAKZh0ujC45NGQN5FlHY01je
 htvW2uFP/bZYmf9LYskaYS+800AvJODnIU1Ggc//ihhHngb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gaBzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQlJw8EXB2Kgd6JnoicZvEwneo6Ac7CadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27J+
 T+fpjShU3n2MvS18ACr0Fyul9Xkw37GddINKpKV2P1T1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewc5QjQM0dTqpr0M0CjoYs4/C4Cso9rcTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4um0WyKRBaJxsldrVj
 Kj74Fo52XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8xOxPPhTy1wBN3wcnT3
 Kt3lu72UB4n5VlPlmLqF4/xL5d1rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRtcu5TPHu2
 48HbaOikkwPONASlwGLqeb/23hWdylkbX03wuQLHtO+zv1OQz1wVaaBmel6JOSIXc19z4/1w
 510YWcAoHKXuJENAVzaApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:tDamwa/G6BXc/XPLPXNuk+HRdr1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZquz+8I3WBxB8bpYOCCggWVxe5ZnPLfKlHbak7DH6tmpN
 1dmstFeZDN5DpB/L7HCWCDer5KqrjmzEnrv5ak854Ed3AyV0gK1XYcNu/vKDwReOAwP+tfKH
 Pz3LskmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD4nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZ9B+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3M0iFQJuYdc99RDBmcIa+d
 pVfYThDTFtABenhkXizypSKRqXLzMO91m9Mw4/U4euokdrdThCvjUlLYok7y89HdsGOuh5zv
 WBPaJymL5USMgKKap7GecaWMOyTnfAWBTWLQupUB3a/Yw8SgXwQqTMkcMIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnL2JFQ6BjCTGi0QDyok6hlltNEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2PJ5NGffsIWbnBI4M1QzjXJtZL2UYTaQuy54GckPLptiOJpzht+TdfvqWLL3xESw8Ume6GX
 cHVCibHrQ10qlqYA6MvPH8YQKeRqWkx+MBLEHzxZlh9LQw
X-IronPort-AV: E=Sophos;i="5.97,306,1669093200"; 
   d="scan'208";a="97511809"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/kexec: Simplify the relocation of compat_mode_gdt_desc
Date: Fri, 17 Feb 2023 17:48:13 +0000
Message-ID: <20230217174814.1006961-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
References: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Assemble the GDT base relative to kexec_reloc, and simply add the identity map
base address to relocate.

Adjust a stale comment, and drop the unused matching label.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/kexec_reloc.S | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index 035164e96f38..a81f64146190 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -72,7 +72,6 @@ ENTRY(kexec_reloc)
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
         jnz     .L_call_32_bit
 
-.L_call_64_bit:
         /* Call the image entry point.  This should never return. */
         callq   *%rbp
         ud2
@@ -81,9 +80,8 @@ ENTRY(kexec_reloc)
         /* Setup IDT. */
         lidt    compat_mode_idt(%rip)
 
-        /* Load compat GDT. */
-        leaq    compat_mode_gdt(%rip), %rax
-        movq    %rax, (compat_mode_gdt_desc + 2)(%rip)
+        /* Relocate and load compat GDT. */
+        add     %rdi, 2 + compat_mode_gdt_desc(%rip)
         lgdt    compat_mode_gdt_desc(%rip)
 
         /* Enter compatibility mode. */
@@ -172,7 +170,7 @@ compatibility_mode:
         .align 4
 compat_mode_gdt_desc:
         .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
-        .quad 0x0000000000000000     /* set in call_32_bit above */
+        .quad . - kexec_reloc        /* Relocated before use */
 
         .type compat_mode_gdt_desc, @object
         .size compat_mode_gdt_desc, . - compat_mode_gdt_desc
-- 
2.30.2


