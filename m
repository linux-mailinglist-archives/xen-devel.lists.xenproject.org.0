Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A647B0EA91
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053255.1421984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueSv8-0000TL-Sn; Wed, 23 Jul 2025 06:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053255.1421984; Wed, 23 Jul 2025 06:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueSv8-0000Qu-PT; Wed, 23 Jul 2025 06:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1053255;
 Wed, 23 Jul 2025 06:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueSv7-0000Qn-9y
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:25:41 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9dcfe60-678d-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 08:25:39 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso2916632f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 23:25:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6ef9aesm88647375ad.211.2025.07.22.23.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 23:25:38 -0700 (PDT)
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
X-Inumbo-ID: d9dcfe60-678d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753251939; x=1753856739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5V5HeZOqWHD6vRIJFSQOx8easJOmVNjONggvqaScJO0=;
        b=GtWTctQDwE5DKGBr8kSBSQnRhfgjJPLsjXKOv8rzwwz6ww4ieArvM36kO5COQIYSzH
         /Bi3tfP5Xx3/VlNxpQH4GDzFVPuHqSyyBu79meLZMKOz/r72Xn7TCS/stXgwBBhp3LOo
         uh9XhFe5yePokDTwrxI4V4eihmFzqclIQgVDd8a57APyHgv0MTklQzzaJ5iBYHGoM4v7
         tom7/u2L45iYUmXLcHUN9+iVRbXY5Vjhz807KpveN328capbX4IYjPkNcshaEdm4HVza
         w8vmm7jjcLb6awHFJ1TATpSDj4D7pnJs/zVgtm93YStaP2c7CaQutW2MHk17budl4HJY
         BIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251939; x=1753856739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5V5HeZOqWHD6vRIJFSQOx8easJOmVNjONggvqaScJO0=;
        b=Fko678SckHIl4hCgP6XtzWdhia7rNxt5GDg6iEUWLLVgaUE/i2UZCe+7HIujnnUgeE
         044Rn3Blq2cElx5sFq4E/VeLoh3tyRlVuvPIqX6woTr9+s36IPCicwRAszZa3XaJMhJX
         4sPYEos26s9W9OIojI2cmunFBdgRwGTYrwp6iSqRnK95dScaJwzd3VCrEju1dDoXY246
         QBIeR1KRPj4xauGZ08L/rZsaj/TtNCdXDq9x8ZNvvHvmvB3P1aKZ5rkPxZxeOKf65l5i
         rB/s/yvWLC/875Z3ZcU0/OZBg8SNjh2ZxULguz++8hm5WTRwI5p6Eft0QvZVdNkg3lZx
         cqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO0JuGag6YpDYB9+UfTgVfUSrlxyct8ANGMUQt3z1OOLK8FwCSmrQsHp+3PiPN9gfN2DZ+ZnJdvXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxn1PaDNgv+irzR46uBLSeRnypqImoLS76gtSpYBnZQ6ROQZRO9
	ML4wsu3/ye5fyQIPUvjtLLQLJz2nmbb2wEcB3TtPSOTfDnWzUybbyXkWxuHLWafNOQ==
X-Gm-Gg: ASbGncvdDBHsmd3BFd+hwKzo69BZclAmb3dbKE2/b5ldBcRqYxNfNiJbF74RYInSZUn
	BuoQ+iP2a6GnUPyhxBi3Ip/kc5RfBdilP1OAIYLNOxEUBwkpzm7eU70/csuQfrr6wCjf4FGzFGD
	aCj22Ldju6R/JAIyeW/h1MVUJgV0vnjAvUnrbNEOhaupEfRwoytdy4r1Cp/UGfwGzkLYu9HQPOi
	Zu/9JZ+lZKqp/8hO3F+njIFt/6X72jiKdDkLLFzQMzQ59Nnb8CwGzt7/lF3SInCnauLF7AZ1gbu
	GW0CVawlX5nYRTcZ4VqEpC7Epl6CqMuX0qPVZlKVj1gYQ15BC2mE5V8bsHOh8Qkq0jDAV1/MI+p
	Y00NSHzxRyhllOv/RW0sY8BtfdSZ/BO2nC1+MiEuX7+Xq2cBeKXqNrINjVEWM6HDV2rZJT+xWQE
	TsCxO0HdY=
X-Google-Smtp-Source: AGHT+IG5zAgAZRfVqMJoLee+UhoNyrsek2uUbnbHjJxoFmuoTzZXtTJPMgTE3Z+zYS5FCw7Gpa4fsg==
X-Received: by 2002:a5d:5d07:0:b0:3b5:dc04:3f59 with SMTP id ffacd0b85a97d-3b768f162b3mr1122752f8f.37.1753251938600;
        Tue, 22 Jul 2025 23:25:38 -0700 (PDT)
Message-ID: <bb99eba3-b4ca-4819-8ef7-d3804c2add60@suse.com>
Date: Wed, 23 Jul 2025 08:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <8e31d4dc-9f20-4af2-a814-d59a40e69fc2@amd.com>
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
In-Reply-To: <8e31d4dc-9f20-4af2-a814-d59a40e69fc2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 14:09, Jason Andryuk wrote:
> On 2025-07-21 20:19, Jason Andryuk wrote:
>> Expose a domain's capabilities - control, hardware or xenstore - through
>> stable get domain state hypercall.
>>
>> The xenstore domain can use this information to assign appropriate
>> permissions on connections.
>>
>> Repurpose the 16bit pad field for this purpose.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>> ---
>> v2:
>> Init info->caps = 0
>> Remove stale comment on caps field
>> Add Juergen's R-b
>> ---
>>   xen/common/domain.c         | 10 +++++++++-
>>   xen/include/public/domctl.h |  7 +++++--
>>   2 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index c347de4335..bb33b1f1c7 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
> 
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index f1f6f96bc2..136820ea5b 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -1269,8 +1269,11 @@ struct xen_domctl_get_domain_state {
>>   #define XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
>>   #define XEN_DOMCTL_GETDOMSTATE_STATE_DYING     0x0004  /* Domain dying. */
>>   #define XEN_DOMCTL_GETDOMSTATE_STATE_DEAD      0x0008  /* Domain dead. */
>> -    uint16_t pad0;           /* Must be 0 on input, returned as 0. */
>> -    uint32_t pad1;           /* Must be 0 on input, returned as 0. */
>> +    uint16_t caps;
>> +#define XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL     0x0001  /* Control domain. */
>> +#define XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE    0x0002  /* Hardware domain. */
>> +#define XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE    0x0004  /* Xenstore domain. */
>> +    uint32_t pad0;           /* Must be 0 on input, returned as 0. */
> 
> I have wondered if we should use some of this padding to start returning 
> the valid capability bits.  When the hypercall (and library) will be 
> ready in case the number increases.

How would a caller use that information? The hypervisor wouldn't return
"invalid" bits set. (If any such plausible use could be envisioned, it
being a stable sub-op, providing such information would certainly make
sense.)

> The other alternative would be to return the bits in some other call, in 
> which case this one would not need to change.  And returning the 
> unchanging valids bits on each call seems unnecessary.

Indeed. Yet the same interface could still be used (then perhaps also
to indicate the valid XEN_DOMCTL_GETDOMSTATE_STATE_* bits): Have the
caller pass in another special DOMID_* (DOMID_INVALID already has a
meaning, though).

Jan

