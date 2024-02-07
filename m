Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A284C8DE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677374.1053938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfOI-0003ki-AP; Wed, 07 Feb 2024 10:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677374.1053938; Wed, 07 Feb 2024 10:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfOI-0003jY-5X; Wed, 07 Feb 2024 10:42:54 +0000
Received: by outflank-mailman (input) for mailman id 677374;
 Wed, 07 Feb 2024 10:42:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXfOG-0003i8-BV
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:42:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4538263-c5a5-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 11:42:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fff96d5d7so3821185e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 02:42:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r18-20020adfe692000000b0033afc81fc00sm1180459wrm.41.2024.02.07.02.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:42:50 -0800 (PST)
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
X-Inumbo-ID: a4538263-c5a5-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707302571; x=1707907371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ps2vaANjIsrQ7LJvCFKOCFibXgAxuGnwkpFAFDL5+ks=;
        b=XR7zncJLMoIdsrurWfwDl9/bPcOn4gnJXjZsf5YAz0BRRgosEE7AYECmqX/19V5Clu
         MDzdi3DLQo5Mf8SUYJIRajmUS9iy/vfAjYMkA957L85xX6qiOnenLcDwN4XscZ1977Sk
         yisuA2RXG+ppHClMEMFwvrnshHvJkexYDWYuH3F1w9aJ1wRdOUzXtBj42rno/8q1vW16
         KYooIwntlTpKl3WWKCpXJoGIHxNlkP8k4GlWZ72MYo7tCXvVDLX3tcouuenbbkZ3fJWR
         iyGPKT/+IdmkfWLlJ96nG6lKZvj3/Gxc4Smb4VEFqbgF2Xlo4qiFO26GjON/evSEkIMf
         8CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302571; x=1707907371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ps2vaANjIsrQ7LJvCFKOCFibXgAxuGnwkpFAFDL5+ks=;
        b=ecqj8gHpXRwKoRx2EmvnLeXoLNKAAgw2SGCa2jsq8ynkidj5jmlFXoOvZt8spemzWI
         0G0my0o4gBaKzQQI/J3ur35eCi71vPzImFGmCJWevAAjdF5qewc4LSRl7DsCPA2Uh9Lx
         VvJbMqgK+ymgsMJJnnf5INZ1FVZXRtkE5dYmDon2zIzNrJZq4ecDwhPx9flk6wZgAKxI
         y07FTiZDJd5qUlqkTabS6/i3RCuP7Y0aPi6zJgz2oycGy3SwXgXMBMiHo3K+dFhejRgW
         pDdI81JHwyxb93gp+Z7eBJUdJIAzzma2424+Ifxw1ZAeTKuF8PdKczCNXZHPyWx0Er5p
         ZVAQ==
X-Gm-Message-State: AOJu0YyWUxzUuqqVxlmN+MASmLcQMGSrdWSTV8YxXuVY8FMaMmx6s6fC
	MFz6Y0MXuCtvJU2FFW6f92VglRJ8deVRtm3Dd4mWqndXqZneeFE60EB4jtY89BuQoohJSC5K6F4
	=
X-Google-Smtp-Source: AGHT+IECWXUKvv/5uALmqI/6+NRnfoWMhScEbIoXGiOarsUYOeMjrdeU+XlybQV/vnZopLAIOzFiNA==
X-Received: by 2002:a05:600c:1e1a:b0:40f:f069:8d13 with SMTP id ay26-20020a05600c1e1a00b0040ff0698d13mr2711605wmb.9.1707302570834;
        Wed, 07 Feb 2024 02:42:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLnG8mEx8JVmkKWLDyi0dAG/3gCzs4Vj95Sc/EQgCgprPpZy3ohf6Eeb43L3CcPfs0WWh+8BbZEKG8yV4O2c2xNXslm39wUIxL6y7nP+E=
Message-ID: <361f91c2-af27-4506-986d-0f580edb7861@suse.com>
Date: Wed, 7 Feb 2024 11:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] iommu/x86: make unity range checking more strict
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-5-roger.pau@citrix.com>
 <5db22ee1-40b3-4df8-88b8-446a2e224d22@suse.com> <ZcNKDKD4G7fpIX80@macbook>
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
In-Reply-To: <ZcNKDKD4G7fpIX80@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.02.2024 10:14, Roger Pau Monné wrote:
> On Tue, Feb 06, 2024 at 12:49:08PM +0100, Jan Beulich wrote:
>> On 01.02.2024 18:01, Roger Pau Monne wrote:
>>> Currently when a unity range overlaps with memory being used as RAM by the
>>> hypervisor the result would be that the IOMMU gets disabled.  However that's
>>> not enough, as even with the IOMMU disabled the device will still access the
>>> affected RAM areas.
>>
>> Hmm, no, I think this is going too far. Not the least because it is
>> s/will/may/. But also because if we really wanted such behavior, we
>> ought to also parse the respective ACPI tables when the "iommu=off".
> 
> I guessed so, hence why it's the last patch in the series.  TBH I
> think it's very unlikely that such system exist.

And you think so despite knowing that on some systems one needs to
manually specify RMRR regions?

>>> Doing so also allows to simplify the code and use a switch over the reported
>>> memory type(s).
>>
>> I'm afraid this isn't right either: page_get_ram_type() can set
>> multiple bits in its output.
> 
> It can indeed.  But if the only bit set is RAM_TYPE_CONVENTIONAL then
> the page will be handled as RAM, and that's where Xen would be in
> trouble if a device is also using such page as a unity map.
> 
> If the page however is RAM_TYPE_CONVENTIONAL | RAM_TYPE_RESERVED then
> the RESERVED type will take over the whole page, and it's no longer an
> issue to have a unity range covering it.

Okay, if this is intentional, than saying so in a code comment would
imo help quite a bit.

Jan

