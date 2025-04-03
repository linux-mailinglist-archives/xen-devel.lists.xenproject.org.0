Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D51A7A943
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 20:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937064.1338168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDy-0002Yf-0N; Thu, 03 Apr 2025 18:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937064.1338168; Thu, 03 Apr 2025 18:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0PDx-0002VT-SJ; Thu, 03 Apr 2025 18:23:33 +0000
Received: by outflank-mailman (input) for mailman id 937064;
 Thu, 03 Apr 2025 18:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0PDw-0001N1-Mo
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 18:23:32 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bec5eddf-10b8-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 20:23:31 +0200 (CEST)
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
X-Inumbo-ID: bec5eddf-10b8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743704610; x=1743963810;
	bh=GQ/7FVabQDdWQQqA2ckOWpneHtYQWqdMr/r/gKDzsXM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FdEBnhhYepTdHVUzupYP2bMsW8MZKaFZoa8hR6sBqIZQM1f3tH0wrZvfE3SVTsCVA
	 wpXf4hp6GVGyoRnLJ7GpGjL+aB1HP4gDwQJ2zAg0GTr7fwJ1wNgCrxc5BqSf7ikgBh
	 2HIlhN3ryC3V4q22iAgf2TXWDFCEUJhz61bAyg37TbFTjZeQazc46biHas9apQXjPV
	 /RyU3+/2k96ShaxvW/O4tmwkzjVXsshKMXxbSpzqFOVTdyVllDTNS0+OJe0PIsE77H
	 LboVB6CqUWTLcRE0FHTDMwTkQODqlV33GeejjXJWP9fQAlWVebyWGEr3cJlsjp/2hm
	 BnNgdskJi7xLA==
Date: Thu, 03 Apr 2025 18:23:26 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 5/6] x86/emulate: remove HAVE_AS_RDRAND and HAVE_AS_RDSEED
Message-ID: <20250403182250.3329498-6-dmukhin@ford.com>
In-Reply-To: <20250403182250.3329498-1-dmukhin@ford.com>
References: <20250403182250.3329498-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8dd76c2aceb6a141989cabe4dc4ca563e968872c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The new toolchain baseline knows the rdrand/rdseed instructions,
no need to carry the workaround in the code.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/208
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/arch.mk            |  2 --
 xen/arch/x86/x86_emulate/0fc7.c | 15 +++++----------
 2 files changed, 5 insertions(+), 12 deletions(-)

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



