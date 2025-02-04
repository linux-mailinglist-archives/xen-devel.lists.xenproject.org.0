Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF66A26ED8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 10:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881213.1291339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfFcQ-00030o-5t; Tue, 04 Feb 2025 09:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881213.1291339; Tue, 04 Feb 2025 09:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfFcQ-0002zM-2I; Tue, 04 Feb 2025 09:53:22 +0000
Received: by outflank-mailman (input) for mailman id 881213;
 Tue, 04 Feb 2025 09:53:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfFcO-0002zG-KW
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 09:53:20 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dce2dc21-e2dd-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 10:53:19 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso1041370066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 01:53:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47f1da8sm899457066b.77.2025.02.04.01.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 01:53:18 -0800 (PST)
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
X-Inumbo-ID: dce2dc21-e2dd-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738662799; x=1739267599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bD7Dhbzngf2NdCds9GDjGc0sMFqbJIZSkbvxHEevi4Q=;
        b=dBWyTqRappvo/tVho7RBSKJtXCEh2vWdrhVmKG8d9EfQul3g26+S37cJzch4xVhrgS
         2LkH/fxmsIzjsB4FBzJBuUQ7+oJkK0Bp+Vk5P2KwJS2LKW+6gCnFFmDHMrciZXOZDPrE
         YaOgrIDBNPZA88I41xoiGfR7gyUa7EaOiLOWfvEeocWKzD07J575VM8LDQD8sUmQa8LA
         TeLFFsCegYGtyxqhxhI4S/3LsgPXWeWAahEoshBoWLeL7K79jjMM3IMxyc0QrxizG06/
         2KfqTgLVZvq1fEfB9wyx8ZCMfXfVit2OA1ix60rTr95cemUowCMH5Z4Y1T0tl8TphBfF
         cvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738662799; x=1739267599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bD7Dhbzngf2NdCds9GDjGc0sMFqbJIZSkbvxHEevi4Q=;
        b=QSxJ4mGOu+H/ix/yNZP8NMYYzdBZ1/z4v15oYKMjRtRI7K9UYw1+z72hgLJubJQtTu
         jqjRBQljrPFlCSnZOL3wTu5TfBsugq7+6EHzAXqCbct/zfKIUUrZNhtoAYmyPwsNtphZ
         O0FZPMQVB+lfh308C2kSodcT+C+dfzssKcWAo4lsPbxDvYiHClo240/tKd4hvaK3Yw1j
         a8a1WbgQluk5VMMSl4YF6VSEmaIpUh7ZVWtH49/5ReuEFvkL9mylA6lDTwZSMYldRU2h
         O4EwfVblwJRemjMkipRXj1xNL6quDiEBGtMKx3E1ATc5YDzPc9nT8Q5wyMvp6URbK5m6
         Djkw==
X-Forwarded-Encrypted: i=1; AJvYcCVz7Wyi2LlmS+0NE9Jwch2IgiqDO1KKIUFNegMt3RbNk2O1w7c2PEB0O5quOggg6hjcpT6QDjSHZRU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQLTCr64uo9CwVH56tarYQCEGFkdrYHU6Yvr5jDigucU42OkR3
	IK3dt7hI+an0wrbqzBH/pgfBKY1bRsfeKw0rzvK35hV6JoBoI4WxuN9UqKLgvA==
X-Gm-Gg: ASbGnctyvBTyhKYHGQ1PRVAIx1pialar7A8L2Jo0t37XDEQcFjOlFb9FwgCxDk8oT0X
	e0lcjHf1qBfRAmJQgP8t8Z6f7JQt+F1QzcyqPCxleBiIgMJ+HxBv/jxxhiAY5dcul6d6FN7a1lF
	s7IVNkxBMVqSFFrqzdsXv/rNG8gWM8rB9LIbJPD6kkn644TOSpdlOZ/z5wVxm+4/1TSpKQpBCuI
	F5JaAjfnEkoi63p9IBInVZOegcaw+Ma+dWWd3l2diU1aZYPuGSqQamb9sX+xCsvj3/EKsY9jW8h
	X/Ely1n7psoCngomdobqG1UPiVbLhB5lNArrxVYKcklNa/JMP5RjsyiatTZQTXcJiu/FoPYyqIX
	g
X-Google-Smtp-Source: AGHT+IEir43AeaHPUsqSOIPpRlnv70iK3nLAHXBQcFRF4MmS8pN5al7Pq2WddwB/XBxsQKXOMZdsXA==
X-Received: by 2002:a17:907:3f8f:b0:ab6:61cb:ced2 with SMTP id a640c23a62f3a-ab6cfcc6f27mr2754669066b.9.1738662798885;
        Tue, 04 Feb 2025 01:53:18 -0800 (PST)
Message-ID: <6a65002b-7f15-49f4-9c8c-fe2b51d19c32@suse.com>
Date: Tue, 4 Feb 2025 10:53:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20? 6/6] PCI: drop pci_segments_init()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3abd753b-b1f2-499a-8c02-6b6d64a78a17@suse.com>
 <Z6D6c69hJrxUdnJG@macbook.local>
 <8b0d0446-04d9-4aab-8ede-d12f3442ac1b@suse.com>
 <afaff8bf-41c5-4c80-a24d-3ce748b52a6a@suse.com>
 <Z6HWVDP3lL0-Y38T@macbook.local>
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
In-Reply-To: <Z6HWVDP3lL0-Y38T@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.02.2025 09:56, Roger Pau Monné wrote:
> On Tue, Feb 04, 2025 at 08:51:10AM +0100, Jan Beulich wrote:
>> On 04.02.2025 08:45, Jan Beulich wrote:
>>> On 03.02.2025 18:18, Roger Pau Monné wrote:
>>>> On Mon, Feb 03, 2025 at 05:27:24PM +0100, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
>>>>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
>>>>> @@ -402,6 +402,9 @@ void __init acpi_mmcfg_init(void)
>>>>>  {
>>>>>      bool valid = true;
>>>>>  
>>>>> +    if ( pci_add_segment(0) )
>>>>> +        panic("Could not initialize PCI segment 0\n");
>>>>
>>>> Do you still need the pci_add_segment() call here?
>>>>
>>>> pci_add_device() will already add the segments as required, and
>>>> acpi_parse_mcfg() does also add the segments described in the MCFG.
>>>
>>> Well, in principle you're right. It's more the action in case of
>>> failure that makes me want to keep it: We won't fare very well on
>>> about every system if we can't register segment 0.
> 
> pci_add_segment() should only fail due to being out of memory, and I'm
> quite sure if pci_add_segment() was to fail here due to out of memory
> issues Xen won't be able to complete booting anyway.
> 
> Note the usage of "should only fail", as it's possible for
> radix_tree_insert() to return -EEXIST, but that shouldn't be possible
> given alloc_pseg() checks whether the segment is already added.

Let's continue this on v3, where I'm extending remarks on this change.
An option is to simply leave out this patch altogether. Then a follow-
on option would be to purge the call to pci_segments_init() with an
entirely different justification (e.g. yours).

> An unrelated question: looking at MCFG handling I've noticed that
> calling PHYSDEVOP_pci_mmcfg_reserved doesn't seem to result in the
> segment being added.  Is it on purpose that pci_mmcfg_reserved()
> doesn't attempt to allocate the hardware domain discovered segment?

That hypercall was added solely for the purpose of reporting resource
reservation status. While we could decide to re-purpose it to also
record the segment, that wasn't the goal so far.

Jan

