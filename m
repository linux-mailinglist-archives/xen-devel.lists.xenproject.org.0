Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA01296027
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 15:38:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10445.27750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVanL-0003Zq-TU; Thu, 22 Oct 2020 13:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10445.27750; Thu, 22 Oct 2020 13:38:19 +0000
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
	id 1kVanL-0003ZT-QO; Thu, 22 Oct 2020 13:38:19 +0000
Received: by outflank-mailman (input) for mailman id 10445;
 Thu, 22 Oct 2020 13:38:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVanK-0003ZO-S3
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:38:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b98f4bb-79b1-450c-9483-18225160ea6d;
 Thu, 22 Oct 2020 13:38:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE75CAC2F;
 Thu, 22 Oct 2020 13:38:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVanK-0003ZO-S3
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:38:18 +0000
X-Inumbo-ID: 7b98f4bb-79b1-450c-9483-18225160ea6d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7b98f4bb-79b1-450c-9483-18225160ea6d;
	Thu, 22 Oct 2020 13:38:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603373894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cLEszLVcl3lbTdxN5S3K3DwgD7NiXsnnj7qZ4HCii80=;
	b=dScRkXefHj2hgt1Ub/m6+LkogeshpHquW8HPgMA8uHpJekRtX5DLMOby6k/KyAeQYiRq87
	1fpV35/HM2zD7n0lWt4aqBqTODb2dFezsN+7Ir7ZgXLminclE9rFBVUFS4ly3EwVID8q2n
	E0zDqFh7yk73UGsERtag7uyK7hS0MMo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DE75CAC2F;
	Thu, 22 Oct 2020 13:38:13 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: fix PINSRW and adjust other {,V}PINSR*
Message-ID: <34eba71f-e92a-22e0-42ae-dd85e682a8ff@suse.com>
Date: Thu, 22 Oct 2020 15:38:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The use of simd_packed_int together with no further update to op_bytes
has lead to wrong signaling of #GP(0) for PINSRW without a 16-byte
aligned memory operand. Use simd_none instead and override it after
general decoding with simd_other, like is done for the B/D/Q siblings.

While benign, for consistency also use DstImplicit instead of DstReg
in x86_decode_twobyte().

PINSR{B,D,Q} also had a stray (redundant) get_fpu() invocation, which
gets dropped.

For further consistency also
- use src.bytes instead of op_bytes in relevant memcpy() invocations,
- avoid the pointless updating of op_bytes (all we care about later is
  that the value be less than 16).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -362,7 +362,7 @@ static const struct twobyte_table {
     [0xc1] = { DstMem|SrcReg|ModRM },
     [0xc2] = { DstImplicit|SrcImmByte|ModRM, simd_any_fp, d8s_vl },
     [0xc3] = { DstMem|SrcReg|ModRM|Mov },
-    [0xc4] = { DstReg|SrcImmByte|ModRM, simd_packed_int, 1 },
+    [0xc4] = { DstImplicit|SrcImmByte|ModRM, simd_none, 1 },
     [0xc5] = { DstReg|SrcImmByte|ModRM|Mov },
     [0xc6] = { DstImplicit|SrcImmByte|ModRM, simd_packed_fp, d8s_vl },
     [0xc7] = { ImplicitOps|ModRM },
@@ -2786,7 +2786,7 @@ x86_decode_twobyte(
         /* fall through */
     case X86EMUL_OPC_VEX_66(0, 0xc4): /* vpinsrw */
     case X86EMUL_OPC_EVEX_66(0, 0xc4): /* vpinsrw */
-        state->desc = DstReg | SrcMem16;
+        state->desc = DstImplicit | SrcMem16;
         break;
 
     case 0xf0:
@@ -8589,6 +8589,7 @@ x86_emulate(
         generate_exception_if(vex.l, EXC_UD);
         memcpy(mmvalp, &src.val, 2);
         ea.type = OP_MEM;
+        state->simd_size = simd_other;
         goto simd_0f_int_imm8;
 
 #ifndef X86EMUL_NO_SIMD
@@ -8603,9 +8604,8 @@ x86_emulate(
             host_and_vcpu_must_have(avx512bw);
         if ( !mode_64bit() )
             evex.w = 0;
-        memcpy(mmvalp, &src.val, op_bytes);
+        memcpy(mmvalp, &src.val, src.bytes);
         ea.type = OP_MEM;
-        op_bytes = src.bytes;
         d = SrcMem16; /* Fake for the common SIMD code below. */
         state->simd_size = simd_other;
         goto avx512f_imm8_no_sae;
@@ -10774,10 +10774,8 @@ x86_emulate(
     case X86EMUL_OPC_66(0x0f3a, 0x20): /* pinsrb $imm8,r32/m8,xmm */
     case X86EMUL_OPC_66(0x0f3a, 0x22): /* pinsr{d,q} $imm8,r/m,xmm */
         host_and_vcpu_must_have(sse4_1);
-        get_fpu(X86EMUL_FPU_xmm);
-        memcpy(mmvalp, &src.val, op_bytes);
+        memcpy(mmvalp, &src.val, src.bytes);
         ea.type = OP_MEM;
-        op_bytes = src.bytes;
         d = SrcMem16; /* Fake for the common SIMD code below. */
         state->simd_size = simd_other;
         goto simd_0f3a_common;
@@ -10787,9 +10785,8 @@ x86_emulate(
         generate_exception_if(vex.l, EXC_UD);
         if ( !mode_64bit() )
             vex.w = 0;
-        memcpy(mmvalp, &src.val, op_bytes);
+        memcpy(mmvalp, &src.val, src.bytes);
         ea.type = OP_MEM;
-        op_bytes = src.bytes;
         d = SrcMem16; /* Fake for the common SIMD code below. */
         state->simd_size = simd_other;
         goto simd_0f_int_imm8;

