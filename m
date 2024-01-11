Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7EE82B187
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666343.1036905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwmb-0008G1-HI; Thu, 11 Jan 2024 15:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666343.1036905; Thu, 11 Jan 2024 15:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwmb-0008EE-El; Thu, 11 Jan 2024 15:15:49 +0000
Received: by outflank-mailman (input) for mailman id 666343;
 Thu, 11 Jan 2024 15:15:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNwmZ-0008E6-HZ
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:15:47 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a07df8e-b094-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 16:15:44 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e62341ad7so3961745e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:15:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q20-20020a05600c46d400b0040e395cd20bsm6099382wmo.7.2024.01.11.07.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:15:43 -0800 (PST)
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
X-Inumbo-ID: 4a07df8e-b094-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986143; x=1705590943; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7rtlm0nmfIXoeCgI0acLjbqox8dMpVUfqfryO3Y0Xo=;
        b=UZDhS31UXerM5m8yDkmLEsMFzTRs+ilw5rabMoC4TlO7XgRL7RRxAZP7G3Jz3W5kvd
         d4LKRKqAO4i9G52Bsw4EXQYzOjNwYrJ6Nhdfo90rxaDrkX50YBAUcMXo3wpppeotDNy7
         ws4dIa0Lr6kr/pZl/ysgbvleXzYFYFuVpPN/hv0h9Wvcyh23XAzTvbkaHpblvdH/9Foc
         7Va+C1WmkdHtkdRCRKGyQv0WYIVRMbZldzfzWC3mAmgZhdMF9/IvSgY4F/gCS+CscJtg
         siN00yPeZEFdAcIohavH3jYK3etJYg8byTq3H3eNRt0sIdwWcPd8JSTTfeUrOOXU8eVI
         4E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986143; x=1705590943;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7rtlm0nmfIXoeCgI0acLjbqox8dMpVUfqfryO3Y0Xo=;
        b=ja/4j5lJZAMEvCw7R3AAps4p4deCheX6k0oh7DMbTcQC8/+WWQEiCbWPRDZDuhb5T+
         7ONmdjSm4kV6F/qXSQcLCmu1qRn/Oi1XlBEe2/ABJJjiLYKhtBhDDmkkMXZF8Ae9DT6u
         Whxjf13LKWusnOoIWL//PF/GP94GvwmoEPmnSQqpdQucjmvZcgpn3HWBWOuGIWcXzeMa
         EH/15xl67u84lEFfPpPmzBdg/Rgi7lmBdTFWhBjV0m1h9pi3rdNFqOtMvdb60nsRqiH5
         G0Xsdd1yBQUvkWLQRT1cIxyZnKBvcOAkouuhNcLu308zhXxM8efOolS1xpuLfgCPKHrI
         in3A==
X-Gm-Message-State: AOJu0Yylxjf9Hj5LkT/uBfrYq3OEeCl55wmGEvTooWQZn+/OFSLRfLMp
	hpi3Kh5Rp2yNjNkbRKo8vC+oezpSXKFTE5lA0yT20iBOGw==
X-Google-Smtp-Source: AGHT+IFSjo+kqPzZqJPHIFHO95jzLBUIGM9xo5G8/Ogz+9X8lgt9GgbPvZpJz6i/nRwIQ2YlXzhn7w==
X-Received: by 2002:a05:600c:5024:b0:40e:62b1:c047 with SMTP id n36-20020a05600c502400b0040e62b1c047mr112445wmr.102.1704986143487;
        Thu, 11 Jan 2024 07:15:43 -0800 (PST)
Message-ID: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
Date: Thu, 11 Jan 2024 16:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/8] x86: support AVX10.1
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

AVX10.1 is just a re-branding of certain AVX512 (sub)features, i.e.
adds no new instructions. Therefore it's mostly relaxation that needs
doing, plus dealing with the 256-bit-only case that AVX512 itself
does not allow for. Luckily an unnecessary restriction on the mask
register insns was taken out again, simplifying the actual emulator
adjustments quite a bit.

While it probably can be rebased ahead, the series in this form
depends on the previously submitted
[PATCH 0/4] x86emul: support further AVX extensions
[PATCH v4 0/8] x86emul: misc additions
[PATCH v4 0/3] x86/CPUID: leaf pruning

I've tried to be very careful in rebasing ahead of AMX and KeyLocker
patches I've been carrying, but almost all testing I've done is with
all of those collectively in place.

1: x86/CPUID: enable AVX10 leaf
2: x86emul/test: rename "cp"
3: x86emul: introduce a struct cpu_policy * local in x86_emulate()
4: x86emul: support AVX10.1
5: x86emul/test: use simd_check_avx512*() in main()
6: x86emul/test: drop cpu_has_avx512vl
7: x86emul: AVX10.1 testing
8: x86emul/test: engage AVX512VL via command line option

Jan

