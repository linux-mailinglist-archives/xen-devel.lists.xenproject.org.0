Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D21A462EC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896745.1305499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnITU-000675-OR; Wed, 26 Feb 2025 14:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896745.1305499; Wed, 26 Feb 2025 14:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnITU-00065d-LO; Wed, 26 Feb 2025 14:33:24 +0000
Received: by outflank-mailman (input) for mailman id 896745;
 Wed, 26 Feb 2025 14:33:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnITU-00065X-6m
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:33:24 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a13f51b7-f44e-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 15:33:22 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43948021a45so60350915e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:33:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390d649cd17sm2247968f8f.79.2025.02.26.06.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:33:21 -0800 (PST)
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
X-Inumbo-ID: a13f51b7-f44e-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740580402; x=1741185202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N003K+9hDnrovQ5bRB8Jj9yTnxq5rkozzZmPwLUzscY=;
        b=ezOxFdE2ShjbjXPnbMiNd5D3okmva9VH4BAB7zrqp94/3pS+1VQgz6fK2eTTYBSHYl
         lfkRkE9KfY/1MaWUQOZm4yESIU/IHG0OotxXz2snPZmex3i82sOLtcMRi/XtBP7KKOtV
         lbmVBwvbEZljhENhbx9DXNuh30ebERuQKt/MP7RKablHwDwXPRdYbm/bE8EeVVFM2XIj
         3DWiY/4gPRznR2/fZ2oYWftO97EU3I6YjwGmFU4QC7KSJJ/1PdR1zrwru4oYRhwJbO8+
         YP4zUIDFLBDrWOOD7a6QzTQ7ObZZOTxoXszYLt0yW/5Vlj2935AEZL5tnsVVsYDAmbmT
         hzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580402; x=1741185202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N003K+9hDnrovQ5bRB8Jj9yTnxq5rkozzZmPwLUzscY=;
        b=j+lAV5dc3cSqINoeuUEVfQFnYooUXc96pOmLPb1o/CkmFDenAwJPriQ61BzExosynU
         fZUAG9h2Jnh6aKi920gmu6gj33X6umWUfByIsn+hd8KpI9RlJf7KGw4Y70rQYcRV8RKm
         jp+Zv3BcmcSOwaGmvcVBYGzYuTftDJYv9+IP7wrH50SNRhfm2DPAFvsRk0lod1oolaw/
         vJZQdupW1AYEAzvYNSdUquX8cfLYLh2H6wQ2b79J6+r4HC3HtX6+bcZWcy6EObEYVt+q
         sF4tzZPH9gtjmChMIh40qX787n8uCzppBUpdgnGojfwnBbOLuuj4AVNPLee7CIeiyrwG
         CbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuO/5fSV+xVCFe/StlgJFzYEGpVLNcP9b+7j55v+yi0G9MkJ3yBfRDpjRaNmUKnvNWEC4ph6/ZLZs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8B2ge+HoE4B4gg1cQ/FMYzHGli4nj20uV9BUpnKrrDHD1n5Dn
	IerZmu3mD8Fc0iCITJKMKNlkR9d6qHKWV0oekQBOxXZGDUeYYSYre4ZzD/rhZr5A0dcZuguY+ps
	=
X-Gm-Gg: ASbGncvJ6ljQsyIqQqploRKfzweAHkFStqKjNKNu4pr8z1rFoGqzrUF+YAG17jkmUv6
	B8mDmkrB5HmBwNZQq0WcEDgh2o6e/ZmzBNUaTyJ1aiDHmJlmsU2WMGdicNgLvHYIH6HUbJvdJnU
	egcHp+tLxSfk24Qcigbbtx/wFI+wEglyAyYrhVMtxDFJ3X/YcVE5K/l7MfXotEdK7JeKJQSGGO8
	PF9tfeAGvnOpmf36ie5z8wQ6yNFQ6jWEHKPao4J7xqzZ5CdeYtxlSTIGqVzrdirWFAxuqq08qbH
	Ewsam+ALozHCjaCO+2ZleYl5/KGFNpXszi5vsK8iT5YtAaHxRDAbQENfU0r1JRx10V2oHAugdTF
	HEQ5PLFrl4Ao=
X-Google-Smtp-Source: AGHT+IEdYSdWHMpNB29BmlJCA6Qj4J10yQ9f7+uXgsM3b6NugyfzjLMbkrXyUaaO3JRizQFDjHkt9w==
X-Received: by 2002:a05:6000:4014:b0:38f:2a49:f6a5 with SMTP id ffacd0b85a97d-390d4f3cab3mr3418813f8f.15.1740580401715;
        Wed, 26 Feb 2025 06:33:21 -0800 (PST)
Message-ID: <53c991a5-b398-430e-b94e-d7428c2b2c2b@suse.com>
Date: Wed, 26 Feb 2025 15:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20 v2] CHANGELOG.md: Finalize changes in 4.20
 release cycle
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250226104556.36324-1-oleksii.kurochko@gmail.com>
 <8ec1b722-3af1-4778-9902-0f3278e4309a@suse.com>
 <0f07557a-f340-4056-b8a0-5efe680bddc7@gmail.com>
 <b45c2acb-9d72-4de9-907f-ad2d0c7ac6bd@suse.com>
 <e801c975-0985-450e-ae6a-7659a78e862c@gmail.com>
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
In-Reply-To: <e801c975-0985-450e-ae6a-7659a78e862c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 15:31, Oleksii Kurochko wrote:
> 
> On 2/26/25 2:13 PM, Jan Beulich wrote:
>>>>> +   - Zen5 support (including new hardware support to mitigate the SRSO
>>>>> +     speculative vulnerability).
>>>> I'd also suggest to qualify Zen5 with AMD.
>>> I thought that it is clear just from the name for a CPU microachitecture: Zen5 which
>>> I expect to be develop by AMD. Anyway, if it is really better I will add AMD before Zen5.
>>>
>>>>    Whether to mention this here
>>>> when I think I backported all the pieces isn't entirely clear to me either.
>>> What is the better place then?
>> The question isn't where to put it, but whether to in the first place.
> 
> Wouldn't it be useful to highlight that Xen now supports the new security feature
> for mitigating SRSO vulnerabilities on AMD Zen5?

I don't know. Thing is what we list here is supposedly new in 4.20. Yet
here we're talking about something that was already backported to older
versions. I'll admit though I didn't check how much of that made it into
any stable release.

Jan

