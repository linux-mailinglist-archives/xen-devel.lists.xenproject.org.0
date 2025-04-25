Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E98A9C2FA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 11:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967549.1357329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8F6D-0005lS-MX; Fri, 25 Apr 2025 09:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967549.1357329; Fri, 25 Apr 2025 09:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8F6D-0005jw-Ju; Fri, 25 Apr 2025 09:11:57 +0000
Received: by outflank-mailman (input) for mailman id 967549;
 Fri, 25 Apr 2025 09:11:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8F6C-00054Z-4w
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 09:11:56 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 556f9360-21b5-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 11:11:55 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so14328075e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 02:11:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2e00d8sm49320785e9.35.2025.04.25.02.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 02:11:54 -0700 (PDT)
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
X-Inumbo-ID: 556f9360-21b5-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745572315; x=1746177115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4LLweWAtjPpIVfxJHoSnge8ur7O58E/0yu08so+yTmc=;
        b=Jfo1ak3+6GKVJYn264boVy+T7RtuOGQq8MVatrUL9d3qHQtRaF9IMJJNEBqZzMBraJ
         Xj6tVdtjIA8rrRbI2Qz0NHBj7rkZYbNlzmAoqJU324R8YrYOEp+PSPcNY9jCFCZP27hR
         SsTn9heJ/dddRHoOJJgC6R/ahDAM3OkiFWTSZd91avwAzLL+dP5P6jL3/GKfb8nRkGbG
         mgaGvbL0bqwgyz5da4hd0LZtCzEHFES830Nv7gRWD2L/7zQosbJTMOMM8jgRmMU4/RbE
         lzIb8Y2unEHdywv7bql5LWRff/JBIrXSIYPTEqHKAIsTvhx7KDTUCG+K4rBqS8bObZc4
         0UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572315; x=1746177115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LLweWAtjPpIVfxJHoSnge8ur7O58E/0yu08so+yTmc=;
        b=GXoRDGH2pip3XnteGXS1Ftkx+siUTG4a3lVvDH/rzztyNwUjKmxJZauYREvuRUff3U
         jenuJcXLMX/4/kjM4QaaKR+8IVavEXc+YIXhxclsZd+323h7c3igX/y0Dh0nQUt3y7l4
         Yl9SFjQOZfyhzlGSf+NAA9MoFNCMiK83KErBMNCRAgeGHgMSnj3QZs5GoChd0Xgsc7ri
         JMOFj95cQdgo/Q9laZj9tkuinedr56Y+iFJwaFtcgCTSVcra/59gP2MKmdIThJ1/CG6o
         H3xzSI9zeWGWvTM55PtmIylT1Va/fmN8yqMat+oBpImYFqUPyxfVDFxkEm49tja531Jt
         BKPA==
X-Gm-Message-State: AOJu0Yy3Qc0kx/j6D/Rw5DrOFofdDedzAtjU4WjIM06bxbqYIQSxaemc
	Z/bR7VH0xZ8HYRs20lqJYkDAglX3t1GLmQ/PPKDs3Cqoo2IrfUOwXu1t7bAU0g==
X-Gm-Gg: ASbGncvlOr3PdDThfajiKjnDDIXutZdml3DB8z2HaNFoqCmyoXcGs+V+2stCFg/Cokc
	y7VZ7vcvuFW9ZV2YcJ66jojJylTUTTNu2i6Jp7z0D6DH7F2Uf1LZGa3q0QxccaepCMOnHcFJOcO
	U+wT8e1f1glb4u3zIIYS02noCuQt3cHl8T3ixsGVUKVNYiTE01E+KaFEDfaCjZtaJythWB9H4Ff
	wOAewAObjgnaWEEjoUnWujBntr1MToQRh+81gVfzaaF5YcCmL/wGDNNlssEAUBrVK/QhfP9NjIa
	7181EonPG5JylgNmM6kGA04LUqOZlHnXDxlNos9AQR/e4fBS10ysx//X0vUfl75zXmxGmLsVoaK
	2tNTFH0sdP/rGnD3lFNsuszPi3Q==
X-Google-Smtp-Source: AGHT+IFDKSRTL2tAaP8C5KeDL71soNf5XPVBOwHptVJrh/kpC33LVVH+oR92k34WePVWIcCJDVIU1w==
X-Received: by 2002:a05:600c:3d17:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-440a660754emr15348175e9.16.1745572315032;
        Fri, 25 Apr 2025 02:11:55 -0700 (PDT)
Message-ID: <db8dad9b-4bae-4760-a6e9-d405a17f39cf@suse.com>
Date: Fri, 25 Apr 2025 11:11:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix buffer over-read in bitmap_to_xenctl_bitmap()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250424103841.94828-1-roger.pau@citrix.com>
 <041d4bd5-962c-4600-b436-0ec214a6c6ca@citrix.com>
 <aAo250IiFOC1Hggg@macbook.lan>
 <f425b237-dd89-4800-96c7-08072a3f67e3@suse.com>
 <aAtQDwHmaSJVh-3k@macbook.lan>
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
In-Reply-To: <aAtQDwHmaSJVh-3k@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.04.2025 11:04, Roger Pau Monné wrote:
> On Fri, Apr 25, 2025 at 10:54:36AM +0200, Jan Beulich wrote:
>> On 24.04.2025 15:04, Roger Pau Monné wrote:
>>> On Thu, Apr 24, 2025 at 12:41:43PM +0100, Andrew Cooper wrote:
>>>> On 24/04/2025 11:38 am, Roger Pau Monne wrote:
>>>>> There's an off-by-one when calculating the last byte in the input array to
>>>>> bitmap_to_xenctl_bitmap(), which leads to bitmaps with sizes multiple of 8
>>>>> to over-read and incorrectly use a byte past the end of the array.
>>>>
>>>> /sigh
>>>>
>>>>> While there also ensure that bitmap_to_xenctl_bitmap() is not called with a
>>>>> bitmap of 0 length.
>>>>>
>>>>> Fixes: 288c4641c80d ('xen: simplify bitmap_to_xenctl_bitmap for little endian')
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> You ought to note that this is only not getting an XSA because
>>>> 288c4641c80d isn't in a released Xen yet.
>>>
>>> Yeah, I did explicitly check this wasn't backported to any stable
>>> branches.
>>>
>>>>> ---
>>>>>  xen/common/bitmap.c | 8 +++++++-
>>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
>>>>> index bf1a7fd91e36..415d6bc074f6 100644
>>>>> --- a/xen/common/bitmap.c
>>>>> +++ b/xen/common/bitmap.c
>>>>> @@ -369,6 +369,12 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>>>>>      const uint8_t *bytemap;
>>>>>      uint8_t last, *buf = NULL;
>>>>>  
>>>>> +    if ( !nbits )
>>>>> +    {
>>>>> +	ASSERT_UNREACHABLE();
>>>>> +	return -EILSEQ;
>>>>> +    }
>>>>
>>>> I don't see any hypercalls performing a bits==0 check, so I expect this
>>>> is reachable.
>>>
>>> bitmap_to_xenctl_bitmap() has just two callers, one passes nr_cpu_ids,
>>> the other MAX_NUMNODES.  I think there are no callers that pass 0,
>>> much less from hypercall provided values.
>>
>> Still I don't think there should be an assertion here, not even an error.
>> As much as memcpy(x, y, 0) is okay, it ought to be okay to invoke this
>> function for entirely void bitmaps.
> 
> OK, are we fine then with just returning early if bits == 0?  No
> assert and no error.

I'd be fine with that, yes.

Jan

