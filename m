Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A0323A8F2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:54:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2br2-0005cK-3z; Mon, 03 Aug 2020 14:54:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2br0-0005c8-Fm
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:54:18 +0000
X-Inumbo-ID: 334f68f0-d599-11ea-9097-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 334f68f0-d599-11ea-9097-bc764e2007e4;
 Mon, 03 Aug 2020 14:54:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8AEB7AC24;
 Mon,  3 Aug 2020 14:54:30 +0000 (UTC)
Subject: [PATCH 09/10] x86emul: extend decoding / mem access testing to
 EVEX-encoded insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <bec7a17d-281b-217c-3cde-be8ac81d9714@suse.com>
Date: Mon, 3 Aug 2020 16:54:14 +0200
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
@@ -1564,9 +1564,469 @@ static const struct {
     { xop_0a, ARRAY_SIZE(xop_0a), 4 },
 };
 
-#undef Wn
 #undef Ln
 
+static const struct evex {
+    uint8_t opc[3];
+    uint8_t len:3;
+    bool modrm:1; /* Should register form (also) be tested? */
+    uint8_t mem:2;
+    uint8_t pfx:2;
+    uint8_t w:2;
+    uint8_t l:3;
+    bool mask:1;
+#define L2 4
+#define Ln (L0 | L1 | L2)
+} evex_0f[] = {
+    { { 0x10 }, 2, T, R, pfx_no, W0, Ln }, /* vmovups */
+    { { 0x10 }, 2, T, R, pfx_66, W1, Ln }, /* vmovupd */
+    { { 0x10 }, 2, T, R, pfx_f3, W0, LIG }, /* vmovss */
+    { { 0x10 }, 2, T, R, pfx_f2, W1, LIG }, /* vmovsd */
+    { { 0x11 }, 2, T, W, pfx_no, W0, Ln }, /* vmovups */
+    { { 0x11 }, 2, T, W, pfx_66, W1, Ln }, /* vmovupd */
+    { { 0x11 }, 2, T, W, pfx_f3, W0, LIG }, /* vmovss */
+    { { 0x11 }, 2, T, W, pfx_f2, W1, LIG }, /* vmovsd */
+    { { 0x12 }, 2, T, R, pfx_no, W0, L0 }, /* vmovlps / vmovhlps */
+    { { 0x12 }, 2, F, R, pfx_66, W1, L0 }, /* vmovlpd */
+    { { 0x12 }, 2, T, R, pfx_f3, W0, Ln }, /* vmovsldup */
+    { { 0x12 }, 2, T, R, pfx_f2, W1, Ln }, /* vmovddup */
+    { { 0x13 }, 2, F, W, pfx_no, W0, L0 }, /* vmovlps */
+    { { 0x13 }, 2, F, W, pfx_66, W1, L0 }, /* vmovlpd */
+    { { 0x14 }, 2, T, R, pfx_no, W0, Ln }, /* vunpcklps */
+    { { 0x14 }, 2, T, R, pfx_66, W1, Ln }, /* vunpcklpd */
+    { { 0x15 }, 2, T, R, pfx_no, W0, Ln }, /* vunpckhps */
+    { { 0x15 }, 2, T, R, pfx_66, W1, Ln }, /* vunpckhpd */
+    { { 0x16 }, 2, T, R, pfx_no, W0, L0 }, /* vmovhps / vmovlhps */
+    { { 0x16 }, 2, F, R, pfx_66, W1, L0 }, /* vmovhpd */
+    { { 0x16 }, 2, T, R, pfx_f3, W0, Ln }, /* vmovshdup */
+    { { 0x17 }, 2, F, W, pfx_no, W0, L0 }, /* vmovhps */
+    { { 0x17 }, 2, F, W, pfx_66, W1, L0 }, /* vmovhpd */
+    { { 0x28 }, 2, T, R, pfx_no, W0, Ln }, /* vmovaps */
+    { { 0x28 }, 2, T, R, pfx_66, W1, Ln }, /* vmovapd */
+    { { 0x29 }, 2, T, W, pfx_no, W0, Ln }, /* vmovaps */
+    { { 0x29 }, 2, T, W, pfx_66, W1, Ln }, /* vmovapd */
+    { { 0x2a }, 2, T, R, pfx_f3, W0, LIG }, /* vcvtsi2ss */
+    { { 0x2a }, 2, T, R, pfx_f2, W1, LIG }, /* vcvtsi2sd */
+    { { 0x2b }, 2, T, W, pfx_no, W0, Ln }, /* vmovntps */
+    { { 0x2b }, 2, T, W, pfx_66, W1, Ln }, /* vmovntpd */
+    { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttss2si */
+    { { 0x2c }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2si */
+    { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtss2si */
+    { { 0x2d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtsd2si */
+    { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomiss */
+    { { 0x2e }, 2, T, R, pfx_66, W1, LIG }, /* vucomisd */
+    { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomiss */
+    { { 0x2f }, 2, T, R, pfx_66, W1, LIG }, /* vcomisd */
+    { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtps */
+    { { 0x51 }, 2, T, R, pfx_66, W1, Ln }, /* vsqrtpd */
+    { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtss */
+    { { 0x51 }, 2, T, R, pfx_f2, W1, LIG }, /* vsqrtsd */
+    { { 0x54 }, 2, T, R, pfx_no, W0, Ln }, /* vandps */
+    { { 0x54 }, 2, T, R, pfx_66, W1, Ln }, /* vandpd */
+    { { 0x55 }, 2, T, R, pfx_no, W0, Ln }, /* vandnps */
+    { { 0x55 }, 2, T, R, pfx_66, W1, Ln }, /* vandnpd */
+    { { 0x56 }, 2, T, R, pfx_no, W0, Ln }, /* vorps */
+    { { 0x56 }, 2, T, R, pfx_66, W1, Ln }, /* vorpd */
+    { { 0x57 }, 2, T, R, pfx_no, W0, Ln }, /* vxorps */
+    { { 0x57 }, 2, T, R, pfx_66, W1, Ln }, /* vxorpd */
+    { { 0x58 }, 2, T, R, pfx_no, W0, Ln }, /* vaddps */
+    { { 0x58 }, 2, T, R, pfx_66, W1, Ln }, /* vaddpd */
+    { { 0x58 }, 2, T, R, pfx_f3, W0, LIG }, /* vaddss */
+    { { 0x58 }, 2, T, R, pfx_f2, W1, LIG }, /* vaddsd */
+    { { 0x59 }, 2, T, R, pfx_no, W0, Ln }, /* vmulps */
+    { { 0x59 }, 2, T, R, pfx_66, W1, Ln }, /* vmulpd */
+    { { 0x59 }, 2, T, R, pfx_f3, W0, LIG }, /* vmulss */
+    { { 0x59 }, 2, T, R, pfx_f2, W1, LIG }, /* vmulsd */
+    { { 0x5a }, 2, T, R, pfx_no, W0, Ln }, /* vcvtps2pd */
+    { { 0x5a }, 2, T, R, pfx_66, W1, Ln }, /* vcvtpd2ps */
+    { { 0x5a }, 2, T, R, pfx_f3, W0, LIG }, /* vcvtss2sd */
+    { { 0x5a }, 2, T, R, pfx_f2, W1, LIG }, /* vcvtsd2ss */
+    { { 0x5b }, 2, T, R, pfx_no, Wn, Ln }, /* vcvt{d,q}q2ps */
+    { { 0x5b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2dq */
+    { { 0x5b }, 2, T, R, pfx_f3, W0, Ln }, /* vcvttps2dq */
+    { { 0x5c }, 2, T, R, pfx_no, W0, Ln }, /* vsubps */
+    { { 0x5c }, 2, T, R, pfx_66, W1, Ln }, /* vsubpd */
+    { { 0x5c }, 2, T, R, pfx_f3, W0, LIG }, /* vsubss */
+    { { 0x5c }, 2, T, R, pfx_f2, W1, LIG }, /* vsubsd */
+    { { 0x5d }, 2, T, R, pfx_no, W0, Ln }, /* vminps */
+    { { 0x5d }, 2, T, R, pfx_66, W1, Ln }, /* vminpd */
+    { { 0x5d }, 2, T, R, pfx_f3, W0, LIG }, /* vminss */
+    { { 0x5d }, 2, T, R, pfx_f2, W1, LIG }, /* vminsd */
+    { { 0x5e }, 2, T, R, pfx_no, W0, Ln }, /* vdivps */
+    { { 0x5e }, 2, T, R, pfx_66, W1, Ln }, /* vdivpd */
+    { { 0x5e }, 2, T, R, pfx_f3, W0, LIG }, /* vdivss */
+    { { 0x5e }, 2, T, R, pfx_f2, W1, LIG }, /* vdivsd */
+    { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxps */
+    { { 0x5f }, 2, T, R, pfx_66, W1, Ln }, /* vmaxpd */
+    { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxss */
+    { { 0x5f }, 2, T, R, pfx_f2, W1, LIG }, /* vmaxsd */
+    { { 0x60 }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpcklbw */
+    { { 0x61 }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpcklwd */
+    { { 0x62 }, 2, T, R, pfx_66, W0, Ln }, /* vpunpckldq */
+    { { 0x63 }, 2, T, R, pfx_66, WIG, Ln }, /* vpacksswb */
+    { { 0x64 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpgtb */
+    { { 0x65 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpgtw */
+    { { 0x66 }, 2, T, R, pfx_66, W0, Ln }, /* vpcmpgtd */
+    { { 0x67 }, 2, T, R, pfx_66, WIG, Ln }, /* vpackuswb */
+    { { 0x68 }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpckhbw */
+    { { 0x69 }, 2, T, R, pfx_66, WIG, Ln }, /* vpunpckhwd */
+    { { 0x6a }, 2, T, R, pfx_66, W0, Ln }, /* vpunpckhdq */
+    { { 0x6b }, 2, T, R, pfx_66, W0, Ln }, /* vpackssdw */
+    { { 0x6c }, 2, T, R, pfx_66, W1, Ln }, /* vpunpcklqdq */
+    { { 0x6d }, 2, T, R, pfx_66, W1, Ln }, /* vpunpckhqdq */
+    { { 0x6e }, 2, T, R, pfx_66, Wn, L0 }, /* vmov{d,q} */
+    { { 0x6f }, 2, T, R, pfx_66, Wn, Ln }, /* vmovdqa{32,64} */
+    { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovdqu{32,64} */
+    { { 0x6f }, 2, T, R, pfx_f2, Wn, Ln }, /* vmovdqu{8,16} */
+    { { 0x70 }, 3, T, R, pfx_66, W0, Ln }, /* vpshufd */
+    { { 0x70 }, 3, T, R, pfx_f3, WIG, Ln }, /* vpshuflw */
+    { { 0x70 }, 3, T, R, pfx_f2, WIG, Ln }, /* vpshufhw */
+    { { 0x71, 0xd0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsrlw */
+    { { 0x71, 0xe0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsraw */
+    { { 0x71, 0xf0 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsllw */
+    { { 0x72, 0xc0 }, 3, F, N, pfx_66, Wn, Ln }, /* vpror{d,q} */
+    { { 0x72, 0xc8 }, 3, F, N, pfx_66, Wn, Ln }, /* vprol{d,q} */
+    { { 0x72, 0xd0 }, 3, F, N, pfx_66, W0, Ln }, /* vpsrld */
+    { { 0x72, 0xe0 }, 3, F, N, pfx_66, Wn, Ln }, /* vpsra{d,q} */
+    { { 0x72, 0xf0 }, 3, F, N, pfx_66, W0, Ln }, /* vpslld */
+    { { 0x73, 0xd0 }, 3, F, N, pfx_66, W1, Ln }, /* vpsrlq */
+    { { 0x73, 0xd8 }, 3, F, N, pfx_66, WIG, Ln }, /* vpsrldq */
+    { { 0x73, 0xf0 }, 3, F, N, pfx_66, W0, Ln }, /* vpsllq */
+    { { 0x73, 0xf8 }, 3, F, N, pfx_66, WIG, Ln }, /* vpslldq */
+    { { 0x74 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpeqb */
+    { { 0x75 }, 2, T, R, pfx_66, WIG, Ln }, /* vpcmpeqw */
+    { { 0x76 }, 2, T, R, pfx_66, W0, Ln }, /* vpcmpeqd */
+    { { 0x78 }, 2, T, R, pfx_no, Wn, Ln }, /* vcvttp{s,d}2udq */
+    { { 0x78 }, 2, T, R, pfx_66, Wn, Ln }, /* vcvttp{s,d}2uqq */
+    { { 0x78 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttss2usi */
+    { { 0x78 }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2usi */
+    { { 0x79 }, 2, T, R, pfx_no, Wn, Ln }, /* vcvtp{s,d}2udq */
+    { { 0x79 }, 2, T, R, pfx_66, Wn, Ln }, /* vcvtp{s,d}2uqq */
+    { { 0x79 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtss2usi */
+    { { 0x79 }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtsd2usi */
+    { { 0x7a }, 2, T, R, pfx_66, Wn, Ln }, /* vcvttp{s,d}2qq */
+    { { 0x7a }, 2, T, R, pfx_f3, Wn, Ln }, /* vcvtu{d,q}2pd */
+    { { 0x7a }, 2, T, R, pfx_f2, Wn, Ln }, /* vcvtu{d,q}2ps */
+    { { 0x7b }, 2, T, R, pfx_66, Wn, Ln }, /* vcvtp{s,d}2qq */
+    { { 0x7b }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtusi2s */
+    { { 0x7b }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtusi2s */
+    { { 0x7e }, 2, T, W, pfx_66, Wn, L0 }, /* vmov{d,q} */
+    { { 0x7e }, 2, T, R, pfx_f3, W1, L0 }, /* vmovq */
+    { { 0x7f }, 2, T, W, pfx_66, Wn, Ln }, /* vmovdqa{32,64} */
+    { { 0x7f }, 2, T, W, pfx_f3, Wn, Ln }, /* vmovdqu{32,64} */
+    { { 0x7f }, 2, T, W, pfx_f2, Wn, Ln }, /* vmovdqu{8,16} */
+    { { 0xc2 }, 3, T, R, pfx_no, W0, Ln }, /* vcmpps */
+    { { 0xc2 }, 3, T, R, pfx_66, W1, Ln }, /* vcmppd */
+    { { 0xc2 }, 3, T, R, pfx_f3, W0, LIG }, /* vcmpss */
+    { { 0xc2 }, 3, T, R, pfx_f2, W1, LIG }, /* vcmpsd */
+    { { 0xc4 }, 3, T, R, pfx_66, WIG, L0 }, /* vpinsrw */
+    { { 0xc5, 0xc0 }, 3, F, N, pfx_66, WIG, L0 }, /* vpextrw */
+    { { 0xc6 }, 3, T, R, pfx_no, W0, Ln }, /* vshufps */
+    { { 0xc6 }, 3, T, R, pfx_66, W1, Ln }, /* vshufpd */
+    { { 0xd1 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsrlw */
+    { { 0xd2 }, 2, T, R, pfx_66, W0, Ln }, /* vpsrld */
+    { { 0xd3 }, 2, T, R, pfx_66, W1, Ln }, /* vpsrlq */
+    { { 0xd4 }, 2, T, R, pfx_66, W1, Ln }, /* vpaddq */
+    { { 0xd5 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmullw */
+    { { 0xd6 }, 2, T, W, pfx_66, W1, L0 }, /* vmovq */
+    { { 0xd8 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusb */
+    { { 0xd9 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusw */
+    { { 0xda }, 2, T, R, pfx_66, WIG, Ln }, /* vpminub */
+    { { 0xdb }, 2, T, R, pfx_66, Wn, Ln }, /* vpand{d,q} */
+    { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddusb */
+    { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddusw */
+    { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxub */
+    { { 0xdf }, 2, T, R, pfx_66, Wn, Ln }, /* vpandn{d,q} */
+    { { 0xe0 }, 2, T, R, pfx_66, WIG, Ln }, /* vpavgb */
+    { { 0xe1 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsraw */
+    { { 0xe2 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsra{d,q} */
+    { { 0xe3 }, 2, T, R, pfx_66, WIG, Ln }, /* vpavgw */
+    { { 0xe4 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmulhuw */
+    { { 0xe5 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmulhw */
+    { { 0xe6 }, 2, T, R, pfx_66, WIG, Ln }, /* vcvttpd2dq */
+    { { 0xe6 }, 2, T, R, pfx_f3, Wn, Ln }, /* vcvt{d,q}q2pd */
+    { { 0xe6 }, 2, T, R, pfx_f2, WIG, Ln }, /* vcvtpd2dq */
+    { { 0xe7 }, 2, F, W, pfx_66, W0, Ln }, /* vmovntdq */
+    { { 0xe8 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubsb */
+    { { 0xe9 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubsw */
+    { { 0xea }, 2, T, R, pfx_66, WIG, Ln }, /* vpminsw */
+    { { 0xeb }, 2, T, R, pfx_66, Wn, Ln }, /* vpor{d,q} */
+    { { 0xec }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddsb */
+    { { 0xed }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddsw */
+    { { 0xee }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxsw */
+    { { 0xef }, 2, T, R, pfx_66, Wn, Ln }, /* vpxor{d,q} */
+    { { 0xf1 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsllw */
+    { { 0xf2 }, 2, T, R, pfx_66, W0, Ln }, /* vpslld */
+    { { 0xf3 }, 2, T, R, pfx_66, W1, Ln }, /* vpsllq */
+    { { 0xf4 }, 2, T, R, pfx_66, W1, Ln }, /* vpmuludq */
+    { { 0xf5 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaddwd */
+    { { 0xf6 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsadbw */
+    { { 0xf8 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubb */
+    { { 0xf9 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubw */
+    { { 0xfa }, 2, T, R, pfx_66, W0, Ln }, /* vpsubd */
+    { { 0xfb }, 2, T, R, pfx_66, W1, Ln }, /* vpsubq */
+    { { 0xfc }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddb */
+    { { 0xfd }, 2, T, R, pfx_66, WIG, Ln }, /* vpaddw */
+    { { 0xfe }, 2, T, R, pfx_66, W0, Ln }, /* vpaddd */
+}, evex_0f38[] = {
+    { { 0x00 }, 2, T, R, pfx_66, WIG, Ln }, /* vpshufb */
+    { { 0x04 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaddubsw */
+    { { 0x0b }, 2, T, R, pfx_66, WIG, Ln }, /* vpmulhrsw */
+    { { 0x0c }, 2, T, R, pfx_66, W0, Ln }, /* vpermilps */
+    { { 0x0d }, 2, T, R, pfx_66, W1, Ln }, /* vpermilpd */
+    { { 0x10 }, 2, T, R, pfx_66, W1, Ln }, /* vpsrlvw */
+    { { 0x10 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovuswb */
+    { { 0x11 }, 2, T, R, pfx_66, W1, Ln }, /* vpsravw */
+    { { 0x11 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovusdb */
+    { { 0x12 }, 2, T, R, pfx_66, W1, Ln }, /* vpsllvw */
+    { { 0x12 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovusqb */
+    { { 0x13 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2ps */
+    { { 0x13 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovusdw */
+    { { 0x14 }, 2, T, R, pfx_66, Wn, Ln }, /* vprorv{d,q} */
+    { { 0x14 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovusqw */
+    { { 0x15 }, 2, T, R, pfx_66, Wn, Ln }, /* vprolv{d,q} */
+    { { 0x15 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovusqd */
+    { { 0x16 }, 2, T, R, pfx_66, Wn, L1|L2 }, /* vpermp{s,d} */
+    { { 0x18 }, 2, T, R, pfx_66, W0, Ln }, /* vbroadcastss */
+    { { 0x19 }, 2, T, R, pfx_66, Wn, L1|L2 }, /* vbroadcast{32x2,sd} */
+    { { 0x1a }, 2, F, R, pfx_66, Wn, L1|L2 }, /* vbroadcastf{32x4,64x2} */
+    { { 0x1b }, 2, F, R, pfx_66, Wn, L2 }, /* vbroadcastf{32x8,64x4} */
+    { { 0x1c }, 2, T, R, pfx_66, WIG, Ln }, /* vpabsb */
+    { { 0x1d }, 2, T, R, pfx_66, WIG, Ln }, /* vpabsw */
+    { { 0x1e }, 2, T, R, pfx_66, W0, Ln }, /* vpabsd */
+    { { 0x1f }, 2, T, R, pfx_66, W1, Ln }, /* vpabsq */
+    { { 0x20 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxbw */
+    { { 0x20 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovswb */
+    { { 0x21 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxbd */
+    { { 0x21 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovsdb */
+    { { 0x22 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxbq */
+    { { 0x22 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovsqb */
+    { { 0x23 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxwd */
+    { { 0x23 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovsdw */
+    { { 0x24 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovsxwq */
+    { { 0x24 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovsqw */
+    { { 0x25 }, 2, T, R, pfx_66, W0, Ln }, /* vpmovsxdq */
+    { { 0x25 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovsqd */
+    { { 0x26 }, 2, T, R, pfx_66, Wn, Ln }, /* vptestm{b,w} */
+    { { 0x26 }, 2, T, R, pfx_f3, Wn, Ln }, /* vptestnm{b,w} */
+    { { 0x27 }, 2, T, R, pfx_66, Wn, Ln }, /* vptestm{d,q} */
+    { { 0x27 }, 2, T, R, pfx_f3, Wn, Ln }, /* vptestnm{d,q} */
+    { { 0x28 }, 2, T, R, pfx_66, W1, Ln }, /* vpmuldq */
+    { { 0x28, 0xc0 }, 2, F, N, pfx_f3, Wn, Ln }, /* vpmovm2{b,w} */
+    { { 0x29 }, 2, T, R, pfx_66, W1, Ln }, /* vpcmpeqq */
+    { { 0x29, 0xc0 }, 2, F, N, pfx_f3, Wn, Ln }, /* vpmov{b,w}2m */
+    { { 0x2a }, 2, F, R, pfx_66, W0, Ln }, /* vmovntdqa */
+    { { 0x2a, 0xc0 }, 2, F, N, pfx_f3, W1, Ln }, /* vpbroadcastmb2q */
+    { { 0x2b }, 2, T, R, pfx_66, W0, Ln }, /* vpackusdw */
+    { { 0x2c }, 2, F, R, pfx_66, Wn, Ln }, /* vscalefp{s,d} */
+    { { 0x2d }, 2, F, R, pfx_66, Wn, LIG }, /* vscalefs{s,d} */
+    { { 0x30 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxbw */
+    { { 0x30 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovwb */
+    { { 0x31 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxbd */
+    { { 0x31 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovdb */
+    { { 0x32 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxbq */
+    { { 0x32 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovqb */
+    { { 0x33 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxwd */
+    { { 0x33 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovdw */
+    { { 0x34 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxwq */
+    { { 0x34 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovqw */
+    { { 0x35 }, 2, T, R, pfx_66, W0, Ln }, /* vpmovzxdq */
+    { { 0x35 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovqd */
+    { { 0x36 }, 2, T, R, pfx_66, Wn, L1|L2 }, /* vperm{d,q} */
+    { { 0x37 }, 2, T, R, pfx_66, W1, Ln }, /* vpcmpgtq */
+    { { 0x38 }, 2, T, R, pfx_66, WIG, Ln }, /* vpminsb */
+    { { 0x38, 0xc0 }, 2, F, N, pfx_f3, Wn, Ln }, /* vpmovm2{d,q} */
+    { { 0x39 }, 2, T, R, pfx_66, Wn, Ln }, /* vpmins{d,q} */
+    { { 0x39, 0xc0 }, 2, F, N, pfx_f3, Wn, Ln }, /* vpmov{d,q}2m */
+    { { 0x3a }, 2, T, R, pfx_66, WIG, Ln }, /* vpminuw */
+    { { 0x2a, 0xc0 }, 2, F, N, pfx_f3, W0, Ln }, /* vpbroadcastmw2d */
+    { { 0x3b }, 2, T, R, pfx_66, Wn, Ln }, /* vpminu{d,q} */
+    { { 0x3c }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxsb */
+    { { 0x3d }, 2, T, R, pfx_66, Wn, Ln }, /* vpmaxs{d,q} */
+    { { 0x3e }, 2, T, R, pfx_66, WIG, Ln }, /* vpmaxuw */
+    { { 0x3f }, 2, T, R, pfx_66, Wn, Ln }, /* vpmaxu{d,q} */
+    { { 0x40 }, 2, T, R, pfx_66, Wn, Ln }, /* vpmull{d,q} */
+    { { 0x42 }, 2, T, R, pfx_66, Wn, Ln }, /* vgetexpp{s,d} */
+    { { 0x43 }, 2, T, R, pfx_66, Wn, LIG }, /* vgetexps{s,d} */
+    { { 0x44 }, 2, T, R, pfx_66, Wn, Ln }, /* vlzcnt{d,q} */
+    { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
+    { { 0x46 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrav{d,q} */
+    { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x4c }, 2, T, R, pfx_66, Wn, Ln }, /* vrcp14p{s,d} */
+    { { 0x4d }, 2, T, R, pfx_66, Wn, LIG }, /* vrcp14s{s,d} */
+    { { 0x4e }, 2, T, R, pfx_66, Wn, Ln }, /* vrsqrt14p{s,d} */
+    { { 0x4f }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt14s{s,d} */
+    { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
+    { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
+    { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
+    { { 0x52 }, 2, T, R, pfx_f3, W0, Ln }, /* vdpbf16ps */
+    { { 0x52 }, 2, T, R, pfx_f2, W0, L2 }, /* vp4dpwssd */
+    { { 0x53 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssds */
+    { { 0x53 }, 2, T, R, pfx_f2, W0, L2 }, /* vp4dpwssds */
+    { { 0x54 }, 2, T, R, pfx_66, Wn, Ln }, /* vpopcnt{b,w} */
+    { { 0x55 }, 2, T, R, pfx_66, Wn, Ln }, /* vpopcnt{d,q} */
+    { { 0x58 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastd */
+    { { 0x59 }, 2, T, R, pfx_66, Wn, Ln }, /* vbroadcast32x2 / vpbroadcastq */
+    { { 0x5a }, 2, F, R, pfx_66, Wn, L1|L2 }, /* vbroadcasti{32x4,64x2} */
+    { { 0x5b }, 2, F, R, pfx_66, Wn, L2 }, /* vbroadcasti{32x8,64x4} */
+    { { 0x62 }, 2, T, R, pfx_66, Wn, Ln }, /* vpexpand{b,w} */
+    { { 0x63 }, 2, T, W, pfx_66, Wn, Ln }, /* vpcompress{b,w} */
+    { { 0x64 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{d,q} */
+    { { 0x65 }, 2, T, R, pfx_66, Wn, Ln }, /* vblendmp{s,d} */
+    { { 0x66 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{b,w} */
+    { { 0x68 }, 2, T, R, pfx_f2, Wn, Ln }, /* vp2intersect{d,q} */
+    { { 0x70 }, 2, T, R, pfx_66, W1, Ln }, /* vpshldvw */
+    { { 0x71 }, 2, T, R, pfx_66, Wn, Ln }, /* vpshldv{d,q} */
+    { { 0x72 }, 2, T, R, pfx_66, W1, Ln }, /* vpshrdvw */
+    { { 0x72 }, 2, T, R, pfx_f3, W1, Ln }, /* vcvtneps2bf16 */
+    { { 0x72 }, 2, T, R, pfx_f2, W1, Ln }, /* vcvtne2ps2bf16 */
+    { { 0x73 }, 2, T, R, pfx_66, Wn, Ln }, /* vpshrdv{d,q} */
+    { { 0x75 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2{b,w} */
+    { { 0x76 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2{d,q} */
+    { { 0x77 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2p{s,d} */
+    { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastb */
+    { { 0x79 }, 2, T, R, pfx_66, W0, Ln }, /* vpbroadcastw */
+    { { 0x7a, 0xc0 }, 2, F, N, pfx_66, W0, Ln }, /* vpbroadcastb */
+    { { 0x7b, 0xc0 }, 2, F, N, pfx_66, W0, Ln }, /* vpbroadcastw */
+    { { 0x7c, 0xc0 }, 2, F, N, pfx_66, W0, Ln }, /* vpbroadcast{d,q} */
+    { { 0x7d }, 2, T, R, pfx_66, Wn, Ln }, /* vpermt2{b,w} */
+    { { 0x7e }, 2, T, R, pfx_66, Wn, Ln }, /* vpermt2{d,q} */
+    { { 0x7f }, 2, T, R, pfx_66, Wn, Ln }, /* vpermt2p{s,d} */
+    { { 0x83 }, 2, T, R, pfx_66, W1, Ln }, /* vpmultishiftqb */
+    { { 0x88 }, 2, T, R, pfx_66, Wn, Ln }, /* vpexpandp{s,d} */
+    { { 0x89 }, 2, T, R, pfx_66, Wn, Ln }, /* vpexpand{d,q} */
+    { { 0x8a }, 2, T, W, pfx_66, Wn, Ln }, /* vpcompressp{s,d} */
+    { { 0x8b }, 2, T, W, pfx_66, Wn, Ln }, /* vpcompress{d,q} */
+    { { 0x8d }, 2, F, R, pfx_66, Wn, Ln }, /* vperm{b,w} */
+    { { 0x8f }, 2, F, R, pfx_66, W0, Ln }, /* vpshufbitqmb */
+    { { 0x90, VSIB(1) }, 3, F, R, pfx_66, Wn, Ln, T }, /* vpgatherd{d,q} */
+    { { 0x91, VSIB(1) }, 3, F, R, pfx_66, Wn, Ln, T }, /* vpgatherq{d,q} */
+    { { 0x92, VSIB(1) }, 3, F, R, pfx_66, Wn, Ln, T }, /* vgatherdp{s,d} */
+    { { 0x93, VSIB(1) }, 3, F, R, pfx_66, Wn, Ln, T }, /* vgatherqp{s,d} */
+    { { 0x96 }, 2, T, R, pfx_66, Wn, Ln }, /* vfmaddsub132p{s,d} */
+    { { 0x97 }, 2, T, R, pfx_66, Wn, Ln }, /* vfmsubadd132p{s,d} */
+    { { 0x98 }, 2, T, R, pfx_66, Wn, Ln }, /* vfmadd132p{s,d} */
+    { { 0x99 }, 2, T, R, pfx_66, Wn, LIG }, /* vfmadd132s{s,d} */
+    { { 0x9a }, 2, T, R, pfx_66, Wn, Ln }, /* vfmsub132p{s,d} */
+    { { 0x9a }, 2, T, R, pfx_f2, W0, L2 }, /* v4fmaddps */
+    { { 0x9b }, 2, T, R, pfx_66, Wn, LIG }, /* vfmsub132s{s,d} */
+    { { 0x9b }, 2, T, R, pfx_f2, W0, LIG }, /* v4fmaddss */
+    { { 0x9c }, 2, T, R, pfx_66, Wn, Ln }, /* vfnmadd132p{s,d} */
+    { { 0x9d }, 2, T, R, pfx_66, Wn, LIG }, /* vfnmadd132s{s,d} */
+    { { 0x9e }, 2, T, R, pfx_66, Wn, Ln }, /* vfnmsub132p{s,d} */
+    { { 0x9f }, 2, T, R, pfx_66, Wn, LIG }, /* vfnmsub132s{s,d} */
+    { { 0xa0, VSIB(1) }, 3, F, W, pfx_66, Wn, Ln, T }, /* vpscatterd{d,q} */
+    { { 0xa1, VSIB(1) }, 3, F, W, pfx_66, Wn, Ln, T }, /* vpscatterq{d,q} */
+    { { 0xa2, VSIB(1) }, 3, F, W, pfx_66, Wn, Ln, T }, /* vscatterdp{s,d} */
+    { { 0xa3, VSIB(1) }, 3, F, W, pfx_66, Wn, Ln, T }, /* vscatterqp{s,d} */
+    { { 0xa6 }, 2, T, R, pfx_66, Wn, Ln }, /* vfmaddsub213p{s,d} */
+    { { 0xa7 }, 2, T, R, pfx_66, Wn, Ln }, /* vfmsubadd213p{s,d} */
+    { { 0xa8 }, 2, T, R, pfx_66, Wn, Ln }, /* vfmadd213p{s,d} */
+    { { 0xa9 }, 2, T, R, pfx_66, Wn, LIG }, /* vfmadd213s{s,d} */
+    { { 0x9a }, 2, T, R, pfx_f2, W0, L2 }, /* v4fnmaddps */
+    { { 0xaa }, 2, T, R, pfx_66, Wn, Ln }, /* vfmsub213p{s,d} */
+    { { 0xab }, 2, T, R, pfx_66, Wn, LIG }, /* vfmsub213s{s,d} */
+    { { 0x9b }, 2, T, R, pfx_f2, W0, LIG }, /* v4fnmaddss */
+    { { 0xac }, 2, T, R, pfx_66, Wn, Ln }, /* vfnmadd213p{s,d} */
+    { { 0xad }, 2, T, R, pfx_66, Wn, LIG }, /* vfnmadd213s{s,d} */
+    { { 0xae }, 2, T, R, pfx_66, Wn, Ln }, /* vfnmsub213p{s,d} */
+    { { 0xaf }, 2, T, R, pfx_66, Wn, LIG }, /* vfnmsub213s{s,d} */
+    { { 0xb4 }, 2, T, R, pfx_66, W1, Ln }, /* vpmadd52luq */
+    { { 0xb5 }, 2, T, R, pfx_66, W1, Ln }, /* vpmadd52huq */
+    { { 0xb6 }, 2, T, R, pfx_66, Wn, Ln }, /* vfmaddsub231p{s,d} */
+    { { 0xb7 }, 2, T, R, pfx_66, Wn, Ln }, /* vfmsubadd231p{s,d} */
+    { { 0xb8 }, 2, T, R, pfx_66, Wn, Ln }, /* vfmadd231p{s,d} */
+    { { 0xb9 }, 2, T, R, pfx_66, Wn, LIG }, /* vfmadd231s{s,d} */
+    { { 0xba }, 2, T, R, pfx_66, Wn, Ln }, /* vfmsub231p{s,d} */
+    { { 0xbb }, 2, T, R, pfx_66, Wn, LIG }, /* vfmsub231s{s,d} */
+    { { 0xbc }, 2, T, R, pfx_66, Wn, Ln }, /* vfnmadd231p{s,d} */
+    { { 0xbd }, 2, T, R, pfx_66, Wn, LIG }, /* vfnmadd231s{s,d} */
+    { { 0xbe }, 2, T, R, pfx_66, Wn, Ln }, /* vfnmsub231p{s,d} */
+    { { 0xbf }, 2, T, R, pfx_66, Wn, LIG }, /* vfnmsub231s{s,d} */
+    { { 0xc4 }, 2, T, R, pfx_66, Wn, Ln }, /* vpconflict{d,q} */
+    { { 0xc6, VSIB(1) }, 3, F, N, pfx_66, Wn, L2, T }, /* vgatherpf0dp{s,d} */
+    { { 0xc6, VSIB(2) }, 3, F, N, pfx_66, Wn, L2, T }, /* vgatherpf1dp{s,d} */
+    { { 0xc6, VSIB(5) }, 3, F, N, pfx_66, Wn, L2, T }, /* vscatterpf0dp{s,d} */
+    { { 0xc6, VSIB(6) }, 3, F, N, pfx_66, Wn, L2, T }, /* vscatterpf1dp{s,d} */
+    { { 0xc7, VSIB(1) }, 3, F, N, pfx_66, Wn, L2, T }, /* vgatherpf0qp{s,d} */
+    { { 0xc7, VSIB(2) }, 3, F, N, pfx_66, Wn, L2, T }, /* vgatherpf1qp{s,d} */
+    { { 0xc7, VSIB(5) }, 3, F, N, pfx_66, Wn, L2, T }, /* vscatterpf0qp{s,d} */
+    { { 0xc7, VSIB(6) }, 3, F, N, pfx_66, Wn, L2, T }, /* vscatterpf1qp{s,d} */
+    { { 0xc8 }, 2, T, R, pfx_66, Wn, L2 }, /* vexp2p{s,d} */
+    { { 0xca }, 2, T, R, pfx_66, Wn, L2 }, /* vrcp28p{s,d} */
+    { { 0xcb }, 2, T, R, pfx_66, Wn, LIG }, /* vrcp28s{s,d} */
+    { { 0xcc }, 2, T, R, pfx_66, Wn, L2 }, /* vrsqrt28p{s,d} */
+    { { 0xcd }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt28s{s,d} */
+    { { 0xcf }, 2, T, R, pfx_66, W0, Ln }, /* vgf2p8mulb */
+    { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
+    { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
+    { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
+    { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdeclast */
+}, evex_0f3a[] = {
+    { { 0x00 }, 3, T, R, pfx_66, W1, L1|L2 }, /* vpermq */
+    { { 0x01 }, 3, T, R, pfx_66, W1, L1|L2 }, /* vpermpd */
+    { { 0x03 }, 3, T, R, pfx_66, Wn, Ln }, /* valign{d,q} */
+    { { 0x04 }, 3, T, R, pfx_66, W0, Ln }, /* vpermilps */
+    { { 0x05 }, 3, T, R, pfx_66, W1, Ln }, /* vpermilpd */
+    { { 0x08 }, 3, T, R, pfx_66, W0, Ln }, /* vrndscaleps */
+    { { 0x09 }, 3, T, R, pfx_66, W1, Ln }, /* vrndscalepd */
+    { { 0x0a }, 3, T, R, pfx_66, WIG, LIG }, /* vrndscaless */
+    { { 0x0b }, 3, T, R, pfx_66, WIG, LIG }, /* vrndscalesd */
+    { { 0x0f }, 3, T, R, pfx_66, WIG, Ln }, /* vpalignr */
+    { { 0x14 }, 3, T, W, pfx_66, WIG, L0 }, /* vpextrb */
+    { { 0x15 }, 3, T, W, pfx_66, WIG, L0 }, /* vpextrw */
+    { { 0x16 }, 3, T, W, pfx_66, Wn, L0 }, /* vpextr{d,q} */
+    { { 0x17 }, 3, T, W, pfx_66, WIG, L0 }, /* vextractps */
+    { { 0x18 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vinsertf{32x4,64x2} */
+    { { 0x19 }, 3, T, W, pfx_66, Wn, L1|L2 }, /* vextractf{32x4,64x2} */
+    { { 0x1a }, 3, T, R, pfx_66, Wn, L2 }, /* vinsertf{32x8,64x4} */
+    { { 0x1b }, 3, T, W, pfx_66, Wn, L2 }, /* vextractf{32x8,64x4} */
+    { { 0x1d }, 3, T, W, pfx_66, W0, Ln }, /* vcvtps2ph */
+    { { 0x1e }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmpu{d,q} */
+    { { 0x1f }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmp{d,q} */
+    { { 0x20 }, 3, T, R, pfx_66, WIG, L0 }, /* vpinsrb */
+    { { 0x21 }, 3, T, R, pfx_66, WIG, L0 }, /* vinsertps */
+    { { 0x22 }, 3, T, R, pfx_66, Wn, L0 }, /* vpinsr{d,q} */
+    { { 0x23 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vshuff{32x4,64x2} */
+    { { 0x25 }, 3, T, R, pfx_66, Wn, Ln }, /* vpternlog{d,q} */
+    { { 0x26 }, 3, T, R, pfx_66, Wn, Ln }, /* vgetmantp{s,d} */
+    { { 0x27 }, 3, T, R, pfx_66, Wn, LIG }, /* vgetmants{s,d} */
+    { { 0x38 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vinserti{32x4,64x2} */
+    { { 0x39 }, 3, T, W, pfx_66, Wn, L1|L2 }, /* vextracti{32x4,64x2} */
+    { { 0x3a }, 3, T, R, pfx_66, Wn, L2 }, /* vinserti{32x8,64x4} */
+    { { 0x3b }, 3, T, W, pfx_66, Wn, L2 }, /* vextracti{32x8,64x4} */
+    { { 0x3e }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmpu{b,w} */
+    { { 0x3f }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmp{b,w} */
+    { { 0x42 }, 3, T, R, pfx_66, W0, Ln }, /* vdbpsadbw */
+    { { 0x43 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vshufi{32x4,64x2} */
+    { { 0x44 }, 3, T, R, pfx_66, WIG, Ln }, /* vpclmulqdq */
+    { { 0x50 }, 3, T, R, pfx_66, Wn, Ln }, /* vrangep{s,d} */
+    { { 0x51 }, 3, T, R, pfx_66, Wn, LIG }, /* vranges{s,d} */
+    { { 0x54 }, 3, T, R, pfx_66, Wn, Ln }, /* vfixupimmp{s,d} */
+    { { 0x55 }, 3, T, R, pfx_66, Wn, LIG }, /* vfixumpimms{s,d} */
+    { { 0x56 }, 3, T, R, pfx_66, Wn, Ln }, /* vreducep{s,d} */
+    { { 0x57 }, 3, T, R, pfx_66, Wn, LIG }, /* vreduces{s,d} */
+    { { 0x66 }, 3, T, R, pfx_66, Wn, Ln }, /* vfpclassp{s,d} */
+    { { 0x67 }, 3, T, R, pfx_66, Wn, LIG }, /* vfpclasss{s,d} */
+    { { 0x70 }, 3, T, R, pfx_66, W1, Ln }, /* vshldw */
+    { { 0x71 }, 3, T, R, pfx_66, Wn, Ln }, /* vshld{d,q} */
+    { { 0x72 }, 3, T, R, pfx_66, W1, Ln }, /* vshrdw */
+    { { 0x73 }, 3, T, R, pfx_66, Wn, Ln }, /* vshrd{d,q} */
+    { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
+    { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
+};
+
+static const struct {
+    const struct evex *tbl;
+    unsigned int num;
+} evex[] = {
+    { evex_0f,   ARRAY_SIZE(evex_0f) },
+    { evex_0f38, ARRAY_SIZE(evex_0f38) },
+    { evex_0f3a, ARRAY_SIZE(evex_0f3a) },
+};
+
+#undef Wn
+
 #undef F
 #undef N
 #undef R
@@ -1883,6 +2343,50 @@ void predicates_test(void *instr, struct
                     }
                 }
             }
+        }
+
+        for ( x = 0; x < ARRAY_SIZE(evex); ++x )
+        {
+            for ( t = 0; t < evex[x].num; ++t )
+            {
+                uint8_t *ptr = instr;
+                unsigned int l;
+
+                memset(instr + 5, 0xcc, 10);
+
+                *ptr++ = 0x62;
+                *ptr++ = 0xf1 + x;
+                *ptr++ = 0x7c | evex[x].tbl[t].pfx;
+                *ptr++ = 0x08 | evex[x].tbl[t].mask;
+
+                for ( l = 3; l--; )
+                {
+                    if ( evex[x].tbl[t].l != LIG && !(evex[x].tbl[t].l & (1u << l)) )
+                        continue;
+
+                    ptr[-1] &= ~0x60;
+                    ptr[-1] |= l << 5;
+                    memcpy(ptr, evex[x].tbl[t].opc, evex[x].tbl[t].len);
+
+                    if ( evex[x].tbl[t].w == WIG || (evex[x].tbl[t].w & W0) )
+                    {
+                        ptr[-2] &= ~0x80;
+                        do_test(instr, evex[x].tbl[t].len + ((void *)ptr - instr),
+                                evex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
+                                evex[x].tbl[t].mem, ctxt, fetch);
+                    }
+
+                    if ( evex[x].tbl[t].w == WIG || (evex[x].tbl[t].w & W1) )
+                    {
+                        ptr[-2] |= 0x80;
+                        memcpy(ptr, evex[x].tbl[t].opc, evex[x].tbl[t].len);
+
+                        do_test(instr, evex[x].tbl[t].len + ((void *)ptr - instr),
+                                evex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
+                                evex[x].tbl[t].mem, ctxt, fetch);
+                    }
+                }
+            }
         }
 
         if ( errors )


