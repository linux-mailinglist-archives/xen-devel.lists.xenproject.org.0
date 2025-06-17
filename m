Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48962ADC240
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 08:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017724.1394720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRPdX-0004c5-Oe; Tue, 17 Jun 2025 06:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017724.1394720; Tue, 17 Jun 2025 06:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRPdX-0004Zp-Lv; Tue, 17 Jun 2025 06:17:35 +0000
Received: by outflank-mailman (input) for mailman id 1017724;
 Tue, 17 Jun 2025 06:17:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRPdW-0004Zj-JT
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 06:17:34 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0ce8a74-4b42-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 08:17:32 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-453066fad06so39425575e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 23:17:32 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f21a:fe:66b6:9dc3:86d6?
 (p200300cab711f21a00fe66b69dc386d6.dip0.t-ipconnect.de.
 [2003:ca:b711:f21a:fe:66b6:9dc3:86d6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e243e59sm162872685e9.19.2025.06.16.23.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 23:17:31 -0700 (PDT)
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
X-Inumbo-ID: c0ce8a74-4b42-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750141052; x=1750745852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j+cvENjQSVy6AR3VFR9VvG6CKctBWzuWV9105hi+jVU=;
        b=MoDSUvkovtR7p3U80ocUy6cPrIg/K4NdOwbCsQsDLSi/tA1UTSQA7vKmWPUSqTEUwF
         zRgSqQzk6iY3m5RaZrwJs1ZbcsZwj7dF99qC6Q2UMoS11N5wYMEJxqd0gm4wyMnFmJzP
         5DRFDjPB0gknSDdhuuNp8Ey7x038ikka2R08tiacPLNi2UFFvoTTMLLslO3mg8E7qMVr
         EhO2JEJ3INmyYZMtNwrcmdSa7+BoprBZCvtSUfsaQKCHTXA468+xtlGX15CfUFz/E6nv
         M1MW2RBEKmutm6+dAgyw3OxEzqwLJM9g22y+n8rllyau8xR2JiaVY4ClY9JlrVU9nc5Y
         3vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750141052; x=1750745852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+cvENjQSVy6AR3VFR9VvG6CKctBWzuWV9105hi+jVU=;
        b=X2Nj6eR72K/bcO1yDQ3Aa3+g2+JO590MGm3nEXktJ6bMG3ar+Nb5xugQtL6qYyC5Q8
         8rYlictpe4+hpPPe6JtEVvlLozQIXa5Kej/fH+iR+ENnUrCUlB/1q7AIgO8nMiIcGh06
         QMXrj9WFRRGLpwW9l18Hv7/VLEHFcEUjWIXRG9OxYsv5a6hTt6hYo2uVwUD98C74rZME
         ohqPRNO8QnlgkVvgIm7I1Uvw83+KIfBoAktinstcuy8cgvERzoHR61hk5HWWVrN/Sj5w
         fO4frkm5YNXo53LUahLRDcGS1AyFALy0wJtHhayjOyBb+S7qvjb2ph7zCJjFBtyxpNf/
         vaFw==
X-Forwarded-Encrypted: i=1; AJvYcCXJMSAS1pwkYdJy2hKvzeTMA67Rx5jFigznqiGVQp5ZsxpRhOR774Qv5qqGXDgM5CNoY/d3MaYD/qY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/Up27pVL5AcR8woEvFXXM2mK/9NheCTDQA3v/4EF+X6cXshal
	JS+4yPSTXFHtwOJRd5FlhY/aiezrT81w+q8It5wVW6Tumh5/lX6vyg+1ZtpKDP0g6g==
X-Gm-Gg: ASbGnctid5BOsSlLfGhCFBZibwIV2/KLTrPUHE+mrGyh1awe7pQza46BIoxjns0Hxhx
	VIfME+eLARFEYxaP/UkNNH5lsFCigcBTnBpqyWz5RgGI+tdRSj5lMw2NbZuFyFGAdFYufa58F2c
	tAjmd8d+ewrni0OlR3nLAD0xVRrhRQzsD7QCfDnaNG2TjOd2UdMGa9uLARIBpP4zM6mqRerpCOu
	WLTYUC4OtRc7EYlfkkwX4Tyi2z3969dD72SOlA4wFrD2LfIrEGxqdc9GdldMsp8WKBvd9veu7Ym
	MBUDV+7ThgciGJMgcas55f9n7/T0SYjp2MzTebdN7JO1tQKr2sBkUCwTSllYA+XMx35PWHQmP8z
	gWyigFUTDsJehmqfIpVRmQvMVIyHMhddQVm+yHch9lei385UfpKdVT7NWt8tFm5QN/QWcNxwBWM
	W8Ofn5INDP2zIKwzA=
X-Google-Smtp-Source: AGHT+IFlBHcJwxNmB5dE8FBMuuD+3OJX7kazG0LZHXwJnfUv1JOT/WsWHXsqYU/6/415jw52oN3x8w==
X-Received: by 2002:a05:600c:8b26:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-4533cab1613mr89633665e9.23.1750141051824;
        Mon, 16 Jun 2025 23:17:31 -0700 (PDT)
Message-ID: <beb54673-2de5-4bec-a963-7afb0e67540e@suse.com>
Date: Tue, 17 Jun 2025 08:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT
To: Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <agarciav@amd.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-15-agarciav@amd.com>
 <2a54e49b-c1ad-4654-9291-4373e92580ff@xen.org>
 <DAO1A9SJ9I2G.2L00II6AC0JDZ@amd.com>
 <alpine.DEB.2.22.394.2506161639240.1384757@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506161639240.1384757@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2025 01:39, Stefano Stabellini wrote:
> On Mon, 16 Jun 2025, Alejandro Vallejo wrote:
>> On Mon Jun 16, 2025 at 10:00 AM CEST, Julien Grall wrote:
>>> Hi,
>>>
>>> On 13/06/2025 16:13, Alejandro Vallejo wrote:
>>>> Without picking CONFIG_HAS_DEVICE_TREE.
>>>>
>>>> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
>>>> of the common/device-tree/ directory. 
>>>  > x86 doesn't want dom0less-build.c,> as that's tightly integrated 
>>> still to the ARM way of building domains.
>>>
>>> I don't understand this argument. dom0less-build.c was moved to common 
>>> and it will soon be used by RISC-V. This raises the question what's so 
>>> special with x86?
>>
>> That's 2 separate matters:
>>
>>   1. dom0less-build.c not being compiled in.
>>   2. CONFIG_DOM0LESS_BOOT enabling use of DT code without CONFIG_HAS_DEVICE_TREE.
>>
>> (1) is a matter of not wanting to boil the ocean upfront. The way x86 and
>> everyone else build domains is just different and duplicated in non-trivially
>> consolidable ways. The goal here is to enable the domain builders in any arch
>> to use the same backbone. I don't want to go the extra mile just yet to unify
>> domain construction (though in time I will want to).
>>
>> (2) has to do with compiling OUT things I really cannot have around. Anything
>> involving devices described in a DT must not exist on x86, because it has no
>> concept of a "struct device".
>>
>> My intent is/was to repurpose CONFIG_HAS_DEVICE_TREE to mean "this hypervisor
>> goes on a platform that gives a platform-describing DT". On x86 that's given by
>> DSDT/SSDTs with ACPI.
> 
> Alejandro is suggesting two levels of Device Tree support:
> 
> - full DT support, including device discovery via DT
> - minimal DT support, for the dom0less/hyperlaunch configuration
> 
> Reading this series, it looks reasonable to me, at least as a stepping
> stone. I think it is expected that the kind of DT support needed by an
> architecture like ARM or RISC-V is different from the one needed by an
> architecture like x86. Of course we might be able to align things even
> more in the future but as of today I think it is reasonable to
> distinguish between the two.
> 
> That said, we might want to consider renaming or changing the kconfig
> options. For instance:
> 
> - CONFIG_HAS_DEVICE_TREE -> enable minimal DT support
> - CONFIG_DT_DEVICE_DISCOVERY -> device discovery via DT
> 
> In this model, all architectures would have CONFIG_HAS_DEVICE_TREE,

In which case - do we still need HAS_DEVICE_TREE?

Jan

> but
> only ARM and RISC-V would have CONFIG_DT_DEVICE_DISCOVERY.

