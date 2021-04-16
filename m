Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1183620D6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 15:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111736.213707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOQn-0000Sf-5P; Fri, 16 Apr 2021 13:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111736.213707; Fri, 16 Apr 2021 13:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOQn-0000SG-23; Fri, 16 Apr 2021 13:22:45 +0000
Received: by outflank-mailman (input) for mailman id 111736;
 Fri, 16 Apr 2021 13:22:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXOQm-0000SA-2r
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 13:22:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05dbe689-415d-4549-8847-7e2fc4ddd9ae;
 Fri, 16 Apr 2021 13:22:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54ADDAF4F;
 Fri, 16 Apr 2021 13:22:42 +0000 (UTC)
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
X-Inumbo-ID: 05dbe689-415d-4549-8847-7e2fc4ddd9ae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618579362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V74WwRMWMSOh03GoTQjxwrPJS93n0Ufbhy6GbCB7rbE=;
	b=CpRKwvkT3rjiLYM86zXiAPJgkJ3w0gvBHsCSWMOnovXjd11VfltazG4UsO7dtL+S9a1h/p
	Amu1rBfX2OzLtF3xF0hYScMoTvhd1i/npkB5swvD1GdJTjVddM+iAG6oVT9OfMzzay+8cB
	h6in6DZNY6xJlMMPvOC5ik1yvBAAS08=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: add further "fast repeated string ops" feature
 flags
Message-ID: <c4e5fad5-0468-fe9f-aa6f-1a4efce72cc4@suse.com>
Date: Fri, 16 Apr 2021 15:22:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Like ERMS this can always be exposed to guests, but I guess once we
introduce full validation we want to make sure we don't reject incoming
policies with any of these set when in the raw/host policies they're
clear.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -215,6 +215,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
 
         {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
         {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
+        {"fsrm",         0x00000007,  0, CPUID_REG_EDX,  4,  1},
         {"avx512-vp2intersect",0x00000007,0,CPUID_REG_EDX,8, 1},
         {"srbds-ctrl",   0x00000007,  0, CPUID_REG_EDX,  9,  1},
         {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
@@ -229,6 +230,9 @@ int libxl_cpuid_parse_config(libxl_cpuid
 
         {"avx-vnni",     0x00000007,  1, CPUID_REG_EAX,  4,  1},
         {"avx512-bf16",  0x00000007,  1, CPUID_REG_EAX,  5,  1},
+        {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
+        {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
+        {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
 
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
         {"cmplegacy",    0x80000001, NA, CPUID_REG_ECX,  1,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -177,6 +177,9 @@ static const char *const str_7d0[32] =
 static const char *const str_7a1[32] =
 {
     [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
+
+    [10] = "fzrm",          [11] = "fsrs",
+    [12] = "fsrcs",
 };
 
 static const struct {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -261,6 +261,7 @@ XEN_CPUFEATURE(SSB_NO,        8*32+26) /
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
 XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*A  AVX512 Neural Network Instructions */
 XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single Precision */
+XEN_CPUFEATURE(FSRM,          9*32+ 4) /*A  Fast Short REP MOVS */
 XEN_CPUFEATURE(AVX512_VP2INTERSECT, 9*32+8) /*a  VP2INTERSECT{D,Q} insns */
 XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS. */
 XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
@@ -277,6 +278,9 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /
 /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
+XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
+XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
+XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
 
 #endif /* XEN_CPUFEATURE */
 

