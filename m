Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE+PF7nA12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:07:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF963CC681
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277775.1562899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqyY-0003mC-10; Thu, 09 Apr 2026 15:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277775.1562899; Thu, 09 Apr 2026 15:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqyX-0003jL-UJ; Thu, 09 Apr 2026 15:07:21 +0000
Received: by outflank-mailman (input) for mailman id 1277775;
 Thu, 09 Apr 2026 15:07:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqyW-0003j1-9b
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:07:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqyV-009ESt-LU
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:07:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c09d-2eae-0a2a0a5409dd-0a2a450be822-22
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:07:19 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c0a7-bca8-0a2a450b0019-d155802ccdea-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:07:19 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso10420395e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:07:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d5e969bbfsm5385153f8f.1.2026.04.09.08.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:07:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1775747239; x=1776352039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l87bP4aeMOmuqw6HhcNJLT6j8J427sYJ+y3dnbAKu68=;
        b=TCTebfC3HFk+p8KPuAJMp0XCe4MRfF7FoZrhZz9H+Gx3N4RoTiKB8qYvYgjdoQTj5J
         T7XJzJnpfL+E/cs8/rd9gDulc9synSJ+QKBkg8xAtlCrgBg7A/K69wumyQMcUZ+I8dND
         8P1HIz3Wt3hvsEUaCWwNLoXUDTX6cjE5gdN6G1wz5hBnriqnD9V2hmPXX9zT4PFl3Wmm
         WNL3vXGbOswjD/UbXLbZj7bfbBPueICN/qamSXg1MB79UOUdFOktuvoUlZXLoEh/iRp3
         i0mHLzkEFs3CeA2Rt3A8cSeGxjiiZa3DFZF+rAC4wlfSsBHu7Tdh/gTKDz9qYrXVYXl8
         a55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747239; x=1776352039;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l87bP4aeMOmuqw6HhcNJLT6j8J427sYJ+y3dnbAKu68=;
        b=eu6TbxlB0Qrrx++n6jvzXmiHagugegYGsmEcw06WHmh0FVuTjefvLS0hYlhkfrQ9Uo
         SOwMiPrzDDI43kXti2I0qTZCyYGdjxltVdemudHnqJ8qvNzfc6DYHNKqXWFr3R+6pUHJ
         BbW5AW/is92aXNgSKW7zpI5T13UiG+cZrH6PPmPtHvOOtzq1TluyKMUIxNVnpr390fjg
         hR8s1x/oc9TxOsM6Ha+Mm99StCSCBiK1G2IWyyUYu/V2tNpfCWKlLPBdEusPhibpceqp
         LysJUNA/DMDS2c8SLoiTWMUFyz2FLIJz+bAIeEkVRNuFkLBqtLk4iGChDJf4Y0z/h8k2
         qntA==
X-Gm-Message-State: AOJu0YyKqYN0ieaU12nVjz3Ol1E3xSbrhqpLB2r1jvEvEcN74kpzfx+N
	6+vre8/MhQff9mnGo2H+tgSyBdiIuN/ZpVKXt1UI8fgg9hW1gXv5DAPaH2zS95JspOdURzPxxjr
	SxisA8Q==
X-Gm-Gg: AeBDieu+sWp+IkHxlSv2EsUtWDtW+9RNZeTSHh0FqwMfrgcR9clafdNvvveq06R25cw
	pNL0WHtMZ6doFxgDx43ef2CHaAd9ivmAg595osShKVhReC4hUMcehnjAxheTofg3mUfcB4pB31F
	Kj8iFLqXbHesIGJmEDrgRzUMVScfbl/z7Po7hpGO1AK/IvRr53bVIvRN1iqPvQvofqFQIrE+w98
	F/6XP7wGtcV0rHzBo0Q0zNPU3EXC0/NOsQDovm7dTXSWA7gSWuOH9dCB0ppx1lmoV9IeJl9E/fI
	b1aKuc4W3eWJHBAxQE1PoncYoYJ4oUnRv+2VCDaLwd8cgRwsbiwzf/05fM4Fly+qr7Z14weLWfU
	hJJDBfaUhpgMUN+f0kcQasoaZ5gejaLRZYnXFdkvXfGjv+JkS1Ll+XH9Mfszb7fKyli3Fbh5LoF
	o7uxitoYSgozq7q+o8MDr+saROwwkcaDxVivsirl/nAaxPvVznBcTebQwEjz8QbOLwTzUcnl39u
	fpF95SPTwY5XJE=
X-Received: by 2002:a05:600c:c083:b0:488:ba5f:984f with SMTP id 5b1f17b1804b1-488ccf8cdacmr40497895e9.6.1775747238915;
        Thu, 09 Apr 2026 08:07:18 -0700 (PDT)
Message-ID: <4aa12415-2135-4e1c-b5a0-dcc4b01f71fc@suse.com>
Date: Thu, 9 Apr 2026 17:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 10/16] x86emul: support AVX10.2 partial copy insns
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
X-purgate-ID: tlsNG-42698a/1775747239-F5DC12A1-5140499A/0/0
X-purgate-type: clean
X-purgate-size: 6364
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: DEF963CC681
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend existing VMOV{Q,W} logic accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Series re-ordering adjustments.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -729,6 +729,13 @@ static const struct test avx10_2_all[] =
     INSN(ucomxsh,          f3, map5, 2e,    el, fp16, el),
 };
 
+static const struct test avx10_2_128[] = {
+    INSN(movd, f3,   0f, 7e, el,    d, el),
+    INSN(movd, 66,   0f, d6, el,    d, el),
+    INSN(movw, f3, map5, 6e, el, fp16, el),
+    INSN(movw, f3, map5, 7e, el, fp16, el),
+};
+
 static const struct test movrs_all[] = {
     INSN(movrsb, f2, map5, 6f, vl,    b, vl),
     INSN(movrsd, f3, map5, 6f, vl, d_nb, vl),
@@ -1165,4 +1172,5 @@ void evex_disp8_test(void *instr, struct
     }
 
     run(cpu_has_avx10_2, avx10_2, all);
+    run(cpu_has_avx10_2, avx10_2, 128);
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1782,7 +1782,7 @@ static const struct evex {
     { { 0x7b }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtusi2ss */
     { { 0x7b }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtusi2sd */
     { { 0x7e }, 2, T, W, pfx_66, Wn, L0 }, /* vmov{d,q} */
-    { { 0x7e }, 2, T, R, pfx_f3, W1, L0 }, /* vmovq */
+    { { 0x7e }, 2, T, R, pfx_f3, Wn, L0 }, /* vmov{d,q} */
     { { 0x7f }, 2, T, W, pfx_66, Wn, Ln }, /* vmovdqa{32,64} */
     { { 0x7f }, 2, T, W, pfx_f3, Wn, Ln }, /* vmovdqu{32,64} */
     { { 0x7f }, 2, T, W, pfx_f2, Wn, Ln }, /* vmovdqu{8,16} */
@@ -1799,7 +1799,7 @@ static const struct evex {
     { { 0xd3 }, 2, T, R, pfx_66, W1, Ln }, /* vpsrlq */
     { { 0xd4 }, 2, T, R, pfx_66, W1, Ln }, /* vpaddq */
     { { 0xd5 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmullw */
-    { { 0xd6 }, 2, T, W, pfx_66, W1, L0 }, /* vmovq */
+    { { 0xd6 }, 2, T, W, pfx_66, Wn, L0 }, /* vmov{d,q} */
     { { 0xd8 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusb */
     { { 0xd9 }, 2, T, R, pfx_66, WIG, Ln }, /* vpsubusw */
     { { 0xda }, 2, T, R, pfx_66, WIG, Ln }, /* vpminub */
@@ -2133,6 +2133,7 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
     { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovrs{d,q} */
     { { 0x6f }, 2, T, R, pfx_f2, Wn, Ln }, /* vmovrs{b,w} */
     { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
@@ -2153,6 +2154,7 @@ static const struct evex {
     { { 0x7d }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtw2ph */
     { { 0x7d }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtuwph */
     { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x7e }, 2, T, W, pfx_f3, W0, L0 }, /* vmovw */
 }, evex_map6[] = {
     { { 0x13 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2psx */
     { { 0x13 }, 2, T, R, pfx_no, W0, LIG }, /* vcvtsh2ss */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -293,7 +293,7 @@ static const struct twobyte_table {
     [0xd0] = { DstImplicit|SrcMem|ModRM, simd_other },
     [0xd1 ... 0xd3] = { DstImplicit|SrcMem|ModRM, simd_128, 4 },
     [0xd4 ... 0xd5] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
-    [0xd6] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, 3 },
+    [0xd6] = { DstMem|SrcImplicit|ModRM|Mov, simd_other, d8s_dq },
     [0xd7] = { DstReg|SrcImplicit|ModRM|Mov },
     [0xd8 ... 0xdf] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
     [0xe0] = { DstImplicit|SrcMem|ModRM, simd_packed_int, d8s_vl },
@@ -803,7 +803,7 @@ decode_twobyte(struct x86_emulate_state
         if ( s->vex.pfx == vex_f3 ) /* movq xmm/m64,xmm */
         {
     case X86EMUL_OPC_VEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
-    case X86EMUL_OPC_EVEX_F3(0, 0x7e): /* vmovq xmm/m64,xmm */
+    case X86EMUL_OPC_EVEX_F3(0, 0x7e): /* vmov{d,q} xmm/mem,xmm */
             s->desc = DstImplicit | SrcMem | TwoOp;
             s->simd_size = simd_other;
             /* Avoid the s->desc clobbering of TwoOp below. */
@@ -1416,7 +1416,7 @@ int x86emul_decode(struct x86_emulate_st
                 break;
 
             case 0x7e: /* vmovq xmm/m64,xmm needs special casing */
-                if ( disp8scale == 2 && s->evex.pfx == vex_f3 )
+                if ( disp8scale == 2 && s->evex.pfx == vex_f3 && s->evex.w )
                     disp8scale = 3;
                 break;
 
@@ -1525,13 +1525,13 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
-            case 0x6e: /* vmovw r/m16, xmm */
+            case 0x6e: /* vmovw r/x/m16, xmm */
                 d = (d & ~SrcMask) | SrcMem16;
                 /* fall through */
-            case 0x7e: /* vmovw xmm, r/m16 */
+            case 0x7e: /* vmovw xmm, r/x/m16 */
+                s->fp16 = true;
                 if ( s->evex.pfx == vex_66 )
-                    s->fp16 = true;
-                s->simd_size = simd_none;
+                    s->simd_size = simd_none;
                 break;
 
             case 0x78: case 0x79: /* vcvt{,t}ph2u{d,q}q, vcvt{,t}sh2usi */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -4938,13 +4938,17 @@ x86_emulate(
         op_bytes = 8;
         goto simd_0f_int;
 
-    case X86EMUL_OPC_EVEX_F3(0x0f, 0x7e): /* vmovq xmm/m64,xmm */
-    case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
-        generate_exception_if(evex.lr || !evex.w || evex.opmsk || evex.brs,
-                              X86_EXC_UD);
-        visa_check(f);
+    case X86EMUL_OPC_EVEX_F3(0x0f, 0x7e): /* vmov{d,q} xmm/mem,xmm */
+    case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmov{d,q} xmm,xmm/mem */
+    case X86EMUL_OPC_EVEX_F3(5, 0x6e): /* vmovw xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x7e): /* vmovw xmm,xmm/m16 */
+        generate_exception_if(evex.lr || evex.opmsk || evex.brs, X86_EXC_UD);
+        if ( evex.w )
+            visa_check(f);
+        else
+            vcpu_must_have(avx10, 2);
         d |= TwoOp;
-        op_bytes = 8;
+        op_bytes = 2 << (!state->fp16 + evex.w);
         goto simd_zmm;
 
 #endif /* !X86EMUL_NO_SIMD */


