Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67205ACEFCA
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006821.1386073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNACC-0000du-Ip; Thu, 05 Jun 2025 12:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006821.1386073; Thu, 05 Jun 2025 12:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNACC-0000bu-Fe; Thu, 05 Jun 2025 12:59:48 +0000
Received: by outflank-mailman (input) for mailman id 1006821;
 Thu, 05 Jun 2025 12:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNACB-0000bf-NR
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:59:47 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f45f7dea-420c-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 14:59:45 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-450dd065828so6920205e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 05:59:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf468esm119156305ad.165.2025.06.05.05.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 05:59:44 -0700 (PDT)
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
X-Inumbo-ID: f45f7dea-420c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749128385; x=1749733185; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj4NPeTAaASdQyIvyzzXr2FuA+MvXm7IOjjmkv/2ItM=;
        b=gfJUntxzyXfrFKv/w2elupzSngJqt7XmdzaVFZHNk0Nt5iREtgsfKY4YWNPK1Gt9/L
         79FIcnMobaWdBm7iwdFa5voYhAV11yrD7oy5mq8hOy5B34HX2EcUiOltOBxMyI5C/MoK
         BvFwGdtU1W6pW1q1NHTsV2DrUo3Oj1NhAJXvyQkT8gMtuBlEstLqGgrZh0jL8Mgxe3Zx
         CxI2S/aJk7TOZG4GClnLwhJTjPZxKEqQzy73ykU+RhPVIaRxSRp2r1n2Dxo1H8Jl/4he
         D3SSxUXF0TsDP+A4TJDdKysGhzJt09nY/vPSfxvyejM+Dc1PFRFh1XlPCQ8S87rOqJpB
         D+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128385; x=1749733185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yj4NPeTAaASdQyIvyzzXr2FuA+MvXm7IOjjmkv/2ItM=;
        b=l/+LPutw4zIiQq8y0YDCZGhp4OMnJjZbQmiWRYqizUhxLSadKJi/spR8FG4KyioXXS
         rNi8MQAhJg3HC9+68nQNDhZ5j4YU1AF3rC7YNGHqRrPbbzTgSyMHNbDgRanQ1PRWxnOY
         6grKBRcS7wHqEGo9n5yikzjp8hu9Bfcd+MVuj7wPNQ3uAjgKffdQ+uxrPpIHlnKlJ+SK
         nXbXEmGeOyMIsiSN+5HjuyX3mQg22Ccn4LwnSPyAOFGGML4MiOwk/Y0CcNBOGqkyGXB9
         EZLB0C+h3qHdNsbBGmZk44bzw0UUsAOm65Zmx+RHP+vCRPaZJQ+RDm0txdzSfNhChuK2
         pT5Q==
X-Gm-Message-State: AOJu0YwDFbhVIJl61r2hrdx/SaFsRYLcT5UOfd7bWNnI8rtrGsHTeHhM
	jbTB2U9h/cXKDprIeX6z2qLSVROdok5r3DOceYfAIhyYMpAezxKs9X3juu92qWG8sA==
X-Gm-Gg: ASbGncsuWksjDV1Kzzjs8ElTxTfOj2h8fsf61jqt8UYE8urd2G0sd1ABV//tHhh1xlk
	kzcn63otD877+ZZ7OBbIH5/ikHxAxjZSb8M6/e+fyAkZIzvl/+fD8kCHeT1/7kWB9wpuQryi4+w
	u+fW01ER1xKrOb6ahYilmsJIBuJzWNPbOHmgo/U0RbUQJddzFQLQ/2hx9BXp79CcniFrLWEMr3V
	85i8EcTtxL+SHY+atc8e5DaC+tgoxuSSDWw+ywX2IttAzW07MprMzcGct9og7HeWYv66+IjBIkY
	SGiNGyIBxp2SQ5ljB6aQNJ0gHQ/y1hb3y3m7tkCUWewGEq1cuabuNos6FRy/C297HvWL8oxpe5Q
	agrzyu2f19RDQb1QUmwrX8gFK7MtPRFImsJ7S
X-Google-Smtp-Source: AGHT+IEzeyHNuznvjgctLNohS/lDQw9Txuo1Bymnq5V3BprBvJai9znuzIDLH8/uyFUhOfXC3nHW+g==
X-Received: by 2002:a05:6000:4202:b0:3a5:1241:ce99 with SMTP id ffacd0b85a97d-3a51d92f980mr6138706f8f.24.1749128385097;
        Thu, 05 Jun 2025 05:59:45 -0700 (PDT)
Message-ID: <d3ae8cce-755d-4e5a-ba84-e588fa1e245c@suse.com>
Date: Thu, 5 Jun 2025 14:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
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
In-Reply-To: <aEGSp-LKerGb-wIW@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 14:50, Roger Pau Monné wrote:
> On Mon, May 26, 2025 at 05:45:53PM +0800, Jiqian Chen wrote:
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -36,8 +36,8 @@ struct vpci_register {
>>  };
>>  
>>  #ifdef __XEN__
>> -extern vpci_register_init_t *const __start_vpci_array[];
>> -extern vpci_register_init_t *const __end_vpci_array[];
>> +extern vpci_capability_t *const __start_vpci_array[];
>> +extern vpci_capability_t *const __end_vpci_array[];

These also want to gain another const, to match ...

>> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>   */
>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>  
>> -#define REGISTER_VPCI_INIT(x, p)                \
>> -  static vpci_register_init_t *const x##_entry  \
>> -               __used_section(".data.vpci." p) = (x)
>> +#define REGISTER_PCI_CAPABILITY(cap, finit, fclean, ext) \
> 
> REGISTER_VPCI_CAPABILITY() if possible (note the added V).
> 
>> +  static vpci_capability_t finit##_t = { \
> 
> static const?

... this.

Jan

