Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E109925FB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 09:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811663.1224349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxi42-0007rO-2q; Mon, 07 Oct 2024 07:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811663.1224349; Mon, 07 Oct 2024 07:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxi41-0007of-W0; Mon, 07 Oct 2024 07:21:53 +0000
Received: by outflank-mailman (input) for mailman id 811663;
 Mon, 07 Oct 2024 07:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sxi40-0007oZ-OY
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 07:21:52 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d27360ab-847c-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 09:21:51 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99388e3009so227587966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 00:21:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994ede6181sm154866566b.147.2024.10.07.00.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 00:21:50 -0700 (PDT)
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
X-Inumbo-ID: d27360ab-847c-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728285711; x=1728890511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fqmetPXZ2QZ9p6bROm9aPqZWvjS4bFoBafKVfkVBfjA=;
        b=JS+tCwmSUMN81dzHvVHukPSHOSit0Aa37pAZc19sgi0CvsQfisCSYk+ESJY5AhhUG1
         Z3yjrXzrh8q+aM4+nfRnfvCMSTu7KoGL9pSUjXwtQirGKcYY9l2vFD9D+512WVLUm/32
         0T55sZq4U8Pi3GCqx+IAiMqK3kueJOAg1kTjyfoYYCrpt6S2F55QA+d8cktVsfmJkvAe
         f2Tvimdt01AABUAyzH5Pq1eDE2WA2V5c4/3oSjX1jD14hGouBkWSG1SOtrP/VF3iSg6e
         b3TlT6AMrGNtND3/YaFKkN/WihSkNl9MOUCchy1i6+8m5/Y0gKgJlpRy5wJwFmOGEIt4
         RLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728285711; x=1728890511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqmetPXZ2QZ9p6bROm9aPqZWvjS4bFoBafKVfkVBfjA=;
        b=nHq7nZiiJTzuHpCoTqLOjAdhSjQ4u6JjArst274YypJbWY36ToRql08LeLdBHzjc8N
         MNxc3rqnGa8kLFUrtG5WHw+Ct9Y7jo7QKcH6u7UFBGsrDisu98iSd9fvvrXIi6QBFF+v
         6TOKlVCept3hZ0HtvywDV3XP+DMjBeqyrR4j42skeeZFJjtI1hkLBrpsKtPMVrIeoGWJ
         /kaVv2B5dkgGwtJfiqppWf+VVp7myOoGcctGBgVG3XD13vUgmODYB4N9BNP0lY8fXRVI
         TK6QnU6JI0ZNdKd3fuYDFSR5TaPyEiW7O3asLIsndw3FJAIifzzRYBjZPn8i1Qb1bmIT
         ODOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOxWu8bOiGEUDRCJ+g2rGBxb/qPaHEYTmf73m2Bkzb2fWhLaoZ3cGxaOm5chsEyMyacpnCXj8IE6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1mk/JGCzjrg/ygWVCZqLZchRSBNsUSlSvr051hAJFOPZ3N1LZ
	kNsHyBgAxUWWkQtGRD9ZhP4kQqZ4SC+8bmF+c6469BlwbVX10gOw8p7uXkHZ4tZT8fDrya+rN0Q
	=
X-Google-Smtp-Source: AGHT+IF/JGxnXw6HxO7rE1qL/YIQIV7biOwjaFZZOuTdfCVrgaS/+1+Rkb/zQBbHaEOzcaDF6/Fvrw==
X-Received: by 2002:a17:907:3605:b0:a93:a664:a257 with SMTP id a640c23a62f3a-a991c022d3fmr1031188966b.61.1728285710798;
        Mon, 07 Oct 2024 00:21:50 -0700 (PDT)
Message-ID: <5d85907a-3c37-40ad-b1b6-833a01400423@suse.com>
Date: Mon, 7 Oct 2024 09:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Further simplify CR4 handling in
 dom0_construct_pv()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002232008.1988682-1-andrew.cooper3@citrix.com>
 <7dbd7fae-e2e8-4508-a012-cf9b719c68f1@suse.com>
 <5357e6f1-6f3e-4ed4-85f9-828ffb0272e4@citrix.com>
Content-Language: en-US
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
In-Reply-To: <5357e6f1-6f3e-4ed4-85f9-828ffb0272e4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.10.2024 20:49, Andrew Cooper wrote:
> On 04/10/2024 7:52 am, Jan Beulich wrote:
>> On 03.10.2024 01:20, Andrew Cooper wrote:
>>> The logic would be more robust disabling SMAP based on its precense in CR4,
>>> rather than SMAP's accociation with a synthetic feature.
>> It's hard to tell what's more robust without knowing what future changes
>> there might be. In particular ...
>>
>>> @@ -1064,19 +1065,19 @@ int __init dom0_construct_pv(struct domain *d,
>>>       * prevents us needing to write construct_dom0() in terms of
>>>       * copy_{to,from}_user().
>>>       */
>>> -    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>>> +    if ( cr4 & X86_CR4_SMAP )
>> ... with this adjustment ...
>>
>>>      {
>>>          if ( IS_ENABLED(CONFIG_PV32) )
>>>              cr4_pv32_mask &= ~X86_CR4_SMAP;
>> ... this update of a global no longer occurs. Playing games with CR4
>> elsewhere might run into issues with this lack of updating.
> 
> We don't know the future, but I'm confused by your reasoning here. 
> Right now there's an expectation/assumption that FEAT_XEN_SMAP == CR4.SMAP.
> 
> In fact, the logic in staging right now is wonky if FEAT_XEN_SMAP=1 but
> CR4.SMAP=1.  In this case, we'll do nothing on the way in, and then
> activate SMAP on the way out.

I assume you meant "but CR4.SMAP=0". In that case yes, the logic here would
(kind of as a side effect) correct the wrong combination of state.

> construct_dom0() will definitely crash if SMAP is active.  So looking at
> CR4 is strictly better than accidentally falling into a FEAT_XEN_SMAP=0
> but CR4.SMAP=1 case.

It's better when taking one possible perspective, yes. Otoh CR4.SMAP=1 when
FEAT_XEN_SMAP=0 is a bug, and hence deserves being noticed (if nothing
else then by Xen crashing).

> Needing to play with the global cr4_pv32_mask is a consequence of
> choosing to disabling SMAP, rather than using STAC and/or rewriting
> using copy_*_user().  If you want to avoid playing with cr4_pv32_mask,
> we'll need to revisit this decision.
> 
> While the APs are active/working at this point in boot, they're not
> running guests (32bit PV or otherwise), so alterations to cr4_pv32_mask
> don't really matter.

I didn't really think of APs, but of the BSP itself.

Jan

