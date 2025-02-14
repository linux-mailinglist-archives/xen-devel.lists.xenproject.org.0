Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603AFA357C4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:20:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888399.1297762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiq0D-0006Nl-4i; Fri, 14 Feb 2025 07:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888399.1297762; Fri, 14 Feb 2025 07:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiq0D-0006LI-1x; Fri, 14 Feb 2025 07:20:45 +0000
Received: by outflank-mailman (input) for mailman id 888399;
 Fri, 14 Feb 2025 07:20:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiq0C-0006LC-5k
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:20:44 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32bfb55c-eaa4-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 08:20:42 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7ca64da5dso329532466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 23:20:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53231e04sm283292366b.28.2025.02.13.23.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:20:41 -0800 (PST)
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
X-Inumbo-ID: 32bfb55c-eaa4-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739517641; x=1740122441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UEgsYjI3OF+cEJb/ua4djCBTTOdsUQgIH0NTlD96UoI=;
        b=LOew6t3NHI8wrs96nS8PRxqbsz+gL6pTkHA/zMVTetKXA+trrMyjcSjob3pBbU0e3B
         pzScOoOUi+rMOzwlZo51Bjbau+erpkZ4FbIARFwFlWVhi540qnE1b1sLkzKsUcgtLvUQ
         v1oYUz33xCi+uVQvg8LWL5svJZ10SQRkMt3WIFQ/+1b+eJej1MQim2MKKS7S0KOMK1Ro
         iv7BwpHEXnsEKWgasDtAX0csZh20gE50mhhaK9FS7Gmxyof61oGYFsAFmr6KLVF9KK3w
         4Qm0fiMQ84pdEluZLIe8yfWAai3vrfXZ58D6L+7fmZECzuXM0mHf1OLvuvzi/8o54eMy
         4uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739517641; x=1740122441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEgsYjI3OF+cEJb/ua4djCBTTOdsUQgIH0NTlD96UoI=;
        b=R1Ki/CTbMuFsVQB0AQLLFqTp4xLMsc43DZq+TjXIwbyi5Yjs6jINYqYeOVliErJ06I
         4ZTLxE7x4jUVrYSPBK52uSv4oKLgyWdEjBrzrXiBHPckIf5/WaBOAu1+fi8tWh9wHUPu
         9nv3MESJ8CAi4H+qH3XLUxbkUGV+RfFBYXNQVMJBSwCTh05G81ohIrFJyXd/Mr4PpajA
         AlZrHcm8pNs/Q3BfhOQ/3CR+o3WVELyHvD1r0WK2LjHP4Zn3Fq8KUuTzbqaqc+Ae+qLp
         cPo2SoXvdJReXeu7i2Cfto57tyodUIcOFYhHnlSjdq2tQBpnJ4VP8Acw5t5HFQA9CpQG
         bJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXj86rejfcchDlDLcf5nx1L80OtVsOhj/SX72HdVRhTigyuF94zyj9IXiA3FhcogV/hRqTVkWppxio=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxgo2nV3c3IMOqLVJBkgfh3XgDYOClYBMnceLxCeamAeZceY2c0
	TUsvYnMZY8DZSSNi+JQ96aOO+yb4reagJS4Fldai+F2opAbWtLXJeNuoZQq1qg==
X-Gm-Gg: ASbGncsT4WK55nPgZghyzrI+QHFXNg1rbWK28EY/d5/ZYU1stTkURyXXK/i5pOX4OAj
	0COiDbx52l9tEVrL+61b9UilWq3x7L/x4T6UmgfEo8gNmQr8VJkq4eeMeaa3cAx4Javww+tkLXH
	QYmI5D/EMh3LPfQ2NYAkDpdPqCF93KgPXfb7eECsuDVwQM9uFYHqQiSkC1ZHnt95hQFRhUhBhcZ
	gc7ilybkMwfErErkteBsekrhiMEXZ8hFCEoS9u5nQUlNSBCF0MwuOD0L1+EC8+B1mC24MfLXsca
	R7gQgsykCDHCcYczZMmpke4PeVGNnfW/9dbN0bGi6lYsmYqn7wTZLwUh21SDAC+y4tDOuTPe+Uz
	7
X-Google-Smtp-Source: AGHT+IERlpJ/zlC4aJdLn5mZg/YjpMO4HfvONfrnT3G7RkRsnvODkbQW0DGcrZEWNa6g+nZkDEe+yA==
X-Received: by 2002:a17:907:7d91:b0:ab7:9101:e480 with SMTP id a640c23a62f3a-aba50fa0cabmr543655166b.11.1739517641429;
        Thu, 13 Feb 2025 23:20:41 -0800 (PST)
Message-ID: <7f174822-9016-40e7-96bd-5a1e1f7121a6@suse.com>
Date: Fri, 14 Feb 2025 08:20:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/mm: Introduce per-arch pte_attr_t type for PTE
 flags
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <2b7f3e29fc1790978e2f615ee634f3a84bc340c9.1738789214.git.sanastasio@raptorengineering.com>
 <5a0e26ff-21fa-44c8-a1b2-3775e3ba00d9@suse.com>
 <a6abb79a-6d98-4cb5-ba45-4530ea30735e@raptorengineering.com>
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
In-Reply-To: <a6abb79a-6d98-4cb5-ba45-4530ea30735e@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2025 00:05, Shawn Anastasio wrote:
> On 2/6/25 6:29 AM, Jan Beulich wrote:
>> On 05.02.2025 22:02, Shawn Anastasio wrote:
>>> Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
>>> set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
>>> represent architecture-dependent page table entry flags. This assumption
>>> is not well-suited for PPC/radix where some flags go past 32-bits, so
>>> introduce the pte_attr_t type to allow architectures to opt in to larger
>>> types to store PTE flags.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> ---
>>> Changes in v2:
>>>   - Drop Kconfig option and use `#define pte_attr_t pte_attr_t` for arches to
>>>   opt-in to defining the type.
>>>   - Move default pte_attr_definition to xen/types.h
>>>[...]
>>>   - Update commit message to reflect that this change isn't strictly
>>>   necessary for arches w/ >32bit pte flags
>>
>> I can't seem to be able to associate this with anything in the commit
>> message. The comment here to me reads as if this was optional (but then
>> for arches with <=32-bit PTE flags), yet in the description I can't spot
>> anything to the same effect. Recall that it was said before that on x86
>> we also have flags extending beyond bit 31, just that we pass them
>> around in a compacted manner (which, as Andrew has been suggesting, may
>> be undue extra overhead).
>>
> 
> Admittedly the change was subtle, but I changed the wording in the
> commit message as follows:
> 
> - This assumption does not work on PPC/radix where some flags go past
>   32-bits, so [...]
> + This assumption is not well-suited for PPC/radix where some flags go
>   past 32-bits, so [...]
> 
> 
> The softening of "does not work" to "is not well-suited" was meant to
> address your earlier comment and clarify that the change is not strictly
> necessary. Though as you and Andrew pointed out x86_64 is able to make
> do with the 32 bits, I would still argue that the hardcoded `unsigned
> int` flags type is still not well-suited to that application.

Oh, okay, fair enough then.

Jan

