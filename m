Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F37933B64
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 12:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759918.1169613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU2Al-0001MH-LP; Wed, 17 Jul 2024 10:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759918.1169613; Wed, 17 Jul 2024 10:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU2Al-0001J7-IQ; Wed, 17 Jul 2024 10:46:11 +0000
Received: by outflank-mailman (input) for mailman id 759918;
 Wed, 17 Jul 2024 10:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sU2Ak-0001Iw-3m
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 10:46:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c581b8de-4429-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 12:46:07 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a79f9a72a99so125151966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 03:46:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-78e32b6bb6bsm6144831a12.8.2024.07.17.03.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 03:46:06 -0700 (PDT)
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
X-Inumbo-ID: c581b8de-4429-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721213166; x=1721817966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Acttukhx9ScdudlRBkFYARuUBotTuMGgD1PLsipGU4Q=;
        b=Nz7cZCFlzlZvgkRx3JlfgxMY0X/N3LL5d0ORq3iT5dhbqz7uUp+6UHpLhO3W4YcjTA
         ssIIjgZA9SVqvuu6BXMRM/3jezk+wG3ddyLyMmEy4W1euno9n2n55csolE7gKQtkmtr7
         miiIGgz8/yu0A1mzanfS8VjuCJJ6JFYLF4Z/B2KWADaDfm4akoxxPqkNEncOkMPnZ4Po
         WojwqcJQlIMSeCD+ZWD+/9SqJZm51haZnWiy0b6I3a0SlWinRiKelSUMxJPztuSTO/TX
         SSVQeKV3h34GlMIlgPMj1k0b/fP0r7qpHZ0+03Nrr1eLf5Mjoyxxg7TUAU/0eukRG307
         mitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721213166; x=1721817966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Acttukhx9ScdudlRBkFYARuUBotTuMGgD1PLsipGU4Q=;
        b=AS5tTbBxo8VBwuBVjWY99N6lNtZCHIGAN3/k/p8hUKZwAkxPtN34TypZhXk4SmXzF6
         c23fX5S3GOHd+RrxwNGCfPMKtabAdYWr3DWMn2wddoM6p1U5XHQfmUR5hIh30U7NPSop
         DtpHSQHU2fc3cwSgmADyFtq2zWeB79JvTGpG7xtVW0UxClv/iR3xVCduIdMGY2HFEcaF
         rzuDoxBfgJDW//eEymJ/1Jqj++q0Zoyl/DZr3LWypwyL7oAKqwiFx5xQMkBLnvi7H0+r
         f9p8VCg/51zujWlnHG9qAheXwRJJZlEkGVXSIQuU2if7YcyA3xNbNa+1nn/bLYyUDvZo
         Z9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIz7lsPbUNAzy0tG4fVzaFe0q1VlKWLLQnapA0wmm447Xw2De6bbWIeVA6Eou4txtAc9vbOqcjO8JuFVCsxbAIW34nQi5BQo6W/PW/Qco=
X-Gm-Message-State: AOJu0Ywc2Ygb4pJkeUjtDtgZc8jozNMEgbBjQirlPiAzGqofFjEpJIDp
	wuAitmiDYIDKv8p+ISuoDWpW3hX/LinFmlq4GUuBKO5xTr+YMIWS4r6qkoctpg==
X-Google-Smtp-Source: AGHT+IGy9JH8MN2GH79Peavs3zzN/8WagHM+LT+Q8PzhH7xHsk5Wd+PpT3ks6lCNX7pP/rVDJrBPrQ==
X-Received: by 2002:a17:906:5658:b0:a77:db04:8ceb with SMTP id a640c23a62f3a-a79edbfd602mr455710366b.19.1721213166442;
        Wed, 17 Jul 2024 03:46:06 -0700 (PDT)
Message-ID: <1f7f7577-fbc9-4f80-a012-15f4889ffc4b@suse.com>
Date: Wed, 17 Jul 2024 12:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 03/19] x86/pv: Rewrite how building PV dom0
 handles domheap mappings
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-4-eliasely@amazon.com>
 <ffe6fbc8-fbbb-44a4-b981-b43f3fb48433@suse.com>
 <1fa5e786-c0fa-4dff-8085-608d7f983698@amazon.com>
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
In-Reply-To: <1fa5e786-c0fa-4dff-8085-608d7f983698@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 18:12, Elias El Yandouzi wrote:
> Hi Jan,
> 
> On 14/05/2024 16:03, Jan Beulich wrote:
>> On 13.05.2024 15:40, Elias El Yandouzi wrote:
>>> --- a/xen/arch/x86/pv/dom0_build.c
>>> +++ b/xen/arch/x86/pv/dom0_build.c
>>> @@ -382,6 +382,10 @@ int __init dom0_construct_pv(struct domain *d,
>>>       l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>>>       l2_pgentry_t *l2tab = NULL, *l2start = NULL;
>>>       l1_pgentry_t *l1tab = NULL, *l1start = NULL;
>>> +    mfn_t l4start_mfn = INVALID_MFN;
>>> +    mfn_t l3start_mfn = INVALID_MFN;
>>> +    mfn_t l2start_mfn = INVALID_MFN;
>>> +    mfn_t l1start_mfn = INVALID_MFN;
>>
>> Just to mention it here again: By limiting the scope of these I'm pretty
>> sure no initializer would be needed even "just in case" (really I don't
>> think they're needed even when the all have function scope, as producer
>> and consumer are always close together afaics; quite different from
>> l<N>start and l<N>tab).
> 
> I had a closer look at your suggestion and I don't think it is possible, 
> especially for l3start_mfn.
> 
> The variable, l3start_mfn, can get initialized in the else leg of the 
> first if statement along with l3start variable.
> 
> If you look a few lines below in the for loop, we call 
> l4e_from_mfn(l3start_mfn, L4_PROT) which assumes l3start_mfn is valid. 
> It could not be the case if we took the first leg of the aforementioned 
> if statement.
> 
> I don't think I can this easily limit their scope. It could work for the 
> others, but not l3start_mfn. So I can either leave things as they are or 
> limit the scope of every variables but l3start_mfn.

Please do. Limiting the scope of variables, especially in larger functions,
is often quite helpful. The one exception is certainly necessary here, I
agree.

Jan

