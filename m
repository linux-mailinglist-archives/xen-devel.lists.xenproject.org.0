Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523094EA5E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 11:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775421.1185639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdRoR-00021f-CW; Mon, 12 Aug 2024 09:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775421.1185639; Mon, 12 Aug 2024 09:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdRoR-00020B-9p; Mon, 12 Aug 2024 09:58:03 +0000
Received: by outflank-mailman (input) for mailman id 775421;
 Mon, 12 Aug 2024 09:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyEi=PL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdRoQ-000205-Jb
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 09:58:02 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c3255b0-5891-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 11:58:01 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7d638a1f27so142236966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 02:58:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb1d12e7sm214592966b.122.2024.08.12.02.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 02:58:00 -0700 (PDT)
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
X-Inumbo-ID: 5c3255b0-5891-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723456681; x=1724061481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EB26+UQWtBmTSj9MblnATVySQgBtTI+eeJ6Evw3yj4c=;
        b=YuMtM6xPhvmdVrH7P/nELY/J2Ksj99S/Lm03n2SUbZLR3q6af1IvDOJ3b+GfC19FY4
         NX31/BvZImZgtYsO5/eOsEQbEUdPfLefeJgWidvxkc3e/lalLjdzCDBjWgMaDG6YO4Nm
         qbXWrFMuSKeN5K20VaZjsSL0Ldc9f5dbSxsfc8f3N7PzdGQo8KsTJyX63o8IJthMMQxJ
         zpZQd0K2tOXrRiWGBvYFKQrlzG1NdEuupmByoD+whhZOOkqBLU04i9grI9NLsEi8qPYq
         L3l3rvAkPSd3XeaLfYBvqIUtx4ggjCW63RF3Wb9K3qj/3oqrCmb0YB91kBK8xn/W3JuU
         tntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723456681; x=1724061481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB26+UQWtBmTSj9MblnATVySQgBtTI+eeJ6Evw3yj4c=;
        b=PWIfIvlGmAiHSkzWCIbKc8VeYtVr9Z+EUnkM7HjLL2M2UPIW9h+AdJqa+9LPiVvo+1
         lJjVeDpGsWZV8LRssI+Ertc8/LDLfRMnuhxH4B3H5PYkQ0BC+PrutTZHe3PVOGzwtgq0
         xkhtdNHOm/ipFRcN8w75JLNVIVBogxDJCaofah3q4nbAhFfVk+T1KoZuTQUFR8BR+Hpe
         JgFBP3WAoTHOYqVPnrU0h5Ol9z/JXWF83GgexIeRPNcSzfZ3y1rP4jd7xHvwzDriow5x
         6VtPgNl1aTk9ojwCptFJqgWxmCsqygoWRUGNMkX/aoUFoFYk2yWDnaaUBgzJB7ZPL2qO
         SECA==
X-Forwarded-Encrypted: i=1; AJvYcCVE4qICAQrY0dBFoQa0yWQuJY3yfS3cr5yqUvlf6pyTBVFS5RvYt7zMUHS51BK8HUroZOlJDIe4dvr4o7CCW6ss9sLx6DsBMI5nRX1EVhg=
X-Gm-Message-State: AOJu0Yx7S97q7yR4kwWnXfGdeOsIhm6eNR4COALqaV8IHYsT4f3d9pei
	gmne7s24V92SQJ35LIh3RHNoUaF5bGrKbnQO1HfCHK0dfzdn4qzooJ8TsoMxBA==
X-Google-Smtp-Source: AGHT+IE96ARwUQQJ/OgoQNsnp4npalCU0m4H9eegxqxw489gcA70D31eQg8uyQ0PJBUTEAAbVPcfZg==
X-Received: by 2002:a05:6402:2552:b0:5a1:de88:a5ef with SMTP id 4fb4d7f45d1cf-5bd0a61e1d5mr7510997a12.27.1723456680574;
        Mon, 12 Aug 2024 02:58:00 -0700 (PDT)
Message-ID: <d449f8dc-2d59-4836-b26a-b29a83f7d6fb@suse.com>
Date: Mon, 12 Aug 2024 11:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/2] x86/intel: optional build of intel.c
To: Sergiy Kibrik <sergiy_kibrik@epam.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
 <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com>
 <D3BBCS1WZ3FI.KYTC0BZLDUM9@cloud.com>
 <dab7d359-4433-448f-b781-03544fd4b68d@epam.com>
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
In-Reply-To: <dab7d359-4433-448f-b781-03544fd4b68d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2024 11:40, Sergiy Kibrik wrote:
> 09.08.24 13:36, Alejandro Vallejo:
>> On Fri Aug 9, 2024 at 11:09 AM BST, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/cpu/Makefile
>>> +++ b/xen/arch/x86/cpu/Makefile
>>> @@ -6,10 +6,10 @@ obj-y += amd.o
>>>   obj-y += centaur.o
>>>   obj-y += common.o
>>>   obj-y += hygon.o
>>> -obj-y += intel.o
>>> -obj-y += intel_cacheinfo.o
>>> +obj-$(CONFIG_INTEL) += intel.o
>>> +obj-$(CONFIG_INTEL) += intel_cacheinfo.o
>>>   obj-y += mwait-idle.o
>>> -obj-y += shanghai.o
>>> +obj-$(CONFIG_INTEL) += shanghai.o
>>
>> Why pick this one too? It's based on VIA IP, aiui.
> 
> shanghai.c and intel.c both use init_intel_cacheinfo() routine, so 
> there's build dependency on Intel code.

Yet Shanghai isn't as directly a clone of Intel CPUs as Hygon ones are
for AMD. So at the very least you want to justify your choice in the
description. After all there's also the alternative of having a separate
SHANGHAI Kconfig setting, which would merely have "select INTEL" or
"depends on INTEL".

Jan

