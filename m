Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ0KOZHA12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:06:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A7B3CC654
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277762.1562890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqxw-0003BX-Jc; Thu, 09 Apr 2026 15:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277762.1562890; Thu, 09 Apr 2026 15:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqxw-00039S-Gl; Thu, 09 Apr 2026 15:06:44 +0000
Received: by outflank-mailman (input) for mailman id 1277762;
 Thu, 09 Apr 2026 15:06:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqxu-00039D-Rq
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:06:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqxu-001mos-7T
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:06:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c06f-bab6-0a2a0a5309dd-0a2a4506da36-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:06:42 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c082-0df0-0a2a45060019-d155802fe9c2-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:06:42 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so11352895e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:06:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5396293sm1691195e9.15.2026.04.09.08.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:06:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1775747202; x=1776352002; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qQvRunN9MSBUtmSdZnmf6AhTyCHgM+d4bEKRTJwMHYY=;
        b=GFjeBScp0tozZb2BDrHx1cmTiD0T8MQ2BaMtMElpjEfG9lTwrAENbazGglRqkj0YHE
         5qAklEXOPGo4XgmLcUvddwCuiF+mFVc3fNUHCT7RswPHn0DqDbnG8AGGi69yc8QqRjy6
         +YNgOLQNgVFsQMAI+RdpH2I2WFCEhFb0kSR3at8xfUys90Cag/p8SNVszYrnP8F0HsN8
         2FK3MJx5lEIjfYIsHb3GRp0yoiht9k9d9SpIfYbCbP7ZFud1ZvHKhJGMHyOmpnqM9UBS
         yTK8qf9qb6VqXLKI6+raBIYYDh2xIgBQiyoRKT90dFN9nlTyOk87Icohk3h6mlJ46SPk
         9bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747202; x=1776352002;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQvRunN9MSBUtmSdZnmf6AhTyCHgM+d4bEKRTJwMHYY=;
        b=l+F+cMwBDwK24s+Q6T9AwNjBtv4krU431XF6S3LBBIvfu3P22EFu4JIfIlBCB2sG/W
         OXtztUy0eS/lBXAWwPDxen3WhexiI7HVv0OWUM9c2MMnqX/+tgqepVbOqDbXybfuO/oW
         hQSFX2jYJOCylVBWqjGadUPXHygDPKo8M4Ys/NIn5gww2rQw1qNEp7jNYifNTSkPv/Tw
         St99RX/UGSiKWrAC+zLjemFQ4QsLqVmUQ8ggzYXaSsoKZflkNtpKVUH9lYEIwEbTQ0NU
         Zk6v5lL+VlNXcEjyBCUs2/pap6LKoiIZTT/4odx4xPputI/Ea0DGThvM47rsRkJVwku0
         UPjg==
X-Gm-Message-State: AOJu0Yy8mLF/6sg1Jlg8RvhX1hgiotMWNwjNRIa76YdBMOgRgMRZF9ha
	FnIikR3cmHQZ+ODoFAQb/aJgakmJ0zQCfElWmbO3UnsWe3Xi5ViANIHLdNHRC+Q4kGQhlIeY96p
	6QUNY6w==
X-Gm-Gg: AeBDietjSDcxlTrLeC4JudQvpFkLDBETAfSSGZub0iCBdUug6QvJI2CpeH8wstUuEyT
	WVTGvJpGnrV1wg8UK0w8zND7fPn/5QEPjPtyQDeLn1RFFx6H+iqKYCfGM92pQS87dXPggfhjESG
	/a74iL0k3iur0GdEAXG1ZT/RaG4uYmz3H5aIk1YcnvjN0Qlvd9XBNoyoURjgmKIxXL9goE14+lR
	EKGelz25wCafkgyr/xkOIt1zMoJ0f0ys6KfaptLjed3Xjd1swTnM0z2Rq3nyHY11bKBg3UpsgzD
	+btVAZm0f7W5w4086ySWhQgTrOPW3TruhwM8QRxjLlnyWUUcBEV28ZA6e3pOm2iIKqGEMhssPwx
	GFjZg9ddubI5a6vpsRVqBTINVJhPP097pEGZv++73kBs/DGlxPQTBt64emmaG6oaqs+unbAtAHC
	lx3CdSDtgmQTM7uKe67NLkR7K8vO0WEg1cG6QjALKbwrukTL0F58Us9pv3ao4GLwmXkRDKpU7c9
	2uXzreGEPHaTTM=
X-Received: by 2002:a05:600c:699a:b0:488:afb5:6a21 with SMTP id 5b1f17b1804b1-488afb57545mr248271585e9.15.1775747201566;
        Thu, 09 Apr 2026 08:06:41 -0700 (PDT)
Message-ID: <71f97a53-2acc-4c4f-811a-ffc9056cfe12@suse.com>
Date: Thu, 9 Apr 2026 17:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 09/16] x86emul: support AVX10.2 scalar compare insns
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
X-purgate-ID: tlsNG-16d1c6/1775747202-5E32F3D8-E46BD14F/0/0
X-purgate-type: clean
X-purgate-size: 7442
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
X-Rspamd-Queue-Id: 77A7B3CC654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simply clone code from their V{,U}COMIS{S,D,H} counterparts.

While there drop a redundant EVEX.W check from V{,U}COMISH handling.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Update encodings to latest spec version. Series re-ordering
    adjustments.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -81,6 +81,7 @@ enum esz {
     ESZ_w,
     ESZ_bw,
     ESZ_fp16,
+#define ESZ_bf16 ESZ_fp16
 };
 
 #ifndef __i386__
@@ -720,6 +721,14 @@ static const struct test vpclmulqdq_all[
     INSN(pclmulqdq, 66, 0f3a, 44, vl, q_nb, vl)
 };
 
+static const struct test avx10_2_all[] = {
+    INSN(comisbf16,        66, map5, 2f,    el, bf16, el),
+    INSN_SFP(comx,               0f, 2f),
+    INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
+    INSN_SFP(ucomx,              0f, 2e),
+    INSN(ucomxsh,          f3, map5, 2e,    el, fp16, el),
+};
+
 static const struct test movrs_all[] = {
     INSN(movrsb, f2, map5, 6f, vl,    b, vl),
     INSN(movrsd, f3, map5, 6f, vl, d_nb, vl),
@@ -1154,4 +1163,6 @@ void evex_disp8_test(void *instr, struct
         run(ctxt->addr_size == 64 && cpu_has_movrs, movrs, all);
         run(cpu_has_sm4, sm4, all);
     }
+
+    run(cpu_has_avx10_2, avx10_2, all);
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1682,8 +1682,12 @@ static const struct evex {
     { { 0x2d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtsd2si */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomiss */
     { { 0x2e }, 2, T, R, pfx_66, W1, LIG }, /* vucomisd */
+    { { 0x2e }, 2, T, R, pfx_f2, W1, LIG }, /* vucomxsd */
+    { { 0x2e }, 2, T, R, pfx_f3, W0, LIG }, /* vucomxss */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomiss */
     { { 0x2f }, 2, T, R, pfx_66, W1, LIG }, /* vcomisd */
+    { { 0x2f }, 2, T, R, pfx_f2, W1, LIG }, /* vcomxsd */
+    { { 0x2f }, 2, T, R, pfx_f3, W0, LIG }, /* vcomxss */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtps */
     { { 0x51 }, 2, T, R, pfx_66, W1, Ln }, /* vsqrtpd */
     { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtss */
@@ -2102,7 +2106,10 @@ static const struct evex {
     { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2si */
     { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2si */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomish */
+    { { 0x2e }, 2, T, R, pfx_f3, W0, LIG }, /* vucomxsh */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
+    { { 0x2f }, 2, T, R, pfx_66, W0, LIG }, /* vcomisbf16 */
+    { { 0x2f }, 2, T, R, pfx_f3, W0, LIG }, /* vcomxsh */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
     { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtsh */
     { { 0x58 }, 2, T, R, pfx_no, W0, Ln }, /* vaddph */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -215,6 +215,8 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx_vnni_int16      (cpu_policy.feat.avx_vnni_int16 && \
                                      xcr0_mask(6))
 #define cpu_has_avx10               (cpu_policy.feat.avx10 && xcr0_mask(0xe6))
+#define cpu_has_avx10_2             (cpu_policy.avx10.version >= 2 && \
+                                     xcr0_mask(0xe6))
 
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1515,9 +1515,8 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
-            case 0x2e: case 0x2f: /* v{,u}comish */
-                if ( !s->evex.pfx )
-                    s->fp16 = true;
+            case 0x2e: case 0x2f: /* v{,u}com{i,x}sh, vcomisbf16 */
+                s->fp16 = true;
                 s->simd_size = simd_none;
                 break;
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -318,7 +318,7 @@ struct x86_emulate_state {
     bool lock_prefix;
     bool not_64bit; /* Instruction not available in 64bit. */
     bool fpu_ctrl;  /* Instruction is an FPU control one. */
-    bool fp16;      /* Instruction has half-precision FP source operand. */
+    bool fp16;      /* Instruction has half-precision FP or BF16 source. */
     opcode_desc_t desc;
     union vex vex;
     union evex evex;
@@ -609,10 +609,10 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
 #define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
-#define vcpu_has_avx10()       (ctxt->cpuid->feat.avx10)
+#define vcpu_has_avx10(minor)  (ctxt->cpuid->avx10.version >= (minor))
 
-#define vcpu_must_have(feat) \
-    generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
+#define vcpu_must_have(feat, ...) \
+    generate_exception_if(!vcpu_has_##feat(__VA_ARGS__), X86_EXC_UD)
 
 #ifdef __XEN__
 /*
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3825,7 +3825,6 @@ x86_emulate(
     case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
     case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
         visa_check(_fp16);
-        generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2e): /* vucomis{s,d} xmm/mem,xmm */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2f): /* vcomis{s,d} xmm/mem,xmm */
@@ -3834,6 +3833,7 @@ x86_emulate(
                                evex.w != evex.pfx),
                               X86_EXC_UD);
         visa_check(f);
+    vcomi_evex:
         if ( !evex.brs )
             avx512_vlen_check(true);
         get_fpu(X86EMUL_FPU_zmm);
@@ -3842,6 +3842,17 @@ x86_emulate(
         op_bytes = 2 << (!state->fp16 + evex.w);
         goto vcomi;
 
+    CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2e): /* vucomxs{s,d} xmm/mem,xmm */
+    CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2f): /* vcomxs{s,d} xmm/mem,xmm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x2e):      /* vucomxsh xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX_66(5, 0x2f):      /* vcomisbf16 xmm/m16,xmm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x2f):      /* vcomxsh xmm/m16,xmm */
+        generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
+                               evex.w != (evex.pfx == vex_f2)),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        goto vcomi_evex;
+
 #endif
 
     case X86EMUL_OPC(0x0f, 0x30): /* wrmsr */
@@ -6831,7 +6842,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0xda): /* vsm4key4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0xda): /* vsm4rnds4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
-        vcpu_must_have(avx10);
+        vcpu_must_have(avx10, 1);
         vcpu_must_have(sm4);
         generate_exception_if(evex.w || evex.brs || evex.opmsk, X86_EXC_UD);
         avx512_vlen_check(false);
@@ -7905,7 +7916,7 @@ x86_emulate(
         fallthrough;
     case X86EMUL_OPC_EVEX_F3(5, 0x6f): /* vmovrs{d,q} mem,[xyz]mm{k} */
         generate_exception_if(ea.type != OP_MEM || evex.brs, X86_EXC_UD);
-        vcpu_must_have(avx10);
+        vcpu_must_have(avx10, 1);
         vcpu_must_have(movrs);
         avx512_vlen_check(false);
         op_bytes = 16 << evex.lr;


