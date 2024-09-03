Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C529693AF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 08:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788625.1198056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slN56-0004e2-9C; Tue, 03 Sep 2024 06:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788625.1198056; Tue, 03 Sep 2024 06:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slN56-0004bu-6e; Tue, 03 Sep 2024 06:32:00 +0000
Received: by outflank-mailman (input) for mailman id 788625;
 Tue, 03 Sep 2024 06:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slN55-0004bn-DV
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 06:31:59 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35ce75ff-69be-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 08:31:54 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f50966c448so56006711fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 23:31:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7c39bsm6103323a12.52.2024.09.02.23.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 23:31:56 -0700 (PDT)
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
X-Inumbo-ID: 35ce75ff-69be-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725345117; x=1725949917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uvsh2Mx8QNz4XvODCAYypmgvOx4/qSCbY0mPsfnMtfE=;
        b=eoydJRjZQNqKaZHMeElUmymTZBMgOodgCm3mD6MqsG+0RfdzipcQJ72A9VAz63EegE
         fVh2FO4mOv9Kwmxr4Qj25/0KiK6+n5zCn/F2Jj+wTj7THEjEmcEZgjj4Lo1UNwJE3QDD
         QOFqTrIQGkJRG7Sx3w6pYO/OFQ+57pi/ySm4slmGhQdK0GYrQOsCUCjZ5BNS4pMEA2SQ
         K37KgWnR+cSbtb6UDPXVzqZQ6/iEgyWOQhmkHsn/T/DGnwTxjSUXDICmGr37glh3wu1S
         VvwlTQyY7U3pvj+Dyi+PfmyLHWYYne2v7oHRvtGfCxPF7YyGxUhtbxBVN1M22YkXn0AZ
         dfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725345117; x=1725949917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uvsh2Mx8QNz4XvODCAYypmgvOx4/qSCbY0mPsfnMtfE=;
        b=NckTE7xbd7sgT53OWQelfM7VA3FNYg/gZpNwg6G9M60Uj6LM86DH4yUu36mvUbyIuY
         Cif9uj0DvKwxJ1wEgj0+TzFmPG0KS7IJAU+42MPEgcvTkVIUOFGqt3/1GGuG06QDMbOH
         sWLGpyPhERuElXIkpWVDfg0REMKQRuCjQHRPCF7N921r5gct/ASzlmjeeJxWaltb74Hv
         GfZN1hzuJi/rLuyS1ooZNW413NJeJ0xNrSH6An5wRF56m72sOJ3kReb8EUjxCvQPg2FA
         Hgj0nYhBETaBTL37EnHLhGHU4pYuMcI7MbQhc3Ht7bojPqIjizAVBJv7JVgeQnkSEpDs
         WWqA==
X-Forwarded-Encrypted: i=1; AJvYcCXjVuxDZUmG+MfXcBJYHNKa7yJkJgbzzZaF+zsZ4Dl7qsvARoWljMtitv9aa0eYLqbvInlRl/CAAZQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxrpq5EezJnaryEYOXfoFf0xnfUNIeosFrL8MYA5I2CsWi7VNcC
	ma87mBqRv+pP0HRbZDT8JITMD0ifORnhPUU1xcj2m75sbNo0lIUrOy1zMOuY9Q==
X-Google-Smtp-Source: AGHT+IHMhSVfSZpOEBCbY9WqednQQ25HCqO0NnuYhY/mNKe7zOgj/i6LhMiRIvYiN+IAc3MFOe6q0Q==
X-Received: by 2002:a2e:be20:0:b0:2ef:2b38:8796 with SMTP id 38308e7fff4ca-2f6104f2727mr134603191fa.32.1725345116566;
        Mon, 02 Sep 2024 23:31:56 -0700 (PDT)
Message-ID: <2f454b93-cf69-44f2-a1d1-23e328292d41@suse.com>
Date: Tue, 3 Sep 2024 08:31:55 +0200
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
 <29326771-8e5a-4bf5-86b9-971be5edab75@suse.com>
 <PH7PR12MB5854D96C51A37B384F0A022DE7932@PH7PR12MB5854.namprd12.prod.outlook.com>
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
In-Reply-To: <PH7PR12MB5854D96C51A37B384F0A022DE7932@PH7PR12MB5854.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 08:20, Chen, Jiqian wrote:
> On 2024/9/3 14:09, Jan Beulich wrote:
>> On 03.09.2024 06:01, Chen, Jiqian wrote:
>>> On 2024/8/20 15:07, Jan Beulich wrote:
>>>> On 20.08.2024 08:12, Chen, Jiqian wrote:
>>>>> On 2024/8/19 17:08, Jan Beulich wrote:
>>>>>> On 16.08.2024 13:08, Jiqian Chen wrote:
>>>>>>> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
>>>>>>> a passthrough device by using gsi, see qemu code
>>>>>>> xen_pt_realize->xc_physdev_map_pirq and libxl code
>>>>>>> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
>>>>>>> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
>>>>>>> is not allowed because currd is PVH dom0 and PVH has no
>>>>>>> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
>>>>>>>
>>>>>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>>>>>> iPHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
>>>>>>> So that the interrupt of a passthrough device can be successfully
>>>>>>> mapped to pirq for domU with a notion of PIRQ when dom0 is PVH.
>>>>>>>
>>>>>>> To exposing the functionality to wider than (presently) necessary
>>>>>>> audience(like PVH domU), so it doesn't add any futher restrictions.
>>>>>>
>>>>>> The code change is fine, but I'm struggling with this sentence. I can't
>>>>>> really derive what you're trying to say.
>>>>> Ah, I wanted to explain why this path not add any further restrictions, then used your comments of last version.
>>>>> How do I need to change this explanation?
>>>>
>>>> I think you want to take Roger's earlier comments (when he requested
>>>> the relaxation) as basis to re-write (combine) both of the latter two
>>>> paragraphs above (or maybe even all three of them). It's odd to first
>>>> talk about Dom0, as if the operations were to be exposed just there,
>>>> and only then add DomU-s.
>>>
>>> I tried to understand and summarize Roger's previous comments and changed commit message to the following. Do you think it is fine?
>>
>> What are we talking about here? 
> You had some concern about the description of commit message of this patch.
> So I send a draft below to get your opinion.
> If you forgot, I will directly send a new version(v14) later today.

I still don't get it. Yes, the patch could have done with a better
description, but ...

>> The patch was committed over a month ago?
> Yes, I sent this v13 in Aug 16, and sorry to reply late.

... it's simply too late now.

Jan

