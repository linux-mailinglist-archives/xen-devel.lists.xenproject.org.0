Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4606886777
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 08:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696666.1087760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZHE-0006q1-OP; Fri, 22 Mar 2024 07:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696666.1087760; Fri, 22 Mar 2024 07:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZHE-0006nY-L9; Fri, 22 Mar 2024 07:25:20 +0000
Received: by outflank-mailman (input) for mailman id 696666;
 Fri, 22 Mar 2024 07:25:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnZHD-0006n9-RG
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 07:25:19 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53219131-e81d-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 08:25:17 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56bcb9640bbso1817870a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 00:25:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q2-20020a1709066b0200b00a46c1dd36f0sm716150ejr.173.2024.03.22.00.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 00:25:13 -0700 (PDT)
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
X-Inumbo-ID: 53219131-e81d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711092314; x=1711697114; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7cqkKgy/Zn5jpOfJ1bdQHTOWUGXi+4Jyp41xQHSCUbw=;
        b=fHa2dfwlFHI7cwsln47G1+zg6FOR0y4L6wpwPQmHxgiEmZ0wqW53m2epcjOYMerYUT
         K1iFLNIdSmrBz0++It2DRsoiY1GQY+gsfTe0ZU66Pd48pe5DrK3MbLI/q2TntDCOhcvX
         yfD598Yk2cLhLuiCWroS2BwycxK6rSiPxgURBUPM1XYS8vNsE8QR+EjnWHkEI8mSEIdM
         kRcM4n2MjYx+3eMzCDpQIdNKFK7aJnR080Ge0EidUTd7fOtRfWP/LiRbSjNZ0eB6uM4M
         aq2EVuF64J7sGpjHJyMlYYN4GjtbKUT7aI3xaT1jCwh+djoxVqf+D8GzMAiadoonSLAz
         jhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711092314; x=1711697114;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cqkKgy/Zn5jpOfJ1bdQHTOWUGXi+4Jyp41xQHSCUbw=;
        b=QnMTHILwFjAg9DShxE2fBHExSTpQymRHIoohQr76hb9FnQzL8ZMCzjQZDuVR3cXYN0
         QLBdvPNzh1ODwENQDEJDgyn+RNDsd0ISWVU5UgYAbt6c352fSUpVY4rqp9MgroZmv5nx
         6fwNzPKFe/qWm91wARXIMqvgp41J2/H/ofW/Y7KSHDEUwlxu7rjl9csSBPThkouhNCHv
         npO5+8p3qzUyZzeOcOGDJGo5thIHe+XF1ArjcCed43Mkf9LsPpDiIU+2KuJDyX8xLnxT
         T6UvbAnVGiEoWOncCBsHHp1cUI3z07r8wBY4V3gwFov7jEuCeH5B0x7ZHU02sqNzfZRQ
         x5AA==
X-Forwarded-Encrypted: i=1; AJvYcCXph7gpUVu/f6HNnfuZqdmSts7vLeYRiO6VnZ1guo0/1qyVg5Qq/uI6ez9iFvc+uUyXWNMwvsKj6qHBU0xK0wfKb87cYDJP+8vwdCEipeI=
X-Gm-Message-State: AOJu0YxzCwmaiUY6+EwHOoHFNiteVy8doxHp7gcgkrEPABoyZnQTLX6H
	ZBmv2FbbSTHFlVQU0kckCFi68slPQR8GeY/Dc4X1ULtq2ANhHkQmJkT5Dl6cPA==
X-Google-Smtp-Source: AGHT+IHpOvuBsz1f7Yx87k/CnN+8q+mTbCMZBxGVLhIyJlGi+0/azOJuQc7wUKnE67l301nD52YpbA==
X-Received: by 2002:a17:906:714d:b0:a46:ba19:2e99 with SMTP id z13-20020a170906714d00b00a46ba192e99mr999886ejj.26.1711092313665;
        Fri, 22 Mar 2024 00:25:13 -0700 (PDT)
Message-ID: <cbcbeace-7d19-4e73-a12b-d2bcbc3b51f3@suse.com>
Date: Fri, 22 Mar 2024 08:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/14] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-2-carlo.nonato@minervasys.tech>
 <05e4d3da-4130-4c57-9855-43b685ce5005@suse.com>
 <CAG+AhRU4W+umVhOHn0ZnHvex-rmEn4+T_mKVczYG4o52EV+YtA@mail.gmail.com>
 <2b4d6e96-0f04-4327-9875-cd0587931621@suse.com>
 <CAG+AhRUJiUrnD6Ovvvy0_Naa-RnOWuYPDZqPJx2-zd7eUa828Q@mail.gmail.com>
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
In-Reply-To: <CAG+AhRUJiUrnD6Ovvvy0_Naa-RnOWuYPDZqPJx2-zd7eUa828Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2024 18:22, Carlo Nonato wrote:
> Hi Jan,
> 
> On Thu, Mar 21, 2024 at 4:53 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.03.2024 16:03, Carlo Nonato wrote:
>>> On Tue, Mar 19, 2024 at 3:58 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 15.03.2024 11:58, Carlo Nonato wrote:
>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>> @@ -1706,6 +1706,43 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
>>>>>  in hypervisor context to be able to dump the Last Interrupt/Exception To/From
>>>>>  record with other registers.
>>>>>
>>>>> +### llc-coloring
>>>>> +> `= <boolean>`
>>>>> +
>>>>> +> Default: `false`
>>>>> +
>>>>> +Flag to enable or disable LLC coloring support at runtime. This option is
>>>>> +available only when `CONFIG_LLC_COLORING` is enabled. See the general
>>>>> +cache coloring documentation for more info.
>>>>> +
>>>>> +### llc-nr-ways
>>>>> +> `= <integer>`
>>>>> +
>>>>> +> Default: `Obtained from hardware`
>>>>> +
>>>>> +Specify the number of ways of the Last Level Cache. This option is available
>>>>> +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used
>>>>> +to find the number of supported cache colors. By default the value is
>>>>> +automatically computed by probing the hardware, but in case of specific needs,
>>>>> +it can be manually set. Those include failing probing and debugging/testing
>>>>> +purposes so that it's possibile to emulate platforms with different number of
>>>>> +supported colors. If set, also "llc-size" must be set, otherwise the default
>>>>> +will be used.
>>>>> +
>>>>> +### llc-size
>>>>> +> `= <size>`
>>>>> +
>>>>> +> Default: `Obtained from hardware`
>>>>> +
>>>>> +Specify the size of the Last Level Cache. This option is available only when
>>>>> +`CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used to find
>>>>> +the number of supported cache colors. By default the value is automatically
>>>>> +computed by probing the hardware, but in case of specific needs, it can be
>>>>> +manually set. Those include failing probing and debugging/testing purposes so
>>>>> +that it's possibile to emulate platforms with different number of supported
>>>>> +colors. If set, also "llc-nr-ways" must be set, otherwise the default will be
>>>>> +used.
>>>>
>>>> Wouldn't it make sense to infer "llc-coloring" when both of the latter options
>>>> were supplied?
>>>
>>> To me it looks a bit strange that specifying some attributes of the cache
>>> automatically enables cache coloring. Also it would require some changes in
>>> how to express the auto-probing for such attributes.
>>
>> Whereas to me it looks strange that, when having llc-size and llc-nr-ways
>> provided, I'd need to add a 3rd option. What purpose other than enabling
>> coloring could there be when specifying those parameters?
> 
> Ok, I probably misunderstood you. You mean just to assume llc-coloring=on
> when both llc-size and llc-nr-ways are present and not to remove
> llc-coloring completely, right?

Yes. The common thing, after all, will be to just have llc-coloring on the
command line.

Jan

