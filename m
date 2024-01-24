Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787BC83A487
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670797.1043805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYw8-0003Yg-K0; Wed, 24 Jan 2024 08:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670797.1043805; Wed, 24 Jan 2024 08:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYw8-0003W5-H3; Wed, 24 Jan 2024 08:48:44 +0000
Received: by outflank-mailman (input) for mailman id 670797;
 Wed, 24 Jan 2024 08:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSYw7-0003Vz-33
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:48:43 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f7b8406-ba95-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 09:48:41 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cf2a381b86so1797751fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:48:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r6-20020a056638044600b0046ea43e4d0csm317612jap.168.2024.01.24.00.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 00:48:40 -0800 (PST)
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
X-Inumbo-ID: 5f7b8406-ba95-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706086120; x=1706690920; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vma3ZstLlvtgIcV3IBZ8UWRQOuJC04zV0bqwgc+mfgk=;
        b=e5tj/5CGiNI1avgluGg/wVbNvjV9ajTWsCgHEveyDznD9x/hCk39b2lJiAJ+lV8hEn
         5sazC00ibqqs/uLGQrMjAq73deZUwfAR80pTFRcoV/cDUofeEmQd5nSBGAYoM4bTdDby
         EUSXyE7t+782gRR/dug54shFhHJvAoRkYOygP6R5pahFPZOJXtbLSAAZp+gGhKdS815Z
         6ZIKc87s3HrAoq885z5USFV9DiZKcx1LIXrgJBDPwnhuKiEF8OkjWPM/w3AwLgPUia+A
         HkfDG+9s/cC+H73UllIm4fLes/Z843J+Swv3JZl1xJjY8tddUXB/UDWVbacB/ufcVCBY
         8Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706086120; x=1706690920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vma3ZstLlvtgIcV3IBZ8UWRQOuJC04zV0bqwgc+mfgk=;
        b=srbUr5/mzEOAaBK5kNp+9tYgHczGmJc+7unR4rUY3jEcgSVpkNjNP/2Tc3PuLC49O5
         xMn9zwuupqLj0MYMzEP3pbgvoMa/uWNlwsq8X59fw4F/pOnEI/NyT9ZNFx2oDQR7cYG8
         jXVv3O2kSbPgpEMycmuF1skBhZ9v4WsA2H5LSsThgD/4uzZv/xcsn65F4sG602zjedAB
         /Qulyimh9umqOWmWTQPMPe+kQiiQoOPegHfsUuKClAXUAwtGIrFOp21eXGUhdpunRQuy
         ibkXStKDnWec93tJp3lVp6CuAxsGoK9ItK3UWbCBg8aMOUaPXNvsO58M09Akax5s90Ol
         QZHQ==
X-Gm-Message-State: AOJu0YyRNJbZfthAwQrxXlebP4hoz+TI/R0aR/whk9NrANeNPj+zAFoN
	WqnPbwm5cT49CPBYZAAu9nuCRgLnf9uEnT8eNV76JI9QbefZ6jDhWuC7ZRbsPA==
X-Google-Smtp-Source: AGHT+IFH9ezyHCKvewPgv3wEjtntSZmXZQDE/aU9FBIv8fMP1SF7TXNWGys1VtJl3f3ALo0K/MxsGQ==
X-Received: by 2002:a2e:910d:0:b0:2ce:5520:8b9f with SMTP id m13-20020a2e910d000000b002ce55208b9fmr570962ljg.92.1706086120562;
        Wed, 24 Jan 2024 00:48:40 -0800 (PST)
Message-ID: <ae7a57f2-2433-4b75-ab45-c8be55d489c9@suse.com>
Date: Wed, 24 Jan 2024 09:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com> <Za_WGzS14Eqt8yZF@macbook>
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
In-Reply-To: <Za_WGzS14Eqt8yZF@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 16:07, Roger Pau Monné wrote:
> On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>>  {
>>>      int irq, pirq, ret;
>>>  
>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>
>> If either lock is sufficient to hold here, ...
>>
>>> --- a/xen/arch/x86/physdev.c
>>> +++ b/xen/arch/x86/physdev.c
>>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>>>  
>>>      case MAP_PIRQ_TYPE_MSI:
>>>      case MAP_PIRQ_TYPE_MULTI_MSI:
>>> +        pcidevs_lock();
>>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
>>> +        pcidevs_unlock();
>>>          break;
>>
> 
> IIRC (Stewart can further comment) this is done holding the pcidevs
> lock to keep the path unmodified, as there's no need to hold the
> per-domain rwlock.

Yet why would we prefer to acquire a global lock when a per-domain one
suffices?

Jan

