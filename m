Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7AE8BC93B
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717289.1119333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tTl-0004uG-BH; Mon, 06 May 2024 08:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717289.1119333; Mon, 06 May 2024 08:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tTl-0004s7-6z; Mon, 06 May 2024 08:13:45 +0000
Received: by outflank-mailman (input) for mailman id 717289;
 Mon, 06 May 2024 08:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3tTj-0004qb-TJ
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:13:43 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d4f4492-0b80-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 10:13:42 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e2a4c20870so21164591fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 01:13:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 je8-20020a05600c1f8800b0041bf28aa11dsm15132210wmb.42.2024.05.06.01.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 01:13:41 -0700 (PDT)
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
X-Inumbo-ID: 8d4f4492-0b80-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714983222; x=1715588022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa41dDjxU7rF/t2uSqi3aUDKSelv+d9yen6SWI3wiag=;
        b=ZhMA+/ScXGIZl1SGSlTPn6kwyV1nHkQuq2gW217fxvhc/QU7DNAf5/UXKjunfHdXmJ
         MYgxqgEFa0zv9Z7OKBs72N1Uotj6tPHT598m9PkVrUmWu6Fsyq1+Db7i5XNTxlYhNx1I
         6sNArM1gKScU5xFdurNaQ67ueMpWSU3K1/gxm8SQEKY2O/vMNYGIXK9FdtVMPUTJW0ZP
         myS3cu7Y1HZrVOPZMVrHHG9cc2gw5juneFXZBg/uH5a090qjWjny7ga9BINtL5bjLrhi
         am1EnbJvke3DdGEtN8i5OQes6YOSDD+3csv5Q34QE2LCRgyZ2RWbehk7OVVkHdWj2qcG
         +0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714983222; x=1715588022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oa41dDjxU7rF/t2uSqi3aUDKSelv+d9yen6SWI3wiag=;
        b=P6n5qLLvhnWlfAqqj15mIhHg79hNnFDJthSP8L+BNrh2au5hWSTN4+7chM+AueO9dz
         oMXLc6FuSO8If07KnO8K5C5teFk1KOVEoYOn7gfMdyY4HxHRS8RHchxmSX8RyfCFC2N9
         47XEbeCDwYUMRpd4TaN0ktYHVGUCwihAXbXIllh9SWES+XCRn/IZumN12oEBmHXHcsOr
         ltYuyVcw8oLrR0FpclHh19m3KGobPlkxoXKejYoIs3FxP5e99nZEDtqlP2cVtM5t+XX9
         k/Cx21GZV3a1cOcPmj3MIu1LLMs28P9yfFTS2i63f7jH4dn9HMNn+8Ne5Bhuy8pECyDv
         oEUQ==
X-Gm-Message-State: AOJu0Yxtv7PVOCyMOfZVM7/+tzxMkzWm06u+wOzC7s8BwrQ4QU81qdFz
	slbuTr6utzsTGRLl6DXJ0kJmjZJut2XKY4EISdivmfaUoC7h1ELd3KbOJc2dbg==
X-Google-Smtp-Source: AGHT+IG89GaC2yK1oIXI1RdsdeHVODJUmOs4OwfJDpDJwMBwGlUEDdWyOHLuOQRuSi2t2VwgXvH7JQ==
X-Received: by 2002:a2e:3619:0:b0:2e2:891d:5f62 with SMTP id d25-20020a2e3619000000b002e2891d5f62mr4306487lja.29.1714983222093;
        Mon, 06 May 2024 01:13:42 -0700 (PDT)
Message-ID: <7fbe2757-99dd-486b-940f-4d30379f5c23@suse.com>
Date: Mon, 6 May 2024 10:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: file xen/include/xen/lib/x86/cpu-policy.h: Meaning of CPUID
 constants
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
References: <2066842119.4829764.1714981618946.JavaMail.zimbra@inria.fr>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <2066842119.4829764.1714981618946.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2024 09:46, Fonyuy-Asheri Caleb wrote:
> I came across these constants in the code (xen/include/xen/lib/x86/cpu-policy.h file) but no explanation of why they have been set that way. 
> 
> #define CPUID_GUEST_NR_BASIC (0xdu + 1) 
> #define CPUID_GUEST_NR_CACHE (5u + 1) 
> #define CPUID_GUEST_NR_FEAT (2u + 1) 
> #define CPUID_GUEST_NR_TOPO (1u + 1) 
> #define CPUID_GUEST_NR_XSTATE (62u + 1) 
> #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1) 
> #define CPUID_GUEST_NR_EXTD_AMD (0x21u + 1) 
> 
> Please can someone explain to me why we have these constants or point to a documentation which explains it? 

These specify the number of (sub)leaves Xen supports, first and foremost to
dimension internal arrays accordingly. I.e. the "why" lies in the way they're
used.

> I am particularly interested in the CPUID_GUEST_NR_BASIC given that for intel processors for example, we have 
> basic leaves running up to 0x21u already for recent processors. This value sort of forces a particular max leaf value. 

Right, but support (for guests) for these needs properly enabling. Hence why
that limit is the way it is, for the time being.

Jan

