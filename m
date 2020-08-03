Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA74E23A8DB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:50:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2bnV-0004uq-P7; Mon, 03 Aug 2020 14:50:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2bnU-0004ug-J1
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:50:40 +0000
X-Inumbo-ID: b22f07b2-d598-11ea-9097-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b22f07b2-d598-11ea-9097-bc764e2007e4;
 Mon, 03 Aug 2020 14:50:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E49D7AD39;
 Mon,  3 Aug 2020 14:50:53 +0000 (UTC)
Subject: [PATCH 02/10] x86emul: extend decoding / mem access testing to FPU
 insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <faa409e1-8524-7fd8-c150-64f457c63bbe@suse.com>
Date: Mon, 3 Aug 2020 16:50:38 +0200
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
@@ -517,6 +517,138 @@ static const struct {
 };
 #undef CND
 #undef REG
+static const struct {
+    uint8_t opc[2];
+    bool modrm:1; /* Should register form (also) be tested? */
+    uint8_t mem:2;
+} fpu[] = {
+    { { 0xd8, 0x00 }, T, R }, /* fadd */
+    { { 0xd8, 0x08 }, T, R }, /* fmul */
+    { { 0xd8, 0x10 }, T, R }, /* fcom */
+    { { 0xd8, 0x18 }, T, R }, /* fcomp */
+    { { 0xd8, 0x20 }, T, R }, /* fsub */
+    { { 0xd8, 0x28 }, T, R }, /* fsubr */
+    { { 0xd8, 0x30 }, T, R }, /* fdiv */
+    { { 0xd8, 0x38 }, T, R }, /* fdivr */
+    { { 0xd9, 0x00 }, T, R }, /* fld */
+    { { 0xd9, 0x10 }, F, W }, /* fst */
+    { { 0xd9, 0x18 }, T, W }, /* fstp */
+    { { 0xd9, 0x20 }, F, R }, /* fldenv */
+    { { 0xd9, 0x28 }, F, R }, /* fldcw */
+    { { 0xd9, 0x30 }, F, W }, /* fnstenv */
+    { { 0xd9, 0x38 }, F, W }, /* fnstcw */
+    { { 0xd9, 0xc8 }, F, N }, /* fxch */
+    { { 0xd9, 0xd0 }, F, N }, /* fnop */
+    { { 0xd9, 0xe0 }, F, N }, /* fchs */
+    { { 0xd9, 0xe1 }, F, N }, /* fabs */
+    { { 0xd9, 0xe4 }, F, N }, /* ftst */
+    { { 0xd9, 0xe5 }, F, N }, /* fxam */
+    { { 0xd9, 0xe6 }, F, N }, /* ftstp */
+    { { 0xd9, 0xe8 }, F, N }, /* fld1 */
+    { { 0xd9, 0xe9 }, F, N }, /* fldl2t */
+    { { 0xd9, 0xea }, F, N }, /* fldl2e */
+    { { 0xd9, 0xeb }, F, N }, /* fldpi */
+    { { 0xd9, 0xec }, F, N }, /* fldlg2 */
+    { { 0xd9, 0xed }, F, N }, /* fldln2 */
+    { { 0xd9, 0xee }, F, N }, /* fldz */
+    { { 0xd9, 0xf0 }, F, N }, /* f2xm1 */
+    { { 0xd9, 0xf1 }, F, N }, /* fyl2x */
+    { { 0xd9, 0xf2 }, F, N }, /* fptan */
+    { { 0xd9, 0xf3 }, F, N }, /* fpatan */
+    { { 0xd9, 0xf4 }, F, N }, /* fxtract */
+    { { 0xd9, 0xf5 }, F, N }, /* fprem1 */
+    { { 0xd9, 0xf6 }, F, N }, /* fdecstp */
+    { { 0xd9, 0xf7 }, F, N }, /* fincstp */
+    { { 0xd9, 0xf8 }, F, N }, /* fprem */
+    { { 0xd9, 0xf9 }, F, N }, /* fyl2xp1 */
+    { { 0xd9, 0xfa }, F, N }, /* fsqrt */
+    { { 0xd9, 0xfb }, F, N }, /* fsincos */
+    { { 0xd9, 0xfc }, F, N }, /* frndint */
+    { { 0xd9, 0xfd }, F, N }, /* fscale */
+    { { 0xd9, 0xfe }, F, N }, /* fsin */
+    { { 0xd9, 0xff }, F, N }, /* fcos */
+    { { 0xda, 0x00 }, F, R }, /* fiadd */
+    { { 0xda, 0x08 }, F, R }, /* fimul */
+    { { 0xda, 0x10 }, F, R }, /* ficom */
+    { { 0xda, 0x18 }, F, R }, /* ficomp */
+    { { 0xda, 0x20 }, F, R }, /* fisub */
+    { { 0xda, 0x28 }, F, R }, /* fisubr */
+    { { 0xda, 0x30 }, F, R }, /* fidiv */
+    { { 0xda, 0x38 }, F, R }, /* fidivr */
+    { { 0xda, 0xc0 }, F, N }, /* fcmovb */
+    { { 0xda, 0xc8 }, F, N }, /* fcmove */
+    { { 0xda, 0xd0 }, F, N }, /* fcmovbe */
+    { { 0xda, 0xd8 }, F, N }, /* fcmovu */
+    { { 0xda, 0xe9 }, F, N }, /* fucompp */
+    { { 0xdb, 0x00 }, F, R }, /* fild */
+    { { 0xdb, 0x08 }, F, W }, /* fisttp */
+    { { 0xdb, 0x10 }, F, W }, /* fist */
+    { { 0xdb, 0x18 }, F, W }, /* fistp */
+    { { 0xdb, 0x28 }, F, R }, /* fld */
+    { { 0xdb, 0x38 }, F, W }, /* fstp */
+    { { 0xdb, 0xc0 }, F, N }, /* fcmovnb */
+    { { 0xdb, 0xc8 }, F, N }, /* fcmovne */
+    { { 0xdb, 0xd0 }, F, N }, /* fcmovnbe */
+    { { 0xdb, 0xd8 }, F, N }, /* fcmovnu */
+    { { 0xdb, 0xe0 }, F, N }, /* fneni */
+    { { 0xdb, 0xe1 }, F, N }, /* fndisi */
+    { { 0xdb, 0xe2 }, F, N }, /* fnclex */
+    { { 0xdb, 0xe3 }, F, N }, /* fninit */
+    { { 0xdb, 0xe4 }, F, N }, /* fsetpm */
+    { { 0xdb, 0xe5 }, F, N }, /* frstpm */
+    { { 0xdb, 0xe8 }, F, N }, /* fucomi */
+    { { 0xdb, 0xf0 }, F, N }, /* fcomi */
+    { { 0xdc, 0x00 }, T, R }, /* fadd */
+    { { 0xdc, 0x08 }, T, R }, /* fmul */
+    { { 0xdc, 0x10 }, T, R }, /* fcom */
+    { { 0xdc, 0x18 }, T, R }, /* fcomp */
+    { { 0xdc, 0x20 }, T, R }, /* fsub */
+    { { 0xdc, 0x28 }, T, R }, /* fsubr */
+    { { 0xdc, 0x30 }, T, R }, /* fdiv */
+    { { 0xdc, 0x38 }, T, R }, /* fdivr */
+    { { 0xdd, 0x00 }, F, R }, /* fld */
+    { { 0xdd, 0x08 }, F, W }, /* fisttp */
+    { { 0xdd, 0x10 }, T, W }, /* fst */
+    { { 0xdd, 0x18 }, T, W }, /* fstp */
+    { { 0xdd, 0x20 }, F, R }, /* frstor */
+    { { 0xdd, 0x30 }, F, W }, /* fnsave */
+    { { 0xdd, 0x38 }, F, W }, /* fnstsw */
+    { { 0xdd, 0xc0 }, F, N }, /* ffree */
+    { { 0xdd, 0xc8 }, F, N }, /* fxch */
+    { { 0xdd, 0xe0 }, F, N }, /* fucom */
+    { { 0xdd, 0xe8 }, F, N }, /* fucomp */
+    { { 0xde, 0x00 }, F, R }, /* fiadd */
+    { { 0xde, 0x08 }, F, R }, /* fimul */
+    { { 0xde, 0x10 }, F, R }, /* ficom */
+    { { 0xde, 0x18 }, F, R }, /* ficomp */
+    { { 0xde, 0x20 }, F, R }, /* fisub */
+    { { 0xde, 0x28 }, F, R }, /* fisubr */
+    { { 0xde, 0x30 }, F, R }, /* fidiv */
+    { { 0xde, 0x38 }, F, R }, /* fidivr */
+    { { 0xde, 0xc0 }, F, N }, /* faddp */
+    { { 0xde, 0xc8 }, F, N }, /* fmulp */
+    { { 0xde, 0xd0 }, F, N }, /* fcomp */
+    { { 0xde, 0xd9 }, F, N }, /* fcompp */
+    { { 0xde, 0xe0 }, F, N }, /* fsubrp */
+    { { 0xde, 0xe8 }, F, N }, /* fsubp */
+    { { 0xde, 0xf0 }, F, N }, /* fdivrp */
+    { { 0xde, 0xf8 }, F, N }, /* fdivp */
+    { { 0xdf, 0x00 }, F, R }, /* fild */
+    { { 0xdf, 0x08 }, F, W }, /* fisttp */
+    { { 0xdf, 0x10 }, F, W }, /* fist */
+    { { 0xdf, 0x18 }, F, W }, /* fistp */
+    { { 0xdf, 0x20 }, F, R }, /* fbld */
+    { { 0xdf, 0x28 }, F, R }, /* fild */
+    { { 0xdf, 0x30 }, F, W }, /* fbstp */
+    { { 0xdf, 0x38 }, F, W }, /* fistp */
+    { { 0xdf, 0xc0 }, F, N }, /* ffreep */
+    { { 0xdf, 0xc8 }, F, N }, /* fxch */
+    { { 0xdf, 0xd0 }, F, N }, /* fstp */
+    { { 0xdf, 0xd8 }, F, N }, /* fstp */
+    { { 0xdf, 0xe0 }, F, N }, /* fnstsw */
+    { { 0xdf, 0xe8 }, F, N }, /* fucomip */
+    { { 0xdf, 0xf0 }, F, N }, /* fcomip */
+};
 #undef F
 #undef N
 #undef R
@@ -667,6 +799,16 @@ void predicates_test(void *instr, struct
                     legacy_0f38[t].mem, ctxt, fetch);
         }
 
+        memset(instr + ARRAY_SIZE(fpu[t].opc), 0xcc, 13);
+
+        for ( t = 0; t < ARRAY_SIZE(fpu); ++t )
+        {
+            memcpy(instr, fpu[t].opc, ARRAY_SIZE(fpu[t].opc));
+
+            do_test(instr, ARRAY_SIZE(fpu[t].opc), fpu[t].modrm, fpu[t].mem,
+                    ctxt, fetch);
+        }
+
         if ( errors )
             exit(1);
 


