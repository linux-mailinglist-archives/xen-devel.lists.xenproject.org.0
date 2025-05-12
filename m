Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D1EAB334B
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981041.1367430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPOd-0004l7-79; Mon, 12 May 2025 09:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981041.1367430; Mon, 12 May 2025 09:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPOd-0004jf-3y; Mon, 12 May 2025 09:24:27 +0000
Received: by outflank-mailman (input) for mailman id 981041;
 Mon, 12 May 2025 09:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEPOb-0004jZ-1B
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:24:25 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3e2aa90-2f12-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 11:24:22 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5fbda5a8561so5872820a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:24:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fd29f9fdc2sm2036895a12.4.2025.05.12.02.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 02:24:22 -0700 (PDT)
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
X-Inumbo-ID: e3e2aa90-2f12-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747041862; x=1747646662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aZX8ZeUBO8WpYhmUCA3bGFQmzit9vYkyxZVFva7jk7E=;
        b=R2iVphm3HpDsbSRmLaqNcIAapSzwa6gSgN0H5l6QnvpbH7yl5WEeCx4ARJeJpVp2/T
         I7yGdeMA79ty8TvK/muvrh/wlj4ZGiZDspZ+Q7xSuweTct581HOdLWkjhpZMuN8z8Ter
         aOpq/L8S4y2lnaVtwQXUsoRtSsciYn69jLOhfu0XWciyyRH6LP0Vm2k7r9WjF/m8HllV
         6VK0F4ReQBVoKQALYHxFSVahEVsOLj7lS5SZyJjwCtuaUkN3gejXcf3Sdae8ovBonPSd
         MWbW648okTU3IUJZAinr/DGBjSiGn3roDCFAHCoCUGUesyPpI0z0JGLtrEMp4KZ20X/4
         WoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747041862; x=1747646662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZX8ZeUBO8WpYhmUCA3bGFQmzit9vYkyxZVFva7jk7E=;
        b=iLK7HO7I3m42y44wOiIgWNG/67U4AsNvWUTpbAMLYKa4iGDKbj5etw4tyeE1TgQk0Q
         vBTPznes/wjDoXoXYlF6jbqp8F0jQlyP73cBHAZAkqRUAbi4NeKDJqtdW+9LNNZ2m7Oe
         A4gi1AYbLFIThXx7gY4PZuDDefNbsoULrF8C5q0VI2vsse4FboY1nsUIIXjdZPo2hHGe
         IDRwDfaxKOOqiSUQNoZSEM5LVcECRBL4/jq7QUl4oussSUd75H9fahcVsHobujqM1a3l
         84NQ3FuNeGd7Qv1qgwM+Go+/Hon0nTkGytCUrDOhseQ0S0C/jmH663LD26RZLFaSyK/7
         PLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw0u5wIRLYYbgTwrhUmr2epQLx5oSOt0b/nIfC1IwxHTk16uXrZzh0w12iKJtO1Ti5DLUuY88rl2Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvuFD971AAXLyZyD6ugbUBp+fSqPePB/WP2zYWKPI/FPiR+N68
	4K/wS8IZ8MoItSL2SuZ7lHUHULxUbQ9kgtHdnuGcYpFW1Nw6qc/BRIDQ6RYXoA==
X-Gm-Gg: ASbGncvRjB0QewdQ+aT2ffsuJEjtD0PHPuaS6tZfyh8nbFt1+EhCF4UonRxDXHO2PeT
	/G3eFzS/r7QeRhfbHauF3WXxm3CKrYIyFlMmWCcjngZ+tQv0MvpnoPOzCwDKR3Kib+o/OXW5Ye2
	ebQHb0ywlF+4W8Ccvj6SUy7egS/u6AhRpaKq2DDziR6g+BQSO2WtATgx7kSD640JPJLlklHKgv4
	3O7Kl8pW3GcHLnl5Tt5zbMpAmA3M0dfdwTBx2moeUcz4a6QapcimakKniWniwKBY0r2OW2LFHjB
	G3WeZG15rf5V7iAvkAjuK9SfJkK20ezDpZNADjKMmO9mIEVQvzPV5J/FpqfAqXUH0XGyXWMs4QJ
	UQRhRHRW9KbsNZbT303b3NUqkYGN5nWxqgflZ
X-Google-Smtp-Source: AGHT+IHNKOlGGgyfeTfCDondG8n3Gvjn233PoX8B/5uZls2gRBLiWbrvMECybZ0C/VOAQmUTb6PLag==
X-Received: by 2002:a05:6402:c4d:b0:5fd:10fe:9f97 with SMTP id 4fb4d7f45d1cf-5fd10fea20fmr6508523a12.28.1747041862307;
        Mon, 12 May 2025 02:24:22 -0700 (PDT)
Message-ID: <af26ad10-275c-46dd-81b6-4439e3fa636c@suse.com>
Date: Mon, 12 May 2025 11:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 agarciav@amd.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <aBiVkw2SXJHxpieh@mail-itl> <aBjLoM_ttxqftzlp@macbook.lan>
 <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop>
 <aBnOQyXSz-j33Wux@macbook.lan>
 <alpine.DEB.2.22.394.2505061658330.3879245@ubuntu-linux-20-04-desktop>
 <aBx1gv6BXhZ0pSYt@macbook.lan>
 <alpine.DEB.2.22.394.2505081617080.3879245@ubuntu-linux-20-04-desktop>
 <aB29o70zT_jUjdQv@macbook.lan>
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
In-Reply-To: <aB29o70zT_jUjdQv@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.05.2025 10:32, Roger Pau Monné wrote:
> On Thu, May 08, 2025 at 04:25:28PM -0700, Stefano Stabellini wrote:
>> On Thu, 8 May 2025, Roger Pau Monné wrote:
>>> On Wed, May 07, 2025 at 04:02:11PM -0700, Stefano Stabellini wrote:
>>>> On Tue, 6 May 2025, Roger Pau Monné wrote:
>>>>> On Mon, May 05, 2025 at 11:11:10AM -0700, Stefano Stabellini wrote:
>>>>>> In my opinion, we definitely need a solution like this patch for Dom0
>>>>>> PVH to function correctly in all scenarios.
>>>>>
>>>>> I'm not opposed to having such interface available for PVH hardware
>>>>> domains.  I find it ugly, but I don't see much other way to deal with
>>>>> those kind of "devices".  Xen mediating accesses for each one of them
>>>>> is unlikely to be doable.
>>>>>
>>>>> How do you hook this exchange interface into Linux to differentiate
>>>>> which drivers need to use mfns when interacting with the hardware?
>>>>
>>>> In the specific case we have at hands the driver is in Linux userspace
>>>> and is specially-written for our use case. It is not generic, so we
>>>> don't have this problem. But your question is valid.
>>>
>>> Oh, so you then have some kind of ioctl interface that does the memory
>>> exchange and bouncing inside of the kernel on behalf of the user-space
>>> side I would think?
>>
>> I am not sure... Xenia might know more than me here.
> 
> One further question I have regarding this approach: have you
> considered just populating an empty p2m space with contiguous physical
> memory instead of exchanging an existing area?  That would increase
> dom0 memory usage, but would prevent super page shattering in the p2m.
> You could use a dom0_mem=X,max:X+Y command line option, where Y
> would be your extra room for swiotlb-xen bouncing usage.
> 
> XENMEM_increase_reservation documentation notes such hypercall already
> returns the base MFN of the allocated page (see comment in
> xen_memory_reservation struct declaration).

Except that this looks to be stale. At the bottom of increase_reservation()
we have:

        if ( !paging_mode_translate(d) &&
             !guest_handle_is_null(a->extent_list) )
        {
            mfn_t mfn = page_to_mfn(page);

            if ( unlikely(__copy_mfn_to_guest_offset(a->extent_list, i, mfn)) )
                goto out;
        }

Consistent with us not exposing MFNs elsewhere as well, except for PV.

Jan

