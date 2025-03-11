Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F54A5B9ED
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907300.1314562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru9L-0001kn-Q1; Tue, 11 Mar 2025 07:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907300.1314562; Tue, 11 Mar 2025 07:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru9L-0001iK-M1; Tue, 11 Mar 2025 07:35:39 +0000
Received: by outflank-mailman (input) for mailman id 907300;
 Tue, 11 Mar 2025 07:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tru9K-0001Vl-J5
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:35:38 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c82f871-fe4b-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 08:35:37 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso14711755e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 00:35:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e308dsm17655323f8f.67.2025.03.11.00.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:35:36 -0700 (PDT)
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
X-Inumbo-ID: 6c82f871-fe4b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741678536; x=1742283336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kGsWQtDpgLa0d4S5XZcRuF+HN3RS5mibDDvd9XLAiNA=;
        b=Kf2VCb6ZdDoERe4YFer9ae1yBBKx97GGb+s+1E/t6ODvv4fBw8YFrr1/yssNrS8Yti
         1yswK3lpiJs4WvcnHxLJbfd8xQlaUMlz/PUOgrFTltKNh86TlJrj+dSxWhUe442aHiPh
         4Yhj0JJqJAhT0g3t7XlF4qiX4ZDkeh4QiTaQgxAnwicFD0CqBPSOIfZkRQoBoHabDmyM
         3HE60p6qzYG0bxnY6hCgnhh9s06QgWaAB5+FPzZzrfz7FGkcbwxfuEykDU6xNpmRdWaH
         BPUeON05LFqKNTEJXwvp32UO3scQIA+NihlSHG4GVrGdih5N+EM5wxRwh2BfJnfsveLe
         Ctjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741678536; x=1742283336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGsWQtDpgLa0d4S5XZcRuF+HN3RS5mibDDvd9XLAiNA=;
        b=GKgTUuN9zbv3kgilNz3A0+Z42BeGrEPMxmH9BN0D83QzEZVmpHeju9XTsJjIgBA0mC
         tPX8iE7MDB/KcQ7BCkwRtnfJwIuFd+Ki43Y+6pGDwM+RYCDsGVI9XPDiNSWJGPcRFejQ
         ECXIqjVmQgn2LkZ5c3bykNO2UjKdRUgSfjA3S+goP6jPbY59ZbjjnRKiZ2m8kdGPvVYL
         qPdVH+qkSJOfnBDc+ZeEE4J0kgipmK4vbbh0SnoImTwdm/0DpL4tGGRbROpMTHWiA5Mr
         psSN6VoMjxLQPAvduNwYi7pTmTY89ZXWrQEVQcKsoPGF639i87WUsvMKWNw3QG5yw793
         5rdw==
X-Forwarded-Encrypted: i=1; AJvYcCW4SiYLTtRbcAmD/NhBmIkcV7f3JQ2VjJHcH+NuxFjG6Vz5dTbCSDtecD5j80oZpH8uF+hlPsJmf/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL9hiKVf02XxqijVuk1NNNpC35mr2TXbT6vgjk/UrcQl5zXgrb
	v973MygeFG+u1e2e0bwleiIYFDYSwBwXIvt7YHHBMaRjtjJxyr/0o1Nu3FCpUg==
X-Gm-Gg: ASbGnctV7ZgqbPJhYxhgj+AlBaVG3vs675GNW2Ncj0tp/lYUFOLu9GpWLb+XeRsfV7P
	tPK8I/UcZgJL/lrMmFrT6xdoXNrLCyZ3yATd3UIxd7YE3t4a2BBqukQDaFHRLKj/tbI5qYupDXU
	tISPFpUPpyVcZE44kYXxIK3AodIK4uXmpaWV//Ijj9ZqJnPY8ezFiRQIb+TZlH1WlNNLsAnJsdD
	Ti2oXKCDDkYp1CQWBWelK9BAXCaWK5+V27ayw8d33Pf6WN8Y2IYPOLXsS9luEQQoIoUycaPzv/4
	7P7lsYmq9TKm3HpVRLJw5AgkbteGhyPE1dyAOxsJNdMiHKwvuRIkHSMTuh7y+o4CMvWS+LY6Un5
	EzF+P3RZ6p82Uim73a08gYATBzaUHGRP5jcbbH9U5
X-Google-Smtp-Source: AGHT+IFjmSUI/rQk4xDr3r0YuO6oC/w0D/d5iCJtAiz2aSaZ6kC9w81F25CRK2lrMvtYlLw+9TACkg==
X-Received: by 2002:a5d:64a4:0:b0:391:a74:d7dc with SMTP id ffacd0b85a97d-39132db7543mr12279245f8f.50.1741678536402;
        Tue, 11 Mar 2025 00:35:36 -0700 (PDT)
Message-ID: <804fd071-16d1-4703-b314-3ee3b8da4f6c@suse.com>
Date: Tue, 11 Mar 2025 08:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/iommu: avoid MSI address and data writes if
 IRT index hasn't changed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250310095535.46033-1-roger.pau@citrix.com>
 <20250310095535.46033-3-roger.pau@citrix.com>
 <507eef19-92ff-44ca-bd0a-86299949c03b@suse.com>
 <Z88Ib1ewzugJmepe@macbook.local>
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
In-Reply-To: <Z88Ib1ewzugJmepe@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.03.2025 16:42, Roger Pau Monné wrote:
> On Mon, Mar 10, 2025 at 11:51:09AM +0100, Jan Beulich wrote:
>> On 10.03.2025 10:55, Roger Pau Monne wrote:
>>> Attempt to reduce the MSI entry writes, and the associated checking whether
>>> memory decoding and MSI-X is enabled for the PCI device, when the MSI data
>>> hasn't changed.
>>>
>>> When using Interrupt Remapping the MSI entry will contain an index into
>>> the remapping table, and it's in such remapping table where the MSI vector
>>> and destination CPU is stored.  As such, when using interrupt remapping,
>>> changes to the interrupt affinity shouldn't result in changes to the MSI
>>> entry, and the MSI entry update can be avoided.
>>>
>>> Signal from the IOMMU update_ire_from_msi hook whether the MSI data or
>>> address fields have changed, and thus need writing to the device registers.
>>> Such signaling is done by returning 1 from the function.  Otherwise
>>> returning 0 means no update of the MSI fields, and thus no write
>>> required.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with two purely cosmetic suggestions and an only loosely related question below.
>>
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -415,7 +415,9 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>>>  
>>>      ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
>>>  
>>> -    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
>>> +    rc = iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
>>> +
>>> +    return rc < 0 ? rc : 0;
>>
>> Only tangential here, but: Why does this function have a return type of
>> non-void, when neither caller cares?
> 
> I'm afraid there's more wrong in vmx_pi_update_irte() that I've just
> spotted afterwards.
> 
> vmx_pi_update_irte() passes to iommu_update_ire_from_msi() the
> msi_desc->msg field, but that field is supposed to always contain the
> non-translated MSI data, as you correctly pointed out in v1 it's
> consumed by dump_msi().  vmx_pi_update_irte() using msi_desc->msg to
> store the translated MSI effectively breaks dump_msi().

Oh, indeed - it violates what write_msi_msg() specifically checks by
an assertion.

> Also vmx_pi_update_irte() relies on the IRT index never changing, as
> otherwise it's missing any logic to update the MSI registers.

Isn't this a valid assumption here? msi_msg_to_remap_entry() will only
ever allocate a new index if none was previously allocated.

>>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>>> @@ -492,7 +492,7 @@ static int update_intremap_entry_from_msi_msg(
>>>                 get_ivrs_mappings(iommu->seg)[alias_id].intremap_table);
>>>      }
>>>  
>>> -    return 0;
>>> +    return !fresh ? 0 : 1;
>>>  }
>>
>> Simply
>>
>>     return fresh;
>>
>> ?
>>
>>> @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>>>      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>>>                                              &msi_desc->remap_index,
>>>                                              msg, &data);
>>> -    if ( !rc )
>>> +    if ( rc > 0 )
>>>      {
>>>          for ( i = 1; i < nr; ++i )
>>>              msi_desc[i].remap_index = msi_desc->remap_index + i;
>>> --- a/xen/drivers/passthrough/vtd/intremap.c
>>> +++ b/xen/drivers/passthrough/vtd/intremap.c
>>> @@ -506,6 +506,7 @@ static int msi_msg_to_remap_entry(
>>>      unsigned int index, i, nr = 1;
>>>      unsigned long flags;
>>>      const struct pi_desc *pi_desc = msi_desc->pi_desc;
>>> +    bool alloc = false;
>>>  
>>>      if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
>>>          nr = msi_desc->msi.nvec;
>>> @@ -529,6 +530,7 @@ static int msi_msg_to_remap_entry(
>>>          index = alloc_remap_entry(iommu, nr);
>>>          for ( i = 0; i < nr; ++i )
>>>              msi_desc[i].remap_index = index + i;
>>> +        alloc = true;
>>>      }
>>>      else
>>>          index = msi_desc->remap_index;
>>> @@ -601,7 +603,7 @@ static int msi_msg_to_remap_entry(
>>>      unmap_vtd_domain_page(iremap_entries);
>>>      spin_unlock_irqrestore(&iommu->intremap.lock, flags);
>>>  
>>> -    return 0;
>>> +    return alloc ? 1 : 0;
>>>  }
>>
>> Like above, simply
>>
>>     return alloc;
>>
>> ?
> 
> I wasn't sure whether this was overloading the boolean type and
> possibly breaking some MISRA rule.  I can adjust.

What we are to do with Misra's essential type system is entirely unclear at
this point, aiui.

Jan

