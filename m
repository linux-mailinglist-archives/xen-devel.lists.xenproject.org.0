Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD1B543FA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 09:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121553.1465787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwyIb-0000pf-6a; Fri, 12 Sep 2025 07:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121553.1465787; Fri, 12 Sep 2025 07:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwyIb-0000np-3o; Fri, 12 Sep 2025 07:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1121553;
 Fri, 12 Sep 2025 07:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwyIZ-0000nj-KP
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 07:34:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5f5b9d9-8faa-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 09:34:21 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so271179066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 00:34:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b33478e4sm303481166b.96.2025.09.12.00.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 00:34:20 -0700 (PDT)
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
X-Inumbo-ID: e5f5b9d9-8faa-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757662461; x=1758267261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zx+F00AEOde4cYO30/QXLuJvTThR4MJ7BuHCJG0MFUI=;
        b=M9///Qxh/Xvg9nwGUQ9P0j1snaLXMtixeC78QdzS4ZbqK6Wfte/kh/Uzee5a89C7it
         xYSRJwTvaoQNWQJ8BsHTCrxnMd6SaDJmdIdG3COzLUParxP6+B1oLTq75JlAEpJ0Cszi
         bLtQr3nV5GV7YonCIEONHeAcoUsZ/kvOHHGg0gPrki68Qq8WhXSVyYKOMvQ2ZfF1mhMJ
         Otj+QN8B6uapFL3pCRmjPtQJqYNNKXNDQciuZiBGOKUkRAAPb40ZwPShAiRFSBIycY/e
         sX99gJI6XY/yPcEVOWciv1aczfciNx/ZpdYeZpx8YQVOiVCfA3s9HD1L8ve/K+GCqRaG
         I/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662461; x=1758267261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zx+F00AEOde4cYO30/QXLuJvTThR4MJ7BuHCJG0MFUI=;
        b=LQpFg59KMeUfUekaFhm8nby7C6pWuK02PjZu7PNN+3KRboX+Ew9ugRkKo3ElV7ITXE
         f8BgZd+yD4BWZevLOElFftlfY10MTbkyq9gLFLXc9DjrO2oTgmyWdUi5M+eljJnNdAvr
         Uel95d+ERHYwuigiv+TfLJA31yLRAY1VmQ5qvo7rnOSTDXNdPhP0Ewia0nxvog5f+2dN
         51hu23atha3uzGUJ7QEdU1cXcETuSgfSGZ6wJhpw9KeRyKliAptoTzSCs8ycTy6N2z2R
         o9RVzHZqciIzgl1Q0FbkpDtTU08w0Yp5b+21+cnx2xWbItbDgDpQGrfx0GjsF/Il6vqm
         +aQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqIXTzqEJ8be8+VREyZpeDhcIFHTDkuUQ1OhKNVVBw9UQD3bMkWSChBKEIAfKPtatK6pOEjAP2CXE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9dULscJZMSexeM5FMbA712u7jnAuHHzggzrgqUUyI1QZLXxuB
	m8pkZwp2GHySuypXokauEgaqOWHzBAc/V4m/js/XPZzaacfsscPmMKLy/6Wr/jkMag==
X-Gm-Gg: ASbGncv7mGOodvN8GqqE6X5lWWHHTM/EtoZlTPsmjvagdL6bkN/Oys2J/ncqLYHOReL
	HXbDajDsWsPzRmxtfhxAvk9Zwnv7JewfOFz3DyYpOq4jDIsO9ok2DydBMKT5mqOuUo1krKKVMCd
	CWzdNLxIaWUgfDwE+coa8x+m4vW+2JqGkgsrGc0Sfki3DlEkOSnIhLndHVMAK6eJc0jihUr2Vu/
	wlTGdrWRXNl3fxQ+2sIodn9TNFYAflFaeHWm7KLagOCS+13js8wkpt5U+fLuAx22wfQtq8trGk1
	0N/QD4y4n0iuO/OwBTvYip7MqUaTjhJhnexIezgXPlvWRX95+RAbyGvOh5F44f/4xb+iPth2uAy
	TIF1uUxQqJg4WuKAC8/vj5pEos+3zZJiFJdjIrzAo3VFWkO3GQ7vR5tB8SzjcuL69dnEIRH2J72
	1JLLNyhp0=
X-Google-Smtp-Source: AGHT+IGC3n9FQ8CRAkQaABFzd2YTSR/FuqVCzRGdMdwEPElV45vHOx47uhzQlXJSwzMlZeVyoDy1RA==
X-Received: by 2002:a17:907:2d20:b0:b04:74d1:a561 with SMTP id a640c23a62f3a-b07c34d63f1mr215449266b.25.1757662460813;
        Fri, 12 Sep 2025 00:34:20 -0700 (PDT)
Message-ID: <17003bf5-4005-4ff1-8e8f-26bfe39e7e6b@suse.com>
Date: Fri, 12 Sep 2025 09:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/26] xen/domctl: wrap domain_soft_reset() with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-9-Penny.Zheng@amd.com>
 <4be69331-8002-47a3-a2e1-e34b12a5c5bb@suse.com>
 <DM4PR12MB8451D1EBF99396A526F05FB6E108A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451D1EBF99396A526F05FB6E108A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.09.2025 09:18, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, September 10, 2025 11:14 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
>> <bertrand.marquis@arm.com>; Orzel, Michal <Michal.Orzel@amd.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Roger Pau Monné <roger.pau@citrix.com>; Christopher Clark
>> <christopher.w.clark@gmail.com>; Daniel P. Smith
>> <dpsmith@apertussolutions.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 08/26] xen/domctl: wrap domain_soft_reset() with
>> CONFIG_MGMT_HYPERCALLS
>>
>> On 10.09.2025 09:38, Penny Zheng wrote:
>>> Function domain_soft_reset() is responsible for domain soft reset
>>> domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS Tracking
>>> its calling chain, and the following functions shall also be wrapped
>>> with CONFIG_MGMT_HYPERCALLS:
>>> - grant_table_warn_active_grants()
>>> - argo_soft_reset()
>>> - arch_domain_soft_reset()
>>> Wrap XEN_DOMCTL_soft_reset-case transiently with
>>> CONFIG_MGMT_HYPERCALLS, and it will be removed when introducing
>>> CONFIG_MGMT_HYPERCALLS on the common/domctl.c in the last.
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> ---
>>> v1 -> v2:
>>> - remove unnessary wrapping in stub.c
>>> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
>>> - wrap XEN_DOMCTL_soft_reset-case transiently
>>> ---
>>>  xen/arch/arm/domain.c    | 2 ++
>>>  xen/arch/x86/domain.c    | 2 ++
>>
>> What about PPC and RISC-V? They have the function in stubs.c, but not adding the
>> #ifdef there increases the chance that when the stubs are replaced by real
>> functions, the intended #ifdef might then be forgotten to add.
> 
> As we are addressing concerns on the v1 about editing stubs.c files [1], I removed them all in this patch serie. If they are considered necessary now, I'll add them back in next version
> [1] https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00135.html

Hmm, looks like I changed my perspective, previously not having taken into account
the aspect mentioned above. I'm sorry for the back and forth. And yes, it is on
the edge, seeing also what Stefano said. I guess I should say "okay either way,
with (now) a slight preference to also adding the #ifdef-s there".

Jan

