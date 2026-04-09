Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFZcLIfC12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:15:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DE3CC7B0
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277826.1562936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr65-00078C-IQ; Thu, 09 Apr 2026 15:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277826.1562936; Thu, 09 Apr 2026 15:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr65-00076Q-DX; Thu, 09 Apr 2026 15:15:09 +0000
Received: by outflank-mailman (input) for mailman id 1277826;
 Thu, 09 Apr 2026 15:15:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAr63-00074p-Tw
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:15:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAr63-00Bhhs-9v
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:15:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c276-2eae-0a2a0a5409dd-0a2a4503bf82-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:15:07 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c27a-02b3-0a2a45030019-d155dd31b144-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:15:07 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43d03db7f87so635631f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:15:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d5e969bbfsm5443547f8f.1.2026.04.09.08.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:15:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1775747706; x=1776352506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t+paljPnWkTzNqOHP7CEN4/9EJ+YMnnkKkGJShrJ0p4=;
        b=bED7KWxEOd5HGnbyI/ZE7eRLlG6Lkk32bHRQrLX9QZdoVic/ijPbNSwmNM3Qx4AVdc
         5EUPlJ4ZLgj4c/TRrsJixcSgw0GfgnZnjxkfXnt0IdC6indbUvCsYsJzTVyLEuQUT3rO
         PLnEmHaRDTHk2OjqnI2pS9QCyUMCWCYYdDj8LFU9DzDVHnB1Qgi7NOJsF34dlFkGtxvx
         2d504u/RzuDeZXw3wwZg1eLPjed/YOClFTSiVHfQn/guDk/fGu8ZkJby2841MYb4k7Of
         viZzZh7Qn5NGIiilADkpkAy6YzqBoWKKB/i4MfBZSKKQxguJPDZryhkPGh2i8rdDT+T0
         Qp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747706; x=1776352506;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+paljPnWkTzNqOHP7CEN4/9EJ+YMnnkKkGJShrJ0p4=;
        b=Jw7nQoDAYULBeYFOJGRSKEjZb/YO2KbWc1cvwEpHOaN5C436JffVNQZOpL2kAou457
         r+tdQhqcUVgqSWTDcDwaQitXavSB2D8/Nw92wbYsUwuJDIi7kwS+KW7GaHyE+x8zTZwX
         J9UX0d8i0RB2ppNyA1o0oubtfJYkrDYHS5Fm0XX2Sh9gg0FIVWXGnxtIdBbLpREpjjtM
         uqElZSJ7uUsQSZ5Z0wFqZsOWvY9AF38Vxzbk93ziNq/TkLGXoCcxS7pDRliWmHhPzrqO
         03Zmh1j9jtPiIOOAlswBfNQvftU9wGfI/9od8RgRHRjIloUVkbGKhuy6zWpP/TGOxkDh
         rU6A==
X-Gm-Message-State: AOJu0YzQsUBCigRYnaAbD2+DYmdjf0Q13Ffvid4tO7rLb4TI/2MHbsrE
	Dfpferqlzy2RCMf80dimo77LIMFnLswwzHADcMNVq1vWv3x2R3ISaqW5GIQtNnqTRd9A19z+Na8
	nnASWcQ==
X-Gm-Gg: AeBDietPk65SGKm2eNO773eeV61HqoLOARm1K65O416GDvJx+R9yGzp87BBtegV8aLw
	3JZrmmRpa+PyaqxMXW2HVNfESQrvE4Z4esSi1uuXnhBw6XJsEemh+waxFKbgecGNxQ1XinSQnp5
	0miW3el+lq4ZaBbXr61TRqj2ughQrwOX4iWBVoDx0ZUZmR/rASRPmVxXH8jjUD7tHY8n1NsIR0n
	QAPuKllohkhwNJnhUXqDkmImD2oScsUIkR4FvHHdSOh3MCjx0gcDWPdSwVzFnxXDxqZLuyNJxVN
	STDNQ2FbuVsaiZ+ctyzGfMfMHQuXYNy80POvzuBG6HTE8N4jM4O34hVi8++mMKZucG046QWUdBf
	Op8Q1NV9b3Zva0xuSd4lTTQniHsMIufGKLIciMDpXQ21KtAwzHlGf2rqycZwmiZZT8glgmw8CZd
	BYsIBl/pOxyXmM90cMFFjj6YiZEoGgq0Fmrj5aOEDul9vZ+3+4xP4aAi6BOyTy4fhd5MEvTQHxE
	KfkiUW0ZN77Aba+RCYdjRw9tA==
X-Received: by 2002:a5d:5f92:0:b0:43d:1bf6:920 with SMTP id ffacd0b85a97d-43d2928f444mr37073682f8f.14.1775747706416;
        Thu, 09 Apr 2026 08:15:06 -0700 (PDT)
Message-ID: <476e3ba2-275f-4fda-bbae-090dee92e089@suse.com>
Date: Thu, 9 Apr 2026 17:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 14/16] x86emul: support AVX10.2 saturating convert insns
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
X-purgate-ID: tlsNG-33051d/1775747707-41713C9A-4A26ED8E/0/0
X-purgate-type: clean
X-purgate-size: 9105
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
X-Rspamd-Queue-Id: 245DE3CC7B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While the to-byte ones are somewhat different from what has been there
(yet then nicely regular from an operands perspective), the others are
pretty similar to various existing insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Spec rev 002 says VCVTTNEBF162I{,U}BS, yet that's going to change to
VCVTTBF162I{,U}BS.
---
SDE: -dmr / -future
---
v4: Update to spec version 3. Switch to using fallthrough pseudo-
    keyword. Series re-ordering adjustments.
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -727,6 +727,30 @@ static const struct test avx10_2_all[] =
     INSN(comisbf16,        66, map5, 2f,    el, bf16, el),
     INSN_SFP(comx,               0f, 2f),
     INSN(comxsh,           f3, map5, 2f,    el, fp16, el),
+    INSN(cvtbf162ibs,      f2, map5, 69,    vl, bf16, vl),
+    INSN(cvtbf162iubs,     f2, map5, 6b,    vl, bf16, vl),
+    INSN(cvtph2ibs,          , map5, 69,    vl, fp16, vl),
+    INSN(cvtph2iubs,         , map5, 6b,    vl, fp16, vl),
+    INSN(cvtps2ibs,        66, map5, 69,    vl,    d, vl),
+    INSN(cvtps2iubs,       66, map5, 6b,    vl,    d, vl),
+    INSN(cvttbf162ibs,     f2, map5, 68,    vl, bf16, vl),
+    INSN(cvttbf162iubs,    f2, map5, 6a,    vl, bf16, vl),
+    INSN(cvttpd2dqs,         , map5, 6d,    vl,    q, vl),
+    INSN(cvttpd2qqs,       66, map5, 6d,    vl,    q, vl),
+    INSN(cvttpd2udqs,        , map5, 6c,    vl,    q, vl),
+    INSN(cvttpd2uqqs,      66, map5, 6c,    vl,    q, vl),
+    INSN(cvttph2ibs,         , map5, 68,    vl, fp16, vl),
+    INSN(cvttph2iubs,        , map5, 6a,    vl, fp16, vl),
+    INSN(cvttps2dqs,         , map5, 6d,    vl,    d, vl),
+    INSN(cvttps2ibs,       66, map5, 68,    vl,    d, vl),
+    INSN(cvttps2iubs,      66, map5, 6a,    vl,    d, vl),
+    INSN(cvttps2qqs,       66, map5, 6d,  vl_2,    d, vl),
+    INSN(cvttps2udqs,        , map5, 6c,    vl,    d, vl),
+    INSN(cvttps2uqqs,      66, map5, 6c,  vl_2,    d, vl),
+    INSN(cvttsd2sis,       f2, map5, 6d,    el,    q, el),
+    INSN(cvttsd2usis,      f2, map5, 6c,    el,    q, el),
+    INSN(cvttss2sis,       f3, map5, 6d,    el,    d, el),
+    INSN(cvttss2usis,      f3, map5, 6c,    el,    d, el),
     INSN(divbf16,          66, map5, 5e,    vl, bf16, vl),
     INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
     INSN(fmadd132bf16,       , map6, 98,    vl, bf16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2163,6 +2163,26 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_66, W0, Ln }, /* vmaxbf16 */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
+    { { 0x68 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2ibs */
+    { { 0x68 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttps2ibs */
+    { { 0x68 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvttbf162ibs */
+    { { 0x69 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2ibs */
+    { { 0x69 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2ibs */
+    { { 0x69 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtbf162ibs */
+    { { 0x6a }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2iubs */
+    { { 0x6a }, 2, T, R, pfx_66, W0, Ln }, /* vcvttps2iubs */
+    { { 0x6a }, 2, T, R, pfx_f2, W0, Ln }, /* vcvttbf162iubs */
+    { { 0x6b }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2iubs */
+    { { 0x6b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2iubs */
+    { { 0x6b }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtbf162iubs */
+    { { 0x6c }, 2, T, R, pfx_no, Wn, Ln }, /* vcvttp{s,d}2udqs */
+    { { 0x6c }, 2, T, R, pfx_66, Wn, Ln }, /* vcvttp{s,d}2uqqs */
+    { { 0x6c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttss2usis */
+    { { 0x6c }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2usis */
+    { { 0x6d }, 2, T, R, pfx_no, Wn, Ln }, /* vcvttp{s,d}2dqs */
+    { { 0x6d }, 2, T, R, pfx_66, Wn, Ln }, /* vcvttp{s,d}2qqs */
+    { { 0x6d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttss2sis */
+    { { 0x6d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2sis */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
     { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovrs{d,q} */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1541,6 +1541,19 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
+            case 0x68: /* vcvtt{ph,ps,bf16}2ibs */
+            case 0x69: /* vcvt{ph,ps,nebf16}2ibs */
+            case 0x6a: /* vcvtt{ph,ps,bf16}2iubs */
+            case 0x6b: /* vcvt{ph,ps,nebf16}2iubs */
+                if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
+                    s->fp16 = true;
+                fallthrough;
+            case 0x6c: /* vcvttp{s,d}2u{d,q}qs, vcvtts{s,d}2usis */
+            case 0x6d: /* vcvttp{s,d}2{d,q}qs, vcvtts{s,d}2sis */
+                d |= TwoOp;
+                s->simd_size = simd_other;
+                break;
+
             case 0x6e: /* vmovw r/x/m16, xmm */
                 d = (d & ~SrcMask) | SrcMem16;
                 /* fall through */
@@ -1606,6 +1619,14 @@ int x86emul_decode(struct x86_emulate_st
                     --disp8scale;
                 break;
 
+            case 0x6c: /* vcvttps2uqqs and vcvts{s,d}2usi need special casing */
+            case 0x6d: /* vcvttps2qqs and vcvts{s,d}2si need special casing */
+                if ( s->evex.pfx == vex_66 && !s->evex.w && !s->evex.brs )
+                    --disp8scale;
+                else if ( s->evex.pfx & VEX_PREFIX_SCALAR_MASK )
+                    disp8scale = s->evex.pfx & VEX_PREFIX_DOUBLE_MASK ? 3 : 2;
+                break;
+
             case 0x7a: case 0x7b: /* vcvt{,t}ph2qq need special casing */
                 if ( s->evex.pfx == vex_66 && !s->evex.brs )
                     disp8scale = s->evex.brs ? 1 : 2 + s->evex.lr;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8006,6 +8006,55 @@ x86_emulate(
         op_bytes = 8 << evex.lr;
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_F2(5, 0x68): /* vcvttbf162ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x69): /* vcvtbf162ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x6a): /* vcvttbf162iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x6b): /* vcvtbf162iubs [xyz]mm/mem,[xyz]mm{k} */
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX   (5, 0x68): /* vcvttph2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x68): /* vcvttps2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x69): /* vcvtph2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x69): /* vcvtps2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x6a): /* vcvttph2iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6a): /* vcvttps2iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x6b): /* vcvtph2iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6b): /* vcvtps2iubs [xyz]mm/mem,[xyz]mm{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX   (5, 0x6c): /* vcvttps2udqs [xyz]mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2udqs [xyz]mm/mem,{x,y}mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6c): /* vcvttps2uqqs {x,y}mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2uqqs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x6d): /* vcvttps2dqs [xyz]mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2dqs [xyz]mm/mem,{x,y}mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6d): /* vcvttps2qqs {x,y}mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2qqs [xyz]mm/mem,[xyz]mm{k} */
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 8 << ((evex.w || !evex.pfx) + evex.lr);
+        goto simd_zmm;
+
+    CASE_SIMD_SCALAR_FP(_EVEX, 5, 0x6c): /* vcvtts{s,d}2usis xmm/mem,reg */
+    CASE_SIMD_SCALAR_FP(_EVEX, 5, 0x6d): /* vcvtts{s,d}2sis xmm/mem,reg */
+        generate_exception_if((evex.reg != 0xf || !evex.RX || !evex.R ||
+                               evex.opmsk),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        if ( !evex.brs )
+            avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
+        get_fpu(X86EMUL_FPU_zmm);
+        opc = init_evex(stub);
+        goto cvts_2si;
+
     case X86EMUL_OPC_EVEX_F2(5, 0x6f): /* vmovrs{b,w} mem,[xyz]mm{k} */
         elem_bytes = 1 << evex.w;
         fallthrough;


