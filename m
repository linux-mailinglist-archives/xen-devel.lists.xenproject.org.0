Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37390A60FAD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 12:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914391.1320161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt30T-0003Ld-Ot; Fri, 14 Mar 2025 11:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914391.1320161; Fri, 14 Mar 2025 11:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt30T-0003Im-Lj; Fri, 14 Mar 2025 11:15:13 +0000
Received: by outflank-mailman (input) for mailman id 914391;
 Fri, 14 Mar 2025 11:15:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt30S-0003Ig-9Z
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 11:15:12 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9843e81f-00c5-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 12:15:11 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso1129426f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 04:15:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb62ccsm14029665e9.7.2025.03.14.04.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 04:15:10 -0700 (PDT)
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
X-Inumbo-ID: 9843e81f-00c5-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741950911; x=1742555711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ok851lRuO3ipcGUuvU2zBSQe+WZL1VTMXl5lai23YlQ=;
        b=Nz6GaYE/GFgEuvhnrUmx1+QCYgY/SIXW4V6wi4qAhhvSLu9vFcxRlXbZ1yzPRzEv/s
         ktWKsI8hrqmDjRCXWXbgoyZBDhTBNUOKRIJ/Feq/v6OxoOekgUQZq0kkvDBA0Fscanhi
         E9Odkd7kLXsYKkeKsris3dhHnZqk7s/kQtxSY9qCpMLZuoxCzQaQAzQz48mcIF2nCH3+
         xHANX2A3f2UdYkxhVTgkeGoHgd1SwSwajxt5ssWFaVw3DSdHjmdf8jCwdQViLGZ6jljE
         Ok7cgDvqiq9fAShRQo06dnez48JYR8Krxfy22iziEO8Qbg7x2Tg4D+ukyIsZFGMlkXX4
         SAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950911; x=1742555711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok851lRuO3ipcGUuvU2zBSQe+WZL1VTMXl5lai23YlQ=;
        b=vD3GsSHf+Bd0zJlvgF2+i/xqk3B0jX/qRSvN3sP7FgjPvd/9IIUlCRmQjAGr6OpK43
         7/XhZCo3vMHwvsM7l+juiJ3DoxDk0ExywnbhAxRLiikxYYKBL4Nfrjpzwp/XyKDKzfq7
         7YPxr2YDPj57Lth4afBGT6/EfuTEe14aYqSZ6GbBzHMXocsqyqRuUMja7wfcu5VPzO0z
         RyhgIyZQ6ZSJHPp/YL7R9caS8lT7EPWJPgl27YdMZeaAM/aQORKlVAhaGF895/grH1Hw
         j4PFAKr75SM+1RS6UmSftHbR1XmkjHpXKNosK53SbbBDdDq0Gf65gZ4yfgJdGd1Ss4XL
         SysQ==
X-Gm-Message-State: AOJu0YzTtST4cSM4FynNLcXgVzCZ2WxsmKE6tFV4m1TV5nbrQWw5vSSd
	ONCyHn+6QEWJtEjg3qP6R763l5h/s3KEBhvOTCttyXGxf+4r5fGbdVYV+z9ntelE+PNEFszH/Z4
	=
X-Gm-Gg: ASbGncvGp67zzwTwxzZ2QSEbenX0ptnzHpEuRet9YLqX0MuuV6hswsM9jknpswF9N3L
	MApNVAUUikJCTfJHWyp8DVmZm1oVspnuorg3YeR6WnBOzpwboTyJ6enBhcgJhsIshmGLgvH6E7Q
	L0BZ9IeNbTC6Jc3nN8pAyYASrSvBLidNxOfmzVYZJtmxiZHr47tfIDoDkUyi/FtDGIv1Sc56hea
	GRCRQMp0i3BFId4GbitdyZ/9UWhK2z3IVBWnBYuQh2bHv0ZM4uBsBTsgjZ+hZzRAagbIhHFL0Vd
	+0TsPzzlkWAlCXH3kUxjbgf7TT1fHARjfD6V/ojPEI9jPRD/st+thOe8GdNZecOTD66kdNVWBtw
	/jJPpDp5AOMnn79g92sBxYqEEBt5KQA==
X-Google-Smtp-Source: AGHT+IHtRnUdylcaCH/ze9wACpido2xthzbuPDhbzO/fdEgTfGEk7u1V76W9n+PVruZcaqIxAfyMQA==
X-Received: by 2002:a05:6000:1546:b0:391:c78:8895 with SMTP id ffacd0b85a97d-3971f511f32mr2745819f8f.50.1741950910880;
        Fri, 14 Mar 2025 04:15:10 -0700 (PDT)
Message-ID: <95537b19-9852-4f7e-8657-8da0d8150e8a@suse.com>
Date: Fri, 14 Mar 2025 12:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andriy Sultanov <sultanovandriy@gmail.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
 <f308cbf6-0d2d-4843-982a-a59ea70c7ad1@amd.com>
 <CAHPYgaXc8X5tBYN6BL2w2PVSNLwaTPP=zWhATBbjYRN-2dmE-g@mail.gmail.com>
 <1e36cec6-c02c-47b9-b957-087e8eb62328@suse.com>
 <23d2b793-42a8-45cc-9314-750b84526aaa@citrix.com>
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
In-Reply-To: <23d2b793-42a8-45cc-9314-750b84526aaa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 10:30, Andrew Cooper wrote:
> On 14/03/2025 8:56 am, Jan Beulich wrote:
>> On 14.03.2025 09:07, Andriy Sultanov wrote:
>>> On Thu, 13 Mar 2025 at 19:59, Jason Andryuk <jason.andryuk@amd.com> wrote:
>>>> On 2025-03-13 14:57, Andrii Sultanov wrote:
>>>>> --- a/xen/drivers/passthrough/amd/iommu.h
>>>>> +++ b/xen/drivers/passthrough/amd/iommu.h
>>>>> @@ -77,8 +77,14 @@ struct amd_iommu {
>>>>>       struct list_head list;
>>>>>       spinlock_t lock; /* protect iommu */
>>>>>
>>>>> -    u16 seg;
>>>>> -    u16 bdf;
>>>>> +    union {
>>>>> +        struct {
>>>>> +            uint16_t bdf;
>>>>> +            uint16_t seg;
>>>> Are these still needed by the end of this patch?
>>> Yes - otherwise the patch would be larger as bdf and seg would be one
>>> namespace deeper - /iommu->seg/iommu->sbdf.seg/
>> This kind of union is fragile. Hence we want to avoid it, even if this means
>> an overall larger diff.
> 
> This is my suggestion, and it's the pattern used in struct pci_dev.

And I'm hoping to eliminate it there, too, at some point. But adding a hidden
dependency on the layout in an entirely different part of the tree just cannot
do us any good.

> pci_sbdf_t is nice for code generation, but it's not great for source
> verbosity.

I agree, yet if anything we'd need a global approach to deal with that
aspect.

Jan

