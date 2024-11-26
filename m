Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F299F9D95FD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 12:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843582.1259208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtQa-0000C5-Bn; Tue, 26 Nov 2024 11:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843582.1259208; Tue, 26 Nov 2024 11:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtQa-00009U-8C; Tue, 26 Nov 2024 11:08:20 +0000
Received: by outflank-mailman (input) for mailman id 843582;
 Tue, 26 Nov 2024 11:08:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFtQY-00009O-DD
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 11:08:18 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbc84597-abe6-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 12:08:15 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa51b8c5f4dso534720766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 03:08:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa51759737dsm554980166b.81.2024.11.26.03.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 03:08:14 -0800 (PST)
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
X-Inumbo-ID: bbc84597-abe6-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJiYzg0NTk3LWFiZTYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjE5Mjk1LjQ2NjUxLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732619295; x=1733224095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qywzHvzGpskN60Me1KczX2j76h0/zXTP/VAEx6uqVhA=;
        b=A7hDxVzGQDZ+NQsjAy1gRIcXIGPaUvv98LR5VFcMWQU8OBKOic6fupOf6bKMdeiatr
         A5jM6KY+mD6LS3gDen2cyLjynRcyGzd/HO90ygo+2PN3H7qGA8pbypzpOcT+MnqPdIKS
         Rk5FNDHjzE5mscyK/gB+xR2hsaSj+vUF23UXjVwC38w1CohN60ijx7+u/SwqBVPOJlFU
         6ooyQtS4neIAU3I9eEx3jlqSzntoBf3inGsXrTlGniRxTOOqkn5YLDPNrdPwLTrqlxe0
         SBBEwq3hOWynDAE7HR//YrEm/1dd9RLLAIf2DTZrrDqktbKWEixb35mFZfrJ96+05Zqq
         ik/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732619295; x=1733224095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qywzHvzGpskN60Me1KczX2j76h0/zXTP/VAEx6uqVhA=;
        b=haQvgoBRi73Z8WUPnggBJOxSt+2fhon4fpvytIfBUaq9cMJbTLGnUGhxphh7hDiEO3
         WJUZuI/9p1cn+AXGtIK4VZTirWzgeOwyFCEIXF0VkQ+HwMa2O+k1Aq3lKvc5Sn1tLw46
         Ll/O75ty0bze2d002Tanw3LN5N4f61/Q/CPTOpclIIWgavEZLPCHw3COd2+xaXmxZFu9
         kyHIPgzD5iTLifimNPvg/9koclc1jehKDHJbKEOO+Nr37CJS+WZuOw+QUTTdDnvWfPBd
         IHib3bxJEdmIie64lm4dtQPVymzZriW+2/mcBF5fmlmogZYMMr5eZx2OFOSvxxb5BzZ6
         OUyg==
X-Gm-Message-State: AOJu0YzJzpSuRd8TvqPYqRTxg17yq8tECRqv2piam2hGY6Mt6ReBMgug
	+Cj0L017IhQ9+FnF1pde2H1uWUI7X5vfi1QNWgViLnlpNHYtb0Hxl5PfpHfu1XMUoDOokW9yndc
	=
X-Gm-Gg: ASbGnctICgANAsA9X0vkGmZhXPFDbmXD7q31ccyUQa02g/5u9PXYZKsqeIcGQ7mb+yn
	fl+UWXczoSdtgu6+MXgtfJI2n6GM0s3M3/npPwx2aZe8JmlUBXP1N/7mP8wR5IkgjJ2amQeLEgc
	sGUMjwzA2Kk+Klj9yRybbdiwM136ZMVX6+O/QVs8gilUjeSrxG4Qauj4499Opt1fi/VxVgsNyE8
	9m9xN2H47CEoekU1p82RDgO3bJLEcv6/2XWQxo3oj/PGedJ8iYSEEdRMHXhdcXbD0GafnXhEFqO
	OWEkgDvyMUn/4BxW4jccy+K1/u8VMe7OTyA=
X-Google-Smtp-Source: AGHT+IHyurABKlyFluwxZNWIRjyURz02tdgAa1TN9gOsV+6WrrhJhPPwZyJEv2Y/MGlJwRzV4y2Edg==
X-Received: by 2002:a17:907:77d6:b0:aa5:2c1b:d2cd with SMTP id a640c23a62f3a-aa52c1bd359mr914099366b.34.1732619294874;
        Tue, 26 Nov 2024 03:08:14 -0800 (PST)
Message-ID: <ee8d92f9-289f-43da-bfc1-2632a55de969@suse.com>
Date: Tue, 26 Nov 2024 12:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86: Adjust arch LBR CPU policy
To: ngoc-tu.dinh@vates.tech
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
 <20241118084914.22268-4-ngoc-tu.dinh@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
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
In-Reply-To: <20241118084914.22268-4-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 09:49, ngoc-tu.dinh@vates.tech wrote:
> From: Tu Dinh <ngoc-tu.dinh@vates.tech>
> 
> Allow virtual arch LBR with a single depth that's equal to that of the
> host. If this is not possible, disable arch LBR altogether.

How will this work across migration?

What does "single depth that's equal to that of the host" mean, when
multiple depths can be advertised as supported? Perhaps I'm irritated
by ...

> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -638,6 +638,36 @@ static void __init calculate_pv_max_policy(void)
>      p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
>  }
>  
> +/*
> + * Allow virtual arch LBR with a single depth that's equal to that of the
> + * host. If this is not possible, disable arch LBR altogether.
> + */
> +static void adjust_arch_lbr_depth(uint32_t fs[FEATURESET_NR_ENTRIES])
> +{
> +    uint64_t host_lbr_depth;
> +    bool lbr_supported = true;
> +
> +    rdmsrl(MSR_IA32_LASTBRANCH_DEPTH, host_lbr_depth);

... you reading an MSR here which was never set by Xen. Whatever the firmware
left there should not be relevant to us. 

> +    if ((host_lbr_depth == 0) ||
> +        (host_lbr_depth % 8) ||
> +        (host_lbr_depth > 64))
> +        lbr_supported = false;

Here and below: Please familiarize yourself with Xen coding style. if() and
alike want blanks immediately inside the parentheses.

> +    host_lbr_depth = 1ul << ((host_lbr_depth / 8) - 1);
> +    if ((host_lbr_depth & fs[FEATURESET_1Ca] & 0xff) == 0)
> +        lbr_supported = false;
> +
> +    if (lbr_supported)
> +    {
> +        fs[FEATURESET_1Ca] = (fs[FEATURESET_1Ca] & ~0xffu) | host_lbr_depth;
> +    }
> +    else
> +    {
> +        __clear_bit(X86_FEATURE_ARCH_LBR, fs);
> +        fs[FEATURESET_1Ca] = fs[FEATURESET_1Cb] = fs[FEATURESET_1Cc] = 0;
> +    }
> +}

Hmm, is it really a good idea to fiddle with the featureset, rather than (after
conversion back) with the policy? Cc-ing Andrew. This would then also avoid use
of several plain integer literals.

Jan

