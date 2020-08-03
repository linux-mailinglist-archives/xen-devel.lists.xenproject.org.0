Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251D23A8DA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:50:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2bnD-0004sx-Bf; Mon, 03 Aug 2020 14:50:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2bnB-0004sA-Ux
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:50:21 +0000
X-Inumbo-ID: a6cd0536-d598-11ea-af3a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6cd0536-d598-11ea-af3a-12813bfff9fa;
 Mon, 03 Aug 2020 14:50:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE6F6ACC8;
 Mon,  3 Aug 2020 14:50:34 +0000 (UTC)
Subject: [PATCH 01/10] x86emul: adjustments to mem access / write logic testing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <12105df6-e0c6-c46d-8a9a-04192e8faabb@suse.com>
Date: Mon, 3 Aug 2020 16:50:18 +0200
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

The combination of specifying a ModR/M byte with the upper two bits set
and the modrm field set to T is pointless - the same test will be
executed twice, i.e. overall things will be slower for no extra gain. I
can only assume this was a copy-and-paste-without-enough-editing mistake
of mine.

Furthermore adjust the base type of a few bit fields to shrink table
size, as subsequently quite a few new entries will get added to the
tables using this type.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -21,8 +21,8 @@ static const struct {
     uint8_t opc[8];
     uint8_t len[2]; /* 32- and 64-bit mode */
     bool modrm:1; /* Should register form (also) be tested? */
-    unsigned int mem:2;
-    unsigned int pfx:2;
+    uint8_t mem:2;
+    uint8_t pfx:2;
 #define REG(opc, more...) \
     { { (opc) | 0 }, more }, /* %?ax */ \
     { { (opc) | 1 }, more }, /* %?cx */ \
@@ -334,53 +334,53 @@ static const struct {
     /*{ 0x01, 0x28 }, { 2, 2 }, F, W, pfx_f3 }, rstorssp */
     { { 0x01, 0x30 }, { 2, 2 }, T, R }, /* lmsw */
     { { 0x01, 0x38 }, { 2, 2 }, F, N }, /* invlpg */
-    { { 0x01, 0xc0 }, { 2, 2 }, T, N }, /* enclv */
-    { { 0x01, 0xc1 }, { 2, 2 }, T, N }, /* vmcall */
+    { { 0x01, 0xc0 }, { 2, 2 }, F, N }, /* enclv */
+    { { 0x01, 0xc1 }, { 2, 2 }, F, N }, /* vmcall */
     /*{ 0x01, 0xc2 }, { 2, 2 }, F, R }, vmlaunch */
     /*{ 0x01, 0xc3 }, { 2, 2 }, F, R }, vmresume */
-    { { 0x01, 0xc4 }, { 2, 2 }, T, N }, /* vmxoff */
-    { { 0x01, 0xc5 }, { 2, 2 }, T, N }, /* pconfig */
-    { { 0x01, 0xc8 }, { 2, 2 }, T, N }, /* monitor */
-    { { 0x01, 0xc9 }, { 2, 2 }, T, N }, /* mwait */
-    { { 0x01, 0xca }, { 2, 2 }, T, N }, /* clac */
-    { { 0x01, 0xcb }, { 2, 2 }, T, N }, /* stac */
-    { { 0x01, 0xcf }, { 2, 2 }, T, N }, /* encls */
-    { { 0x01, 0xd0 }, { 2, 2 }, T, N }, /* xgetbv */
-    { { 0x01, 0xd1 }, { 2, 2 }, T, N }, /* xsetbv */
-    { { 0x01, 0xd4 }, { 2, 2 }, T, N }, /* vmfunc */
-    { { 0x01, 0xd5 }, { 2, 2 }, T, N }, /* xend */
-    { { 0x01, 0xd6 }, { 2, 2 }, T, N }, /* xtest */
-    { { 0x01, 0xd7 }, { 2, 2 }, T, N }, /* enclu */
+    { { 0x01, 0xc4 }, { 2, 2 }, F, N }, /* vmxoff */
+    { { 0x01, 0xc5 }, { 2, 2 }, F, N }, /* pconfig */
+    { { 0x01, 0xc8 }, { 2, 2 }, F, N }, /* monitor */
+    { { 0x01, 0xc9 }, { 2, 2 }, F, N }, /* mwait */
+    { { 0x01, 0xca }, { 2, 2 }, F, N }, /* clac */
+    { { 0x01, 0xcb }, { 2, 2 }, F, N }, /* stac */
+    { { 0x01, 0xcf }, { 2, 2 }, F, N }, /* encls */
+    { { 0x01, 0xd0 }, { 2, 2 }, F, N }, /* xgetbv */
+    { { 0x01, 0xd1 }, { 2, 2 }, F, N }, /* xsetbv */
+    { { 0x01, 0xd4 }, { 2, 2 }, F, N }, /* vmfunc */
+    { { 0x01, 0xd5 }, { 2, 2 }, F, N }, /* xend */
+    { { 0x01, 0xd6 }, { 2, 2 }, F, N }, /* xtest */
+    { { 0x01, 0xd7 }, { 2, 2 }, F, N }, /* enclu */
     /*{ 0x01, 0xd8 }, { 2, 2 }, F, R }, vmrun */
-    { { 0x01, 0xd9 }, { 2, 2 }, T, N }, /* vmcall */
-    { { 0x01, 0xd9 }, { 2, 2 }, T, N, pfx_f3 }, /* vmgexit */
-    { { 0x01, 0xd9 }, { 2, 2 }, T, N, pfx_f2 }, /* vmgexit */
+    { { 0x01, 0xd9 }, { 2, 2 }, F, N }, /* vmcall */
+    { { 0x01, 0xd9 }, { 2, 2 }, F, N, pfx_f3 }, /* vmgexit */
+    { { 0x01, 0xd9 }, { 2, 2 }, F, N, pfx_f2 }, /* vmgexit */
     /*{ 0x01, 0xda }, { 2, 2 }, F, R }, vmload */
     /*{ 0x01, 0xdb }, { 2, 2 }, F, W }, vmsave */
-    { { 0x01, 0xdc }, { 2, 2 }, T, N }, /* stgi */
-    { { 0x01, 0xdd }, { 2, 2 }, T, N }, /* clgi */
+    { { 0x01, 0xdc }, { 2, 2 }, F, N }, /* stgi */
+    { { 0x01, 0xdd }, { 2, 2 }, F, N }, /* clgi */
     /*{ 0x01, 0xde }, { 2, 2 }, F, R }, skinit */
-    { { 0x01, 0xdf }, { 2, 2 }, T, N }, /* invlpga */
-    { { 0x01, 0xe8 }, { 2, 2 }, T, N }, /* serialize */
+    { { 0x01, 0xdf }, { 2, 2 }, F, N }, /* invlpga */
+    { { 0x01, 0xe8 }, { 2, 2 }, F, N }, /* serialize */
     /*{ 0x01, 0xe8 }, { 2, 2 }, F, W, pfx_f3 }, setssbsy */
-    { { 0x01, 0xe8 }, { 2, 2 }, T, N, pfx_f2 }, /* xsusldtrk */
-    { { 0x01, 0xe9 }, { 2, 2 }, T, N, pfx_f2 }, /* xresldtrk */
+    { { 0x01, 0xe8 }, { 2, 2 }, F, N, pfx_f2 }, /* xsusldtrk */
+    { { 0x01, 0xe9 }, { 2, 2 }, F, N, pfx_f2 }, /* xresldtrk */
     /*{ 0x01, 0xea }, { 2, 2 }, F, W, pfx_f3 }, saveprevssp */
-    { { 0x01, 0xee }, { 2, 2 }, T, N }, /* rdpkru */
-    { { 0x01, 0xef }, { 2, 2 }, T, N }, /* wrpkru */
-    { { 0x01, 0xf8 }, { 0, 2 }, T, N }, /* swapgs */
-    { { 0x01, 0xf9 }, { 2, 2 }, T, N }, /* rdtscp */
-    { { 0x01, 0xfa }, { 2, 2 }, T, N }, /* monitorx */
-    { { 0x01, 0xfa }, { 2, 2 }, T, N, pfx_f3 }, /* mcommit */
-    { { 0x01, 0xfb }, { 2, 2 }, T, N }, /* mwaitx */
+    { { 0x01, 0xee }, { 2, 2 }, F, N }, /* rdpkru */
+    { { 0x01, 0xef }, { 2, 2 }, F, N }, /* wrpkru */
+    { { 0x01, 0xf8 }, { 0, 2 }, F, N }, /* swapgs */
+    { { 0x01, 0xf9 }, { 2, 2 }, F, N }, /* rdtscp */
+    { { 0x01, 0xfa }, { 2, 2 }, F, N }, /* monitorx */
+    { { 0x01, 0xfa }, { 2, 2 }, F, N, pfx_f3 }, /* mcommit */
+    { { 0x01, 0xfb }, { 2, 2 }, F, N }, /* mwaitx */
     { { 0x01, 0xfc }, { 2, 2 }, F, W }, /* clzero */
-    { { 0x01, 0xfd }, { 2, 2 }, T, N }, /* rdpru */
-    { { 0x01, 0xfe }, { 2, 2 }, T, N }, /* invlpgb */
-    { { 0x01, 0xfe }, { 0, 2 }, T, N, pfx_f3 }, /* rmpadjust */
-    { { 0x01, 0xfe }, { 0, 2 }, T, N, pfx_f2 }, /* rmpupdate */
-    { { 0x01, 0xff }, { 2, 2 }, T, N }, /* tlbsync */
-    { { 0x01, 0xff }, { 0, 2 }, T, N, pfx_f3 }, /* psmash */
-    { { 0x01, 0xff }, { 0, 2 }, T, N, pfx_f2 }, /* pvalidate */
+    { { 0x01, 0xfd }, { 2, 2 }, F, N }, /* rdpru */
+    { { 0x01, 0xfe }, { 2, 2 }, F, N }, /* invlpgb */
+    { { 0x01, 0xfe }, { 0, 2 }, F, N, pfx_f3 }, /* rmpadjust */
+    { { 0x01, 0xfe }, { 0, 2 }, F, N, pfx_f2 }, /* rmpupdate */
+    { { 0x01, 0xff }, { 2, 2 }, F, N }, /* tlbsync */
+    { { 0x01, 0xff }, { 0, 2 }, F, N, pfx_f3 }, /* psmash */
+    { { 0x01, 0xff }, { 0, 2 }, F, N, pfx_f2 }, /* pvalidate */
     { { 0x02 }, { 2, 2 }, T, R }, /* lar */
     { { 0x03 }, { 2, 2 }, T, R }, /* lsl */
     { { 0x05 }, { 1, 1 }, F, N }, /* syscall */


