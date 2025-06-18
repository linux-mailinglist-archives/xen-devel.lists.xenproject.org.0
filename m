Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB64ADEB45
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 14:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019097.1395937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRrWj-0002zP-Pi; Wed, 18 Jun 2025 12:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019097.1395937; Wed, 18 Jun 2025 12:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRrWj-0002x0-N9; Wed, 18 Jun 2025 12:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1019097;
 Wed, 18 Jun 2025 12:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRrWh-0002w6-TZ
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 12:04:23 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f28b320-4c3c-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 14:04:22 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a35c894313so7661505f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 05:04:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe16806casm9085827a12.50.2025.06.18.05.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 05:04:21 -0700 (PDT)
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
X-Inumbo-ID: 5f28b320-4c3c-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750248262; x=1750853062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WAYPCJixiV7zgK7cyTRMK8RBH+JSfm3R5cByYNdSMT0=;
        b=fXiSdSx+8w/OwgHZx7/kh3PyXsAu8VnmNOiouqukhU+g8fxsNP9qqYmMqcuto74nXb
         nMbx8fEeZ4RHxfK4q5D3ntc0yt6plIIOH4XuaCzUDOXvcSdjTMvBGLbI3A8ZA7/pU1Em
         jc6eoqtZztj5YTTTb7lW35EUzEWKQe9OQJSlaI6Ui/hTXSNH0IrpHVXSO2QQt3m7swSd
         TWG03+YK2qk/GqzfgGNnqv58VU6MOeq8OOij7W7GypGNAJMLhXBXn6tCdQYiO8Wzc9EB
         a8KCNqMSV8OXhVBbZYG9KanGca9Qdt+RYdQQgGa3jCHR8EtA8DjZ1v6aRUijpa+oS2wG
         reSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248262; x=1750853062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAYPCJixiV7zgK7cyTRMK8RBH+JSfm3R5cByYNdSMT0=;
        b=GR6mlSoyFwl9YJBFZGvnb2SCPw06JGwS0UZjmRS+nFV+niNM4BdaGRPwXECwYpUti7
         JbzA7HGh4Ooq8ANWoVl0165+unhafTbBcgm3E3EmLajt5V8rn2IYTopNkh7V0oBkIYhl
         ANFja9z3g7kWcVWwRATUAd80y57hT66mE5NpIOTIbyN+KtpylCFLkaZmb9C7vaw60DkD
         D+7l6tp7BzkyoQKRJiiszExG6hP/lolz3lN1MhIAonrCxo+2KypMt/I5p8ZTTrdTPnqE
         eOsial1dXV8gMYlL5NnlbTa50NkLkTFgiND2B2gAWfSqtCOll8nLpNVzjzexm7dNxe61
         DhWA==
X-Gm-Message-State: AOJu0YxePMhQYArMDc3ZezU489UCErpQh5MTCEg/t1WhsdQIMT4oTxkl
	Gnsp4IymZw0Jo+rg4MGyCWuywL1YCpZfIeswHT0Of5TRUfTBih4Kr+8fQiduhUcULg==
X-Gm-Gg: ASbGncvT3Y7v7wXk4gWS9P/x861pxq17l0RmbQ6m+6cUpsgTCLJ/HBJPTKThXRGlB8/
	RH67x9ufsXn3fg3eC/6GWUDlwlDKYkQm8gj3dkU5PjCryZOECJmXNBdfNcTWwRp8ad2ruS9zUSL
	YQVmGm3hydvkS7OzD3QWwv6qFGqJaHk+0wH+Nn/9IcQJhi69GqtB1PXz2SYx/Ip/fSkIEapIF7x
	NCg+Duo4Khm5v2JJzEgVQOkOYBQx1EMoybHxa/kCmRE0KthsrYAA/RnZ5cYuM7Vwxy5nxn9AQKL
	73+poauB0B1VySVhj2InlD75Qw4WJgmMYeBNWDz2ulEtCoKyOcdwhRLC7FgjH4KJKrQdLZ87D+C
	0il3beTXJrlAsCCH75hdpNZyk7Xk8EcBc3nx5fTK9Gf1lLbB9gKv5tD8ymA==
X-Google-Smtp-Source: AGHT+IGZlPYGbMox5qe2KykBkj7lQJoPaUBiX7q+45+t3Ng0r5pmnq6Q6iLeEEUC0bfcAhLduHb3pw==
X-Received: by 2002:a05:6000:178b:b0:3a4:d8f2:d9d with SMTP id ffacd0b85a97d-3a572e6f2b3mr13840139f8f.38.1750248262065;
        Wed, 18 Jun 2025 05:04:22 -0700 (PDT)
Message-ID: <8f3f8815-a60d-4c8b-af2b-fc8ed5f9ba32@suse.com>
Date: Wed, 18 Jun 2025 14:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: arrange to conserve on DMA reservation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
 <aFAbqhfmM_GBxjVC@macbook.local>
 <9b036f26-f275-48d0-9a33-7cef38b29f48@suse.com>
 <aFAuRXSryHKj3jVa@macbook.local>
 <2969b5d8-5879-4674-8332-046898e17257@suse.com>
 <aFA7OiV8AX-ua-W_@macbook.local>
 <a56574c0-6744-4249-9410-60858f49d04c@suse.com>
 <aFBTA3wklAejAUPT@macbook.local>
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
In-Reply-To: <aFBTA3wklAejAUPT@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.06.2025 19:23, Roger Pau Monné wrote:
> On Mon, Jun 16, 2025 at 06:02:07PM +0200, Jan Beulich wrote:
>> On 16.06.2025 17:41, Roger Pau Monné wrote:
>>> On Mon, Jun 16, 2025 at 05:20:45PM +0200, Jan Beulich wrote:
>>>> On 16.06.2025 16:46, Roger Pau Monné wrote:
>>>>> One question I have though, on systems with a low amount of memory
>>>>> (let's say 8GB), does this lead to an increase in domain construction
>>>>> time due to having to fallback to order 0 allocations when running out
>>>>> of non-DMA memory?
>>>>
>>>> It'll likely be slower, yes, but I can't guesstimate by how much.
>>>
>>> Should there be some way to control this behavior then?  I'm mostly
>>> thinking about client systems like Qubes where memory is likely
>>> limited, and the extra slowness to create VMs could become
>>> noticeable?
>>
>> What kind of control would you be thinking of here? Yet another command
>> line option?
> 
> I guess that would be enough.  I think we need a way to resort to the
> previous behavior if required,

Thinking about it, there already is "dma_bits=". Simply setting this low
enough would have largely the same effect as yet another new command line
option. Thoughts?

> and likely a CHANGELOG entry to notice the change.

Hmm, not sure here. This is too small imo, and really an implementation
detail.

> Overall, would it be possible to only include the flag if we know
> there's non-DMA memory available to allocate?  Otherwise we are
> crippling allocation performance when there's only DMA memory left.

Imo trying to determine this would only make sense if the result can
then be relied upon. To determine we'd need to obtain the heap lock,
and we'd need to not drop it until after the allocation(s) were done.
I think that's far away from being a realistic option.

> That also raises the question whether it's an acceptable trade-off to
> possibly shatter p2m super pages (that could be used if allocating
> from the DMA pool) at the expense of not allocating from the DMA pool
> until there's non-DMA memory left.

This being an acceptable tradeoff is imo an implicit pre-condition of
adding such a heuristic. For the system as a whole, exhausting special
purpose memory is likely worse than some loss of performance. Plus as
said above, people valuing performance more can reduce the "DMA pool".

Jan

