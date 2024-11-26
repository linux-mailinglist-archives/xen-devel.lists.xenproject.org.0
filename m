Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DAC9D9608
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 12:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843591.1259218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtVC-00020U-R6; Tue, 26 Nov 2024 11:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843591.1259218; Tue, 26 Nov 2024 11:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtVC-0001y0-No; Tue, 26 Nov 2024 11:13:06 +0000
Received: by outflank-mailman (input) for mailman id 843591;
 Tue, 26 Nov 2024 11:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFtVB-0001xu-A9
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 11:13:05 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6643e505-abe7-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 12:13:01 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa55171d73cso345438666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 03:13:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa53c68e113sm387552466b.191.2024.11.26.03.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 03:13:00 -0800 (PST)
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
X-Inumbo-ID: 6643e505-abe7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY2NDNlNTA1LWFiZTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjE5NTgxLjQ5NzE0Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732619581; x=1733224381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fr1ewOTKegAccMvjfc/v3wKzpqF1clLdI3hxa2ZeyEw=;
        b=QNZ1hhYZs8QSCPT6jYebZoaFaMAAupbBT/PIeNPEpNvtngAY9OnEJ5OElLUsFt8f9+
         kMEbfqezHCrIuVEL646+ie+A5bat2jGlP8zDegkBhM84CIBgI/pHtG9uXPbNLRTDftJq
         xGbDuhZKh5R+jP2yUeBtfCDIuxkFNLd1er5/e+L+pSI7zhrSwB967QP1i7H7xJ1DFI+X
         7A6nA/gF6D5DkGy4Pgdjixdn0gWUBY4LNtKyhm8mj34v4y+ZYMVaMfaXmYkDWPrqYcE1
         SLANQHb0iFpyQQpi6uz4k4KJ4iaB/L7uIB7XsTJoAjGic3HbH2lx2d/JpRAqwPzMxET7
         0fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732619581; x=1733224381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fr1ewOTKegAccMvjfc/v3wKzpqF1clLdI3hxa2ZeyEw=;
        b=meHuFxwltocSPFwlTNMFn2MiUrsT1rqT7Nl108+5jHmnC3yhOidHqk3ODQSnvADlOw
         n2Y3LINQDz+/p8oGIEOni8iH2OQY5yYGMCFv6P4yPRYa7rdvvZsCil+lWZeD+g0XL26z
         Yuk9Hxl35VbZYmud3OOs86+l62ba/ftxJlf0nJKTfFDb59t1E+2eW/LF+AoPGeqjRx3Q
         evSrXG5e3J3PpEeidfMsTp0svc4G9jReLilSrROTzu+pmPLbQcokBWrxFSWVUcnvwf6E
         017wTjYEXwQyMFyolJum+BC5hYXSqky2FMJcdGzhoPMFWxf2FVe1gloTrKW0V5dculur
         wX3w==
X-Forwarded-Encrypted: i=1; AJvYcCVN/i0gF9o4cSdHNoi1CMCGV1O0Qm/PzuSFm5kRPu/TwFNAFDLwcFH+wMwwWQq/XC/atB2i2D3WNyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWB5S+YK1iJ0LovyU7edmv1DpWiqYEQ1UGQglc5eDilmeZwVK9
	r8GnJksmzUlBZbhTomYlIXq/ODYFVYFSI0FF65Eq8Pyqz+GaED6ZgW7xqQDfGQ==
X-Gm-Gg: ASbGncto5iL9Y47TwCqBGBbO4bY4fV8mP9MCVXSn4VX2g7uWjTQuE7Ugz5P4iTK1V5W
	0CIjSPPIw7CZkwgLJ+xkizyfJVIRII3RhAeQqyeV3lHdsHy28haI7/Fa+SM+ojjPNszMGfSfcPi
	F9Cnzs0sPUuw6RPAhMG5qhWc8zgJ3UvYRmJST5TtvUs10uokjf7ZYHLNlijiH/aImWhTeik4X9m
	0MS16F9WopXUXSpcSznwDnQQXXJwgeFGQQuiRvY5wE7n2iF7tYS8tZkRFmhPX0Kdzjo+M4aUKMh
	x9ugr3+B2hjiiK7/KCjlCcSIT1z6pNIuwi8=
X-Google-Smtp-Source: AGHT+IEJzPU1AxIymnefBSacKNC/PVD/9Wke7KIBLzLay49dEKPbgztO7WuXWrAW/00ai1X8DLm+rw==
X-Received: by 2002:a17:906:8449:b0:a9a:616c:459e with SMTP id a640c23a62f3a-aa5648b9623mr248316966b.27.1732619580936;
        Tue, 26 Nov 2024 03:13:00 -0800 (PST)
Message-ID: <e5f0b9e4-80ab-4cf5-8745-4cb83cfe4c7d@suse.com>
Date: Tue, 26 Nov 2024 12:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-5-luca.fancellu@arm.com>
 <ca91b717-47c3-4f92-af6a-cb740ef6e91d@suse.com>
 <BE895863-B07F-42C2-BD44-D0A1E6150DC4@arm.com>
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
In-Reply-To: <BE895863-B07F-42C2-BD44-D0A1E6150DC4@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 11:56, Luca Fancellu wrote:
> Hi Jan,
> 
> thanks for your review
> 
>> On 25 Nov 2024, at 16:32, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.11.2024 09:58, Luca Fancellu wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>
>>> If Xenheap is statically configured in Device Tree, its size is
>>> definite. So, the memory shall not be given back into static heap, like
>>> it's normally done in free_init_memory, etc, once the initialization
>>> is finished.
>>
>> I'm somewhat confused by the use of "back" here? Isn't the change all
>> about init-time behavior, i.e. memory that's handed to the allocator for
>> the very first time? Else I may be misunderstanding something here, in
>> which case I'd like to ask for the description to be refined.
> 
> Yes, I’ve tried to rephrase it, do you think this is more clear?
> 
> If the Xen heap is statically configured in Device Tree, its size is
> definite, so only the defined memory shall be given to the boot
> allocator. Have a check where init_domheap_pages() is called
> which takes into account if static heap feature is used.

This reads better, thanks. Follow-on question: Is what is statically
configured for the heap guaranteed to never overlap with anything passed
to init_domheap_pages() in those places that you touch?

>>> --- a/xen/include/xen/bootfdt.h
>>> +++ b/xen/include/xen/bootfdt.h
>>> @@ -132,7 +132,6 @@ struct bootinfo {
>>> #ifdef CONFIG_STATIC_SHM
>>>     struct shared_meminfo shmem;
>>> #endif
>>> -    bool static_heap;
>>> };
>>>
>>> #ifdef CONFIG_ACPI
>>> @@ -157,6 +156,10 @@ struct bootinfo {
>>>
>>> extern struct bootinfo bootinfo;
>>>
>>> +#ifdef CONFIG_STATIC_MEMORY
>>> +extern bool static_heap;
>>> +#endif
>>
>> Just to double check Misra-wise: Is there a guarantee that this header will
>> always be included by page-alloc.c, so that the definition of the symbol
>> has an earlier declaration already visible? I ask because this header
>> doesn't look like one where symbols defined in page-alloc.c would normally
>> be declared. And I sincerely hope that this header isn't one of those that
>> end up being included virtually everywhere.
> 
> I’ve read again MISRA rule 8.4 and you are right, I should have included bootfdt.h in
> page-alloc.c in order to have the declaration visible before defining static_heap.
> 
> I will include the header in page-alloc.c

Except that, as said, I don't think that header should be included in this file.
Instead I think the declaration wants to move elsewhere.

Jan

