Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B75A784A6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 00:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934830.1336429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzF-0000PF-W7; Tue, 01 Apr 2025 22:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934830.1336429; Tue, 01 Apr 2025 22:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzF-0000MY-Rl; Tue, 01 Apr 2025 22:21:37 +0000
Received: by outflank-mailman (input) for mailman id 934830;
 Tue, 01 Apr 2025 22:21:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzjzE-00080l-W8
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 22:21:37 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aca3420c-0f47-11f0-9ea7-5ba50f476ded;
 Wed, 02 Apr 2025 00:21:36 +0200 (CEST)
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
X-Inumbo-ID: aca3420c-0f47-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743546095; x=1743805295;
	bh=N/Gegk4Sj66N/FlyNAXDC53HkooQoIGeUm3rbRAPDd0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TWrWiogpGw6G6z4iMaY3LJEJ4HO+DMLO0IVvcadrquh764VMRSj3LiI3UkiBRRSbS
	 7i2+DlfLprIP4770aaDvkLEnBVmJacbyQA1fEtxoEZUsUpUPW1QVPTIWxKnPSYKhZs
	 gFkWs/EdrAPxRqs0nFxc/GGsnLzyL8G7heLmL9JWaHPcYsNpmn35fueoNqt95BQNcC
	 gT2vkPUCKHeuMGdtO7N3KliEovOZm+OxaQJFq9Kb168EjFu2mPOMOOJPYWPtu6YTU5
	 nNrxZdPm1nTdyx4UJ8SGyIZexauF5lSFlXUhfNVEZBlSj2QOxD4K8De+eQu7lA9X21
	 6N3j5+4rQ+eUA==
Date: Tue, 01 Apr 2025 22:21:29 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 3/5] x86/vmx: remove GAS_VMX_OP()
Message-ID: <20250401222105.79309-4-dmukhin@ford.com>
In-Reply-To: <20250401222105.79309-1-dmukhin@ford.com>
References: <20250401222105.79309-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 93b235a7f48c66273ddf9670081b1e765a1b9a5e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Remove unneeded GAS_VMX_OP() macro, now that all used VMX instuctions
are natively supported by the baseline compiler.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index ce3c067a88..10c0619108 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -310,8 +310,6 @@ extern uint8_t posted_intr_vector;
 #define INVVPID_ALL_CONTEXT                     2
 #define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
=20
-# define GAS_VMX_OP(yes, no) yes
-
 static always_inline void __vmptrld(u64 addr)
 {
     asm volatile (
@@ -374,14 +372,13 @@ static inline enum vmx_insn_errno vmread_safe(unsigne=
d long field,
     unsigned long ret =3D VMX_INSN_SUCCEED;
     bool fail_invalid, fail_valid;
=20
-    asm volatile ( GAS_VMX_OP("vmread %[field], %[value]\n\t",
-                              VMREAD_OPCODE MODRM_EAX_ECX)
+    asm volatile ( "vmread %[field], %[value]\n\t"
                    ASM_FLAG_OUT(, "setc %[invalid]\n\t")
                    ASM_FLAG_OUT(, "setz %[valid]\n\t")
                    : ASM_FLAG_OUT("=3D@ccc", [invalid] "=3Drm") (fail_inva=
lid),
                      ASM_FLAG_OUT("=3D@ccz", [valid] "=3Drm") (fail_valid)=
,
-                     [value] GAS_VMX_OP("=3Drm", "=3Dc") (*value)
-                   : [field] GAS_VMX_OP("r", "a") (field));
+                     [value] "=3Drm" (*value)
+                   : [field] "r" (field));
=20
     if ( unlikely(fail_invalid) )
         ret =3D VMX_INSN_FAIL_INVALID;
@@ -397,14 +394,13 @@ static inline enum vmx_insn_errno vmwrite_safe(unsign=
ed long field,
     unsigned long ret =3D VMX_INSN_SUCCEED;
     bool fail_invalid, fail_valid;
=20
-    asm volatile ( GAS_VMX_OP("vmwrite %[value], %[field]\n\t",
-                              VMWRITE_OPCODE MODRM_EAX_ECX)
+    asm volatile ( "vmwrite %[value], %[field]\n\t"
                    ASM_FLAG_OUT(, "setc %[invalid]\n\t")
                    ASM_FLAG_OUT(, "setz %[valid]\n\t")
                    : ASM_FLAG_OUT("=3D@ccc", [invalid] "=3Drm") (fail_inva=
lid),
                      ASM_FLAG_OUT("=3D@ccz", [valid] "=3Drm") (fail_valid)
-                   : [field] GAS_VMX_OP("r", "a") (field),
-                     [value] GAS_VMX_OP("rm", "c") (value));
+                   : [field] "r" (field),
+                     [value] "rm" (value));
=20
     if ( unlikely(fail_invalid) )
         ret =3D VMX_INSN_FAIL_INVALID;
--=20
2.34.1



