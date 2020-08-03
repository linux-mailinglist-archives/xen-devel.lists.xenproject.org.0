Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2986523A8DD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:51:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2boD-00054U-Ey; Mon, 03 Aug 2020 14:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2boB-00054C-Pk
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:51:23 +0000
X-Inumbo-ID: cb34c742-d598-11ea-9097-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb34c742-d598-11ea-9097-bc764e2007e4;
 Mon, 03 Aug 2020 14:51:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFFC3AC24;
 Mon,  3 Aug 2020 14:51:35 +0000 (UTC)
Subject: [PATCH 04/10] x86emul: extend decoding / mem access testing to
 VEX-encoded insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <86fc942a-cd83-c7ca-8ef5-41b3ce0e37b9@suse.com>
Date: Mon, 3 Aug 2020 16:51:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1034,6 +1034,449 @@ static const struct {
     { { 0xdf, 0xe8 }, F, N }, /* fucomip */
     { { 0xdf, 0xf0 }, F, N }, /* fcomip */
 };
+
+#define VSIB(n) 0x04 | ((n) << 3), 0x38 /* reg: %xmm<n>, mem: (%eax,%xmm7) */
+
+static const struct vex {
+    uint8_t opc[3];
+    uint8_t len:3;
+    bool modrm:1; /* Should register form (also) be tested? */
+    uint8_t mem:2;
+    uint8_t pfx:2;
+    uint8_t w:2;
+#define WIG 0
+#define W0 1
+#define W1 2
+#define Wn (W0 | W1)
+    uint8_t l:2;
+#define LIG 0
+#define L0 1
+#define L1 2
+#define Ln (L0 | L1)
+} vex_0f[] = {
+    { { 0x10 }, 2, T, R, pfx_no, WIG, Ln }, /* vmovups */
+    { { 0x10 }, 2, T, R, pfx_66, WIG, Ln }, /* vmovupd */
+    { { 0x10 }, 2, T, R, pfx_f3, WIG, LIG }, /* vmovss */
+    { { 0x10 }, 2, T, R, pfx_f2, WIG, LIG }, /* vmovsd */
+    { { 0x11 }, 2, T, W, pfx_no, WIG, Ln }, /* vmovups */
+    { { 0x11 }, 2, T, W, pfx_66, WIG, Ln }, /* vmovupd */
+    { { 0x11 }, 2, T, W, pfx_f3, WIG, LIG }, /* vmovss */
+    { { 0x11 }, 2, T, W, pfx_f2, WIG, LIG }, /* vmovsd */
+    { { 0x12 }, 2, T, R, pfx_no, WIG, L0 }, /* vmovlps / vmovhlps */
+    { { 0x12 }, 2, F, R, pfx_66, WIG, L0 }, /* vmovlpd */
+    { { 0x12 }, 2, T, R, pfx_f3, WIG, Ln }, /* vmovsldup */
+    { { 0x12 }, 2, T, R, pfx_f2, WIG, Ln }, /* vmovddup */
+    { { 0x13 }, 2, F, W, pfx_no, WIG, L0 }, /* vmovlps */
+    { { 0x13 }, 2, F, W, pfx_66, WIG, L0 }, /* vmovlpd */
+    { { 0x14 }, 2, T, R, pfx_no, WIG, Ln }, /* vunpcklps */
+    { { 0x14 }, 2, T, R, pfx_66, WIG, Ln }, /* vunpcklpd */
+    { { 0x15 }, 2, T, R, pfx_no, WIG, Ln }, /* vunpckhps */
+    { { 0x15 }, 2, T, R, pfx_66, WIG, Ln }, /* vunpckhpd */
+    { { 0x16 }, 2, T, R, pfx_no, WIG, L0 }, /* vmovhps / vmovlhps */
+    { { 0x16 }, 2, F, R, pfx_66, WIG, L0 }, /* vmovhpd */
+    { { 0x16 }, 2, T, R, pfx_f3, WIG, Ln }, /* vmovshdup */
+    { { 0x17 }, 2, F, W, pfx_no, WIG, L0 }, /* vmovhps */
+    { { 0x17 }, 2, F, W, pfx_66, WIG, L0 }, /* vmovhpd */
+    { { 0x28 }, 2, T, R, pfx_no, WIG, Ln }, /* vmovaps */
+    { { 0x28 }, 2, T, R, pfx_66, WIG, Ln }, /* vmovapd */
+    { { 0x29 }, 2, T, W, pfx_no, WIG, Ln }, /* vmovaps */
+    { { 0x29 }, 2, T, W, pfx_66, WIG, Ln }, /* vmovapd */
+    { { 0x2a }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsi2ss */
+    { { 0x2a }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtsi2sd */
+    { { 0x2b }, 2, T, W, pfx_no, WIG, Ln }, /* vmovntps */
+    { { 0x2b }, 2, T, W, pfx_66, WIG, Ln }, /* vmovntpd */
+    { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttss2si */
+    { { 0x2c }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2si */
+    { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtss2si */
+    { { 0x2d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtsd2si */
+    { { 0x2e }, 2, T, R, pfx_no, WIG, LIG }, /* vucomiss */
+    { { 0x2e }, 2, T, R, pfx_66, WIG, LIG }, /* vucomisd */
+    { { 0x2f }, 2, T, R, pfx_no, WIG, LIG }, /* vcomiss */
+    { { 0x2f }, 2, T, R, pfx_66, WIG, LIG }, /* vcomisd */
+    { { 0x41, 0xc0 }, 2, F, N, pfx_no, Wn, L1 }, /* kand{w,q} */
+    { { 0x41, 0xc0 }, 2, F, N, pfx_66, Wn, L1 }, /* kand{b,d} */
+    { { 0x42, 0xc0 }, 2, F, N, pfx_no, Wn, L1 }, /* kandn{w,q} */
+    { { 0x42, 0xc0 }, 2, F, N, pfx_66, Wn, L1 }, /* kandn{b,d} */
+    { { 0x44, 0xc0 }, 2, F, N, pfx_no, Wn, L0 }, /* knot{w,q} */
+    { { 0x44, 0xc0 }, 2, F, N, pfx_66, Wn, L0 }, /* knot{b,d} */
+    { { 0x45, 0xc0 }, 2, F, N, pfx_no, Wn, L1 }, /* kor{w,q} */
+    { { 0x45, 0xc0 }, 2, F, N, pfx_66, Wn, L1 }, /* kor{b,d} */
+    { { 0x46, 0xc0 }, 2, F, N, pfx_no, Wn, L1 }, /* kxnor{w,q} */
+    { { 0x46, 0xc0 }, 2, F, N, pfx_66, Wn, L1 }, /* kxnor{b,d} */
+    { { 0x47, 0xc0 }, 2, F, N, pfx_no, Wn, L1 }, /* kxor{w,q} */
+    { { 0x47, 0xc0 }, 2, F, N, pfx_66, Wn, L1 }, /* kxor{b,d} */
+    { { 0x4a, 0xc0 }, 2, F, N, pfx_no, Wn, L1 }, /* kadd{w,q} */
+    { { 0x4a, 0xc0 }, 2, F, N, pfx_66, Wn, L1 }, /* kadd{b,d} */
+    { { 0x4b, 0xc0 }, 2, F, N, pfx_no, Wn, L1 }, /* kunpck{wd,dq} */
+    { { 0x4b, 0xc0 }, 2, F, N, pfx_66, W0, L1 }, /* kunpckbw */
+    { { 0x50, 0xc0 }, 2, F, N, pfx_no, WIG, Ln }, /* vmovmskps */
+    { { 0x50, 0xc0 }, 2, F, N, pfx_66, WIG, Ln }, /* vmovmskpd */
+    { { 0x51 }, 2, T, R, pfx_no, WIG, Ln }, /* vsqrtps */
+    { { 0x51 }, 2, T, R, pfx_66, WIG, Ln }, /* vsqrtpd */
+    { { 0x51 }, 2, T, R, pfx_f3, WIG, LIG }, /* vsqrtss */
+    { { 0x51 }, 2, T, R, pfx_f2, WIG, LIG }, /* vsqrtsd */
+    { { 0x52 }, 2, T, R, pfx_no, WIG, Ln }, /* vrsqrtps */
+    { { 0x52 }, 2, T, R, pfx_f3, WIG, LIG }, /* vrsqrtss */
+    { { 0x53 }, 2, T, R, pfx_no, WIG, Ln }, /* vrcpps */
+    { { 0x53 }, 2, T, R, pfx_f3, WIG, LIG }, /* vrcpss */
+    { { 0x54 }, 2, T, R, pfx_no, WIG, Ln }, /* vandps */
+    { { 0x54 }, 2, T, R, pfx_66, WIG, Ln }, /* vandpd */
+    { { 0x55 }, 2, T, R, pfx_no, WIG, Ln }, /* vandnps */
+    { { 0x55 }, 2, T, R, pfx_66, WIG, Ln }, /* vandnpd */
+    { { 0x56 }, 2, T, R, pfx_no, WIG, Ln }, /* vorps */
+    { { 0x56 }, 2, T, R, pfx_66, WIG, Ln }, /* vorpd */
+    { { 0x57 }, 2, T, R, pfx_no, WIG, Ln }, /* vxorps */
+    { { 0x57 }, 2, T, R, pfx_66, WIG, Ln }, /* vxorpd */
+    { { 0x58 }, 2, T, R, pfx_no, WIG, Ln }, /* vaddps */
+    { { 0x58 }, 2, T, R, pfx_66, WIG, Ln }, /* vaddpd */
+    { { 0x58 }, 2, T, R, pfx_f3, WIG, LIG }, /* vaddss */
+    { { 0x58 }, 2, T, R, pfx_f2, WIG, LIG }, /* vaddsd */
+    { { 0x59 }, 2, T, R, pfx_no, WIG, Ln }, /* vmulps */
+    { { 0x59 }, 2, T, R, pfx_66, WIG, Ln }, /* vmulpd */
+    { { 0x59 }, 2, T, R, pfx_f3, WIG, LIG }, /* vmulss */
+    { { 0x59 }, 2, T, R, pfx_f2, WIG, LIG }, /* vmulsd */
+    { { 0x5a }, 2, T, R, pfx_no, WIG, Ln }, /* vcvtps2pd */
+    { { 0x5a }, 2, T, R, pfx_66, WIG, Ln }, /* vcvtpd2ps */
+    { { 0x5a }, 2, T, R, pfx_f3, WIG, LIG }, /* vcvtss2sd */
+    { { 0x5a }, 2, T, R, pfx_f2, WIG, LIG }, /* vcvtsd2ss */
+    { { 0x5b }, 2, T, R, pfx_no, WIG, Ln }, /* vcvtdq2ps */
+    { { 0x5b }, 2, T, R, pfx_66, WIG, Ln }, /* vcvtps2dq */
+    { { 0x5b }, 2, T, R, pfx_f3, WIG, Ln }, /* vcvttps2dq */
+    { { 0x5c }, 2, T, R, pfx_no, WIG, Ln }, /* vsubps */
+    { { 0x5c }, 2, T, R, pfx_66, WIG, Ln }, /* vsubpd */
+    { { 0x5c }, 2, T, R, pfx_f3, WIG, LIG }, /* vsubss */
+    { { 0x5c }, 2, T, R, pfx_f2, WIG, LIG }, /* vsubsd */
+    { { 0x5d }, 2, T, R, pfx_no, WIG, Ln }, /* vminps */
+    { { 0x5d }, 2, T, R, pfx_66, WIG, Ln }, /* vminpd */
+    { { 0x5d }, 2, T, R, pfx_f3, WIG, LIG }, /* vminss */
+    { { 0x5d }, 2, T, R, pfx_f2, WIG, LIG }, /* vminsd */
+    { { 0x5e }, 2, T, R, pfx_no, WIG, Ln }, /* vdivps */
+    { { 0x5e }, 2, T, R, pfx_66, WIG, Ln }, /* vdivpd */
+    { { 0x5e }, 2, T, R, pfx_f3, WIG, LIG }, /* vdivss */
+    { { 0x5e }, 2, T, R, pfx_f2, WIG, LIG }, /* vdivsd */
+    { { 0x5f }, 2, T, R, pfx_no, WIG, Ln }, /* vmaxps */
+    { { 0x5f }, 2, T, R, pfx_66, WIG, Ln }, /* vmaxpd */
+    { { 0x5f }, 2, T, R, pfx_f3, WIG, LIG }, /* vmaxss */
+    { { 0x5f }, 2, T, R, pfx_f2, WIG, LIG }, /* vmaxsd */
+    { { 0x60 }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpcklbw */
+    { { 0x61 }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpcklwd */
+    { { 0x62 }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpckldq */
+    { { 0x63 }, 2, T, R, pfx_66, WIG, Ln }, /* vpacksswb */
+    { { 0x64 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpgtb */
+    { { 0x65 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpgtw */
+    { { 0x66 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpgtd */
+    { { 0x67 }, 2, T, R, pfx_66, WIG, Ln }, /* vpackuswb */
+    { { 0x68 }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpckhbw */
+    { { 0x69 }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpckhwd */
+    { { 0x6a }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpckhdq */
+    { { 0x6b }, 2, T, R, pfx_66, WIG, Ln }, /* vpackssdw */
+    { { 0x6c }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpcklqdq */
+    { { 0x6d }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpckhqdq */
+    { { 0x6e }, 2, T, R, pfx_66, Wn, L0 }, /* vmov{d,q} */
+    { { 0x6f }, 2, T, R, pfx_66, WIG, Ln }, /* vmovdqa */
+    { { 0x6f }, 2, T, R, pfx_f3, WIG, Ln }, /* vmovdqu */
+    { { 0x70 }, 3, T, R, pfx_66, WIG, Ln }, /* vpshufd */
+    { { 0x70 }, 3, T, R, pfx_f3, WIG, Ln }, /* vpshuflw */
+    { { 0x70 }, 3, T, R, pfx_f2, WIG, Ln }, /* vpshufhw */
+    { { 0x71, 0xd0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsrlw */
+    { { 0x71, 0xe0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsraw */
+    { { 0x71, 0xf0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsllw */
+    { { 0x72, 0xd0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsrld */
+    { { 0x72, 0xe0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsrad */
+    { { 0x72, 0xf0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpslld */
+    { { 0x73, 0xd0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsrlq */
+    { { 0x73, 0xd8 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsrldq */
+    { { 0x73, 0xf0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsllq */
+    { { 0x73, 0xf8 }, 3, F, N, pfx_66, WIG, Ln }, /* vpslldq */
+    { { 0x74 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpeqb */
+    { { 0x75 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpeqw */
+    { { 0x76 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpeqd */
+    { { 0x77 }, 1, F, N, pfx_no, WIG, Ln }, /* vzero{upper,all} */
+    { { 0x7c }, 2, T, R, pfx_66, WIG, Ln }, /* vhaddpd */
+    { { 0x7c }, 2, T, R, pfx_f2, WIG, Ln }, /* vhaddps */
+    { { 0x7d }, 2, T, R, pfx_66, WIG, Ln }, /* vhsubpd */
+    { { 0x7d }, 2, T, R, pfx_f2, WIG, Ln }, /* vhsubps */
+    { { 0x7e }, 2, T, W, pfx_66, Wn, L0 }, /* vmov{d,q} */
+    { { 0x7e }, 2, T, R, pfx_f3, WIG, L0 }, /* vmovq */
+    { { 0x7f }, 2, T, W, pfx_66, WIG, Ln }, /* vmovdqa */
+    { { 0x7f }, 2, T, W, pfx_f3, WIG, Ln }, /* vmovdqu */
+    { { 0x90 }, 2, T, R, pfx_no, Wn, L0 }, /* kmov{w,q} */
+    { { 0x90 }, 2, T, R, pfx_66, Wn, L0 }, /* kmov{b,d} */
+    { { 0x91 }, 2, N, W, pfx_no, Wn, L0 }, /* kmov{w,q} */
+    { { 0x91 }, 2, N, W, pfx_66, Wn, L0 }, /* kmov{b,d} */
+    { { 0x92, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* kmovw */
+    { { 0x92, 0xc0 }, 2, F, N, pfx_66, W0, L0 }, /* kmovb */
+    { { 0x92, 0xc0 }, 2, F, N, pfx_f2, Wn, L0 }, /* kmov{d,q} */
+    { { 0x93, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* kmovw */
+    { { 0x93, 0xc0 }, 2, F, N, pfx_66, W0, L0 }, /* kmovb */
+    { { 0x93, 0xc0 }, 2, F, N, pfx_f2, Wn, L0 }, /* kmov{d,q} */
+    { { 0x98, 0xc0 }, 2, F, N, pfx_no, Wn, L0 }, /* kortest{w,q} */
+    { { 0x98, 0xc0 }, 2, F, N, pfx_66, Wn, L0 }, /* kortest{b,d} */
+    { { 0x99, 0xc0 }, 2, F, N, pfx_no, Wn, L0 }, /* ktest{w,q} */
+    { { 0x99, 0xc0 }, 2, F, N, pfx_66, Wn, L0 }, /* ktest{b,d} */
+    { { 0xae, 0x10 }, 2, F, R, pfx_no, WIG, L0 }, /* vldmxcsr */
+    { { 0xae, 0x18 }, 2, F, W, pfx_no, WIG, L0 }, /* vstmxcsr */
+    { { 0xc2 }, 3, T, R, pfx_no, WIG, Ln }, /* vcmpps */
+    { { 0xc2 }, 3, T, R, pfx_66, WIG, Ln }, /* vcmppd */
+    { { 0xc2 }, 3, T, R, pfx_f3, WIG, LIG }, /* vcmpss */
+    { { 0xc2 }, 3, T, R, pfx_f2, WIG, LIG }, /* vcmpsd */
+    { { 0xc4 }, 3, T, R, pfx_66, WIG, L0 }, /* vpinsrw */
+    { { 0xc5, 0xc0 }, 3, F, N, pfx_66, WIG, L0 }, /* vpextrw */
+    { { 0xc6 }, 3, T, R, pfx_no, WIG, Ln }, /* vshufps */
+    { { 0xc6 }, 3, T, R, pfx_66, WIG, Ln }, /* vshufpd */
+    { { 0xd0 }, 2, T, R, pfx_66, WIG, Ln }, /* vaddsubpd */
+    { { 0xd0 }, 2, T, R, pfx_f2, WIG, Ln }, /* vaddsubps */
+    { { 0xd1 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsrlw */
+    { { 0xd2 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsrld */
+    { { 0xd3 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsrlq */
+    { { 0xd4 }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddq */
+    { { 0xd5 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmullw */
+    { { 0xd6 }, 2, T, W, pfx_66, WIG, L0 }, /* vmovq */
+    { { 0xd7, 0xc0 }, 2, F, N, pfx_66, WIG, Ln }, /* vpmovmskb */
+    { { 0xd8 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusb */
+    { { 0xd9 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusw */
+    { { 0xda }, 2, T, R, pfx_66, WIG, Ln }, /* vpminub */
+    { { 0xdb }, 2, T, R, pfx_66, WIG, Ln }, /* vpand */
+    { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddusb */
+    { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddusw */
+    { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxub */
+    { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vpandn */
+    { { 0xe0 }, 2, T, R, pfx_66, WIG, Ln }, /* vpavgb */
+    { { 0xe1 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsraw */
+    { { 0xe2 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsrad */
+    { { 0xe3 }, 2, T, R, pfx_66, WIG, Ln }, /* vpavgw */
+    { { 0xe4 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmulhuw */
+    { { 0xe5 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmulhw */
+    { { 0xe6 }, 2, T, R, pfx_66, WIG, Ln }, /* vcvttpd2dq */
+    { { 0xe6 }, 2, T, R, pfx_f3, WIG, Ln }, /* vcvtdq2pd */
+    { { 0xe6 }, 2, T, R, pfx_f2, WIG, Ln }, /* vcvtpd2dq */
+    { { 0xe7 }, 2, F, W, pfx_66, WIG, Ln }, /* vmovntdq */
+    { { 0xe8 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubsb */
+    { { 0xe9 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubsw */
+    { { 0xea }, 2, T, R, pfx_66, WIG, Ln }, /* vpminsw */
+    { { 0xeb }, 2, T, R, pfx_66, WIG, Ln }, /* vpor */
+    { { 0xec }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddsb */
+    { { 0xed }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddsw */
+    { { 0xee }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxsw */
+    { { 0xef }, 2, T, R, pfx_66, WIG, Ln }, /* vpxor */
+    { { 0xf0 }, 2, T, R, pfx_f2, WIG, Ln }, /* vlddqu */
+    { { 0xf1 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsllw */
+    { { 0xf2 }, 2, T, R, pfx_66, WIG, Ln }, /* vpslld */
+    { { 0xf3 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsllq */
+    { { 0xf4 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmuludq */
+    { { 0xf5 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaddwd */
+    { { 0xf6 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsadbw */
+    { { 0xf7, 0xc0 }, 2, F, W, pfx_66, WIG, L0 }, /* vmaskmovdqu */
+    { { 0xf8 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubb */
+    { { 0xf9 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubw */
+    { { 0xfa }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubd */
+    { { 0xfb }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubq */
+    { { 0xfc }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddb */
+    { { 0xfd }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddw */
+    { { 0xfe }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddd */
+}, vex_0f38[] = {
+    { { 0x00 }, 2, T, R, pfx_66, WIG, Ln }, /* vpshufb */
+    { { 0x01 }, 2, T, R, pfx_66, WIG, Ln }, /* vphaddw */
+    { { 0x02 }, 2, T, R, pfx_66, WIG, Ln }, /* vphaddd */
+    { { 0x03 }, 2, T, R, pfx_66, WIG, Ln }, /* vphaddsw */
+    { { 0x04 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaddubsw */
+    { { 0x05 }, 2, T, R, pfx_66, WIG, Ln }, /* vphsubw */
+    { { 0x06 }, 2, T, R, pfx_66, WIG, Ln }, /* vphsubd */
+    { { 0x07 }, 2, T, R, pfx_66, WIG, Ln }, /* vphsubsw */
+    { { 0x08 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsignb */
+    { { 0x09 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsignw */
+    { { 0x0a }, 2, T, R, pfx_66, WIG, Ln }, /* vpsignd */
+    { { 0x0b }, 2, T, R, pfx_66, WIG, Ln }, /* vpmulhrsw */
+    { { 0x0c }, 2, T, R, pfx_66, W0, Ln }, /* vpermilps */
+    { { 0x0d }, 2, T, R, pfx_66, W0, Ln }, /* vpermilpd */
+    { { 0x0e }, 2, T, R, pfx_66, W0, Ln }, /* vtestps */
+    { { 0x0f }, 2, T, R, pfx_66, W0, Ln }, /* vtestpd */
+    { { 0x13 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2ps */
+    { { 0x16 }, 2, T, R, pfx_66, W0, L1 }, /* vpermps */
+    { { 0x17 }, 2, T, R, pfx_66, WIG, Ln }, /* vptest */
+    { { 0x18 }, 2, T, R, pfx_66, W0, Ln }, /* vbroadcastss */
+    { { 0x19 }, 2, T, R, pfx_66, W0, L1 }, /* vbroadcastsd */
+    { { 0x1a }, 2, F, R, pfx_66, W0, L1 }, /* vbroadcastf128 */
+    { { 0x1c }, 2, T, R, pfx_66, WIG, Ln }, /* vpabsb */
+    { { 0x1d }, 2, T, R, pfx_66, WIG, Ln }, /* vpabsw */
+    { { 0x1e }, 2, T, R, pfx_66, WIG, Ln }, /* vpabsd */
+    { { 0x20 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxbw */
+    { { 0x21 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxbd */
+    { { 0x22 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxbq */
+    { { 0x23 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxwd */
+    { { 0x24 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxwq */
+    { { 0x25 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxdq */
+    { { 0x28 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmuldq */
+    { { 0x29 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpeqq */
+    { { 0x2a }, 2, F, R, pfx_66, WIG, Ln }, /* vmovntdqa */
+    { { 0x2b }, 2, T, R, pfx_66, WIG, Ln }, /* vpackusdw */
+    { { 0x2c }, 2, F, R, pfx_66, W0, Ln }, /* vmaskmovps */
+    { { 0x2d }, 2, F, R, pfx_66, W0, Ln }, /* vmaskmovpd */
+    { { 0x2e }, 2, F, W, pfx_66, W0, Ln }, /* vmaskmovps */
+    { { 0x2f }, 2, F, W, pfx_66, W0, Ln }, /* vmaskmovpd */
+    { { 0x30 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxbw */
+    { { 0x31 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxbd */
+    { { 0x32 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxbq */
+    { { 0x33 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxwd */
+    { { 0x34 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxwq */
+    { { 0x35 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxdq */
+    { { 0x36 }, 2, T, R, pfx_66, W0, L1 }, /* vpermd */
+    { { 0x37 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpgtq */
+    { { 0x38 }, 2, T, R, pfx_66, WIG, Ln }, /* vpminsb */
+    { { 0x39 }, 2, T, R, pfx_66, WIG, Ln }, /* vpminsd */
+    { { 0x3a }, 2, T, R, pfx_66, WIG, Ln }, /* vpminuw */
+    { { 0x3b }, 2, T, R, pfx_66, WIG, Ln }, /* vpminud */
+    { { 0x3c }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxsb */
+    { { 0x3d }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxsd */
+    { { 0x3e }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxuw */
+    { { 0x3f }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxud */
+    { { 0x40 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmulld */
+    { { 0x41 }, 2, T, R, pfx_66, WIG, L0 }, /* vphminposuw */
+    { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
+    { { 0x46 }, 2, T, R, pfx_66, W0, Ln }, /* vpsravd */
+    { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x58 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastd */
+    { { 0x59 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastq */
+    { { 0x5a }, 2, F, R, pfx_66, W0, L1 }, /* vbroadcasti128 */
+    { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastb */
+    { { 0x79 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastw */
+    { { 0x8c }, 2, F, R, pfx_66, Wn, Ln }, /* vpmaskmov{d,q} */
+    { { 0x8e }, 2, F, W, pfx_66, Wn, Ln }, /* vpmaskmov{d,q} */
+    { { 0x90, VSIB(1) }, 3, F, R, pfx_66, Wn, Ln }, /* vpgatherd{d,q} */
+    { { 0x91, VSIB(1) }, 3, F, R, pfx_66, Wn, Ln }, /* vpgatherq{d,q} */
+    { { 0x92, VSIB(1) }, 3, F, R, pfx_66, Wn, Ln }, /* vgatherdp{s,d} */
+    { { 0x93, VSIB(1) }, 3, F, R, pfx_66, Wn, Ln }, /* vgatherqp{s,d} */
+    { { 0x96 }, 2, T, R, pfx_66, Wn, Ln }, /* vmaddsub132p{s,d} */
+    { { 0x97 }, 2, T, R, pfx_66, Wn, Ln }, /* vmsubadd132p{s,d} */
+    { { 0x98 }, 2, T, R, pfx_66, Wn, Ln }, /* vmadd132p{s,d} */
+    { { 0x99 }, 2, T, R, pfx_66, Wn, LIG }, /* vmadd132s{s,d} */
+    { { 0x9a }, 2, T, R, pfx_66, Wn, Ln }, /* vmsub132p{s,d} */
+    { { 0x9b }, 2, T, R, pfx_66, Wn, LIG }, /* vmsub132s{s,d} */
+    { { 0x9c }, 2, T, R, pfx_66, Wn, Ln }, /* vnmadd132p{s,d} */
+    { { 0x9d }, 2, T, R, pfx_66, Wn, LIG }, /* vnmadd132s{s,d} */
+    { { 0x9e }, 2, T, R, pfx_66, Wn, Ln }, /* vnmsub132p{s,d} */
+    { { 0x9f }, 2, T, R, pfx_66, Wn, LIG }, /* vnmsub132s{s,d} */
+    { { 0xa6 }, 2, T, R, pfx_66, Wn, Ln }, /* vmaddsub213p{s,d} */
+    { { 0xa7 }, 2, T, R, pfx_66, Wn, Ln }, /* vmsubadd213p{s,d} */
+    { { 0xa8 }, 2, T, R, pfx_66, Wn, Ln }, /* vmadd213p{s,d} */
+    { { 0xa9 }, 2, T, R, pfx_66, Wn, LIG }, /* vmadd213s{s,d} */
+    { { 0xaa }, 2, T, R, pfx_66, Wn, Ln }, /* vmsub213p{s,d} */
+    { { 0xab }, 2, T, R, pfx_66, Wn, LIG }, /* vmsub213s{s,d} */
+    { { 0xac }, 2, T, R, pfx_66, Wn, Ln }, /* vnmadd213p{s,d} */
+    { { 0xad }, 2, T, R, pfx_66, Wn, LIG }, /* vnmadd213s{s,d} */
+    { { 0xae }, 2, T, R, pfx_66, Wn, Ln }, /* vnmsub213p{s,d} */
+    { { 0xaf }, 2, T, R, pfx_66, Wn, LIG }, /* vnmsub213s{s,d} */
+    { { 0xb6 }, 2, T, R, pfx_66, Wn, Ln }, /* vmaddsub231p{s,d} */
+    { { 0xb7 }, 2, T, R, pfx_66, Wn, Ln }, /* vmsubadd231p{s,d} */
+    { { 0xb8 }, 2, T, R, pfx_66, Wn, Ln }, /* vmadd231p{s,d} */
+    { { 0xb9 }, 2, T, R, pfx_66, Wn, LIG }, /* vmadd231s{s,d} */
+    { { 0xba }, 2, T, R, pfx_66, Wn, Ln }, /* vmsub231p{s,d} */
+    { { 0xbb }, 2, T, R, pfx_66, Wn, LIG }, /* vmsub231s{s,d} */
+    { { 0xbc }, 2, T, R, pfx_66, Wn, Ln }, /* vnmadd231p{s,d} */
+    { { 0xbd }, 2, T, R, pfx_66, Wn, LIG }, /* vnmadd231s{s,d} */
+    { { 0xbe }, 2, T, R, pfx_66, Wn, Ln }, /* vnmsub231p{s,d} */
+    { { 0xbf }, 2, T, R, pfx_66, Wn, LIG }, /* vnmsub231s{s,d} */
+    { { 0xcf }, 2, T, R, pfx_66, W0, Ln }, /* vgf2p8mulb */
+    { { 0xdb }, 2, T, R, pfx_66, WIG, L0 }, /* vaesimc */
+    { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
+    { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
+    { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
+    { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdeclast */
+    { { 0xf2 }, 2, T, R, pfx_no, Wn, L0 }, /* andn */
+    { { 0xf3, 0x08 }, 2, T, R, pfx_no, Wn, L0 }, /* blsr */
+    { { 0xf3, 0x10 }, 2, T, R, pfx_no, Wn, L0 }, /* blsmsk */
+    { { 0xf3, 0x18 }, 2, T, R, pfx_no, Wn, L0 }, /* blsi */
+    { { 0xf5 }, 2, T, R, pfx_no, Wn, L0 }, /* bzhi */
+    { { 0xf5 }, 2, T, R, pfx_f3, Wn, L0 }, /* pext */
+    { { 0xf5 }, 2, T, R, pfx_f2, Wn, L0 }, /* pdep */
+    { { 0xf6 }, 2, T, R, pfx_f2, Wn, L0 }, /* mulx */
+    { { 0xf7 }, 2, T, R, pfx_no, Wn, L0 }, /* bextr */
+    { { 0xf7 }, 2, T, R, pfx_66, Wn, L0 }, /* shlx */
+    { { 0xf7 }, 2, T, R, pfx_f3, Wn, L0 }, /* sarx */
+    { { 0xf7 }, 2, T, R, pfx_f2, Wn, L0 }, /* shrx */
+}, vex_0f3a[] = {
+    { { 0x00 }, 3, T, R, pfx_66, W1, L1 }, /* vpermq */
+    { { 0x01 }, 3, T, R, pfx_66, W1, L1 }, /* vpermpd */
+    { { 0x02 }, 3, T, R, pfx_66, W0, Ln }, /* vpblendd */
+    { { 0x04 }, 3, T, R, pfx_66, W0, Ln }, /* vpermilps */
+    { { 0x05 }, 3, T, R, pfx_66, W0, Ln }, /* vpermilpd */
+    { { 0x06 }, 3, T, R, pfx_66, W0, L1 }, /* vperm2f128 */
+    { { 0x08 }, 3, T, R, pfx_66, WIG, Ln }, /* vroundps */
+    { { 0x09 }, 3, T, R, pfx_66, WIG, Ln }, /* vroundpd */
+    { { 0x0a }, 3, T, R, pfx_66, WIG, LIG }, /* vroundss */
+    { { 0x0b }, 3, T, R, pfx_66, WIG, LIG }, /* vroundsd */
+    { { 0x0c }, 3, T, R, pfx_66, WIG, Ln }, /* vblendps */
+    { { 0x0d }, 3, T, R, pfx_66, WIG, Ln }, /* vblendpd */
+    { { 0x0e }, 3, T, R, pfx_66, WIG, Ln }, /* vpblendw */
+    { { 0x0f }, 3, T, R, pfx_66, WIG, Ln }, /* vpalignr */
+    { { 0x14 }, 3, T, W, pfx_66, WIG, L0 }, /* vpextrb */
+    { { 0x15 }, 3, T, W, pfx_66, WIG, L0 }, /* vpextrw */
+    { { 0x16 }, 3, T, W, pfx_66, Wn, L0 }, /* vpextr{d,q} */
+    { { 0x17 }, 3, T, W, pfx_66, WIG, L0 }, /* vextractps */
+    { { 0x18 }, 3, T, R, pfx_66, W0, L1 }, /* vinsertf128 */
+    { { 0x19 }, 3, T, W, pfx_66, W0, L1 }, /* vextractf128 */
+    { { 0x1d }, 3, T, W, pfx_66, W0, Ln }, /* vcvtps2ph */
+    { { 0x20 }, 3, T, R, pfx_66, WIG, L0 }, /* vpinsrb */
+    { { 0x21 }, 3, T, R, pfx_66, WIG, L0 }, /* vinsertps */
+    { { 0x22 }, 3, T, R, pfx_66, Wn, L0 }, /* vpinsr{d,q} */
+    { { 0x30, 0xc0 }, 3, F, N, pfx_66, Wn, L0 }, /* kshiftr{b,w} */
+    { { 0x31, 0xc0 }, 3, F, N, pfx_66, Wn, L0 }, /* kshiftr{d,q} */
+    { { 0x32, 0xc0 }, 3, F, N, pfx_66, Wn, L0 }, /* kshiftl{b,w} */
+    { { 0x33, 0xc0 }, 3, F, N, pfx_66, Wn, L0 }, /* kshiftl{d,q} */
+    { { 0x38 }, 3, T, R, pfx_66, W0, L1 }, /* vinserti128 */
+    { { 0x39 }, 3, T, W, pfx_66, W0, L1 }, /* vextracti128 */
+    { { 0x40 }, 3, T, R, pfx_66, WIG, Ln }, /* vdpps */
+    { { 0x41 }, 3, T, R, pfx_66, WIG, Ln }, /* vdppd */
+    { { 0x42 }, 3, T, R, pfx_66, WIG, Ln }, /* vmpsadbw */
+    { { 0x44 }, 3, T, R, pfx_66, WIG, Ln }, /* vpclmulqdq */
+    { { 0x46 }, 3, T, R, pfx_66, W0, L1 }, /* vperm2i128 */
+    { { 0x48 }, 3, T, R, pfx_66, Wn, Ln }, /* vpermil2ps */
+    { { 0x49 }, 3, T, R, pfx_66, Wn, Ln }, /* vpermil2pd */
+    { { 0x4a }, 3, T, R, pfx_66, W0, Ln }, /* vblendvps */
+    { { 0x4b }, 3, T, R, pfx_66, W0, Ln }, /* vblendvpd */
+    { { 0x4c }, 3, T, R, pfx_66, W0, Ln }, /* vpblendvb */
+    { { 0x5c }, 3, T, R, pfx_66, Wn, Ln }, /* vfmaddsubps */
+    { { 0x5d }, 3, T, R, pfx_66, Wn, Ln }, /* vfmaddsubpd */
+    { { 0x5e }, 3, T, R, pfx_66, Wn, Ln }, /* vfmsubaddps */
+    { { 0x5f }, 3, T, R, pfx_66, Wn, Ln }, /* vfmsubaddpd */
+    { { 0x60 }, 3, T, R, pfx_66, WIG, L0 }, /* vpcmpestrm */
+    { { 0x61 }, 3, T, R, pfx_66, WIG, L0 }, /* vpcmpestri */
+    { { 0x62 }, 3, T, R, pfx_66, WIG, L0 }, /* vpcmpistrm */
+    { { 0x63 }, 3, T, R, pfx_66, WIG, L0 }, /* vpcmpistri */
+    { { 0x68 }, 3, T, R, pfx_66, Wn, Ln }, /* vfmaddps */
+    { { 0x69 }, 3, T, R, pfx_66, Wn, Ln }, /* vfmaddpd */
+    { { 0x6a }, 3, T, R, pfx_66, Wn, LIG }, /* vfmaddss */
+    { { 0x6b }, 3, T, R, pfx_66, Wn, LIG }, /* vfmaddsd */
+    { { 0x6c }, 3, T, R, pfx_66, Wn, Ln }, /* vfmsubps */
+    { { 0x6d }, 3, T, R, pfx_66, Wn, Ln }, /* vfmsubpd */
+    { { 0x6e }, 3, T, R, pfx_66, Wn, LIG }, /* vfmsubss */
+    { { 0x6f }, 3, T, R, pfx_66, Wn, LIG }, /* vfmsubsd */
+    { { 0x78 }, 3, T, R, pfx_66, Wn, Ln }, /* vfnmaddps */
+    { { 0x79 }, 3, T, R, pfx_66, Wn, Ln }, /* vfnmaddpd */
+    { { 0x7a }, 3, T, R, pfx_66, Wn, LIG }, /* vfnmaddss */
+    { { 0x7b }, 3, T, R, pfx_66, Wn, LIG }, /* vfnmaddsd */
+    { { 0x7c }, 3, T, R, pfx_66, Wn, Ln }, /* vfnmsubps */
+    { { 0x7d }, 3, T, R, pfx_66, Wn, Ln }, /* vfnmsubpd */
+    { { 0x7e }, 3, T, R, pfx_66, Wn, LIG }, /* vfnmsubss */
+    { { 0x7f }, 3, T, R, pfx_66, Wn, LIG }, /* vfnmsubsd */
+    { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
+    { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
+    { { 0xdf }, 3, T, R, pfx_66, WIG, Ln }, /* vaeskeygenassist */
+    { { 0xf0 }, 3, T, R, pfx_f2, Wn, L0 }, /* rorx */
+};
+
+static const struct {
+    const struct vex *tbl;
+    unsigned int num;
+} vex[] = {
+    { vex_0f,   ARRAY_SIZE(vex_0f) },
+    { vex_0f38, ARRAY_SIZE(vex_0f38) },
+    { vex_0f3a, ARRAY_SIZE(vex_0f3a) },
+};
+
+#undef Wn
+#undef Ln
+
 #undef F
 #undef N
 #undef R
@@ -1125,7 +1568,7 @@ void predicates_test(void *instr, struct
 
     for ( m = 0; m < sizeof(long) / sizeof(int); ++m )
     {
-        unsigned int t;
+        unsigned int t, x;
 
         ctxt->addr_size = 32 << m;
         ctxt->sp_size = 32 << m;
@@ -1211,6 +1654,90 @@ void predicates_test(void *instr, struct
                     ctxt, fetch);
         }
 
+        for ( t = 0; t < ARRAY_SIZE(vex_0f); ++t )
+        {
+            if ( vex_0f[t].w == WIG || (vex_0f[t].w & W0) )
+            {
+                uint8_t *ptr = instr;
+
+                memset(instr + 3, 0xcc, 12);
+
+                *ptr++ = 0xc5;
+                *ptr++ = 0xf8 | vex_0f[t].pfx;
+                memcpy(ptr, vex_0f[t].opc, vex_0f[t].len);
+
+                if ( vex_0f[t].l == LIG || (vex_0f[t].l & L0) )
+                    do_test(instr, vex_0f[t].len + ((void *)ptr - instr),
+                            vex_0f[t].modrm ? (void *)ptr - instr + 1 : 0,
+                            vex_0f[t].mem, ctxt, fetch);
+
+                if ( vex_0f[t].l == LIG || (vex_0f[t].l & L1) )
+                {
+                    ptr[-1] |= 4;
+                    memcpy(ptr, vex_0f[t].opc, vex_0f[t].len);
+
+                    do_test(instr, vex_0f[t].len + ((void *)ptr - instr),
+                            vex_0f[t].modrm ? (void *)ptr - instr + 1 : 0,
+                            vex_0f[t].mem, ctxt, fetch);
+                }
+            }
+        }
+
+        for ( x = 0; x < ARRAY_SIZE(vex); ++x )
+        {
+            for ( t = 0; t < vex[x].num; ++t )
+            {
+                uint8_t *ptr = instr;
+
+                memset(instr + 4, 0xcc, 11);
+
+                *ptr++ = 0xc4;
+                *ptr++ = 0xe1 + x;
+                *ptr++ = 0x78 | vex[x].tbl[t].pfx;
+
+                if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W0) )
+                {
+                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+
+                    if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
+                        do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
+                                vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
+                                vex[x].tbl[t].mem, ctxt, fetch);
+
+                    if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L1) )
+                    {
+                        ptr[-1] |= 4;
+                        memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+
+                        do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
+                                vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
+                                vex[x].tbl[t].mem, ctxt, fetch);
+                    }
+                }
+
+                if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W1) )
+                {
+                    ptr[-1] = 0xf8 | vex[x].tbl[t].pfx;
+                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+
+                    if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
+                        do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
+                                vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
+                                vex[x].tbl[t].mem, ctxt, fetch);
+
+                    if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L1) )
+                    {
+                        ptr[-1] |= 4;
+                        memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+
+                        do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
+                                vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
+                                vex[x].tbl[t].mem, ctxt, fetch);
+                    }
+                }
+            }
+        }
+
         if ( errors )
             exit(1);
 


