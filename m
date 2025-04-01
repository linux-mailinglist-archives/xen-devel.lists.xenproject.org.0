Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFB9A784A7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 00:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934832.1336437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzL-0000lw-6c; Tue, 01 Apr 2025 22:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934832.1336437; Tue, 01 Apr 2025 22:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzL-0000k1-3H; Tue, 01 Apr 2025 22:21:43 +0000
Received: by outflank-mailman (input) for mailman id 934832;
 Tue, 01 Apr 2025 22:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzjzK-0008FS-10
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 22:21:42 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af2da4f7-0f47-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 00:21:40 +0200 (CEST)
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
X-Inumbo-ID: af2da4f7-0f47-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743546099; x=1743805299;
	bh=ACi96G57+RpQp/2aY30Q6dbZ1Kg2jsTyScAUQdNS6S8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=UNRyWTskDvaSWQUDN6iEwtcQEWqV1uQrQMEJTfC+oaLCO/0CJtOLhD1G6XV0R2pZ+
	 ribt3Q2B5B/6s2eQ0QVZfP8zgB0/FdSrNNE9SaUVodbdOeeHsPXLNLHD5NWsAgvtBD
	 4EEXyUhOgDfuquVs1g4G/4k/Nvm2Jt7doATALJ74GIn0evs/34H2cL7awHbPZNaxrg
	 E0exOpP55rLABvY5z8v7w5veaFzB6z8kXJrQtTvCeOCF0DlTtlhgPbZAdb/GUDwOtW
	 V148eXSvwm7yw9QEQeFmHlo6bDicUusIq/65OHOe3Y3wQ/yHWdhPu0qVFqhSo3usya
	 role6lyRYHCEg==
Date: Tue, 01 Apr 2025 22:21:34 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 4/5] x86/vmx: remove *_OPCODE
Message-ID: <20250401222105.79309-5-dmukhin@ford.com>
In-Reply-To: <20250401222105.79309-1-dmukhin@ford.com>
References: <20250401222105.79309-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a105727e2157e3c7085f480a753c9f41cb30c15e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Remove all *_OPCODE definitions from vmx.h now that all used
VMX instructions are natively supported by the baseline compiler.

Use vmxon and vmxoff instructions directly.
Update __vmxon() to account for vmxon use.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/202
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 34 ++++++--------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index 10c0619108..1d63e49288 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -257,24 +257,6 @@ typedef union cr_access_qual {
 #define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
 #define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
=20
-#define VMCALL_OPCODE   ".byte 0x0f,0x01,0xc1\n"
-#define VMCLEAR_OPCODE  ".byte 0x66,0x0f,0xc7\n"        /* reg/opcode: /6 =
*/
-#define VMLAUNCH_OPCODE ".byte 0x0f,0x01,0xc2\n"
-#define VMPTRLD_OPCODE  ".byte 0x0f,0xc7\n"             /* reg/opcode: /6 =
*/
-#define VMPTRST_OPCODE  ".byte 0x0f,0xc7\n"             /* reg/opcode: /7 =
*/
-#define VMREAD_OPCODE   ".byte 0x0f,0x78\n"
-#define VMRESUME_OPCODE ".byte 0x0f,0x01,0xc3\n"
-#define VMWRITE_OPCODE  ".byte 0x0f,0x79\n"
-#define INVEPT_OPCODE   ".byte 0x66,0x0f,0x38,0x80\n"   /* m128,r64/32 */
-#define INVVPID_OPCODE  ".byte 0x66,0x0f,0x38,0x81\n"   /* m128,r64/32 */
-#define VMXOFF_OPCODE   ".byte 0x0f,0x01,0xc4\n"
-#define VMXON_OPCODE    ".byte 0xf3,0x0f,0xc7\n"
-
-#define MODRM_EAX_08    ".byte 0x08\n" /* ECX, [EAX] */
-#define MODRM_EAX_06    ".byte 0x30\n" /* [EAX], with reg/opcode: /6 */
-#define MODRM_EAX_07    ".byte 0x38\n" /* [EAX], with reg/opcode: /7 */
-#define MODRM_EAX_ECX   ".byte 0xc1\n" /* EAX, ECX */
-
 extern uint8_t posted_intr_vector;
=20
 #define cpu_has_vmx_ept_exec_only_supported        \
@@ -497,9 +479,7 @@ static inline void vpid_sync_all(void)
=20
 static inline void __vmxoff(void)
 {
-    asm volatile (
-        VMXOFF_OPCODE
-        : : : "memory" );
+    asm volatile ("vmxoff" : : : "memory");
 }
=20
 static inline int __vmxon(u64 addr)
@@ -507,15 +487,17 @@ static inline int __vmxon(u64 addr)
     int rc;
=20
     asm volatile (=20
-        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
-        "   setna %b0 ; neg %0\n" /* CF=3D=3D1 or ZF=3D=3D1 --> rc =3D -1 =
*/
+        "1: vmxon (%[addr])\n"
+        "   setna %b[rc]\n"
+        "   neg %[rc]\n"          /* CF=3D=3D1 or ZF=3D=3D1 --> rc =3D -1 =
*/
         "2:\n"
         ".section .fixup,\"ax\"\n"
-        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc =3D -2 */
+        "3: mov $-2, %[rc]\n"
+        "   jmp 2b\n"             /* #UD   or #GP   --> rc =3D -2 */
         ".previous\n"
         _ASM_EXTABLE(1b, 3b)
-        : "=3Dq" (rc)
-        : "0" (0), "a" (&addr)
+        : [rc] "=3Dq" (rc)
+        : "0" (0), [addr] "r" (&addr)
         : "memory");
=20
     return rc;
--=20
2.34.1



