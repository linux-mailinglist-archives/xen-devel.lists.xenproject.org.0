Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF143C8602D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 17:42:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172110.1497209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNw7E-0004cD-Mv; Tue, 25 Nov 2025 16:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172110.1497209; Tue, 25 Nov 2025 16:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNw7E-0004aO-KF; Tue, 25 Nov 2025 16:42:08 +0000
Received: by outflank-mailman (input) for mailman id 1172110;
 Tue, 25 Nov 2025 16:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNw7D-0004aE-11
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 16:42:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac96f926-ca1d-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 17:42:04 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so38197425e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 08:42:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7ec454csm33838855f8f.0.2025.11.25.08.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 08:42:03 -0800 (PST)
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
X-Inumbo-ID: ac96f926-ca1d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764088924; x=1764693724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G01p4XPaj5LCqNeolBfQC454Nxerj+9q94les8wtWng=;
        b=YQumJi1pIVbnbVPPi+PAdiDdxpZfAQm1Ncaq0KSQu550fnAYFhT4R7fD3XOLTyB6A8
         YnMoJiN7kaGx8xpq2jXoZ5X/vMKDnt1ciXiKjPypeGDEj7sLWSMiDNwOUe5OpxUmcEc4
         q+R3GGcaJuScUONASJw/MQPiTa8aj1EK7RJgIohx8o6f4cbH0ybO3BFj1zQzH7Z4N/Dc
         kq4iFCqCAwq7aSm9VWCato+7oOsopyRNxr4Caeu/knjt6GsEmbuWGfYo0A+EyFsQvsk+
         qE0GURC0IzEQoIbZwcIN0FSRSDeXlH3QmWacBNXdsoLogBNUzg82oxrqkMXUYFUvAFNT
         v82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764088924; x=1764693724;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G01p4XPaj5LCqNeolBfQC454Nxerj+9q94les8wtWng=;
        b=kJQzK8eGHx7RhlXQ/lGsJxF3E5wDFme4DHlvgLwTBQVZ43cuZxtvqDag1yWumt8CmU
         RGBNHXx8Y5oKoq52IB9U8tu1smcTuRql40Vzhn8uf6rkobWMldr6SALECdB7h3WsIjsV
         N5JYbGN1oqzNiJ3wC4hjXUqIzgHTnMxa57D5bnkytjN0ZTrM+L3ELSdE4RMSWVR0FJdO
         zg+sNZu7mjgv6BCXz3RAFaXCNpdmYQlVHiqgSOfkjPvb5FgBA5h4CpHQPd6/O9umpTEj
         6HxdzNzpaFEVrALlBVI4bjFjSaZaYRZa4/dqnNz+Ha5d/9cGTfrCng355ncj9i74DUX5
         5X1A==
X-Forwarded-Encrypted: i=1; AJvYcCV1kGBiQ/KVNOH0IkprXe1TiDPAWRxcql0mM8fejLvFxQUgzu2AtnrFfkfbRU8vdFMUTGFhkcRm4VM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtlQmO5Wh0Q1Z1uXjXiQ9neVE1boIL2MxYwvJteQzYEN1s4Yj+
	6eXH57wqmqvRogjn7MeUlthUtg7UiOZ9eqO0VzVRXjV0Daax6wbbQWuWeJbm94qb6Q==
X-Gm-Gg: ASbGncvSOzSS7gSH2QZX058D6uKAWma699F/xKq7bzNmUmIn7Nqrc5dEkmjH3RzAJYj
	xMBhem1grl2wXrcW3NcuvfPZyQBaxPZBUGzyo7EFOXxH+fMRU7mPyKuHTCLcB4VBeSqyQhxNiqT
	4EzsVwLMtIbht5K9uhcqQXFTodHWbvrqGVz2D1qCNy+AJBAEWNgNyBlK6E5fydR5P4c0rs1XZa1
	RsyCJnEPsLiIjFuw925r2GK73V04xEP+J2DY17dc8aerY3+DV1gdixc5fivHlAiL2XthaM77HwQ
	OUjbRUW9pV07fHP/p1dLIwztcVCxQbmTCXgtUIFmy2Au7ZGq7SJneKowWfGkbpA0urEU9TtdjLF
	w2Qm6Jt8+CVz1/9S6eHJPOjDZq0g6EvYCafEbn6G/vGy47qim+YbbqMGz/eAa+B7N3hlfwgXezh
	VwaupWmJ6+IWmgRoizujAqwAcEr2xynxqpRQCjXQR2e94J0pMCr+OEp75v0ihMbZkrZMXyIhYEC
	6E=
X-Google-Smtp-Source: AGHT+IGY+mejem5hggyKgRBMwpvVxkKT56m3TKMMR9iZtnQYxHu0x5U8wrlYOvHrLjUgUQzD/Gwr5w==
X-Received: by 2002:a05:6000:230d:b0:42b:3dfb:644c with SMTP id ffacd0b85a97d-42cc1cd9543mr16360142f8f.10.1764088924199;
        Tue, 25 Nov 2025 08:42:04 -0800 (PST)
Message-ID: <2046b7ca-cb58-447d-a5f2-9a073ca32058@suse.com>
Date: Tue, 25 Nov 2025 17:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/24] xen/domctl: wrap hvm_save{,load} with
 CONFIG_MGMT_HYPERCALLS
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-20-Penny.Zheng@amd.com>
 <13cded84-19b7-432d-a9b1-2b9ad9f83283@suse.com>
 <bdd2555d-4c56-44ab-b942-a4977dd50c48@epam.com>
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
In-Reply-To: <bdd2555d-4c56-44ab-b942-a4977dd50c48@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2025 17:30, Grygorii Strashko wrote:
> On 25.11.25 17:59, Jan Beulich wrote:
>> On 21.11.2025 11:57, Penny Zheng wrote:
>>> The following functions have been referenced in places which is either guarded
>>> with CONFIG_MGMT_HYPERCALLS or CONFIG_MEM_SHARING:
>>> - arch_hvm_save
>>> - arch_hvm_check
>>> - arch_hvm_load
>>> - hvm_save_size
>>> - hvm_save
>>> - hvm_load
>>> While CONFIG_MEM_SHARING is also dependent on CONFIG_MGMT_HYPERCALLS.
>>> So they shall be wrapped under MGMT_HYPERCALLS, otherwise they will become
>>> unreachable codes when MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.
>>> We move arch_hvm_save(), arch_hvm_check(), arch_hvm_load() and hvm_save_size()
>>> nearer to the left functions, to avoid scattered #ifdef-wrapping.
>>
>> Why would you move things? What is in this source file that is of any use when
>> MGMT_HYPERCALLS=n? The only caller of hvm_save_one() lives in x86/domctl.c. With
>> that also removed, hvm_sr_handlers[] is only ever written to afaict, which means
>> that's an effectively dead array then too.
>>
>> The final few functions ...
>>
>>> @@ -390,6 +391,7 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
>>>   
>>>       /* Not reached */
>>>   }
>>> +#endif /* CONFIG_MGMT_HYPERCALLS */
>>>   
>>>   int _hvm_init_entry(struct hvm_domain_context *h, uint16_t tc, uint16_t inst,
>>>                       uint32_t len)
>>
>> ... here and below are only helpers for the save/restore machinery, i.e. that
>> _all_ is also usable only when MGMT_HYPERCALLS=y. Yes, that's a lot of further
>> work, but what do you do? You'll then have quite a bit more code removed from
>> the set that as per coverage analysis is never reached.
> 
> I have a local patch which allows to disable all HVM save/load code at once by using
> separated Kconfig option SAVE_RESTORE.
> 
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -127,4 +127,8 @@ config VHPET
> 
> +config SAVE_RESTORE
> +    depends on MGMT_HYPERCALLS
> +    def_bool y
> 
> SAVE_RESTORE - annotates all HVM save/load code and, in general, could made a feature by
> allowing it to be selectable.

Oh, one more thing: SAVE_RESTORE, simply by its name, promises to cover PV as well.
That either wants to be the case, or the name may want adjusting.

Jan

