Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A994E8C8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 10:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775403.1185621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdQcb-0003pb-Hm; Mon, 12 Aug 2024 08:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775403.1185621; Mon, 12 Aug 2024 08:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdQcb-0003mR-EW; Mon, 12 Aug 2024 08:41:45 +0000
Received: by outflank-mailman (input) for mailman id 775403;
 Mon, 12 Aug 2024 08:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyEi=PL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdQca-0003mL-3O
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 08:41:44 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b29ca1b1-5886-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 10:41:41 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa7bso4848567a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 01:41:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a5e07a9sm1928931a12.78.2024.08.12.01.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 01:41:40 -0700 (PDT)
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
X-Inumbo-ID: b29ca1b1-5886-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723452101; x=1724056901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a+esWHnlsL2/Kpon8xB8xB25MWuvuVAXsSeSfgNiSnc=;
        b=PmO7NySitjU19UwvAwXMz7T1n86vf5oNiuZty3UgZm1Czpl5QMEynhNOMICyO3cYn0
         5UD2wRyYNCJZ1S+CuSSN90USFmd2JoEnWIXvOTATy9q3HxdQRTkSqfQEF7FWzUg/qPTG
         cObgHfi5WJ6pBzy7uiVMDfsDdxmzmoTSf69BYoeDcytohsSc3PeyrlGg1yKVOr0qITNV
         plU96KVGoTav64AD9E3dHyH0ah8GbnsC3jBOz4GLnhZ+XLduvmmtj2rjNc9bmmsJ62GW
         KF8xa2Qc9S+Oh0JCgiF6wdUOJor4GqnqRqtWWeTlNAUAaG1LmAAoFUCPnYdwTZQ2aJdo
         A76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723452101; x=1724056901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+esWHnlsL2/Kpon8xB8xB25MWuvuVAXsSeSfgNiSnc=;
        b=dTjHyorMdS/swfhhjYbQsMemQ38CwVs+a63iBe+HaaWCpgCk+aXn5QV2VaFGpBrCId
         v7wsuDU/mQwXsjvBVcvydkRfZbTL5dqImjY38o30ftJqKaTvKfu7WvvbwK+rzjeXJhgF
         bkv6YHrEmc75XWtQuCEC1LyP8Zi8nq7MxesE2QHzhnfZLl5maA3cVo7AivD0P61BbfGJ
         6QWv6WxmiQt7EqPl8pTWX0EpXe3DWGS95yDKsAIl0lldLeEAnFXOJlNYSmpikCqOWQcG
         4mt59wuo8wfmG2pny1UD9hutFovcdr00A1kOmx/Ywo6hZL/aDFPkLKWIayWlygj9W9ux
         /UyA==
X-Forwarded-Encrypted: i=1; AJvYcCVfp04Ym1dWDMN3ufIF6Ykg2gsCrW8LhJKkZAIWeQ2hkA+BFh0VQUKo2GVVhxyGindTlf5NDqQ3g1rj1UvtaRJ8J9joyXyrWU5xDU66W8o=
X-Gm-Message-State: AOJu0Yxxs4G8rQ76RVnbgHSwy2XyZBt2PGHZ/tSuQMhKl8mOOeQZw5n8
	9mBhQ2v/YJhtZ+e+WcS/POhip+8/dpIgOM2vgADqk3p9V6qR9VGcWg/427RiLw==
X-Google-Smtp-Source: AGHT+IFd95W3AOwXfKOAH1IJSmyGhXX/clfeHvrgd1k3ZHMECBlOdbx9VHVMb8b0LXE+GjXagwVbfQ==
X-Received: by 2002:a05:6402:4403:b0:5a2:d411:89fa with SMTP id 4fb4d7f45d1cf-5bd0a693025mr4884017a12.36.1723452101196;
        Mon, 12 Aug 2024 01:41:41 -0700 (PDT)
Message-ID: <bdc1083b-f6bd-4e4e-b56d-9e1fc09393e9@suse.com>
Date: Mon, 12 Aug 2024 10:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86: Set xen_phys_start and trampoline_xen_phys_start
 earlier
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-4-alejandro.vallejo@cloud.com>
 <cf819b39-6ce8-4446-b7b6-a1b247f45400@suse.com>
 <CACHz=ZgwPunPO771EbX1hKEdmXC1ysBQ7RzYK8K1pakyBS927A@mail.gmail.com>
 <7f0a7c9e-0cac-48ae-b7aa-5c90a1a5f4ca@suse.com>
 <CACHz=ZgCodGsFdyKe+F4gY3nAnymHLQ0T23CWSqauEhbm=Ubeg@mail.gmail.com>
 <14fc293a-4a0d-4de2-b468-bd0ef8c912b1@suse.com>
 <CACHz=Zj+LKKvPxTd8SGYthBTPiC6bEPrZg0nt=ehpOJ4JwqoiQ@mail.gmail.com>
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
In-Reply-To: <CACHz=Zj+LKKvPxTd8SGYthBTPiC6bEPrZg0nt=ehpOJ4JwqoiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.08.2024 16:34, Frediano Ziglio wrote:
> On Fri, Aug 9, 2024 at 3:02 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 09.08.2024 15:50, Frediano Ziglio wrote:
>>> On Fri, Aug 9, 2024 at 1:59 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 09.08.2024 14:48, Frediano Ziglio wrote:
>>>>> On Thu, Aug 8, 2024 at 9:25 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
>>>>>>> No reason to wait, if Xen image is loaded by EFI (not multiboot
>>>>>>> EFI path) these are set in efi_arch_load_addr_check, but
>>>>>>> not in the multiboot EFI code path.
>>>>>>> This change makes the 2 code paths more similar and allows
>>>>>>> the usage of these variables if needed.
>>>>>>
>>>>>> I'm afraid I'm struggling with any "similarity" argument here. Imo it
>>>>>> would be better what, if anything, needs (is going to need) either or
>>>>>> both of these set earlier. Which isn't to say it's wrong to do early
>>>>>> what can be done early, just that ...
>>>>>>
>>>>>
>>>>> About similarity is that some part of EFI code expect xen_phys_start
>>>>> to be initialized so this change make sure that if in the future these
>>>>> paths are called even for this case they won't break.
>>>>>
>>>>>>> --- a/xen/arch/x86/boot/head.S
>>>>>>> +++ b/xen/arch/x86/boot/head.S
>>>>>>> @@ -259,6 +259,11 @@ __efi64_mb2_start:
>>>>>>>          jmp     x86_32_switch
>>>>>>>
>>>>>>>  .Lefi_multiboot2_proto:
>>>>>>> +        /* Save Xen image load base address for later use. */
>>>>>>> +        lea     __image_base__(%rip),%rsi
>>>>>>> +        movq    %rsi, xen_phys_start(%rip)
>>>>>>> +        movl    %esi, trampoline_xen_phys_start(%rip)
>>>>>>
>>>>>> ... this path is EFI only if I'm not mistaken, while ...
>>>>>>
>>>>>>> @@ -605,10 +610,6 @@ trampoline_setup:
>>>>>>>           * Called on legacy BIOS and EFI platforms.
>>>>>>>           */
>>>>>>>
>>>>>>> -        /* Save Xen image load base address for later use. */
>>>>>>> -        mov     %esi, sym_esi(xen_phys_start)
>>>>>>> -        mov     %esi, sym_esi(trampoline_xen_phys_start)
>>>>>>
>>>>>> ... the comment in context is pretty clear about this code also being
>>>>>> used in the non-EFI case. It is, however, the case that %esi is 0 in
>>>>>> that case. Yet surely you want to mention this in the description, to
>>>>>> clarify the correctness of the change.
>>>>>
>>>>> Restored this code.
>>>>
>>>> Was my analysis wrong then and it's actually needed for some specific
>>>> case?
>>>
>>> Not clear to what exactly you are referring.
>>> That later part of code (which was removed) is still needed in case of no-EFI.
>>
>> Is it? Under what conditions would %esi be non-zero? As indicated by my earlier
>> reply, I think it would never be. In which case the two stores are pointless.
> 
> I really don't follow, %esi at that point should be the address where
> the executable is loader, which should not be zero.

In the PVH entry point it'll be, but else? Note this code in setup.c:

        /* Is the region suitable for relocating Xen? */
        if ( !xen_phys_start && e <= limit )

That relocating of Xen wouldn't happen if we stored a non-zero value in
the default (xen.gz with grub1/2) case. Also take a look at Xen before
the EFI/MB2 path was added. xen_phys_start wasn't even written from
head.S at that time. And if it's for the PVH entry point alone, that
code then would want moving into the CONFIG_PVH_GUEST section (if at all
possible). Or, if the reason for the change really is "just in case",
another option of course is to leave these two insn in the one central
place they are at right now.

Jan

