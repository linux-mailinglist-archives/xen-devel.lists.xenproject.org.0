Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3546C577C3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161307.1489284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWmY-00031h-Je; Thu, 13 Nov 2025 12:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161307.1489284; Thu, 13 Nov 2025 12:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWmY-0002zf-Fu; Thu, 13 Nov 2025 12:50:34 +0000
Received: by outflank-mailman (input) for mailman id 1161307;
 Thu, 13 Nov 2025 12:50:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJWmW-0001YB-F0
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:50:32 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 561e6695-c08f-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:50:30 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-640b06fa959so1437484a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 04:50:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b19dcsm1350534a12.27.2025.11.13.04.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 04:50:29 -0800 (PST)
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
X-Inumbo-ID: 561e6695-c08f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763038230; x=1763643030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YtlW+F+XN+d+q8r5ILVn0l/yu+UyCqJZRoVYMv7YElY=;
        b=KFxO8WgF4EIDw1tEC2WUEQOP6ozAN5SL3cces5Cr2r0bARFiBOnUQ7Z8Imldrei8HV
         v27td38pLjjGDdPWl+5998YaqIjZREvbNd1h316ZNMJjBbhMWCY7PCxZVjTi4y7cuYv1
         CmiMcXx9ue8pb4dogDJjdrsXQa72jfqjV1rm1flRempaqzbXobFJ2VpKfELgMgYdCDYP
         AuDgQMPeHauY/wzqTc7oLjK1SSF5S1xLV58qCbgOq5T2b15qT9VGkdRZs5USCNO6aXIW
         +oVZkN/d5Tjv76ghuJlvrVJ3L84OAtDgwTevl9nn41szqmWnzhEHa5301Fc3zqTA58yV
         cXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763038230; x=1763643030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtlW+F+XN+d+q8r5ILVn0l/yu+UyCqJZRoVYMv7YElY=;
        b=ZHk5rZTzn0kyi57zYSnmES7aKU7RvM0jDLja9vOrSJS20t3X/Pb6QQzMBb4dG+j5Wf
         ozkNvwgRGbRibaOcio/RbyG58u4gqGUvbUzibc38iWeTnyxidKztEYVeEqkalUpOAGq3
         AY6m7Fa+RrcW8Hwv/etIYkR2opqvs1Vt2yc1WlMZUrnXabd6ok/gsM1E0CZ3fLqC3896
         xD0OheAmFn6pbhXLldbyC0EqzVU2Y6Q9esViaFPJ7JGlDifWGbPuUGEE1X7/7YAPXnF/
         RcNXLXpNtA7HVBU3yzB9Bgn4lVAti7nlJz2az46gWkUw/3Yr7YpUq2mkdkziA9dpGFjt
         1kOQ==
X-Gm-Message-State: AOJu0YxFjWPcM+VLzspukPWbqYXcayzRaTc7F4JgZs0nyu+cSiXMRXYs
	crb0kM+lkqyV4tw/18pZvdBeQbxfCKC10U/S4HXLEY3jeb47KonPmHhag571Xsx//w==
X-Gm-Gg: ASbGnctQgPbIlr/aON7nWYoqcBmla3o1BCAweylLhXCuF6TvqYO0oz2GPOxm64wlHc3
	94Xhxg/lQimzw4aq97RiwSWPMNZm7Qfu7UskY1ugnJWJ1fBU1EkFr8xTIgKWMs/+NGrak7KcaO3
	zQzbRD1h45qOS3TkckcP2TNSyi5CzbBGLnxk2PxO9eJC9YyXd1zdeMtxXRX/jAwbYV3HqFK851o
	fBb8DGZy09+kyZ8P0WTq3mkbLgZ+ySahc0owzsvwOirGfjTnYngjbVKEoiJqnOGKJyzaV3neNUZ
	Dzn1HfBqlGkjfAvjAl3Jr8nlyGpuWo1h7adOpMdXTPGQUyi7yIaiIHnRjbThh8hYSccRL6oAsLS
	C0DxXzW8VFsfDRWbObDJdQKUuHFLXzvu5yBfC+PxzyTzaYswqc0F40JuPOB/iLPhy1ApYvd/kWS
	Tix8QYWTU8jeUh2aVbdNTpWoiSLuNJxewPBbxb+8gscK5SeT5SZydH74dhLHYW8PqPDrQzRPcsg
	NM=
X-Google-Smtp-Source: AGHT+IFA0ZQnImQ6OQiKxro6xd6R3Mr0iu1YXzq8OZeUk9DGKviFn78epZbmsNoydzpx8C16liHurA==
X-Received: by 2002:a17:907:96a1:b0:b45:b078:c52d with SMTP id a640c23a62f3a-b7331a5d74cmr611493066b.35.1763038230133;
        Thu, 13 Nov 2025 04:50:30 -0800 (PST)
Message-ID: <0ed20aaa-2625-4555-8fab-0e15fea5e71c@suse.com>
Date: Thu, 13 Nov 2025 13:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xhci-dbc: use brk_alloc()
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <bec55a88-00f3-4961-b1dc-5b9e38d94a32@suse.com> <aRXRdU8YusudRmxf@mail-itl>
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
In-Reply-To: <aRXRdU8YusudRmxf@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 13:39, Marek Marczykowski wrote:
> On Thu, Nov 13, 2025 at 12:10:16PM +0100, Jan Beulich wrote:
>> --- a/xen/drivers/char/xhci-dbc.c
>> +++ b/xen/drivers/char/xhci-dbc.c
>> @@ -27,6 +27,8 @@
>>  #include <xen/serial.h>
>>  #include <xen/timer.h>
>>  #include <xen/types.h>
>> +
>> +#include <asm/brk.h>
>>  #include <asm/fixmap.h>
>>  #include <asm/io.h>
>>  #include <asm/string.h>
>> @@ -1321,7 +1323,7 @@ static struct uart_driver dbc_uart_drive
>>  };
>>  
>>  /* Those are accessed via DMA. */
>> -struct dbc_dma_bufs {
>> +struct __aligned(PAGE_SIZE) dbc_dma_bufs {
>>      struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
>>      struct xhci_trb out_trb[DBC_TRB_RING_CAP];
>>      struct xhci_trb in_trb[DBC_TRB_RING_CAP];
>> @@ -1335,8 +1337,7 @@ struct dbc_dma_bufs {
>>       * DMA-reachable by the USB controller.
>>       */
>>  };
>> -static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>> -    dbc_dma_bufs;
>> +DEFINE_BRK(xhci, sizeof(struct dbc_dma_bufs));
> 
> I think with this change (or rather with using brk_alloc() below), the
> structure wants to be padded up to the page size, to avoid putting
> anything else on the same page (see comment just outside of context
> above).

Are you sure? My understanding is that sizeof(xyz) is always evenly divisible by
alignof(xyz). Hence such padding doesn't need making explicit. (And yes, I did
see that comment while making the change.)

>> @@ -1413,24 +1414,33 @@ void __init xhci_dbc_uart_init(void)
>>  {
>>      struct dbc_uart *uart = &dbc_uart;
>>      struct dbc *dbc = &uart->dbc;
>> +    struct dbc_dma_bufs *dma_bufs;
>>  
>>      if ( !dbc->enable )
>>          return;
>>  
>> -    dbc->dbc_ctx = &dbc_dma_bufs.ctx;
>> -    dbc->dbc_erst = &dbc_dma_bufs.erst;
>> -    dbc->dbc_ering.trb = dbc_dma_bufs.evt_trb;
>> -    dbc->dbc_oring.trb = dbc_dma_bufs.out_trb;
>> -    dbc->dbc_iring.trb = dbc_dma_bufs.in_trb;
>> -    dbc->dbc_owork.buf = dbc_dma_bufs.out_wrk_buf;
>> -    dbc->dbc_iwork.buf = dbc_dma_bufs.in_wrk_buf;
>> -    dbc->dbc_str = dbc_dma_bufs.str_buf;
>> +    dma_bufs = brk_alloc(sizeof(*dma_bufs));
>> +    if ( !dma_bufs )
>> +    {
>> +        dbc->enable = false;
>> +        printk(XENLOG_ERR "XHCI: not enough BRK space available\n");
>> +        return;
>> +    }
>> +
>> +    dbc->dbc_ctx = &dma_bufs->ctx;
>> +    dbc->dbc_erst = &dma_bufs->erst;
>> +    dbc->dbc_ering.trb = dma_bufs->evt_trb;
>> +    dbc->dbc_oring.trb = dma_bufs->out_trb;
>> +    dbc->dbc_iring.trb = dma_bufs->in_trb;
>> +    dbc->dbc_owork.buf = dma_bufs->out_wrk_buf;
>> +    dbc->dbc_iwork.buf = dma_bufs->in_wrk_buf;
>> +    dbc->dbc_str = dma_bufs->str_buf;
>>  
>>      if ( dbc_open(dbc) )
>>      {
>>          iommu_add_extra_reserved_device_memory(
>> -                PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
>> -                PFN_UP(sizeof(dbc_dma_bufs)),
>> +                PFN_DOWN(virt_to_maddr(dma_bufs)),
>> +                PFN_DOWN(sizeof(*dma_bufs)),
> 
> Is that really correct? But with padding (see earlier comment) it
> shouldn't really matter.

I think this is addressed by the reply further up as well.

Jan

