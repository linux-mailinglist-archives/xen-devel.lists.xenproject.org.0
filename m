Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5E999682E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814355.1227908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUfD-00084h-F8; Wed, 09 Oct 2024 11:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814355.1227908; Wed, 09 Oct 2024 11:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUfD-00080D-CU; Wed, 09 Oct 2024 11:15:31 +0000
Received: by outflank-mailman (input) for mailman id 814355;
 Wed, 09 Oct 2024 11:15:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syUfB-000805-MO
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:15:29 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9993bed-862f-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 13:15:27 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a993302fa02so528655366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 04:15:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994b0fd6bfsm484553766b.200.2024.10.09.04.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 04:15:26 -0700 (PDT)
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
X-Inumbo-ID: c9993bed-862f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728472527; x=1729077327; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0csW+tPpL/m/PvAcC5nebkXIoS7CD1K1HdfmJ2rZahI=;
        b=HXil8OB8/wnPAIWnZh7QS3kXSSj3QFd2qYSNKIQ55sXljTifr6FMqwO2n2xiX8OvnH
         T6/A1g8uHl0xVm8VJHBDok33vnY9gIowo5IO/McwszajyUPytOla7sbF408HZkrH7Vm3
         bjJrh8qGU3SawPCt2iJJ9VtBkH2HaaY1e9tz9kBodDw6qbmUnK9WiX1XFBdIFdG600bL
         RXyx+ZLlL6ix0vDQzRLemMtsTrKtNM9ZWp4tDsVzg1BJ/Em1Ha4DNAufgN0ZabpamiGC
         +1jSmkYkJPtNWLbQH2uPVxNsX+lv9hKn8h5TLMdSW8+jeXfNTjhrWaqHSyadcaCeFliD
         6Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472527; x=1729077327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0csW+tPpL/m/PvAcC5nebkXIoS7CD1K1HdfmJ2rZahI=;
        b=rOOP36xZFrCu2OnLv7s65W+78qgpTMtWyarrFL5m4VKaBtldQIEEopRUg/c6Csh/ue
         9uiSxO/FKE/YZoIwYP8aeIaXAXZ2W3386D6BHbUUMMDhdPr0HgDc3j8dXnJd5P1gfiWS
         yP4kdC0VpUv4JIs0e2vtpq/8yYSlSqIF9WdfI6d7Rq3/fmbsf9Zmw9P+ZrjcqrrMD0HS
         y5EwA0XC9hyLJPpd/r+eVCvBWXIJAi4dLwUnEwvh0LxotR0BySMHF3S9STkXbJ28XuNF
         u9Hz0wh+BmBHjhwN8ksoUxXQIr66UgDv64pCBVlMXdJJMNi3l+vMVlDhrWyUuDTEZl2u
         zboA==
X-Forwarded-Encrypted: i=1; AJvYcCV5HLCntVzuoW1/PkFTHuve7zv3RNMyHO5Sa5+hW+9xLkVCOX42Rmn7gJegGPySugWnRXpJH/yPAno=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM3+glMn9iWI0xbXC0lchtneIQjbHcH66CzQtdqBOze8IHuJOa
	GLGe/YCieTtDPGGhz7lT2/tZmcrlmRbCahvmY5Ijdz9No9pg12cJtvwu88uDzA==
X-Google-Smtp-Source: AGHT+IFNWjLwF2wPcV9zbim5uX+/ZfFSlBvYzOx4XvSeHkfJ497hUafASw8LV0HPotuXCcINXY4hHw==
X-Received: by 2002:a17:906:6a2a:b0:a99:4fb4:ea30 with SMTP id a640c23a62f3a-a998d1ac05fmr170907266b.19.1728472527097;
        Wed, 09 Oct 2024 04:15:27 -0700 (PDT)
Message-ID: <99089b03-e9f0-4fe8-94b2-11e75f9e5243@suse.com>
Date: Wed, 9 Oct 2024 13:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com> <ZwZScGr75xEolDnS@mail-itl>
 <00ac0665-e4ff-4a56-8537-e81573710c3c@suse.com>
 <e3917457-08d4-4f0c-9e0c-1519952ceed9@suse.com>
 <dde4b510-5674-44d0-9493-a0717387b8d6@citrix.com>
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
In-Reply-To: <dde4b510-5674-44d0-9493-a0717387b8d6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2024 13:08, Andrew Cooper wrote:
> On 09/10/2024 11:26 am, Juergen Gross wrote:
>> On 09.10.24 12:19, Jan Beulich wrote:
>>> On 09.10.2024 11:52, Marek Marczykowski-Górecki wrote:
>>>> On Wed, Oct 09, 2024 at 09:19:57AM +0200, Jan Beulich wrote:
>>>>> On 08.10.2024 23:32, Marek Marczykowski-Górecki wrote:
>>>>>> --- a/tools/libs/guest/xg_dom_bzimageloader.c
>>>>>> +++ b/tools/libs/guest/xg_dom_bzimageloader.c
>>>>>> @@ -272,8 +272,7 @@ static int _xc_try_lzma_decode(
>>>>>>       return retval;
>>>>>>   }
>>>>>>   -/* 128 Mb is the minimum size (half-way) documented to work for
>>>>>> all inputs. */
>>>>>> -#define LZMA_BLOCK_SIZE (128*1024*1024)
>>>>>> +#define LZMA_BLOCK_SIZE (256*1024*1024)
>>>>>
>>>>> That's as arbitrary as before, now just not even with a comment at
>>>>> least
>>>>> hinting at it being arbitrary. Quoting from one of the LZMA API
>>>>> headers:
>>>>>
>>>>>      * Decoder already supports dictionaries up to 4 GiB - 1 B (i.e.
>>>>>      * UINT32_MAX), so increasing the maximum dictionary size of the
>>>>>      * encoder won't cause problems for old decoders.
>>>>>
>>>>> IOW - what if the Linux folks decided to increase the dictionary size
>>>>> further? I therefore wonder whether we don't need to make this more
>>>>> dynamic, perhaps by peeking into the header to obtain the dictionary
>>>>> size used. The one thing I'm not sure about is whether there can't be
>>>>> multiple such headers throughout the file, and hence (in principle)
>>>>> differing dictionary sizes.
>>>>
>>>> What is the purpose of this block size limit? From the error
>>>> message, it
>>>> seems to be avoiding excessive memory usage during decompression (which
>>>> could be DoS via OOM). If that's the case, then taking the limit from
>>>> the kernel binary itself will miss this point (especially in case of
>>>> pygrub or similar, but there may be other cases of not-fully-trusted
>>>> kernel binaries).
>>>
>>> Indeed. The question then simply is: Where do we want to draw the line
>>> between what we permit and what we reject?
>>
>> IMHO the most natural solution would be to use guest memory for this
>> purpose.
>> OTOH this probably would require a significant rework of libxenguest.
> 
> That was XSA-25.  There are toolstack-provided limits on kernel&initrd
> sizes.

Which probably can't be directly applied to dictionary size used during
(de)compression.

Jan

