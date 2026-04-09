Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN1qHsjA12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:07:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBE33CC691
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277784.1562908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqyt-0004BN-8b; Thu, 09 Apr 2026 15:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277784.1562908; Thu, 09 Apr 2026 15:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqyt-000491-5H; Thu, 09 Apr 2026 15:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1277784;
 Thu, 09 Apr 2026 15:07:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqyr-00048P-EY
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:07:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqyq-005w2d-Qn
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:07:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c0b9-5cb7-0a2a0a5109dd-0a2a4507d08a-6
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:07:40 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c0bc-ba2d-0a2a45070019-d155dd34b417-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:07:40 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43cf5ad500fso834828f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:07:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d473b8c1esm28326326f8f.12.2026.04.09.08.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:07:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1775747260; x=1776352060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kqkwKq4/c4zisfsQksvtWDIfvwwA5snoHjlKEQpljBA=;
        b=cTo6ZLuxDx1ak8GOUcmWGaPx7ih/W5ukfqr1A4xNGvBCXJ4pnyJkK7NSJfS+RsQFfm
         PlVwd5lLsr0/VjhmKVm1zIeETMhWkDbcSZtK1HD5tbf/9qHXUNiHGEt8Rx33xyfZ6rmm
         PZuxYnyHixdhM8j/Ri556JGlRzRBto0tYPF6Djknz+yGdR5xJeSY4Pc9pcb+uvUp8FeE
         E01DNEW27Pw/akYJvLLmX97a4DXJEsy167hS3fAU/1Ne2gh5zn4JB/V0u0ymqXIsY40r
         2wbHcBOXzEEsCM+PJuK33ePU0jg05ms2U7jwpAD7Z/W39XG7OiogRSJUijn/QPTXv5T2
         x0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747260; x=1776352060;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqkwKq4/c4zisfsQksvtWDIfvwwA5snoHjlKEQpljBA=;
        b=pdnjOb6bMzxzEdNDw9q+jWgwS4scKLK9m/06vZ6jz1cSAGeOuSOYahlNjGP2567iga
         BMywi9qpqOoicJgN/UtvsFWHjDTKsxhumcqZusasDMjBUdZnXw466AyUUfjPKHlfK6HH
         juDpJwhipy1qapueQCViCV90ZYb6zzcjOkkE179dw2uKXSycyQiARRHkf5GkRgupl2ZO
         E+uBlvuiH/tboptrDFfQov091uHftI+lMt+Wxtvrq/qGT7NSU2l3cCzJhcSqeAIONzD2
         h7TUrYDBXJSHyLyRfqUv1QTrpQ3zTEo03pDdRbptOM+OE7MMedy/TVx0CCt7PXFPU0tH
         ORZg==
X-Gm-Message-State: AOJu0YxlD5Vn0OH5lvfdxRKAxPJoMj420/hKIvSmcKrhzkhzlKjWsxnj
	r1EH3v5mRPvYscN2B4bKrn6fiNoqom7x351JoN+QwxEfT8bGNOntHWzvmoYIQlCSiYm9RpIv6qU
	Apjm2nA==
X-Gm-Gg: AeBDies4FgEozA371QfXxPb/b0Qk7RcG+gtLQtJSmiF5DHBUDaUY2lK6IF6CcBKhHJ0
	SHpjjc6daigJ7hKOJQpA80kYSBk4sGTJVD1wHhLahyVEoWI1KfKKfTzfpyT/n2oR08FYv8Gvk3g
	rPpV1BIcBD7uUK14ngm5CdsXauTZV6beBWqrQbY2pLYZnCiOrLIotUCC96wke3V3EFtv4CfQubf
	f266F5Dd+f3TeG1Zm52b1/DZQGZuXy7pRVxlpt/1+yEie1ZbNrmB9YnvGvT/dfvxQskwjS4UScl
	roLzL7MJxiT65B3odcmK8zgDV9Lz9+7CijUUtoXvCGlpIGczLMHGzAHIFW2kZZnB6wwmcoZX5eU
	UeNp+qD/E8PJEySQ6YAjiwoyy88tV+mr5leMx49QHE1s5FtAnA9gfPBfJfFnvtT9aSKPvC6NZ8Z
	CCR93C1xfj8o/feaTKRzG6r46ex2jhLtJx+MWLfUA16n+I6EbVlsTpAsUmjee1aJWZS5HnxH2wm
	dnRgL572j+c5m0=
X-Received: by 2002:a05:6000:2409:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-43d292a92e4mr38893540f8f.20.1775747260064;
        Thu, 09 Apr 2026 08:07:40 -0700 (PDT)
Message-ID: <f9a23108-caa0-456c-9e0b-f14dcb79c5fb@suse.com>
Date: Thu, 9 Apr 2026 17:07:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 11/16] x86emul: support AVX10.2 media insns
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
X-purgate-ID: tlsNG-ef75cf/1775747260-8B94141E-E5DE21AF/0/0
X-purgate-type: clean
X-purgate-size: 7336
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
X-Rspamd-Queue-Id: 0CBE33CC691
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These are all very similar to various existing insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
In evex-disp8.c, should we separately have avx10_v1_aux_all[]? If so, all
the convert insns would also need moving/copying there.
---
v4: Series re-ordering adjustments. Update to spec version 6.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -725,6 +725,20 @@ static const struct test avx10_2_all[] =
     INSN(comisbf16,        66, map5, 2f,    el, bf16, el),
     INSN_SFP(comx,               0f, 2f),
     INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
+    INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
+    INSN(mpsadbw,          f3, 0f3a, 42,    vl, d_nb, vl),
+    INSN(pdpbssd,          f2, 0f38, 50,    vl,    d, vl),
+    INSN(pdpbssds,         f2, 0f38, 51,    vl,    d, vl),
+    INSN(pdpbsud,          f3, 0f38, 50,    vl,    d, vl),
+    INSN(pdpbsuds,         f3, 0f38, 51,    vl,    d, vl),
+    INSN(pdpbuud,            , 0f38, 50,    vl,    d, vl),
+    INSN(pdpbuuds,           , 0f38, 51,    vl,    d, vl),
+    INSN(pdpwsud,          f3, 0f38, d2,    vl,    d, vl),
+    INSN(pdpwsuds,         f3, 0f38, d3,    vl,    d, vl),
+    INSN(pdpwusd,          66, 0f38, d2,    vl,    d, vl),
+    INSN(pdpwusds,         66, 0f38, d3,    vl,    d, vl),
+    INSN(pdpwuud,            , 0f38, d2,    vl,    d, vl),
+    INSN(pdpwuuds,           , 0f38, d3,    vl,    d, vl),
     INSN_SFP(ucomx,              0f, 2e),
     INSN(ucomxsh,          f3, map5, 2e,    el, fp16, el),
 };
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1927,8 +1927,15 @@ static const struct evex {
     { { 0x4d }, 2, T, R, pfx_66, Wn, LIG }, /* vrcp14s{s,d} */
     { { 0x4e }, 2, T, R, pfx_66, Wn, Ln }, /* vrsqrt14p{s,d} */
     { { 0x4f }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt14s{s,d} */
+    { { 0x50 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuud */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
+    { { 0x50 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsud */
+    { { 0x50 }, 2, T, R, pfx_f2, W0, Ln }, /* vpdpbssd */
+    { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuuds */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
+    { { 0x51 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsuds */
+    { { 0x51 }, 2, T, R, pfx_f2, W0, Ln }, /* vpdpbssds */
+    { { 0x52 }, 2, T, R, pfx_no, W0, Ln }, /* vdpphps */
     { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
     { { 0x52 }, 2, T, R, pfx_f3, W0, Ln }, /* vdpbf16ps */
     { { 0x52 }, 2, T, R, pfx_f2, W0, L2 }, /* vp4dpwssd */
@@ -2029,6 +2036,12 @@ static const struct evex {
     { { 0xcc }, 2, T, R, pfx_66, Wn, L2 }, /* vrsqrt28p{s,d} */
     { { 0xcd }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt28s{s,d} */
     { { 0xcf }, 2, T, R, pfx_66, W0, Ln }, /* vgf2p8mulb */
+    { { 0xd2 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuud */
+    { { 0xd2 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusd */
+    { { 0xd2 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsud */
+    { { 0xd3 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuuds */
+    { { 0xd3 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusds */
+    { { 0xd3 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsuds */
     { { 0xda }, 2, T, R, pfx_f3, W0, Ln }, /* vsm4key4 */
     { { 0xda }, 2, T, R, pfx_f2, W0, Ln }, /* vsm4rnds4 */
     { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
@@ -2075,6 +2088,7 @@ static const struct evex {
     { { 0x3e }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmpu{b,w} */
     { { 0x3f }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmp{b,w} */
     { { 0x42 }, 3, T, R, pfx_66, W0, Ln }, /* vdbpsadbw */
+    { { 0x42 }, 3, T, R, pfx_f3, W0, Ln }, /* vmpsadbw */
     { { 0x43 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vshufi{32x4,64x2} */
     { { 0x44 }, 3, T, R, pfx_66, WIG, Ln }, /* vpclmulqdq */
     { { 0x50 }, 3, T, R, pfx_66, Wn, Ln }, /* vrangep{s,d} */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -434,8 +434,8 @@ static const struct ext0f38_table {
     [0xcb] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xcc ... 0xcd] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl },
     [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0xd2] = { .simd_size = simd_other },
-    [0xd3] = { .simd_size = simd_other },
+    [0xd2] = { .simd_size = simd_other, .d8s = d8s_vl },
+    [0xd3] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xda] = { .simd_size = simd_other, .d8s = d8s_vl },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6169,6 +6169,30 @@ x86_emulate(
         avx512_vlen_check(true);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x50): /* vpdpbuud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x50): /* vpdpbsud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x50): /* vpdpbssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x51): /* vpdpbuuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x51): /* vpdpbsuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x51): /* vpdpbssds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0xd2): /* vpdpwuud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0xd2): /* vpdpwusd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xd2): /* vpdpwsud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0xd3): /* vpdpwuuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0xd3): /* vpdpwusds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xd3): /* vpdpwsuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        if ( !cp->avx10.avx10_v1_aux )
+            vcpu_must_have(avx10, 2);
+        op_bytes = 16 << evex.lr;
+        goto avx512f_no_sae;
+
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x52): /* vdpphps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        op_bytes = 16 << evex.lr;
+        goto avx512f_no_sae;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8f): /* vpshufbitqmb [xyz]mm/mem,[xyz]mm,k{k} */
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         /* fall through */
@@ -7635,6 +7659,14 @@ x86_emulate(
         visa_check(bw);
         goto opmask_shift_imm;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f3a, 0x42): /* vmpsadbw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        fault_suppression = false;
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_66(0x0f3a, 0x44):     /* pclmulqdq $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x44): /* vpclmulqdq $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
         host_and_vcpu_must_have(pclmulqdq);


