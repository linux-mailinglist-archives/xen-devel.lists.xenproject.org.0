Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BFA94D1C4
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 16:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774791.1185212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scQCl-0004HP-Ss; Fri, 09 Aug 2024 14:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774791.1185212; Fri, 09 Aug 2024 14:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scQCl-0004F6-PM; Fri, 09 Aug 2024 14:02:55 +0000
Received: by outflank-mailman (input) for mailman id 774791;
 Fri, 09 Aug 2024 14:02:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1scQCk-0004F0-Dl
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 14:02:54 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11571158-5658-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 16:02:52 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5b9d48d1456so74418a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 07:02:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2c41916sm1542990a12.41.2024.08.09.07.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 07:02:51 -0700 (PDT)
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
X-Inumbo-ID: 11571158-5658-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723212171; x=1723816971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fcJU+sXFN7aYtAKGFMDSzUQBc8xF9yN7jfOo0YrxvTI=;
        b=a4pmNauLVOKVNZHASN7mRRrKHSJuW6i7nrk/iDKTEYEOJ70AhXavUwEhbuQJYvgIKc
         4HYI0ekDri1VQeYAq8O2SuAWLO2N0hHzpzfQmX0p2vHdnEin68WpLF22dleSPhwGKJMM
         uDQaDKVGS+g7FNgXB7NOYTZAJSDv/BkBcmbLQUUJxuWZT993pdD4zSrqLNoAduoYi8to
         lKXzjCCQpso+nfijvow5+QriiY3xX4i+kFsVdwv5KRz6wWZ2xbxY6yAlmvbgZcbSnk4/
         xtqZr12KdlAQ+z/6SKFNJCTdZNU/0huKiu8B7KpoD33Hha8GiP5KyT1mAJrhAdSMxHJ9
         eBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723212171; x=1723816971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcJU+sXFN7aYtAKGFMDSzUQBc8xF9yN7jfOo0YrxvTI=;
        b=sH7Da62pYJmxvn95CcLmgII+QgPRUNJhZolfnfa2Ssp9wxF2CT9Is/48JcxvKUexbL
         OXxkwkjg5c+gbGwxv7TgFlge9dWXUWgX2CW+WJBgr1ltkXkYbld9Ywcc3RmIZFduSOfO
         zc4FGFqIJnDbIC/HoD1RqYrhPF2MwwYx81CWfqG4gNleX+jyY8mbRm25e+483wQ7rlYs
         /WPxU54lrMGjLmfvhgwhYA465gs3JjgLWLRm3I7bhKfYfu/uaVw7oR7znGx7DXfGUb1H
         45WHpf+62RGBMiUXk9VMcx3t4By1skV9nbBzWcm/dhIN2cpRFGotc3HSSkJDUmLed2oY
         lhdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU21QwcWdtay2VtcutrrrIt3WIxNxorXIJ2SB7/BDG5Cr7x+emTL4fHwsAdzKWzll74ByawXRO0vLXxJUbALEpXETUZmoxc27WshvZBH0=
X-Gm-Message-State: AOJu0Yz0Lzpg8wCpJr/3rrTglEQdRju+UXxhPtKJ2LlJtmu+BQj1tVNO
	WVVG2Eyo7CkzSQhVq049H5zO7Y2VV0//yqAbWkv1VkWKS3ajap3aqDPPSFu0908v3k+uTFLByeo
	=
X-Google-Smtp-Source: AGHT+IHgwiB3Yj2AjtytIJg7gocScbnaVXcZXhkgygMlWPTRFVjJg9KS68HGw6mFViU+1EiGGLEJpg==
X-Received: by 2002:a05:6402:4405:b0:5af:384e:bc0f with SMTP id 4fb4d7f45d1cf-5bd0abda8dfmr1736559a12.16.1723212171350;
        Fri, 09 Aug 2024 07:02:51 -0700 (PDT)
Message-ID: <14fc293a-4a0d-4de2-b468-bd0ef8c912b1@suse.com>
Date: Fri, 9 Aug 2024 16:02:50 +0200
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
In-Reply-To: <CACHz=ZgCodGsFdyKe+F4gY3nAnymHLQ0T23CWSqauEhbm=Ubeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.08.2024 15:50, Frediano Ziglio wrote:
> On Fri, Aug 9, 2024 at 1:59 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 09.08.2024 14:48, Frediano Ziglio wrote:
>>> On Thu, Aug 8, 2024 at 9:25 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
>>>>> No reason to wait, if Xen image is loaded by EFI (not multiboot
>>>>> EFI path) these are set in efi_arch_load_addr_check, but
>>>>> not in the multiboot EFI code path.
>>>>> This change makes the 2 code paths more similar and allows
>>>>> the usage of these variables if needed.
>>>>
>>>> I'm afraid I'm struggling with any "similarity" argument here. Imo it
>>>> would be better what, if anything, needs (is going to need) either or
>>>> both of these set earlier. Which isn't to say it's wrong to do early
>>>> what can be done early, just that ...
>>>>
>>>
>>> About similarity is that some part of EFI code expect xen_phys_start
>>> to be initialized so this change make sure that if in the future these
>>> paths are called even for this case they won't break.
>>>
>>>>> --- a/xen/arch/x86/boot/head.S
>>>>> +++ b/xen/arch/x86/boot/head.S
>>>>> @@ -259,6 +259,11 @@ __efi64_mb2_start:
>>>>>          jmp     x86_32_switch
>>>>>
>>>>>  .Lefi_multiboot2_proto:
>>>>> +        /* Save Xen image load base address for later use. */
>>>>> +        lea     __image_base__(%rip),%rsi
>>>>> +        movq    %rsi, xen_phys_start(%rip)
>>>>> +        movl    %esi, trampoline_xen_phys_start(%rip)
>>>>
>>>> ... this path is EFI only if I'm not mistaken, while ...
>>>>
>>>>> @@ -605,10 +610,6 @@ trampoline_setup:
>>>>>           * Called on legacy BIOS and EFI platforms.
>>>>>           */
>>>>>
>>>>> -        /* Save Xen image load base address for later use. */
>>>>> -        mov     %esi, sym_esi(xen_phys_start)
>>>>> -        mov     %esi, sym_esi(trampoline_xen_phys_start)
>>>>
>>>> ... the comment in context is pretty clear about this code also being
>>>> used in the non-EFI case. It is, however, the case that %esi is 0 in
>>>> that case. Yet surely you want to mention this in the description, to
>>>> clarify the correctness of the change.
>>>
>>> Restored this code.
>>
>> Was my analysis wrong then and it's actually needed for some specific
>> case?
> 
> Not clear to what exactly you are referring.
> That later part of code (which was removed) is still needed in case of no-EFI.

Is it? Under what conditions would %esi be non-zero? As indicated by my earlier
reply, I think it would never be. In which case the two stores are pointless.

Jan

