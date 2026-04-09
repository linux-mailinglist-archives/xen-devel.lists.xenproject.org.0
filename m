Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG69MKvC12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:15:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF613CC7C6
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277838.1562944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr6g-0007ib-TK; Thu, 09 Apr 2026 15:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277838.1562944; Thu, 09 Apr 2026 15:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr6g-0007h4-QG; Thu, 09 Apr 2026 15:15:46 +0000
Received: by outflank-mailman (input) for mailman id 1277838;
 Thu, 09 Apr 2026 15:15:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAr6f-0007gt-Ay
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:15:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAr6e-001ocu-N3
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:15:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c297-5cb7-0a2a0a5109dd-0a2a4504b52c-26
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:15:44 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c2a0-bb33-0a2a45040019-d1558036a96d-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:15:44 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso13141645e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:15:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd0f0991sm27045945e9.11.2026.04.09.08.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:15:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1775747744; x=1776352544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xd+P/nLZNlhJ5AosjFbcFU2n+vCF+VFPeqgrh3HTVCQ=;
        b=GFekNwGuydXH1iXdTa3h9/vIzVr6fGLSuKe2RMU8lMH2eudJiwqd7mRjIf13w9LAsM
         fOtiCLNwdU3yTCZuDwpd34Fh4RUsek7hJS/iXUC6Y0bGFx96iRLk026ThknKOzKtfJ9+
         YT4D2Q0Dh3y3QZlpNs7onzO4GYALyv3PbLZSML0FWMJM6j/zOuoQisz59hs0gjZrgv7X
         JRsB5S7JPkvXwYm9NJop9fV70xlSeeYhI7cLN/ySwezkyFWZMHEf/cFEpGxd8PYQ2adk
         xSKF6tBzHzA7o0mz0JnYPvCATEIiFiHSRsCVCPBNx31/ZLmaKXVszrz1Qnsiiyma1C6o
         3Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747744; x=1776352544;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd+P/nLZNlhJ5AosjFbcFU2n+vCF+VFPeqgrh3HTVCQ=;
        b=APlyuBXyoR6blzlu0KK7lyBlGtJYb1We5ICZs+6nQSQ3JVy5CxRSX4ndW1LJ1vj12m
         2+hN4PlTJfQMNVplhuERc6LZEGsuV/tD9N2H8SFWrRisqLTWtn1vQhm3Rgu1fYwe1lEm
         R3rfKwYU8rwsIpWn3PBfAz8BvVqLqVD0oD4+DJ5c37wTMf7AGjaJibRiHZl5rC6hoJWp
         Go2ORAyPUVwAun7VUk82PXO5eV59R/ZghVn0Uqi3SrJgcHM8Z5VD2nSMF/6QosI6chCK
         wCheNWMXl6e1Hv+qwo4G1nZ4WThtnjCjgVvEa1I89poKdwIwVKp69JeJTlgaMxdrEPcx
         HLaQ==
X-Gm-Message-State: AOJu0Yyd0nWSQfbfYDoX/BqzJTtqr1YDjgEwYgUgtfL4pkcLJIDMdsw0
	B2L2dzZkbjzKkXjA+ajcbJpSq6pRSkXg649mKx5vRCN8wzsa/UH5MBb99onQdOp7JvZQBSpmuGp
	e3b+LMg==
X-Gm-Gg: AeBDievDXN7vQkUd4xaOb1it5j8EeXpszL8y2Ww+jU5cBIGBMGkfsKvX60HxMVD2t7e
	oFoDQRV6d4KAamgydnOqzjvGoS4GJcgLSnqI9XDJhrjZjR7QHwKtGr/jNqyC55cDiStC5Jn0RG0
	1AisnOgJJ4VIyiXZlsLqQKzmm1fgh9eVqfqrkysqRG9Ti80WUpi7gTNf1bHhGdsFCdZbt5kWnFE
	2f8EsfIi0IZlhHSY2vR0xFEu8eKjPkbA6SzbqXZ1nhgUwd5Q55ZgqVwYdpYgvHrURj9JWslCEkk
	NoYs7o144bvzDs7hEbt49+QgZAnMrxC2OciFR37jEp29SYnkHhchdhcr8t+wEKolsKORy0f6m7W
	wbkbxgDcvUNyomXYkohNkE3MWf+QMqNM+g4bz9sl+drvAtWNGdRHJEZY8+c7FAbLNb6QX4V0tu3
	sS0p0XLFIz4ocUVP9MJRXaDb/a8efUsP70b5Z11dqMvcKaXZvfdEbCalD75TZZ28zDx9iMAD9jt
	vupoVU6c6SInuU=
X-Received: by 2002:a05:600c:6387:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488d08efdf2mr34378635e9.12.1775747743675;
        Thu, 09 Apr 2026 08:15:43 -0700 (PDT)
Message-ID: <66f59541-29f1-4bfa-a56e-67e827391ca1@suse.com>
Date: Thu, 9 Apr 2026 17:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 15/16] x86emul: support other AVX10.2 convert insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
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
X-purgate-ID: tlsNG-ebf023/1775747744-33B3051B-4B7489B5/0/0
X-purgate-type: clean
X-purgate-size: 10749
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1AF613CC7C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Despite most of them being about conversion to BF8/HF8, they are still
somewhat similar to various existing convert insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr / -future
---
v4: Update to spec version 3. Switch to using fallthrough pseudo-keyword.
    Series re-ordering adjustments. Update to spec version 6. Add ChangeLog entry.
v3: New.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,7 +16,7 @@ The format is based on [Keep a Changelog
      mitigate (by rate-limiting) the system wide impact of an HVM guest
      misusing atomic instructions.
    - Support for CPIO microcode in discrete multiboot modules.
-   - Support for AVX10.1. (Experimental)
+   - Support for AVX10.2. (Experimental)
 
  - On Arm:
    - Support for guest suspend and resume to/from RAM via vPSCI.
--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -727,8 +727,22 @@ static const struct test avx10_2_all[] =
     INSN(comisbf16,        66, map5, 2f,    el, bf16, el),
     INSN_SFP(comx,               0f, 2f),
     INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
+    INSN(cvt2ph2bf8,       f2, 0f38, 74,    vl, fp16, vl),
+    INSN(cvt2ph2bf8s,      f2, map5, 74,    vl, fp16, vl),
+    INSN(cvt2ph2hf8,       f2, map5, 18,    vl, fp16, vl),
+    INSN(cvt2ph2hf8s,      f2, map5, 1b,    vl, fp16, vl),
+    INSN(cvt2ps2phx,       66, 0f38, 67,    vl,    d, vl),
+    INSN(cvtbiasph2bf8,      , 0f38, 74,    vl, fp16, vl),
+    INSN(cvtbiasph2bf8s,     , map5, 74,    vl, fp16, vl),
+    INSN(cvtbiasph2hf8,      , map5, 18,    vl, fp16, vl),
+    INSN(cvtbiasph2hf8s,     , map5, 1b,    vl, fp16, vl),
+    INSN(cvthf82ph,        f2, map5, 1e,  vl_2,    b, vl),
     INSN(cvtbf162ibs,      f2, map5, 69,    vl, bf16, vl),
     INSN(cvtbf162iubs,     f2, map5, 6b,    vl, bf16, vl),
+    INSN(cvtph2bf8,        f3, 0f38, 74,    vl, fp16, vl),
+    INSN(cvtph2bf8s,       f3, map5, 74,    vl, fp16, vl),
+    INSN(cvtph2hf8,        f3, map5, 18,    vl, fp16, vl),
+    INSN(cvtph2hf8s,       f3, map5, 1b,    vl, fp16, vl),
     INSN(cvtph2ibs,          , map5, 69,    vl, fp16, vl),
     INSN(cvtph2iubs,         , map5, 6b,    vl, fp16, vl),
     INSN(cvtps2ibs,        66, map5, 69,    vl,    d, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1952,6 +1952,7 @@ static const struct evex {
     { { 0x64 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{d,q} */
     { { 0x65 }, 2, T, R, pfx_66, Wn, Ln }, /* vblendmp{s,d} */
     { { 0x66 }, 2, T, R, pfx_66, Wn, Ln }, /* vpblendm{b,w} */
+    { { 0x67 }, 2, T, R, pfx_66, W0, Ln }, /* vcvt2ps2phx */
     { { 0x68 }, 2, T, R, pfx_f2, Wn, Ln }, /* vp2intersect{d,q} */
     { { 0x70 }, 2, T, R, pfx_66, W1, Ln }, /* vpshldvw */
     { { 0x71 }, 2, T, R, pfx_66, Wn, Ln }, /* vpshldv{d,q} */
@@ -1959,6 +1960,9 @@ static const struct evex {
     { { 0x72 }, 2, T, R, pfx_f3, W1, Ln }, /* vcvtneps2bf16 */
     { { 0x72 }, 2, T, R, pfx_f2, W1, Ln }, /* vcvtne2ps2bf16 */
     { { 0x73 }, 2, T, R, pfx_66, Wn, Ln }, /* vpshrdv{d,q} */
+    { { 0x74 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2bf8 */
+    { { 0x74 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtph2bf8 */
+    { { 0x74 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvt2ph2bf8 */
     { { 0x75 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2{b,w} */
     { { 0x76 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2{d,q} */
     { { 0x77 }, 2, T, R, pfx_66, Wn, Ln }, /* vpermi2p{s,d} */
@@ -2124,8 +2128,15 @@ static const struct evex {
 }, evex_map5[] = {
     { { 0x10 }, 2, T, R, pfx_f3, W0, LIG }, /* vmovsh */
     { { 0x11 }, 2, T, W, pfx_f3, W0, LIG }, /* vmovsh */
+    { { 0x18 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2hf8 */
+    { { 0x18 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtph2hf8 */
+    { { 0x18 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvt2ph2hf8 */
+    { { 0x1b }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2hf8s */
+    { { 0x1b }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtph2hf8s */
+    { { 0x1b }, 2, T, R, pfx_f2, W0, Ln }, /* vcvt2ph2hf8s */
     { { 0x1d }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2phx */
     { { 0x1d }, 2, T, R, pfx_no, W0, LIG }, /* vcvtss2sh */
+    { { 0x1e }, 2, T, R, pfx_f2, W0, Ln }, /* cvthf82ph */
     { { 0x2a }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsi2sh */
     { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2si */
     { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2si */
@@ -2187,6 +2198,9 @@ static const struct evex {
     { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
     { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovrs{d,q} */
     { { 0x6f }, 2, T, R, pfx_f2, Wn, Ln }, /* vmovrs{b,w} */
+    { { 0x74 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2bf8s */
+    { { 0x74 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtph2bf8s */
+    { { 0x74 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvt2ph2bf8s */
     { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
     { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2uqq */
     { { 0x78 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2usi */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -378,8 +378,10 @@ static const struct ext0f38_table {
     [0x62] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_bw },
     [0x63] = { .simd_size = simd_packed_int, .to_mem = 1, .two_op = 1, .d8s = d8s_bw },
     [0x64 ... 0x66] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x67] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x68] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x70 ... 0x73] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x74] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x75 ... 0x76] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x77] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x78] = { .simd_size = simd_other, .two_op = 1 },
@@ -1439,6 +1441,15 @@ int x86emul_decode(struct x86_emulate_st
             s->simd_size = ext0f38_table[b].simd_size;
             if ( evex_encoded() )
             {
+                switch ( b )
+                {
+                case 0x74: /* cvt{bias,ne,ne2}ph2bf8 */
+                    s->fp16 = true;
+                    if ( s->evex.pfx != vex_f2 )
+                        d |= TwoOp;
+                    break;
+                }
+
                 /*
                  * VPMOVUS* are identical to VPMOVS* Disp8-scaling-wise, but
                  * their attributes don't match those of the vex_66 encoded
@@ -1586,6 +1597,23 @@ int x86emul_decode(struct x86_emulate_st
 
             switch ( b )
             {
+            case 0x18: /* vcvt{bias,ne,ne2}ph2hf8 */
+            case 0x1b: /* vcvt{bias,ne,ne2}ph2hf8s */
+            case 0x74: /* vcvt{bias,ne,ne2}ph2bf8s */
+                s->fp16 = true;
+                d = DstReg | SrcMem;
+                if ( s->evex.pfx != vex_f2 )
+                    d |= TwoOp;
+                s->simd_size = simd_other;
+                disp8scale = s->evex.brs ? 1 : 4 + s->evex.lr;
+                break;
+
+            case 0x1e: /* vcvthf82ph */
+                d = DstReg | SrcMem | TwoOp;
+                s->simd_size = simd_other;
+                disp8scale = 3 + s->evex.lr;
+                break;
+
             case 0x78:
             case 0x79:
                 /* vcvt{,t}ph2u{d,q}q need special casing */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6243,6 +6243,30 @@ x86_emulate(
         }
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x74): /* vcvtbiasph2bf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x74): /* vcvtph2bf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x74): /* vcvt2ph2bf8 [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX   (     5, 0x18): /* vcvtbiasph2hf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(     5, 0x18): /* vcvtph2hf8 [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(     5, 0x18): /* vcvt2ph2hf8 [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX   (     5, 0x1b): /* vcvtbiasph2hf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(     5, 0x1b): /* vcvtph2hf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(     5, 0x1b): /* vcvt2ph2hf8s [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX   (     5, 0x74): /* vcvtbiasph2bf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F3(     5, 0x74): /* vcvtph2bf8s [xyz]mm,[xyz]mm/mem{k} */
+    case X86EMUL_OPC_EVEX_F2(     5, 0x74): /* vcvt2ph2bf8s [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+        fault_suppression = false;
+        fallthrough;
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0x67): /* vcvt2ps2phx [xyz]mm,[xyz]mm,[xyz]mm/mem{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        if ( !cp->avx10.avx10_v1_aux )
+            vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x68): /* vp2intersect{d,q} [xyz]mm/mem,[xyz]mm,k+1 */
         host_and_vcpu_must_have(avx512_vp2intersect);
         generate_exception_if(evex.opmsk || !evex.r || !evex.R, X86_EXC_UD);
@@ -7946,6 +7970,15 @@ x86_emulate(
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX_F2(5, 0x1e): /* vcvthf82ph [xyz]mm,[xyz]mm/mem{k} */
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
+        if ( !cp->avx10.avx10_v1_aux )
+            vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 8 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_66(5, 0x51): /* vsqrtbf16 [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x58): /* vaddbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x59): /* vmulbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -410,7 +410,7 @@ XEN_CPUFEATURE(TSA_SQ_NO,          18*32
 XEN_CPUFEATURE(TSA_L1_NO,          18*32+ 2) /*A  No L1D Transitive Scheduler Attacks */
 
 /* Intel-defined CPU features, CPUID level 0x00000024:1.ecx, word 19 */
-XEN_CPUFEATURE(AVX10_V1_AUX,       19*32+ 2) /*   AVX10 V1 Auxiliary Instructions */
+XEN_CPUFEATURE(AVX10_V1_AUX,       19*32+ 2) /*a  AVX10 V1 Auxiliary Instructions */
 
 #endif /* XEN_CPUFEATURE */
 


