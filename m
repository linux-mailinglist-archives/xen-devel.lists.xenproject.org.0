Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A0904F14
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739052.1145967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKAs-0006BS-1O; Wed, 12 Jun 2024 09:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739052.1145967; Wed, 12 Jun 2024 09:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKAr-00068i-UO; Wed, 12 Jun 2024 09:21:45 +0000
Received: by outflank-mailman (input) for mailman id 739052;
 Wed, 12 Jun 2024 09:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHKAq-00068T-LS
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:21:44 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f23a1c8-289d-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 11:21:43 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57c68682d1aso4940754a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 02:21:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6ef441b3d6sm662162566b.203.2024.06.12.02.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 02:21:43 -0700 (PDT)
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
X-Inumbo-ID: 2f23a1c8-289d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718184103; x=1718788903; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0hXpePDv78pKPWRABOaJqWPezG+KTeK8tT5jZ5ivkqw=;
        b=DbAV2o6h46cftDNhJoflhw/ytwR2LRNa107SwIZADJOCsTKWKJAs17fnYVXiQPohzE
         rCK3n1ITnBLY/U2vgEQi4uMNpndz4CD29dFhFdLSFIgMs33RZdfAHotId9e5khMOWT45
         Y11tzPsA4o3uARGV5JKz+v+CtD7IHqqFwbIMe9AOyznzfeQh6RII1lQWj64aaV99x2Ez
         +EUUksNlGqv9ZAAXBkslsvwHTaxH1HTOIFTUhnkG0CsH5Wf0y82DwLjUArV/vmVXnuVt
         9Ywh9WkP323feQgApbBf7JaoE0RQaoyiTnRrw8O+Ulwd0IVlyrREpU7+3c0O7qZ7cAo8
         pcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184103; x=1718788903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hXpePDv78pKPWRABOaJqWPezG+KTeK8tT5jZ5ivkqw=;
        b=tHWjede2zHmiu+Ey/JXzBf0LVmRPW4d34Sx40RzOlJEuTiiJMGcXC+Kg/6t8t6Y9hf
         NFMqNnh2lDpSNu526ZcR7bE5njRCeT5v+wiFn0hXNxovDaqHYAy92/m8XzSVEQarfNbJ
         i/A7WSaDSTF+mEoRBvK9IPp14ATSgXA1iguJq3Rj36ygCMI+1pckVvRe53OyaCf1DDUL
         slue8qw5C2Ucov46ziwvf4VSenJ86BsNzP7IA3upcagVJG2FhXAN8M5a7sw14JilpEKL
         gBiWEV148Bz7Q55pduwvsjam6o3kfMi6tDzblGTQdunTBJBcFIEN3jCt7THGS6aDTHZG
         /gew==
X-Forwarded-Encrypted: i=1; AJvYcCX7gpUqw+Gyhk2Tavh20gw0Cqwemyhn8NoFYb7KadKOxnQ4Z+MmHU9kqe+DvzlCq84yTGn90UMqIu09fwtVqDnhh2rytWKXJWA4SIRYZ+8=
X-Gm-Message-State: AOJu0YxwXWyN5suo23mJaam3PMfgboDGML2yGSIAZ3UnKGbj25uBIn8A
	5TUo2DCx3fykrTCEMJ8MzIX6tntxGbISGG6jdn/N/PNpz2ziaTlN3wwALqhhjA==
X-Google-Smtp-Source: AGHT+IFlBMLpFH8pD3tYHVMvpo5ztndrbzGLUqq3GPQlUaPbMwENZBudPm+MyvCT5AXk2yUM7mgcig==
X-Received: by 2002:a17:907:7e91:b0:a6f:1400:2e13 with SMTP id a640c23a62f3a-a6f47fd6f50mr87537566b.58.1718184103243;
        Wed, 12 Jun 2024 02:21:43 -0700 (PDT)
Message-ID: <5bb436a7-d426-4413-84bf-907615e12212@suse.com>
Date: Wed, 12 Jun 2024 11:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v9 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-3-Jiqian.Chen@amd.com>
 <efc35614-561c-4baa-9d94-d17ecb528a4b@suse.com>
 <BL1PR12MB5849B1B536BAD641C37A4308E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <41905257-e2e6-4bce-b723-516916448dfd@suse.com>
 <BL1PR12MB58493C065A5CA4FF2A9C03B6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58493C065A5CA4FF2A9C03B6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2024 11:07, Chen, Jiqian wrote:
> On 2024/6/12 16:53, Jan Beulich wrote:
>> On 12.06.2024 04:43, Chen, Jiqian wrote:
>>> On 2024/6/10 23:58, Jan Beulich wrote:
>>>> On 07.06.2024 10:11, Jiqian Chen wrote:
>>>>> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
>>>>> a passthrough device by using gsi, see qemu code
>>>>> xen_pt_realize->xc_physdev_map_pirq and libxl code
>>>>> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
>>>>> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
>>>>> is not allowed because currd is PVH dom0 and PVH has no
>>>>> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
>>>>>
>>>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>>>> PHYSDEVOP_unmap_pirq for the failed path to unmap pirq. And
>>>>> add a new check to prevent self map when subject domain has no
>>>>> PIRQ flag.
>>>>>
>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>
>>>> What's imo missing in the description is a clarification / justification of
>>>> why it is going to be a good idea (or at least an acceptable one) to expose
>>>> the concept of PIRQs to PVH. If I'm not mistaken that concept so far has
>>>> been entirely a PV one.
>>> I didn't want to expose the concept of PIRQs to PVH.
>>> I did this patch is for HVM that use PIRQs, what I said in commit message is HVM will map a pirq for gsi, not PVH.
>>> For the original code, it checks " !has_pirq(currd)", but currd is PVH dom0, so it failed. So I need to allow PHYSDEVOP_map_pirq
>>> even currd has no PIRQs, but the subject domain has.
>>
>> But that's not what you're enforcing in do_physdev_op(). There you only
>> prevent self-mapping. If I'm not mistaken all you need to do is drop the
>> "d == current->domain" checks from those conditionals.
> What I want is to allow PHYSDEVOP_map_pirq when currd doesn't have PIRQs, but subject domain has.
> Then I just add "break" in hvm_physdev_op without any checks, that will cause self-mapping problems.
> And in previous mail thread, you suggested me to prevent self-mapping when subject domain doesn't have PIRQs.
> So I added checks in do_physdev_op.

Self-mapping was a primary concern of mine. Yet why deal with only a subset
of what needs preventing, when generalizing things actually can be done by
having less code.

Jan

