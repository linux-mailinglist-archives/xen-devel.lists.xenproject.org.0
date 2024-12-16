Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ACF9F3009
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:03:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857885.1270085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9ox-0004tW-V5; Mon, 16 Dec 2024 12:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857885.1270085; Mon, 16 Dec 2024 12:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9ox-0004rG-Rt; Mon, 16 Dec 2024 12:03:31 +0000
Received: by outflank-mailman (input) for mailman id 857885;
 Mon, 16 Dec 2024 12:03:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN9ow-0004qr-QJ
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:03:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c313f973-bba5-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 13:03:29 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so44165425e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 04:03:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801223dsm8091587f8f.3.2024.12.16.04.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 04:03:28 -0800 (PST)
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
X-Inumbo-ID: c313f973-bba5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734350608; x=1734955408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HZoK8R8Q++Fvlt6Io3P422EOkwXp1d7Y7SElsgKxRUE=;
        b=T4fXldJw+l4w6wr4PNbkYbald16O0HrMoHK5t0n4Yg9A1Qq9H6XV0EYPxMG9Xm1kgv
         Y20cPFL+r9VRm0MZ3vyP+LtD9rPA1PmX6NRtW4vUsew4Kl5kkbZYol5su7EfIRG8ReIL
         BqkSxy3vMDTFaYgh6jAT9SqN+KTcB7tB9LUN2Taa2C2SUWvbg1AaShnFWEd2OkS0Tf2F
         wFOveSWRhE3htjUZzdf6GiUVVnuHiDrXWBAo+wdiqvWP3MkwfFjVesLycWGw0lLr8H/m
         IdUtiPliCCVGK7nY8HveZwHICKhWCPSeF5voDESSmPL6ulXr+9Zgz2EcjRXyInGpF04o
         x4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734350608; x=1734955408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZoK8R8Q++Fvlt6Io3P422EOkwXp1d7Y7SElsgKxRUE=;
        b=QsVdo2/I/wlGOrw5/eN9UPinFBujAaH01gz/0xojyVZ9+uzp8Kjd+YT69Ys5BcJexy
         xeoDdsUilMTH5AFh1rwncFO0QO1QFPvGTLC9ImbmSvqxjsxBLTWBCkJo8i6ZJkE0s5IW
         OJpJPFNI3r32a+P1KM7qU+8Q4FTFuQgPuaqxgfGzz2WF1x+8SGMfixmRdCr6sVB763fk
         TiM4o9TuWVFy0XECTz56LSiElCIPNMbvB+MB7m3lYlXO/5IAiA2Hyxw66PCJ8rdH+oqq
         DnCrfSOTxhISvONzLtGbYWMxOjbKgX9M1Br5dufQlzYryBVOkjeWDs5eOJz2ViHlpTGp
         ihmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcUMYxgihqUk7xu9MV7tU7jNY3hMffQ8+asJ1yDGImZED80OEE+PDUkqwk09zdeTQKqRn6o9qxE+o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx08NNSQcSdAgiTWmk9lZ+6sYdrLXKYnyV/c2PLcE7WSnStt+3f
	IGSHYcstysOVCWSnLDg7XMBApkYlEI/Jc1ezX4f7xMErezHhAq2feWpg4CNZjg==
X-Gm-Gg: ASbGncv6fQvXtow44NHLpFEba10oxFhUfVQ4P9qoGOdNAmsS26cHvMqRyzZCQ/5VFC0
	tBsb5Jn9smnhv8z3vq2Xjx0/p27hvq9dnOoHnh0YuS7mrYXuM64cDWphE/R42GkAHNlbfFHNbj4
	pTVjctwAd705gPAtEKbNcs/+Iq271/R8xyoCF2mbfqoBZd1NyPPrMx49wIzzPBgLMkE0dYnlm7a
	FQDn4IXUQtSKgr2yZUKyZ7SMeHTfnEsiK8YqEkoVNWXecuYoa9H1zgyycFlxrXbD6kNKXMtfbZx
	sQjayuqno4x6z1Tcgz3+8uu5+krHaZpsm6QN0kuCTQ==
X-Google-Smtp-Source: AGHT+IEgbJevSNlD0/1GQ7fIY0t3EIdvK24kKi+4d7QLm4u2ubEdlB1vsMT5fxQg9hQ1dmQ8Q7+p4Q==
X-Received: by 2002:a05:600c:1e87:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-4362aa113f1mr101915375e9.4.1734350608401;
        Mon, 16 Dec 2024 04:03:28 -0800 (PST)
Message-ID: <def2d398-ae9a-43c8-8de6-22ea01eae196@suse.com>
Date: Mon, 16 Dec 2024 13:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] x86/mpx: Map/unmap xsave area in in
 read_bndcfgu()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-11-alejandro.vallejo@cloud.com>
 <7e36137b-ce1f-4e78-9a41-fbfdbe9c0d87@suse.com>
 <D6D3WWUR75T2.1C5DL8WJGQVNP@cloud.com>
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
In-Reply-To: <D6D3WWUR75T2.1C5DL8WJGQVNP@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 13:00, Alejandro Vallejo wrote:
> On Mon Dec 9, 2024 at 4:30 PM GMT, Jan Beulich wrote:
>> On 05.11.2024 15:33, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/xstate.c
>>> +++ b/xen/arch/x86/xstate.c
>>> @@ -1022,9 +1022,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
>>>  
>>>  uint64_t read_bndcfgu(void)
>>>  {
>>> +    uint64_t bndcfgu = 0;
>>>      unsigned long cr0 = read_cr0();
>>> -    struct xsave_struct *xstate
>>> -        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
>>> +    struct vcpu *v = idle_vcpu[smp_processor_id()];
>>
>> Can this be pointer-to-const? Certainly right now, so the question is rather
>> meant to be forward looking.
>>
>>> +    struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
>>
>> This certainly can be pointer-to-const, just like ...
>>
>>>      const struct xstate_bndcsr *bndcsr;
>>
>> ... this is.
> 
> Yes, those retained non-const because of the now missing patch to zero-out
> bndcfgu.

I'm afraid this reply is ambiguous as to what's going to happen in the next
version. I can read both "will change" and "needs to stay" into it.

Jan

