Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7AA54806
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 11:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903330.1311238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8dI-0003pC-6a; Thu, 06 Mar 2025 10:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903330.1311238; Thu, 06 Mar 2025 10:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8dI-0003nI-3r; Thu, 06 Mar 2025 10:39:16 +0000
Received: by outflank-mailman (input) for mailman id 903330;
 Thu, 06 Mar 2025 10:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tq8dG-0003nC-Va
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 10:39:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3d7d0e-fa77-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 11:39:12 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso56883f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 02:39:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c10437dsm1649740f8f.99.2025.03.06.02.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 02:39:11 -0800 (PST)
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
X-Inumbo-ID: 3e3d7d0e-fa77-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741257552; x=1741862352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QrDyat/R5r1+UsvIKOnGMS5WhcUzG/+lQ+bIjDj6eRM=;
        b=DOXn2iB9ACC3N2u6Ijfok5xxY7EpnL/Q8BRcKSsnPRMeU9QOpqEJ1JLmvx/sf6cnP6
         1R7jxr4sz7dE/MgTuM6xnl4b3rhlRubh5CX4VimabPyg7dNkWYuc0WH3+AlKdUyvhLL6
         IKVGjEUD6IYkoJExr26KwaWvkeeMP58qLOU6xaR7rPSPNopQ2ZPmH3Y3tdQW0+7Y0gKz
         cd1e+0ea5r01i+zeNDIxqr1mou8FrL+75OBr/rraJV3ROrAyyGnUvxQJv3OiL/W4WjSz
         KnJ7RlLIzvzRJwDgq2vjoEo6JXQUPyssj3vaOaEOw+11ftA0y6MreMw1EYzg8mQvhi+X
         EirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741257552; x=1741862352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrDyat/R5r1+UsvIKOnGMS5WhcUzG/+lQ+bIjDj6eRM=;
        b=aWLF/pHoGjagHwEaxMOB3OFzg/7kN7A/UxRSFlGuf1jq7MDgiFC6hgEbeCWSnjxcIS
         LDTb0Kd+W9A210n9yMVV1BrFjCK75qra5VJel3BVHdEhWbbBj0X/s1a+Q8/5CdlEF4W1
         /WiiMIPo3V/6z8BTgh7LcRrI3HYOutCTAgEmL8Ee5m3UfeNA8cfwDM9fHoYvUh0BgBGd
         TELbwvzsENi6W41r8+g3vzar70hOjlUbWaxbjq829qfquF68ZwyYYjspBy+WoHZQynC4
         xmD9MsnjMHt6KjUaPH8kLcgyKeTn6xCqBSYn+PCacV90mB8MyL1zDI8Zh/5RQbP1cgU6
         4G1w==
X-Forwarded-Encrypted: i=1; AJvYcCWZNl34iq7i4LwIKxL4kJS0qw4JdvP1tOTE+Ppv5WU+cGqXmdwiCwZMCtCCexDBcZgSlNmPs7goLaE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8C6W1PRrXQQhMtTTIkWalYqoIokEP5IepJHtTaoHzUkKwCu26
	zwB1xMcZ9HGvnLCr0ukPnx6t4IuWiSkQj7+9Qe2lvQM7SKK65tWFn8ghtfnUFg==
X-Gm-Gg: ASbGncuwImh2djGIC7szAGqkXt/oRcWDs4WsSpQ1BeZrWtISrx2c7RObhHqHH6YmwGm
	HlfLng8cQzDkQ3rZbaHpGbdg0CBekUJbjzV2jjQGXjVi+ApQuzxxqiutZMXM07n5A0p/PqTAgQk
	W/XNA9G9Irbb0AHuCOm/xj96UFYSJJp7l8szNhJoMpHuALpyjMwQUzo5k+hFz31NEYMfDD6bJPr
	kf6sKCAwJ7WjYmfbWKOh2g6DeKBV07Dpcu4ceZyFU/oV3EDrNfqSH3QcnKU81+wuRKxI43NGYJL
	WfDe8D0LfjxSC5tx+CIqZ++W34bhFXyVK4EgE41DBx89PQnyLi7vJSmjaVFQ/KzUiklq5uvwIJU
	CJGnS98tdfLUKDbKIlIAmvGDiCDj4jQ==
X-Google-Smtp-Source: AGHT+IFM7OL2/BSzqViuLqhx8yI4WHKYomTHjbAq7wx9IlPJRHtL/ZNkuzeFOYIXJlAnTCkBnAp91Q==
X-Received: by 2002:a5d:6daa:0:b0:38d:e3da:8b4f with SMTP id ffacd0b85a97d-39129613fc9mr2304129f8f.0.1741257552132;
        Thu, 06 Mar 2025 02:39:12 -0800 (PST)
Message-ID: <e3645644-0649-4461-b9df-299315031c73@suse.com>
Date: Thu, 6 Mar 2025 11:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msi: prevent MSI entry re-writes of the same data
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250228113237.6116-1-roger.pau@citrix.com>
 <c06573d3-36a1-4146-ac3f-5dbd4d82d22e@suse.com>
 <Z8iQfwqmUm0PnAxI@macbook.local>
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
In-Reply-To: <Z8iQfwqmUm0PnAxI@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2025 18:57, Roger Pau Monné wrote:
> On Wed, Mar 05, 2025 at 11:30:51AM +0100, Jan Beulich wrote:
>> On 28.02.2025 12:32, Roger Pau Monne wrote:
>>> @@ -1407,7 +1415,9 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>>>          }
>>>          type = entry->msi_attrib.type;
>>>  
>>> -        msg = entry->msg;
>>> +        msg.dest32 = entry->msg.dest32;
>>> +        msi_compose_msg(desc->arch.vector, NULL, &msg);
>>> +        entry->msg = (typeof(entry->msg)){};
>>>          write_msi_msg(entry, &msg);
>>
>> Hmm, this isn't exactly a "restore" then anymore. That said, re-constructing
>> the message may even be more correct. Then, however, the question is whether
>> passing NULL as msi_compose_msg()'s middle argument is really appropriate. A
>> little bit of commentary may be desirable here in any event, also as to need
>> to clear entry->msg.
> 
> I can add a comment.  Note that as part of the patch a comment is
> already added to both the msi_compose_msg() prototype and definition
> regarding what passing a NULL cpu_mask implies.

Right; the comment I'm asking for here is to explain why it's not really a
restore that we do, but a re-build.

>>> --- a/xen/drivers/passthrough/vtd/iommu.c
>>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>>> @@ -1182,7 +1182,7 @@ static void cf_check dma_msi_end(struct irq_desc *desc, u8 vector)
>>>  static void cf_check dma_msi_set_affinity(
>>>      struct irq_desc *desc, const cpumask_t *mask)
>>>  {
>>> -    struct msi_msg msg;
>>> +    struct msi_msg msg = {};
>>>      unsigned int dest;
>>>      unsigned long flags;
>>>      struct vtd_iommu *iommu = desc->action->dev_id;
>>
>> Why not a similar transformation as you do in set_msi_affinity(), eliminating
>> the local "dest"?
> 
> It was more intrusive, but I can certainly do it.
> 
>> A change like the one here is likely needed in __hpet_setup_msi_irq(), to
>> prevent accidental "uninitialized struct field" warnings.
> 
> Hm, won't the struct be fully initialized in that case, by getting
> passed a cpu_mask?

Oh, of course. No idea what I was thinking ...

>  I don't mind doing so however.

No need to then, I guess.

Jan

