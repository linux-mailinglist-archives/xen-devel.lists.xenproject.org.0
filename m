Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC243C20149
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 13:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153652.1483946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vES65-0007QQ-0w; Thu, 30 Oct 2025 12:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153652.1483946; Thu, 30 Oct 2025 12:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vES64-0007NJ-U3; Thu, 30 Oct 2025 12:49:44 +0000
Received: by outflank-mailman (input) for mailman id 1153652;
 Thu, 30 Oct 2025 12:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vES63-0007ND-CO
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 12:49:43 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e76d1770-b58e-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 13:49:42 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso630336f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 05:49:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429ba445463sm2124807f8f.10.2025.10.30.05.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 05:49:41 -0700 (PDT)
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
X-Inumbo-ID: e76d1770-b58e-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761828581; x=1762433381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TeyZ2JdzBKdX0NE1R0CIjLrHVGSCOT81aUmKIfCLbRU=;
        b=P5RU+cFrHBbYAEVT2Dw4AEqTQT9RfmIchtccgMHnqZHMp1GApZpss2fZ0TxHBBBWzK
         ONiRRqJps3koMYLqWWh2TGxcDQRkyDwpof0EoK2sfl+pPxunkXfUyAoWSMH7m8iOZsBB
         AebUzw+F8dlEqp65G6Qh9pCSwfYaF+8eYnTatuQcR1wlCoF/2XTXyzcseJjccsELDBUl
         R6Su2Wd5/gbP0bgIVUyXo23es+FLu9btjDB3A/Ff4+pNEG0BK1BO6E0vNr2cWgVQStDZ
         zDhLZLlVoSn4+3oScwQbF93+AZ/NlwgR01maMxJmhEtpzKjsqMkvDuzG2amh/GH161Tf
         pM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761828581; x=1762433381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeyZ2JdzBKdX0NE1R0CIjLrHVGSCOT81aUmKIfCLbRU=;
        b=LBllz2roRBmHzRtOmuVznZFZBT/g4FBCADzB03FDJrrfjXfx+bTha/xf31UQn5sib4
         SGQ5SgqvGCoKezwzCkZIFtNx6ubR6+Sj3oMI9TEX49nqYkf6M2dAvDgiGfnP0u9cJA0F
         G6eM+PiCK3gPz/OwPGyoFH8f2is/9ZcA1HtXQFhl6t3kUEL/NQdHjM4nkan9l8CBu1KX
         PTTPr+uQ1g0c0qZOwVkRj0AOC4AYigGOLh4Ps+Nyx8VDT1CVK52dhTM8hNvURkKg4Ow2
         yvPeHJEaNsIG7mMYXffETPT8ivQ41ZjIcnMDqB8WgeE5movhlAaPoUytqr5uV+dvHUFj
         3uPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvTHoh4z0UsiUMdv6yie5DckFszZA7pzXeKDQ2BhvZTTMb1dCtbtJ7hRhg8v2303VUshMh4zQIIjk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6Y2lf4KlellESA/s16ASbAY1JynP2TlBO4lx4BB89gaonTzDM
	89WG+FVe5Axbk4iQ4x0kM30qb83ieAZwfr6MnGofOttBEzSDDb5mvxhJFBEgd0/wKw==
X-Gm-Gg: ASbGncssmW9QId6iHdoiMqaFFTBb89lf3E0wnUB5se3NoDR5v0SFCpjRWLxKJpDVBY+
	UqZ1U/6WOmUy22LKn108da3Nqu/eq1GJhXDLGQ+RTnDcapG1Z/0GxiKEDqI5M9sFtnUxXyk1jSY
	N/KwjuxXSf+bDtTdDumy2fOWG0jCTomdEmYJbl2B+4bYQ2uuHDrIcgRnMF/rFw1UbYapRjadIL7
	bYRB7S+8fLRtmwtAqFRezs2XYU2aahYx7l0PNDVYavXBiZwbwoDc1scnN/9zcQZ++SqjRoSF0Ko
	bPObZ866wOlhZ0GYMAipxTNxUSWyvkIsxOnQIeHn/y16hXxN464pjrSeb60Z5UlaAVnXjq75f6t
	s8w4X8rN2VDGwHSqSvLp/lqmpHQNRAM5I9elkZx9RVeJp2W37nh3eeoBXVzMfVQYwM/NwGGJTGR
	ypaKR1gkmNKzVvTsUIFz0yA3X/H7x+j79WngvLs/G3jR/trEv+kEXSQAqAe+1whBUzPUcVoJs=
X-Google-Smtp-Source: AGHT+IE0pJgZdTvWpec5Xv+Kkur/QPh3kdi5bro+8gif5jYzr6svrt4qiiKkwNsyawLdevq9YnHVWg==
X-Received: by 2002:a5d:64c4:0:b0:413:473f:5515 with SMTP id ffacd0b85a97d-429aefca81cmr5600457f8f.48.1761828581496;
        Thu, 30 Oct 2025 05:49:41 -0700 (PDT)
Message-ID: <5c0f84ee-a79c-45e4-adc6-4eb84685efe1@suse.com>
Date: Thu, 30 Oct 2025 13:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/3] x86/hvm: vmx: refactor cache disable mode data
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-4-grygorii_strashko@epam.com>
 <52395897-0e7f-4d24-8a28-0a303ff717b5@suse.com>
 <1a8eb5fd-f52b-4cdf-8dc5-f07d07d0daf3@epam.com>
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
In-Reply-To: <1a8eb5fd-f52b-4cdf-8dc5-f07d07d0daf3@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2025 13:26, Grygorii Strashko wrote:
> On 30.10.25 13:23, Jan Beulich wrote:
>> On 30.10.2025 00:54, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> @@ -46,7 +46,9 @@ struct ept_data {
>>>   
>>>   #define _VMX_DOMAIN_PML_ENABLED    0
>>>   #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
>>> +
>>>   struct vmx_domain {
>>> +    spinlock_t uc_lock;
>>>       mfn_t apic_access_mfn;
>>>       /* VMX_DOMAIN_* */
>>>       unsigned int status;
>>
>> Any reason to make this the very first field of the struct? It might better
>> live adjacent to the other field you move; there's going to be some padding
>> anyway, afaict.
> 
> I've tried to put fields in holes and checked with pahole.
> 
> With current change it is:
> struct vmx_domain {
> 	spinlock_t                 uc_lock;              /*     0     8 */
> 	mfn_t                      apic_access_mfn;      /*     8     8 */
> 	unsigned int               status;               /*    16     4 */
> 	_Bool                      exec_sp;              /*    20     1 */
> 	_Bool                      is_in_uc_mode;        /*    21     1 */
> 
> 	/* size: 24, cachelines: 1, members: 5 */
> 	/* padding: 2 */
> 	/* last cacheline: 24 bytes */
> };
> 
> It seems can be grouped like below?:
> struct vmx_domain {
> 	mfn_t                      apic_access_mfn;      /*     0     8 */
> 	unsigned int               status;               /*     8     4 */
> 	_Bool                      exec_sp;              /*    12     1 */
> 	_Bool                      is_in_uc_mode;        /*    13     1 */
> 
> 	/* XXX 2 bytes hole, try to pack */
> 
> 	spinlock_t                 uc_lock;              /*    16     8 */
> 
> 	/* size: 24, cachelines: 1, members: 5 */
> 	/* sum members: 22, holes: 1, sum holes: 2 */
> 	/* last cacheline: 24 bytes */
> };

Yes, this is what I was thinking of.

Jan

