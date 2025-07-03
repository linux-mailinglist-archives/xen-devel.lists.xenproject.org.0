Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87D8AF75C8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 15:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032178.1405920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXK5F-0002pz-CV; Thu, 03 Jul 2025 13:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032178.1405920; Thu, 03 Jul 2025 13:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXK5F-0002oQ-91; Thu, 03 Jul 2025 13:34:37 +0000
Received: by outflank-mailman (input) for mailman id 1032178;
 Thu, 03 Jul 2025 13:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXK5E-0002oJ-0k
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 13:34:36 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7550f0fe-5812-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 15:34:35 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso4477848f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 06:34:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af540ae36sm17605565b3a.14.2025.07.03.06.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:34:33 -0700 (PDT)
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
X-Inumbo-ID: 7550f0fe-5812-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751549674; x=1752154474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5+29knEys4PKvyGvLAZmEmzHtP60LoiST1LpC4b65uM=;
        b=PpyI4HYLoJM2X9wm6TEUlPlKKI1u34YkfPeho2mXCO7HOx0jzk7N0vQ4JqwyKN16+4
         epb4vc0Be8uMvnNdDQZLDKwllUc8DaadwB6dNcfA1tilRu+KOO1/8VBBsu9uVvItVWM5
         Vj5yVi+/xcDrphQGTM6kv/GICDuPGSpDCTyvER60dRjfD1sUhtz1o/DRtq9fRfWhTXd5
         SIR4Z0u6A11sHb4hjm/a5Zo8/ubbfPtSRXK2xN1NNsXEyRqvR0wJyXXRhTgJUFBvmW+q
         JoPEIQXVqRKl68ShXpS0H838nN54vVZ06eYmJVUKpHudPHenrOX3TlL9uZrUT0bSzC83
         mbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549674; x=1752154474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+29knEys4PKvyGvLAZmEmzHtP60LoiST1LpC4b65uM=;
        b=HC6LQSwsN4qk154tBnVha1Q4KysrWUYi6+9tOLiSAnbZXqNso9Ph269GsA8bWgxR30
         Ev9fJGLdbXJjhK9fn6n+a4vdlkv0NqWP7qd+hT8Iy+LgbGLzgKtnVlgv4F2Cydf+FdfT
         JeslhQnCbCuTYmXcu+rJSc9H0R+VEcUHm+e4tXNDMzZUR+REUmo1Qz9Kqir85a06b/xW
         VNhJp6I9stNcPiFrvUU8XUcAkJVLc+M8ce6dAx+OcMHO4/PHck4L3Ck5ViHwd1zm3t4F
         5w8Y2c+f9cx+e3tg76JLznCB9WG96Fjv7cykQi7Czzpv7kAHBMv+iRyh+7daB09tKicZ
         Q97Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbVxXQGyhW3sdxy3UHMm5JTS8fiiKtZ9QrA5moOtZg0L5gAYx00qNuWGknSU6zlwE1tDm4O6w3T+o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6KJkOA6KdzWw3nHGLABwjcV15D0yRRr+dULeufDZUYh5CZUmx
	AGOdO5tYAlpOn+BHaZSDkV9kVErZuUtLSpkyY/zCnsiPQRrPrQAGLT0JBuDvJKfkfQ==
X-Gm-Gg: ASbGnct/+qk66rGsfD7EF0RmSUfkB18L1MexXO9RAe1dKmsPwBSbC5ehoswZwLoqDhj
	QzfL9nfe7XkkugzeJlAYHgtlXGfZTxHTTs76QRO1DW/44stV9pI1UtAfrWXtiMTBxcOx3z0x3Yl
	p1tx4RFebTHvg5C/tiAWSXoSF4Ih+tp70+YjGiq2DmzOO7zbk8JOUch0m5sjaevzwZrajPBdYIr
	/sxjK63fQFJ77/KUjNwDL64HmeXGOqaXwSLpI4+fyKl9/095NxqOpjwgB7nCBI8QAC9+gp8MY8V
	Thk/XGazcj3Ks0MaPZItRLwqHcsYTxaBSCch5OcYJ3+2Pj61LjUoQJ2KfKgueKidb/YeWz4LnQz
	inPjjQlUf0FqwoSXck7PIMQGID1ggtx7/mmIYLuv5vjq4XoE=
X-Google-Smtp-Source: AGHT+IHZXf+5Jd2Afex2oOkgAs92Q3DobWFMi7pYL27GSCcdNEa08Ua5mPbPA/9dyzxpzLK2PSvxww==
X-Received: by 2002:a05:6000:4b1a:b0:3a4:fa6a:9189 with SMTP id ffacd0b85a97d-3b1ff9f593fmr5756450f8f.31.1751549674344;
        Thu, 03 Jul 2025 06:34:34 -0700 (PDT)
Message-ID: <f31902de-56db-4948-8449-65b569303375@suse.com>
Date: Thu, 3 Jul 2025 15:34:23 +0200
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
 <5328b683-07d2-4590-9a8a-eac0cb2e4c79@suse.com>
 <2c3b4abe-2b42-4498-8c6f-639dda8a7ab0@gmail.com>
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
In-Reply-To: <2c3b4abe-2b42-4498-8c6f-639dda8a7ab0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2025 15:28, Oleksii Kurochko wrote:
> 
> On 7/3/25 3:09 PM, Jan Beulich wrote:
>> On 03.07.2025 13:54, Oleksii Kurochko wrote:
>>> On 7/3/25 1:33 PM, Jan Beulich wrote:
>>>> On 03.07.2025 13:02, Oleksii Kurochko wrote:
>>>>> On 6/30/25 5:59 PM, Jan Beulich wrote:
>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>> +                              unsigned long nr, mfn_t mfn, p2m_type_t t)
>>>>>>> +{
>>>>>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>>>>> +    int rc;
>>>>>>> +
>>>>>>> +    p2m_write_lock(p2m);
>>>>>>> +    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m->default_access);
>>>>>>> +    p2m_write_unlock(p2m);
>>>>>>> +
>>>>>>> +    return rc;
>>>>>>> +}
>>>>>>> +
>>>>>>> +int map_regions_p2mt(struct domain *d,
>>>>>>> +                     gfn_t gfn,
>>>>>>> +                     unsigned long nr,
>>>>>>> +                     mfn_t mfn,
>>>>>>> +                     p2m_type_t p2mt)
>>>>>>> +{
>>>>>>> +    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
>>>>>>> +}
>>>>>> What is this function doing here? The description says "for generic mapping
>>>>>> purposes", which really may mean anything. Plus, if and when you need it, it
>>>>>> wants to come with a name that fits with e.g. ...
>>>>> These names are used across the common code and various architectures. Not all
>>>>> architectures need to implement all of these functions.
>>>>> I believe|guest_physmap_add_page()| (which internally calls|guest_physmap_add_entry()|)
>>>>> is needed to be implemented for all architectures, while|map_regions_p2mt()| is used
>>>>> by Arm and the common Dom0less-related code, and because of RISC-V is going to re-use
>>>>> common Dom0less code it is implementing this function too.
>>>> First, my comment was solely about this one function above. And then I didn't
>>>> even know Arm had such a function. It's not used from common code (except again
>>>> from dom0less code where it should have been better abstracted, imo). I'm also
>>>> not surprised I wasn't aware of it since, as can be implied from the above,
>>>> otherwise I would likely have complained about its name not fitting the general
>>>> scheme (which isn't all that good either).
>>> If I'm right, there is nothing similar to|map_regions_p2mt()| in the common headers.
>>>
>>> Anyway, I think we could follow up with a patch to rename this function to
>>> something more appropriate.
>>>
>>> I was thinking about adding something like|map_regions_to_guest()|,|map_p2m_regions()|,
>>> or|map_p2m_memory()| to|xen/mm.h|, along with proper renaming in the Arm code.
>>>
>>> Does that make sense?
>> Imo that seemingly redundant function (i.e. if it's really needed) would want
>> to be named guest_physmap_<whatever>().
> 
> If it is redundant what is expected to be used instead to map_regions_p2mt() to map MMIO,
> for example, to guest: guest_physmap_add_page()? Based on the comment above the definition
> of this function it is for RAM: /* Untyped version for RAM only, for compatibility */

But we're talking about guest_physmap_add_entry().

Jan

