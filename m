Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14986B4A2C0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 08:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115855.1462314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvsIc-00086R-4f; Tue, 09 Sep 2025 06:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115855.1462314; Tue, 09 Sep 2025 06:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvsIc-00084G-23; Tue, 09 Sep 2025 06:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1115855;
 Tue, 09 Sep 2025 06:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvsIZ-000848-Li
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 06:57:51 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bfc2c66-8d4a-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 08:57:49 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b0472bd218bso802573666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 23:57:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0410a65a68sm2249823266b.110.2025.09.08.23.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 23:57:48 -0700 (PDT)
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
X-Inumbo-ID: 4bfc2c66-8d4a-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757401069; x=1758005869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AedlcGDLqdRSDwDh8sGmChq6MV0cbTpATfkdtg6njIk=;
        b=FAN5u3xsic+JUMJps+UG/3BkGUKqHkuAg7CGuOTKC89rH/h4y3TDnUDS4TpJnrE9td
         d0uzJGipOtvo0sOMPi8E6FbfGLI84VP/3TmWqyo+uPqUzIb6l9MK3w3bj/VwThSs7a16
         FGAYhyPv/1iY4s5cvWabc9AtdsFIL9xA6jPLocNkPl4xVwlJ+bwT/J8QKc5ZJD3Hfxc3
         IWSJ2P3j2PDs9rYYZQHIksxQ/Uie2+EoVvHF5Newh1fIA3YD6k9F7haxMA89eUulpp4L
         4J/O9WLJoe1WjZYXsAnV0MDf9Gk9enMD5IRdgnIhF4KiODHetZPN/ozkgOndfDjdvDb5
         FRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401069; x=1758005869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AedlcGDLqdRSDwDh8sGmChq6MV0cbTpATfkdtg6njIk=;
        b=ffVqJqGa+YH2ud8qzKtuk9grZUL5dbxjRKrQEynWJzOtkoEf5/ymQ/pnuNyXhK6L3n
         qhv9pJEfrW6xPo2tpH0xf+jWqk3wAk6VCxJImi/CWUp8izzWGDRLqzat6ogpToWn01fc
         qLyyInbuWC7cwTctD7ABMVSpH+aG/7QYm1F2QYlUx2yiADy6LrApWQwVmQ4P9pmAGetj
         IAZ+nzS2SNYw/c+q3p6WW/p8N8dCPVdGFoQDDBAJVhMWZcQoCkee8tGSDZ15h+QpPsFx
         50uSeufB4L7Fch95Mfd7MF4J/2Kmozct9jNavG5SBV5Jo45942yiQ2zxE917xcAhXB3j
         uwaw==
X-Forwarded-Encrypted: i=1; AJvYcCUoGY5FjyRJacAUZa6GjDTqJlSH/m60Yy2jdiT5SB2seljNOwoJinp8fVFoS/Dowr64Or9Ab/rwH+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyN0vF3E7sSlQ0uFcpApL3sZaONvAbABIfF0mT8hacFgRqGLc7q
	zvnUyi92FgIpnjnTB7qRZ4AdDSeq0anmimNp0PrLaZylY1tuPeuiBJONV3dMZ6RL4w==
X-Gm-Gg: ASbGncu4WZ2/6rxF5/zGEHzfJFIkDWUbsH0qNUhoqja+0Sg0BQYfVclAqFlmqJcnvGm
	j+Uu0dUOQuig7GNSeaQhf7UtQHiglBS4p20q92wPLBsmGznc5bgK41upHcQix1rGoARG4wKa4xb
	gyfI7ABclK/1SiyTDl8Ecwx7xSQSGWcOdN9jDYAgqxbRQDurlostEV+M7+NbF0wOlkrhXITS6Rf
	QcDhvWjF/HWwaOey0GF+shReejKoWFxpzQrCzoKFC4mZqfU13hH3W3/pu7QI9CH9O5oVMn/WF61
	2/2UYHef3rKo5eGbhgXehfNlB460bFOjqUJ+qyDFvPLWcI6gUTjumkawPv4Uw3x+7uwDkdtsgNW
	UW+d5OHYh9SMbxnPOTvpT8XknVxknN29ed7Sy1igN0wbjr0C6YZCJb6pPrYZxJogIUTR4Ddo1F6
	kfjXN5xjJTnE+SWosrvg==
X-Google-Smtp-Source: AGHT+IEQQWUt+8z+RpzQuIzfM5VmlITE+nJynGsnk1LiI0T+lwHySFQJ1pRULSv5sjW/3VhLjerrKQ==
X-Received: by 2002:a17:907:9955:b0:b07:6537:264c with SMTP id a640c23a62f3a-b076537276cmr188524566b.37.1757401068504;
        Mon, 08 Sep 2025 23:57:48 -0700 (PDT)
Message-ID: <21f2f6e1-cbf7-4b36-bbba-bffc2dab3422@suse.com>
Date: Tue, 9 Sep 2025 08:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
 <fb1709de-c288-4641-8419-fdd4a2fd8401@suse.com>
 <CAGeoDV_JwupoKWsiztgDSYbEgAHrRjgSHYZ+y=KCiJEoZ2eK_g@mail.gmail.com>
 <CAGeoDV8hPDXFfY2UWwhNFi7K0sJZoKvyKY=Lrs7cer7hn2xX4g@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8hPDXFfY2UWwhNFi7K0sJZoKvyKY=Lrs7cer7hn2xX4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2025 08:29, Mykola Kvach wrote:
> On Wed, Sep 3, 2025 at 7:31 AM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>> On Tue, Sep 2, 2025 at 5:33 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 02.09.2025 00:10, Mykola Kvach wrote:
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -1317,7 +1317,11 @@ int domain_shutdown(struct domain *d, u8 reason)
>>>>          d->shutdown_code = reason;
>>>>      reason = d->shutdown_code;
>>>>
>>>> +#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
>>>> +    if ( reason != SHUTDOWN_suspend && is_hardware_domain(d) )
>>>> +#else
>>>>      if ( is_hardware_domain(d) )
>>>> +#endif
>>>>          hwdom_shutdown(reason);
>>>
>>> I still don't follow why Arm-specific code needs to live here. If this
>>> can't be properly abstracted, then at the very least I'd expect some
>>> code comment here, or at the very, very least something in the description.
>>
>> Looks like I missed your comment about this in the previous version of
>> the patch series.
>>
>>>
>>> From looking at hwdom_shutdown() I get the impression that it doesn't
>>> expect to be called with SHUTDOWN_suspend, yet then the question is why we
>>> make it into domain_shutdown() with that reason code.
>>
>> Thank you for the question, it is a good one.
>>
>> Thinking about it, with the current implementation (i.e. when the HW domain
>> requests system suspend), we don't really need to call domain_shutdown().
>> It would be enough to pause the last running vCPU (the current one) just to
>> make sure that we don't return control to the domain after exiting from the
>> hvc trap on the PSCI SYSTEM_SUSPEND command. We also need to set
>> shutting_down to ensure that any asynchronous code or timer callbacks
>> behave properly during suspend (i.e. skip their normal actions).
> 
> If we avoid calling domain_shutdown() for the hardware domain during
> suspend, we would need to duplicate most of its logic except for the
> hwdom_shutdown() call, which is not ideal.

That is, you effectively take back what you said earlier (as to not needing
to call domain_shutdown())?

> To improve this, I suggest introducing a helper function:
> 
>     static inline bool need_hwdom_shutdown(const struct domain *d, u8 reason)
>     {
>         if ( IS_ENABLED(CONFIG_SYSTEM_SUSPEND) && IS_ENABLED(CONFIG_ARM) )
>             return is_hardware_domain(d) && reason != SHUTDOWN_suspend;
> 
>         return is_hardware_domain(d);
>     }

If I see a call to a function of this name, I'd expect the "hardware
domain" nature already having been checked. I.e. a call site would
rather look like

    if ( is_hardware_domain(d) && need_hwdom_shutdown(d, reason) )
        ...;

> Then, in domain_shutdown(), we can call need_hwdom_shutdown() instead
> of directly checking is_hardware_domain(d). This keeps the logic
> readable and avoids code duplication.
> 
> What do you think about this approach?

Well, there's still the CONFIG_ARM check in there that I would like to
see gone. (As a nit, the use of u8 would also want to go away.)

Furthermore with continuing to (ab)use domain_shutdown() also for the
suspend case (Dom0 isn't really shut down when suspending, aiui), you
retain the widening of the issue with the bogus setting of
d->is_shutting_down (and hence the need for later clearing the flag
again) that I mentioned elsewhere. (Yes, I remain of the opinion that
you don't need to sort that as a prereq to your work, yet at the same
time I think the goal should be to at least not make a bad situation
worse.)

Jan

