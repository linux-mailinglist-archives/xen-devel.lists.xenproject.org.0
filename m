Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30316AB4D9C
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 10:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982615.1368972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkdX-0004ll-Ck; Tue, 13 May 2025 08:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982615.1368972; Tue, 13 May 2025 08:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkdX-0004jy-95; Tue, 13 May 2025 08:05:15 +0000
Received: by outflank-mailman (input) for mailman id 982615;
 Tue, 13 May 2025 08:05:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEkdW-0004jq-Bk
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 08:05:14 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id febdeaa5-2fd0-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 10:05:12 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad220f139adso668911066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 01:05:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd3easm746030766b.147.2025.05.13.01.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 01:05:11 -0700 (PDT)
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
X-Inumbo-ID: febdeaa5-2fd0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747123512; x=1747728312; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qhc7KU2TkVmWCuYhyiKWn2JMdy9m2ONo+uhDFAimjcs=;
        b=NV4lymZWhBKIwr+/Eh0wh9igPS9hV3DBxBtW3yyBl3BAz2jZUvO3G0Zu5VftIeAP3B
         rPTRPcINRCHuH4J1eLaPr6+pjkcKMtSILbjDQ+Zb0UoU7v/I3BWDkRI+TT4FaCq0rBje
         elwo1zPBV8ooD2avU1eX8Pe3b4ZXSvvY7VwIUjgVE7QidOBnL2alaC5C49Oo5W2wiu4x
         mUwZMdRBHbhe73cp5cM8VT8HQw2FfhtO9V5L4nf0KV4/l8Fqi843ZJr9O39RrG/mZZED
         vR9dgLBjtjSG4mAydSbs0oWf6zEPUe71dUgGQ4yjI18fPLPoYUmFoKOFFidH5aOlkNoL
         Zy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123512; x=1747728312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qhc7KU2TkVmWCuYhyiKWn2JMdy9m2ONo+uhDFAimjcs=;
        b=PJa7lKgK+kIz56Fu/ylwNk2C/tI1JzgUXjmUhikrVaZ5GRFhvDyG3PEaPYfqKqguIS
         WK2CDhMVkWyMhq0TX85uQWbB3Zas6iz3RyHrEepXgqSS53XUifXFRzjbbt6ODOwi2MYk
         EvxGNING6fijnjoerZeGHM873JdCw2HDO1DBNuowjX2HJrkAMwfLlR4eoSGu2tvL7fbH
         BrfhZCb5Fiinwym1fwtCSqa4hb493k5nJHzsAWT3lLjfjYMqDqr/F+A9UeTtOtwZKFRi
         esV4BvHpTubL9xekAw8cpdXMpmobCGF3ehFVUdfaQANG60bwRMWrjeRGBB+AJcLYMr3u
         8Hqw==
X-Forwarded-Encrypted: i=1; AJvYcCVLlyk47hYZJEOv5gFFq9mSim/aJ+pxCMkgnk21gHmgE7EfRUA4LSRhhmZ85Jtw/vybORhTeO8d+aU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzY+kOIG/qthQGNBphvEcSSM0ctfRjhLmnfcDQSVBx7vMbl3d6u
	MOmtPMKQQ8IXTYKRr5GmIcyJyEBjC0781nhBoGDyN10VAK+gVGJ16MIt36vubg==
X-Gm-Gg: ASbGnctRpZs95KCgc+pby6JFyXu5a/39CFfrllopcy37p31bhb1YHFdAq3y4i7QkKxi
	W2G+arHjRYAwbm+JqR1h08EA8QG8/B10p4yfZpMQhIxvlAK93t3pX117SVAFsIzv4+qZZxhoryt
	W+9X77xcYQAwXpIaffzyGuu1mRhYiX2qvuRBc5btB/SUKxnwXf0ku+q6pps+SMP8edKujZmLAVF
	+BPDrk4P74ZQZ4A+64Tmu3g3+wMyxABBBGjLa/gj+DKpZZs6Jbd82Pn8xoNOS/SljBIBm1Mvy0h
	VEymRJevZyX5debkW3QxJwfhlz7IdOiX0euDGMKoeOFJWkk+B9ofU36/s9P6+1uG7ZwijUzP3kL
	RA/GAAXct2tjyOPiQTMvQDWCTuHetO/EMHS5p
X-Google-Smtp-Source: AGHT+IGdpkV1rXfWFW5ArV5p4x5mkMBmQVRGiazEKUYiqL7e/hqzy2KHwOgPazQM+Wj2IUhzpEiSGg==
X-Received: by 2002:a17:907:d30a:b0:ac7:3817:d8da with SMTP id a640c23a62f3a-ad2192b5b2dmr1439829566b.52.1747123511686;
        Tue, 13 May 2025 01:05:11 -0700 (PDT)
Message-ID: <f8828ac3-face-401b-bad6-84eef390cab6@suse.com>
Date: Tue, 13 May 2025 10:05:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/12] common/hyperlaunch: introduce the domain builder
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>,
 Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-3-agarciav@amd.com>
 <9021c878-9605-4d6e-95b8-ab97da186542@apertussolutions.com>
 <29a55d44-c26e-4834-b93b-47cbd98f885e@suse.com>
 <f199c2a3-88c6-4578-8667-2060a79285d6@apertussolutions.com>
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
In-Reply-To: <f199c2a3-88c6-4578-8667-2060a79285d6@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 21:29, Daniel P. Smith wrote:
> On 5/2/25 03:21, Jan Beulich wrote:
>> On 30.04.2025 20:56, Daniel P. Smith wrote:
>>> On 4/29/25 08:36, Alejandro Vallejo wrote:
>>>> --- a/xen/common/Makefile
>>>> +++ b/xen/common/Makefile
>>>> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>>>>    obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
>>>>    obj-$(CONFIG_IOREQ_SERVER) += dm.o
>>>>    obj-y += domain.o
>>>> +obj-$(CONFIG_DOMAIN_BUILDER) += domain-builder/
>>>
>>> Please don't do this, use IF_ENABLED in core.c and then hide the
>>> unnecessary units in domain-builder/Makefile as I originally had it.
>>> This allows for a much easier time incrementally converting the dom0
>>> construction path into a generalized domain construction path.
>>
>> That is, are you viewing this as a transitional thing only? If the end
>> goal is to have it as Alejandro has it above, that may be acceptable
>> (even if not nice).
> 
> There is/will be shared domain construction code between dom0-only and 
> multidomain construction, with it will all living under domain builder. 
> So no, the end goal is not what Alejandro just did. The end result will 
> be the way I had it, with a different kconfig option to enable/disable 
> the multidomain construction path.

Isn't CONFIG_DOMAIN_BUILDER a misnomer then?

Jan

