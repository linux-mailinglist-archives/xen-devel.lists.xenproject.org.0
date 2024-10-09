Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975E9966E4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 12:19:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814285.1227825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTn3-0003er-I7; Wed, 09 Oct 2024 10:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814285.1227825; Wed, 09 Oct 2024 10:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTn3-0003bd-Ey; Wed, 09 Oct 2024 10:19:33 +0000
Received: by outflank-mailman (input) for mailman id 814285;
 Wed, 09 Oct 2024 10:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syTn2-0003bX-9P
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 10:19:32 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8e8283e-8627-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 12:19:31 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9951fba3b4so479450366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 03:19:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994483e1e3sm520924766b.111.2024.10.09.03.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 03:19:30 -0700 (PDT)
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
X-Inumbo-ID: f8e8283e-8627-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728469170; x=1729073970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YWNOkMJt/qZiHUSsIWHQpYMnVYXyjbu1ne9rUwtjF38=;
        b=SbIH1/3cbc0z2qdRVsvSo5ozlDZOjM66Sa0pIqwULH4z7jhv3GzQhOwtbO7k5Q16Ag
         bl1BpCM8wm6wjx06IULW+O/+cvgeWr7c86kn33rwPfSL1FNGwl0qdwflA1krLiVBI+6Z
         DFTuyNr48SpGfwkp3l1xMOmDYdlb85aijnUGsj9zb1DpZLuGrkBO2ak3h5VwxyvllPGW
         lEH3VnCWpF4Z5qc19+SmNDRFh0brXyUQ2Wx52qUKHt5Uo3fRldrqHGUQBs0m8K7g7+HY
         A0i8bT+br7V87qCfLgyC92poYLfh7L8jlXVdc2qp2fh9VoFpXaSDlkpFjJaiFzwn8pK2
         XXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728469170; x=1729073970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWNOkMJt/qZiHUSsIWHQpYMnVYXyjbu1ne9rUwtjF38=;
        b=qAri6ivLOTdZ3wkbiY4UIlqWRaEKu51fjCIghGL8MF32EBVKypxTppWGiLpUHv6dh2
         IEZlLkCvN+e7i212koUW5IrenY/S0aia5RU4xVYppLKTKDNi7TIWCHVioTcXgmG4Op0T
         FG8gYmN1cEz2wchVy3/BBoWBYLM5HIfFdKFXgXz+rEJsX8qmJRMva6C12X+ioIBHKwys
         PX9EjFWodDAsQNrOOuA2yYg15T364q5XbPbOwN5us6bZ/btgwi1SX1Kk36MNybTbdnGi
         Nz6vuUbi7B0Ei/qN8Z7FESVfvsQVrsttt7PY+Ac95eCv+WwjS+dwfIV1r0ukBODmpTxt
         WD4w==
X-Forwarded-Encrypted: i=1; AJvYcCXU4edDMWvl2l0c/FRfo+d/LhJd9FvVmIVExsNeQw8Fqndqq9kozPoQ3OjXdOviQPUZ02Fi8BCxpBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJ3/mXzn0gnVM9x4WIrHAow31vqcaKv3tKkp1qy++zG54EBG5x
	+NbWltGOb7vmOo34whpwzh8SM/rXYqgDibQdp1R3qIo6FdoWLiRI1n8V3Hkr1w==
X-Google-Smtp-Source: AGHT+IHgnMfKMSWpUDB9fN6tQbby353vUU0Y9RU7f24ZjPlvVMjwIm+vwuVzVrCNbLqr9J6lq1TVgQ==
X-Received: by 2002:a17:907:d3cc:b0:a99:7e67:cd13 with SMTP id a640c23a62f3a-a998d208896mr171984766b.36.1728469170533;
        Wed, 09 Oct 2024 03:19:30 -0700 (PDT)
Message-ID: <00ac0665-e4ff-4a56-8537-e81573710c3c@suse.com>
Date: Wed, 9 Oct 2024 12:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com> <ZwZScGr75xEolDnS@mail-itl>
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
In-Reply-To: <ZwZScGr75xEolDnS@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2024 11:52, Marek Marczykowski-Górecki wrote:
> On Wed, Oct 09, 2024 at 09:19:57AM +0200, Jan Beulich wrote:
>> On 08.10.2024 23:32, Marek Marczykowski-Górecki wrote:
>>> --- a/tools/libs/guest/xg_dom_bzimageloader.c
>>> +++ b/tools/libs/guest/xg_dom_bzimageloader.c
>>> @@ -272,8 +272,7 @@ static int _xc_try_lzma_decode(
>>>      return retval;
>>>  }
>>>  
>>> -/* 128 Mb is the minimum size (half-way) documented to work for all inputs. */
>>> -#define LZMA_BLOCK_SIZE (128*1024*1024)
>>> +#define LZMA_BLOCK_SIZE (256*1024*1024)
>>
>> That's as arbitrary as before, now just not even with a comment at least
>> hinting at it being arbitrary. Quoting from one of the LZMA API headers:
>>
>> 	 * Decoder already supports dictionaries up to 4 GiB - 1 B (i.e.
>> 	 * UINT32_MAX), so increasing the maximum dictionary size of the
>> 	 * encoder won't cause problems for old decoders.
>>
>> IOW - what if the Linux folks decided to increase the dictionary size
>> further? I therefore wonder whether we don't need to make this more
>> dynamic, perhaps by peeking into the header to obtain the dictionary
>> size used. The one thing I'm not sure about is whether there can't be
>> multiple such headers throughout the file, and hence (in principle)
>> differing dictionary sizes.
> 
> What is the purpose of this block size limit? From the error message, it
> seems to be avoiding excessive memory usage during decompression (which
> could be DoS via OOM). If that's the case, then taking the limit from
> the kernel binary itself will miss this point (especially in case of
> pygrub or similar, but there may be other cases of not-fully-trusted
> kernel binaries).

Indeed. The question then simply is: Where do we want to draw the line
between what we permit and what we reject?

Jan

