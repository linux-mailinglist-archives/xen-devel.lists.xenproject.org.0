Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892FB39802
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097892.1452064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYle-0004iX-MV; Thu, 28 Aug 2025 09:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097892.1452064; Thu, 28 Aug 2025 09:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYle-0004gZ-It; Thu, 28 Aug 2025 09:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1097892;
 Thu, 28 Aug 2025 09:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urYlc-0004GO-RI
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:18:00 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e46463fc-83ef-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 11:18:00 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61cd3748c6dso1168406a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 02:18:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c78e49c90sm6823590a12.45.2025.08.28.02.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 02:17:59 -0700 (PDT)
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
X-Inumbo-ID: e46463fc-83ef-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756372679; x=1756977479; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ejc5qhFi3Y+WR23KFs1THvG3yLExcxbqfEf/Pm+WWY=;
        b=ZQtfWLQwxc9GsoIZHmZ7v70GUI96jOCOi6K+JBVGaO9rhiAcuDBiRoYkCmNy1FUCLU
         a4Z1kvtzNPnS/w4Bw6xZOWr+kzsnwb1ujZIydSyhcKPtX/+0kkltFz1BwxB5yt2TtM4Q
         YVAWFxTz2Uto5XGrcqGoSTTNy6wxWJ/lv/gGCGe9A6/1pbdYNs8aoDI4W16GnArYS1aI
         8qETpTWlGRKMy3mhptQKyQxlpzhbIUkrMwqmGmJlOsETuAkcUQycfEAWTfqE+2j8TGNE
         Y1qvJZMbTMD9+tTix7tNRvqsMlSM51fPQhMmnNS4Xo23WgHiHL9j6uISxQCGSRwuH+52
         Uozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756372679; x=1756977479;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ejc5qhFi3Y+WR23KFs1THvG3yLExcxbqfEf/Pm+WWY=;
        b=JEyM09aRu1yTJj/IYbaVOzecGRisy/YCSmt2V26mmtuIo7u9Ks9HnKQ0z3hmxMLDLA
         FlDDm/bsgQs/AblogzdPRIVIzO5YJk+IBMLtm93vV7D2sfnVxBl3i249felijFsl+kEt
         LZJaQt+Rrd5YNZJugq1i98ksJdftixHMPP+BQCZ8+gzMn2dqV9ugj6eScWb7adx81HcJ
         ryIPA7Vrr6371wa4091IRLvKLP9kUJFknWjelfafT5Idbc/xqIRryfYEt9tmuGoumtGj
         nNwdukuGUMT+vThjP/5dAMN0MN3IKaXIPSfLedCR1CTEKmxPxMQZrYwDmdcEULA3CJ5T
         TfMA==
X-Gm-Message-State: AOJu0YzEV+gb6LzVj3yWX4ZpHgcTWeqcBhuCK4/BMCemURYa3gq+r5tS
	YmZgJaDfpTtCT23Ca43M3H0MqjASe/cjKlItmT+ale5/zrbAyyo4xYKBGmDkDJosJ4cZVywa5/s
	infg=
X-Gm-Gg: ASbGncuQEGJ1L0+IQM2bJRidlM8dyxM8cymIyUAM/Wq0Ptj1BGIGPx4sKn76/2+nzPN
	NuDjJnaA57BZyEo3f4Lj1ExIlJ0nwh4x31LOrGAVWB7ZZF304WfJKr/R5P8t0nYR8nWEEHj6w5K
	5vcZSZib1oDfsPwzr7cWgUJUZgBr0NJY43YPIRV88QGmTRLRncWg9uQHrLAvql/eYBptiRyuCCP
	9sIhEwqZDs94lFjqUeqUZ5EkseAW049IvRUHtYB9+mpDZjJpuOLl5P7Q+n6Y3MVM8A909grO5ig
	0aUaPuQ/5mI5wGTJF/hYMnJrl0QAuCkvEgbApKMSQM7LtcoROtU2d3OyLKj26EcwCCg6VGR5ThR
	4581ao2FGkcA9zHp07nzdnH7hXo6UE1yqOTfXMuePTRl5UEyCI4QCde7AuMDkqyoz7JJtjcwz0c
	m4uFiJV2M9xFaA2VRWOg==
X-Google-Smtp-Source: AGHT+IH2g0kcaN/GjgsiJ7pnxa1/kaSv4EqRVsl5G22g3dykZUuSMxQVrEVEYjKOoYh4E4RXsh9whw==
X-Received: by 2002:a05:6402:524c:b0:61c:73cb:9849 with SMTP id 4fb4d7f45d1cf-61c73cb9dccmr9968275a12.14.1756372679557;
        Thu, 28 Aug 2025 02:17:59 -0700 (PDT)
Message-ID: <1b9e5d46-20a8-4b5f-b938-e28a0429c770@suse.com>
Date: Thu, 28 Aug 2025 11:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: introduce "hot" and "cold" page copying functions
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The present copy_page_sse2() is useful in case the destination page isn't
going to get touched again soon, or if we want to limit churn on the
caches. Just rename it, to fit the corresponding {clear,scrub}_page_*()
naming scheme.

For cases where latency is the most important aspect, or when it is
expected that sufficiently large parts of a destination page will get
accessed again soon after the copying, introduce a "hot" alternative.
Again use alternatives patching to select between a "legacy" and an ERMS
variant.

Don't switch any callers just yet - this will be the subject of subsequent
changes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course both pages can be independently hot/cold, and hence more flavors
may be necessary here.

To avoid the NOP padding (also in clear_page_hot()) we could use a double
REP prefix in the replacement code (accounting for the REX one in the code
being replaced).

--- a/xen/arch/x86/copy_page.S
+++ b/xen/arch/x86/copy_page.S
@@ -13,7 +13,7 @@
 #define tmp3_reg %r10
 #define tmp4_reg %r11
 
-FUNC(copy_page_sse2)
+FUNC(copy_page_cold)
         mov     $PAGE_SIZE/(4*WORD_SIZE)-3, %ecx
 
         prefetchnta 2*4*WORD_SIZE(src_reg)
@@ -44,4 +44,19 @@ FUNC(copy_page_sse2)
 
         sfence
         RET
-END(copy_page_sse2)
+END(copy_page_cold)
+
+        .macro copy_page_movsb
+        mov     $PAGE_SIZE, %ecx
+        rep movsb
+        .endm
+
+        .macro copy_page_movsq
+        mov     $PAGE_SIZE/8, %ecx
+        rep movsq
+        .endm
+
+FUNC(copy_page_hot)
+        ALTERNATIVE copy_page_movsq, copy_page_movsb, X86_FEATURE_ERMS
+        RET
+END(copy_page_hot)
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -221,10 +221,11 @@ typedef struct { u64 pfn; } pagetable_t;
 
 void clear_page_hot(void *pg);
 void clear_page_cold(void *pg);
-void copy_page_sse2(void *to, const void *from);
+void copy_page_hot(void *to, const void *from);
+void copy_page_cold(void *to, const void *from);
 
 #define clear_page(_p)      clear_page_cold(_p)
-#define copy_page(_t, _f)   copy_page_sse2(_t, _f)
+#define copy_page(_t, _f)   copy_page_cold(_t, _f)
 
 #ifdef CONFIG_DEBUG
 void scrub_page_hot(void *ptr);

