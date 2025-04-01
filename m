Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B8BA784A5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 00:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934828.1336409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzA-0008Jf-EO; Tue, 01 Apr 2025 22:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934828.1336409; Tue, 01 Apr 2025 22:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjzA-0008GW-Av; Tue, 01 Apr 2025 22:21:32 +0000
Received: by outflank-mailman (input) for mailman id 934828;
 Tue, 01 Apr 2025 22:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzjz8-00080l-WE
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 22:21:31 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8fbe079-0f47-11f0-9ea7-5ba50f476ded;
 Wed, 02 Apr 2025 00:21:30 +0200 (CEST)
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
X-Inumbo-ID: a8fbe079-0f47-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743546089; x=1743805289;
	bh=jgn0pg/G4Jnk8NK6PjgRLwbiLA6Q/DQnSJBc+iI7+6w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Kj4GfBplEZBgaOzQLjYljiB8dTx12lkeNHPHrWY80W8Z3UwfIBKUlxwnVd6+cFEla
	 76eLuoZRr+NXhjxs9P01u4N+unraBRSmalODrnPb4syAebK/IYCv36ujLmaN5DwV2k
	 zjhvn2qLL1siRIXmq9o+ez9wcgeX0KxDLK0cA9ZnG+gnmX/SfKcBkw6DXZyRjPbm3E
	 6VGJ2eL0P2XZTtxIuiDWtjsrFNe/zVPgCoPBVgAHShYz1kgsyeCVV1PkMDSffdj6cm
	 d72f3KMDfh97t0RY4fB+s8biiKSdl48VaFvFF/JPLMyu/HGRAsqrGv+Vqq0xnVIsBi
	 /Fm2BQVGb2pOg==
Date: Tue, 01 Apr 2025 22:21:26 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 2/5] x86/vmx: remove HAVE_AS_EPT
Message-ID: <20250401222105.79309-3-dmukhin@ford.com>
In-Reply-To: <20250401222105.79309-1-dmukhin@ford.com>
References: <20250401222105.79309-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3d61b9bcd8c35dfb3a62007efbaea7de840bbdce
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Remove the workaround under HAVE_AS_EPT for older compilers, as
the minimally required GCC 5.1 / Binutils 2.25, and Clang 11
natively support the VMX instructions used in the hypervisor code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/arch.mk                   |  1 -
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 16 ----------------
 2 files changed, 17 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 6e23d3c27c..42c3aa73da 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -11,7 +11,6 @@ CFLAGS +=3D -msoft-float
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 $(call as-option-add,CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
-$(call as-option-add,CFLAGS,CC,"invept (%rax)$(comma)%rax",-DHAVE_AS_EPT)
 $(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
 $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
 $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index cfa04aa5a4..ce3c067a88 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -429,21 +429,13 @@ static always_inline void __invept(unsigned long type=
, uint64_t eptp)
         type =3D INVEPT_ALL_CONTEXT;
=20
     asm volatile (
-#ifdef HAVE_AS_EPT
                    "invept %0, %1\n"
-#else
-                   INVEPT_OPCODE MODRM_EAX_08
-#endif
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, invept)
                    _ASM_BUGFRAME_TEXT(0)
                    UNLIKELY_END_SECTION
                    :
-#ifdef HAVE_AS_EPT
                    : "m" (operand), "r" (type),
-#else
-                   : "a" (&operand), "c" (type),
-#endif
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
                    : "memory" );
 }
@@ -458,11 +450,7 @@ static always_inline void __invvpid(unsigned long type=
, u16 vpid, u64 gva)
=20
     /* Fix up #UD exceptions which occur when TLBs are flushed before VMXO=
N. */
     asm volatile ( "1: "
-#ifdef HAVE_AS_EPT
                    "invvpid %0, %1\n"
-#else
-                   INVVPID_OPCODE MODRM_EAX_08
-#endif
                    /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
                    UNLIKELY_START(be, invvpid)
                    _ASM_BUGFRAME_TEXT(0)
@@ -470,11 +458,7 @@ static always_inline void __invvpid(unsigned long type=
, u16 vpid, u64 gva)
                    "2:"
                    _ASM_EXTABLE(1b, 2b)
                    :
-#ifdef HAVE_AS_EPT
                    : "m" (operand), "r" (type),
-#else
-                   : "a" (&operand), "c" (type),
-#endif
                      _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, =
0)
                    : "memory" );
 }
--=20
2.34.1



