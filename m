Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGS8AnrC12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:15:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92D3CC7A8
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277818.1562926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr5c-0006hp-8f; Thu, 09 Apr 2026 15:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277818.1562926; Thu, 09 Apr 2026 15:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr5c-0006en-5i; Thu, 09 Apr 2026 15:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1277818;
 Thu, 09 Apr 2026 15:14:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAr5a-0006eb-KZ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:14:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAr5Z-00EDdQ-Sr
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:14:37 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c25d-2eae-0a2a0a5409dd-0a2a450aa226-2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:14:37 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c25d-ee98-0a2a450a0019-d155dd2ac9c8-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:14:37 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so659729f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:14:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e5890sm66464401f8f.31.2026.04.09.08.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:14:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1775747677; x=1776352477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NyvxFy1FVEMEfF6ukdfyjEF2EFVyAu8XJiCECeklWh4=;
        b=Qh9udhsXhRQc2AHsZXl5zBCHEWWXfFx1Y7+BB1FGePWl1OYGjyfWo+uxbVRCCfoQKo
         ao2Q/R8g2Lh7+q2+0OjgDwfyeKjvj5qP96N0HvfKMem6MyD/m/MOgzifAZN8+iHWHmkG
         HR7lF9FyhGTy8hK1bfybT8xAeE3WCYTOClWqGVCpA7Qtm0JvuQ+kW+GO0HpNAw3/CvBI
         MIyTgMm5PHDXYGjQzfulbX9kGtSHwaCdvqaSTUP31/HPKWykBsoutHY61xje1xu8gypV
         zpB/hgScXdQ1RMRAiDDVBciPJTV0Ai2SLhRh7oJJQgp8s7DbSkV0ZE5NKlFlUxmJ8W6y
         Kaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747677; x=1776352477;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyvxFy1FVEMEfF6ukdfyjEF2EFVyAu8XJiCECeklWh4=;
        b=dVAciSFCteze1BbWB/j/ocyG285pS/D+nYZQLds+quwlM3JE4GxOMstpuj2uXbYuYW
         ay3hO6YELClFRLwjo2WRwG8gtEMx2m7hpJPDGO7FMnkEEMDbhtw4tMfu5yGUWE5qULcr
         JZQKCluxt3in9XKYTeKdHRHXqvPBuir28vmjOBeVlNVJL76hdUJmsLdEWvB1mJa866kf
         b6ONjysWaoclXsRdl1CTbDBBBAcrxQTTp+r5BaY77RkBNMMhpQFGzkcn9drRw15rkHXi
         s3TEZdcCALiXwI7M1kKgu2uG+TkWojMQZH397W5yq8bQtEE5EXdxWKzxMRPmMNf7mana
         k/Zg==
X-Gm-Message-State: AOJu0Yz4gWBpMg7FMNn0mibBAWRCTJjTLYAyFyv+eVC0jCvPsGiEOxLB
	ozRmI8/mQbUxoU7+8KU1soLcWK3MQTxfi5iZTOEmoZpEGyyJi+0cajg8629Tuerp1ybW7C4/M9g
	28gg80Q==
X-Gm-Gg: AeBDiev1qplXmC3dUfzDNfYA2iLqbUvkjpwgwJGLK/NwcUlWeKwRu5d17xQ9enSVbcG
	FNdZGJ+duigBkyKen3PYhv649mceoRP4m59sgEVonnkrUAlUnoIGY/t0lUyxYU55yEyn4IE3s85
	+v6p9Zj4MMNEedrVwKbC8Tw2RhIzd98tQrIbFETyyVedrdwsRFIE/1nHwTSc+ngh1G3KCqZDa2y
	rCOECr32BxFVXFMIlpgYznVYO1/N3KMMy4/5aqwqhTqB7yYKam8ia0M9Uq/Ex1aoqLIarUGS88X
	azk9AiBSTUEqrgPDoVquJ3IOaWAKVW1sHvGll10yTMqqIp5Mog/WVaH6fE+mVit28LaamZOnCtf
	XpUAIDUMHgX/VuM8y/G3Kao7GetGdTvj3afMVCfvnTDMrW8o4Ivrpg6ApP2y/XV6dnoUmzKfqVV
	Cj961Iz6OjFt2FQ3vTqexstFoZQHqmwplEV1tI0wlHbN/MXEawBFOkMBft46vp4HSuV1fQleHlK
	S6Ewgw5QZolx4w=
X-Received: by 2002:a05:6000:2887:b0:43d:29a:e42a with SMTP id ffacd0b85a97d-43d5a18be6amr5447595f8f.29.1775747676961;
        Thu, 09 Apr 2026 08:14:36 -0700 (PDT)
Message-ID: <a9f8e2f7-6879-4b9b-aac3-f64c8987d350@suse.com>
Date: Thu, 9 Apr 2026 17:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 13/16] x86emul: support AVX10.2 BFloat16 insns
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
X-purgate-ID: tlsNG-4011c0/1775747677-BEF4B0B1-D7547AAC/0/0
X-purgate-type: clean
X-purgate-size: 16443
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: EE92D3CC7A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These are all very similar to various existing insns. VGETEXPPBF16, not
living in the expected place, benefits from the respective
twobyte_table[] entry already having Mov (aka TwoOp).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Update to spec version 3. Switch to using fallthrough pseudo-
    keyword.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -722,15 +722,36 @@ static const struct test vpclmulqdq_all[
 };
 
 static const struct test avx10_2_all[] = {
+    INSN(addbf16,          66, map5, 58,    vl, bf16, vl),
+    INSN(cmpbf16,          f2, 0f3a, c2,    vl, bf16, vl),
     INSN(comisbf16,        66, map5, 2f,    el, bf16, el),
     INSN_SFP(comx,               0f, 2f),
     INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
+    INSN(divbf16,          66, map5, 5e,    vl, bf16, vl),
     INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
+    INSN(fmadd132bf16,       , map6, 98,    vl, bf16, vl),
+    INSN(fmadd213bf16,       , map6, a8,    vl, bf16, vl),
+    INSN(fmadd231bf16,       , map6, b8,    vl, bf16, vl),
+    INSN(fmsub132bf16,       , map6, 9a,    vl, bf16, vl),
+    INSN(fmsub213bf16,       , map6, aa,    vl, bf16, vl),
+    INSN(fmsub231bf16,       , map6, ba,    vl, bf16, vl),
+    INSN(fnmadd132bf16,      , map6, 9c,    vl, bf16, vl),
+    INSN(fnmadd213bf16,      , map6, ac,    vl, bf16, vl),
+    INSN(fnmadd231bf16,      , map6, bc,    vl, bf16, vl),
+    INSN(fnmsub132bf16,      , map6, 9e,    vl, bf16, vl),
+    INSN(fnmsub213bf16,      , map6, ae,    vl, bf16, vl),
+    INSN(fnmsub231bf16,      , map6, be,    vl, bf16, vl),
+    INSN(fpclassbf16,      f2, 0f3a, 66,    vl, bf16, vl),
+    INSN(getexpbf16,         , map6, 42,    vl, bf16, vl),
+    INSN(getmantbf16,      f2, 0f3a, 26,    vl, bf16, vl),
+    INSN(maxbf16,          66, map5, 5f,    vl, bf16, vl),
+    INSN(minbf16,          66, map5, 5d,    vl, bf16, vl),
     INSN(minmax,           66, 0f3a, 52,    vl,   sd, vl),
     INSN(minmax,           66, 0f3a, 53,    el,   sd, el),
     INSN(minmaxbf16,       f2, 0f3a, 52,    vl, bf16, vl),
     INSN(minmaxph,           , 0f3a, 52,    vl, fp16, vl),
     INSN(minmaxsh,           , 0f3a, 53,    el, fp16, el),
+    INSN(mulbf16,          66, map5, 59,    vl, bf16, vl),
     INSN(mpsadbw,          f3, 0f3a, 42,    vl, d_nb, vl),
     INSN(pdpbssd,          f2, 0f38, 50,    vl,    d, vl),
     INSN(pdpbssds,         f2, 0f38, 51,    vl,    d, vl),
@@ -744,6 +765,13 @@ static const struct test avx10_2_all[] =
     INSN(pdpwusds,         66, 0f38, d3,    vl,    d, vl),
     INSN(pdpwuud,            , 0f38, d2,    vl,    d, vl),
     INSN(pdpwuuds,           , 0f38, d3,    vl,    d, vl),
+    INSN(rcpph,              , map6, 4c,    vl, bf16, vl),
+    INSN(reducebf16,       f2, 0f3a, 56,    vl, bf16, vl),
+    INSN(rndscalebf16,     f2, 0f3a, 08,    vl, bf16, vl),
+    INSN(rsqrtph,            , map6, 4e,    vl, bf16, vl),
+    INSN(scalefbf16,         , map6, 2c,    vl, bf16, vl),
+    INSN(sqrtbf16,         66, map5, 51,    vl, bf16, vl),
+    INSN(subbf16,          66, map5, 5c,    vl, bf16, vl),
     INSN_SFP(ucomx,              0f, 2e),
     INSN(ucomxsh,          f3, map5, 2e,    el, fp16, el),
 };
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2056,6 +2056,7 @@ static const struct evex {
     { { 0x05 }, 3, T, R, pfx_66, W1, Ln }, /* vpermilpd */
     { { 0x08 }, 3, T, R, pfx_no, W0, Ln }, /* vrndscaleph */
     { { 0x08 }, 3, T, R, pfx_66, W0, Ln }, /* vrndscaleps */
+    { { 0x08 }, 3, T, R, pfx_f2, W0, Ln }, /* vrndscalebf16 */
     { { 0x09 }, 3, T, R, pfx_66, W1, Ln }, /* vrndscalepd */
     { { 0x0a }, 3, T, R, pfx_no, W0, LIG }, /* vrndscalesh */
     { { 0x0a }, 3, T, R, pfx_66, W0, LIG }, /* vrndscaless */
@@ -2079,6 +2080,7 @@ static const struct evex {
     { { 0x25 }, 3, T, R, pfx_66, Wn, Ln }, /* vpternlog{d,q} */
     { { 0x26 }, 3, T, R, pfx_no, W0, Ln }, /* vgetmantph */
     { { 0x26 }, 3, T, R, pfx_66, Wn, Ln }, /* vgetmantp{s,d} */
+    { { 0x26 }, 3, T, R, pfx_f2, W0, Ln }, /* vgetmantbf16 */
     { { 0x27 }, 3, T, R, pfx_no, W0, LIG }, /* vgetmantsh */
     { { 0x27 }, 3, T, R, pfx_66, Wn, LIG }, /* vgetmants{s,d} */
     { { 0x38 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vinserti{32x4,64x2} */
@@ -2102,10 +2104,12 @@ static const struct evex {
     { { 0x55 }, 3, T, R, pfx_66, Wn, LIG }, /* vfixumpimms{s,d} */
     { { 0x56 }, 3, T, R, pfx_no, W0, Ln }, /* vreduceph */
     { { 0x56 }, 3, T, R, pfx_66, Wn, Ln }, /* vreducep{s,d} */
+    { { 0x56 }, 3, T, R, pfx_f2, W0, Ln }, /* vreducebf16 */
     { { 0x57 }, 3, T, R, pfx_no, W0, LIG }, /* vreducesh */
     { { 0x57 }, 3, T, R, pfx_66, Wn, LIG }, /* vreduces{s,d} */
     { { 0x66 }, 3, T, R, pfx_no, W0, Ln }, /* vfpclassph */
     { { 0x66 }, 3, T, R, pfx_66, Wn, Ln }, /* vfpclassp{s,d} */
+    { { 0x66 }, 3, T, R, pfx_f2, W0, Ln }, /* vfpclassbf16 */
     { { 0x67 }, 3, T, R, pfx_no, W0, LIG }, /* vfpclasssh */
     { { 0x67 }, 3, T, R, pfx_66, Wn, LIG }, /* vfpclasss{s,d} */
     { { 0x70 }, 3, T, R, pfx_66, W1, Ln }, /* vshldw */
@@ -2114,6 +2118,7 @@ static const struct evex {
     { { 0x73 }, 3, T, R, pfx_66, Wn, Ln }, /* vshrd{d,q} */
     { { 0xc2 }, 3, T, R, pfx_no, W0, Ln }, /* vcmpph */
     { { 0xc2 }, 3, T, R, pfx_f3, W0, LIG }, /* vcmpsh */
+    { { 0xc2 }, 3, T, R, pfx_f2, W0, Ln }, /* vcmpbf16 */
     { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
 }, evex_map5[] = {
@@ -2130,10 +2135,13 @@ static const struct evex {
     { { 0x2f }, 2, T, R, pfx_66, W0, LIG }, /* vcomisbf16 */
     { { 0x2f }, 2, T, R, pfx_f3, W0, LIG }, /* vcomxsh */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
+    { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vsqrtbf16 */
     { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtsh */
     { { 0x58 }, 2, T, R, pfx_no, W0, Ln }, /* vaddph */
+    { { 0x58 }, 2, T, R, pfx_66, W0, Ln }, /* vaddbf16 */
     { { 0x58 }, 2, T, R, pfx_f3, W0, LIG }, /* vaddsh */
     { { 0x59 }, 2, T, R, pfx_no, W0, Ln }, /* vmulph */
+    { { 0x59 }, 2, T, R, pfx_66, W0, Ln }, /* vmulbf16 */
     { { 0x59 }, 2, T, R, pfx_f3, W0, LIG }, /* vmulsh */
     { { 0x5a }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2pd */
     { { 0x5a }, 2, T, R, pfx_66, W1, Ln }, /* vcvtpd2ph */
@@ -2144,12 +2152,16 @@ static const struct evex {
     { { 0x5b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2dq */
     { { 0x5b }, 2, T, R, pfx_f3, W0, Ln }, /* vcvttph2dq */
     { { 0x5c }, 2, T, R, pfx_no, W0, Ln }, /* vsubph */
+    { { 0x5c }, 2, T, R, pfx_66, W0, Ln }, /* vsubbf16 */
     { { 0x5c }, 2, T, R, pfx_f3, W0, LIG }, /* vsubsh */
     { { 0x5d }, 2, T, R, pfx_no, W0, Ln }, /* vminph */
+    { { 0x5d }, 2, T, R, pfx_66, W0, Ln }, /* vminbf16 */
     { { 0x5d }, 2, T, R, pfx_f3, W0, LIG }, /* vminsh */
     { { 0x5e }, 2, T, R, pfx_no, W0, Ln }, /* vdivph */
+    { { 0x5e }, 2, T, R, pfx_66, W0, Ln }, /* vdivbf16 */
     { { 0x5e }, 2, T, R, pfx_f3, W0, LIG }, /* vdivsh */
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
+    { { 0x5f }, 2, T, R, pfx_66, W0, Ln }, /* vmaxbf16 */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
@@ -2177,12 +2189,16 @@ static const struct evex {
 }, evex_map6[] = {
     { { 0x13 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2psx */
     { { 0x13 }, 2, T, R, pfx_no, W0, LIG }, /* vcvtsh2ss */
+    { { 0x2c }, 2, T, R, pfx_no, W0, Ln }, /* vscalefbf16 */
     { { 0x2c }, 2, T, R, pfx_66, W0, Ln }, /* vscalefph */
     { { 0x2d }, 2, T, R, pfx_66, W0, LIG }, /* vscalefsh */
+    { { 0x42 }, 2, T, R, pfx_no, W0, Ln }, /* vgetexpbf16 */
     { { 0x42 }, 2, T, R, pfx_66, W0, Ln }, /* vgetexpph */
     { { 0x43 }, 2, T, R, pfx_66, W0, LIG }, /* vgetexpsh */
+    { { 0x4c }, 2, T, R, pfx_no, W0, Ln }, /* vrcpbf16 */
     { { 0x4c }, 2, T, R, pfx_66, W0, Ln }, /* vrcpph */
     { { 0x4d }, 2, T, R, pfx_66, W0, LIG }, /* vrcpsh */
+    { { 0x4e }, 2, T, R, pfx_no, W0, Ln }, /* vrsqrtbf16 */
     { { 0x4e }, 2, T, R, pfx_66, W0, Ln }, /* vrsqrtph */
     { { 0x4f }, 2, T, R, pfx_66, W0, LIG }, /* vrsqrtsh */
     { { 0x56 }, 2, T, R, pfx_f3, W0, Ln }, /* vfmaddcph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1466,31 +1466,34 @@ int x86emul_decode(struct x86_emulate_st
             {
                 switch ( b )
                 {
-                case 0x08: /* vrndscaleph */
+                case 0x08: /* vrndscale{ph,bf16} */
+                case 0x26: /* vfpclass{ph,bf16} */
+                case 0x52: /* vminmax{ph,bf16} */
+                case 0x56: /* vgetmant{ph,bf16} */
+                case 0x66: /* vreduce{ph,bf16} */
+                    if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
+                        s->fp16 = true;
+                    break;
+
                 case 0x0a: /* vrndscalesh */
-                case 0x26: /* vfpclassph */
                 case 0x27: /* vfpclasssh */
                 case 0x53: /* vminmaxsh */
-                case 0x56: /* vgetmantph */
                 case 0x57: /* vgetmantsh */
-                case 0x66: /* vreduceph */
                 case 0x67: /* vreducesh */
                     if ( !s->evex.pfx )
                         s->fp16 = true;
                     break;
 
-                case 0x52: /* vminmax{ph,bf16} */
-                    if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
-                        s->fp16 = true;
-                    break;
-
-                case 0xc2: /* vpcmp{p,s}h */
-                    if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                case 0xc2: /* vpcmp{p,s}h, vcmpbf16 */
+                    if ( s->evex.pfx != vex_66 )
                         s->fp16 = true;
                     break;
                 }
 
-                disp8scale = decode_disp8scale(ext0f3a_table[b].d8s, s);
+                if ( s->fp16 && s->evex.pfx == vex_f2 && !s->evex.brs )
+                    disp8scale = 4 + s->evex.lr;
+                else
+                    disp8scale = decode_disp8scale(ext0f3a_table[b].d8s, s);
             }
             break;
 
@@ -1498,7 +1501,7 @@ int x86emul_decode(struct x86_emulate_st
             switch ( b )
             {
             default:
-                if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                if ( s->evex.pfx != vex_f2 )
                     s->fp16 = true;
                 break;
 
@@ -1528,6 +1531,11 @@ int x86emul_decode(struct x86_emulate_st
                 s->simd_size = simd_none;
                 break;
 
+            case 0x5a: /* vcvt{p,s}d2{p,s}h, vcvt{p,s}h2{p,s}d */
+                if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                    s->fp16 = true;
+                break;
+
             case 0x5b: /* vcvt{d,q}q2ph, vcvt{,t}ph2dq */
                 if ( s->evex.pfx && s->evex.pfx != vex_f2 )
                     s->fp16 = true;
@@ -1580,6 +1588,14 @@ int x86emul_decode(struct x86_emulate_st
                 disp8scale = 1;
                 break;
 
+            case 0x42: /* vgetexpbf16 needs special casing */
+                if ( s->evex.pfx == vex_66 )
+                {
+                    s->simd_size = simd_packed_fp;
+                    disp8scale = s->evex.brs ? 1 : 4 + s->evex.lr;
+                }
+                break;
+
             case 0x5a: /* vcvtph2pd needs special casing */
                 if ( !s->evex.pfx && !s->evex.brs )
                     disp8scale -= 2;
@@ -1612,7 +1628,7 @@ int x86emul_decode(struct x86_emulate_st
             switch ( b )
             {
             default:
-                if ( s->evex.pfx == vex_66 )
+                if ( !(s->evex.pfx & VEX_PREFIX_SCALAR_MASK) )
                     s->fp16 = true;
                 break;
 
@@ -1934,6 +1950,13 @@ int x86emul_decode(struct x86_emulate_st
             s->op_bytes = 4 >> s->fp16;
             break;
         case vex_f2:
+            if ( s->fp16 )
+            {
+                ASSERT(evex_encoded());
+                generate_exception_if(s->evex.w, X86_EXC_UD);
+                s->op_bytes = 0;
+                break;
+            }
             generate_exception_if(evex_encoded() && !s->evex.w, X86_EXC_UD);
             s->op_bytes = 8;
             break;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7301,6 +7301,20 @@ x86_emulate(
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x66): /* vfpclassbf16 $imm8,[xyz]mm/mem,k{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0xc2): /* vcmpbf16 $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
+        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x08): /* vrndscalebf16 $imm8,[xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x26): /* vgetmantbf16 $imm8,[xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x56): /* vreducebf16 $imm8,[xyz]mm/mem,[xyz]mm{k} */
+        generate_exception_if(evex.w || (ea.type != OP_MEM && evex.brs),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_imm8_zmm;
+
 #endif /* X86EMUL_NO_SIMD */
 
     CASE_SIMD_PACKED_INT(0x0f3a, 0x0f): /* palignr $imm8,{,x}mm/mem,{,x}mm */
@@ -7932,6 +7946,36 @@ x86_emulate(
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX_66(5, 0x51): /* vsqrtbf16 [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x58): /* vaddbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x59): /* vmulbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x5c): /* vsubbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x5d): /* vminbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x5e): /* vdivbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x5f): /* vmaxbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x2c): /* vscalefbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x42): /* vgetexpbf16 [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x4c): /* vrcpbf16 [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x4e): /* vrsqrtbf16 [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x98): /* vfmadd132bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x9a): /* vfmsub132bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x9c): /* vfnmadd132bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x9e): /* vfnmsub132bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xa8): /* vfmadd213bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xaa): /* vfmsub213bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xac): /* vfnmadd213bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xae): /* vfnmsub213bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xb8): /* vfmadd231bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xba): /* vfmsub231bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xbc): /* vfnmadd231bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xbe): /* vfnmsub231bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w || (ea.type != OP_MEM && evex.brs),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     CASE_SIMD_ALL_FP(_EVEX, 5, 0x5a):  /* vcvtp{h,d}2p{h,d} [xyz]mm/mem,[xyz]mm{k} */
                                        /* vcvts{h,d}2s{h,d} xmm/mem,xmm,xmm{k} */
         visa_check(_fp16);


