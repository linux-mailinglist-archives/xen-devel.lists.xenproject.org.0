Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD808AF385
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 18:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710903.1110452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIii-0000Fc-PG; Tue, 23 Apr 2024 16:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710903.1110452; Tue, 23 Apr 2024 16:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIii-0000Cb-MK; Tue, 23 Apr 2024 16:10:12 +0000
Received: by outflank-mailman (input) for mailman id 710903;
 Tue, 23 Apr 2024 16:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzIih-0000B1-HD
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 16:10:11 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4f955a1-018b-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 18:10:09 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34b64b7728cso909330f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 09:10:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b00417ee886977sm24693795wmq.4.2024.04.23.09.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 09:10:08 -0700 (PDT)
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
X-Inumbo-ID: f4f955a1-018b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713888609; x=1714493409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXTsSpL6xs+pc0ARmlC7FhXdjJtoWTjhbKabMGAzUR8=;
        b=CSJH5i7KJRr28Vb2Wriln1nWrqeM5Qf0/Of900o9Jd3xYRPnLUqBr8geYwr9xQzCzA
         RDm9MsY/gN9B46snGRaHK4w1en7TM66lQhJ9pYR6J4OtRLwdLEvnsGfJm+c/1R/68Z06
         HjAu25mZ6MNGmLy/6bHSM3o26j9OSww+k6iXeE4qk/QNKBKsO4ZS2DqV1NA2dcw8STfq
         3VFBUXhXDsQgJEUFxA9e9RHnNvSd2wNnMAkV89nb1bNxX6wIsQoyUwt5xMTgJ8voGCwA
         JpHG/sFi0L/4QKsrq34ebv9Tm+oP3buA3V93pgJa/ue0ntr242f95HmPU7SP8+TqVIU/
         Tx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713888609; x=1714493409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXTsSpL6xs+pc0ARmlC7FhXdjJtoWTjhbKabMGAzUR8=;
        b=DMbBHEsjjnJ1e5tGlu5d7GBtqc46D5++zjLYjD3qDEKOqcq2AhRxQpLM9I6r5Lrolb
         kNDScvQINCJ3i9uhzkwYkFerIcVOWgvLP/eTsMMYQc7DJ277DwcxYL2CKI+63VE3KNXR
         g/l+dX0FqHoK6thzHHehq9jd4oFNgEsV/iWtGOwwyZ7PX5wTh1TfpQDCpHsUOYdyvjmu
         FllSBKBDCoTSZvBOhchV0HG86d4WkBqnwNRwL68GFi5wCwiXbrDCzFcagwGaHcJP2DoX
         nQ3OJUxfrCr/QlYVxT8WcgJfYO7t4sidQmRBIpr+84Wx7rT/0OYeqeeO9ADjRSrjeQHE
         JuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdWYjMlCbo28Yte5mycNlI77eoB7VDiZpxRKLU7SWLH5iaYMl9m+E7rdGP0kk5LKTldppeHzjXkqi1gFPSlc/NkuilBFNHK8jPH1NJd6Y=
X-Gm-Message-State: AOJu0YwhwjeHy4WU6IJWfvHU7iSWPk4o+iTJhKRACPfMy22cBJvYwYk9
	WlIZhb7MmXsZaZfmB2AZz5RuGhmw7+Wdvr0cmWTl9sYZ3cKkJjheHsAn6mJhqQ==
X-Google-Smtp-Source: AGHT+IFL6f8pLQh7FHEJSd0823wCvl+AADbOwbd0kubW97SV93wFt+d9ADwxLwL8I6q+Z/3EETwOAA==
X-Received: by 2002:a05:6000:10e:b0:343:ebd4:35a5 with SMTP id o14-20020a056000010e00b00343ebd435a5mr7712229wrx.0.1713888608970;
        Tue, 23 Apr 2024 09:10:08 -0700 (PDT)
Message-ID: <691482dd-4803-443a-8e22-c410249e0dfd@suse.com>
Date: Tue, 23 Apr 2024 18:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86: Refactor microcode_update() hypercall with flags
 field
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
 <20240405121128.260493-3-fouad.hilly@cloud.com>
 <f789bf74-8296-4127-9612-a46d02a422ee@suse.com>
 <CAJKAvHYEBabwDG36QtBkTGhym6m-uypZhv1HzaGhNuCKQnu1wA@mail.gmail.com>
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
In-Reply-To: <CAJKAvHYEBabwDG36QtBkTGhym6m-uypZhv1HzaGhNuCKQnu1wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 16:53, Fouad Hilly wrote:
> On Mon, Apr 8, 2024 at 10:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 05.04.2024 14:11, Fouad Hilly wrote:
>>> @@ -708,11 +712,13 @@ static long cf_check microcode_update_helper(void *data)
>>>      return ret;
>>>  }
>>>
>>> -int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
>>> +int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags)
>>>  {
>>>      int ret;
>>>      struct ucode_buf *buffer;
>>>
>>> +    ucode_force_flag = (flags == XENPF_UCODE_FLAG_FORCE_SET)? 1: 0;
>>
>> No need for ?: when the lhs has type bool.
>>
>> But - do we really need to resort to parameter passing via static variables
>> here? If it's unavoidable, its setting needs to move inside a locked region
>> (with that region covering everything up to all consumption of the value).
> There are many function calls and checks of the firmware between
> microcode_update() and the actual update, which makes static variable
> the viable option.
> In V2 I broke it down between the actual update_flags (static) and
> force_flag (local to firmware update function), I understand that
> might not be enough, I will look into further improvement for
> microcode_update flags in V3.
>>
>> Further, to avoid the same issue again when another flag wants adding, you
>> want to check that all other bits in the flags field are clear.
> The above check is checking all bits in the flags field. Are you
> referring to flag per bit where multiple flags can be set
> simultaneously?

No. What you do is treat a flags value of, say, 2 the same as a flags
value of 0. That's wrong when considering that the value 2 may gain a
meaning going forward. At this point you want to refuse flags values
other than 0 or 1.

Jan

