Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 646EA2C0D96
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:36:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34548.65679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCxA-0001KV-76; Mon, 23 Nov 2020 14:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34548.65679; Mon, 23 Nov 2020 14:36:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCxA-0001K9-3f; Mon, 23 Nov 2020 14:36:28 +0000
Received: by outflank-mailman (input) for mailman id 34548;
 Mon, 23 Nov 2020 14:36:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCx8-0001Jm-Jh
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:36:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c066fc8b-2b11-40bf-82ea-686599a4b2ef;
 Mon, 23 Nov 2020 14:36:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0371ADD6;
 Mon, 23 Nov 2020 14:36:24 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCx8-0001Jm-Jh
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:36:26 +0000
X-Inumbo-ID: c066fc8b-2b11-40bf-82ea-686599a4b2ef
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c066fc8b-2b11-40bf-82ea-686599a4b2ef;
	Mon, 23 Nov 2020 14:36:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606142184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3g4BskFXFpCG96kBCYAqDugoPJIjg5Q3ivacDS2QB8=;
	b=U0iR6XkTniNv+RdfUInl8gokCgn7R7EBABm33ruRxk85NEsELHmiZdTXg4FdGl13sm7BlL
	aEWChRKq1Cq/em/4wjGB1TdQfTQe2Bew4jkt195IYCH3WDFudwN+HAwjYSo5GQyKfTJXQF
	Z+5IACIyP1MVSsFSNjfbo19OoyVLVrM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D0371ADD6;
	Mon, 23 Nov 2020 14:36:24 +0000 (UTC)
Subject: [PATCH v2 16/17] x86emul: support TILERELEASE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <0efaaac8-e304-a1dc-d5cc-7081dc9f945e@suse.com>
Date: Mon, 23 Nov 2020 15:36:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is relatively straightforward, and hence best suited to introduce a
few other general pieces.

Testing of this will be added once a sensible test can be put together,
i.e. when support for other insns is also there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1335,6 +1335,7 @@ static const struct vex {
     { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
     { { 0x46 }, 2, T, R, pfx_66, W0, Ln }, /* vpsravd */
     { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
     { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -247,6 +247,9 @@ int emul_test_get_fpu(
             break;
     default:
         return X86EMUL_UNHANDLEABLE;
+
+    case X86EMUL_FPU_tile:
+        return cpu_has_amx_tile ? X86EMUL_OKAY : X86EMUL_UNHANDLEABLE;
     }
     return X86EMUL_OKAY;
 }
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -475,6 +475,7 @@ static const struct ext0f38_table {
     [0x43] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x44] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
     [0x45 ... 0x47] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x49] = { .simd_size = simd_other, .two_op = 1 },
     [0x4c] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0x4d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x4e] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
@@ -2014,6 +2015,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
+#define vcpu_has_amx_tile()    (ctxt->cpuid->feat.amx_tile)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
@@ -9460,6 +9462,24 @@ x86_emulate(
         generate_exception_if(vex.l, EXC_UD);
         goto simd_0f_avx;
 
+    case X86EMUL_OPC_VEX(0x0f38, 0x49):
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, EXC_UD);
+        if ( ea.type == OP_REG )
+        {
+            switch ( modrm )
+            {
+            case 0xc0: /* tilerelease */
+                host_and_vcpu_must_have(amx_tile);
+                get_fpu(X86EMUL_FPU_tile);
+                op_bytes = 1; /* fake */
+                goto simd_0f_common;
+
+            default:
+                goto unrecognized_insn;
+            }
+        }
+        goto unimplemented_insn;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x51): /* vpdpbusds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x52): /* vpdpwssd [xy]mm/mem,[xy]mm,[xy]mm */
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -131,6 +131,7 @@
 #define cpu_has_avx512_vp2intersect boot_cpu_has(X86_FEATURE_AVX512_VP2INTERSECT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
+#define cpu_has_amx_tile        boot_cpu_has(X86_FEATURE_AMX_TILE)
 
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)


