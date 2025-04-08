Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93773A80691
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941872.1341268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u284Q-0000Sy-A9; Tue, 08 Apr 2025 12:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941872.1341268; Tue, 08 Apr 2025 12:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u284Q-0000M8-6L; Tue, 08 Apr 2025 12:28:50 +0000
Received: by outflank-mailman (input) for mailman id 941872;
 Tue, 08 Apr 2025 12:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u284O-0000KM-HY
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:28:48 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02cc1824-1475-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 14:28:44 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so4836226f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 05:28:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b42besm14584816f8f.41.2025.04.08.05.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 05:28:43 -0700 (PDT)
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
X-Inumbo-ID: 02cc1824-1475-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744115323; x=1744720123; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dCDQhQWDptOSQpAbCQON+swqOWudMZFiH3TjbxrPU0=;
        b=PbsNeB66nwt5Z1oBA7OT5cj+hsWJJFEU2iV4nwRG49K/EEbeJpaCqS/yzqBt0PnNYr
         aa3IvZoD5J1BBPXeFisRA/S3LIzhlFiZex6j3et85V8lLbaemdj6FUKSxiBCMbqlCRHE
         gmp9wYnRnx8UgbqGWIi9Nkrw2LRa29Rt01zH1jCbBmSqv565HG/DB9c+UeaMx8fVU1Yw
         EYBTtAapbb3cNBHi8Za4AwUvbNaiJTmyoEOvF9hOwQYRsk1MHgPAyq4DkwVvWe15dgr9
         8TQUmNkTLMpZgWRtgAmWKD3Rhe4f52kBf1pF8jtg4HRDZoeYQwwRmQXVto/6/Kb5cGMa
         QIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115323; x=1744720123;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dCDQhQWDptOSQpAbCQON+swqOWudMZFiH3TjbxrPU0=;
        b=mpWt1Q/WQLu8Yb5cojltkfqRdIRvlBgkS8/Fq8QmNSrrcHV3wXLTd8uKPd2iXVPSn3
         BWrfvqOoNZx1VSTx38v5BJz+za/dyLjxvcn8HrLcxrzcS4Eq/zSVXU+n9Zkn+l0PPcRc
         skIkdL8obyDAcuu6Nue01+mnBigUhyNll3rvbbZrkZa+1+s1yH2Y9auhDlT8iGKKyfiw
         nfp7MCRZSTqmR1noj6Fnt34L6JlmCbFFxOOoHBQfD50ZyU+sPvFJF6Pmh0sKLvI6/MRX
         usWHOE7W9v839U+91bIdnGUURLEoLgsafIzDrgZHbl0DtqzMTgX/WLilWX9422AfaKk5
         4Obw==
X-Gm-Message-State: AOJu0YyUOYciy2diYiyTJpa+CGEscQevI7KLxlwqPZIBvPFogKAj5H0N
	IAUHMZZm0MvAdqmQEvgWWquRQ0UZdGGF7jr5gREfWpWYYUL22PHQ0DWkeZ94Zon7m4yaSjyHE7g
	=
X-Gm-Gg: ASbGncsbyaOuJcio5L4IGHQ/Z5tY10TwYxSZ1u1eyo/DVm18Y8fMlrFAouW0VOYyuUN
	GWQYcPLdlOvICke0+dVZTwiq0phhP6ay5vPBoSahWYM8pPPTEwlxFFZ2q54qPpajAtY/AOYGU/L
	8Z1cyh6ol535Dc0A8btqFWtp6eR4LOMep/e6HfhRq18hQSoF6UoQA20yLcvfYPB02bsedHkWe6A
	zPDNUzWcSXCU7M0qkXTFb4sys4mbyDTuqxLCTaGM3doP6AQ4zAgjrfXN82N4QDvygDyJVM7aMUu
	oSU4RaNos/ugbF5zmc3aWNH6GYS4h9MkQREMwvAU/ezGN5dv2/0bmg/v5L6lfxd1QWQJU/wLqaa
	8bdMe2WUWN0DeZ8SCFlg405QBmpcghQ==
X-Google-Smtp-Source: AGHT+IGc8wmmahf526OeOYgrBUQ2FhK07qOOMSd+0TvmGLrGPOi5CE55xp6Ksw8GxeXPf0YjT0cgfQ==
X-Received: by 2002:a05:6000:228a:b0:39c:30d9:3b5c with SMTP id ffacd0b85a97d-39d0de67b78mr14094928f8f.39.1744115323517;
        Tue, 08 Apr 2025 05:28:43 -0700 (PDT)
Message-ID: <779957ca-3250-4b33-ac1d-ace1dcdaafc0@suse.com>
Date: Tue, 8 Apr 2025 14:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: drop check for AVX512-4FMAPS
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

Use of Xeon Phi features was dropped earlier on; this one was overlooked.

Fixes: 85191cf32180 ("x86: drop Xeon Phi support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle it looks as if we could now drop all of this checking, as
gcc5 supports all of the features we check for. AVX512-4FMAPS is an
example though where checking helps, as this and other Xeon Phi features
were supported by an intermediate range of gcc versions.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -105,7 +105,7 @@ TARGET-$(shell echo 'int i;' | $(CC) -x
 endef
 
 ISA := bmi bmi2 tbm sse4.1 sse4.2 sse4a avx avx2 f16c
-ISA += $(addprefix avx512,f bw dq 4fmaps)
+ISA += $(addprefix avx512,f bw dq)
 $(foreach isa,$(ISA),$(eval $(call isa-check-cc,$(isa))))
 
 # Also explicitly check for {evex} pseudo-prefix support, which got introduced

