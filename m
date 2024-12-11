Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CEC9ECA4E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854455.1267668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJyK-0006ZO-99; Wed, 11 Dec 2024 10:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854455.1267668; Wed, 11 Dec 2024 10:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJyK-0006X9-6W; Wed, 11 Dec 2024 10:29:36 +0000
Received: by outflank-mailman (input) for mailman id 854455;
 Wed, 11 Dec 2024 10:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJyI-0006X3-RM
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:29:34 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cba5fd8c-b7aa-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:29:26 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3862a921123so3854826f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:29:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef68b5272bsm9668798a91.37.2024.12.11.02.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:29:28 -0800 (PST)
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
X-Inumbo-ID: cba5fd8c-b7aa-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912970; x=1734517770; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ujBTJkvmO2v8Y+beaFy0sSs/m/XktSxubv6Dq+sEiHU=;
        b=WpepBenUEtHcd9eP9p44o1TQhaimP5b+uJgdYqsmkRilxx0g9Mc8CIJNH+s4Ydort7
         X/v+/95BSgPGhcSDIvzWwPpkKGZHEBiD9jxK2dOCJ7yYnKuzwIX6+twYFR0FYKtpyWu7
         AYmXurHLzuko3lL+W5aqkVmxwfISWD7wRFNtlSv2B/Rz3/PJ8zlamh4uvjufIbglDfJe
         Hw+mPcZLr/eFahRKE0m48ZVbBd7vIlRxoeL7159KhWBcG7EW/+urO2sVGwayaqH/ADn6
         dB1k13JgyBXxjaLKf3lE587BkPlWGp1F6Q3W0FFUtlhUCkZYRrUnIM/arNzN9+jkTkFT
         Pxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912970; x=1734517770;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujBTJkvmO2v8Y+beaFy0sSs/m/XktSxubv6Dq+sEiHU=;
        b=C33MYCOkEE4LFDBmHbAggKIKsoxuNZ8m0jCEJ4noKbQkYEJklxYjMHc74zhKlQcTf6
         cXsgKuIppHspJybtEgEiSFIOgYBU0BzrwRZHux8DvEkaH53ZmAFhkIZtsZ/bvC5hfZhR
         Ql37+Dk1BXWormueD2uGQF6nxru8X0noAkQeFgYTzMB3sd8492TrBMCuvA9qucbv/4xi
         zywFo/AMyyK60wXR0fAEAxrv5mQ3BnyyyZ/dARq4qgr/8K+bhQAdDE+RS4LjW6L/qE0t
         3R56RN7MKYWwRe1y18qAbm0qDi8uuQb/rn0kVcGCxi5Fek2OO00FDxX1vkhWnjTczpUC
         RADA==
X-Gm-Message-State: AOJu0Yw5J6nyGsiWlYgmC6rwp1g13aKebGiZqQlk5nKdNT/2l3cI5k7d
	9SIGC652cRyLYUMbCVgAXV2yjhlH6TwUMrbJfXBLOv5hvaGw92DbT7NXdUF/lY9/UTY88JPqDkI
	=
X-Gm-Gg: ASbGncvcH+ji23/IqHDeBbkJIkzPDdl/dDhyrNcYEHj0nfZyCTOmDnCUAvhwMO3+Tcl
	EQIfhKedWNp/BXFPOHB8fhMPuMthVtkTWMfBI42GBeI3mZwGRgI8u8f5a6BwfcTyqghSNLwqxzJ
	e82tmAnKWSauOZN9wDMto4ZmjDqqk3EQRKhWfjLSoKhktR6tgifCkJXiU+6UMg+EIBcyiuX1gWK
	h4uUiV+a5eJDYsbjqZzMqGqVsest0GTSoiGAaQjxluF5caxyXhR3gCo/WZua+rcmhv/0rucmjPu
	ZkYfYCU0k87IcgyNqQ4a9rG19sk4LnrXtM1QEE0=
X-Google-Smtp-Source: AGHT+IFsmYFIMF3UuxSbdCOdljfJU7H1TPXBRv4T6CKWO7LHMapK36wjCrqk58u7z9THYP5g6P/L+Q==
X-Received: by 2002:a5d:47a4:0:b0:385:e5d8:3ec2 with SMTP id ffacd0b85a97d-3864cea39aemr1896480f8f.28.1733912968951;
        Wed, 11 Dec 2024 02:29:28 -0800 (PST)
Message-ID: <f798c7d3-4f2f-4a71-b40e-aebcd3e6a510@suse.com>
Date: Wed, 11 Dec 2024 11:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/16] x86: support AVX10
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
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
In-Reply-To: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 11:09, Jan Beulich wrote:
> AVX10.1 is just a re-branding of certain AVX512 (sub)features, i.e.
> adds no new instructions. Therefore it's mostly relaxation that needs
> doing, plus dealing with the 256-bit-only case that AVX512 itself
> does not allow for. Luckily an unnecessary restriction on the mask
> register insns was taken out again, simplifying the actual emulator
> adjustments quite a bit.
> 
> AVX10.2 is adding quite a few new insns, support for which (new in v3)
> is roughly added chapter-wise as the spec has them (perhaps not in the
> order of the chapters there).
> 
> While it probably can be rebased ahead, the series in this form
> depends on the previously submitted "[PATCH v5 0/3] x86/CPUID: leaf
> pruning". It also is assumed to go on top of "[PATCH v7 0/7] x86emul:
> misc additions", albeit at most contextual dependencies ought to exit
> there.
> 
> I've tried to be very careful in rebasing ahead of other emulator
> patches I've been carrying, but almost all testing I've done is with
> all of those collectively in place.
> 
> 01: x86/CPUID: enable AVX10 leaf
> 02: x86emul: support AVX10.1
> 03: x86emul/test: use simd_check_avx512*() in main()
> 04: x86emul/test: drop cpu_has_avx512vl
> 05: x86emul: AVX10.1 testing
> 06: x86emul/test: engage AVX512VL via command line option
> 07: x86emul: support AVX10.2 256-bit embedded rounding / SAE
> 08: x86emul: support AVX10.2 scalar compare insns
> 09: x86emul: support AVX10.2 partial copy insns
> 10: x86emul: support AVX10.2 media insns
> 11: x86emul: support AVX10.2 minmax insns
> 12: x86emul: support AVX10.2 media insns
> 13: x86emul: support AVX10.2 saturating convert insns
> 14: x86emul: support other AVX10.2 convert insns
> 15: x86emul: support SIMD MOVRS
> 16: x86emul: support AVX10.2 forms of SM4 insns

I should probably have mentioned here two further opens:
1) Testing. So far I haven't been able to think of a good approach to test
   some (most?) of the new insns, beyond the EVEX Disp8 and predicates
   testing that's being taken care of in individual patches.
2) Supposedly there is a way to constrain guests to 256-bit vector size via
   a VMCS setting. The spec has no details beyond mentioning this fact.

Jan

