Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77119ECA66
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:34:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854514.1267709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLK2c-0002Li-LV; Wed, 11 Dec 2024 10:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854514.1267709; Wed, 11 Dec 2024 10:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLK2c-0002HY-Hb; Wed, 11 Dec 2024 10:34:02 +0000
Received: by outflank-mailman (input) for mailman id 854514;
 Wed, 11 Dec 2024 10:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLK2b-0001aQ-0C
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:34:01 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f01c5fd-b7ab-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 11:34:00 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-434ab114753so43533335e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:34:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd560985e0sm3804655a12.79.2024.12.11.02.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:33:59 -0800 (PST)
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
X-Inumbo-ID: 6f01c5fd-b7ab-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733913240; x=1734518040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zTT2fI8Lh1KYGwkqJ4HYUDlHCdYmKmMDp5k482eZu/k=;
        b=Q8qxDWBcchuUbFo9zuJ6sZmq6LcXKzsPEeRDcd/J8Aohts7u+xeNrq7VYU3ZCVvNon
         jfNEqsYuKbSOxWBdeJdrywLuSsd5v7t0VWHu/TIH9TICz/Vnq5dzxtFrKI1WdSjRyHRh
         JD5TA/d+sfXUy5CL7Ic3qd3OQAZ0Rm51rU62uAibbRzB8tXNzs1lbCYW5i1UonyljEGp
         Mi+cpfYcOUD/Aiz6HVLaamypkSHf+0KiLfmHUfP2rHoQUTkxOgpaCLqpC/uvVtT4arrv
         Wn404rtqyIyiYyPFA6NrC5N7FeSscmmLycPMmozFpQNV7lEgptq12tvdnNRGJGH/DxUK
         Zceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733913240; x=1734518040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTT2fI8Lh1KYGwkqJ4HYUDlHCdYmKmMDp5k482eZu/k=;
        b=m+mHPFpLWQHdsul+Rd0NQ+yPptM1IatqdJUf+sNTCfCJdZ4FaqhuG1gwIi8KUrDWel
         ut2lQ3UGuad887OOQ6YyBXExZdlNG5TIX6D5UI4dDpuPPzZuPgRR4dSPj1C4tEOYZH87
         Zcl2iA752g0AvwIw2HLDh6DZOoH1F2QcszAx+HVlAz1UUOCAiSvkCp2cixK3wUCAe8X5
         4amtD3/09+vxyG1UsBax5Ufe1uAevWKv0BJli4/xO3wjrn2Pk9xil5YQbxZprYNdsc0o
         VUbOlW9dadaC948RoLt80YdIlEMWbypnmlaZ32KCENAlrjYB+EvUsICjZ7YHhdo7zrFE
         bRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyuRRl9zm1EGHc2p2/myAn6GmzW63dWl2AA40+k+bdVIUoj7bvssEYVf3Y928pTZouPauqj6aWMKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA6iHM7Bhl3ZFUlPnlntvZJCY67HzxtwcWUXtqoeQ2Pwaw4iI5
	5VuO/4lINq9JcZ1CML3wwoKwbA0baWUHPWwFB1E86l6wcVZMWLQ8ceL7jD02TA==
X-Gm-Gg: ASbGncvTR0eI3NLXl+OqRfpG41vI9iSdXXKPZK/nVC8szk4jF3lkcIIVPs0Qg7oZdoJ
	lSb0a2AQu5v57ZYgSzqtH8ei4URZYKXJYFNylNs+OsntjsABT2qHk1jNrrfDIIPc72yt4ByRZ97
	fmE5ttEViMSHP9FRnCrA1luZFZ82BzAy4OmiuwKQnryY4+juMQViz8K9vr4rsku8+VPGx6OzaUq
	lsMxPmIIT0u9F3XTFhjsdT7ANHM3x9pKgdCx7qZn35w4wUbYZSafY0wKSfTEFj7XsJhsnzfTfc6
	8u+yvOiML/tu26lD52/+48jktsSY3DtaGy6XnUw=
X-Google-Smtp-Source: AGHT+IG3A3P+FFDPJp7dUdCzkWzaG63tsDLnhw5PjtLpyZVCAzHMyEiQJDqoxigCtW6HvY9ezR4IgA==
X-Received: by 2002:a05:6000:188f:b0:386:62f:cf18 with SMTP id ffacd0b85a97d-3864ce9faa0mr1331702f8f.49.1733913239569;
        Wed, 11 Dec 2024 02:33:59 -0800 (PST)
Message-ID: <9e05dcb0-ae71-4efe-9f1b-effa7a60cf9f@suse.com>
Date: Wed, 11 Dec 2024 11:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen/riscv: implement relocate_fdt()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <c157b03a8cb6d9c4910136b5d73260b47c55554e.1732709650.git.oleksii.kurochko@gmail.com>
 <d9fddba7-8364-45a6-addd-004dbde366a5@suse.com>
 <4dd6a2e9-d2b9-4402-907b-b9314d2346f7@gmail.com>
 <929d657d-ffe8-4243-ba01-fffa20b26205@suse.com>
 <b9bcd015-330b-44a0-8660-c157369b4c96@gmail.com>
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
In-Reply-To: <b9bcd015-330b-44a0-8660-c157369b4c96@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 11:26, Oleksii Kurochko wrote:
> On 12/10/24 5:20 PM, Jan Beulich wrote:
>>>> Also recall my comment on one of your earlier series, regarding inclusive
>>>> vs exclusive ranges. Can that please be sorted properly as a prereq, to
>>>> avoid extending the inconsistency?
>>> Yes, I remember that and at the moment everything ( DIRECTMAP_VIRT_END, FRAMETABLE_VIRT_END )
>>> is following "inclusive" way. Considering that you remind me that could you please tell me more time
>>> what I am missing?
>> First the table azt the top of config.h uses all exclusive upper bounds.
>> And then DIRECTMAP_SIZE's definition assumes DIRECTMAP_SLOT_END would be
>> exclusive, when it's inclusive.
> 
> Really missed to update the tale on the top of config.h.
> 
> But it seems to me like any *_SIZE will be defined in exclusive way by its nature, doesn't it?

Of course. I'm not even sure "size" can be reasonably qualified as "exclusive" or
"inclusive".

> For example, size of directmap is (509-200+1)<<30 = 0x7F80000000 and it is not really (
> 0x7F80000000 - 1 ) = 7F7FFFFFFF.
> 
> I prefer to have DIRECTMAP_{SIZE,VIRT_END} defined as now:
>    #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END + 1) - SLOTN(DIRECTMAP_SLOT_START))
>    #define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
> ( of course with making upper bounds inclusive in the table on the top of config.h )

Right.

>>>>> +        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_RW);
>>>>> +        memcpy(dst, src + s, l);
>>>>> +        clean_dcache_va_range(dst, l);
>>>> Why is this necessary here? You're copying to plain RAM that Xen alone
>>>> is using.
>>> It is Arm specific:
>>> ```
>>> commit c60209d77e2c02de110ca0fdaa2582ef4e53d8fd
>>> Author: Stefano Stabellini<stefano.stabellini@eu.citrix.com>
>>> Date:   Mon Jan 21 12:40:31 2013 +0000
>>>
>>>       xen/arm: flush dcache after memcpy'ing the kernel image
>>>       
>>>       After memcpy'ing the kernel in guest memory we need to flush the dcache
>>>       to make sure that the data actually reaches the memory before we start
>>>       executing guest code with caches disabled.
>>>       
>>>       copy_from_paddr is the function that does the copy, so add a
>>>       flush_xen_dcache_va_range there.
>>> ```
>>> I wanted to put copy_from_paddr() to some common place at the end but in RISC-V cache is always enabled
>>> ( I don't see an instruction in the spec for disable/enable cache ) so this issue isn't present for RISC-V
>>> and clean_dcache_va_range() should/could be dropped.
>> That plus there's no kernel in sight just yet.
> 
> ( clarification ) will it change something if kernel will be loaded now? It seems even if we are copying kernel in guest
> memory we still don't need to flush the dcache as cache is enabled and cache coherence protocol will do a work automatically.

Correct. My point merely was that there are two reasons this isn't needed, each
of which is by itself sufficient to justify omitting that call.

Jan

