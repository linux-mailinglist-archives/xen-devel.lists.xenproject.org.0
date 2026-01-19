Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1ADD3A0FD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 09:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1207994.1520225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhkIX-0007pQ-5f; Mon, 19 Jan 2026 08:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1207994.1520225; Mon, 19 Jan 2026 08:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhkIX-0007mx-2W; Mon, 19 Jan 2026 08:07:41 +0000
Received: by outflank-mailman (input) for mailman id 1207994;
 Mon, 19 Jan 2026 08:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhkIV-0007mq-QI
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 08:07:39 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac8a6a2-f50d-11f0-9ccf-f158ae23cfc8;
 Mon, 19 Jan 2026 09:07:37 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so1983106f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 00:07:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921dedsm21454318f8f.9.2026.01.19.00.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 00:07:36 -0800 (PST)
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
X-Inumbo-ID: eac8a6a2-f50d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768810056; x=1769414856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=biZYjY4em3mzByOcXAuDU9PPHceEnfFUhiLm0j561zQ=;
        b=Wvp7ef+CNMJTNDiKx/4NdLCAHjT5jpTD+OVynXWXBUVixdsgaH8SCs96wExV38Z/q3
         cmBfmijtUoK3e6YfLei2csuhYX2WZn+4NOoB/56u4yj31pDtTg+C4LMP8ptg6byVvns+
         6sKwrSd19ndLJEoRdnCJkgh49549Z0tYRhpStL3O+EpT/uTRr35n/2GozPtRiSxvunk1
         dZAQRjR0GIISkIuumt7968SkJ5j4rzb6+cqFjxnuNffaq9tgwJsFfQ4xB5ygjGAY7C9v
         7j4W9X5XNVI1p0wrxAgbtX62VC+3oVrIAb5EM9KzeCQwwBg3rM0DRw18wR1OEw8aZRi1
         QTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810056; x=1769414856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biZYjY4em3mzByOcXAuDU9PPHceEnfFUhiLm0j561zQ=;
        b=fXayZnLO46wdohjhqWemTjul/mWBFWMWcOUk3xlerSi90ayaLRLcDRO/aguLFsyuh9
         Nj5yrpeX4IAYdVUoBD5kvkko5PRke/5ZcI7QDbigA9jk6uAS9a2GO6nTZ2HKq2dL+66q
         fYEQ0ACFVeN6HtmrShqX9VEMhVR7vtFqINWCPIG0HB49oxCUMjAkrHBU6T+dY336kHBu
         fLUqQ1gGUX4bVvzNBRY3rqK/px3POyPwcuNWYLJpvsw+Xie6j5oHvKIaLne5kRg4MyP/
         kFQqhDK2KscFxpV6/ocz0Cr735UNMIYK/d36nH9HHBaYMVjwXz4W7ysTRL5SXPT0T63t
         T4rg==
X-Forwarded-Encrypted: i=1; AJvYcCV3CzBc/A02O11jm9TvRWb9JNzUsL5GlwFkSFQfMSxreZZo9hD+IYi9f8TPeI/WICCiIPqT840o4fI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymNXQXG/dM94CKMvX7l+7VHp0vt3GIF0OjWjCxGhzaJeUC0wyg
	jIgkLTrvcBwBQFv9OMgTnPkKLJSjAeuxdmQ0CcRd/4L3TtUZ1Qek8zv9wY6BGurhIA==
X-Gm-Gg: AZuq6aKtOKKea9x+KLGGSYQJSlTX071HpDdruqDWHj8YFYQg/ibBx6bo/Ne3vrO5mES
	csx26ue1SBwheNNCWWo4pAYuaBRcgMTdppsqXh+DN0rViIttvO9GemRthzSHFVntgBfRVukMre4
	Sodg7/xD/epDpeYl8ciLxvDz5K8Bci+dyIWzRuqVUpNJTrV9cn5S3aFJPuH+kw/V8DiPnFv3tFR
	6Ar57rxUsEmWryrxnvCI++usBLj1iPgMAoWLnuREDQsFB9Dqe9TbBrPlTPITWgG4t+vYv4ioY2j
	Kz+h9C7MrpawPPKqmC168WqDyqvttQ5WEkMXdSvL2ZO5FlL81pwPcL/FwChWhYcwPnRQz93yoJO
	Nd+mckQJlUdc5gq7CN3BybWlzDzcDdYA9nD5ToeowgfxwGfUjabkkxetcOA5NLPTqyCoFRg22kh
	DfZtd2EOwrAnroUj+wzpzPwFaYKtch1+BMCm+CBXdTEr8ncqHBkSCLVMoR7NL9Xp8sPXqaMJJLz
	VA=
X-Received: by 2002:a05:6000:40e0:b0:435:693b:cbdd with SMTP id ffacd0b85a97d-4356a03033bmr12946363f8f.28.1768810056335;
        Mon, 19 Jan 2026 00:07:36 -0800 (PST)
Message-ID: <326ce1df-7e3a-4ba2-8530-98cd74994ee7@suse.com>
Date: Mon, 19 Jan 2026 09:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
 <ee4995bf385f0ec691151fb797e14acdb5419c6b.1768415200.git.oleksii_moisieiev@epam.com>
 <29c2d1dc-23fb-403e-bb03-d8c2f32424e6@suse.com>
 <a5d6caa8-d49f-4fce-a27f-d9097a8447ef@epam.com>
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
In-Reply-To: <a5d6caa8-d49f-4fce-a27f-d9097a8447ef@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2026 17:48, Oleksii Moisieiev wrote:
> 
> 
> On 15/01/2026 11:33, Jan Beulich wrote:
>> On 14.01.2026 19:29, Oleksii Moisieiev wrote:
>>> @@ -1107,6 +1115,15 @@ affinities to prefer but be not limited to the specified node(s).
>>>   
>>>   Pin dom0 vcpus to their respective pcpus
>>>   
>>> +### scmi-smc-passthrough (ARM)
>>> +> `= <boolean>`
>>> +
>>> +The option is available when `CONFIG_SCMI_SMC` is compiled in, and allows to
>>> +enable SCMI SMC single agent interface for any, but only one guest domain,
>>> +which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom and
>>> +SCMI nodes removed from Dom0/hwdom device tree.
>>> +(for example, thin Dom0 with Driver domain use-case).
>>> +
>>>   ### dtuart (ARM)
>>>   > `= path [:options]`
>> I appreciate missing doc for a pre-existing cmdline option to be introduced,
>> but: Why here (in two ways)? First, why in this patch, without it even being
>> mentioned in the description? And why in the middle of options starting with
>> 'd', when the entire file means to be sorted?
> 
> Thank you for pointing that out.
> I will add the following note to the commit description:
> 
> "
> Additionally, this patch adds documentation for the pre-existing
> scmi-smc-passthrough command line option, which was previously
> undocumented.
> "
> Does this look good to you?

Sure.

Jan

