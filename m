Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174DEAF7522
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 15:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032124.1405879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXJhb-0006Sp-Pk; Thu, 03 Jul 2025 13:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032124.1405879; Thu, 03 Jul 2025 13:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXJhb-0006RO-N8; Thu, 03 Jul 2025 13:10:11 +0000
Received: by outflank-mailman (input) for mailman id 1032124;
 Thu, 03 Jul 2025 13:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXJhZ-0005VH-RO
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 13:10:09 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08bc3e52-580f-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 15:10:04 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so727534f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 06:10:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af540ae41sm17162869b3a.19.2025.07.03.06.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:10:03 -0700 (PDT)
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
X-Inumbo-ID: 08bc3e52-580f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751548204; x=1752153004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lVJOSI8Cv89n5Sv3hR1iril0qMBACDYETGGZlaxuffU=;
        b=EjVIBKdka34vXss4Y+jWvO9q5C1TaL6+cWdYQ6CZ/T9lEi266wfBS/4lnuBb8kiXgk
         dpr1NuDXKr7ZGGR4U9mI+6awfD1ZHauB6Rqy1fcg3e+UzYjsQ4oaT/THh07XzbjvtJck
         1cXKemlhcO07Dhy+3tHtxf99C/Jg06Sc1mc49EkwkTuluYfD9Dsm4Sr9lDQMmUxdR3uT
         JcF22pg/QkEUaDFaZq8E03P/fthkCHEN+Lz0n7coy6YG6JZZrbRkBxAHwL5xA5EJPm7n
         Yo3FKQdyRr2rh0Px89RibECUaToPq5GPnKNZC0XxBxli5AWyc1z1F5E0keok1MzO2udl
         jfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751548204; x=1752153004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVJOSI8Cv89n5Sv3hR1iril0qMBACDYETGGZlaxuffU=;
        b=lkhJnof7/FWSTwzQUlU6EPm4PXDvdP0bY7XdAhThNoHSdYlaqLw5ofV594wziOeN8c
         iuqjOxQJmUjuQBU0ZlyDSv86o/UBXBFZVhXDm+P3WL5MVVFDxhqESgAylr4zM5Q7yLr8
         14NMF0NCNcSxYYY5U8RJ78j4lkNcF07Bi5hd6MqrviRWosoSQYeZsK3L6MBB7kFX4ieZ
         bZCVst+Y1cXvDoFH6pTz1SCljqfo6L+0MESEk09r/IBkLuQwxLe+oEwkaRiFwM0kayOx
         jnCqJCl5DG/I0dOzlvMFtz3Fg1JJmGn75hznoo6N4FCAyMBC/OpkbRSUJAvtp+JDNj69
         cLog==
X-Forwarded-Encrypted: i=1; AJvYcCVsBg9JvaVh9vR+Kz5l59TmrCHDkR6ytPhkhlCnIzLUVRnhtPrLar5vTIYUBaykAt6WgX+uNayr+XM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOWbLO5UL+ga6VgOs06pwbk2mAu0TDAiXiObx5qjsmh0IdA/q7
	ZPuNJV0Xx/CvLo6irt20le67zO78VyiJpBlVaJlk+BVLot2da2wZhA9Wbl8IR1sntA==
X-Gm-Gg: ASbGnctfH32VFPTnZOqjANRs02PjZzjCNbSieAA11l9/7PBBBeToyiX4vHY2pxsAUKd
	h2XUycBqhXUiasU12XfTfgswYdI357xpO56nanEZCQXw7o/kvZtRSxEYML8qVuLSypNvzk7kCGJ
	zPsmpsNb0nT8dEqzFamvT5SBDZ1lT1VZRGwHcXaiFDcA/vnm3FRPQmwL28NueFWaUgaWrx/AQHQ
	Y4o7pNHiKg74sXo9OBSHnLkwdX4/ZL4d4DVcSkiPvFKZUOVN6jGHCNeRFHTK/cvs3MhO1d2uhf3
	Z/DYA+cYJInDJ5Tx7HKOh7yBR3O3kVDxOYCmL5JJSAFtVY9ao4VQjWNWMh/DXeEpNf8uHffoHlw
	uLBP6eXBj+5JXj6u27R4zMTXLgKaH+Z+ThR5ZvDR1BIZ1U1e60NYvfVMYVA==
X-Google-Smtp-Source: AGHT+IGlAvAyAaAZBTpzvGnVMt4Sm25ROne/UlbL2mRuMfDo2aZcCVrX2cIqeL2O1rPBuVfTDliNJA==
X-Received: by 2002:a05:6000:43d4:20b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3b3449df6fdmr1886588f8f.23.1751548203651;
        Thu, 03 Jul 2025 06:10:03 -0700 (PDT)
Message-ID: <5328b683-07d2-4590-9a8a-eac0cb2e4c79@suse.com>
Date: Thu, 3 Jul 2025 15:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/17] xen/riscv: implement guest_physmap_add_entry()
 for mapping GFNs to MFNs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <0b1f7ead7eb1b7c8687d388cca50b46eefb8e408.1749555949.git.oleksii.kurochko@gmail.com>
 <f1e26c40-c70d-4d86-96ec-7643a9d08e76@suse.com>
 <5fbe849c-3b8a-45dd-a217-c1dbf831da47@gmail.com>
 <03f0a7eb-f541-4f2b-8b88-500fd483dd48@suse.com>
 <0c1f9567-5530-4f90-8996-86a1f9662b52@gmail.com>
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
In-Reply-To: <0c1f9567-5530-4f90-8996-86a1f9662b52@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2025 13:54, Oleksii Kurochko wrote:
> 
> On 7/3/25 1:33 PM, Jan Beulich wrote:
>> On 03.07.2025 13:02, Oleksii Kurochko wrote:
>>> On 6/30/25 5:59 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> +                              unsigned long nr, mfn_t mfn, p2m_type_t t)
>>>>> +{
>>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>>> +    int rc;
>>>>> +
>>>>> +    p2m_write_lock(p2m);
>>>>> +    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m->default_access);
>>>>> +    p2m_write_unlock(p2m);
>>>>> +
>>>>> +    return rc;
>>>>> +}
>>>>> +
>>>>> +int map_regions_p2mt(struct domain *d,
>>>>> +                     gfn_t gfn,
>>>>> +                     unsigned long nr,
>>>>> +                     mfn_t mfn,
>>>>> +                     p2m_type_t p2mt)
>>>>> +{
>>>>> +    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
>>>>> +}
>>>> What is this function doing here? The description says "for generic mapping
>>>> purposes", which really may mean anything. Plus, if and when you need it, it
>>>> wants to come with a name that fits with e.g. ...
>>> These names are used across the common code and various architectures. Not all
>>> architectures need to implement all of these functions.
>>> I believe|guest_physmap_add_page()| (which internally calls|guest_physmap_add_entry()|)
>>> is needed to be implemented for all architectures, while|map_regions_p2mt()| is used
>>> by Arm and the common Dom0less-related code, and because of RISC-V is going to re-use
>>> common Dom0less code it is implementing this function too.
>> First, my comment was solely about this one function above. And then I didn't
>> even know Arm had such a function. It's not used from common code (except again
>> from dom0less code where it should have been better abstracted, imo). I'm also
>> not surprised I wasn't aware of it since, as can be implied from the above,
>> otherwise I would likely have complained about its name not fitting the general
>> scheme (which isn't all that good either).
> 
> If I'm right, there is nothing similar to|map_regions_p2mt()| in the common headers.
> 
> Anyway, I think we could follow up with a patch to rename this function to
> something more appropriate.
> 
> I was thinking about adding something like|map_regions_to_guest()|,|map_p2m_regions()|,
> or|map_p2m_memory()| to|xen/mm.h|, along with proper renaming in the Arm code.
> 
> Does that make sense?

Imo that seemingly redundant function (i.e. if it's really needed) would want
to be named guest_physmap_<whatever>().

Jan

