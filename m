Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644D9B10214
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055361.1423776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqZS-000295-43; Thu, 24 Jul 2025 07:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055361.1423776; Thu, 24 Jul 2025 07:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqZS-00026v-0C; Thu, 24 Jul 2025 07:40:54 +0000
Received: by outflank-mailman (input) for mailman id 1055361;
 Thu, 24 Jul 2025 07:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueqTN-00089O-NA
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:34:37 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a606a4ec-6860-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 09:34:36 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so583527f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 00:34:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc72548sm1287081f8f.30.2025.07.24.00.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 00:34:35 -0700 (PDT)
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
X-Inumbo-ID: a606a4ec-6860-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753342475; x=1753947275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+hhouXegb79y02BK6iYK3wBNjYMyKvjwu4+H6U621d8=;
        b=EH64/OMSmvtzfZ0EgbMLmQvmOEqBi3jvO3+Zo9CPnSIGWPrBBoUfcuUiqgj4h6PUeK
         +bun69KbMx3wPKO9KMArQc7IavaSDPY0iP+8XRyQ7CR9G8AysYA2ZaIvBPX8rWksHjI1
         Z6YxpmHlOM8QaO41mkptt0TmezBslaoi8v1Zpm/AXzR/moA09UJtDd/C7fAEeC8Cqai2
         gWBUf9diJgx3PUbbsFrXWsH6DH46xvTrPq0gTXO0bkqjQvpEN+2eVmK7867ZdsUHMlTl
         ZlquJwUxZxT1fEk92CCmjfw30e+jxbkYoUXEcUBjPURmjUf1zA1WX2XwZBVj9eU0+qEC
         Zyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753342475; x=1753947275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hhouXegb79y02BK6iYK3wBNjYMyKvjwu4+H6U621d8=;
        b=KGMnlKdA5L7nGsXqSoH/298iuIohd2bKEZwPGpcHNsBGXiPNqTJYyvfY+Cf46hbM1j
         Kx3bQtaPIytrZWX9vn1mEcAVnQXUUXDPjrbMpMMtEiAb/isdPsLPn+yOTWivWjzzdjCe
         /L2xhmL2+Xj7h8L8s4EuEER7HJODeeKFfb87mbjoQHpzBXXfbvzg6IMDME4u59lCt1h5
         hRJ7cmTsTW3xyzJbLOwAwD1DBqqmJ8wDxRHTejcVkHPVHhYuKc91JF3lrHzt6zfsdM7K
         FtsXmVLvaicuYnctCESyjr7VvpGHWXDQ+HdG7fGhfQRE7tiOQJlF89nfnMeCZ7e5bYfr
         ZlXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/mLucCg+B/pbr+QsgAdgsz7RlQjUCtCOUcl3Tqjy1pVNwEqzVBJKWmTZQxSyCWY6UfhBd4nP1w50=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlRvk2R6o5lWERm2YJixQpT5skOtYUQySu2MDysy5coNiGzw56
	DvDH5BE/6FzLKY7BvNfzIuUncEatMmfTWW/5+FE2exQsY4kViRNAX58xQAziRn4dNQ==
X-Gm-Gg: ASbGncsiebvXM5hR/G8OfPdfgbOuAL6B8tero7FfTHwJFEZISDL37jNJErNloxAblrc
	sz4UjWv4+2pl8At0c1z9wc/kLpmytMEZYGCN9mgcVJRQeQ4TvH/jdY5KoCq8tF0ZciNB2LntFaD
	t9hjrqoeCBmGQzRanvusm86EyD6TTHDjvrjcPquWK22m0poq5s369gjD2AImZw4a3RO/ks4oKgP
	d4T7683w16QPJV/vc0PoOlNtNpmQaCFP7omC66Xxotqx2KDNhn+Fhj4V3yjA1algy7GsDoUFJK8
	ly10fcv/8VgS9x+VIGUIoPONUctPqvTZMx/cFgU0jXuiNwAPxMr0MTVwZNHCEsTwn2EnAaXP5Z0
	hqnVjhfk7/E9aDm+/8/dJWGE78F/C/C8aEFj/q9/DG/5FBv1Z53BO5mJ3yFRM1sgz+tKDWpyttn
	8LJuQ6bzFV9bQW3GZnkg==
X-Google-Smtp-Source: AGHT+IGKBUTlAlhjuuneaTMzD4fbzuKYEOMOI21wlxf9KDxYagH/Tnh9q7hv9+X+cBD2hVaYdn61ow==
X-Received: by 2002:a05:6000:24c9:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b768ef3615mr4441346f8f.37.1753342475524;
        Thu, 24 Jul 2025 00:34:35 -0700 (PDT)
Message-ID: <a5887585-0011-458d-beab-4a8592351935@suse.com>
Date: Thu, 24 Jul 2025 09:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] xen/console: introduce domain_console struct
To: dmkhn@proton.me
References: <20250723001116.186009-1-dmukhin@ford.com>
 <b819d729-8533-46a5-b2a2-480a70cda556@suse.com> <aIEowjUsuWfwqSzX@kraken>
 <aIGXrDdDHsOvH5rf@kraken>
Content-Language: en-US
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
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
In-Reply-To: <aIGXrDdDHsOvH5rf@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 04:17, dmkhn@proton.me wrote:
> On Wed, Jul 23, 2025 at 06:24:07PM +0000, dmkhn@proton.me wrote:
>> On Wed, Jul 23, 2025 at 05:10:04PM +0200, Jan Beulich wrote:
>>> On 23.07.2025 02:11, dmkhn@proton.me wrote:
>>>> @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
>>>>  static int cf_check hvm_print_line(
>>>>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>>>>  {
>>>> -    struct domain *cd = current->domain;
>>>> +    struct domain *d = current->domain;
>>>
>>> Why the renaming? (Iff any renaming was needed here, then please to currd.)
>>
>> It was requested earlier:
>>   https://lore.kernel.org/all/1ac74dd3-e0c5-43e5-9eed-c1a2cc17d068@suse.com/
>>
> 
> What would be the preferred way to address this?
> 
> Add `const` to domain pointer?
> `s/cd/currd/`? 
> `s/cd/d/` like in previous review?
> Do not touch `cd`?
> 
> It make sense to adjust the code now by at least adding `const`.

Yet only if the line needs touching anyway for the purpose of the patch.
Which, as it looks, isn't necessary.

Jan

