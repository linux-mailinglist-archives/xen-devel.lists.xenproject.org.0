Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D889992E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701160.1095351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfeq-0007cO-2J; Fri, 05 Apr 2024 09:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701160.1095351; Fri, 05 Apr 2024 09:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfep-0007YW-R3; Fri, 05 Apr 2024 09:14:47 +0000
Received: by outflank-mailman (input) for mailman id 701160;
 Fri, 05 Apr 2024 09:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsfeo-0007WZ-Dr
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 09:14:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0eb9a0d-f32c-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 11:14:44 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id CCE414EE0742;
 Fri,  5 Apr 2024 11:14:42 +0200 (CEST)
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
X-Inumbo-ID: f0eb9a0d-f32c-11ee-a1ef-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 1/9] x86/vlapic: tidy switch statement and address MISRA violation
Date: Fri,  5 Apr 2024 11:14:29 +0200
Message-Id: <81ecc35d04456771b1e48cb25155b0151e2225b8.1712305581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712305581.git.nicola.vetrini@bugseng.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unneded blank lines between switch clauses.

Refactor the last clauses so that a violation of
MISRA C Rule 16.2 is resolved (A switch label shall only be used
when the most closely-enclosing compound statement is the body of
a switch statement). The switch clause ending with the
pseudo keyword "fallthrough" is an allowed exception to Rule 16.3.

No functional change.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/vlapic.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index dcbcf4a1feb5..81efe5472518 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -976,7 +976,6 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
         if ( val & ~APIC_TPRI_MASK )
             return X86EMUL_EXCEPTION;
         break;
-
     case APIC_SPIV:
         if ( val & ~(APIC_VECTOR_MASK | APIC_SPIV_APIC_ENABLED |
                      APIC_SPIV_FOCUS_DISABLED |
@@ -984,38 +983,31 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
                       ? APIC_SPIV_DIRECTED_EOI : 0)) )
             return X86EMUL_EXCEPTION;
         break;
-
     case APIC_LVTT:
         if ( val & ~(LVT_MASK | APIC_TIMER_MODE_MASK) )
             return X86EMUL_EXCEPTION;
         break;
-
     case APIC_LVTTHMR:
     case APIC_LVTPC:
     case APIC_CMCI:
         if ( val & ~(LVT_MASK | APIC_DM_MASK) )
             return X86EMUL_EXCEPTION;
         break;
-
     case APIC_LVT0:
     case APIC_LVT1:
         if ( val & ~LINT_MASK )
             return X86EMUL_EXCEPTION;
         break;
-
     case APIC_LVTERR:
         if ( val & ~LVT_MASK )
             return X86EMUL_EXCEPTION;
         break;
-
     case APIC_TMICT:
         break;
-
     case APIC_TDCR:
         if ( val & ~APIC_TDR_DIV_MASK )
             return X86EMUL_EXCEPTION;
         break;
-
     case APIC_ICR:
         if ( (uint32_t)val & ~(APIC_VECTOR_MASK | APIC_DM_MASK |
                                APIC_DEST_MASK | APIC_INT_ASSERT |
@@ -1023,21 +1015,19 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
             return X86EMUL_EXCEPTION;
         vlapic_set_reg(vlapic, APIC_ICR2, val >> 32);
         break;
-
     case APIC_SELF_IPI:
         if ( val & ~APIC_VECTOR_MASK )
             return X86EMUL_EXCEPTION;
         offset = APIC_ICR;
         val = APIC_DEST_SELF | (val & APIC_VECTOR_MASK);
         break;
-
     case APIC_EOI:
     case APIC_ESR:
-        if ( val )
-        {
+        if ( !val )
+            break;
+        fallthrough;
     default:
             return X86EMUL_EXCEPTION;
-        }
     }
 
     vlapic_reg_write(v, array_index_nospec(offset, PAGE_SIZE), val);
-- 
2.34.1

