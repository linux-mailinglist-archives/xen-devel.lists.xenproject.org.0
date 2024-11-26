Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969299D9B74
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 17:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843896.1259474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFySW-0004Xd-7T; Tue, 26 Nov 2024 16:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843896.1259474; Tue, 26 Nov 2024 16:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFySW-0004W8-4p; Tue, 26 Nov 2024 16:30:40 +0000
Received: by outflank-mailman (input) for mailman id 843896;
 Tue, 26 Nov 2024 16:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFySU-0004W2-JP
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 16:30:38 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2c888de-ac13-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 17:30:34 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38232cebb0cso4443497f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 08:30:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad62fasm13669582f8f.15.2024.11.26.08.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 08:30:33 -0800 (PST)
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
X-Inumbo-ID: c2c888de-ac13-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmUiLCJoZWxvIjoibWFpbC13cjEteDQyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMyYzg4OGRlLWFjMTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjM4NjM0LjYwODUyMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732638634; x=1733243434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+iQsoucG1FbnWYK5dYnT0dzMfVPx6QEiyqOs78wZ2cU=;
        b=X9BszPfvTBwCOgMKjpCAQ5W+wpNumbOpYUqAbA9tdwDyhatupu1R2wleFKpNFY976W
         OBRnaC0hRMRywVqelzwsZ20Ypk/i3/DOzbJh267U+amieZsH8PCwjPtYHU2aUtI+dXKa
         8NIxcu+hHH6u1kzlkOfiepRAOWitcIoV2T0ps0MJJ4KtsCHdYsZGfA6TRt37PliYKO1G
         WrJKmClztC0x51E1v3qoyvYt9FDPKY4j+OWGcOYnIh5j8KkN06oHDYJNyczegHKHgXyJ
         66gip96jGBhKgS5ECsM6u7F29smlUHKFsNVPb7gWaSd2OBTeWFljP9UAgxXMJhdmDtrp
         Hgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638634; x=1733243434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iQsoucG1FbnWYK5dYnT0dzMfVPx6QEiyqOs78wZ2cU=;
        b=aLewwC2YJtcg3F/RPMrfsG6kP/8wH25zVxVosb53vk21PXM3KrY/iZuCx3oIFTKDqS
         M/SwcvsUiOnhD5FdYToTcskmfYQtetRjf8b8clKjSoGqQDApYHu1eWjekR078sW3etZD
         tfxgcwTbrhqv2mppzS7uL6XWTEJ1ReCD45qh34209HAnLP3fJhzx9PxuLE3NyU056cfb
         /VzhiC/kE0ooiF5CyPpjd3tOkDCaL1Z8vKw+gKAsSR3T8wONZZvqrd3uEz2iyCd/jLPi
         pJkg9Nr9eehjY/7GJbepsMswmnQuLQgN5RXMYOAHA9CP0DqXhf3sbSVnc6qdOcX5We58
         lKMA==
X-Forwarded-Encrypted: i=1; AJvYcCV3mjcx3s7MmocUZz61parC+k+ibzYXZwJ6M2XlCL1Fj9OIs9cJZhkZXqpKYyfJPY+b9e/f7LjNO40=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTc8JhaZH7GdlME2GkuD/so4kOmLs8zhiVC+abgg+P3URQh7xe
	C/UR7XRFi8NHviKAD5OBvZaX148cF/WmPrmCLnXo9Xq8B0xZgXsZTyKnlOuHrw==
X-Gm-Gg: ASbGncvaSSFZEGikZq/uoR9OmXAe+Y/VVP8oEHMVSbt//GVNL7XPIUpoyxv25wlKZXJ
	M86TCfRYF1RMBf54kDsGpDgt60Ld1HoF41kxq8+k5DdOhtAneA1bR5lpadpltnwfIfCC1Jil/ro
	Kzh2zMaLJpH/Ok4/JAfyDrxcDhGzPSoA2KIgRlRR3Bu795ZBpWsn6a7I3zVh+K99PbNWYY9Mq2R
	TJdgDU5JsiRAJ4alhJZDhRvSJ/HJza3yFTcUB1G1Ep95xzjnYM4lzZLvkADxHP0jtpdBPOciAPk
	gRiwUlsEVQZlBgmJkk0WV14atCFcQQDv65Q=
X-Google-Smtp-Source: AGHT+IEd95bTHAZSKLvE9QKPKw+vReSo1DhCpwBxogiPRe6cByDib6fh5tOZ6NVWSzFLA7Tqtp5Vww==
X-Received: by 2002:a5d:5c0e:0:b0:382:4e57:48f8 with SMTP id ffacd0b85a97d-38260bc9755mr16975825f8f.43.1732638633984;
        Tue, 26 Nov 2024 08:30:33 -0800 (PST)
Message-ID: <5707cbdd-00f5-41e8-a376-602976087934@suse.com>
Date: Tue, 26 Nov 2024 17:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/25] xen: Replace sysctl/readconsole with
 autogenerated version
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-13-alejandro.vallejo@cloud.com>
 <0a5a66d9-4fd4-4084-b7f9-0923d5a4c6d5@suse.com>
 <D5VHI2OA8QTK.1H4ZDUSP5EZX5@cloud.com>
 <737292fd-1c4a-4fd6-ae98-a701adb0b88e@suse.com>
 <D5W3YYDE2F09.IHJMRBUBE6EV@cloud.com>
 <e40ed7c2-6111-468e-8655-884953bd33e7@suse.com>
 <D5W6PN8FJ5CA.378A9JFXP34X7@cloud.com>
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
In-Reply-To: <D5W6PN8FJ5CA.378A9JFXP34X7@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2024 15:36, Alejandro Vallejo wrote:
> On Tue Nov 26, 2024 at 1:20 PM GMT, Jan Beulich wrote:
>> On 26.11.2024 13:27, Alejandro Vallejo wrote:
>>> On Tue Nov 26, 2024 at 9:40 AM GMT, Jan Beulich wrote:
>>>> On 25.11.2024 19:51, Alejandro Vallejo wrote:
>>>>> On Mon Nov 25, 2024 at 12:05 PM GMT, Jan Beulich wrote:
>>>>>> On 15.11.2024 12:51, Alejandro Vallejo wrote:
>>>>>>> Describe sysctl/readconsole as a TOML specification, remove old
>>>>>>> hand-coded version and replace it with autogenerated file.
>>>>>>>
>>>>>>> While at it, transform the console driver to use uint8_t rather than
>>>>>>> char in order to mandate the type to be unsigned and ensure the ABI is
>>>>>>> not defined with regards to C-specific types.
>>>>>>
>>>>>> Yet the derived C representation imo then should still be using char, not
>>>>>> uint8_t.
>>>>>
>>>>> There's 2 issued addressed by this patch.
>>>>>
>>>>>   1. The removal of char from the external headers (and the Xen driver).
>>>>>   2. The replacement of the existing struct by the autogenerated one.
>>>>>
>>>>> (1) wants doing irrespective of (2). char has neither a fixed width nor a fixed
>>>>> sign. Which is irrelevant for ABI purposes in this case because what we really
>>>>> meant is "give me a pointer" in this hypercall, but it may be important in
>>>>> other cases.
>>>>>
>>>>> IOW, char should've never made it to the definition of the public ABI, and I'm
>>>>> merely taking the chance to take it out. Happy to extract this patch and send
>>>>> it separately.
>>>>
>>>> Well, work towards fully getting char out of the public headers may indeed be
>>>> worthwhile. Otoh with char being the basic addressing granularity, I think
>>>> the ABI is pretty much tied to sizeof(char) == 1, imo limiting the
>>>> worthwhile-ness quite a bit.
>>>
>>> Let me put it another way. If I were to create a separate patch stripping char
>>> and using uint8_t instead, what are my chances of getting an Acked-by? Or not a
>>> NAK, at least. (there's other maintainers that I need that from, but one step
>>> at a time).
>>
>> That would to some degree depend on what other maintainers think. Not a straight
>> NAK in any event.
>>
>>>> Signed-ness of plain char doesn't really matter as long as it's used only for
>>>> what really are characters (or strings thereof). And that looks the be pretty
>>>> much the case throughout the public headers.
>>>
>>> Maybe. Still, as a general principle caller and callee ought to agree on size,
>>> alignment and sign for every type. I'd rather not make exceptions for that
>>> invariant unless truly well motivated. And in this case it's a case of
>>> requiring trivial non-functional changes.
>>
>> In how far they're non-functional will need to be seen. You also need to keep
>> consumers in mind: They may face sudden type disagreement that compilers may
>> complain about. Yet "stable" for the public headers means not just the ABI
>> itself being stable, but updated headers also being usable as drop-in
>> replacements for older versions.
> 
> Would it be fair to say that users of the Xen low-level API strictly go via
> xenctrl et al?

No - recall we're meanwhile talking about all public headers, not just ones
limited to toolstack use. Kernels (and alike, e.g. xtf) obviously won't use
xenctrl.

Jan

