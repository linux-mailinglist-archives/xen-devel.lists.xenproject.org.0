Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D187F92B440
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 11:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756034.1164596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7NU-0004Yn-Se; Tue, 09 Jul 2024 09:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756034.1164596; Tue, 09 Jul 2024 09:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR7NU-0004W8-OZ; Tue, 09 Jul 2024 09:43:16 +0000
Received: by outflank-mailman (input) for mailman id 756034;
 Tue, 09 Jul 2024 09:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR7NT-0004W2-Ds
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 09:43:15 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9013ec4-3dd7-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 11:43:13 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52e99060b0dso5404694e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 02:43:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ac5073sm12049425ad.227.2024.07.09.02.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 02:43:12 -0700 (PDT)
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
X-Inumbo-ID: a9013ec4-3dd7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720518193; x=1721122993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U5cbmjURPM/IMu/Ezl0bxzz4CVG/YVDqjC6zXf65nRM=;
        b=Y1Z3Ox+rguElBYAK78rnfJ6zlgcCCkJsO81fiNZv6JMIvQkVGL9hbBbXppU8U21q1Z
         Jvg+k5cQ4F0axg+Wl3V6Amw3Vo498Abq9tWaSU+EK/j1nNVRxVoTfpt5m4kCPe5UGMEU
         qiqds+0TVOfu3xOGGpKVpDlPBSAr/m3skzZlhZJshJLdyJ8C6NX97KoHhZzAl/C/FMK6
         Ht25bG5CJKGBpVwT0Bi45o7vBjMhPfgX2AbXBbp3Of6V1fq1Yn9O0r5TWwvCEK6k4WZg
         +WxV/oOucjyL62TtnFBnYvGYiOm7iOwr8XAGRDohgMFbYQGGL9l7WdD7qvomFfAzxUAM
         QmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720518193; x=1721122993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5cbmjURPM/IMu/Ezl0bxzz4CVG/YVDqjC6zXf65nRM=;
        b=SnaRComWHO7t2WCho8fKxyzSZCj8n3HIDEkKfFdRsmah0wRjglYN1oUIrUxvhATG13
         2y9/cYQuoTdzonNmsbmeWWb+vSe+fOREitlppFZtlWsXwPaTrJTDTkHU7wIOuPUzeXRw
         fW1zn1Y6/02ruRx5AbVNiEGGpB/KjqxUE2sMXhNRjgFuH7kOECzh4U958v6EunItabYG
         sMb4umM74pkt1e5IQu8eFxCjDJfsjvad9aH34/uq+R32MnKloHor+o1K0if60ehQYC41
         JXnmKU96zN5LIfrMDaLPbkgaLn20o6sGSRsYNlM1xMXq+ptAbG8Tr/QiBY8Kul/nXqEw
         qOFw==
X-Forwarded-Encrypted: i=1; AJvYcCURb1DY+GdtkylpvJko5w33o4ZOHhkcO6b90N3uYxgkcSr2kAmw/qFdSW6JpMtvKXBYlkT4j70DlpR3D8rMXK++iL1X4iEooPO0TUWe7ME=
X-Gm-Message-State: AOJu0Yx6uCEH1NI0mTi/x7dMTW/S9BDseHntF1Sphb6QuQLeen/0X7bm
	lGF/qLXnO46YK7mBFJutf7y2ubzO/fQIhK2F88zAQtS7DPsi6QgGV/r6GUN7gT/owhTaiydpW/M
	=
X-Google-Smtp-Source: AGHT+IH4GVjdkQpVRatyqwp84U3a30QPtfw28IyntHosjtSA+SdU9GDqWCaF3kDzc75uDVyY1F+OSA==
X-Received: by 2002:ac2:46ea:0:b0:52e:9b74:120 with SMTP id 2adb3069b0e04-52eb9997849mr1080578e87.19.1720518193046;
        Tue, 09 Jul 2024 02:43:13 -0700 (PDT)
Message-ID: <49835de9-554c-47f5-92a4-e98a37787d49@suse.com>
Date: Tue, 9 Jul 2024 11:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] x86/cpufreq: move ACPI cpufreq driver into
 separate file
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
 <d8a13eb8c53d8cde99d7fa1d8e4fce2a597f02fd.1719832871.git.Sergiy_Kibrik@epam.com>
 <0f883617-f4c0-43af-895f-3f70d4143a34@suse.com>
 <cbb957fa-3d71-4358-b01c-0a0857db43eb@epam.com>
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
In-Reply-To: <cbb957fa-3d71-4358-b01c-0a0857db43eb@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 11:13, Sergiy Kibrik wrote:
> 03.07.24 18:07, Jan Beulich:
>> On 01.07.2024 14:03, Sergiy Kibrik wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/acpi/cpufreq/acpi.c
>>> @@ -0,0 +1,622 @@
>>> +/*
>>> + *  cpufreq.c - ACPI Processor P-States Driver ($Revision: 1.4 $)
>>> + *
>>> + *  Copyright (C) 2001, 2002 Andy Grover <andrew.grover@intel.com>
>>> + *  Copyright (C) 2001, 2002 Paul Diefenbaugh <paul.s.diefenbaugh@intel.com>
>>> + *  Copyright (C) 2002 - 2004 Dominik Brodowski <linux@brodo.de>
>>> + *  Copyright (C) 2006        Denis Sadykov <denis.m.sadykov@intel.com>
>>> + *
>>> + *  Feb 2008 - Liu Jinsong <jinsong.liu@intel.com>
>>> + *      porting acpi-cpufreq.c from Linux 2.6.23 to Xen hypervisor
>>> + *
>>> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> + *
>>> + *  This program is free software; you can redistribute it and/or modify
>>> + *  it under the terms of the GNU General Public License as published by
>>> + *  the Free Software Foundation; either version 2 of the License, or (at
>>> + *  your option) any later version.
>>> + *
> [..]
>>> + *
>>> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> + */
>>
>> ... I expect this should be transformed into an SPDX line. I expect the
>> one in cpufreq.c wasn't picked up when the conversion was done because
>> it doesn't fully match whatever pattern was looked for at the time.
>>
> 
> would the line
> 
> /* SPDX-License-Identifier: GPL-2.0-or-later */
> 
> be correct here?

I think so, yes.

Jan

