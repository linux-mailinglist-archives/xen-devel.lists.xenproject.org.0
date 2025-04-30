Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26946AA5125
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 18:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973883.1361908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9vt-0006fk-EO; Wed, 30 Apr 2025 16:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973883.1361908; Wed, 30 Apr 2025 16:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9vt-0006dW-Bi; Wed, 30 Apr 2025 16:05:13 +0000
Received: by outflank-mailman (input) for mailman id 973883;
 Wed, 30 Apr 2025 16:05:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9vr-0006dO-FF
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 16:05:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3c8f364-25dc-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 18:05:09 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso1221158266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 09:05:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aced89270a7sm163846966b.18.2025.04.30.09.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 09:05:08 -0700 (PDT)
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
X-Inumbo-ID: e3c8f364-25dc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746029109; x=1746633909; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JdZUkoEsfweykAhRb/6UZyp63WuM+Nh1YapjQxvZKEM=;
        b=SChhDJ03rAmbUwOasndVVqJ4ltYMqMD2t1PjmQWpJmz/vCkAsk8mC8s4E6JqiXbDfO
         oSzgKStrHoq7azQ8tZ9x8F1pcK5olHHmPkEU/LX/FcZlMo7sQkho7q0oFQR89BDmjc4B
         pQU285/D4cHAkQ3ur3Ol6zVkmlqy9qHUg3nAQ1GDVrgYyk26vFpLO5D7LbhQmZeS5y/n
         XHe9jFCqCgS1gRDAkG9bq56/ygLvUrS8Z91VQruboId/yGB4jaZDBtDv2oflV3e2k1bg
         Q38uoWPDlTncJPk0/ZqnOxSjYrx3J0QoLS3Xhb6ZRCua37oSz7aAKeG0bFNJayBX+l/M
         2m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029109; x=1746633909;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdZUkoEsfweykAhRb/6UZyp63WuM+Nh1YapjQxvZKEM=;
        b=gJFMTeQ5iCe2M60PkdZiS7ejyIcQVW6VbuKL9S+yeDPO7qGdcnL5yqKz+30IpzWKh9
         9STjzmS2l+UgxukiAKmT4UTxpp0IcvkWVy81zh18I99yQ2d+Tge4928Pmv3qQgJaRXOf
         Dv2iTxzPHhtt+KOnaSrQjxd+Hm0s0IaCO28mcYNjzy0o9E25MM1DjwaJRPrLBAIiScmb
         nOX1RqShtdRppZolPB+McICAhGcofbJEHWzkAVfWE5KWINRkutj+0QTRarRU2mC4LPC4
         Br0Sv+wO731VWCZPBQDElcAEyS1qE8E4pRfXyMQ6vjgzLtmLtudULVT+8Qj9sMFQw2hM
         bLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA2bwMJoLEYVgeFd3s5zH5v4OMq9bCKrHLPmgC3gDcqXNhrTWbEFPv3GSHa91w1+X//uAqa726t78=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwujZb9MBPBzlACMlzprl+FLouaqbUCgzlFEwvb2Ozx3LV/clb+
	Tufcw/1PqR9SrmdeOLIbrj5EwuTUFsz8LtK2J6si1W1KtXvsBX6y9uMUGEG/CQ==
X-Gm-Gg: ASbGncsz7MeipR/68HD8umGmoYtLjdU1/7IjKz32/EiMPDC2WqOWKs3Ab8ux4zqBnJA
	6kTHRsYFcNJMBNrkXfnJugbKHEocESUnYUqss/ubd6E1/y+POaKW03FkxKXZVH1P+PpWzqQEGuT
	W4zUv5E4pldGkPj1pBxH4t72td1y6pns2LKivDNpqAvAZr3iwL3CQo2Gv3zpVcMdBIhxy75PK6q
	1+ybscJi6gsEIQeSnS66m959yKCCQDXlmFoUgZSQVOudJ9QzuVMSi/SaFgxVD/aO41Yg4hmZpeG
	8mh3oD7OyRZ4314ce062whRNzkK2erpWy/dDKJleHkZBDLuFX7yWaia3p5vF14mCI+9eezHHpVl
	LJGpXzEq0jCgC7GcHk+5dXmU26FEOZknGrdo3
X-Google-Smtp-Source: AGHT+IHR7JBxNM46cnnUHfhAI6VhJeaGbxm8kRnqM0aycaQ5cuaactXeCsgNmkst29kinvt20u4Yrw==
X-Received: by 2002:a17:907:7f29:b0:ace:ceb0:1089 with SMTP id a640c23a62f3a-acedc7d2c73mr411837966b.61.1746029108873;
        Wed, 30 Apr 2025 09:05:08 -0700 (PDT)
Message-ID: <efc6a402-7023-4944-b284-68313bcbf37a@suse.com>
Date: Wed, 30 Apr 2025 18:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/alternatives: allow replacement code snippets to be
 re-used
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c4a71d96-b255-432e-b148-1daf1b14c77f@suse.com>
 <192ab217-b7f0-425d-8da4-6270d4494b37@citrix.com>
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
In-Reply-To: <192ab217-b7f0-425d-8da4-6270d4494b37@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2025 18:00, Andrew Cooper wrote:
> On 30/04/2025 2:13 pm, Jan Beulich wrote:
>> In a number of cases we use ALTERNATIVE_2 with both replacement insns /
>> insn sequences being identical. Avoid emitting the same code twice, and
>> instead alias the necessary helper labels to the existing ones.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> On a random build, the size of .altinstr_replacement drops from 0xe47 to
> 0xdf8, so not too bad.
> 
> While the patch is fine, if we're adjusting the assembly ALTERNATIVE_2,
> we should make the same adjustment to the C version, even if there's
> nothing to benefit from it immediately.

Can do, but I expect that to end up more clumsy for, as you say, no real
gain.

> P.S. it would be even nicer if we would put these in mergeable sections,
> but I haven't figured out way to set the mergable unit size, which needs
> to be an absolute expression.

Well, have you missed
https://lists.xen.org/archives/html/xen-devel/2021-11/msg01009.html then?
Yet it might still make sense to use the approach here as well, as there
are limitations to what can really be merged (by the toolchain).

Jan

