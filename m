Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA65BE1F03
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:34:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144214.1477665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IVe-0001B1-Jr; Thu, 16 Oct 2025 07:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144214.1477665; Thu, 16 Oct 2025 07:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IVe-00019E-Gy; Thu, 16 Oct 2025 07:34:50 +0000
Received: by outflank-mailman (input) for mailman id 1144214;
 Thu, 16 Oct 2025 07:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9IVd-0000bW-ID
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:34:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97c98d3f-aa62-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 09:34:48 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-426ff4f3ad4so152866f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:34:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57cce5sm33886179f8f.1.2025.10.16.00.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:34:47 -0700 (PDT)
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
X-Inumbo-ID: 97c98d3f-aa62-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760600087; x=1761204887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rds4jnnN9NVrTZyuc+q65+QBQEjCAV7rC8oJIxMqDF8=;
        b=L9lvu6vg8jYqbEn9WOOlK9go84Sqvd3xEE1XoLx9XNUtQ0S6b9OIBkfJh/+UEWfqa2
         FxWSPDxFAzWXr824e5bEjSPW8XTrwxNCCzP3UaQUT5ZAfH/BBHbUzvhLqq8c6yyqLEXm
         sMiEkN6GNuZxL0nd+NziI9A4htZ/M/cfMzNMUxZioDUHmipxpmaR1drHf3Mnoe1ZWXAA
         aZilTwsbyliqbZbiGmrAFTo0wTCzXmdmwJs26vxa3Vg/3I7BixYt2t933T8lkJmKsi9B
         fzuUymJQQPHUG1TsjxjL4x8DSVk4IOjP1MaL9j07s0zI0wSgNzghsSgJD9a47hYGuSU+
         hHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600087; x=1761204887;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rds4jnnN9NVrTZyuc+q65+QBQEjCAV7rC8oJIxMqDF8=;
        b=xNplEj4m9vJJVeAks+WEd5YeGK4kNf7e5XIxbaPGf/nZK15ci6tYQV5PD2yHE6KCXu
         0hXddEa1Mg/lVlj5EHoJsn7mYU0nJfVlQ7rN5GOmzcKZTpMTxc4zVVbW9ecEXmLATjHf
         rIf2mJKFN8Bdw6D8pHn1z9F1IxBVTaVBCQryMepg9F6K2sMpGRPlp77Qn1sgOiASZcFk
         kTvflrofdpTlhe8oqb60cpFRd65FuWrIyVrVHS5fMWOjqXv+Z+FALjeeu2yhqSNDklpP
         1pC0ZT+T2PUftg5vjHHHdLLxxrSJ4Jm1pT2TXvGPOTsscAS/kR3Y2LIyXpd+3a0aNfKC
         fSQQ==
X-Gm-Message-State: AOJu0YwCkdUj1t8hOzyXf+kEowcDSGahjIRnILWDcf3HtUjc03q4asDX
	KS6ULCKlvPK2v6el46WPdnGRSUeOZvvC6Bdb50QzZkxL7BWStipd1FPpme//BFYkrPq/VH3BSJa
	Arbo=
X-Gm-Gg: ASbGncvBA+vNclnIt/4xdjlLly9EBJGVFoGGbfU7tSMTZ8kOrIWvX9dyMnVRurzlGVL
	lzlINDrApRBPFA5UTL/TlvQgKuGKj9S7CKe7qEVcSleeKyJCsrjZBaknKl6sDPPXDdzHaGRB8K0
	9gslb/GDaJOQHgp9iN+O2H2tNGSuCoSi0E3nTx0e9+pwsv22SFYybxM6QfIM8g5vL6vSAiIqoFe
	XPsEBgiPJ/ICV75TwCJmXFFMldTInz8Yj2nm1t2wQCVp6LaW1O9cIy6ytYhv1/wT8yVaetj2nbx
	Eb4Gjvta9KLcWFPADyfBltewmDs+KAeM9z/6oi2XYtm5vXG6vOrO0D40LtMZdX85thLrmMXBwq5
	SYRKvtBe5FIeWDC+q6jgi/ZaFErGiWlesUqE1XKRnvWiv/96GgvCpcgSWe4dhpSCgMGuCESb6Mn
	bOZq53ksp+rcocex3XtDX1Bs7+8EroTtKubZJeXA+Pt8UbU00DOfHCTm/dpt63+uyS1NJZT/0=
X-Google-Smtp-Source: AGHT+IHbWfxCeB92DEinkCFVFn2vaI7p32jdJDTPBZ3i4c4v8Lz3q06nTPiMY+F7Z4IPweriMP7F7A==
X-Received: by 2002:a05:6000:2401:b0:3e7:46bf:f89d with SMTP id ffacd0b85a97d-4266e8de2c2mr22285084f8f.44.1760600087392;
        Thu, 16 Oct 2025 00:34:47 -0700 (PDT)
Message-ID: <2c077da2-0b12-4138-9778-87397537bd16@suse.com>
Date: Thu, 16 Oct 2025 09:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 09/10] x86/HPET: reduce hpet_next_event() call sites
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
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
In-Reply-To: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm surprised gcc doesn't manage to do that: At least in debug builds two
call sites exist, just like source code has it. That's not necessary
though - by using do/while we can reduce this to a single call site. Then
the function will be inlined.

While improving code gen, also switch the function's 2nd parameter to
unsigned.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Oddly enough the CDQE is replaced by an entirely unnecessary 32-bit MOV of
a register to itself (i.e. zero-extending to 64 bits), as that's
immediately preceded by a 32-bit ADD targeting the same register.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -124,7 +124,7 @@ static inline unsigned long ns2ticks(uns
     return (unsigned long) tmp;
 }
 
-static int hpet_next_event(unsigned long delta, int timer)
+static int hpet_next_event(unsigned long delta, unsigned int timer)
 {
     uint32_t cnt, cmp;
     unsigned long flags;
@@ -173,12 +173,10 @@ static int reprogram_hpet_evt_channel(
     delta = max_t(int64_t, delta, MIN_DELTA_NS);
     delta = ns2ticks(delta, ch->shift, ch->mult);
 
-    ret = hpet_next_event(delta, ch->idx);
-    while ( ret && force )
-    {
-        delta += delta;
+    do {
         ret = hpet_next_event(delta, ch->idx);
-    }
+        delta += delta;
+    } while ( ret && force );
 
     return ret;
 }


