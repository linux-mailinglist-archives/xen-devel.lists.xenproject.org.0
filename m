Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E65AAEE25F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 17:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029211.1402980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGQ1-0002Ez-3C; Mon, 30 Jun 2025 15:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029211.1402980; Mon, 30 Jun 2025 15:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGQ0-0002Ck-WE; Mon, 30 Jun 2025 15:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1029211;
 Mon, 30 Jun 2025 15:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWGPz-0002Ce-UM
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 15:27:39 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0df0f64-55c6-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 17:27:37 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2656930f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 08:27:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c5a8csm84911635ad.223.2025.06.30.08.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:27:36 -0700 (PDT)
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
X-Inumbo-ID: c0df0f64-55c6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751297257; x=1751902057; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gdgBz53yUVWzqac2JXg0IjomNn13uCYwlDTXx52QPGw=;
        b=IWK1LhkZe1eAMil2n+5fRDb/p3ooBlgWNa+iHU9FpGPtlMQFZw9wreDexb/XQ0+Gki
         UqUG2boXme4YiV/KunsVne8TBPAHKiNdgFlAx+2/LTWXUZnFEsUaziMjuPgfxvC5cTqu
         XapmlHM9r5GVMwAxeTCaq8B+rsINrG8Pu3ixqm8n0ig34PLk5kytzc3vJt9gBbC+Z3Dc
         OZvUiG2/nGP+njgBxYI6ScrZuLdqc2FvF1q4KVfAwU939H8NUkcflDixYKuwRw8iSOSf
         M/O6mWvm4GozzyhXBijDP2iCFbFKrnHjCttLpI1BtPuCSTbyu7vgBQHv5xeX1AETEZOj
         0QCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297257; x=1751902057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdgBz53yUVWzqac2JXg0IjomNn13uCYwlDTXx52QPGw=;
        b=su127IUWRiZGAfNj+ENsLanFkk8gkK8QUjnjkcQzNMqoJ3fyAVT/x2Rway2URIBaw3
         Ef/N9+xWQVLbP8CbnPmh2dFnd7CGWjk+hn/Z0ARwCq7PHO6UZIdJ/Nszpa7kBrsQ8J6m
         7MZ9anvyXktTxpjEY7ko4stVGsGcaE5vNWqKQYUSjBl1b3EQEMKct5DHSVJvpyEpG1n1
         dXHquuiehaH3gIHkZMGZpSMFGNRhgLKqkXYM48h/cfXJchcFAH3nv5mrs7KnbJyRpV65
         /y0yxrzQSOCGq4gDYFT/DNlJx7NJb7BsIUSRQSyIxbAbUfurr5qVRXjhJzzKG2GMIWhp
         ry5w==
X-Forwarded-Encrypted: i=1; AJvYcCXwtNWe1q88LAIRNcXccifHtiQe0Tgwabt1YssEzAcGD3WQ26LwHg935s319QYb9ISosa9F5Nt5h2M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9OFaLe/lAZ3gmQTO5wokRvYGtTrHtlztSuHjm27jj6HsJrQMV
	LMkJompUQM0aU12BnxuQtR+GrtmI/mZIJoDwV4qnM/rsSTzUb5+oDCPD/FSrxT/6Lw==
X-Gm-Gg: ASbGncvDuQYd1tov16VbijLRJzMENbLGKRvuT0WXw+r5rBp1w3F1oSTA3yuDOC+qGXk
	bjqulm+wnYx7NUnzPANYvxhirdL+ENsGr/jYPhc6zmh/BxSirYNdhBY+gUcX9RmAxlDy8nBl0NT
	90xP+PQjPlOMcbT4OgTIXe9S1sGhEoLxE5S495UPbUpOGdxQr1RHZif3w4sx2bHL5G55cB8xyza
	A1SmeqscT7okWPQCy5cjc5sRchrvCOdX+vHrFe4+2tixKFf8bJORiU0jH8A/Oq1S8sY0cuIyjFT
	AJOi0OfF5NxuQA2bYcberXIs/mAqhaYuCcyk0s5vt78RE20XbdyM2CAiKtVKfzLTGLhTlPoKPnR
	Ct4Eou4RP3mk20mwmF4sKMPGJxft2SBcahdKFYW/ZTct/zh4=
X-Google-Smtp-Source: AGHT+IFsAiP1LwtgkrP4RJr/BDuSUrK0BPvKy64Iaqj6Q4um07Si0S3P6coeWWORXSY/crKvIkLKZA==
X-Received: by 2002:a05:6000:652:b0:3a5:85cb:e9f3 with SMTP id ffacd0b85a97d-3a8fdb2a73amr10286830f8f.12.1751297257046;
        Mon, 30 Jun 2025 08:27:37 -0700 (PDT)
Message-ID: <929e69d4-0377-4ecb-aaff-bff61f1a798b@suse.com>
Date: Mon, 30 Jun 2025 17:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros
 for type classification
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
 <8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com>
 <13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com>
 <2ebfaa8c-e0bb-4c5b-89e1-48d309ee4989@suse.com>
 <4b5c2a81-947b-4e2f-bb89-a4e776548e52@gmail.com>
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
In-Reply-To: <4b5c2a81-947b-4e2f-bb89-a4e776548e52@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2025 17:13, Oleksii Kurochko wrote:
> 
> On 6/30/25 4:42 PM, Jan Beulich wrote:
>> On 30.06.2025 16:33, Oleksii Kurochko wrote:
>>> On 6/26/25 4:59 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>>>>    typedef enum {
>>>>>        p2m_invalid = 0,    /* Nothing mapped here */
>>>>>        p2m_ram_rw,         /* Normal read/write domain RAM */
>>>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>>>> As indicated before - this type should be added when the special handling that
>>>> it requires is also introduced.
>>> Perhaps, I missed that. I will drop this type for now.
>>>
>>>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>>>> What's the _dev suffix indicating here?
>>> It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
>>> spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
>>> |using PTE_PBMT_IO for |p2m_mmio_direct_dev.
>>>
>>> Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
>> And what would the _io suffix indicate, beyond what "mmio" already indicates?
> 
> Just that PBMT_IO will be used for device memory and not PBMT_NC.

And will there (later) also be a p2m_mmio_direct_nc type? If so, I can see the point
of the suffix.

Jan

