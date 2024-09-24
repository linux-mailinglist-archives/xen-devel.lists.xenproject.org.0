Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BB6984016
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802416.1212634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0hH-0003l3-Bo; Tue, 24 Sep 2024 08:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802416.1212634; Tue, 24 Sep 2024 08:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0hH-0003ib-8d; Tue, 24 Sep 2024 08:14:59 +0000
Received: by outflank-mailman (input) for mailman id 802416;
 Tue, 24 Sep 2024 08:14:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st0hG-0003iT-2F
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:14:58 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15153041-7a4d-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 10:14:55 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso3447566a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 01:14:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134b2fsm52471166b.204.2024.09.24.01.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 01:14:54 -0700 (PDT)
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
X-Inumbo-ID: 15153041-7a4d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727165695; x=1727770495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1nltF+iYdWCyNqLW5CK0h/Ed9zKdXBYP/NgiqNLsL8U=;
        b=es22W1udUAYUkNSNtm8cAj9IPYUoQXu+iSPYdnYte1WLQZZnuLqQ8tF8R65Q7vgauJ
         YIduJ72o/tIclJceL1DtKsZ6UjL13Cf7Q6PmYn7JA9vqMcAGrdn3lAjaMFFKvv3/NNbX
         wcvz041pq8zpWYF0OP2zBWWrK5ZxhzmhTREhSUUWMO+ZkTwYbS9qXJgvYk2rvvtScIaC
         p/QnLehFYnKlFyas6qBjV8gcUq+KhxpkF48dlAd1QCwR2JnfUfLweyxiwNQwzoMifYk5
         DDQnnNR3o1iK3FK7XarJNEJ0Wfx964VNrIz+Kgy8HzM78J0eJE15j615LF3Jq8BWBcNv
         UkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727165695; x=1727770495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nltF+iYdWCyNqLW5CK0h/Ed9zKdXBYP/NgiqNLsL8U=;
        b=gFpURTZlszCwqxz4aSA6XWWCPunaCXLrulDmgWT1yQnVjUR/dw+alCzREEN7p1/4DI
         nw/eDSsT4esEu+ASss4u6mb69qcODJyZeVv3mSAG0d6EHWOyGKfePEKby2M50UqJ+m2A
         wBZBL0EpDRSy82EoxXgp87xfzDaQp1Vgy4U6YmxZOtX9zUPSkAZTqvlgzFu57OI74mCc
         BZueyBYGdTC0zCjMfslNGIRf3fV+wrk7vvtO6d0KoR4sxrAoqv/LnTXs9WLZscCUscbH
         Oxyc1t5U3T9/p9Aw6InviATe1SILWIicydDgWwwxuW8RcY9AiUdiRT7QZyPk8//GPOTq
         qnhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYuis8zTFHZ/1kuRkFnFU1ys+vCMPTuhOAfp8i+OBAaxeTctESyF54V0QntKWbDf59uShG+HIy3GM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPkT4BlIjic8tzfpPF6iMrzsc4+bKsmXtilQKKpwwUIfM+hR2b
	X4KI+yK0z0ExJnk0z+0i9/cj5AiuJ3wFp1Pknd8w5Aatk9CUeitIgtNkL82ocg==
X-Google-Smtp-Source: AGHT+IEFhcQueHRxyVdfwGSWgHHeUi5pwnHZAXVIGUb871ayFvraYiYLY4Jyeof6htU/Rg3divGZkg==
X-Received: by 2002:a17:907:983:b0:a8a:43bd:a9e8 with SMTP id a640c23a62f3a-a90d5942de8mr1781970866b.65.1727165695126;
        Tue, 24 Sep 2024 01:14:55 -0700 (PDT)
Message-ID: <ac8a299d-ec25-431a-aa56-d8a10ca1220a@suse.com>
Date: Tue, 24 Sep 2024 10:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] x86: Align output sections for UEFI CA memory
 mitigation requirements
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-4-frediano.ziglio@cloud.com>
 <f928cf8a-e047-43f0-bf1d-c864d5d0e317@suse.com>
 <CACHz=ZiFyiSaihgTL_rSqfNNag761+1QyAhytQhn5zM6tOUSsw@mail.gmail.com>
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
In-Reply-To: <CACHz=ZiFyiSaihgTL_rSqfNNag761+1QyAhytQhn5zM6tOUSsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.09.2024 18:06, Frediano Ziglio wrote:
> On Mon, Sep 23, 2024 at 4:54 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.09.2024 10:00, Frediano Ziglio wrote:
>>> All loadable sections should be page aligned.
>>
>> What about .buildid? .reloc otoh is discardable, and hence presumably okay
>> if mis-aligned.
> 
> Currently, internally we have a patch to make ".reloc" not discardaeble.
> The problem is that in case of direct EFI loading, that section is
> used to relocated back to the final location. On bootloaders
> discarding that section, you'll get a crash :-(

Indeed, if such EFI loaders exist we have an issue (I don't think we
actively mark the section discardable, I think that's something the
linker decides).

> Isn't ".buildid" a kind of subsection with the same attributes of
> container section?

In ELF maybe. In the PE binary it's following directly after .rodata,
meaning it typically shares its space with .rodata's last page. (Aiui
in PE/COFF it is illegal for multiple sections to overlap, unlike for
ELF's "segments", i.e. what the program header entries describe.)

> Maybe I have BUILD_ID_EFI not defined?

Possible, albeit would be odd.

Jan

