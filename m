Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLxYGou/12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:02:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E898A3CC53F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277683.1562819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqtj-0007Yr-6J; Thu, 09 Apr 2026 15:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277683.1562819; Thu, 09 Apr 2026 15:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqtj-0007WK-2h; Thu, 09 Apr 2026 15:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1277683;
 Thu, 09 Apr 2026 15:02:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqti-0007W9-4c
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:02:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqtg-001m1J-P6
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:02:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7bf6c-5cb7-0a2a0a5109dd-0a2a450accd0-18
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:02:20 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7bf77-ee98-0a2a450a0019-d155dd36c965-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:02:15 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so648125f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:02:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd18de6fsm25382815e9.25.2026.04.09.08.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:02:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1775746935; x=1776351735; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mm7WYaMM68h+Fp0IJpJcgFDx/R1XJIsbTelvVNOC/m4=;
        b=EdoNYSR2x7xCkMyQWO2QxuBrZIcDT4lFOr6KwaSgXtCE7WG3ihjuzFEgtInxqd9rgm
         WNOfqqUV6RIGvfq1sDQ56FtpFbmAPUZe2lb2+dS/nRAZ87gpFVWJJtDVBfieCp6PqNay
         slQyjFhpjSHSDq0URnzc63hGVY4Xr2tMZmu4mwtncadkTXegrqwRIEqn9TBDxljGRYbL
         W5NGmqgqwwsFubcsAInXqqqhvlIXWcd1TNWNSof0DVdnOT31Zh7c+0bR7SZX2UazxCP0
         yTWomAQVTHy/AyNI9tYMl6+l6wBkDWaOZHVQpskiNDtmmR8H/cdWGPGrFqI6N2DLohmn
         pSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746935; x=1776351735;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mm7WYaMM68h+Fp0IJpJcgFDx/R1XJIsbTelvVNOC/m4=;
        b=R0AynUUzNXFdM6MwS8bZ0YxyscuOVsGQautJoiptgaELIEg9I8xdcs2aSlLSzFxPBx
         ixXqX+5LyvH/ifbIjfFbToFoP9AHLabC/UeXewEsTIa5k5gK6QVn3fniJ8Xuv115qUBV
         ht1xWfhoe6mqhAGAj1zGHPib7jGDnYGvwrLVos46NPeswuQv0thq3uRRIFuwK/20bmVy
         RPJSe0IkqKmQnzz0Cw51Zy0Hmiwk0dAF7iEzVHoEud0vAA9aGkGvu4kdru7HdZjg2VO8
         3hmhpols8kv4zezcdlrou/oQU4uO3xSPBUMALEv9qK83ylR+9ivmfBSr1mewR6Uc7SWY
         HaQQ==
X-Gm-Message-State: AOJu0YxiPL5McJzQhMgkMw/RPLYSjOCggxUtUSH0ccEhHhAMZKt1TlTV
	pFKp7McugsYblzyacjB+95XVO/H4LoDKM24y9N3z9eV58qYJQT/lOi5Ox4w2bowEhWtSWQLaM40
	osj75CQ==
X-Gm-Gg: AeBDieuWLLcww7sVhYoUuvC2wNKW8+6QEsgvc5cGGZohAQyJK9Egd1UET2vCo0JrSFS
	gVzkj4GS+e91hz+mDFtf3mz86EfRWE2T9//amtj+KNz412+Xi90Euq5Y11SIsoD6YP4BA5QZF+G
	6UH1GdMTQqGUOczUZ2jNjbHMWN8hbNsvKK+PCWtTq+QZ38cxk50QPSz7XqxLnpAUTOFHOyesTmM
	/pfq7sytfhlDelA261o84Se+seVq6xfn2eVwT/VL6c40JXHlM4dD2Z2X+W/83FKV1gPtaq1nD7U
	5gFSGvF3Vc6w6iPsV0fUU64zSqY0Fe/91svd4FTQf+a5RmTZZQpQrgTXpLquFVXOPykSjczxBcs
	F72JposQl1cgHwsFu6st6OGaM4UKli+923dWRqAhHK4t5pb51dK7dC+g4DRTuG2bjADcq/qKsYQ
	BXdVCf574mNR8Pp8vj9kR8CzxCKezEWB5MQapAZSZvvhHisuyWLwo2kJ2dMRxu71BQlY+zbyL84
	7fzH46O0LvIFtw=
X-Received: by 2002:a05:600c:8b0a:b0:488:a2ac:a337 with SMTP id 5b1f17b1804b1-488ccffa903mr61621365e9.21.1775746934725;
        Thu, 09 Apr 2026 08:02:14 -0700 (PDT)
Message-ID: <5ed45e7e-6873-4651-9abd-9ece141ed79f@suse.com>
Date: Thu, 9 Apr 2026 17:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 01/16] x86emul: support SIMD MOVRS
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
X-purgate-ID: tlsNG-4011c0/1775746935-C56170B1-63DDE55B/0/0
X-purgate-type: clean
X-purgate-size: 4760
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: E898A3CC53F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As we ignore cachability aspects of insns, they're treated like simple
VMOVs.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr
---
v4: Correct main switch case labels to reference Map5. Switch to using
    fallthrough pseudo-keyword. Move ahead in series, switching feature
    dependency to plain AVX10.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -720,6 +720,13 @@ static const struct test vpclmulqdq_all[
     INSN(pclmulqdq, 66, 0f3a, 44, vl, q_nb, vl)
 };
 
+static const struct test movrs_all[] = {
+    INSN(movrsb, f2, map5, 6f, vl,    b, vl),
+    INSN(movrsd, f3, map5, 6f, vl, d_nb, vl),
+    INSN(movrsq, f3, map5, 6f, vl, q_nb, vl),
+    INSN(movrsw, f2, map5, 6f, vl,    w, vl),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1071,8 +1078,8 @@ void evex_disp8_test(void *instr, struct
     emulops.read = read;
     emulops.write = write;
 
-#define RUN(feat, vl) do { \
-    if ( cpu_has_##feat ) \
+#define run(cond, feat, vl) do { \
+    if ( cond ) \
     { \
         printf("%-40s", "Testing " #feat "/" #vl " disp8 handling..."); \
         test_group(feat ## _ ## vl, ARRAY_SIZE(feat ## _ ## vl), \
@@ -1081,6 +1088,8 @@ void evex_disp8_test(void *instr, struct
     } \
 } while ( false )
 
+#define RUN(feat, vl) run(cpu_has_ ## feat, feat, vl)
+
     RUN(avx512f, all);
     RUN(avx512f, 128);
     RUN(avx512f, no128);
@@ -1111,4 +1120,9 @@ void evex_disp8_test(void *instr, struct
         RUN(vaes, all);
         RUN(vpclmulqdq, all);
     }
+
+    if ( cpu_has_avx10 )
+    {
+        run(ctxt->addr_size == 64 && cpu_has_movrs, movrs, all);
+    }
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2124,6 +2124,8 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovrs{d,q} */
+    { { 0x6f }, 2, T, R, pfx_f2, Wn, Ln }, /* vmovrs{b,w} */
     { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
     { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2uqq */
     { { 0x78 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2usi */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -209,12 +209,14 @@ void wrpkru(unsigned int val);
                                      xcr0_mask(0xe6))
 #define cpu_has_cmpccxadd            cpu_policy.feat.cmpccxadd
 #define cpu_has_avx_ifma            (cpu_policy.feat.avx_ifma && xcr0_mask(6))
+#define cpu_has_movrs                cpu_policy.feat.movrs
 #define cpu_has_avx_vnni_int8       (cpu_policy.feat.avx_vnni_int8 && \
                                      xcr0_mask(6))
 #define cpu_has_avx_ne_convert      (cpu_policy.feat.avx_ne_convert && \
                                      xcr0_mask(6))
 #define cpu_has_avx_vnni_int16      (cpu_policy.feat.avx_vnni_int16 && \
                                      xcr0_mask(6))
+#define cpu_has_avx10               (cpu_policy.feat.avx10 && xcr0_mask(0xe6))
 
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -622,6 +622,8 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 #define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
+#define vcpu_has_avx10()       (ctxt->cpuid->feat.avx10)
+
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7880,6 +7880,17 @@ x86_emulate(
         op_bytes = 8 << evex.lr;
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_F2(5, 0x6f): /* vmovrs{b,w} mem,[xyz]mm{k} */
+        elem_bytes = 1 << evex.w;
+        fallthrough;
+    case X86EMUL_OPC_EVEX_F3(5, 0x6f): /* vmovrs{d,q} mem,[xyz]mm{k} */
+        generate_exception_if(ea.type != OP_MEM || evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10);
+        vcpu_must_have(movrs);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_66(5, 0x78): /* vcvttph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x79): /* vcvtph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7a): /* vcvttph2qq xmm/mem,[xyz]mm{k} */


