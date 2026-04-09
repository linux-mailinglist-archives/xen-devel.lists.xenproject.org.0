Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEkjBy/A12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:05:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1703CC5F5
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277730.1562864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqwO-0001dc-Q8; Thu, 09 Apr 2026 15:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277730.1562864; Thu, 09 Apr 2026 15:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqwO-0001ag-LT; Thu, 09 Apr 2026 15:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1277730;
 Thu, 09 Apr 2026 15:05:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqwN-0001aR-GZ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:05:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqwM-00EC7x-SZ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:05:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c018-5cb7-0a2a0a5109dd-0a2a450cae3a-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:05:06 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c022-f40c-0a2a450c0019-d1558030d92c-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:05:06 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso9552155e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:05:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d534584esm3476535e9.13.2026.04.09.08.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:05:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775747106; x=1776351906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fy810O/JIrpMqa9PSa5WVZ8ULg9qI+umlI0cfV5YuUE=;
        b=cVm8L3DyeZ2me3tw0Vh69A0w3a/wJADvqsrBc9sQvqp5DlLqJb/gcckyHx8T6NRuoB
         H9fbRu69pglxQZA5QU1+RAf8rm1HZxPnlZYpF4G/pb3mXtJe1PM0q4wNaHZgraLc9OA/
         g+9bRft5s5gFLMWKPHniU+8LErL+Vuq5xUQo9Dj5u+qgTLqJEfEuGIDULSdauBp4u1fF
         6oBah6ZC3zY2UI/2TjWuu7/XSFzUhCRn9IwxjNSD7LEyFY3AuI9WsAMb0x7MAO0zSs3F
         Ct2sgW7KbcTNZ2BYpTPYMFJ/+kLbRMUGruxoRvMv8w8PwS1wRvwEOQwEopagzdgdSqM5
         UAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747106; x=1776351906;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fy810O/JIrpMqa9PSa5WVZ8ULg9qI+umlI0cfV5YuUE=;
        b=H6yDqUwkn2wpGlyFE32e+UbNlIbidiTw6T6oi9HDy8rhSF5lR49LidfqN8KgAemYdC
         B62Dgu1nYQ1R/iKW/qoLTBJhIBLJ3u8JcXglhjAWXgPEyTWcvEhSNX1p8zoIKYVpFL0X
         CH/vPvYjGzOpzdY+qO6Td6Jn2O6Pi+e+y6wcaqPFutLDJfkflJLOAeyV2/uE6BfssDk7
         jo1b4iGqNzCjr83ePfJDTrABhn7/yJUDhYhYnW4BLijQep288R1i6APez00TFimyHlEg
         JO8ePf/q77U6pwC3MEn9qfx6gVmLpSOlajHP5e2NcBrRb8CEEKYQJtvOgYmT97wX+rtK
         7Tqw==
X-Gm-Message-State: AOJu0YwqKyplU/1xtcGl2jhupz8zH6MEs8IPu8t/AAcTSH+OsSdjMJ2I
	0eAgl9NjsMhZtUcuSHptG6kaYo7M7W4jV13gYXEAuG0pmm08gIVC6NoH1mFsrUI0LJehK1sZaGy
	hh9cb2g==
X-Gm-Gg: AeBDievfgkRPZyYq1U2qt8TKOUUTmI0zH7j00QBQuVeAj4RfqjDvDXGV5mo5zzG3RG3
	plElCl9VeiutDQZHN5iJ89/BfGdQm6ixPc3OPwKduyKQS/ftEj6JDLal9P6X0poewk2ljFFCppO
	uoFpbRwMikL67c2OrzYSPocvqtJKmg9TscGdEjGOgwCwdLJiNdJuRRSG7/vrxgNB0Rksej0nZXS
	iPH18vEgUZLWEf0wA19sxz7gE+WyH+cY1+ypLtxH/744UjAJxNsF4eMWUTU1e2QPGxF2uHMmB6T
	QOh+JkQ+DOmqkMWRI75DezSBf7Sm1sWSrbn+4qCsslkz0iiVGL1BG/I2SqvxWuR7j6dhXYbVvUH
	1OCV1P2gXzs3/xuGNrpNManVJGaIjlzjHxVkjKh5YtHzQnGLaWeROJcEs+d5O3nDd05nCIY2Mad
	WNvL7WVAHHM9ys/dfti6xXDP2HOtFsqPB3dAKLrRs/Zso5az04HHh5aajzd/J3U05LwkR6FJOJS
	FkZelygTcSgFxg=
X-Received: by 2002:a05:600c:c083:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-488ccf3e9abmr39429425e9.6.1775747106035;
        Thu, 09 Apr 2026 08:05:06 -0700 (PDT)
Message-ID: <34db5d46-87cf-4449-900e-5b9e6965a52b@suse.com>
Date: Thu, 9 Apr 2026 17:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 06/16] x86emul: AVX10.1 testing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775747106-FE151A3D-94C8CACE/0/0
X-purgate-type: clean
X-purgate-size: 11728
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,testcase.mk:url];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7F1703CC5F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Re-use respective AVX512 tests, by suitably adjusting the predicate
functions. This leaves test names ("Testing ... NN-bit code sequence")
somewhat misleading, but I think we can live with that.

Note that the AVX512{BW,DQ} opmask tests cannot be run as-is for the
AVX10/256 case, as they include 512-bit vector <-> opmask insn tests.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -gnr / -gnr256
---
TBD: The testcase.mk change was for AVX10.1/256. It may, however, be
     worthwhile to keep it.

TBD: May want to have separate AVX10 test blobs built, utilizing all of
     the implied AVX512 sub-features.

The AVX512{BW,DQ} opmask tests could of course be cloned (i.e. rebuilt
another time with -mavx512vl passed) accordingly, but the coverage gain
would be pretty marginal.
---
v4: Drop use of vsz<N> fields. Series re-ordering adjustments. Drop stale
    Phi leftovers. Re-base.
v2: Drop SDE 9.27.0 workaround. Re-base over dropping of Xeon Phi
    support.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1026,7 +1026,7 @@ static void test_group(const struct test
         for ( j = 0; j < nr_vl; ++j )
         {
             if ( vl[0] == VL_512 && vl[j] != VL_512 &&
-                 !cpu_policy.feat.avx512vl )
+                 !cpu_policy.feat.avx512vl && !cpu_policy.feat.avx10 )
                 continue;
 
             switch ( tests[i].esz )
@@ -1077,6 +1077,24 @@ static void test_group(const struct test
     }
 }
 
+/* AVX512 (sub)features implied by AVX10. */
+#define avx10_has_avx512f             cpu_has_avx10
+#define avx10_has_avx512bw            cpu_has_avx10
+#define avx10_has_avx512cd            cpu_has_avx10
+#define avx10_has_avx512dq            cpu_has_avx10
+#define avx10_has_avx512_bf16         cpu_has_avx10
+#define avx10_has_avx512_bitalg       cpu_has_avx10
+#define avx10_has_avx512_fp16         cpu_has_avx10
+#define avx10_has_avx512_ifma         cpu_has_avx10
+#define avx10_has_avx512_vbmi         cpu_has_avx10
+#define avx10_has_avx512_vbmi2        cpu_has_avx10
+#define avx10_has_avx512_vnni         cpu_has_avx10
+#define avx10_has_avx512_vpopcntdq    cpu_has_avx10
+
+/* AVX512 sub-feature(s) /not/ implied by AVX10. */
+#define avx10_has_avx512_vp2intersect false
+#define avx10_has_avx512_bmm          false
+
 void evex_disp8_test(void *instr, struct x86_emulate_ctxt *ctxt,
                      const struct x86_emulate_ops *ops)
 {
@@ -1094,7 +1112,7 @@ void evex_disp8_test(void *instr, struct
     } \
 } while ( false )
 
-#define RUN(feat, vl) run(cpu_has_ ## feat, feat, vl)
+#define RUN(feat, vl) run(cpu_has_ ## feat || avx10_has_ ## feat, feat, vl)
 
     RUN(avx512f, all);
     RUN(avx512f, 128);
@@ -1120,11 +1138,15 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512_bmm, all);
     RUN(avx512_bmm, no128);
 
-    if ( cpu_has_avx512f )
+#undef RUN
+
+    if ( cpu_has_avx512f || cpu_has_avx10 )
     {
+#define RUN(feat, vl) run(cpu_has_ ## feat, feat, vl)
         RUN(gfni, all);
         RUN(vaes, all);
         RUN(vpclmulqdq, all);
+#undef RUN
     }
 
     if ( cpu_has_avx10 )
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -7,6 +7,22 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDD
 CFLAGS += -ffreestanding -nostdinc -I$(XEN_ROOT)/tools/firmware/include
 CFLAGS += -fno-stack-protector -g0 $($(TESTCASE)-cflags)
 
+ifneq ($(filter -mavx512%,$($(TESTCASE)-cflags)),)
+
+cflags-vsz64 :=
+cflags-vsz32 := -mprefer-vector-width=256
+cflags-vsz16 := -mprefer-vector-width=128
+# Scalar tests don't set VEC_SIZE (and VEC_MAX is used by S/G ones only)
+cflags-vsz   := -mprefer-vector-width=128
+
+ifneq ($(filter -DVEC_SIZE=%,$($(TESTCASE)-cflags)),)
+CFLAGS += $(cflags-vsz$(patsubst -DVEC_SIZE=%,%,$(filter -DVEC_SIZE=%,$($(TESTCASE)-cflags))))
+else
+CFLAGS += $(cflags-vsz$(patsubst -DVEC_MAX=%,%,$(filter -DVEC_MAX=%,$($(TESTCASE)-cflags))))
+endif
+
+endif
+
 LDFLAGS_DIRECT += $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2>&1 && echo --no-warn-rwx-segments)
 
 .PHONY: all
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -124,52 +124,56 @@ static bool simd_check_avx_pclmul(void)
 
 static bool simd_check_avx512f(void)
 {
-    return cpu_has_avx512f;
+    return cpu_has_avx512f || cpu_has_avx10;
 }
 #define simd_check_avx512f_opmask simd_check_avx512f
 #define simd_check_avx512f_sg simd_check_avx512f
 
 static bool simd_check_avx512f_vl(void)
 {
-    return cpu_has_avx512f && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512f && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 #define simd_check_avx512vl_sg simd_check_avx512f_vl
 
 static bool simd_check_avx512dq(void)
 {
-    return cpu_has_avx512dq;
+    return cpu_has_avx512dq || cpu_has_avx10;
 }
 #define simd_check_avx512dq_opmask simd_check_avx512dq
 
 static bool simd_check_avx512dq_vl(void)
 {
-    return cpu_has_avx512dq && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512dq && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 
 static bool simd_check_avx512bw(void)
 {
-    return cpu_has_avx512bw;
+    return cpu_has_avx512bw || cpu_has_avx10;
 }
 #define simd_check_avx512bw_opmask simd_check_avx512bw
 
 static bool simd_check_avx512bw_vl(void)
 {
-    return cpu_has_avx512bw && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512bw && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 
 static bool simd_check_avx512vbmi(void)
 {
-    return cpu_has_avx512_vbmi;
+    return cpu_has_avx512_vbmi || cpu_has_avx10;
 }
 
 static bool simd_check_avx512vbmi_vl(void)
 {
-    return cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 
 static bool simd_check_avx512vbmi2(void)
 {
-    return cpu_has_avx512_vbmi2;
+    return cpu_has_avx512_vbmi2 || cpu_has_avx10;
 }
 
 static bool simd_check_sse4_sha(void)
@@ -250,17 +254,18 @@ static bool simd_check_avx512bw_gf_vl(vo
 
 static bool simd_check_avx512vnni(void)
 {
-    return cpu_has_avx512_vnni;
+    return cpu_has_avx512_vnni || cpu_has_avx10;
 }
 
 static bool simd_check_avx512fp16(void)
 {
-    return cpu_has_avx512_fp16;
+    return cpu_has_avx512_fp16 || cpu_has_avx10;
 }
 
 static bool simd_check_avx512fp16_vl(void)
 {
-    return cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10;
 }
 
 static void simd_set_regs(struct cpu_user_regs *regs)
@@ -3238,11 +3243,22 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(evex_vmovq_from_mem) )
             goto fail;
-        asm ( "vmovq %1, %%xmm1\n\t"
-              "vpcmpeqq %%zmm0, %%zmm1, %%k0\n"
-              "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
-        if ( rc != 0xff )
-            goto fail;
+        if ( simd_check_avx512f() )
+        {
+            asm ( "vmovq %1, %%xmm1\n\t"
+                  "vpcmpeqq %%zmm0, %%zmm1, %%k0\n"
+                  "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x00ff )
+                goto fail;
+        }
+        else
+        {
+            asm ( "vmovq %1, %%xmm1\n\t"
+                  "vpcmpeqq %%xmm0, %%xmm1, %%k0\n"
+                  "kmovb %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x03 )
+                goto fail;
+        }
         printf("okay\n");
     }
     else
@@ -3820,11 +3836,22 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(evex_vmovd_from_mem) )
             goto fail;
-        asm ( "vmovd %1, %%xmm0\n\t"
-              "vpcmpeqd %%zmm4, %%zmm0, %%k0\n\t"
-              "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
-        if ( rc != 0xffff )
-            goto fail;
+        if ( simd_check_avx512f() )
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%zmm4, %%zmm0, %%k0\n\t"
+                  "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0xffff )
+                goto fail;
+        }
+        else
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%xmm4, %%xmm0, %%k0\n\t"
+                  "kmovb %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x0f )
+                goto fail;
+        }
         printf("okay\n");
     }
     else
@@ -4037,11 +4064,22 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || !check_eip(evex_vmovd_from_reg) )
             goto fail;
-        asm ( "vmovd %1, %%xmm0\n\t"
-              "vpcmpeqd %%zmm1, %%zmm0, %%k0\n\t"
-              "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
-        if ( rc != 0xffff )
-            goto fail;
+        if ( simd_check_avx512f() )
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%zmm1, %%zmm0, %%k0\n\t"
+                  "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0xffff )
+                goto fail;
+        }
+        else
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%xmm1, %%xmm0, %%k0\n\t"
+                  "kmovb %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x0f )
+                goto fail;
+        }
         printf("okay\n");
     }
     else
@@ -5524,14 +5562,28 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || !check_eip(vmovsh_from_mem) )
             goto fail;
-        asm volatile ( "kmovw     %2, %%k1\n\t"
-                       "vmovdqu16 %1, %%zmm4%{%%k1%}%{z%}\n\t"
-                       "vpcmpeqw  %%zmm4, %%zmm5, %%k0\n\t"
-                       "kmovw     %%k0, %0"
-                       : "=g" (rc)
-                       : "m" (res[2]), "r" (1) );
-        if ( rc != 0xffff )
-            goto fail;
+        if ( simd_check_avx512fp16() )
+        {
+            asm volatile ( "kmovw     %2, %%k1\n\t"
+                           "vmovdqu16 %1, %%zmm4%{%%k1%}%{z%}\n\t"
+                           "vpcmpeqw  %%zmm4, %%zmm5, %%k0\n\t"
+                           "kmovw     %%k0, %0"
+                           : "=g" (rc)
+                           : "m" (res[2]), "r" (1) );
+            if ( rc != 0xffff )
+                goto fail;
+        }
+        else
+        {
+            asm volatile ( "kmovb     %2, %%k1\n\t"
+                           "vmovdqu16 %1, %%xmm4%{%%k1%}%{z%}\n\t"
+                           "vpcmpeqw  %%xmm4, %%xmm5, %%k0\n\t"
+                           "kmovb     %%k0, %0"
+                           : "=g" (rc)
+                           : "m" (res[2]), "r" (1) );
+            if ( rc != 0xff )
+                goto fail;
+        }
         printf("okay\n");
 
         printf("%-40s", "Testing vmovsh %xmm4,2(%eax){%k3}...");
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -244,7 +244,7 @@ int emul_test_get_fpu(
             break;
     case X86EMUL_FPU_opmask:
     case X86EMUL_FPU_zmm:
-        if ( cpu_has_avx512f )
+        if ( cpu_has_avx512f || cpu_has_avx10 )
             break;
     default:
         return X86EMUL_UNHANDLEABLE;


