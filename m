Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F6F93F2F7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 12:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766575.1177073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYNnm-0005t0-8D; Mon, 29 Jul 2024 10:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766575.1177073; Mon, 29 Jul 2024 10:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYNnm-0005qu-4b; Mon, 29 Jul 2024 10:40:26 +0000
Received: by outflank-mailman (input) for mailman id 766575;
 Mon, 29 Jul 2024 10:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYNnk-0005qo-Lk
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 10:40:24 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f50151e1-4d96-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 12:40:22 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7aada2358fso612291166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 03:40:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de6fsm493592866b.63.2024.07.29.03.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 03:40:21 -0700 (PDT)
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
X-Inumbo-ID: f50151e1-4d96-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722249622; x=1722854422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CyjpNTegy+UU7KeQwylz5bSCg0p9AmxPerrRAfmVEqQ=;
        b=M1BD46JMtqHR31QZabe59BvlmwspTwkuYdVa0ksAh9rKIicDYNR6CnvsGR2n66inz/
         CMkVtojiWue8CQfN4TWvLds/JnblfToDziktxi7EzQv36Uje7qGcSqSkyT2pSdbb+jIs
         JJZSFFwx80/GFT9BG4Ok53RDcNAGKBQB4Rfgjw+D7vgt1bgpQ3x/WKI2q63Z5dLNRs9t
         qIVOBrjn34R3mCUh2ff4nO2E8klN6J2uz+wijh0ecEyrg6SrU/gBS2YAfNGncrIgWIBJ
         EKLjPi76W7fVmTFpNSy6lh8E/Qm2bSrntJtZXIKcPLtWUVuxXo50/JF+T7TVPZs8N/T7
         Z8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722249622; x=1722854422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyjpNTegy+UU7KeQwylz5bSCg0p9AmxPerrRAfmVEqQ=;
        b=EXEfxz0El6qj7uWsSMoTFcpUlC4F6aedrkq8LWrVJP/DElcB90ANxbckzeW055ysyZ
         JOyo8QfC1ZpIqjRa9ArnBnS17bp0h0MQYEzSrUb3FJl1hvzBa00TbJGjlsx1zxhEl6W9
         WPWuVmNugf7VnHEUqGOtwkSy7s5SghKJBJEunbzwBIZ2+i+58mG6t3NFHpNY+DzzdyQm
         a/8Z7uY/5Vk6CtCVxFWHlqocfK+Uxo5byDF2sLICQ68gXBdGd4WYgUcPcz+YncAxyCTr
         WkAwvDNburo0ocR/9oC9KL+xGzxsxd4ttejjjown95VWQK9+TEd6y7ydUz7lNQGUq2E7
         zRbg==
X-Forwarded-Encrypted: i=1; AJvYcCV5/FAig1b1lHaVchugCf4RsjBXYZ/ZpDG5aZhrFuwRMMafyplKe1EE8sR6fK4f+/yOAEdTAE8LzrErdsXfFP6IEwOkwyZxS+Q2esqr/VE=
X-Gm-Message-State: AOJu0Yxh/i8QBWuT6NH9fOsNp0LVQSpn3nhLSPuzEcIMoWojzXTNHeP+
	MU3wtmFNRVPCHleItnXm8XITdMkaw2wZE0Gv1WEm7CWUchz4xQvDI6LfH2pdgQ==
X-Google-Smtp-Source: AGHT+IHElL4ZMTUkg7Of0OxTLAURpm/cVQa0+kC6UsnhS1t5lPBibttEniWvVv33bvZ1W01A7LPTUg==
X-Received: by 2002:a17:907:9403:b0:a6f:e0f0:d669 with SMTP id a640c23a62f3a-a7d3f85b402mr708468266b.12.1722249621821;
        Mon, 29 Jul 2024 03:40:21 -0700 (PDT)
Message-ID: <dcca64aa-eb2c-41e2-9f24-3fdc26e6e367@suse.com>
Date: Mon, 29 Jul 2024 12:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.19] CHANGELOG.md: Finalize changes in 4.19 release
 cycle
To: oleksii.kurochko@gmail.com
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <0c93b49ac00fa92721035b4f9eb2ae76175fe886.1722237887.git.oleksii.kurochko@gmail.com>
 <f2450b46-3542-4e1c-b7d7-8735b1839791@suse.com>
 <843c1b340e153cb535f28872a95623cf46a35981.camel@gmail.com>
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
In-Reply-To: <843c1b340e153cb535f28872a95623cf46a35981.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2024 12:20, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-29 at 10:11 +0200, Jan Beulich wrote:
>> On 29.07.2024 09:31, Oleksii Kurochko wrote:
>>> @@ -31,6 +47,14 @@ The format is based on [Keep a
>>> Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   - Add a new 9pfs backend running as a daemon in dom0. First user
>>> is
>>>     Xenstore-stubdom now being able to support full Xenstore trace
>>> capability.
>>>   - libxl support for backendtype=tap with tapback.
>>> + - On Arm:
>>> +   - FF-A notification support.
>>> +   - Introduction of dynamic node programming using overlay dtbo.
>>
>> This is fine to have. I wonder though if the per-arch sections
>> wouldn't
>> better sit next to each other (all at the top or all at the bottom).
> I didn't get you here. Everything in "### Added" is sorted per-arch.

But x86 is at the start of the section, whereas you add to the bottom.

>>> + - On PPC:
>>> +   - Basic exception handler implementation.
>>> + - On RISCV:
>>> +   - Identity mapping implementation.
>>> +   - Introduction of architecture-specific headers.
>>
>> These again don't concern people using Xen, do they?
> Well, I agree that PPC/RISCV is far away from being used but still it
> shows that progress is going on.
> 
> Do we have the document which tell what should be in CHANGELOG and what
> shouldn't?

I'm not aware of any. And as mentioned, there has been disagreement before.

Jan

