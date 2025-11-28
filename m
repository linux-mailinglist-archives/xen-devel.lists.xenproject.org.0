Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A4C91155
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 09:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174536.1499495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtQR-0004XG-Ud; Fri, 28 Nov 2025 08:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174536.1499495; Fri, 28 Nov 2025 08:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtQR-0004VF-Qb; Fri, 28 Nov 2025 08:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1174536;
 Fri, 28 Nov 2025 08:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOtQQ-0004V9-4F
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 08:01:54 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f8d8018-cc30-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 09:01:52 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso10124875e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 00:01:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c302esm8084811f8f.5.2025.11.28.00.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 00:01:51 -0800 (PST)
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
X-Inumbo-ID: 7f8d8018-cc30-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764316911; x=1764921711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GofCvdHTYm1fig0RwHSOy/pUnuheBVDTaE+KLpXbpKI=;
        b=MWi5JvrMiNbTDYm0oHTLrbbVovnICIZPCMGBWn7T0SxvK10Lel8TxRXiqjjXhkPtpn
         w0h+mGViNsvgB/wzy9t8u5Bo76dlplu6d1vaTVL2cbHI3jnxe9MBzBhtliwmE+z0Pvt0
         nozfXutVFY7tLVhfy/3fOxwaMqAcmdWjX2REM4vBY5LftKGJq2C0nkoulFujELD4V46B
         W1VLH040y81IaEKXdvkvjhXYKFgQU63TTmR6Al+pU7MQY6pwOouQ+Cv2cqJezbymyLqm
         DhwoyKUOP+Ci3yCWCsOijSxgjaEUPQQIkJeC+NfgCj34mrRkC+Qu8Bmvo8ax5nXEEnPj
         V7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764316911; x=1764921711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GofCvdHTYm1fig0RwHSOy/pUnuheBVDTaE+KLpXbpKI=;
        b=a7TLmyeqgRNfnFstI+8sjLECak06EDGu8hXGt0DKFCll3CL7UVGzz/JMTVw/3LDPaD
         cuiIwILXTcigE2Sx2hRHxa3thi1oVv3feRHg0yQK1h+mSTrh6XOFHQa8PCtPHIQT5ZYt
         6I2kO8JRLJ2FuWPJCM0L4vFOwZlGemJrph6nwIINOnZK4k/X09Ba6IT7sImxjCivefG8
         5EbJiGN0Nd/RmpMrjaa9YrEPrAejQ+mphG1EOH4SCxfFa2PSWzzvqPS+xd7Mn4rO4Rb7
         kzDTO4bHM7ElGgJ+uSfTybEjxUvSjuvcjnVSuDU3SoILHLXmGVn0h9hAqud9INNsWalg
         GcZg==
X-Forwarded-Encrypted: i=1; AJvYcCXOn8h/O1oJJrgK0rrRHRn0QMNq6vXxNP7qO5SKRwfQIwuoFlDzRzj3bELwPaJtrA432rEgXV7pGXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZxQFzvO4Lt1yczk+KQiLiPMObB4NH7ovSiJmg+PFug0zMRir+
	Zk+VCRWX+OQhqTY6fMPCgfYvet6eSaaw99U/TNHmX8Hwf9GMYw/3pJfCDIK61p+yBdzMiik7G1d
	xnG0=
X-Gm-Gg: ASbGnct474Zzo73zNHU44og0fEygpviYgZRWZ1inUuV6lUpZ2MfPLvzBRLt9m7nRESJ
	YwFi7DnKLq3GugDQA8qgovNGk/zsvTRytsbt7/8K8i78CKBp0j+T+UJJEa4t6IIHyWHH1A/BAAa
	b/uiewr/4GGHoKb7OYj0i4CIN0HXNZHpmPWmPXnB6Nc6jqdPjRiPpMs5A1mb/ThYwnK570Xp9LS
	7ZVL4uU2oJ/hVHSMGadoH4vmfrFa4rkbBLH8YU8XFpxMqczgBnpkF/+fyWRCoMpPOq3S0OK94Ud
	QhoIbLDU0bFhy0tOnsLUuHkuVgma0yQZ8CE5gwDSUQzuJGSDRHbyl8F3e0yMOrFBR5NYc5tFSOv
	CNBGDPnGjjkNKyb4tfWaLx7uhdcOjN+PPJc/+Nmj0YcwvyVZc8Ldg4bC1eorMYU2rUGSvJIYWFC
	PDK9Lp+Yz54UU6k/B4EPmBI96k57/ItMLhhe1BOXGoA0S3kKOfPkkHEjYoWhoDUgJveYeKpOPNR
	IM=
X-Google-Smtp-Source: AGHT+IFpV3HijyjScgIb2xp1kC85EBuaUKvsi8lfucpi9f5mK6vwpLo/ybjSpUuWVlcCcwxXG2HFEg==
X-Received: by 2002:a05:600c:1ca0:b0:477:75eb:a643 with SMTP id 5b1f17b1804b1-477c0165b4emr313760915e9.4.1764316911404;
        Fri, 28 Nov 2025 00:01:51 -0800 (PST)
Message-ID: <ab1c6b15-40c4-4c50-b539-ce1e9f36d968@suse.com>
Date: Fri, 28 Nov 2025 09:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251127221244.3747918-1-grygorii_strashko@epam.com>
 <802d2971-4cc0-46c1-bc24-4ec15c712118@citrix.com>
Content-Language: en-US
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <802d2971-4cc0-46c1-bc24-4ec15c712118@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 23:24, Andrew Cooper wrote:
> On 27/11/2025 10:12 pm, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> 1) arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
>> 2) add generic domain_clamp_alloc_bitsize() macro and clean up !x86 arches
>> 3) move d->arch.physaddr_bitsize field handling to pv32 code
>>
>> changes in v2:
>> - split on 3 patches
>> - move physaddr_bitsize in struct pv_domain
>> - make minimal style adjustments as requested
>>
>> Grygorii Strashko (3):
>>   arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
>>   xen/mm: add generic domain_clamp_alloc_bitsize() macro
> 
> These two should be merged.

Why? They're dealing with two separate macros / functions ("set" vs "clamp").

Jan

