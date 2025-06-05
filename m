Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D481ACF3B4
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 18:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007159.1386466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND5e-0006Mw-NJ; Thu, 05 Jun 2025 16:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007159.1386466; Thu, 05 Jun 2025 16:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND5e-0006KJ-K8; Thu, 05 Jun 2025 16:05:14 +0000
Received: by outflank-mailman (input) for mailman id 1007159;
 Thu, 05 Jun 2025 16:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uND5d-0006KD-Aj
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 16:05:13 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc5a195b-4226-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 18:05:12 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso1182184f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 09:05:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb02a66sm10454509a12.1.2025.06.05.09.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 09:05:11 -0700 (PDT)
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
X-Inumbo-ID: dc5a195b-4226-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749139512; x=1749744312; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wqj6OlcbgO0YyjN1kGvVd4r8f1UZYdWIdKiSngFptn8=;
        b=OLK+sEF9qYUx7+aJb7tD3qHrfo0BiKgoOIN549P9ggA6NF7u1LD5tY0ErXI3QJk+TN
         lPemJulFJyQAZj3lsDhQaDSlXs1m3162ElRmU9DiAVy0/p3NwMvAIilo8luGVYdOjQG/
         WVPmzv6XpOzYV/GVd8oEDJn3n4JH11gh/pg2B4s6cHW6yh49lkODNNGf7ezVD+GpgWcu
         vxujAp2f4l9VjEgsC3iNxD3pCVZJk21voemXXIKj+0oDujEBLnMReEd7Qy9ehxAYq69g
         1VA7u95i7F5aOCYGnSjkpBoO2TthUOpUGE0pcwJdor7Im+KRzT86nz2fegKoGoY7Pmkl
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139512; x=1749744312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wqj6OlcbgO0YyjN1kGvVd4r8f1UZYdWIdKiSngFptn8=;
        b=bR4VGXNSyiGnarqBlo5ANZXC3kEnfna07Ob4uJ/eBJYTA5+Eil5FxMXYSoRmgRjnmJ
         09mKnJCHDlO4ZLpadw/CLDOBrDXz1mx3cHq4YA4nOqYyRWn015Omv3uiwgyQaf5BnNhd
         JOmI22hbikBJ5CvKUfwwx34qpabVH5/p0pIfHye4T/uKPEBsiL6O2R2+gZPvZBH6fz0H
         VbhRBkkYo2eWVtafZky+Z020v6YIrdz/Y/T75O2T+zTM/1rudmzU1oiAiWIoxFDY4eim
         N0zdilfgvFNFq2mGaL5hKCANFXqdEzkjsFKRmEyEZ8FdpgbKjAH5RTNUVcybxwrR0PpB
         TWtg==
X-Gm-Message-State: AOJu0YxWFmWClAivYkqg6lIJDc5ozXslELxLghQlDgCBpIxgGvorKvJE
	sBJnaeXqC6302+ZL6FB+9sD7A6HfjehFDvvNApB30Zp+dXNYPCqBjuayxGGB06ViSg==
X-Gm-Gg: ASbGncsrAAqk3hyxptkbyFEarh11E7PWZ6lenrje4US01vVB06GNN4pWkWpiuvINCMc
	I8NEXn3E0bUsZ9XmoJYvTYukux/D3dErG7mg1Gbe5Wa4oEhGlb3rvKKQMsS5Nr/tgcGyrewC3qt
	2ZGii2NGLW/61IYH+hnk8HS6P1MQMLLQqBmf4au0i8XYXMTsRK3bAetLkohxKwASSqPqJ1x7lz0
	2a9r8rS/jUDygJAFE1/GlmpDs/5dfe144xyvvEgBy/4FtGIwGzs0nobrJf66u6wfFzM+PFb9Efr
	OZoU6O0XMhSnpmtiP/XRYjESB3BWm9Sp4hrPnTAxug5lInpr6H16GgXMKQ4oRgD3Cqmdl47WSOg
	286ksVsv1SkiOUvd2yOgqL2GFwl9+eK2qBrSr
X-Google-Smtp-Source: AGHT+IEfUSw1ZXD/eeCPtT5vaOlN9gz7Pxc44RukLfMdNf+RqU519TEGg95nNrVNs9uYY2Vbz66+jg==
X-Received: by 2002:a05:6000:25c4:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3a51d95dfb2mr6725737f8f.34.1749139511599;
        Thu, 05 Jun 2025 09:05:11 -0700 (PDT)
Message-ID: <ea285192-c39c-43b4-a879-7ca4ff7f9b4a@suse.com>
Date: Thu, 5 Jun 2025 18:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] console: add relocation hook
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
 <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com> <aDSLNeFRZWoxMTEt@mail-itl>
 <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com> <aEGu6-6dGqc_WUlg@mail-itl>
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
In-Reply-To: <aEGu6-6dGqc_WUlg@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 16:51, Marek Marczykowski-Górecki wrote:
> On Thu, Jun 05, 2025 at 04:42:53PM +0200, Jan Beulich wrote:
>> On 26.05.2025 17:39, Marek Marczykowski-Górecki wrote:
>>> On Mon, May 26, 2025 at 04:08:17PM +0100, Andrew Cooper wrote:
>>>> On 25/05/2025 3:15 pm, Marek Marczykowski-Górecki wrote:
>>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>>> index 25189541244d..3ef819a252e4 100644
>>>>> --- a/xen/arch/x86/setup.c
>>>>> +++ b/xen/arch/x86/setup.c
>>>>> @@ -1481,6 +1481,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>>>>          highmem_start &= ~((1UL << L3_PAGETABLE_SHIFT) - 1);
>>>>>  #endif
>>>>>  
>>>>> +    console_init_pre_relocate();
>>>>> +
>>>>>      /*
>>>>>       * Iterate backwards over all superpage-aligned RAM regions.
>>>>>       *
>>>>> @@ -1606,6 +1608,12 @@ void asmlinkage __init noreturn __start_xen(void)
>>>>>      if ( !xen_phys_start )
>>>>>          panic("Not enough memory to relocate Xen\n");
>>>>>  
>>>>> +    /*
>>>>> +     * Notify console drivers about relocation, before reusing old Xen's
>>>>> +     * memory.
>>>>> +     */
>>>>> +    console_init_post_relocate();
>>>>> +
>>>>
>>>> With reference to the next patch, there are printk()'s in this region
>>>> which want to work (in case something goes very wrong), so I don't think
>>>> setting dbc->suspended is the best approach.
>>>
>>> I guess the post_relocate hook might be moved a bit earlier, but still,
>>> once relocation happens, the xhci console is not functional until it
>>> gets relocated too (for example - it would post new TRBs into a ring
>>> that isn't actually monitored by the controller).
>>
>> Why is it that this ring is dependent upon Xen's position? If the ring was
>> dynamically allocated, it wouldn't change position when Xen is moved.
> 
> The console is setup quite early, I don't think I can allocate memory at
> this stage, no?

But you allocate before Xen is moved, I suppose.

Jan

