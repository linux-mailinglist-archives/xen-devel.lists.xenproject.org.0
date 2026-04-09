Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKcBDKi/12kmSggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:03:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA63CC56B
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277689.1562828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAquB-0007yJ-F0; Thu, 09 Apr 2026 15:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277689.1562828; Thu, 09 Apr 2026 15:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAquB-0007va-B6; Thu, 09 Apr 2026 15:02:51 +0000
Received: by outflank-mailman (input) for mailman id 1277689;
 Thu, 09 Apr 2026 15:02:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAquA-0007vQ-Ge
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:02:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqu9-0028oj-OS
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:02:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7bf87-bab6-0a2a0a5309dd-0a2a4503ec52-48
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:02:49 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7bf99-02b3-0a2a45030019-d155dd2da5ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:02:49 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43cf5fbacc9so479526f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:02:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f1a99sm71968306f8f.32.2026.04.09.08.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:02:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1775746969; x=1776351769; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yi2mAG4aBxptsu+CTnyi/QS2RhPJI3HigfQx8QKH2PE=;
        b=GENXrqOA9xxBs2w71339U5A6OhDCO+qlBm6tTUgoJd27WcPIf/pe4XfIqyPN77wxmN
         GtgjLDr0zwzfycyiYoQuXM0pIbwL2dlaZSDRlwgJ0xgAMIKgk2Mka3EaSo6sYTqUm3Ws
         7BKUjbex2j6zyWI9lCPApb9zNk1pcn4lv9c7W8W8T/cW74uJ+INl3IoKtN/6qn6AURhp
         sNh8iOfgj1E+IYt040oR0dMrbphgXQbrwsYS8hOG/uBiskx/d04TKIAXpteiaDJkd/Dv
         EIKdbqkymKsIJ60f1uTGtO5Q6hmt6F5/fZYoUzKaMM2FOfL4s7gu6ZwYuXDQ8kKfXxf4
         zENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746969; x=1776351769;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi2mAG4aBxptsu+CTnyi/QS2RhPJI3HigfQx8QKH2PE=;
        b=QfRMTTw0aVqmhUs7fLqbtLTHM/cPagOk2Jbm3m3wWvRhMV/0lC1HobtZtiFAD3/WCJ
         YsVAJ5Dsko6cDzoFJyr00nCmhWls26ycOndqUC/OtEyTNL+jg57dlgmufB/NaQhYmVSv
         SK26DpedgmzsKMz6Q03MJGp7HBGy5As3VL9yEyhA+lhWjpFcYki/FjOqJGqgyNLDrIik
         qDK4sVCIrPkeLywtEiW8nO+smKL+hKZxxlldfotIHNS6J0KZ02Vgm9+McgtZX87kd3u/
         cAQft8jY0F2177TQWOWzi4gU6eL+XOxyUtulHVuGevT4g5iSDfYc3ltJOlEo3bTl4Q7c
         W0pQ==
X-Gm-Message-State: AOJu0YxEmPI/TkSNg2b+ZlfVBw5YogPQpQwTIZivIlqsTlcvPqV/DfKU
	IpUqPx61JfiJ9jJ6LrqryzDGpQZQ+2lpiGO8IbvfEicHZQ8gHtHRq29U5y34fzCMFMR+swgeAOi
	e5yf1Bg==
X-Gm-Gg: AeBDieser7BUnRRst8g2P0tc2r+B1qUjCz7yIY8U0zD5onLAvbW5DVOXTI30rux0YQo
	b0GDyULdBofoWsuHS+AEtvGS3aL6coG4/1F7bx/0qkgpG4tdG6datVFIztodEMrhMd7nK0nqpwA
	fxfRUCSkXP0gBiCM+ubQnhEVhXqGssROVMymCnhgcuxhLqamUAGtAA359bx+9+HOWVCmf3sl82j
	A5sSYZ08reT3uKxe6RTEHVY5B46YxxsQjCVBakUbCWihqrfby/KmXJQrg0W9U8/DOxUDUhUk0PQ
	/gzLTp/eIOWfMgEWhLIQhhPE6UhfjvAxh6J62Jt5ye04Z9EmrQoKEG2YNGYJSjSaEZHgLbS8CVh
	uUA4PrOMwfONrwNfEFHp1WSinZd8VZWug0B1d8nZPKsEcRLOdu3LiqPWqpG3qnhIDVNW0sZK9mQ
	P5MsyICSZ6hC3neYKaNVk4kh6AjYKpQVOEyUFoDFHrZ9eOiA0hU5KDc+QTiKC5rPcPeST6VSwU1
	j2Sx4sjyLmMuu8=
X-Received: by 2002:a5d:5f44:0:b0:43c:f926:1fa with SMTP id ffacd0b85a97d-43d594ad27fmr5386929f8f.0.1775746962048;
        Thu, 09 Apr 2026 08:02:42 -0700 (PDT)
Message-ID: <85e5d61e-3a9a-44bd-9c79-37762c6ee2e6@suse.com>
Date: Thu, 9 Apr 2026 17:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 02/16] x86emul: support AVX10 forms of SM4 insns
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
X-purgate-ID: tlsNG-33051d/1775746969-41B15C9A-99843D8C/0/0
X-purgate-type: clean
X-purgate-size: 3152
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
X-Rspamd-Queue-Id: AFFA63CC56B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simply clone the VEX-encoded handling to cover the EVEX forms.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Address v3 TODO. Move ahead in series, switching feature dependency to
    plain AVX10. Add call to avx512_vlen_check().
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -727,6 +727,11 @@ static const struct test movrs_all[] = {
     INSN(movrsw, f2, map5, 6f, vl,    w, vl),
 };
 
+static const struct test sm4_all[] = {
+    INSN(sm4key4,  f3, 0f38, da, vl, d_nb, vl),
+    INSN(sm4rnds4, f2, 0f38, da, vl, d_nb, vl),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1124,5 +1129,6 @@ void evex_disp8_test(void *instr, struct
     if ( cpu_has_avx10 )
     {
         run(ctxt->addr_size == 64 && cpu_has_movrs, movrs, all);
+        run(cpu_has_sm4, sm4, all);
     }
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2025,6 +2025,8 @@ static const struct evex {
     { { 0xcc }, 2, T, R, pfx_66, Wn, L2 }, /* vrsqrt28p{s,d} */
     { { 0xcd }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt28s{s,d} */
     { { 0xcf }, 2, T, R, pfx_66, W0, Ln }, /* vgf2p8mulb */
+    { { 0xda }, 2, T, R, pfx_f3, W0, Ln }, /* vsm4key4 */
+    { { 0xda }, 2, T, R, pfx_f2, W0, Ln }, /* vsm4rnds4 */
     { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -438,7 +438,7 @@ static const struct ext0f38_table {
     [0xd3] = { .simd_size = simd_other },
     [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xda] = { .simd_size = simd_other },
+    [0xda] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xe0 ... 0xef] = { .to_mem = 1 },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6819,6 +6819,15 @@ x86_emulate(
         op_bytes = 16 << vex.l;
         goto simd_0f_ymm;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xda): /* vsm4key4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0xda): /* vsm4rnds4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
+        vcpu_must_have(avx10);
+        vcpu_must_have(sm4);
+        generate_exception_if(evex.w || evex.brs || evex.opmsk, X86_EXC_UD);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdc):  /* vaesenc {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdd):  /* vaesenclast {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xde):  /* vaesdec {x,y}mm/mem,{x,y}mm,{x,y}mm */


