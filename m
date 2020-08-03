Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9F23A8DE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:51:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2boR-00058L-Sr; Mon, 03 Aug 2020 14:51:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2boR-000589-74
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:51:39 +0000
X-Inumbo-ID: d543e01a-d598-11ea-9097-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d543e01a-d598-11ea-9097-bc764e2007e4;
 Mon, 03 Aug 2020 14:51:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3768AC24;
 Mon,  3 Aug 2020 14:51:52 +0000 (UTC)
Subject: [PATCH 05/10] x86emul: extend decoding / mem access testing to
 XOP-encoded insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <aa89b745-b013-a483-1d91-f99f46d99c06@suse.com>
Date: Mon, 3 Aug 2020 16:51:36 +0200
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
@@ -1474,6 +1474,96 @@ static const struct {
     { vex_0f3a, ARRAY_SIZE(vex_0f3a) },
 };
 
+static const struct xop {
+    uint8_t opc[2];
+    uint8_t w:2;
+    uint8_t l:2;
+} xop_08[] = {
+    { { 0x85 }, W0, L0 }, /* vpmacssww */
+    { { 0x86 }, W0, L0 }, /* vpmacsswd */
+    { { 0x87 }, W0, L0 }, /* vpmacssdql */
+    { { 0x8e }, W0, L0 }, /* vpmacssdd */
+    { { 0x8f }, W0, L0 }, /* vpmacssdqh */
+    { { 0x95 }, W0, L0 }, /* vpmacsww */
+    { { 0x96 }, W0, L0 }, /* vpmacswd */
+    { { 0x97 }, W0, L0 }, /* vpmacsdql */
+    { { 0x9e }, W0, L0 }, /* vpmacsdd */
+    { { 0x9f }, W0, L0 }, /* vpmacsdqh */
+    { { 0xa2 }, Wn, Ln }, /* vpcmov */
+    { { 0xa3 }, Wn, L0 }, /* vpperm */
+    { { 0xa6 }, W0, L0 }, /* vpmadcsswd */
+    { { 0xb6 }, W0, L0 }, /* vpmadcswd */
+    { { 0xc0 }, W0, L0 }, /* vprotb */
+    { { 0xc1 }, W0, L0 }, /* vprotw */
+    { { 0xc2 }, W0, L0 }, /* vprotd */
+    { { 0xc3 }, W0, L0 }, /* vprotq */
+    { { 0xcc }, W0, L0 }, /* vpcomb */
+    { { 0xcd }, W0, L0 }, /* vpcomw */
+    { { 0xce }, W0, L0 }, /* vpcomd */
+    { { 0xcf }, W0, L0 }, /* vpcomq */
+    { { 0xec }, W0, L0 }, /* vpcomub */
+    { { 0xed }, W0, L0 }, /* vpcomuw */
+    { { 0xee }, W0, L0 }, /* vpcomud */
+    { { 0xef }, W0, L0 }, /* vpcomuq */
+}, xop_09[] = {
+    { { 0x01, 0x08 }, Wn, L0 }, /* blcfill */
+    { { 0x01, 0x10 }, Wn, L0 }, /* blsfill */
+    { { 0x01, 0x18 }, Wn, L0 }, /* blcs */
+    { { 0x01, 0x20 }, Wn, L0 }, /* tzmsk */
+    { { 0x01, 0x28 }, Wn, L0 }, /* blcic */
+    { { 0x01, 0x30 }, Wn, L0 }, /* blsic */
+    { { 0x01, 0x38 }, Wn, L0 }, /* t1mskc */
+    { { 0x02, 0x08 }, Wn, L0 }, /* blcmsk */
+    { { 0x02, 0x30 }, Wn, L0 }, /* blci */
+    { { 0x02, 0xc0 }, Wn, L0 }, /* llwpcb */
+    { { 0x02, 0xc8 }, Wn, L0 }, /* slwpcb */
+    { { 0x80 }, W0, Ln }, /* vfrczps */
+    { { 0x81 }, W0, Ln }, /* vfrczpd */
+    { { 0x82 }, W0, L0 }, /* vfrczss */
+    { { 0x83 }, W0, L0 }, /* vfrczsd */
+    { { 0x90 }, Wn, L0 }, /* vprotb */
+    { { 0x91 }, Wn, L0 }, /* vprotw */
+    { { 0x92 }, Wn, L0 }, /* vprotd */
+    { { 0x93 }, Wn, L0 }, /* vprotq */
+    { { 0x94 }, Wn, L0 }, /* vpshlb */
+    { { 0x95 }, Wn, L0 }, /* vpshlw */
+    { { 0x96 }, Wn, L0 }, /* vpshld */
+    { { 0x97 }, Wn, L0 }, /* vpshlq */
+    { { 0x9c }, Wn, L0 }, /* vpshab */
+    { { 0x9d }, Wn, L0 }, /* vpshaw */
+    { { 0x9e }, Wn, L0 }, /* vpshad */
+    { { 0x9f }, Wn, L0 }, /* vpshaq */
+    { { 0xc1 }, W0, L0 }, /* vphaddbw */
+    { { 0xc2 }, W0, L0 }, /* vphaddbd */
+    { { 0xc3 }, W0, L0 }, /* vphaddbq */
+    { { 0xc6 }, W0, L0 }, /* vphaddwd */
+    { { 0xc7 }, W0, L0 }, /* vphaddwq */
+    { { 0xcb }, W0, L0 }, /* vphadddq */
+    { { 0xd1 }, W0, L0 }, /* vphaddubw */
+    { { 0xd2 }, W0, L0 }, /* vphaddubd */
+    { { 0xd3 }, W0, L0 }, /* vphaddubq */
+    { { 0xd6 }, W0, L0 }, /* vphadduwd */
+    { { 0xd7 }, W0, L0 }, /* vphadduwq */
+    { { 0xdb }, W0, L0 }, /* vphaddudq */
+    { { 0xe1 }, W0, L0 }, /* vphsubbw */
+    { { 0xe2 }, W0, L0 }, /* vphsubwd */
+    { { 0xe3 }, W0, L0 }, /* vphsubdq */
+}, xop_0a[] = {
+    { { 0x10 }, Wn, L0 }, /* bextr */
+    { { 0x12, 0x00 }, Wn, L0 }, /* lwpins */
+    { { 0x12, 0x08 }, Wn, L0 }, /* lwpval */
+};
+
+static const struct {
+    const struct xop *tbl;
+    unsigned int num;
+    unsigned int imm;
+} xop[] = {
+    { xop_08, ARRAY_SIZE(xop_08), 1 },
+    { xop_09, ARRAY_SIZE(xop_09), 0 },
+    { xop_0a, ARRAY_SIZE(xop_0a), 4 },
+};
+
 #undef Wn
 #undef Ln
 
@@ -1736,6 +1826,63 @@ void predicates_test(void *instr, struct
                     }
                 }
             }
+        }
+
+        for ( x = 0; x < ARRAY_SIZE(xop); ++x )
+        {
+            for ( t = 0; t < xop[x].num; ++t )
+            {
+                uint8_t *ptr = instr;
+                unsigned int modrm;
+                enum mem_access mem;
+
+                memset(instr + 5, 0xcc, 10);
+
+                *ptr++ = 0x8f;
+                *ptr++ = 0xe8 + x;
+                *ptr++ = 0x78;
+                memcpy(ptr, xop[x].tbl[t].opc, 2);
+                memset(ptr + 2, 0, xop[x].imm);
+
+                modrm = ptr[1] & 0xc0 ? 0 : 4;
+                mem = ptr[1] & 0xc0 ? mem_none : mem_read;
+
+                assert(xop[x].tbl[t].w != WIG);
+                assert(xop[x].tbl[t].l != LIG);
+
+                if ( xop[x].tbl[t].w & W0 )
+                {
+                    if ( xop[x].tbl[t].l & L0 )
+                        do_test(instr, 5 + xop[x].imm, modrm, mem, ctxt, fetch);
+
+                    if ( xop[x].tbl[t].l & L1 )
+                    {
+                        ptr[-1] = 0x7c;
+                        ptr[1] = mem != mem_none ? 0x00 : 0xc0;
+
+                        do_test(instr, 5 + xop[x].imm, modrm, mem, ctxt, fetch);
+                    }
+                }
+
+                if ( xop[x].tbl[t].w & W1 )
+                {
+                    if ( xop[x].tbl[t].l & L0 )
+                    {
+                        ptr[-1] = 0xf8;
+                        ptr[1] = mem != mem_none ? 0x00 : 0xc0;
+
+                        do_test(instr, 5 + xop[x].imm, modrm, mem, ctxt, fetch);
+                    }
+
+                    if ( xop[x].tbl[t].l & L1 )
+                    {
+                        ptr[-1] = 0xfc;
+                        ptr[1] = mem != mem_none ? 0x00 : 0xc0;
+
+                        do_test(instr, 5 + xop[x].imm, modrm, mem, ctxt, fetch);
+                    }
+                }
+            }
         }
 
         if ( errors )


