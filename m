Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80592FAC7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 14:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758003.1167203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFop-0001Jc-MV; Fri, 12 Jul 2024 12:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758003.1167203; Fri, 12 Jul 2024 12:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFop-0001Gk-IP; Fri, 12 Jul 2024 12:56:11 +0000
Received: by outflank-mailman (input) for mailman id 758003;
 Fri, 12 Jul 2024 12:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sSFon-0001Da-8U
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 12:56:09 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 187899f5-404e-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 14:56:03 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so22233061fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 05:56:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b4389a37fsm7644663b3a.19.2024.07.12.05.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 05:56:02 -0700 (PDT)
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
X-Inumbo-ID: 187899f5-404e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720788963; x=1721393763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G4aFt0Musck3WKNmbrI2z1LEQYKwBW23x/e7j9ACrDA=;
        b=fMdw1G277aOopb3Tl4BYnIlfVGUnPwBjwprg1N3/zivCHyK3iuxkdUi7V/IiFm8NK6
         PpRMNvDBv8z8z8nw5PfcJzO387tkvBi0yIyYtV4XntR0sAZgVDv/t42Ryi+7U7BN3NLM
         ainzT/yiZKxKq383VwXeUEKiH5DKLASte28nQV9KM3qNz9Cw+frrykHKRatpzWyUIf7l
         ss6oD7gTadXUGcZ8KExeGx9jYDoy4J4Cp9DQgwcxQp24o9KDAj31s8a483FHmBIcqoLT
         ZQZJ/kuvSIL7UzRZBzboTjizpYagf+AdHkASfYFhvYoeKptN+uxGI563pbMg4DxHzQoS
         o41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720788963; x=1721393763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4aFt0Musck3WKNmbrI2z1LEQYKwBW23x/e7j9ACrDA=;
        b=mot/zswmndl+In+2I7cJ2K1JWHqQu4Bq6Q2GBaMI3GLTBLlw5yaaPtX541ajhG24r+
         lqHyWVUWbjitJfppL8PrUZmnwe+kNJIRkg1aTmkuNmEZNjJuTBDQm7OqKt/EgNNxVkSF
         gAHMjG45gkKMjRi6tvwg3qEZ1lL1HNNReB1TgvH8VGIxij8dFVjhRrx7n2yGCq+BgAdj
         O5Bx1utuLZdX2LJEJ3rSEZlEBM+aVDqg7uXa9no/Jac8/FwEB68YBKEUIgKAgv/BSho+
         XkfMN8Y60xkZZ26Vdz2YD6xBxK1AqRW1kdPVzn0Q3gSjG/aIguTJrvKb2bcq7MtZrWZE
         eldQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI/dbaJ+/RwiLI8XwRyDTDDKvR6GNCsciDqzg1IPmGcB3NoDwicBwaCiipT6BQFrVNhGh85I/fQRm+621N48vCN0sW9FoJz3ecyN2DF38=
X-Gm-Message-State: AOJu0YzcJGaZSdg1OcdwgRZGKy6gds0goLUu9dMJXb2h12LL5o5ysk+B
	0/LjHWi/5LEQvdsWT5VS9vDkiJBgbJYRbOwCNiTidY0dFnENema5mbkkVqw0Aw==
X-Google-Smtp-Source: AGHT+IGH96tnDdO6Rotdqz+o4EMITLscGJYzNQn0dKw/aMhekavZRKdNnGGaTwj96QvvYw+Zu6vXeQ==
X-Received: by 2002:a2e:9d13:0:b0:2ee:4ec2:8232 with SMTP id 38308e7fff4ca-2eeb30fd4d7mr79769971fa.25.1720788962880;
        Fri, 12 Jul 2024 05:56:02 -0700 (PDT)
Message-ID: <615bb7d6-4150-45d3-af4e-f2e6f212ebd6@suse.com>
Date: Fri, 12 Jul 2024 14:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v3 5/5] xen/public: Introduce PV-IOMMU hypercall
 interface
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <cover.1720703078.git.teddy.astie@vates.tech>
 <f9ae663df38acc0d330b7582dfaa7ac199746aca.1720703078.git.teddy.astie@vates.tech>
 <D2MYC4AEBUQZ.3DNOIV8LEE7F9@cloud.com>
 <1ece7ecb-7f35-4a1c-93f8-ee4191560275@suse.com>
 <46ba77ce-1b32-45cb-bfbb-70c6c0a21b0c@vates.tech>
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
In-Reply-To: <46ba77ce-1b32-45cb-bfbb-70c6c0a21b0c@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.07.2024 14:46, Teddy Astie wrote:
> Hello Jan,
> 
> Le 12/07/2024 à 12:46, Jan Beulich a écrit :
>> On 11.07.2024 21:20, Alejandro Vallejo wrote:
>>> On Thu Jul 11, 2024 at 3:04 PM BST, Teddy Astie wrote:
>>>> --- /dev/null
>>>> +++ b/xen/common/pv-iommu.c
>>>> @@ -0,0 +1,328 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * xen/common/pv_iommu.c
>>>> + *
>>>> + * PV-IOMMU hypercall interface.
>>>> + */
>>>> +
>>>> +#include <xen/mm.h>
>>>> +#include <xen/lib.h>
>>>> +#include <xen/iommu.h>
>>>> +#include <xen/sched.h>
>>>> +#include <xen/pci.h>
>>>> +#include <xen/guest_access.h>
>>>> +#include <asm/p2m.h>
>>>> +#include <asm/event.h>
>>>> +#include <public/pv-iommu.h>
>>>> +
>>>> +#define PVIOMMU_PREFIX "[PV-IOMMU] "
>>>> +
>>>> +#define PVIOMMU_MAX_PAGES 256 /* Move to Kconfig ? */
>>>
>>> It probably wants to be a cmdline argument, I think.
>>
>> For Dom0. For DomU-s it wants to be a guest config setting, I suppose. Then
>> again I wonder if I understand the purpose of this correctly: The number looks
>> surprisingly small if it was something the guest may use for arranging its
>> mappings.
> 
> Makes sense to be a guest setting for DomUs. I don't think this limit is 
> too small, actually it means that we can can map up to 1M of contiguous 
> memory in a single hypercall, in the guest case (e.g Linux), it very 
> rarely goes beyond this limit.
> 
> I put this limit to prevent the guest from trying to map millions of 
> pages, which is going to take a while (and may cause stability issues). 
> And to actually give a chance for Xen to preempt the guest (and keep the 
> ability to shut it down between 2 hypercalls).

Oh, this is a per-hypercall limit. Then the identifier is misleading.
Plus I don't see why bigger batches would need rejecting. They only need
breaking up using hypercall continuations.

Jan

