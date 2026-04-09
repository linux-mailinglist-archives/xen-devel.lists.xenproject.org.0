Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAZDCx3B12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:09:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9013CC6D7
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277798.1562917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr0F-0004rd-IT; Thu, 09 Apr 2026 15:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277798.1562917; Thu, 09 Apr 2026 15:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr0F-0004pS-F6; Thu, 09 Apr 2026 15:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1277798;
 Thu, 09 Apr 2026 15:09:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAr0D-0004pM-Rl
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:09:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAr0D-002AGJ-47
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:09:05 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c103-2eae-0a2a0a5409dd-0a2a450acabc-24
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:09:04 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c110-ee98-0a2a450a0019-d155802cacfd-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:09:04 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso8150265e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:09:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d531ff0dsm3240785e9.6.2026.04.09.08.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:09:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1775747344; x=1776352144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o+nd0iZcHqkBTLveW2Hm+V7Wyz5pQcbOPXbkBBL3fLQ=;
        b=Wcgtf6hzLqzmNhM2cNhV6b2KIu9WRKPWbHubtFZlKf364lpmRAR0ypkC9s0cQnkzAw
         btLIGSUBoEAM6eiKFLUjOQ4zyMy2Stx5scuQLdmWX4zLrbg+izB9Dl4A3igq1eNdktdP
         ZP7Z79i2o8wvyY5TotAP7qhdyS8BLzQkNgyoEH9k/iyA1VlNKgN+pu+D7CVoNJ7O4z0u
         7c7ypItzNhG9DVJCjWo/yjdQYfmqzhOsnHVTA+Tc69mCF6uX8mdCkcvSC4RQSLkKXUYS
         WBthB65klk2MIxZRexvi83OjZT+5Nh50av4p6rCOHqZ282ECn0T97d9PMEA5/8Qrp8lT
         o2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747344; x=1776352144;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+nd0iZcHqkBTLveW2Hm+V7Wyz5pQcbOPXbkBBL3fLQ=;
        b=Sg3sOYUHW8I3oed51IJC2IlkWeq1g8OhkJMPUV92KSEzWXObNr+E9vLlmw955rbaR1
         yNVOT1xiZoVvqH3gn3VSjraHesItudATqm0QjU4LcitUCdDS6JCXbZ586oouxSVstqgo
         q/9sVRVfOswHEmOIUhw26UWDj9ep4vpP1u3Jv72wCkxtvYA6SCfHKSl4DzGRWU/EHjld
         /DlYNA+jUQPg+PILJ69n8MmQA1iYBEHiRlM9nZNogg5Bx4mImzcSFOf76Co+QLHB+urR
         Ec6QVZwCk4D/M+Kz7pt8Ks1kMr3DFUYaCHZCYKn1ZDQVSTKBkITTO6nKLJn72BVGIZF+
         HC6A==
X-Gm-Message-State: AOJu0YyEETKP4VSFhjFBNNornSP7FFl0WuhbfkDsvHABQcvljztKtv5t
	TmVe8y13fX6JBy+UIJzzlIVtxfNkS8fbelL8PTfYQ7ChxUtoy/i9qVQddV7vfiII9WomGi9x5bB
	lKuL68A==
X-Gm-Gg: AeBDieve4J9LZ3SPymK9ERFDH2FEeyg+QvGjU/C27+JBatc01CcrUKqclPX/dEHBZN2
	tP2Eflx3ELRJ6LFzKYucoUvAglZqmVCqoo9s8JnLYpbb9gPnW5wPWG0SGgTW+J90W2UVg8IM9Wg
	lx18QEXDUl0y3BwXcaI8iVbX+cuNJdxJGl0N4Lf+aplgEnyuI5R3AddPkJE4HlY2jksNjuO4BAK
	ok4QLeBaMi35bdxMO3lL7ZMg0UTG0z7/iYvij7LG3J3/crECp3sRyyXc+EZfRzmLKfYYgmvAYe5
	kzLwEpXenFd/kztn4e3HfZbf6hVM7/mMORM25du33VkY7ppAHLy3hVRdVzpg/f7sXniTYiCGU++
	bvM5p9WCPZu5NFUpCvIB3wIqE+esqmM0UHdra4bpXwxa2YrbKJ+o6JoAcZHtxqkSDrvEX/faE+V
	/zVZF94OlSC5Hwg23TfCkNjeI0CLGFz/fcGWXaNAb9wX2oRTzGcEBvg1tDushwo1iQmrZQNRp3b
	y2T26cQVzMPPNA=
X-Received: by 2002:a05:600c:8012:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-4889974a416mr360415325e9.11.1775747344297;
        Thu, 09 Apr 2026 08:09:04 -0700 (PDT)
Message-ID: <69eeb7f1-b04e-4c61-90ef-a9e841e6758d@suse.com>
Date: Thu, 9 Apr 2026 17:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 12/16] x86emul: support AVX10.2 minmax insns
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
X-purgate-ID: tlsNG-4011c0/1775747344-C4E1B0B1-59FCFDF7/0/0
X-purgate-type: clean
X-purgate-size: 4819
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Queue-Id: 8E9013CC6D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While they use new major opcodes, they are still pretty similar to
various existing insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Update to spec version 3. Switch to using fallthrough pseudo-
    keyword.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -726,6 +726,11 @@ static const struct test avx10_2_all[] =
     INSN_SFP(comx,               0f, 2f),
     INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
     INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
+    INSN(minmax,           66, 0f3a, 52,    vl,   sd, vl),
+    INSN(minmax,           66, 0f3a, 53,    el,   sd, el),
+    INSN(minmaxbf16,       f2, 0f3a, 52,    vl, bf16, vl),
+    INSN(minmaxph,           , 0f3a, 52,    vl, fp16, vl),
+    INSN(minmaxsh,           , 0f3a, 53,    el, fp16, el),
     INSN(mpsadbw,          f3, 0f3a, 42,    vl, d_nb, vl),
     INSN(pdpbssd,          f2, 0f38, 50,    vl,    d, vl),
     INSN(pdpbssds,         f2, 0f38, 51,    vl,    d, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2093,6 +2093,11 @@ static const struct evex {
     { { 0x44 }, 3, T, R, pfx_66, WIG, Ln }, /* vpclmulqdq */
     { { 0x50 }, 3, T, R, pfx_66, Wn, Ln }, /* vrangep{s,d} */
     { { 0x51 }, 3, T, R, pfx_66, Wn, LIG }, /* vranges{s,d} */
+    { { 0x52 }, 3, T, R, pfx_no, W0, Ln }, /* vminmaxph */
+    { { 0x52 }, 3, T, R, pfx_66, Wn, Ln }, /* vminmaxp{s,d} */
+    { { 0x52 }, 3, T, R, pfx_f2, W0, Ln }, /* vminmaxbf16 */
+    { { 0x53 }, 3, T, R, pfx_no, W0, LIG }, /* vminmaxsh */
+    { { 0x53 }, 3, T, R, pfx_66, Wn, LIG }, /* vminmaxs{s,d} */
     { { 0x54 }, 3, T, R, pfx_66, Wn, Ln }, /* vfixupimmp{s,d} */
     { { 0x55 }, 3, T, R, pfx_66, Wn, LIG }, /* vfixumpimms{s,d} */
     { { 0x56 }, 3, T, R, pfx_no, W0, Ln }, /* vreduceph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -500,6 +500,8 @@ static const struct ext0f3a_table {
     [0x4c] = { .simd_size = simd_packed_int, .four_op = 1 },
     [0x50] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x51] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x52] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x53] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x54] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x55] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x56] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
@@ -1468,6 +1470,7 @@ int x86emul_decode(struct x86_emulate_st
                 case 0x0a: /* vrndscalesh */
                 case 0x26: /* vfpclassph */
                 case 0x27: /* vfpclasssh */
+                case 0x53: /* vminmaxsh */
                 case 0x56: /* vgetmantph */
                 case 0x57: /* vgetmantsh */
                 case 0x66: /* vreduceph */
@@ -1476,6 +1479,11 @@ int x86emul_decode(struct x86_emulate_st
                         s->fp16 = true;
                     break;
 
+                case 0x52: /* vminmax{ph,bf16} */
+                    if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
+                        s->fp16 = true;
+                    break;
+
                 case 0xc2: /* vpcmp{p,s}h */
                     if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
                         s->fp16 = true;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7697,6 +7697,21 @@ x86_emulate(
         generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_int_imm8;
 
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x52): /* vminmaxbf16 $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+        op_bytes = 16 << evex.lr;
+        fallthrough;
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x52): /* vminmaxph $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x53): /* vminmaxsh $imm,xmm/m16,xmm,xmm,xmm{k} */
+        generate_exception_if(vex.w, X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x52): /* vminmaxp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x53): /* vminmaxs{s,d} $imm8,xmm/mem,xmm,xmm{k} */
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(b & 1);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x5c): /* vfmaddsubps {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
                                            /* vfmaddsubps {x,y}mm/mem,{x,y}mm,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x5d): /* vfmaddsubpd {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */


