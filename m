Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F928AE5FD7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023425.1399416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzJU-00019I-6e; Tue, 24 Jun 2025 08:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023425.1399416; Tue, 24 Jun 2025 08:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzJU-00016q-3N; Tue, 24 Jun 2025 08:47:32 +0000
Received: by outflank-mailman (input) for mailman id 1023425;
 Tue, 24 Jun 2025 08:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTzJS-00016k-DP
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:47:30 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9e17690-50d7-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 10:47:25 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4530921461aso1392685e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:47:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83936e1sm104979875ad.5.2025.06.24.01.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 01:47:24 -0700 (PDT)
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
X-Inumbo-ID: d9e17690-50d7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750754845; x=1751359645; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wvi133P+98o1WSxQXhxYZo9lX8ql32xnPy5zZe/nLlU=;
        b=KN7L1OGukGrf7lZL/yWwWkEjTMdZBkxFTCPpRjn+tJWbWmzstsTO7HH/PK86SRgtAC
         oJoOHBsTAU3KfQ2zZvo2rWi0pa12IIDMyo0ZGOFcHzonf4P3zwiA65Tsr3dUhMic+fB8
         +O2ujenYbL2E15UK/WHZuJ4LIiOkA8ZNLwrIVlykI0aZSSKnnKJJYDD9V0yArJcmgpB2
         UoKp7p6fQIfp23Qhp+QcYoAd1k/zFKl7srrQ9BuCLYOCy4q+6sxFeprhcZzXSwVtkqYN
         P0PClEyxR59ojRO/vzEMRsfXUpSnPGc8kkhGfzQ79bx9v5llVi1+C57MXXYhY0BnOZXJ
         IjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750754845; x=1751359645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvi133P+98o1WSxQXhxYZo9lX8ql32xnPy5zZe/nLlU=;
        b=BABAy2fJO0LxdNgvguVfKPfI3wQ6EnLYwck+cac5vvT7RusgqS3vTCmLpS7txDg5Op
         tXXAjWCFzW3Jpa57KXxtzAbQGhviim/DVqzIusr4p5pWx8YU/5I9P1XxltPwg6qHCRHt
         evEBPIVJZhQQc/cES5JLYmMD+AAjHJ6AtGVwPdMrTafSvECEx0+VW9haKHJzLuAYMUv7
         i8oMecov8mUI6ck4vkMJvjjte3AQTM54a05/3R8qLWupZiyiDPhQ5j2AhRhy+EIqOuu7
         dy1fsiJm+G0Ucf9C5LeFYmRw11+aJMximtuJKZUPRUY2EQRsIWEGUxAKV9Af3B+lAwx5
         bmfg==
X-Gm-Message-State: AOJu0YzdhHxqz5JCBq4TvJMHlQpojLVnxNOU/1pV5Zgl/1SMqGQRZtuR
	Ny7x1fLRjy1Ohwv7aZfwY4CSKItbM31qRrXjwXOKqL+Fk9XElBF0C19sC1EmcADPGfL7/JWWr/b
	f/t4=
X-Gm-Gg: ASbGncs4nXsZr0qlAYa+sgMNDXgAnffH+9sVxyMQeULWs7aosbsYdrmDCkysM+ZVjs0
	dM90ryFvYlp+4cmQmLEUPXxUoJ7ihQ31uqy+onbyL+bHhUUBafG47/thncYVTtfiKthjbmnDtx5
	yN/MKqUdjaBeZHL1dDliXJaLrFkKDc1KxCkPzAIYG/5lGj3CQOamBflvvvHxjOkCdj1l+1ariE0
	LNnv5mVihS+MWHhQj1sOHFZBtmoHQKMNu4KvQkyzKr+Bt4P0KUBfAXXOqaEUEjvkYnqqSCAkBe2
	Gn9cmS1XYt5e+feG0pEfoXxv0f9Fg1/3rLHMKrgRrUEXxWdJXX//JbL/zzaJNmLDgutLJ99h0Zf
	DFKe2w7K0UWcWUDziWrJbvLcKC2o+F3PEHQtsJrEdGv+vyE8=
X-Google-Smtp-Source: AGHT+IHO3QGaSJenn+WN49EqBW90i51B+aH+PfXu3w/34ZKiC9OyXrzXE/c4pA/6HjCLd2FKcRXusw==
X-Received: by 2002:a05:6000:2108:b0:3a5:3af1:e21b with SMTP id ffacd0b85a97d-3a6d12e6d88mr9393404f8f.47.1750754844577;
        Tue, 24 Jun 2025 01:47:24 -0700 (PDT)
Message-ID: <033988d2-5b4f-4182-b26e-f860e740cb4a@suse.com>
Date: Tue, 24 Jun 2025 10:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
 <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop>
 <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
 <alpine.DEB.2.22.394.2506221428420.8066@ubuntu-linux-20-04-desktop>
 <4b69568b-3b21-4426-b78a-222ca11632e4@epam.com>
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
In-Reply-To: <4b69568b-3b21-4426-b78a-222ca11632e4@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 10:42, Oleksii Moisieiev wrote:
> Adding Roger and Jan to the conversation.
> 
> Please see below.

Why is this? I did answer that question at the bottom already.

Jan

> On 23/06/2025 00:30, Stefano Stabellini wrote:
>> On Thu, 19 Jun 2025, Oleksii Moisieiev wrote:
>>> On 18/06/2025 03:04, Stefano Stabellini wrote:
>>>> On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
>>>>> Hi Stefano,
>>>>>
>>>>> I'm very sorry for a long silence. Please see my answers below:
>>>>>
>>>>> On 22/05/2025 03:25, Stefano Stabellini wrote:
>>>>>> On Mon, 19 May 2025, Oleksii Moisieiev wrote:
>>>>>>> From: Grygorii Strashko<grygorii_strashko@epam.com>
>>>>>>>
>>>>>>> Add chained handling of assigned DT devices to support access-controller
>>>>>>> functionality through SCI framework, so DT device assign request can be
>>>>>>> passed to FW for processing and enabling VM access to requested device
>>>>>>> (for example, device power management through FW interface like SCMI).
>>>>>>>
>>>>>>> The SCI access-controller DT device processing is chained after IOMMU
>>>>>>> processing and expected to be executed for any DT device regardless of its
>>>>>>> protection by IOMMU (or if IOMMU is disabled).
>>>>>>>
>>>>>>> This allows to pass not only IOMMU protected DT device through
>>>>>>> xl.cfg:"dtdev" property for processing:
>>>>>>>
>>>>>>> dtdev = [
>>>>>>>        "/soc/video@e6ef0000", <- IOMMU protected device
>>>>>>>        "/soc/i2c@e6508000", <- not IOMMU protected device
>>>>>>> ]
>>>>>>>
>>>>>>> The change is done in two parts:
>>>>>>> 1) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
>>>>>>> not fail if DT device is not protected by IOMMU
>>>>>>> 2) add chained call to sci_do_domctl() in do_domctl()
>>>>>>>
>>>>>>> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
>>>>>>> Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
>>>>>>> ---
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>     xen/arch/arm/firmware/sci.c             | 37 +++++++++++++++++++++++++
>>>>>>>     xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
>>>>>>>     xen/common/domctl.c                     | 19 +++++++++++++
>>>>>>>     xen/drivers/passthrough/device_tree.c   |  6 ++++
>>>>>>>     4 files changed, 76 insertions(+)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
>>>>>>> index e1522e10e2..8efd541c4f 100644
>>>>>>> --- a/xen/arch/arm/firmware/sci.c
>>>>>>> +++ b/xen/arch/arm/firmware/sci.c
>>>>>>> @@ -126,6 +126,43 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>>>>>>>         return 0;
>>>>>>>     }
>>>>>>>     
>>>>>>> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>>>> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>>>> +{
>>>>>>> +    struct dt_device_node *dev;
>>>>>>> +    int ret = 0;
>>>>>>> +
>>>>>>> +    switch ( domctl->cmd )
>>>>>>> +    {
>>>>>>> +    case XEN_DOMCTL_assign_device:
>>>>>>> +        ret = -EOPNOTSUPP;
>>>>>> Are you sure -EOPNOTSUPP is the right error code for the 3 checks below?
>>>>> The -EOPNOTSUPP code is used because this is part of a chained call after
>>>>> iommu_do_domctl, as stated in xen/common/domctl.c:859. The
>>>>> XEN_DOMCTL_assign_device
>>>>> call is expected to handle any DT device, regardless of whether the DT
>>>>> device is
>>>>> protected by an IOMMU or if the IOMMU is disabled.
>>>>> The following cases are considered:
>>>>>
>>>>> 1. IOMMU Protected Device (Success)
>>>>>
>>>>> If the device is protected by the IOMMU and iommu_do_domctl returns 0,
>>>>> we continue
>>>>> processing the DT device by calling sci_do_domctl.
>>>>>
>>>>> 2. IOMMU Disabled (-EOPNOTSUPP from iommu_do_domctl)
>>>>>
>>>>> If iommu_do_domctl returns -EOPNOTSUPP, indicating that the IOMMU is
>>>>> disabled,
>>>>> we still proceed to call sci_do_domctl.
>>>> OK this makes sense.  I think it is OK to have a special error code to
>>>> say "the IOMMU is disabled" but I don't know if it is a good idea to try
>>>> to use -EOPNOTSUPP for that. -EOPNOTSUPP could mean a hypervisor
>>>> configuration with domctl disabled, for instance.
>>>>
>>>> It might be wiser to use a different error code. Maybe ENOENT?
>>>>
>>> I see that in the following commit:
>>>
>>> 71e617a6b8 (use is_iommu_enabled() where appropriate..., 2019-09-17)
>>>
>>> -ENOSYS return code was changed to -EOPNOTSUPP in iommu_do_domctl.
>>>
>>> It's not clear to me why this was done from the commit description.
>>>
>>> Maybe we should add commit author?
>> Roger and Jan might know


