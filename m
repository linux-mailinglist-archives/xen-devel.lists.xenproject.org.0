Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6DB9D7D3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 07:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129833.1469555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1emC-0002AW-PR; Thu, 25 Sep 2025 05:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129833.1469555; Thu, 25 Sep 2025 05:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1emC-00027q-Im; Thu, 25 Sep 2025 05:44:20 +0000
Received: by outflank-mailman (input) for mailman id 1129833;
 Thu, 25 Sep 2025 05:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1emB-00027k-6I
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 05:44:19 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aab2eb65-99d2-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 07:44:13 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-62fa99bcfcdso1107538a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 22:44:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a365093asm612580a12.18.2025.09.24.22.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 22:44:12 -0700 (PDT)
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
X-Inumbo-ID: aab2eb65-99d2-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758779053; x=1759383853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rLBQ1A9VcSHpoybROb7rfRVVoXLeQZXYgMx9RyaCD+E=;
        b=UoxaBtbfYGw7mrphKmAYpTM/q8IMZKN44xKKa+XifIOKIG39KfUkx+4Y0fJUZQmKkU
         5Sfa9o9qUPpa0ayxtVOWcvOImkv4OxzLV0Bewz2OhnhA9B16OkfVE7KXzqcCJWnsOQiv
         /La+ir8AOX9ek4UqxCaq3Q9Fi75tMUl8fY2SlFcZ0FuQZlgwpoaZM0g119oJ4GqfS9l8
         EJwbib4oi/G4Vvyw9Ge+d3g+t8TShtHKSzbDLAyojPVvnOvQfbINtQxjKmfGIJ0zLlrm
         LPpia7YTHVfRbPMcSzrecg9bW9WGFW90Ox28NdfPYsiVXXhdzSPr/0lTfmk0Dp2fx3Cb
         UDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779053; x=1759383853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLBQ1A9VcSHpoybROb7rfRVVoXLeQZXYgMx9RyaCD+E=;
        b=O9zUEAFJ223SWmm8d8fKbM18ANIV2IATWfZkXM5yY6fJVbccx3J2B7AsZkHi+ly6MU
         ywm0jviJ3DaifZSIaUKnXJ/VePzrwoMOv5iZQmS7DovZX0khDVF7aoQwpUOjC5Yy/3xA
         AVPE2OJwlETGgL69bIdfrpCcDr8h9BwE6Dm37BWom9+X4EPY6Z5Ya/Hh/WA2o8bQZg5u
         weEJXU3trE6mmwR3DC2Z9umgU6ZEH9BGMVojp3xXH04Hw/Nyan5KRgaJLuxkB5wA6maf
         X76cCDEjQEaz3y3dlMermWtS+eahUS9QM9Ap2TYKzVemYPnhCz/Rmw8QzD9cQ0soACe9
         cz3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJeuncBDlrd7IcDuqruK+npn3lRiAl7S40ZD0gcgnyfopPM7sm7f8zvfd3jrmzLxDq3fUHFA+KMRo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxY1FVgjQXkK/caOiwVGFFwXK6rQeSgB/ej4rvfNB7Ol1NGQ/pa
	vSZwOtbuN9b+WEliRSeV8UYCaks4rDsxSOxwZchVToPPfgxMRS/ps24c66Qzm1SjAA==
X-Gm-Gg: ASbGncvVLV/8vJ3M6sJSf1BREuEixJt7p1CTIpP/jRs24Eyvpfll3RYHAAAcBaXQdNY
	prBrEvPIVfOSRLpuKrIdw+VhJ2N/zyoqoow1bTAXtUoPnl55VSCulJpgmTf0qqCqqibBwPbxXhM
	eZireAOborHdSMKagqy3m/ScsCWJ4lzU9+tFxGBQOXPCzSR7wUcatrddnIG91bVhkkg4vVwpYJS
	yf6SkU6OL9xTxjhESxHBkQ0PxRd03w30eOX8w6MWyZPWM3qWPPdvtzptBWhx1dXoOg1qaJuPt4Z
	SzIem4iMVtuCkPkI/aiWBY2EmaiM6n981rGCd83YOGsmnN4YkkEiMh80o/NhcTQP7spQujT8wtc
	fsh0EUBe9Hg+e5JTbdl6C5r39fr2HIvrXO0Al0khdj9mtsRBX9VA4umU6uRFMtGnfHQBFNOyAqr
	ZiBWppuks=
X-Google-Smtp-Source: AGHT+IGMajGtJ8WmWHv5rRGl5i4ZwfS9F4shxXK6bZ43ApJ8oPxcMhaBsSqfxmiq7K9nzIbgd9asHw==
X-Received: by 2002:a05:6402:2383:b0:634:5791:605f with SMTP id 4fb4d7f45d1cf-6349f9d26a5mr1449144a12.4.1758779053009;
        Wed, 24 Sep 2025 22:44:13 -0700 (PDT)
Message-ID: <3e0e8291-e1c5-459f-b13f-c0aaa8b7778d@suse.com>
Date: Thu, 25 Sep 2025 07:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm/sysctl: Implement cpu hotplug ops
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <34c9b488ad949cbcd93bd8578dd5bc180fab8738.1758197507.git.mykyta_poturai@epam.com>
 <ddce2b69-3ba3-4c04-ab82-092ce2c98cf3@xen.org>
 <c05674a4-2090-4453-98a8-8f4cc0f54c5c@suse.com>
 <7a12dbe0-c3dd-4e26-b52d-610e065236da@xen.org>
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
In-Reply-To: <7a12dbe0-c3dd-4e26-b52d-610e065236da@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2025 20:41, Julien Grall wrote:
> On 18/09/2025 15:51, Jan Beulich wrote:
>> On 18.09.2025 15:35, Julien Grall wrote:
>>> On 18/09/2025 13:16, Mykyta Poturai wrote:
>>>> +static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
>>>> +{
>>>> +    bool up;
>>>> +
>>>> +    switch (hotplug->op) {
>>>> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
>>>> +            if ( hotplug->cpu == 0 )
>>>
>>> I can't find a similar check on x86. Do you have any pointer?
>>
>> When CPU 0 cannot be brought down (see cpu_down()), tryin to bring it up
>> is kind of pointless, and hence can perhaps be short circuited like this?
> 
> Thanks for the clarification, I missed the check in cpu_down(). That 
> said, I don't see any value to short circuit it. In fact, I see this as 
> more a risk because if we ever decide to allow CPU 0 to be offlined, 
> then it would be more difficult to find places where we short circuit it.
> 
> So I would rather prefer if we remove the checks.

In fact I agree (and I merely wanted to point out the present situation):
CPU0 not (normally) being possible to be brought down is, I think, pretty
much an x86 thing. I.e. I think the check would want to go away from
common code.

Jan

