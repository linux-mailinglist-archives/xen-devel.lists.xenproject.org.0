Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9649BA7442C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 07:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930180.1332849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3c5-0003Sr-Fj; Fri, 28 Mar 2025 06:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930180.1332849; Fri, 28 Mar 2025 06:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3c5-0003Pj-CT; Fri, 28 Mar 2025 06:54:45 +0000
Received: by outflank-mailman (input) for mailman id 930180;
 Fri, 28 Mar 2025 06:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnye=WP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ty3c4-0003Pd-H2
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 06:54:44 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86c6e859-0ba1-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 07:54:43 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so14079455e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 23:54:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff03715sm17690485e9.31.2025.03.27.23.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 23:54:41 -0700 (PDT)
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
X-Inumbo-ID: 86c6e859-0ba1-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743144882; x=1743749682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qmuJf7BUt6vxWByZFn6O7PwlDnmljDQYZyi2+XHGDcI=;
        b=cRwLPfU2vijDgaftanGZD6RkxtSqjxfiuJ10Xmg/rU9uiiX2S5+6Jsrb3+6mKxcjx3
         PhHyUwR7Kfo38dzxkLC4pB4ki88PYDF/OJXGlL3AmQ/xqu/FGC0n8CdzLUi2yJXVaV9a
         SqYQX3qAz6HwwS6vNtC3Jh9io3K76u1IJgULjDn4eFzhV6d7Uhj/QJA928Q5kSfz29yS
         Z/6Jh5xE9vBR0LExtYLTxLEJ0ckHtXJVAocYNtkwgeaApjMgtsZgWs5bjZJ1CmnXsHfc
         2giWfAL8vm3rzTDXSVWP521405jwvejDCLdQxiP5k6Fc++FCwiPJDrqi3EaaGjmZHfqX
         ZmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743144882; x=1743749682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmuJf7BUt6vxWByZFn6O7PwlDnmljDQYZyi2+XHGDcI=;
        b=gNRRLK1fby8ZymfVmO+fohhw5B/azgeLE7Qk6jER7uvX2qdloRo3i41txJj7pZFhos
         fACKaA5jmYvThyL7AiFH6Yjn2+qsaaiFJxWWiSx/fFV+FS0W+diefnc15oGc37jCabNr
         oLB76BSmEWhnfdLbrFIO7TShzdcIMSIAD6IgeBcO8BM0YX0JTdzZbIueW/fhKv5Lr4UI
         KcZZCm2CPQZjBBxyfI5TSK0F6VHtk4nWMflpDLNM+lt1iPJ8rsqfh0p4lEf54SsMlxWV
         kLQ2Xn39BO1PKmrWpEKb/4+lRYZh0eVslZoH6e43wXfvF0ssoJ6QuuBAx4DhWIzOehI9
         PAPw==
X-Forwarded-Encrypted: i=1; AJvYcCWFsnxk/upwtB6PzK5Tz9U2xMKz+XEHyWuGa/PSVAQO3C8q60DF8ya3uPuWYQfwh030R4Zrw+FzZV0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztRgyiuqVWT53/wBPOt/Uy3mrMzJcFsLvw6FRa29r2WoLJecYQ
	ijItrwvePuTsFNp4tx+9mZ2nDdcWdMCxcudN4WRH3tlta9xffbiZQ11yDKmAXw==
X-Gm-Gg: ASbGncss4LHLB/gb9edTGRBj4GF6q5uQlLrTWlDGeAveL+2KBi69CX89jEfDcHMFpVP
	VKXR6EhUwqPmD//pc38orQEHvahOL1e05RWoUT0ZBhwJrwhQ4nzog3go7aByy+XICV9FDdxAbxD
	q4oUzDgKQEmm014uB+ZPqlimLN0+gBmyFW3c3HJtW+f1LmabSqMnpCvi1OtklJ1GcbrMiLMYXE4
	sRqHRJQsRy9AB3HLAasJ1TD7w95An0LC7jZBsoRgcmDkYFoKZtgnWiGZ0lSs5XkCI2RnyBAbQ1J
	PwxlBM9CdlCoeAnjPzDfhSujgRVqf9rBlSPfA+pMkWw5+Qv8cV1ufehi9ExlW5ggI+pc8vVClZk
	mCXgNifBFjI866cz6m1MGfEdhCrFlZQ==
X-Google-Smtp-Source: AGHT+IENqdEuED82yCeHDrcST8DNP6+DfkHItIv5BLJ+DnM9zNlaLZnqONwiSn1g6Pq+UeX8upnRpw==
X-Received: by 2002:a05:600c:138e:b0:43c:fb5b:84d8 with SMTP id 5b1f17b1804b1-43d84fb4bf8mr70982305e9.16.1743144882177;
        Thu, 27 Mar 2025 23:54:42 -0700 (PDT)
Message-ID: <1a2cbedf-e4de-4373-9a3b-3ff0c75c4290@suse.com>
Date: Fri, 28 Mar 2025 07:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: simplify bitmap_to_xenctl_bitmap for little endian
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, michal.orzel@amd.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop>
 <ad1bd470-1efa-4019-89ac-386bb05dd44d@suse.com>
 <alpine.DEB.2.22.394.2503191754480.2325679@ubuntu-linux-20-04-desktop>
 <8297406e-b281-4783-9238-d6326db3fa15@suse.com>
 <alpine.DEB.2.22.394.2503211607200.2325679@ubuntu-linux-20-04-desktop>
 <59cdc84c-6e5a-4752-b09a-945d05badd91@suse.com>
 <alpine.DEB.2.22.394.2503271628460.563920@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503271628460.563920@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 00:33, Stefano Stabellini wrote:
> On Mon, 24 Mar 2025, Jan Beulich wrote:
>> On 22.03.2025 00:09, Stefano Stabellini wrote:
>>> @@ -384,21 +382,40 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>>>      uint8_t zero = 0;
>>>      int err = 0;
>>>      unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
>>> -    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
>>> -
>>> -    if ( !bytemap )
>>> -        return -ENOMEM;
>>> +    uint8_t last;
>>>  
>>>      guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
>>>      copy_bytes  = min(guest_bytes, xen_bytes);
>>>  
>>> -    bitmap_long_to_byte(bytemap, bitmap, nbits);
>>> +    if ( IS_ENABLED(__BIG_ENDIAN) )
>>> +    {
>>> +        uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
>>>  
>>> -    if ( copy_bytes &&
>>> -         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
>>> -        err = -EFAULT;
>>> +        if ( !bytemap )
>>> +            return -ENOMEM;
>>>  
>>> -    xfree(bytemap);
>>> +        bitmap_long_to_byte(bytemap, bitmap, nbits);
>>> +        last = bytemap[nbits/8];
>>
>> Same style nit as before.
>>
>>> +        if ( copy_bytes &&
>>
>> copy_bytes > 1
>>
>>> +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
>>> +            err = -EFAULT;
>>> +
>>> +        xfree(bytemap);
>>> +    }
>>> +    else
>>> +    {
>>> +        const uint8_t *bytemap = (const uint8_t *)bitmap;
>>> +        last = bytemap[nbits/8];
>>> +
>>> +        if ( copy_bytes &&
>>> +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
>>> +            err = -EFAULT;
>>
>> The two identical instances would imo better stay common, even if this may
>> require another function-scope variable (to invoke xfree() on after the
>> copy-out).
> 
> That's not possible because bytemap is defined differently in the two
> cases so it has to be defined within the if block.

Hence why I said "even if this may require another function-scope variable".

Jan

