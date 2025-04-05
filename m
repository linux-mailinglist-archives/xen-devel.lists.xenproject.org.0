Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C986A7C73F
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 03:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938783.1339279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0sHi-0007aM-TB; Sat, 05 Apr 2025 01:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938783.1339279; Sat, 05 Apr 2025 01:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0sHi-0007Y4-PO; Sat, 05 Apr 2025 01:25:22 +0000
Received: by outflank-mailman (input) for mailman id 938783;
 Sat, 05 Apr 2025 01:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9tDv=WX=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0sHg-0007Xy-G4
 for xen-devel@lists.xenproject.org; Sat, 05 Apr 2025 01:25:21 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d364345d-11bc-11f0-9ffb-bf95429c2676;
 Sat, 05 Apr 2025 03:25:15 +0200 (CEST)
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
X-Inumbo-ID: d364345d-11bc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743816312; x=1744075512;
	bh=sBsbW4LWF4zCxNUXqQukytdeUPM5cHk88crdpbHj+Ls=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Jx3cKvChI0kTY2MIWjdo23RvCva8z8lzk8RpHsF1okJ8IM3tXXxrFkrFDmM30beLq
	 2/OUfhgO2gw/+ouBDvq7Kcg8t/id4ytIuvnzmK1Eu5UTlXjva6YDES8MBiw6nT+IMX
	 zmrFwi5O0qdfmgORQ5hAEBFJNRP4D40/l9Uq1cNrmP7HhkHdXygs9AT4a9rgGIUp5J
	 8WSiYxn+choD7AobLOzZwy5UqR7dRUYJ09DOWBFV6Wxiau5VJB+4EZTZY5O3YtynPG
	 VPhZlUTRbxnqWwyzfyX0/qanicRcJuoJzZOfSyKTxTzlrqXFppoUe4hXiKC3OOFzQ5
	 UxjIG+UOP9hxw==
Date: Sat, 05 Apr 2025 01:25:07 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: [PATCH v3] x86/emulate: Remove HAVE_AS_RDRAND and HAVE_AS_RDSEED
Message-ID: <20250405012417.3108759-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1029feedc10450cedfe9e1a58beb8eea82b1bca1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The new toolchain baseline knows the rdrand/rdseed instructions,
no need to carry the workaround in the code.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/208
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- updated arch_get_random()
- Link to v2: https://lore.kernel.org/xen-devel/20250403182250.3329498-6-dm=
ukhin@ford.com/
---
 xen/arch/x86/arch.mk              |  2 --
 xen/arch/x86/include/asm/random.h |  2 +-
 xen/arch/x86/x86_emulate/0fc7.c   | 15 +++++----------
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 3bbaee2a44..5577bf6241 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -10,9 +10,7 @@ CFLAGS +=3D -msoft-float
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
-$(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
 $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
-$(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
 $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVD=
IR)
diff --git a/xen/arch/x86/include/asm/random.h b/xen/arch/x86/include/asm/r=
andom.h
index 9e1fe0bc1d..e1c1c765e1 100644
--- a/xen/arch/x86/include/asm/random.h
+++ b/xen/arch/x86/include/asm/random.h
@@ -8,7 +8,7 @@ static inline unsigned int arch_get_random(void)
     unsigned int val =3D 0;
=20
     if ( cpu_has(&current_cpu_data, X86_FEATURE_RDRAND) )
-        asm volatile ( ".byte 0x0f,0xc7,0xf0" : "+a" (val) );
+        asm volatile ( "rdrand %0" : "=3Da" (val) );
=20
     return val;
 }
diff --git a/xen/arch/x86/x86_emulate/0fc7.c b/xen/arch/x86/x86_emulate/0fc=
7.c
index 5268d5cafd..58c8f79501 100644
--- a/xen/arch/x86/x86_emulate/0fc7.c
+++ b/xen/arch/x86/x86_emulate/0fc7.c
@@ -32,7 +32,6 @@ int x86emul_0fc7(struct x86_emulate_state *s,
             return X86EMUL_UNRECOGNIZED;
=20
         case 6: /* rdrand */
-#ifdef HAVE_AS_RDRAND
             generate_exception_if(s->vex.pfx >=3D vex_f3, X86_EXC_UD);
             host_and_vcpu_must_have(rdrand);
             *dst =3D s->ea;
@@ -43,12 +42,12 @@ int x86emul_0fc7(struct x86_emulate_state *s,
                       : "=3Dr" (dst->val), ASM_FLAG_OUT("=3D@ccc", "=3Dqm"=
) (carry) );
                 break;
             default:
-# ifdef __x86_64__
+#ifdef __x86_64__
                 asm ( "rdrand %k0" ASM_FLAG_OUT(, "; setc %1")
                       : "=3Dr" (dst->val), ASM_FLAG_OUT("=3D@ccc", "=3Dqm"=
) (carry) );
                 break;
             case 8:
-# endif
+#endif
                 asm ( "rdrand %0" ASM_FLAG_OUT(, "; setc %1")
                       : "=3Dr" (dst->val), ASM_FLAG_OUT("=3D@ccc", "=3Dqm"=
) (carry) );
                 break;
@@ -57,9 +56,6 @@ int x86emul_0fc7(struct x86_emulate_state *s,
             if ( carry )
                 regs->eflags |=3D X86_EFLAGS_CF;
             break;
-#else
-            return X86EMUL_UNIMPLEMENTED;
-#endif
=20
         case 7: /* rdseed / rdpid */
             if ( s->vex.pfx =3D=3D vex_f3 ) /* rdpid */
@@ -77,7 +73,7 @@ int x86emul_0fc7(struct x86_emulate_state *s,
                 dst->bytes =3D 4;
                 break;
             }
-#ifdef HAVE_AS_RDSEED
+
             generate_exception_if(s->vex.pfx >=3D vex_f3, X86_EXC_UD);
             host_and_vcpu_must_have(rdseed);
             *dst =3D s->ea;
@@ -88,12 +84,12 @@ int x86emul_0fc7(struct x86_emulate_state *s,
                       : "=3Dr" (dst->val), ASM_FLAG_OUT("=3D@ccc", "=3Dqm"=
) (carry) );
                 break;
             default:
-# ifdef __x86_64__
+#ifdef __x86_64__
                 asm ( "rdseed %k0" ASM_FLAG_OUT(, "; setc %1")
                       : "=3Dr" (dst->val), ASM_FLAG_OUT("=3D@ccc", "=3Dqm"=
) (carry) );
                 break;
             case 8:
-# endif
+#endif
                 asm ( "rdseed %0" ASM_FLAG_OUT(, "; setc %1")
                       : "=3Dr" (dst->val), ASM_FLAG_OUT("=3D@ccc", "=3Dqm"=
) (carry) );
                 break;
@@ -102,7 +98,6 @@ int x86emul_0fc7(struct x86_emulate_state *s,
             if ( carry )
                 regs->eflags |=3D X86_EFLAGS_CF;
             break;
-#endif
         }
     }
     else
--=20
2.34.1



