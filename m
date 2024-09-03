Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A46969374
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 08:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788597.1198007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slMjc-0005tT-OQ; Tue, 03 Sep 2024 06:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788597.1198007; Tue, 03 Sep 2024 06:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slMjc-0005qk-L7; Tue, 03 Sep 2024 06:09:48 +0000
Received: by outflank-mailman (input) for mailman id 788597;
 Tue, 03 Sep 2024 06:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slMjb-0005qd-Jb
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 06:09:47 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1afe7f53-69bb-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 08:09:40 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a86a37208b2so559329966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 23:09:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891dacb2sm642108666b.183.2024.09.02.23.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 23:09:42 -0700 (PDT)
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
X-Inumbo-ID: 1afe7f53-69bb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725343783; x=1725948583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zwieCquunopa+UhOeg0fjj497W0+XcbbYKg6R2qn7gI=;
        b=arSZuH3ncekDmL9zzKMITxgNxNe/rFrsT3Mp8rZ92HtoPVAS7QWD6sIL3lT+gZI94z
         582EREJ2wBc59bqjj43w8UIPxXjtgOA+pwEFmfEvFNN/hN0z76FknobSp6yu9W9Odtac
         b+2FEVepT9FToDTAAHQs1q/vFojRbSOB+inaFAiPTKCazJybL0m0AIIPhdLmof/8Ljtb
         UI5XlTzvndC7QsYkuulCl3h1XBWNYImVepzvNSU7wCyHQdmXE18sLK/Z4COA+xzuHW9E
         8eaDYfCHh7ssVz6c7+yp+zuFhYh3qHsiVbuMQW71ubvyuOU3JdnxleP/1YEEG6vnxMDa
         8huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725343783; x=1725948583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwieCquunopa+UhOeg0fjj497W0+XcbbYKg6R2qn7gI=;
        b=JwJQbsOYoTryx7MziBhmk74vKgPKPnCozgeqq2LqwinZUqTyN3AmaKLElszNE9h2Sp
         BPHk5qzOOueMhMJuaKnQmlg20dic/KbrwMzA/nKw2Ms8m81WeBYA9ZeZA8IkW2+BYRk9
         3fyYkVZvNjj1g9SoXURVneiVjIj+JFvOvrrt5o7pWhs2E/dddojxF9wy3YU3cgX4GK60
         XcuLtlgFf7cwWs39dt3UWyr1V3slMIA1JgbsmMhjbf5sLkLRKQB7bpvlVMA8rI/7cxnX
         V8EaDXx1m1vtiEF6g+3f6i5noe1MgCsHHi5VlYwhgrPSzhUHEMecz90eg1H1ksV7TiAX
         H5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWa6yOriMe8uOXq6rJNDSYL/Lu9kpAWmbX8VfRpjXfbkh4lacaYyElWeIRcGgAeFuBEfkG9d1YJ9xI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8Ih636uRByMp4oMLwaiX63JZDTvmItsiEa6DvinGxzkL275el
	CCn5PYGD2Wv3u7xKJyfKAGeJ7nctjmapOH/qEzNZFYoGNBamx/9pwmIrfBOd7g==
X-Google-Smtp-Source: AGHT+IHn1/CAVSCPKW22yxYTlNQTH6LDWCEs2KIsMl4f0rqLxprC8a/j/G7RCewSr0uM1XA+SCmksw==
X-Received: by 2002:a17:907:869f:b0:a86:851e:3a2b with SMTP id a640c23a62f3a-a897f8bc9b9mr1357762866b.29.1725343783153;
        Mon, 02 Sep 2024 23:09:43 -0700 (PDT)
Message-ID: <29326771-8e5a-4bf5-86b9-971be5edab75@suse.com>
Date: Tue, 3 Sep 2024 08:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-3-Jiqian.Chen@amd.com>
 <4a421c07-d8a0-4af9-816f-5d76d39fe31f@suse.com>
 <BL1PR12MB58492B55B496755585774CB0E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <216ebf5e-75d2-40f2-bc79-65fe67e54bed@suse.com>
 <BL1PR12MB58490FB991A0851286858DE4E7932@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58490FB991A0851286858DE4E7932@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 06:01, Chen, Jiqian wrote:
> On 2024/8/20 15:07, Jan Beulich wrote:
>> On 20.08.2024 08:12, Chen, Jiqian wrote:
>>> On 2024/8/19 17:08, Jan Beulich wrote:
>>>> On 16.08.2024 13:08, Jiqian Chen wrote:
>>>>> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
>>>>> a passthrough device by using gsi, see qemu code
>>>>> xen_pt_realize->xc_physdev_map_pirq and libxl code
>>>>> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
>>>>> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
>>>>> is not allowed because currd is PVH dom0 and PVH has no
>>>>> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
>>>>>
>>>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>>>> iPHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
>>>>> So that the interrupt of a passthrough device can be successfully
>>>>> mapped to pirq for domU with a notion of PIRQ when dom0 is PVH.
>>>>>
>>>>> To exposing the functionality to wider than (presently) necessary
>>>>> audience(like PVH domU), so it doesn't add any futher restrictions.
>>>>
>>>> The code change is fine, but I'm struggling with this sentence. I can't
>>>> really derive what you're trying to say.
>>> Ah, I wanted to explain why this path not add any further restrictions, then used your comments of last version.
>>> How do I need to change this explanation?
>>
>> I think you want to take Roger's earlier comments (when he requested
>> the relaxation) as basis to re-write (combine) both of the latter two
>> paragraphs above (or maybe even all three of them). It's odd to first
>> talk about Dom0, as if the operations were to be exposed just there,
>> and only then add DomU-s.
> 
> I tried to understand and summarize Roger's previous comments and changed commit message to the following. Do you think it is fine?

What are we talking about here? The patch was committed over a month
ago?

Jan

> x86/pvh: Allow (un)map_pirq when dom0 is PVH
> 
> When dom0 is PVH type and passthrough a device to HVM domU, Qemu code
> xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
> xc_physdev_map_pirq map a pirq for passthrough devices.
> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
> codes.
> 
> But it is fine to map interrupts through pirq to a HVM domain whose
> XENFEAT_hvm_pirqs is not enabled. Because pirq field is used as a way to
> reference interrupts and it is just the way for the device model to
> identify which interrupt should be mapped to which domain, however
> has_pirq() is just to check if HVM domains route interrupts from
> devices(emulated or passthrough) through event channel, so, the has_pirq()
> check should not be applied to the PHYSDEVOP_map_pirq issued by dom0.
> 
> And the PVH domU which use vpci trying to issue a map_pirq will fail at the
> xsm_map_domain_pirq() check in physdev_map_pirq() .
> 
> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq. Then the
> interrupt of a passthrough device can be successfully mapped to pirq for domU.
> 
>>
>>>>> And there already are some senarios for domains without
>>>>> X86_EMU_USE_PIRQ to use these functions.
>>>>
>>>> Are there? If so, pointing out an example may help.
>>> If I understand correctly, Roger mentioned that PIRQs is disable by default for HVM guest("hvm_pirq=0") and passthrough device to guest.
>>> In this scene, guest doesn't have PIRQs, but it still needs this hypercall.
>>
>> In which case please say so in order to be concrete, not vague.
>>
>> Jan
> 


