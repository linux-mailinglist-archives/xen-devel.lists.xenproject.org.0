Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267FE23A8DC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:51:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2bnr-0004yc-2S; Mon, 03 Aug 2020 14:51:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2bnq-0004yO-3A
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:51:02 +0000
X-Inumbo-ID: be701afc-d598-11ea-9097-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be701afc-d598-11ea-9097-bc764e2007e4;
 Mon, 03 Aug 2020 14:51:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 742C5AF0E;
 Mon,  3 Aug 2020 14:51:14 +0000 (UTC)
Subject: [PATCH 03/10] x86emul: extend decoding / mem access testing to MMX /
 SSE insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <197bf5e9-5246-abfb-3870-6ca3dbaee152@suse.com>
Date: Mon, 3 Aug 2020 16:50:58 +0200
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

IOW just legacy encoded ones. For 3dNow! just one example is used, as
they're all similar in nature both encoding- and operand-wise.

Adjust a slightly misleading (but not wrong) memcpy() invocation, as
noticed while further cloning that code.

Rename pfx_none to pfx_no, so it can be used to improve readability /
column alignment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -3,7 +3,7 @@
 #include <stdio.h>
 
 enum mem_access { mem_none, mem_read, mem_write };
-enum pfx { pfx_none, pfx_66, pfx_f3, pfx_f2 };
+enum pfx { pfx_no, pfx_66, pfx_f3, pfx_f2 };
 static const uint8_t prefixes[] = { 0x66, 0xf3, 0xf2 };
 
 #define F false
@@ -393,6 +393,30 @@ static const struct {
     { { 0x0d, 0x00 }, { 2, 2 }, F, N }, /* prefetch */
     { { 0x0d, 0x08 }, { 2, 2 }, F, N }, /* prefetchw */
     { { 0x0e }, { 1, 1 }, F, N }, /* femms */
+    { { 0x0f, 0x00, 0x9e }, { 3, 3 }, T, R }, /* pfadd */
+    { { 0x10 }, { 2, 2 }, T, R, pfx_no }, /* movups */
+    { { 0x10 }, { 2, 2 }, T, R, pfx_66 }, /* movupd */
+    { { 0x10 }, { 2, 2 }, T, R, pfx_f3 }, /* movss */
+    { { 0x10 }, { 2, 2 }, T, R, pfx_f2 }, /* movsd */
+    { { 0x11 }, { 2, 2 }, T, W, pfx_no }, /* movups */
+    { { 0x11 }, { 2, 2 }, T, W, pfx_66 }, /* movupd */
+    { { 0x11 }, { 2, 2 }, T, W, pfx_f3 }, /* movss */
+    { { 0x11 }, { 2, 2 }, T, W, pfx_f2 }, /* movsd */
+    { { 0x12 }, { 2, 2 }, T, R, pfx_no }, /* movlps / movhlps */
+    { { 0x12 }, { 2, 2 }, F, R, pfx_66 }, /* movlpd */
+    { { 0x12 }, { 2, 2 }, T, R, pfx_f3 }, /* movsldup */
+    { { 0x12 }, { 2, 2 }, T, R, pfx_f2 }, /* movddup */
+    { { 0x13 }, { 2, 2 }, F, W, pfx_no }, /* movlps */
+    { { 0x13 }, { 2, 2 }, F, W, pfx_66 }, /* movlpd */
+    { { 0x14 }, { 2, 2 }, T, R, pfx_no }, /* unpcklps */
+    { { 0x14 }, { 2, 2 }, T, R, pfx_66 }, /* unpcklpd */
+    { { 0x15 }, { 2, 2 }, T, R, pfx_no }, /* unpckhps */
+    { { 0x15 }, { 2, 2 }, T, R, pfx_66 }, /* unpckhpd */
+    { { 0x16 }, { 2, 2 }, T, R, pfx_no }, /* movhps / movlhps */
+    { { 0x16 }, { 2, 2 }, F, R, pfx_66 }, /* movhpd */
+    { { 0x16 }, { 2, 2 }, T, R, pfx_f3 }, /* movshdup */
+    { { 0x17 }, { 2, 2 }, F, W, pfx_no }, /* movhps */
+    { { 0x17 }, { 2, 2 }, F, W, pfx_66 }, /* movhpd */
     { { 0x18, 0x00 }, { 2, 2 }, F, N }, /* prefetchnta */
     { { 0x18, 0x08 }, { 2, 2 }, F, N }, /* prefetch0 */
     { { 0x18, 0x10 }, { 2, 2 }, F, N }, /* prefetch1 */
@@ -414,6 +438,30 @@ static const struct {
     { { 0x21 }, { 2, 2 }, T, N }, /* mov */
     { { 0x22 }, { 2, 2 }, T, N }, /* mov */
     { { 0x23 }, { 2, 2 }, T, N }, /* mov */
+    { { 0x28 }, { 2, 2 }, T, R, pfx_no }, /* movaps */
+    { { 0x28 }, { 2, 2 }, T, R, pfx_66 }, /* movapd */
+    { { 0x29 }, { 2, 2 }, T, W, pfx_no }, /* movaps */
+    { { 0x29 }, { 2, 2 }, T, W, pfx_66 }, /* movapd */
+    { { 0x2a }, { 2, 2 }, T, R, pfx_no }, /* cvtpi2ps */
+    { { 0x2a }, { 2, 2 }, T, R, pfx_66 }, /* cvtpi2pd */
+    { { 0x2a }, { 2, 2 }, T, R, pfx_f3 }, /* cvtsi2ss */
+    { { 0x2a }, { 2, 2 }, T, R, pfx_f2 }, /* cvtsi2sd */
+    { { 0x2b }, { 2, 2 }, T, W, pfx_no }, /* movntps */
+    { { 0x2b }, { 2, 2 }, T, W, pfx_66 }, /* movntpd */
+    { { 0x2b }, { 2, 2 }, T, W, pfx_f3 }, /* movntss */
+    { { 0x2b }, { 2, 2 }, T, W, pfx_f2 }, /* movntsd */
+    { { 0x2c }, { 2, 2 }, T, R, pfx_no }, /* cvttps2pi */
+    { { 0x2c }, { 2, 2 }, T, R, pfx_66 }, /* cvttpd2pi */
+    { { 0x2c }, { 2, 2 }, T, R, pfx_f3 }, /* cvttss2si */
+    { { 0x2c }, { 2, 2 }, T, R, pfx_f2 }, /* cvttsd2si */
+    { { 0x2d }, { 2, 2 }, T, R, pfx_no }, /* cvtps2pi */
+    { { 0x2d }, { 2, 2 }, T, R, pfx_66 }, /* cvtpd2pi */
+    { { 0x2d }, { 2, 2 }, T, R, pfx_f3 }, /* cvtss2si */
+    { { 0x2d }, { 2, 2 }, T, R, pfx_f2 }, /* cvtsd2si */
+    { { 0x2e }, { 2, 2 }, T, R, pfx_no }, /* ucomiss */
+    { { 0x2e }, { 2, 2 }, T, R, pfx_66 }, /* ucomisd */
+    { { 0x2f }, { 2, 2 }, T, R, pfx_no }, /* comiss */
+    { { 0x2f }, { 2, 2 }, T, R, pfx_66 }, /* comisd */
     { { 0x30 }, { 1, 1 }, F, N }, /* wrmsr */
     { { 0x31 }, { 1, 1 }, F, N }, /* rdtsc */
     { { 0x32 }, { 1, 1 }, F, N }, /* rdmsr */
@@ -421,8 +469,131 @@ static const struct {
     { { 0x34 }, { 1, 1 }, F, N }, /* sysenter */
     { { 0x35 }, { 1, 1 }, F, N }, /* sysexit */
     CND(0x40,   { 2, 2 }, T, R ), /* cmov<cc> */
+    { { 0x50, 0xc0 }, { 2, 2 }, F, N, pfx_no }, /* movmskps */
+    { { 0x50, 0xc0 }, { 2, 2 }, F, N, pfx_66 }, /* movmskpd */
+    { { 0x51 }, { 2, 2 }, T, R, pfx_no }, /* sqrtps */
+    { { 0x51 }, { 2, 2 }, T, R, pfx_66 }, /* sqrtpd */
+    { { 0x51 }, { 2, 2 }, T, R, pfx_f3 }, /* sqrtss */
+    { { 0x51 }, { 2, 2 }, T, R, pfx_f2 }, /* sqrtsd */
+    { { 0x52 }, { 2, 2 }, T, R, pfx_no }, /* rsqrtps */
+    { { 0x52 }, { 2, 2 }, T, R, pfx_f3 }, /* rsqrtss */
+    { { 0x53 }, { 2, 2 }, T, R, pfx_no }, /* rcpps */
+    { { 0x53 }, { 2, 2 }, T, R, pfx_f3 }, /* rcpss */
+    { { 0x54 }, { 2, 2 }, T, R, pfx_no }, /* andps */
+    { { 0x54 }, { 2, 2 }, T, R, pfx_66 }, /* andpd */
+    { { 0x55 }, { 2, 2 }, T, R, pfx_no }, /* andnps */
+    { { 0x55 }, { 2, 2 }, T, R, pfx_66 }, /* andnpd */
+    { { 0x56 }, { 2, 2 }, T, R, pfx_no }, /* orps */
+    { { 0x56 }, { 2, 2 }, T, R, pfx_66 }, /* orpd */
+    { { 0x57 }, { 2, 2 }, T, R, pfx_no }, /* xorps */
+    { { 0x57 }, { 2, 2 }, T, R, pfx_66 }, /* xorpd */
+    { { 0x58 }, { 2, 2 }, T, R, pfx_no }, /* addps */
+    { { 0x58 }, { 2, 2 }, T, R, pfx_66 }, /* addpd */
+    { { 0x58 }, { 2, 2 }, T, R, pfx_f3 }, /* addss */
+    { { 0x58 }, { 2, 2 }, T, R, pfx_f2 }, /* addsd */
+    { { 0x59 }, { 2, 2 }, T, R, pfx_no }, /* mulps */
+    { { 0x59 }, { 2, 2 }, T, R, pfx_66 }, /* mulpd */
+    { { 0x59 }, { 2, 2 }, T, R, pfx_f3 }, /* mulss */
+    { { 0x59 }, { 2, 2 }, T, R, pfx_f2 }, /* mulsd */
+    { { 0x5a }, { 2, 2 }, T, R, pfx_no }, /* cvtps2pd */
+    { { 0x5a }, { 2, 2 }, T, R, pfx_66 }, /* cvtpd2ps */
+    { { 0x5a }, { 2, 2 }, T, R, pfx_f3 }, /* cvtss2sd */
+    { { 0x5a }, { 2, 2 }, T, R, pfx_f2 }, /* cvtsd2ss */
+    { { 0x5b }, { 2, 2 }, T, R, pfx_no }, /* cvtdq2ps */
+    { { 0x5b }, { 2, 2 }, T, R, pfx_66 }, /* cvtps2dq */
+    { { 0x5b }, { 2, 2 }, T, R, pfx_f3 }, /* cvttps2dq */
+    { { 0x5c }, { 2, 2 }, T, R, pfx_no }, /* subps */
+    { { 0x5c }, { 2, 2 }, T, R, pfx_66 }, /* subpd */
+    { { 0x5c }, { 2, 2 }, T, R, pfx_f3 }, /* subss */
+    { { 0x5c }, { 2, 2 }, T, R, pfx_f2 }, /* subsd */
+    { { 0x5d }, { 2, 2 }, T, R, pfx_no }, /* minps */
+    { { 0x5d }, { 2, 2 }, T, R, pfx_66 }, /* minpd */
+    { { 0x5d }, { 2, 2 }, T, R, pfx_f3 }, /* minss */
+    { { 0x5d }, { 2, 2 }, T, R, pfx_f2 }, /* minsd */
+    { { 0x5e }, { 2, 2 }, T, R, pfx_no }, /* divps */
+    { { 0x5e }, { 2, 2 }, T, R, pfx_66 }, /* divpd */
+    { { 0x5e }, { 2, 2 }, T, R, pfx_f3 }, /* divss */
+    { { 0x5e }, { 2, 2 }, T, R, pfx_f2 }, /* divsd */
+    { { 0x5f }, { 2, 2 }, T, R, pfx_no }, /* maxps */
+    { { 0x5f }, { 2, 2 }, T, R, pfx_66 }, /* maxpd */
+    { { 0x5f }, { 2, 2 }, T, R, pfx_f3 }, /* maxss */
+    { { 0x5f }, { 2, 2 }, T, R, pfx_f2 }, /* maxsd */
+    { { 0x60 }, { 2, 2 }, T, R, pfx_no }, /* punpcklbw */
+    { { 0x60 }, { 2, 2 }, T, R, pfx_66 }, /* punpcklbw */
+    { { 0x61 }, { 2, 2 }, T, R, pfx_no }, /* punpcklwd */
+    { { 0x61 }, { 2, 2 }, T, R, pfx_66 }, /* punpcklwd */
+    { { 0x62 }, { 2, 2 }, T, R, pfx_no }, /* punpckldq */
+    { { 0x62 }, { 2, 2 }, T, R, pfx_66 }, /* punpckldq */
+    { { 0x63 }, { 2, 2 }, T, R, pfx_no }, /* packsswb */
+    { { 0x63 }, { 2, 2 }, T, R, pfx_66 }, /* packsswb */
+    { { 0x64 }, { 2, 2 }, T, R, pfx_no }, /* pcmpgtb */
+    { { 0x64 }, { 2, 2 }, T, R, pfx_66 }, /* pcmpgtb */
+    { { 0x65 }, { 2, 2 }, T, R, pfx_no }, /* pcmpgtw */
+    { { 0x65 }, { 2, 2 }, T, R, pfx_66 }, /* pcmpgtw */
+    { { 0x66 }, { 2, 2 }, T, R, pfx_no }, /* pcmpgtd */
+    { { 0x66 }, { 2, 2 }, T, R, pfx_66 }, /* pcmpgtd */
+    { { 0x67 }, { 2, 2 }, T, R, pfx_no }, /* packuswb */
+    { { 0x67 }, { 2, 2 }, T, R, pfx_66 }, /* packuswb */
+    { { 0x68 }, { 2, 2 }, T, R, pfx_no }, /* punpckhbw */
+    { { 0x68 }, { 2, 2 }, T, R, pfx_66 }, /* punpckhbw */
+    { { 0x69 }, { 2, 2 }, T, R, pfx_no }, /* punpckhwd */
+    { { 0x69 }, { 2, 2 }, T, R, pfx_66 }, /* punpckhwd */
+    { { 0x6a }, { 2, 2 }, T, R, pfx_no }, /* punpckhdq */
+    { { 0x6a }, { 2, 2 }, T, R, pfx_66 }, /* punpckhdq */
+    { { 0x6b }, { 2, 2 }, T, R, pfx_no }, /* packssdw */
+    { { 0x6b }, { 2, 2 }, T, R, pfx_66 }, /* packssdw */
+    { { 0x6c }, { 2, 2 }, T, R, pfx_66 }, /* punpcklqdq */
+    { { 0x6d }, { 2, 2 }, T, R, pfx_66 }, /* punpckhqdq */
+    { { 0x6e }, { 2, 2 }, T, R, pfx_no }, /* movd */
+    { { 0x6e }, { 2, 2 }, T, R, pfx_66 }, /* movd */
+    { { 0x6f }, { 2, 2 }, T, R, pfx_no }, /* movq */
+    { { 0x6f }, { 2, 2 }, T, R, pfx_66 }, /* movdqa */
+    { { 0x6f }, { 2, 2 }, T, R, pfx_f3 }, /* movdqu */
+    { { 0x70 }, { 3, 3 }, T, R, pfx_no }, /* pshufw */
+    { { 0x70 }, { 3, 3 }, T, R, pfx_66 }, /* pshufd */
+    { { 0x70 }, { 3, 3 }, T, R, pfx_f3 }, /* pshuflw */
+    { { 0x70 }, { 3, 3 }, T, R, pfx_f2 }, /* pshufhw */
+    { { 0x71, 0xd0 }, { 3, 3 }, F, N, pfx_no }, /* psrlw */
+    { { 0x71, 0xd0 }, { 3, 3 }, F, N, pfx_66 }, /* psrlw */
+    { { 0x71, 0xe0 }, { 3, 3 }, F, N, pfx_no }, /* psraw */
+    { { 0x71, 0xe0 }, { 3, 3 }, F, N, pfx_66 }, /* psraw */
+    { { 0x71, 0xf0 }, { 3, 3 }, F, N, pfx_no }, /* psllw */
+    { { 0x71, 0xf0 }, { 3, 3 }, F, N, pfx_66 }, /* psllw */
+    { { 0x72, 0xd0 }, { 3, 3 }, F, N, pfx_no }, /* psrld */
+    { { 0x72, 0xd0 }, { 3, 3 }, F, N, pfx_66 }, /* psrld */
+    { { 0x72, 0xe0 }, { 3, 3 }, F, N, pfx_no }, /* psrad */
+    { { 0x72, 0xe0 }, { 3, 3 }, F, N, pfx_66 }, /* psrad */
+    { { 0x72, 0xf0 }, { 3, 3 }, F, N, pfx_no }, /* pslld */
+    { { 0x72, 0xf0 }, { 3, 3 }, F, N, pfx_66 }, /* pslld */
+    { { 0x73, 0xd0 }, { 3, 3 }, F, N, pfx_no }, /* psrlq */
+    { { 0x73, 0xd0 }, { 3, 3 }, F, N, pfx_66 }, /* psrlq */
+    { { 0x73, 0xd8 }, { 3, 3 }, F, N, pfx_66 }, /* psrldq */
+    { { 0x73, 0xf0 }, { 3, 3 }, F, N, pfx_no }, /* psllq */
+    { { 0x73, 0xf0 }, { 3, 3 }, F, N, pfx_66 }, /* psllq */
+    { { 0x73, 0xf8 }, { 3, 3 }, F, N, pfx_66 }, /* pslldq */
+    { { 0x74 }, { 2, 2 }, T, R, pfx_no }, /* pcmpeqb */
+    { { 0x74 }, { 2, 2 }, T, R, pfx_66 }, /* pcmpeqb */
+    { { 0x75 }, { 2, 2 }, T, R, pfx_no }, /* pcmpeqw */
+    { { 0x75 }, { 2, 2 }, T, R, pfx_66 }, /* pcmpeqw */
+    { { 0x76 }, { 2, 2 }, T, R, pfx_no }, /* pcmpeqd */
+    { { 0x76 }, { 2, 2 }, T, R, pfx_66 }, /* pcmpeqd */
+    { { 0x77 }, { 1, 1 }, F, N }, /* emms */
     /*{ 0x78 }, { 2, 2 }, T, W }, vmread */
+    { { 0x78, 0xc0 }, { 4, 4 }, F, N, pfx_66 }, /* extrq */
+    { { 0x78, 0xc0 }, { 4, 4 }, F, N, pfx_f2 }, /* insertq */
     { { 0x79 }, { 2, 2 }, T, R }, /* vmwrite */
+    { { 0x79, 0xc0 }, { 2, 2 }, F, N, pfx_66 }, /* extrq */
+    { { 0x79, 0xc0 }, { 2, 2 }, F, N, pfx_f2 }, /* insertq */
+    { { 0x7c }, { 2, 2 }, T, R, pfx_66 }, /* haddpd */
+    { { 0x7c }, { 2, 2 }, T, R, pfx_f2 }, /* haddps */
+    { { 0x7d }, { 2, 2 }, T, R, pfx_66 }, /* hsubpd */
+    { { 0x7d }, { 2, 2 }, T, R, pfx_f2 }, /* hsubps */
+    { { 0x7e }, { 2, 2 }, T, W, pfx_no }, /* movd */
+    { { 0x7e }, { 2, 2 }, T, W, pfx_66 }, /* movd */
+    { { 0x7e }, { 2, 2 }, T, R, pfx_f3 }, /* movq */
+    { { 0x7f }, { 2, 2 }, T, W, pfx_no }, /* movq */
+    { { 0x7f }, { 2, 2 }, T, W, pfx_66 }, /* movdqa */
+    { { 0x7f }, { 2, 2 }, T, W, pfx_f3 }, /* movdqu */
     CND(0x80,   { 5, 5 }, F, N ), /* j<cc> */
     CND(0x90,   { 2, 2 }, T, W ), /* set<cc> */
     { { 0xa0 }, { 1, 1 }, F, W }, /* push %fs */
@@ -484,7 +655,17 @@ static const struct {
     { { 0xbf }, { 2, 2 }, F, R }, /* movsx */
     { { 0xc0 }, { 2, 2 }, F, W }, /* xadd */
     { { 0xc1 }, { 2, 2 }, F, W }, /* xadd */
+    { { 0xc2 }, { 3, 3 }, T, R, pfx_no }, /* cmpps */
+    { { 0xc2 }, { 3, 3 }, T, R, pfx_66 }, /* cmppd */
+    { { 0xc2 }, { 3, 3 }, T, R, pfx_f3 }, /* cmpss */
+    { { 0xc2 }, { 3, 3 }, T, R, pfx_f2 }, /* cmpsd */
     { { 0xc3 }, { 2, 2 }, F, W }, /* movnti */
+    { { 0xc4 }, { 3, 3 }, T, R, pfx_no }, /* pinsrw */
+    { { 0xc4 }, { 3, 3 }, T, R, pfx_66 }, /* pinsrw */
+    { { 0xc5, 0xc0 }, { 3, 3 }, F, N, pfx_no }, /* pextrw */
+    { { 0xc5, 0xc0 }, { 3, 3 }, F, N, pfx_66 }, /* pextrw */
+    { { 0xc6 }, { 3, 3 }, T, R, pfx_no }, /* shufps */
+    { { 0xc6 }, { 3, 3 }, T, R, pfx_66 }, /* shufpd */
     { { 0xc7, 0x08 }, { 2, 2 }, F, W }, /* cmpxchg8b */
     { { 0xc7, 0x18 }, { 2, 2 }, F, R }, /* xrstors */
     { { 0xc7, 0x20 }, { 2, 2 }, F, W }, /* xsavec */
@@ -497,11 +678,179 @@ static const struct {
     { { 0xc7, 0xf8 }, { 2, 2 }, F, N }, /* rdseed */
     { { 0xc7, 0xf8 }, { 2, 2 }, F, N, pfx_f3 }, /* rdpid */
     REG(0xc8,   { 1, 1 }, F, N ), /* bswap */
+    { { 0xd0 }, { 2, 2 }, T, R, pfx_66 }, /* addsubpd */
+    { { 0xd0 }, { 2, 2 }, T, R, pfx_f2 }, /* addsubps */
+    { { 0xd1 }, { 2, 2 }, T, R, pfx_no }, /* psrlw */
+    { { 0xd1 }, { 2, 2 }, T, R, pfx_66 }, /* psrlw */
+    { { 0xd2 }, { 2, 2 }, T, R, pfx_no }, /* psrld */
+    { { 0xd2 }, { 2, 2 }, T, R, pfx_66 }, /* psrld */
+    { { 0xd3 }, { 2, 2 }, T, R, pfx_no }, /* psrlq */
+    { { 0xd3 }, { 2, 2 }, T, R, pfx_66 }, /* psrlq */
+    { { 0xd4 }, { 2, 2 }, T, R, pfx_no }, /* paddq */
+    { { 0xd4 }, { 2, 2 }, T, R, pfx_66 }, /* paddq */
+    { { 0xd5 }, { 2, 2 }, T, R, pfx_no }, /* pmullw */
+    { { 0xd5 }, { 2, 2 }, T, R, pfx_66 }, /* pmullw */
+    { { 0xd6 }, { 2, 2 }, T, W, pfx_66 }, /* movq */
+    { { 0xd6, 0xc0 }, { 2, 2 }, F, N, pfx_f3 }, /* movq2dq */
+    { { 0xd6, 0xc0 }, { 2, 2 }, F, N, pfx_f2 }, /* movdq2q */
+    { { 0xd7, 0xc0 }, { 2, 2 }, F, N, pfx_no }, /* pmovmskb */
+    { { 0xd7, 0xc0 }, { 2, 2 }, F, N, pfx_66 }, /* pmovmskb */
+    { { 0xd8 }, { 2, 2 }, T, R, pfx_no }, /* psubusb */
+    { { 0xd8 }, { 2, 2 }, T, R, pfx_66 }, /* psubusb */
+    { { 0xd9 }, { 2, 2 }, T, R, pfx_no }, /* psubusw */
+    { { 0xd9 }, { 2, 2 }, T, R, pfx_66 }, /* psubusw */
+    { { 0xda }, { 2, 2 }, T, R, pfx_no }, /* pminub */
+    { { 0xda }, { 2, 2 }, T, R, pfx_66 }, /* pminub */
+    { { 0xdb }, { 2, 2 }, T, R, pfx_no }, /* pand */
+    { { 0xdb }, { 2, 2 }, T, R, pfx_66 }, /* pand */
+    { { 0xdc }, { 2, 2 }, T, R, pfx_no }, /* paddusb */
+    { { 0xdc }, { 2, 2 }, T, R, pfx_66 }, /* paddusb */
+    { { 0xdd }, { 2, 2 }, T, R, pfx_no }, /* paddusw */
+    { { 0xdd }, { 2, 2 }, T, R, pfx_66 }, /* paddusw */
+    { { 0xde }, { 2, 2 }, T, R, pfx_no }, /* pmaxub */
+    { { 0xde }, { 2, 2 }, T, R, pfx_66 }, /* pmaxub */
+    { { 0xdf }, { 2, 2 }, T, R, pfx_no }, /* pandn */
+    { { 0xdf }, { 2, 2 }, T, R, pfx_66 }, /* pandn */
+    { { 0xe0 }, { 2, 2 }, T, R, pfx_no }, /* pavgb */
+    { { 0xe0 }, { 2, 2 }, T, R, pfx_66 }, /* pavgb */
+    { { 0xe1 }, { 2, 2 }, T, R, pfx_no }, /* psraw */
+    { { 0xe1 }, { 2, 2 }, T, R, pfx_66 }, /* psraw */
+    { { 0xe2 }, { 2, 2 }, T, R, pfx_no }, /* psrad */
+    { { 0xe2 }, { 2, 2 }, T, R, pfx_66 }, /* psrad */
+    { { 0xe3 }, { 2, 2 }, T, R, pfx_no }, /* pavgw */
+    { { 0xe3 }, { 2, 2 }, T, R, pfx_66 }, /* pavgw */
+    { { 0xe4 }, { 2, 2 }, T, R, pfx_no }, /* pmulhuw */
+    { { 0xe4 }, { 2, 2 }, T, R, pfx_66 }, /* pmulhuw */
+    { { 0xe5 }, { 2, 2 }, T, R, pfx_no }, /* pmulhw */
+    { { 0xe5 }, { 2, 2 }, T, R, pfx_66 }, /* pmulhw */
+    { { 0xe6 }, { 2, 2 }, T, R, pfx_66 }, /* cvttpd2dq */
+    { { 0xe6 }, { 2, 2 }, T, R, pfx_f3 }, /* cvtdq2pd */
+    { { 0xe6 }, { 2, 2 }, T, R, pfx_f2 }, /* cvtpd2dq */
+    { { 0xe7 }, { 2, 2 }, F, W, pfx_no }, /* movntq */
+    { { 0xe7 }, { 2, 2 }, F, W, pfx_66 }, /* movntdq */
+    { { 0xe8 }, { 2, 2 }, T, R, pfx_no }, /* psubsb */
+    { { 0xe8 }, { 2, 2 }, T, R, pfx_66 }, /* psubsb */
+    { { 0xe9 }, { 2, 2 }, T, R, pfx_no }, /* psubsw */
+    { { 0xe9 }, { 2, 2 }, T, R, pfx_66 }, /* psubsw */
+    { { 0xea }, { 2, 2 }, T, R, pfx_no }, /* pminsw */
+    { { 0xea }, { 2, 2 }, T, R, pfx_66 }, /* pminsw */
+    { { 0xeb }, { 2, 2 }, T, R, pfx_no }, /* por */
+    { { 0xeb }, { 2, 2 }, T, R, pfx_66 }, /* por */
+    { { 0xec }, { 2, 2 }, T, R, pfx_no }, /* paddsb */
+    { { 0xec }, { 2, 2 }, T, R, pfx_66 }, /* paddsb */
+    { { 0xed }, { 2, 2 }, T, R, pfx_no }, /* paddsw */
+    { { 0xed }, { 2, 2 }, T, R, pfx_66 }, /* paddsw */
+    { { 0xee }, { 2, 2 }, T, R, pfx_no }, /* pmaxsw */
+    { { 0xee }, { 2, 2 }, T, R, pfx_66 }, /* pmaxsw */
+    { { 0xef }, { 2, 2 }, T, R, pfx_no }, /* pxor */
+    { { 0xef }, { 2, 2 }, T, R, pfx_66 }, /* pxor */
+    { { 0xf0 }, { 2, 2 }, T, R, pfx_f2 }, /* lddqu */
+    { { 0xf1 }, { 2, 2 }, T, R, pfx_no }, /* psllw */
+    { { 0xf1 }, { 2, 2 }, T, R, pfx_66 }, /* psllw */
+    { { 0xf2 }, { 2, 2 }, T, R, pfx_no }, /* pslld */
+    { { 0xf2 }, { 2, 2 }, T, R, pfx_66 }, /* pslld */
+    { { 0xf3 }, { 2, 2 }, T, R, pfx_no }, /* psllq */
+    { { 0xf3 }, { 2, 2 }, T, R, pfx_66 }, /* psllq */
+    { { 0xf4 }, { 2, 2 }, T, R, pfx_no }, /* pmuludq */
+    { { 0xf4 }, { 2, 2 }, T, R, pfx_66 }, /* pmuludq */
+    { { 0xf5 }, { 2, 2 }, T, R, pfx_no }, /* pmaddwd */
+    { { 0xf5 }, { 2, 2 }, T, R, pfx_66 }, /* pmaddwd */
+    { { 0xf6 }, { 2, 2 }, T, R, pfx_no }, /* psadbw */
+    { { 0xf6 }, { 2, 2 }, T, R, pfx_66 }, /* psadbw */
+    { { 0xf7, 0xc0 }, { 2, 2 }, F, W, pfx_no }, /* maskmovq */
+    { { 0xf7, 0xc0 }, { 2, 2 }, F, W, pfx_66 }, /* maskmovdqu */
+    { { 0xf8 }, { 2, 2 }, T, R, pfx_no }, /* psubb */
+    { { 0xf8 }, { 2, 2 }, T, R, pfx_66 }, /* psubb */
+    { { 0xf9 }, { 2, 2 }, T, R, pfx_no }, /* psubw */
+    { { 0xf9 }, { 2, 2 }, T, R, pfx_66 }, /* psubw */
+    { { 0xfa }, { 2, 2 }, T, R, pfx_no }, /* psubd */
+    { { 0xfa }, { 2, 2 }, T, R, pfx_66 }, /* psubd */
+    { { 0xfb }, { 2, 2 }, T, R, pfx_no }, /* psubq */
+    { { 0xfb }, { 2, 2 }, T, R, pfx_66 }, /* psubq */
+    { { 0xfc }, { 2, 2 }, T, R, pfx_no }, /* paddb */
+    { { 0xfc }, { 2, 2 }, T, R, pfx_66 }, /* paddb */
+    { { 0xfd }, { 2, 2 }, T, R, pfx_no }, /* paddw */
+    { { 0xfd }, { 2, 2 }, T, R, pfx_66 }, /* paddw */
+    { { 0xfe }, { 2, 2 }, T, R, pfx_no }, /* paddd */
+    { { 0xfe }, { 2, 2 }, T, R, pfx_66 }, /* paddd */
     { { 0xff }, { 2, 2 }, F, N }, /* ud0 */
 }, legacy_0f38[] = {
+    { { 0x00 }, { 2, 2 }, T, R, pfx_no }, /* pshufb */
+    { { 0x00 }, { 2, 2 }, T, R, pfx_66 }, /* pshufb */
+    { { 0x01 }, { 2, 2 }, T, R, pfx_no }, /* phaddw */
+    { { 0x01 }, { 2, 2 }, T, R, pfx_66 }, /* phaddw */
+    { { 0x02 }, { 2, 2 }, T, R, pfx_no }, /* phaddd */
+    { { 0x02 }, { 2, 2 }, T, R, pfx_66 }, /* phaddd */
+    { { 0x03 }, { 2, 2 }, T, R, pfx_no }, /* phaddsw */
+    { { 0x03 }, { 2, 2 }, T, R, pfx_66 }, /* phaddsw */
+    { { 0x04 }, { 2, 2 }, T, R, pfx_no }, /* pmaddubsw */
+    { { 0x04 }, { 2, 2 }, T, R, pfx_66 }, /* pmaddubsw */
+    { { 0x05 }, { 2, 2 }, T, R, pfx_no }, /* phsubw */
+    { { 0x05 }, { 2, 2 }, T, R, pfx_66 }, /* phsubw */
+    { { 0x06 }, { 2, 2 }, T, R, pfx_no }, /* phsubd */
+    { { 0x06 }, { 2, 2 }, T, R, pfx_66 }, /* phsubd */
+    { { 0x07 }, { 2, 2 }, T, R, pfx_no }, /* phsubsw */
+    { { 0x07 }, { 2, 2 }, T, R, pfx_66 }, /* phsubsw */
+    { { 0x08 }, { 2, 2 }, T, R, pfx_no }, /* psignb */
+    { { 0x08 }, { 2, 2 }, T, R, pfx_66 }, /* psignb */
+    { { 0x09 }, { 2, 2 }, T, R, pfx_no }, /* psignw */
+    { { 0x09 }, { 2, 2 }, T, R, pfx_66 }, /* psignw */
+    { { 0x0a }, { 2, 2 }, T, R, pfx_no }, /* psignd */
+    { { 0x0a }, { 2, 2 }, T, R, pfx_66 }, /* psignd */
+    { { 0x0b }, { 2, 2 }, T, R, pfx_no }, /* pmulhrsw */
+    { { 0x0b }, { 2, 2 }, T, R, pfx_66 }, /* pmulhrsw */
+    { { 0x10 }, { 2, 2 }, T, R, pfx_66 }, /* pblendvb */
+    { { 0x14 }, { 2, 2 }, T, R, pfx_66 }, /* blendvps */
+    { { 0x15 }, { 2, 2 }, T, R, pfx_66 }, /* blendvpd */
+    { { 0x17 }, { 2, 2 }, T, R, pfx_66 }, /* ptest */
+    { { 0x1c }, { 2, 2 }, T, R, pfx_no }, /* pabsb */
+    { { 0x1c }, { 2, 2 }, T, R, pfx_66 }, /* pabsb */
+    { { 0x1d }, { 2, 2 }, T, R, pfx_no }, /* pabsw */
+    { { 0x1d }, { 2, 2 }, T, R, pfx_66 }, /* pabsw */
+    { { 0x1e }, { 2, 2 }, T, R, pfx_no }, /* pabsd */
+    { { 0x1e }, { 2, 2 }, T, R, pfx_66 }, /* pabsd */
+    { { 0x20 }, { 2, 2 }, T, R, pfx_66 }, /* pmovsxbw */
+    { { 0x21 }, { 2, 2 }, T, R, pfx_66 }, /* pmovsxbd */
+    { { 0x22 }, { 2, 2 }, T, R, pfx_66 }, /* pmovsxbq */
+    { { 0x23 }, { 2, 2 }, T, R, pfx_66 }, /* pmovsxwd */
+    { { 0x24 }, { 2, 2 }, T, R, pfx_66 }, /* pmovsxwq */
+    { { 0x25 }, { 2, 2 }, T, R, pfx_66 }, /* pmovsxdq */
+    { { 0x28 }, { 2, 2 }, T, R, pfx_66 }, /* pmuldq */
+    { { 0x29 }, { 2, 2 }, T, R, pfx_66 }, /* pcmpeqq */
+    { { 0x2a }, { 2, 2 }, F, R, pfx_66 }, /* movntdqa */
+    { { 0x2b }, { 2, 2 }, T, R, pfx_66 }, /* packusdw */
+    { { 0x30 }, { 2, 2 }, T, R, pfx_66 }, /* pmovzxbw */
+    { { 0x31 }, { 2, 2 }, T, R, pfx_66 }, /* pmovzxbd */
+    { { 0x32 }, { 2, 2 }, T, R, pfx_66 }, /* pmovzxbq */
+    { { 0x33 }, { 2, 2 }, T, R, pfx_66 }, /* pmovzxwd */
+    { { 0x34 }, { 2, 2 }, T, R, pfx_66 }, /* pmovzxwq */
+    { { 0x35 }, { 2, 2 }, T, R, pfx_66 }, /* pmovzxdq */
+    { { 0x37 }, { 2, 2 }, T, R, pfx_66 }, /* pcmpgtq */
+    { { 0x38 }, { 2, 2 }, T, R, pfx_66 }, /* pminsb */
+    { { 0x39 }, { 2, 2 }, T, R, pfx_66 }, /* pminsd */
+    { { 0x3a }, { 2, 2 }, T, R, pfx_66 }, /* pminuw */
+    { { 0x3b }, { 2, 2 }, T, R, pfx_66 }, /* pminud */
+    { { 0x3c }, { 2, 2 }, T, R, pfx_66 }, /* pmaxsb */
+    { { 0x3d }, { 2, 2 }, T, R, pfx_66 }, /* pmaxsd */
+    { { 0x3e }, { 2, 2 }, T, R, pfx_66 }, /* pmaxuw */
+    { { 0x3f }, { 2, 2 }, T, R, pfx_66 }, /* pmaxud */
+    { { 0x40 }, { 2, 2 }, T, R, pfx_66 }, /* pmulld */
+    { { 0x41 }, { 2, 2 }, T, R, pfx_66 }, /* phminposuw */
     { { 0x80 }, { 2, 2 }, T, R, pfx_66 }, /* invept */
     { { 0x81 }, { 2, 2 }, T, R, pfx_66 }, /* invvpid */
     { { 0x82 }, { 2, 2 }, T, R, pfx_66 }, /* invpcid */
+    { { 0xc8 }, { 2, 2 }, T, R, pfx_no }, /* sha1nexte */
+    { { 0xc9 }, { 2, 2 }, T, R, pfx_no }, /* sha1msg1 */
+    { { 0xca }, { 2, 2 }, T, R, pfx_no }, /* sha1msg2 */
+    { { 0xcb }, { 2, 2 }, T, R, pfx_no }, /* sha256rnds2 */
+    { { 0xcc }, { 2, 2 }, T, R, pfx_no }, /* sha256msg1 */
+    { { 0xcd }, { 2, 2 }, T, R, pfx_no }, /* sha256msg2 */
+    { { 0xcf }, { 2, 2 }, T, R, pfx_66 }, /* gf2p8mulb */
+    { { 0xdb }, { 2, 2 }, T, R, pfx_66 }, /* aesimc */
+    { { 0xdc }, { 2, 2 }, T, R, pfx_66 }, /* aesenc */
+    { { 0xdd }, { 2, 2 }, T, R, pfx_66 }, /* aesenclast */
+    { { 0xde }, { 2, 2 }, T, R, pfx_66 }, /* aesdec */
+    { { 0xdf }, { 2, 2 }, T, R, pfx_66 }, /* aesdeclast */
     { { 0xf0 }, { 2, 2 }, T, R }, /* movbe */
     { { 0xf0 }, { 2, 2 }, T, R, pfx_f2 }, /* crc32 */
     { { 0xf1 }, { 2, 2 }, T, W }, /* movbe */
@@ -517,6 +866,42 @@ static const struct {
 };
 #undef CND
 #undef REG
+
+static const struct {
+    uint8_t opc;
+    uint8_t mem:2;
+    uint8_t pfx:2;
+} legacy_0f3a[] = {
+    { 0x08, R, pfx_66 }, /* roundps */
+    { 0x09, R, pfx_66 }, /* roundpd */
+    { 0x0a, R, pfx_66 }, /* roundss */
+    { 0x0b, R, pfx_66 }, /* roundsd */
+    { 0x0c, R, pfx_66 }, /* blendps */
+    { 0x0d, R, pfx_66 }, /* blendpd */
+    { 0x0e, R, pfx_66 }, /* pblendw */
+    { 0x0f, R, pfx_no }, /* palignr */
+    { 0x0f, R, pfx_66 }, /* palignr */
+    { 0x14, W, pfx_66 }, /* pextrb */
+    { 0x15, W, pfx_66 }, /* pextrw */
+    { 0x16, W, pfx_66 }, /* pextrd */
+    { 0x17, W, pfx_66 }, /* extractps */
+    { 0x20, R, pfx_66 }, /* pinsrb */
+    { 0x21, R, pfx_66 }, /* insertps */
+    { 0x22, R, pfx_66 }, /* pinsrd */
+    { 0x40, R, pfx_66 }, /* dpps */
+    { 0x41, R, pfx_66 }, /* dppd */
+    { 0x42, R, pfx_66 }, /* mpsadbw */
+    { 0x44, R, pfx_66 }, /* pclmulqdq */
+    { 0x60, R, pfx_66 }, /* pcmpestrm */
+    { 0x61, R, pfx_66 }, /* pcmpestri */
+    { 0x62, R, pfx_66 }, /* pcmpistrm */
+    { 0x63, R, pfx_66 }, /* pcmpistri */
+    { 0xcc, R, pfx_no }, /* sha1rnds4 */
+    { 0xce, R, pfx_66 }, /* gf2p8affineqb */
+    { 0xcf, R, pfx_66 }, /* gf2p8affineinvqb */
+    { 0xdf, R, pfx_66 }, /* aeskeygenassist */
+};
+
 static const struct {
     uint8_t opc[2];
     bool modrm:1; /* Should register form (also) be tested? */
@@ -799,6 +1184,23 @@ void predicates_test(void *instr, struct
                     legacy_0f38[t].mem, ctxt, fetch);
         }
 
+        for ( t = 0; t < ARRAY_SIZE(legacy_0f3a); ++t )
+        {
+            uint8_t *ptr = instr;
+
+            memset(instr + 5, 0xcc, 10);
+            if ( legacy_0f3a[t].pfx )
+                *ptr++ = prefixes[legacy_0f3a[t].pfx - 1];
+            *ptr++ = 0x0f;
+            *ptr++ = 0x3a;
+            *ptr++ = legacy_0f3a[t].opc;
+            *ptr++ = 0x00; /* ModR/M */
+            *ptr++ = 0x00; /* imm8 */
+
+            do_test(instr, (void *)ptr - instr, (void *)ptr - instr - 2,
+                    legacy_0f3a[t].mem, ctxt, fetch);
+        }
+
         memset(instr + ARRAY_SIZE(fpu[t].opc), 0xcc, 13);
 
         for ( t = 0; t < ARRAY_SIZE(fpu); ++t )


