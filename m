Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A742E9846B6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 15:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802876.1213279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st5Zy-0007hn-PR; Tue, 24 Sep 2024 13:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802876.1213279; Tue, 24 Sep 2024 13:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st5Zy-0007gI-Ls; Tue, 24 Sep 2024 13:27:46 +0000
Received: by outflank-mailman (input) for mailman id 802876;
 Tue, 24 Sep 2024 13:27:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st5Zw-0007gA-NC
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 13:27:44 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6f7d59d-7a78-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 15:27:42 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c718bb04a3so629784a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 06:27:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f33df1sm84526266b.43.2024.09.24.06.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 06:27:41 -0700 (PDT)
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
X-Inumbo-ID: c6f7d59d-7a78-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727184462; x=1727789262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W5uNLTHeCIRm8sH8i0m9/smkggBsoRhyH7JsTqMF+KA=;
        b=fDXSfatebbf+teXMfRAlp8qLR49mco3tHqa8yVWaVCAz3EhQsMdzk/5qMiTEgXPgHj
         u0JDP6yuiZE4+YhNEpR+iDM2T6DthMwwVcpZG+gfTt1Wj56ABN9B+Dto4P3mJZsuv3oN
         uN2plU81BeDf2gRLsW/hu1COwzM0yjMUhXS1nEE6TRp/cN9dEpeZe8Mo7T/xsBCdhBLq
         lqLEfgp2uvPwFKh073Z9DHdDZoudCQmg5C/NNteoDV0lkPxS1rDcvhIpaG++Hcszlyt4
         6Xg3niWI6nLe3uyohavSruCEJ9tUKFXCbq4a3K65gnYqs3zBvx0ivCvQBvhH+ATVPxA7
         sQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727184462; x=1727789262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5uNLTHeCIRm8sH8i0m9/smkggBsoRhyH7JsTqMF+KA=;
        b=AvWbO33x8G2kthLqgwRgPKNVq3JVW5/4K2UoumYIZ3pMjJeeu5rhPhlPACRVJaZ463
         dbuNcA0ze3/a+jeWWtxblJNvv6AjwksbhLK/R11Wnk7LC/CUD4sZFFwZAh6ykcTwzA7n
         3PRl1DBx9YqGEw8ID2a37mQoEMLYHJZzODl8n3I4kQMOyyD+ZcbTPrP2/pZEpadWxNsG
         iAosHoUDe9mFp1+YhCpAAmsG4Dg8GQ7jdz7pDvUkosNjD4JmgpJ8Zedf/7dczIRyapGM
         KxUnDGJGteW2iAkBg4txc0TNErqfbR8hNn/6Yyjp0TD4fxjQivP+fvVod5LV/DlpaqmN
         sjEA==
X-Forwarded-Encrypted: i=1; AJvYcCU9EIWB1dvWyqH8zjnxcizVbhgzq7mXQs4k/X19Mro2ZOo4jCa3VgnKHiWcy2dZQvU/oq6LpRDO5mI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrtP731mNsLXmfUFVnLSzBzXAkLctaXhWeBws+VJ8sOTQwsJrF
	XaR3iP/tcc0lnqfIoSAQP5gL+htFVw3iqAkYM5qAE/p1fbBT3Y1Hss+Fw/FqTw==
X-Google-Smtp-Source: AGHT+IGQFQPNAnU2Nlj2gu7r93HH6RArjpDxQ3JPC8jVlNmjmGIU/iXRaHmAC0Ac/1Sp7pkxmIIWWw==
X-Received: by 2002:a17:907:f7a7:b0:a90:3498:93b2 with SMTP id a640c23a62f3a-a90d55e1be5mr1315155266b.1.1727184462003;
        Tue, 24 Sep 2024 06:27:42 -0700 (PDT)
Message-ID: <d254de30-646f-4bdc-a21c-c8ec3faa8092@suse.com>
Date: Tue, 24 Sep 2024 15:27:41 +0200
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
 <ac8a299d-ec25-431a-aa56-d8a10ca1220a@suse.com>
 <CACHz=Zh_Cr_Qfpz4vntBZfZ-HqYGH+DspEAJkVmeBKMNk_z-_g@mail.gmail.com>
 <89208fd4-eef5-4bb3-b9bb-b1ee6cd0dfb0@suse.com>
 <6499c5bd-8f51-4be4-ade1-c89ed07710c7@suse.com>
 <CACHz=ZhN_de1T_JsZkFQgtAupSeF1hgWfKBsfb=xo3f3TRY-0w@mail.gmail.com>
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
In-Reply-To: <CACHz=ZhN_de1T_JsZkFQgtAupSeF1hgWfKBsfb=xo3f3TRY-0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2024 14:22, Frediano Ziglio wrote:
> On Tue, Sep 24, 2024 at 1:17 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 24.09.2024 13:09, Jan Beulich wrote:
>>> On 24.09.2024 12:22, Frediano Ziglio wrote:
>>>> 4- .rodata for some reason is not marked as READONLY, even on ELF you
>>>> get the same issue.
>>>
>>> I can confirm this oddity, without having an explanation. It must be
>>> one of the inputs; I've checked that prelink.o's .rodata is r/o. So it
>>> can only be some other constituent.
>>
>> That's from .data.ro_after_init and .data.rel.ro*.
> 
> That makes sense.
> On a similar note, what about .text? I mean, all sections are READONLY
> (or at least from mapfile) but .text is not marked as READONLY.

Can't spot anything for now.

Jan


