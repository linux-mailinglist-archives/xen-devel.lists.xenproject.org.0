Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1F85D579
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 11:28:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683928.1063558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcjpL-0007TU-E8; Wed, 21 Feb 2024 10:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683928.1063558; Wed, 21 Feb 2024 10:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcjpL-0007Rw-Ap; Wed, 21 Feb 2024 10:27:47 +0000
Received: by outflank-mailman (input) for mailman id 683928;
 Wed, 21 Feb 2024 10:27:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcjpJ-00073E-Ok
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 10:27:45 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d960d9c4-d0a3-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 11:27:44 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-564a53b8133so3341759a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 02:27:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ev24-20020a056402541800b0056163b46393sm4443346edb.64.2024.02.21.02.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 02:27:43 -0800 (PST)
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
X-Inumbo-ID: d960d9c4-d0a3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708511263; x=1709116063; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46RcPl9//p9Ch8d0wZpyLAwhHfYopm7zJrbgb+zTroo=;
        b=ELe0e1UHaUzVjGKV82+ip7io3/8zt5c9AXV5X/UgS0mIIKfmxury3WTAGk3ypcnTbN
         FTsbeos7kx4284J98NHBK+dSDkfs2YQ1FDcpXdh5nDt2lWN/vvaB79iz2ZNtXQ80wS1e
         QofGr4mszfKe0jkqU+and00Jjr+8sM97qmLk70T/s1iI86gwsXMT8ULBt8NfD9YaMF2Z
         37k3lTKxQllxL2spugqsSgA5jrCYbF9qXn+vvlIpKwt8UnpOsZ4fUywzixJTclPZINmy
         UrXj3qjJpDTXQDf/L902oxWC3zeflV3VV5hF8V87ED+ZNu7K54Xt6dfKLsXRLie8MZwW
         qkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708511263; x=1709116063;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46RcPl9//p9Ch8d0wZpyLAwhHfYopm7zJrbgb+zTroo=;
        b=i7AQD/uIURESpLnZHezs5UztHhtl9uhleBe+a6d0KieQojmPIXXiXcsyT3scAGWob9
         xgxMIEK7+6SY9VfDTqS9cNwLV/JwbBICX5yNkBybykLMpyWsTPXBiI0MZafsobTayGmZ
         3O0E2gnoYqRiPpKKJCkAi0ZWwB67IhnZQmOZdG+WM/KqrkjgRzpCc3x4vmJxV0ZmfmMO
         o2XRLRDQvbsDyf3/2BxJGputomjg6AFHpEVzDRWhFCVUwzWH+yRj3k+IwZRNkLDEMgYV
         R1wVgjDyYTcUk/syXnzMyA5fS0AC4HofAbiBYMKYA7VG8Y5tgI3k0OKDcYe1FSbXr7IN
         ZZrQ==
X-Gm-Message-State: AOJu0Yzk8WTA8qKWzYYQRxTZpCHe0G4GPHQXFnJ62p4h6LWRuiI+IeHM
	Y/bAkCnXAHOl7hxT71wvphQ6gSAlQIqgEbh2N4iVkx08YMhOSFNZ7qWjqyM+KflqYnI2+mDwhw4
	=
X-Google-Smtp-Source: AGHT+IECpUKHCo05KBvASBTqUsc244lRcYUgcSz+BHIrP6lrkksPor9jBjWgzROiQx2pOQJ4WwcPKw==
X-Received: by 2002:a05:6402:502:b0:564:e57a:18b4 with SMTP id m2-20020a056402050200b00564e57a18b4mr1534613edv.20.1708511263700;
        Wed, 21 Feb 2024 02:27:43 -0800 (PST)
Message-ID: <6da6639d-f11b-47ac-af50-071d451fa60a@suse.com>
Date: Wed, 21 Feb 2024 11:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: make run32 test harness goal work again
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

When re-working library call wrapping the sed invocation didn't account
for all sources living in the parent directory when building the 32-bit
harness binary.

Fixes: 6fba45ca3be1 ("x86emul: rework wrapping of libc functions in test and fuzzing harnesses")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -255,7 +255,8 @@ OBJS := x86-emulate.o cpuid.o test_x86_e
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
 OBJS += x86_emulate/blk.o x86_emulate/decode.o x86_emulate/fpu.o x86_emulate/util.o
 
-WRAPPED := $(shell sed -n 's,^ *WRAP(\([[:alnum:]_]*\));,\1,p' x86-emulate.h)
+WRAPPED := $(shell sed -n 's,^ *WRAP(\([[:alnum:]_]*\));,\1,p' \
+                       $(firstword $(wildcard ../x86-emulate.h) x86-emulate.h))
 
 $(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) -o $@ $^

