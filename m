Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C89B806B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 17:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828832.1243855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6YGY-0000v6-P6; Thu, 31 Oct 2024 16:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828832.1243855; Thu, 31 Oct 2024 16:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6YGY-0000sW-Lr; Thu, 31 Oct 2024 16:43:22 +0000
Received: by outflank-mailman (input) for mailman id 828832;
 Thu, 31 Oct 2024 16:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6YGW-0000sN-UP
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 16:43:20 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d0cffb-97a7-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 17:43:14 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso8957335e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 09:43:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9ca704sm62702955e9.41.2024.10.31.09.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 09:43:13 -0700 (PDT)
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
X-Inumbo-ID: 38d0cffb-97a7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM4ZDBjZmZiLTk3YTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzkyOTk0LjI1MDE3NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730392993; x=1730997793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mnCR+L3+wlaigesH59ei7uacQ15CtTjz7rfV0WvDRZI=;
        b=NCu2LZh5kKvH4VDZa1+vSnE/Z6rrWzAfMVrC3BvSB49j2PZIv8cFWLldTs2mHxYyOP
         4TfHmavACUD4mLpa0DHO39ifxkbSLp4BVaWJhP4Eb69Ey9/JBEAPhVzJ1Q/CWp4PYBD9
         4eq9psOIShxW0EsmI2CzFuctfw46g1aya+1uVZW2QFLSpVkPInyh0niqaxxf2ypuUvFK
         tTWYkvAHxYAQViVsAb5QPiPNeBmXYp0EIdQeM+/kk+zHKvnXTBW9ZeDc05dfcDWHc0Z5
         W14OawiP7TE1+J3tKeDxpTbKOs5qrawSqtWJbW44vrShhYyCQeCZlK2WLMQgjKYRp9ir
         Tp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730392993; x=1730997793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnCR+L3+wlaigesH59ei7uacQ15CtTjz7rfV0WvDRZI=;
        b=s/sSaJ9eYp8VjxdcQomznMPGIgOWps0HUS44uvt0vGlM4+0Vp8ZBCaJeilqtjPMuxX
         F71CmQrNj/NCwaJZ2ZTHuEelibJlJeJsfRsBE8iGomPo7iOvOyxwfN/YtBKUAIIGh3ZD
         P4KiisoeQFgwYrDngviNDiSu+CUe+8oYH7CLOYjbjAbuszTz+qvkE0ylJb0Xbx3QvCS9
         uOf0OXVeqMhByiZsiFox5lOuJCdwjfebAGDvk/tWN3AZCYvGTlHxGNcEynzGTfvrEewh
         XeIQqA1OQ7WjXJOi0aoJoLwM/0J4TCoC8dKHF+ZEmF63U2LbIJbKIyZ123tYpMFq1dql
         JX9g==
X-Forwarded-Encrypted: i=1; AJvYcCUiybGD9+aZC9r6BKKQCZW7xNwRqBL6G+81NQWpPRnDY6S4RZkeRvssuylgNxkLMLEdlzPSbqS8IFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOHDnDf5qA07QLx7ZgvdtHZsuw6GTzipXbGi9gsGJTi0svfFSk
	iti3rPWYe3rIx+fXLkZ39UhzIpaJzmMB2bdNZjbB5TPDfM6DYdddVygqSskipA==
X-Google-Smtp-Source: AGHT+IFIVCJ2u+3fhqtLgQHazyKiBn8RwglDEiHtTBOcbCacwpb0NZtP4EdvSyXXS4kUklZ/QgABbQ==
X-Received: by 2002:a05:600c:5249:b0:431:6052:48c3 with SMTP id 5b1f17b1804b1-4319acacd6amr203393705e9.16.1730392993423;
        Thu, 31 Oct 2024 09:43:13 -0700 (PDT)
Message-ID: <2fe01b5a-aebb-4141-9cdd-887b5984d6b8@suse.com>
Date: Thu, 31 Oct 2024 17:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/common: Move gic_preinit() to common code
To: oleksii.kurochko@gmail.com
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <e906b538aba684ab108cc70e8c60ed35ddfad74e.1730292286.git.oleksii.kurochko@gmail.com>
 <6461a47f-759a-4138-970c-4e5f68b07bae@suse.com>
 <c400bd0f-1360-45ea-bd29-bf7883debd93@amd.com>
 <5f4b8ed66e38475470cb80f04c470e12b6cb2a2e.camel@gmail.com>
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
In-Reply-To: <5f4b8ed66e38475470cb80f04c470e12b6cb2a2e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2024 16:13, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-10-31 at 11:29 +0100, Michal Orzel wrote:
>>
>>
>> On 31/10/2024 10:34, Jan Beulich wrote:
>>>
>>>
>>> On 30.10.2024 14:14, Oleksii Kurochko wrote:
>>>> Introduce ic_preinit() in the common codebase, as it is not
>>>> architecture-specific and can be reused by both PPC and RISC-V.
>>>> This function identifies the node with the interrupt-controller
>>>> property
>>>> in the device tree and calls device_init() to handle
>>>> architecture-specific
>>>> initialization of the interrupt controller.
>>>>
>>>> Additionally, rename gic_acpi_preinit() to ic_acpi_preinit() as
>>>> it is used
>>>> by ic_preinit(), while keeping it defined in architecture-
>>>> specific as this
>>>> part is architecture-specific. In case if CONFIG_ACPI=n a stub
>>>> for
>>>> ic_acpi_preinit() is provided. To declaration/defintion of
>>>> ic_acpi_preint()
>>>> is added `inline` to deal with the compilation issue:
>>>>   error: 'ic_acpi_preinit' defined but not used [-Werror=unused-
>>>> function]
>>>>
>>>> Make minor adjustments compared to the original ARM
>>>> implementation of
>>>> gic_dt_preinit():
>>>>  - Remove the local rc variable in gic_dt_preinit() since it is
>>>> only used once.
>>>>  - Change the prefix from gic to ic to clarify that the function
>>>> is not
>>>>    specific to ARM’s GIC, making it suitable for other
>>>> architectures as well.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>>  - Revert changes connected to moving of gic_acpi_preinit() to
>>>> common code as
>>>>    it isn't really architecture indepent part.
>>>>  - Update the commit message.
>>>>  - Move stub of ic_acpi_preinit() to <asm-generic/device.h> for
>>>> the case when
>>>>    CONFIG_ACPI=n.
>>>> ---
>>>>  xen/arch/arm/gic.c               | 45 +-------------------------
>>>> -----
>>>>  xen/arch/arm/setup.c             |  3 ++-
>>>>  xen/common/device.c              | 46
>>>> ++++++++++++++++++++++++++++++++
>>>>  xen/include/asm-generic/device.h | 10 +++++++
>>>>  4 files changed, 59 insertions(+), 45 deletions(-)
>>>
>>> Looks largely okay to me now, with a question and a nit at the
>>> bottom. The
>>> question is mainly to Arm folks, where the code is coming from, and
>>> DT
>>> maintainers: Is a file named device.c really an appropriate "home"
>>> for
>>> IC-related code? If IC is a common thing in the DT world, would
>>> such code
>>> maybe better live under common/device-tree/?
>> I think we will have more interrupt related dt stuff common, so it
>> would make sense to create
>> device-tree/irq.c or intc.c.
> What about the part of the code in common/device.c:
>    void __init ic_preinit(void)
>    {
>        if ( acpi_disabled )
>            ic_dt_preinit();
>        else
>            ic_acpi_preinit();
>    }
>    
> Should it be also moved to device-tree/intc.c even ic_acpi_preinit() is
> used?

Maybe best left to each arch? device.[ch] aren't a good home for this,
just like they aren't for the actual DT implementation.

Jan

