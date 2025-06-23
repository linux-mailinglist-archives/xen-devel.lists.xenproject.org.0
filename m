Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82337AE3686
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022043.1397743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbPC-0006I3-2b; Mon, 23 Jun 2025 07:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022043.1397743; Mon, 23 Jun 2025 07:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbPC-0006G6-05; Mon, 23 Jun 2025 07:15:50 +0000
Received: by outflank-mailman (input) for mailman id 1022043;
 Mon, 23 Jun 2025 07:15:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTbPA-0006G0-DZ
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:15:48 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e147ef18-5001-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 09:15:45 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so34852245e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 00:15:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f12427c2sm6097095a12.49.2025.06.23.00.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 00:15:44 -0700 (PDT)
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
X-Inumbo-ID: e147ef18-5001-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750662945; x=1751267745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bBIR3xUA+7/nSy30seLjIpM9vSgQ8LCuYIcpBh0C6tw=;
        b=gONz4CxTwPhinUIzLMT5hnKFOuAlQZNGhuEeOV3NgQ/c9dsPShh7c+Hxv47moBgmNm
         oS+WiHWf9+7lFy/b6R+u96CObVMqbUsCjKnVmbqmI1DTDQ+DicN1BREQC8YMNYwohTHl
         QsXgZM9BRYPy7NAUV4kVi0zO5Cl1Yz1LnDIC5AmcWQHxBl6fXaHQUh8aviPmrJz1pGyV
         Jop7VB5VRjoNQnVKe03zbvw6UvB/S/aGdwEpJTMq1us2ldX2dmvdSgIdN+qd0TlVEWGe
         y0LePCXqo/wpR4DLY2w+9v7E7X/Ln+vM+dvURYx2xwajmHvQPZoiF3x1nMhxmswppmRU
         YLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662945; x=1751267745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBIR3xUA+7/nSy30seLjIpM9vSgQ8LCuYIcpBh0C6tw=;
        b=G+IyKY9szQ0mj6rsR0G2miwyxwGyGZrvoUDu7odIBvzD2qnfo2q3FwGWFaDN2pEHuP
         rA4mEIhPX3Zgki7HrnLjXK6swDa2Y7BeSgS2l7JJRca0pJSbW/QXywiOdvTNsYCVX0Ap
         oiu+Uq0BbT+a6b9poDbXXIQSK+EKm0fcESsT64L1tpPa8UkMP34K03af3mbweJzcl+7z
         e11AEl+WlGsob6K7ak0bZv1JdSBGdN3jzs8uZMHwtm6XiFAutaCaU0YdYNFHp7PvDTCR
         /uKKVsUpGzfWG3z1hKUcgYLMOSx6YibrhEBHYrVhAwcaAo6sUK09YGW2Pehv+nrozRSN
         bizA==
X-Gm-Message-State: AOJu0YwaHyMfB9x/QjYbm6NkfJu8ZW115kXNkfMcapl87wSRtstnbTrL
	tXVWG6MS/QIbeFSBpBBwu32BFcn7w1yVGF8qSYP4mILHUxHw3qz99Q1B7b0gXBtEag==
X-Gm-Gg: ASbGncsv76xpbDWEautxZVxntQuV/zIbaL9ZrhP0w1Jp+8U3lVmLfqOMWu0yWzUZdjf
	XNjP30ZmeuUnJTTW1V2maBp+6p5W74vOJh3lcjnX9cEHqGgzDIlEFpLUlNjg2kJNzxcYGUlme6k
	cyDxi/iyDr85OwJPSBhpO03qWwsIiB5PtDZwT66vv25rdcWpJEvmV0C3RwPu3bGgYzE3OAr2d38
	zSHrx3DwC7CQQzdZmdxM2DhnWjbiBO8Ri768lPKcGseLDKWaERfe0XGcGHpbOo2/ILTFIHY0bEC
	P6Gz9uce132SixQvaCobd3JTZgkwv20gMExsNqyUGpcGF0OkN/hwY7v3JBcfyHWqGH55CwLaygt
	tZ2Ua2uiVMQqPlGPkKUh+JRcPfZ+OLcpqxIL5q9naOCkzi0eqiwynNbUlEA==
X-Google-Smtp-Source: AGHT+IFOz/KE3WvZXGS4BJb8mKO63jtiUF54GGZjHM/KM5vhq8Bf+0XSsy1e6WpFfTbyaCDj5P2+oQ==
X-Received: by 2002:a05:6000:2907:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a6d12c43dbmr9858409f8f.9.1750662944784;
        Mon, 23 Jun 2025 00:15:44 -0700 (PDT)
Message-ID: <1e116116-ddf7-4640-9809-2502203abe46@suse.com>
Date: Mon, 23 Jun 2025 09:15:35 +0200
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
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
 <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop>
 <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
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
In-Reply-To: <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2025 18:15, Oleksii Moisieiev wrote:
> 
> On 18/06/2025 03:04, Stefano Stabellini wrote:
>> On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
>>> Hi Stefano,
>>>
>>> I'm very sorry for a long silence. Please see my answers below:
>>>
>>> On 22/05/2025 03:25, Stefano Stabellini wrote:
>>>> On Mon, 19 May 2025, Oleksii Moisieiev wrote:
>>>>> From: Grygorii Strashko<grygorii_strashko@epam.com>
>>>>>
>>>>> Add chained handling of assigned DT devices to support access-controller
>>>>> functionality through SCI framework, so DT device assign request can be
>>>>> passed to FW for processing and enabling VM access to requested device
>>>>> (for example, device power management through FW interface like SCMI).
>>>>>
>>>>> The SCI access-controller DT device processing is chained after IOMMU
>>>>> processing and expected to be executed for any DT device regardless of its
>>>>> protection by IOMMU (or if IOMMU is disabled).
>>>>>
>>>>> This allows to pass not only IOMMU protected DT device through
>>>>> xl.cfg:"dtdev" property for processing:
>>>>>
>>>>> dtdev = [
>>>>>       "/soc/video@e6ef0000", <- IOMMU protected device
>>>>>       "/soc/i2c@e6508000", <- not IOMMU protected device
>>>>> ]
>>>>>
>>>>> The change is done in two parts:
>>>>> 1) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
>>>>> not fail if DT device is not protected by IOMMU
>>>>> 2) add chained call to sci_do_domctl() in do_domctl()
>>>>>
>>>>> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
>>>>> Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
>>>>> ---
>>>>>
>>>>>
>>>>>
>>>>>    xen/arch/arm/firmware/sci.c             | 37 +++++++++++++++++++++++++
>>>>>    xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
>>>>>    xen/common/domctl.c                     | 19 +++++++++++++
>>>>>    xen/drivers/passthrough/device_tree.c   |  6 ++++
>>>>>    4 files changed, 76 insertions(+)
>>>>>
>>>>> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
>>>>> index e1522e10e2..8efd541c4f 100644
>>>>> --- a/xen/arch/arm/firmware/sci.c
>>>>> +++ b/xen/arch/arm/firmware/sci.c
>>>>> @@ -126,6 +126,43 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>>>>>        return 0;
>>>>>    }
>>>>>    
>>>>> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>> +{
>>>>> +    struct dt_device_node *dev;
>>>>> +    int ret = 0;
>>>>> +
>>>>> +    switch ( domctl->cmd )
>>>>> +    {
>>>>> +    case XEN_DOMCTL_assign_device:
>>>>> +        ret = -EOPNOTSUPP;
>>>> Are you sure -EOPNOTSUPP is the right error code for the 3 checks below?
>>> The -EOPNOTSUPP code is used because this is part of a chained call after
>>> iommu_do_domctl, as stated in xen/common/domctl.c:859. The
>>> XEN_DOMCTL_assign_device
>>> call is expected to handle any DT device, regardless of whether the DT
>>> device is
>>> protected by an IOMMU or if the IOMMU is disabled.
>>> The following cases are considered:
>>>
>>> 1. IOMMU Protected Device (Success)
>>>
>>> If the device is protected by the IOMMU and iommu_do_domctl returns 0,
>>> we continue
>>> processing the DT device by calling sci_do_domctl.
>>>
>>> 2. IOMMU Disabled (-EOPNOTSUPP from iommu_do_domctl)
>>>
>>> If iommu_do_domctl returns -EOPNOTSUPP, indicating that the IOMMU is
>>> disabled,
>>> we still proceed to call sci_do_domctl.
>> OK this makes sense.  I think it is OK to have a special error code to
>> say "the IOMMU is disabled" but I don't know if it is a good idea to try
>> to use -EOPNOTSUPP for that. -EOPNOTSUPP could mean a hypervisor
>> configuration with domctl disabled, for instance.
>>
>> It might be wiser to use a different error code. Maybe ENOENT?
>>
> I see that in the following commit:
> 
> 71e617a6b8 (use is_iommu_enabled() where appropriate..., 2019-09-17)
> 
> -ENOSYS return code was changed to -EOPNOTSUPP in iommu_do_domctl.
> 
> It's not clear to me why this was done from the commit description.

This has been discussed many times elsewhere. Many of our ENOSYS uses are
simply wrong. ENOSYS has very limited applicability: Unavailability of a
top-level hypercall (originally: syscall).

> Maybe we should add commit author?

You might, but Paul hasn't been active in Xen for quite some time now.

Jan

