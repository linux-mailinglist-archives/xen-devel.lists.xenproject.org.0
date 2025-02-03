Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594EDA25F45
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 16:54:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880743.1290821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teylv-0006Rn-O3; Mon, 03 Feb 2025 15:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880743.1290821; Mon, 03 Feb 2025 15:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teylv-0006Pe-LC; Mon, 03 Feb 2025 15:54:03 +0000
Received: by outflank-mailman (input) for mailman id 880743;
 Mon, 03 Feb 2025 15:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1teylt-0006PV-MQ
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 15:54:01 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14f85e3f-e247-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 16:53:59 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaeef97ff02so728317566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 07:53:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab705a00b60sm543602566b.10.2025.02.03.07.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 07:53:58 -0800 (PST)
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
X-Inumbo-ID: 14f85e3f-e247-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738598039; x=1739202839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uKnKo3YewSna8tJAuHCL4LI92jIpxy0/12cpvJNE2o8=;
        b=FYfEkJGmCrrU+v6sasc+8+iqGtm6mgnkE3R5fDrJr7Q3CAL61VLD/RpGfn120YnSOE
         XHNZSxIfxojXmeuol6ic7AmzhG37gGegLA7IMVIpFyCF0SL/aM0gwGc22lMBmvHa1OkH
         lKn11MAKFUA/RtBFSoRUMpRjbcKDmDjBl/zrEkHi8CmNfXr+qUHJtZORLyQZNtbN68mE
         sCGCq9G2K3+EUvqOKgiRFVKyTyVzuRNU8XY4zatFiZCFqOcfNcr5LVIirx6sEp4hS8XJ
         vKEP86dT2nz+SZHsu6nLtLorSAUiy6kjAXqrN6WBktYiiA+UGzsDYMW7Ou+aCaTVyAvn
         ibjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598039; x=1739202839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKnKo3YewSna8tJAuHCL4LI92jIpxy0/12cpvJNE2o8=;
        b=pipbU7eZJErLP/lNgKW8smAlqI0r8gHeZwjqDSMdiL+dIqBESdh3o2+VvsSAESnFOk
         c7OgcTSUEkjsnK+mQ7x5w9Z4y0w23I5iGO+3fp0zi0mCw1BHnf2S6yjidMm6a9OTAAeF
         9k35XuC4pkTJWzpr6nl79/fYUd0WVxTTfF6+FVriM/f7xPz+lhAVVOaLFZyo01J5+ea5
         x4CvBDmrS5WR+cdx6dO4M/AQgA8nyfLAjr8H9xE05qSTt2ckcfy7EtBw6crwwmpvn8oo
         rF3UVSVcF1cVmHeM5vgxpdMQ+4Oorhsq0K9ku2Vl+uKWN5p/NmiI3Juk4XBkFQrbBLPG
         LtwA==
X-Forwarded-Encrypted: i=1; AJvYcCWPACU+WNz9ZITsnNrw8XPN+tpjq9DLbnHCMdfAl5ZWMvii1g5aVcCA7X2/ls3ZlVhG1u+zUZ4bl7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAo0+ZEOw9BUD6DHdJnN4lAQsDo5+HOOA2fBcJyONtEGAWGuJ0
	8ZLje8hROnhr1iZJu8ibNFs8ViZNJbaAPC2qXRcVfWya+dEPETPnDVv2njYMgA==
X-Gm-Gg: ASbGnctQNpTuc111elMM1adiKwQhcngdDHWuj4deAthf/NlVNSxgbgfD/B95e7k3YnD
	JdMK/PlegdSZ/ch1Vz3i0ARgu0oiJur4DGdb9twuS2s1QX96MpuUoGGLnnDDwIwjHLeLPJgwXtO
	EdXHAC5LmGmxsHcrtNEsS792CL1z8lyp+uIdAd29mGxA5Nq7/t+6PCtH/RmGJEKkYQ+x3AHjPCd
	55m0DV1WMw4ykCL/0b3IZtWJNG8CSQz4ZILWzOOSGyyInv+n62f6/0cnKYC6XBz0bngFtiYFJr1
	n8aj4YE+Jf+shv7t0UkXIM0ipMWKpnIga22q8pFJiqvOIfGyON1RroeWQlpyRjrIYXoYDq0KaWK
	2
X-Google-Smtp-Source: AGHT+IHhspVLxtLa8CXxWhNhWOnVVmsmKdZvKJDZgvc8+ZBL6XqET05+doidEiDTj5avMPzMpjc5cQ==
X-Received: by 2002:a17:907:3f1e:b0:ab6:fea0:5f14 with SMTP id a640c23a62f3a-ab6fea06b3cmr1436988366b.16.1738598038967;
        Mon, 03 Feb 2025 07:53:58 -0800 (PST)
Message-ID: <ceff513c-5074-4828-8718-5d1c2ae27793@suse.com>
Date: Mon, 3 Feb 2025 16:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/3] AMD/IOMMU: drop stray MSI enabling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <ea0fea03-6002-4fc6-86ac-19598c9d9ef6@suse.com>
 <cf5ae390-fb9d-4839-9423-d1ead9bd34bf@citrix.com>
 <14d1f7fb-4e4e-4f06-b3e6-8ab25de7f939@suse.com>
 <ad10a9d3-672e-443f-a7cd-c50df16b67b4@citrix.com>
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
In-Reply-To: <ad10a9d3-672e-443f-a7cd-c50df16b67b4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2025 15:19, Andrew Cooper wrote:
> On 03/02/2025 8:41 am, Jan Beulich wrote:
>> On 02.02.2025 14:50, Andrew Cooper wrote:
>>> On 30/01/2025 11:11 am, Jan Beulich wrote:
>>>> While the 2nd of the commits referenced below should have moved the call
>>>> to amd_iommu_msi_enable() instead of adding another one, the situation
>>>> wasn't quite right even before: It can't have done any good to enable
>>>> MSI when no IRQ was allocated for it, yet.
>>>>
>>>> Fixes: 5f569f1ac50e ("AMD/IOMMU: allow enabling with IRQ not yet set up")
>>>> Fixes: d9e49d1afe2e ("AMD/IOMMU: adjust setup of internal interrupt for x2APIC mode")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>>>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>>>> @@ -902,8 +902,6 @@ static void enable_iommu(struct amd_iomm
>>> There's a call to amd_iommu_msi_enable() just out of context here which
>>> was added by the 2nd referenced commit.
>>>
>>> Given that it's asymmetric in an if() condition regarding xt_en, and the
>>> calls are only set_affinity() calls, why is this retained?
>>>
>>> (I think I know, and if it is the reason I suspect, then you're missing
>>> a very critical detail from the commit message.)
>> Hmm, you did read the commit message, didn't you? That commit should have
>> moved that call, rather than adding another one.
>>
>> However, you have a point. It looks like 7a89f62dddee ("AMD IOMMU: make
>> interrupt work again") should already have removed that call. Prior to
>> that change request_irq()'s call (via setup_irq()) to iommu_msi_startup()
>> was in fact premature, as MSI address and data weren't set up yet (IOW
>> while still apparently redundant, the extra call served kind of a doc
>> purpose). Things apparently worked because the IOMMU itself wasn't
>> enabled yet, and hence shouldn't have raised any interrupts prior to MSI
>> being fully configured.
>>
>> However, for S3 resume I think the call needs to stay there, as the
>> startup hook wouldn't be called in that case (which may be the detail
>> you're alluding to). Imo that wants solving differently though. Not sure
>> it's a good idea to do this right here, or perhaps better in a separate
>> change.
>>
>> I've added
>>
>> "The other call to amd_iommu_msi_enable(), just out of patch context,
>>  needs to stay there until S3 resume is re-worked. For the boot path that
>>  call should be unnecessary, as iommu{,_maskable}_msi_startup() will have
>>  done it already (by way of invoking iommu_msi_unmask())."
>>
>> as a 2nd paragraph to the description, in the hope that's what you're
>> after.
> 
> Ok, not the reason I was thinking.  I was thinking it was an x vs x2
> APIC issue, and split setup path.
> 
> It is specifically weird to have:
> 
>     if ( msi )
>     {
>         if ( cap_xt_en )
>             ...
>         else
>         {
>             ...
>             amd_iommu_msi_enable();
>         }
>         // should enable here ?
>     }
> 
> If this call really is only necessary for the S3 path, that explains
> half the problem, but what activates MSIs for the xt_en case after S3?

The write of the control register where the enable bit is. There's no
actual "MSI" anymore in that case.

Jan

