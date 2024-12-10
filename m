Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BAE9EAD1D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 10:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851954.1265909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKwx6-0002c5-28; Tue, 10 Dec 2024 09:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851954.1265909; Tue, 10 Dec 2024 09:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKwx5-0002a3-V3; Tue, 10 Dec 2024 09:54:47 +0000
Received: by outflank-mailman (input) for mailman id 851954;
 Tue, 10 Dec 2024 09:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKwx5-0002Zx-8t
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 09:54:47 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c912b434-b6dc-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 10:54:46 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434fef8203fso8939895e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 01:54:45 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:3d8c:c505:78ea:f982?
 (p200300cab746063c3d8cc50578eaf982.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:3d8c:c505:78ea:f982])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f82bc754sm72415315e9.9.2024.12.10.01.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 01:54:44 -0800 (PST)
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
X-Inumbo-ID: c912b434-b6dc-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733824485; x=1734429285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3pDMHKsd4uD3RZV9HYnVz5B5Oqa/KJqR0y987XV/fzY=;
        b=N+jm6ZJD3mrKCsBAeglH3v6qEB89BJjqXrMdZE1dmZ7PaYOXFZ+2VRlpvMaLk73nwj
         Sxl0ZutiPmXqfBbXrToXY3VWsHOp02M7+HNs8T8BHTn8z2E3E3lrev3n+LRKg9oxpbmn
         PwMPJwbYjFxrmweWFuCZPOOxNtN/Fhs9CTMWWxXrzHMbaTxIqDnb9UkETxh8ay0xM0xM
         37SKcOXhPjQC65AS3InfoHMNZooB6oKBV1+EO4PuVUIVUefCVc+WcamPZykGwJnxpAtL
         CEizaaCI2fyenl/CcJqu813j5Nx6mEQZxKRtFc4dWnJZOBJ8jxn6tYyRPqYLk44Nx99B
         WV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733824485; x=1734429285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pDMHKsd4uD3RZV9HYnVz5B5Oqa/KJqR0y987XV/fzY=;
        b=UizT9wPNpyInZx4zLLpNEycTDeyq8wbUyNvzQEXCMAHydjHpoQK/VtMma1yffmKy66
         7LUsnaTuv3a5AvY9H16Y8F1t86V4nfHDsW5ki6F1QTGrMxtTtI8jdxZ4rLJcVhQggoDQ
         rziJY4pLCd/MRjgRwVHRz4UtGWx5+XRsv9A9BcLXaIljSGiKrE0Yn0ypme8lf3AitMuw
         7p3A0cUwwwJrItqx/zCzti9qH7xv6H7XTOwFIsKENzbwuNvg6rupdnIPrH2AympEjhng
         ElIqgTJCSUh9dMEo81VyPPFlViGLjisZzWN6YPRUsSCXaK+xdgME/MTlBLPa3oAJ8MRq
         bJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7HxgSsDmQuPulS8QHwUQ27EGVlc/VYRd2x2UpkW64uDz6SC5PhxWUBxjCqb5A9G76FZqqZ2EaRcs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyq++Q5WMQ/rWbGKdMLfRF7h6bcUajqSS15GGMx6zxlzpsamYtH
	ZqWHWPh6ul00VvkmmQDb6Bl4n1olnodJES/lB+P2cNJ44fXm4gRhg038GEubRA==
X-Gm-Gg: ASbGncsTicBX+Ij2ewiLP+33vPBeAr/isB2bQoB9sI/wCWNXKI52hn3HOEYx7LJvUwF
	5FtsLzvJxiidYknCcB3Z5UTvP2aiYegMkdN52IEnlwPi3wFVmaBDeYwcbLv2bfn/aRaVYdtW77R
	4PxINOF/CNEc5Se/6z7eMFGMR7EYUU8NraYDmhPpQrVV1QgSFsjqxBDSsZPQphVxm6SVWjZ/EVS
	tr99R7b5LQ3BB8i2DKGqXdnAbazuqacF5TSWAF/dngVa70GBfc6qXMLpGecGlpwRX3AOds+s4R+
	by+h68mfUT4Tw7o9Izo/nwSyCF5MhZv9LRB3PVFb1qSvXI3BQzxCv9wqRjhmlhV0O+UMKcZRfBj
	pLJm4lX9Ewg==
X-Google-Smtp-Source: AGHT+IHDzWR/J8nSjYkC513izSujcmoN2wOTvMsK/FVlDQYQmCeAmdSweR7LA/+JMC5nyBCY6hsFrA==
X-Received: by 2002:a05:600c:46c6:b0:434:eb73:b0c0 with SMTP id 5b1f17b1804b1-434fff5b51dmr30610645e9.5.1733824484844;
        Tue, 10 Dec 2024 01:54:44 -0800 (PST)
Message-ID: <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
Date: Tue, 10 Dec 2024 10:54:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 08:57, Chen, Jiqian wrote:
> On 2024/12/10 15:17, Jan Beulich wrote:
>> On 10.12.2024 08:07, Chen, Jiqian wrote:
>>> On 2024/12/9 21:59, Jan Beulich wrote:
>>>> On 02.12.2024 07:09, Jiqian Chen wrote:
>>>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>>> +                                      unsigned int reg,
>>>>> +                                      uint32_t val,
>>>>> +                                      void *data)
>>>>> +{
>>>>> +    uint64_t size;
>>>>> +    unsigned int index;
>>>>> +    struct vpci_bar *bars = data;
>>>>> +
>>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>>>> +        return;
>>>>
>>>> I don't think something like this can go uncommented. I don't think the
>>>> spec mandates to drop writes in this situation?
>>> Spec says: Software must clear the Memory Space Enable bit in the Command register before writing the BAR Size field.
>>> This check is suggested by Roger and it really helps to prevent erroneous writes in this case,
>>> such as the result of debugging with Roger in the previous version.
>>> I will add the spec's sentences as comments here in next version.
>>
>> What you quote from the spec may not be enough as a comment here. There's
>> no direct implication that the write would simply be dropped on the floor
>> if the bit is still set. So I think you want to go a little beyond just
>> quoting from the spec.
> How about quoting Roger's previous words: " The memory decoding must be disabled before writing the BAR size field.
> Otherwise changing the BAR size will lead to the active p2m mappings getting out of sync w.r.t. the new BAR size." ?

That'll be better, but imo still not enough to explain the outright ignoring
of the write.

>>>>> +        if ( rc )
>>>>> +        {
>>>>> +            printk("%pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
>>>>> +                   &pdev->sbdf, rc);
>>>>> +            break;
>>>>> +        }
>>>>> +
>>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>>>>> +                               rebar_offset + PCI_REBAR_CTRL, 4,
>>>>> +                               pdev->vpci->header.bars);
>>>>> +        if ( rc )
>>>>> +        {
>>>>> +            printk("%pp: add register for PCI_REBAR_CTRL failed %d\n",
>>>>> +                   &pdev->sbdf, rc);
>>>>> +            break;
>>>>
>>>> Is it correct to keep the other handler installed? After all ...
>>> Will change to "return rc;" here and above in next version.
>>
>> I'm not convinced this is what we want, as per ...
>>
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>
>>>> ... you - imo sensibly - aren't communicating the error back up (to allow
>>>> the device to be used without BAR resizing.
>>
>> ... what I said here.
> Sorry, I didn’t understand.
> Do you mean it is not enough to return error code once a handler failed to be installed, I need to remove the already installed handlers?

No, if you return an error here, nothing else needs doing. However, I
question that returning an error here is good or even necessary. In
the event of an error, the device ought to still be usable, just
without the BAR-resizing capability.

>>>>> @@ -541,6 +542,16 @@
>>>>>  #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
>>>>>  #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
>>>>>  
>>>>> +/* Resizable BARs */
>>>>> +#define PCI_REBAR_CAP		4	/* capability register */
>>>>> +#define  PCI_REBAR_CAP_SIZES		0xFFFFFFF0  /* supported BAR sizes */
>>>>
>>>> Misra demands that this have a U suffix.
>>> Do below PCI_REBAR_CTRL_BAR_IDX, PCI_REBAR_CTRL_NBAR_MASK and PCI_REBAR_CTRL_BAR_SIZE also need a U suffix?
>>
>> They may want to gain them for consistency, but they don't strictly need
>> them. I wanted to say "See the rest of the file", but it looks like the
>> file wasn't cleaned up yet Misra-wise.
> Yes, I noticed that the rest of the file didn't add U suffix too.
> So, I just need to add U suffixes for my new macros?

You only strictly need to add U to values with the top bit set.

>>>>> +#define PCI_REBAR_CTRL		8	/* control register */
>>>>> +#define  PCI_REBAR_CTRL_BAR_IDX	0x00000007  /* BAR index */
>>>>> +#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0  /* # of resizable BARs */
>>>>> +#define  PCI_REBAR_CTRL_BAR_SIZE	0x00001F00  /* BAR size */
>>>>> +#define  PCI_REBAR_CTRL_SIZE(v) \
>>>>> +            (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) + 20))
>>>>
>>>> The literal 20 (appearing here the 2nd time) also wants hiding behind a
>>>> #define.
>>> OK, will add " #define PCI_REBAR_SIZE_UNIT_BYTES_LEN 20" to replace above two '20' case.
>>
>> What is "UNIT_BYTES_LEN" there? There's nothing byte-ish here, I don't
>> think, 20 is simply the shift bias.
> It's a naming problem. What I want to express here is that the basic unit is 1MB, which is 2^20 of bytes.
> Since the spec has the definition about the value of the bar size bits of register:
> BAR Size - This is an encoded value.
> 0	1 MB (2^20 bytes)
> 1	2 MB (2^21 bytes)
> 2	4 MB (2^22 bytes)
> 3	8 MB (2^23 bytes)
> …
> 43	8 EB (2^63 bytes)
> Do you have suggestion about this macro name?

PCI_REBAR_SIZE_BIAS? PCI_REBAR_SIZE_SHIFT_BIAS? PCI_REBAR_SIZE_SHIFT?

Jan

