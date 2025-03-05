Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F3CA4F874
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 09:09:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901791.1309719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjoP-0008SV-RF; Wed, 05 Mar 2025 08:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901791.1309719; Wed, 05 Mar 2025 08:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjoP-0008QY-Oc; Wed, 05 Mar 2025 08:09:05 +0000
Received: by outflank-mailman (input) for mailman id 901791;
 Wed, 05 Mar 2025 08:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpjoO-0008QS-AE
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 08:09:04 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19409b62-f999-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 09:09:02 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-390df0138beso3377755f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 00:09:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b6ccdsm20160062f8f.46.2025.03.05.00.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 00:09:01 -0800 (PST)
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
X-Inumbo-ID: 19409b62-f999-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741162141; x=1741766941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EVnsiotWi6VMKlk2D+ZwbAfmRuq1u+3n6X58FAgmp5M=;
        b=VkplIpMQmU6rmiQr0fWrxJpW3Q+zoaRMfc3LE/nfyeOGsUdLsjhyEx6yFAgcOpfWk0
         5b+vnMHcillqf3B/Ngwi04zc5t/S9GEB9cS3SXnFGKuu42eNRcrh1mGwp0Yr+DBRYDsM
         r0v9TAHSaVql+6udWUs9+p6ILFSgMF7buFkIEOEG80lkp8p+0ADI/mAZuhXON00clu6x
         YVTxozYJsW3JATDzqdNq+JRljZM7/ll/Iw6/+OHcbL2DPV+R/4wJv0rCN7bbbU7Iub9f
         zQmZJgt2PGD9Xv9g8kTH+HINKNONcRdg7mRMYO7x8nKr7gFfSggbkPEOvtwllpEXD7M3
         H16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162142; x=1741766942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVnsiotWi6VMKlk2D+ZwbAfmRuq1u+3n6X58FAgmp5M=;
        b=Ie2fUtV69qycdF/45H4YjRonu0FhPxvmx4FuCkF8o17/AD8tSISbEfbgq3AfLYAya9
         oRrew+Mt7Fqlhw2Zg+FPg6bmQ6cDEmxIOXr1iCB9Ysf8uFAxziD5WNG+zDjd9snUaYQC
         BwGvxlinM/8dezmhhGJS7ssCtR+eI+MMDelOK1NM9yDAPVYSo9DJmnZVZeOFsBF4LGtN
         Wt4HuJARMRDrPMCANSypZ8MHzqathJKxz7aDoTvblalnnrg5u5vLblGckIZszOHszsq2
         6kKoMeddEE4p692+pd3qk3g3Keeuea7OiXNTpe+FfF1k58h2n79kT44vsOfLdHs6RkeA
         IMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9Mr0eBlLIq6TQo4isUovQRkve2phBmEBtuAcqdTmpQC6ptOjo+ySkXtgZrisvJ79ln4o42HswbG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzs2JLJu1kRxmOD4dpt60m/ZdSQCHtpWWWLMC1V9JOU4dSJxOWL
	7m7v+HtO/rHMHNNqW7ecn57DFV/CyARL0iB0lA9J6lKPI49oIpzKOu5i0m31zA==
X-Gm-Gg: ASbGncvdPgIOFu/KnkZc7cyuK0If0NlV8lyRlRXGP8La9mCrH9NWQz1nEwE8rRMfkvg
	eMgc/sy7u9StPZAtAJdj4dS59bVwWem1wkxor4a/qlxm2jrB1/YjVRDrGTVoOLgVFb0itep7djX
	wQKo1vj5lHGYHtai/wyIjskYBfaaCuyOs3TEiCfcjL8Q9yntzF7aBjKmPAG1jwJk0ooBfQGS1uH
	h0F2S3afLf223RqCXYDN6ebTof2+EqNgilscd/tzKoQleD/v3l85grz8J6Bv4MiC5RCTYL3UUMy
	zUgwkd5YIjOvuUvBdoL7IjqeK/rc6ZhTNoojvbzPhercf254DnmmWJoopAthbeUIrtHCeqVfsEl
	Oz4LB4rgOEJ74Ps5U2LFZESRCDqeIgg==
X-Google-Smtp-Source: AGHT+IHzThqBnrMv4k3ifpugnEys2MwHnOm8ndw99xKxrK+IbRUge4fipOy0EI9QXOgPq9DHE9VaTA==
X-Received: by 2002:a5d:4391:0:b0:38f:32a7:b6f3 with SMTP id ffacd0b85a97d-3911f7baf8dmr1203078f8f.40.1741162141628;
        Wed, 05 Mar 2025 00:09:01 -0800 (PST)
Message-ID: <3e982ad9-60ff-4e74-9f3b-ba3e8b1306f4@suse.com>
Date: Wed, 5 Mar 2025 09:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <5184725e-baf6-460f-a8ee-2bb9982d7adc@suse.com>
 <aea5703c-9392-4b80-b517-cc411265e264@amd.com>
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
In-Reply-To: <aea5703c-9392-4b80-b517-cc411265e264@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2025 17:49, Jason Andryuk wrote:
> On 2025-02-27 03:54, Jan Beulich wrote:
>> On 26.02.2025 22:11, Jason Andryuk wrote:
>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Just to clarify: Who's the original patch author? The common expectation
>> is that the first S-o-b: matches From:.
> 
> I took Xenia's changes to xen/drivers/passthrough/pci.c and 
> xen/include/xen/pci.h from an earlier patch and re-used them.  I wrote 
> the rest, so I put myself in the Form: line.

Unusual arrangements of tags typically call for some clarification in ...

>>> ---

... the post-commit-message area. In the case here the question arises
whether a different tag (Co-Developed-by:?) might not be better.

>>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>>> @@ -543,6 +543,31 @@ int cf_check amd_iommu_msi_msg_update_ire(
>>>       if ( !msg )
>>>           return 0;
>>>   
>>> +    if ( pdev->gvec_as_irte_idx && amd_iommu_perdev_intremap )
>>> +    {
>>> +        int new_remap_index = 0;
>>> +        if ( msi_desc->gvec )
>>> +        {
>>> +            printk("%pp: gvec remap_index %#x -> %#x\n", &pdev->sbdf,
>>> +                   msi_desc->remap_index, msi_desc->gvec);
>>> +            new_remap_index = msi_desc->gvec;
>>> +        }
>>> +
>>> +        if ( new_remap_index && new_remap_index != msi_desc->remap_index &&
>>> +             msi_desc->remap_index != -1 )
>>> +        {
>>> +            /* Clear any existing entries */
>>> +            update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>>> +                                               &msi_desc->remap_index,
>>> +                                               NULL, NULL);
>>> +
>>> +            for ( i = 0; i < nr; ++i )
>>> +                msi_desc[i].remap_index = -1;
>>> +
>>> +            msi_desc->remap_index = new_remap_index;
>>
>> You zap nr entries, and then set only 1? Doesn't the zapping loop need to
>> instead be a setting one? Perhaps with a check up front that the last value
>> used will still fit in 8 bits? Or else make applying the quirk conditional
>> upon nr == 1?
> 
> The code below here sets all `nr` entries on success:
> 
>      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>                                              &msi_desc->remap_index,
>                                              msg, &data);
>      if ( !rc )
>      {
>          for ( i = 1; i < nr; ++i )
>              msi_desc[i].remap_index = msi_desc->remap_index + i;
>          msg->data = data;
>      }
> 
>      return rc;

Ah, yes, I see now how this matches other behavior in the function.

> Maybe all the remap_index settting should be moved into 
> update_intremap_entry_from_msi_msg()?

That would require passing in msi_desc (or making assumptions on the
passed in "int *remap_index"), neither of which looks very attractive
to me.

Jan

