Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB646B11802
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 07:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057092.1425013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufB62-0007EO-Nm; Fri, 25 Jul 2025 05:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057092.1425013; Fri, 25 Jul 2025 05:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufB62-0007CO-L8; Fri, 25 Jul 2025 05:35:54 +0000
Received: by outflank-mailman (input) for mailman id 1057092;
 Fri, 25 Jul 2025 05:35:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ufB61-0007CI-82
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 05:35:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a343241-6919-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 07:35:52 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45600581226so17900805e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 22:35:52 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ab:e91f:46e4:60d0:c444?
 (p200300cab711f2abe91f46e460d0c444.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ab:e91f:46e4:60d0:c444])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054ef47sm41046725e9.8.2025.07.24.22.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 22:35:51 -0700 (PDT)
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
X-Inumbo-ID: 3a343241-6919-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753421751; x=1754026551; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D+7MepAwK3t5a6V1hyv4ro7pSa6iOIjcs1ci/6WRVGU=;
        b=LZQK4l2oE7t/Jj7XvPS5odwLQPMvGuHlIH9TClIeqDLqXadGG5P01qXndjDsTXclm7
         Vc6vllWkEJas6oIiGIGie9eGpMtm5UQ63M8X9DG5p8y3NZ3d7Y71eo9GX3ctQNmKFt5h
         G0Unj44BTe9ocdGgRXdY1ElePWeph8IuuKYiUF7Wgs/ayp7QvHZiSWwRJtIrrbsCQ1MG
         6SpCMQzjya/9q/UiW62MtrZivJLOfFcJF4mM14MAnSXdBwX4gA5+8Yyw9UHMEXrPtWv7
         WV+JRIQagd0UOO4kf/ldS0GQuMqCB6Ctno8Y+Eqq0rYcGl+QHkbisiWUXIvVsW40GBx4
         VFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753421751; x=1754026551;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+7MepAwK3t5a6V1hyv4ro7pSa6iOIjcs1ci/6WRVGU=;
        b=e5jYZIpQUaiieht1WzVFECb882/aycRIayrg5RZd6dFcPuYiBGJq9QITq2430HZGYJ
         yQ9hnRwegBzPKitg+6RG0EPZLFNjvj/oSCHZ4suPfXI34+Px/XUa0jpALAJh7EST4OjX
         89ThSdI9LSq1GG2YDro4cQqZDXVoVdSTFpuMSl+3xJUVtWJpWQFzfLWdJ4B26KODyTaN
         L0/gQSwd4DTLn/hDx27UQArXHLyB4fa/VZYx4Wk6JtZ1X6V2L4o9Pm/zspbl/6rajm/E
         k8JiOo4ezMq6ebq9I5Oiv/7ZThIMexiakRMlGCbyUtDrGYCt+ECLD606Gn0jQcRlJoFr
         7qsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjRMzTGFUrhu1JknSbmrj2j9618fA+t1tPzZ/hVEEK9N6xX+TnGOuVGXATeG6q3mpg22Pa+7t6/5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy13zCo9s7oKD60JXSRzHPu4ezwDomQlEVVgcUyYuQJKVy+hBq5
	sv9+VBVK57nktSK9ISrRzTNs9I847JnW0vxlE5dHJ0eGzjbA4/Vwc75yeV/16FmQHA==
X-Gm-Gg: ASbGncute2Y72rFSDNEC3YJbZtubzDZbF5y5pGZQ/hAJxpyVDfEqsj2zysieijojhcZ
	3TmAlP33J/yXr1b5bb70Qg6AHdyf6BTtanVY8dbkwuqwMPeJ9ANyLZi0HlbqaDckaegz/ix5Ojt
	dA4/XYI7Erhsob0GCDypn7w0jA8mgS7XT0/BtaYpBmagp/gBZoXkD4RGmqx8HTP2/tFM7H8anOH
	Vk8ckiFXZLTK7pYFi20pXxw3OijsvU4Euc5rsiMKolc39DQCcGBZEm4+2TKSwSlhk/QfG65adWY
	/y337mKdfb+nDo/dprveoL0k+8Z0EYjZ4B4/njxHGaFKpsekNZ+PBeVtpbdQJJ0geVGl64oFObL
	04VFZxeWMrw/MQKl7bEgg9rJK8YEDjU7bjLPbFl2TI3ntegL9pWJB7M3RW+oPjldaS+heA8TUfH
	kqJMyNah/gWmKrkpS923eRj5KMfSd1LDZzvw6PrRIVOAtB5sGD8xL8tV2P
X-Google-Smtp-Source: AGHT+IHCZ3+yrITQhsk7OjdCsxwMCGzE3dsgIbD6nvJ0UksaPoBoXCh2ySGkwIgFAACHiaoWmlsvcQ==
X-Received: by 2002:a05:600c:34d1:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-4587666ac59mr2695145e9.29.1753421751423;
        Thu, 24 Jul 2025 22:35:51 -0700 (PDT)
Message-ID: <951acda0-583b-41ad-8ca7-1d0485b26504@suse.com>
Date: Fri, 25 Jul 2025 07:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/char: implement suspend/resume calls for SCIF
 driver
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
 <2b345a72-5ab7-443f-bff4-2b4ee9952825@suse.com>
 <CAGeoDV98LJup77GQ4YrbeqSBeoojaNe+46NX37dHoiFDDHUGtw@mail.gmail.com>
 <ea37a8cb-7d65-4c74-8c28-39579b5121cb@suse.com>
 <CAGeoDV9zYwGg0pSrMZVK8AdGpX1m8kjExc2twx93yR+SbnrkcA@mail.gmail.com>
 <CAGeoDV9+Tdk9S63hegQt=CpLD9Ka16qqGs9fApbG9-Q=jBW8PQ@mail.gmail.com>
 <fcae8366-8f32-4fd1-a2be-e6505a6e9420@suse.com>
 <CAGeoDV8HKjKCEa-VC7xczkXWfoRJD5mEjBphnDJ9AGJOkCrEzQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8HKjKCEa-VC7xczkXWfoRJD5mEjBphnDJ9AGJOkCrEzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2025 18:48, Mykola Kvach wrote:
> On Thu, Jul 24, 2025 at 3:13 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 24.07.2025 13:41, Mykola Kvach wrote:
>>> Hi all,
>>>
>>> On Tue, Jun 24, 2025 at 12:32 PM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>>>
>>>> On Tue, Jun 24, 2025 at 11:32 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>
>>>>> On 24.06.2025 10:29, Mykola Kvach wrote:
>>>>>> On Tue, Jun 24, 2025 at 10:53 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 24.06.2025 09:18, Mykola Kvach wrote:
>>>>>>>> @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uart_driver = {
>>>>>>>>      .start_tx     = scif_uart_start_tx,
>>>>>>>>      .stop_tx      = scif_uart_stop_tx,
>>>>>>>>      .vuart_info   = scif_vuart_info,
>>>>>>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>>>>>>> +    .suspend      = scif_uart_suspend,
>>>>>>>> +    .resume       = scif_uart_resume,
>>>>>>>> +#endif
>>>>>>>>  };
>>>>>>>
>>>>>>> As this being put inside #ifdef was to be expected, imo a prereq change is to
>>>>>>> also make the struct fields conditional in xen/console.h. I think I did even
>>>>>>> comment to this effect back at the time.
>>>>>>
>>>>>> Would you prefer that I include this change in the current patch
>>>>>> series, or is it acceptable to address it in a separate patch?
>>>>>
>>>>> Either way is fine with me. I expect the header fine change to be able to go
>>>>> in right away (once submitted), whereas the patch here may take some time for
>>>>> people to review.
>>>>
>>>> Got it, I'll submit a separate patch to make the struct fields and
>>>> related code wrapped within SYSTEM_SUSPEND.
>>>
>>> Jan’s proposal to conditionally include the 'suspend' and 'resume' fields
>>> in 'struct uart_driver' under CONFIG_SYSTEM_SUSPEND has already been
>>> merged -- thanks!
>>>
>>> Could you please take another look at this patch when time permits?
>>
>> That's an Arm driver, so I don't expect the request was meant to go to me
>> (as To: having just me was suggesting)?
> 
> You're right -- this is an Arm driver, and I didn’t mean to direct
> the request solely to you. Others in CC are also involved.
> 
> I thought the review of this patch had stalled following your
> previous comment, so I just wanted to notify everyone involved
> that the related changes have already been merged. With that out
> of the way, I hope this remaining patch can now be reviewed and,
> if acceptable, merged as well.
> 
> I’m not entirely familiar with the proper process for these cases,
> so apologies if this ping was inappropriate or caused any
> disruption.

It's not properly written down anywhere, afaik. My (personal) request
is that you make clear who you expect input from by properly arranging
To: vs Cc:.

Jan

