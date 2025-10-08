Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE8BC5F19
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 18:06:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139992.1475158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6WgK-0006kD-UN; Wed, 08 Oct 2025 16:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139992.1475158; Wed, 08 Oct 2025 16:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6WgK-0006hC-R9; Wed, 08 Oct 2025 16:06:24 +0000
Received: by outflank-mailman (input) for mailman id 1139992;
 Wed, 08 Oct 2025 16:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6WgI-0006h4-UZ
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 16:06:22 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb978f39-a460-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 18:06:22 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b41870fef44so1489575766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 09:06:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652ade6esm1632305066b.18.2025.10.08.09.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 09:06:21 -0700 (PDT)
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
X-Inumbo-ID: bb978f39-a460-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759939581; x=1760544381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3X3GNsYuEt5SpapBddjvclxzYNOZ0wAYDKfIl86e9aI=;
        b=gyyC6hEnrZeV0rJvsnPG7GbdFtYeRkF+jXP8CWwiDzdE8by9N7NMTStW4B/AW9+IFh
         nSKWiQOrPJybtnhHlOPW1a2EFAkjav2WjYHYqRDRcUeqzNwYCSZG93PDhmPxxmMNPiPH
         hLoVRePmgpAlcVGANYbU+tQuGMWsHmUY6ZRfTaMjTo8FFiyP2wewTGOGl104RxpNYRXA
         Kv536aUJE7tS8i8u0Y4UXpwmYv/oEvR1yViboVG2GKb8iw0H56OpKADx+RyBe6hn5E43
         FVipBXM0nNCulbF5emDL/1/DD1wLu0NfuetI4YewUPlbVk4NI5fLNMUcj2SQMrZfeyAQ
         aVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939581; x=1760544381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3X3GNsYuEt5SpapBddjvclxzYNOZ0wAYDKfIl86e9aI=;
        b=pc8CKi0kSCotj8mFq1KaFd27emrVS8E7D85PHIRuKBxeQ3cDNuAb+ER3CG2lePrD6i
         ZazdOjkZ87XrSnfTnxEks9yxbtjh3BNsojmYVeSnv4SqeSHqB534RrWuGHKaudfxQ4DO
         ITcdJHii2rd2PY32TPbhjWkYUMteKczc5W9ZHhPQhRQz61cYu8N/Tf+O+/Olgququd27
         cq4cd7oMMg9pjetK1uCxKurLLEBFykmWqh4VcJ92KHPDDl3ZGVuyi0liofnITxTAXkni
         Piji31bvdrjx4mlgpTpilwen/pUnkos+KKLi5wEKyNd5KcsP+WiZvAKv5hNOZPx3i5RQ
         44yw==
X-Gm-Message-State: AOJu0YwR7+ECzKxF9l2TutJ6irwXahCb7D322Fxaw/Q4wtzf+KRAdZWB
	Wle8a07Iu6FW3fC9l5W4e53HVYkBDQ9iy0mxFMaZPm8l6cpJVHBy4MKD5u7S6opg6Q==
X-Gm-Gg: ASbGncuTppPdW42NE98n+dbUJaZQ4gGf4Fbvl/fGSOq0qI43TUDw4+zNZTpqvh0hG4O
	/+Mt7C3tIq5gWVPpes8PjHLSM04KeefUzlA6tnjXF5OXqESGSCbSoeYXMDJZr0LY4GrmoXTgG95
	8AzKTADsrcK+OtIgzTGyuBfbCuZlr2dNbh85W7mfsV/fAebICsS+XJgctHTLdMg4wnHy43yRF4V
	Vzk3oKXHQJON5jyfwsBu3qWVcpXI2ZLI+o9eg9fZWxl+CNCRu7GRTp1hIXRC7SHN2/k0WSPayXj
	SGL+7y1jwmkB6QRLag624TOXiCG6HpMDQcJ1CKJS3J6Cr1TtRA6Ss6EcP7olJfNS3MOA5shfMs5
	BIT207k8YSljSmM0bWv4EfGaxOCSIIe7h1ISw91H0IGMB44eaNU+5zLRRdPKR91fEnIah8CWa2P
	YZ13NagePjTnh7wGURknAVOt8bW4nQqT0=
X-Google-Smtp-Source: AGHT+IEkoojJsrzQGT6aLoZGR3tF6k4+W1exvfQH+J/5zoM9lyE9jSpfyLLj3mTlbzSo6x65yai3qw==
X-Received: by 2002:a17:906:f599:b0:b18:63b8:c508 with SMTP id a640c23a62f3a-b50ac5d079cmr392183066b.44.1759939581392;
        Wed, 08 Oct 2025 09:06:21 -0700 (PDT)
Message-ID: <7c403caf-192a-413b-9b17-d8e02c066727@suse.com>
Date: Wed, 8 Oct 2025 18:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 1/2] x86/AMD: avoid REP MOVSB for Zen3/4
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com>
 <485889ed-2820-4bb3-b450-88553dbb719e@vates.tech>
 <f42bb989-c9e5-43d5-82e2-9b6f95c008fa@amd.com> <aOZJDh9vwbcTwBIy@Mac.lan>
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
In-Reply-To: <aOZJDh9vwbcTwBIy@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2025 13:20, Roger Pau Monné wrote:
> On Mon, Sep 29, 2025 at 07:35:53PM -0400, Jason Andryuk wrote:
>> On 2025-09-25 08:18, Teddy Astie wrote:
>>> Le 25/09/2025 à 12:48, Jan Beulich a écrit :
>>>> Along with Zen2 (which doesn't expose ERMS), both families reportedly
>>>> suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
>>>> can actually be carried out the accelerated way. Therefore we want to
>>>> avoid its use in the common case (memset(), copy_page_hot()).
>>>
>>> s/memset/memcpy (memset probably uses rep stosb which is not affected IIUC)
>>>
>>>>
>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> With Teddy's suggested change:
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

May I ask for a release-ack here, seeing that it alters behavior that went in
close before the freeze?

Jan

