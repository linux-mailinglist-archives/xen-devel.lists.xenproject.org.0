Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AF9B084BC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046132.1416359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHwT-0007QN-3t; Thu, 17 Jul 2025 06:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046132.1416359; Thu, 17 Jul 2025 06:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHwT-0007NO-0g; Thu, 17 Jul 2025 06:18:05 +0000
Received: by outflank-mailman (input) for mailman id 1046132;
 Thu, 17 Jul 2025 06:18:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucHwR-0007NI-Ip
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:18:03 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca4b405c-62d5-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:18:01 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so463914f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:18:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1f53fsm15272876b3a.91.2025.07.16.23.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:18:00 -0700 (PDT)
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
X-Inumbo-ID: ca4b405c-62d5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752733081; x=1753337881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vcBgTz5OfRe22+TZlezYhrKHuB70MbpJqBy0FJyvmCs=;
        b=cKjE+xPEHbhtH/94aEeYAV9uyjHfYJ8E/v2YxZSlv9jbFhPWLj2u1c1dJnmY8w2hwo
         kc3+1lvK4v9oP9gw9Lj+jt1qhhHDU5A5LQ1+0YUEF2o0wHSJer3ftCO2deWMCONF7o0Q
         0g3wBkiNXq/8Tgdissti94pM/24Y1Fe3/RoSuVGVJO01VQzjx94eOar13GYlbsz8/DPv
         OYszqWnMBZgtB7rmbzeff6g6ozHGYJdUk8Nt3vFIl2OyAsBj+SdnjyvoZVVszDyaNZc7
         Pxee5MVimqfo85Gd4//iVTGQLFbvav9DyanbmcMf31BxMvn7gfcv0lXRm7SajF7KZpCV
         bD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752733081; x=1753337881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcBgTz5OfRe22+TZlezYhrKHuB70MbpJqBy0FJyvmCs=;
        b=QL5At9d2DD2+k+0R2hcM2bZTENI2rReMzQr4QlBiKpP8gkWNHM45TKNfFckNfNrIcZ
         QlJ7ga65cokYuNz18Z2Qi0T1OyR6Uv3O+Msl97l7+CA8S1UTDkT+dCh7os+n8Two5Cv1
         NKDaWi8gW/vo5r/mPTeDy2lBdgmsUBD6v54Y9Ma0exEpW6KxHeHgu2E7OJY3Di9o2C3l
         VjF/71/nGyy2UR1OPYgMcxoZVb3IB//bpNIbm9JBru6w8DrR0vuR2B9FDrTh60TDhLIe
         X7eFUoKaz6WNHF3hcxx1cGnUlFLuMCxUexJRvY7SfTBiWeIVBl4TcekyOfdjf8pbRklb
         J4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXXBEBehDA2iDQa8rfGLygczrfVqANRC3i7qeE/KKpiUnSSU7e3/5/MdO19QeMq9sd/MdOAc3l0kHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyULVEavUdEiumCtrqWkwk8TglO7iksPIXvmR+j9r1bq16qM+Fb
	BVcmrTcIXcA07HtMLxh0uW/+bb5IhTsCqP8/xamKGcW2YwzO/TU9jSzdHol1Lga1IQ==
X-Gm-Gg: ASbGncsnFFqg+xcqgHTF4R56csUx9waSgZPopWQjxjgkpKSUZ1KLJfi25SslTcuH9dY
	GPC5/yBu84oiDeCRFZzzhjt9yAU3Q5EiIbmameGsyPJ6EwnY18XYCctJShovlqeXwHc6mjthYId
	JeEylkddSq1G4tLE8vh9MZWCjxWkMOR+PHXXV9wFMD8oMbfJEI95AgSd9/ltCb5efqLvoQOxwYO
	a44wv9lOf1ZWiX1+PdDwGPYy/O5kn9tIIb5DpM1i+uOk8zrv6fMUyLPIk5SND+NjKC1iyu8n9Ox
	XiIIFajuxun5lR14GvGT6AOQ/DX9RhhkTEC65oMpoLlOmsBF8mRC9hy9TlFthuxloDxoEiGShRZ
	fNcl+b3JkOdHzzmO2Ns04yTabp/IJSxo5xfqRM9eYEV3Hs6agHv92JsUwabwx9Of8iVs0qdeato
	X/Iyy/p7M=
X-Google-Smtp-Source: AGHT+IFRhJ0Zo2iQ9A82nbMAPoN3+iC1uz4P081tYqnxiFRRBn4xZ3JX6yi/ckWx0JO2R+DA6ky78A==
X-Received: by 2002:a5d:5f4e:0:b0:3b5:e6c0:1678 with SMTP id ffacd0b85a97d-3b60e52451dmr4016437f8f.45.1752733080677;
        Wed, 16 Jul 2025 23:18:00 -0700 (PDT)
Message-ID: <78c01504-605d-44ac-a479-ad24bd5b11b6@suse.com>
Date: Thu, 17 Jul 2025 08:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hvmloader: fix SMBIOS table length checks
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1752533080.git.w1benny@gmail.com>
 <9494aa56929b5cb443b9cccb0e671510071b4aab.1752533080.git.w1benny@gmail.com>
 <9357cd00-3557-46ff-9a74-ae44c298bc47@suse.com>
 <CAKBKdXga6w_Qn1+3uet9O5xCySQUXuvYv=TQBQis+bEKL9=HuA@mail.gmail.com>
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
In-Reply-To: <CAKBKdXga6w_Qn1+3uet9O5xCySQUXuvYv=TQBQis+bEKL9=HuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 21:34, Petr Beneš wrote:
> On Wed, Jul 16, 2025 at 12:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> +    if ( next != start )
>>> +    {
>>>          /* Set current chassis handle if present */
>>> -        if ( p->header.length > 13 )
>>> +        if ( p->header.length >= offsetof(struct smbios_type_2, board_type) )
>>
>> Comment and code don't fit together, unless one goes check that board_type
>> is the field immediately following chassis_handle.
> 
> That's the tragedy of using offsetof in this situation. What is mostly
> needed throughout this code is "offsetof(x) + sizeof(x)".

Which is what, in the end, I was alluding to. Sorry if I didn't make that
clear enough.

> Instead, I'm
> mostly using offsetof(a-field-that-is-following-the-field-that-i-really-meant)
> which leads to comments that seemingly don't make sense.
> 
> How should I ideally proceed? Should I introduce a new macro?

Perhaps. Maybe something like endof_field(), along the lines of the
sizeof_field() that we have in the hypervisor.

>>>              if ( *((uint16_t*)ptr) != 0 )
>>>                  *((uint16_t*)ptr) = SMBIOS_HANDLE_TYPE3;
>>
>> Why not switch to p->chassis_handle, without any use of "ptr"? Yet then I
>> fear I don't really understand what is being done here.
> 
> Right, that would make sense. I left the original code intact.
> 
>> Why would an arbitrary non-zero value be overwritten with a fixed value?
> 
> That's a question for the original author. FWIW, qemu does not coerce
> these values.
> 
> But if I had to guess, the original author wanted to make sure that
> the SMBIOS data do not reference nonsensical handles.
> 
> I would argue that if a user decided to fiddle with these values, they
> know what they're doing and I would let them shoot in the foot if they
> desire to do so (in other words, I would remove this coercion; but
> that's not up to me to decide).
> 
>> The other comment may want retaining, though.
> 
> Which one do you mean? This one?
> 
>> -    /* Only present when passed in */

Yes.

> If so, I should probably add this comment to all the newly introduced
> tables as well.

I was indeed wondering ...

Jan

