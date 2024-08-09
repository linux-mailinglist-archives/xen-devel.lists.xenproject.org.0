Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAE394D0BC
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 15:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774734.1185162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scPDs-0007df-Fe; Fri, 09 Aug 2024 13:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774734.1185162; Fri, 09 Aug 2024 13:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scPDs-0007bx-Cf; Fri, 09 Aug 2024 13:00:00 +0000
Received: by outflank-mailman (input) for mailman id 774734;
 Fri, 09 Aug 2024 12:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1scPDq-0007br-Nd
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 12:59:58 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4713ffd4-564f-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 14:59:56 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f1a7faa4d5so5480941fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 05:59:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2c2019bsm1492797a12.31.2024.08.09.05.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 05:59:55 -0700 (PDT)
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
X-Inumbo-ID: 4713ffd4-564f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723208396; x=1723813196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8dXFKAXsET8zCDF26ypU+CnJma96sPkAGZ7tjqlOgXI=;
        b=F9HpAYc2cj5ww/zM1bKvWiBqAwX/sgzFw23O8g52amOFMvY3DXLX8SgfdG7G99BJHl
         zTSefXQKz4X44/N18lBq9DQvEeVVHZgY2pofxycO9jtTtpCyyf1rvbvkRmHI9mBdJgVV
         TKR1xg19nTEU/iu7DaMHdWSffgYqGzcEmfuQl82nHzUCU5LcrLO1s9l3VGeDKgaB5yCu
         hFXqbhR9M4KPNLKT8FO2AR0DHxV4/yQyQgvVJN/JhwOFgsufe3L4bIcF07553wUX1atp
         3qVgV0huqxA2G39sdvY3NG53j/eu4R1aBj6wWNJl09WaqeBYeCFUgFE5U8MTUv0hPP5X
         Qqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723208396; x=1723813196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dXFKAXsET8zCDF26ypU+CnJma96sPkAGZ7tjqlOgXI=;
        b=ZuKm0IWA3hudNLwJjoe+mWj0WtGoNydfgtyDjkYhPfpXWqQS/+MgNdYbXnt8lPWGeV
         KH5Qyo9hBz90En4349hXtlij/TykFbo6gK9PcZYuF1L+To4mB0HFZ4ufmrLDTH3s+P0t
         4FKjukdAio1HlrJqiH+tTORH6E7sSxWcQUzCCBDSxg8ZB87OVMGOTT6lMfZBEDoKqYl8
         mKCLbxL6ZntS/vjv5Md4j8eBzp5CjjmICm/AcCE8rbjY6Zsf60te5kiHEKVzm6QJdz+B
         62FaPzg63OQiEAODl4+K7XpvV3uQm2SFzVkaHcWySB42fgfgW8bgTFhIy06sXEmyGXVy
         IGcA==
X-Forwarded-Encrypted: i=1; AJvYcCX2/bg2OkPySkqm6z2PHNd/v1f8x4J4IFXhHi5eAdyx1rJ2puAvo1todXYZ8plvSngFzvHmjWlg6l0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/gLUy6CAv/YEsYpmn1KzjeNd04lEQLOEEB5rXZ7lKiPBF6suo
	gah8gB6WXwAfwpvfCmT+rhcMHNo0XAKJvHOq3c1wwQngg05RZArC1aFEiRIyIz6u4eCIaQAjvn4
	=
X-Google-Smtp-Source: AGHT+IEA3f9u2beWXtQ5kMr4Pa5g1fOm3HzWMz8B5qk96RPgetzCMSr1+a9xQQVvjxcRzt947qCuMA==
X-Received: by 2002:a2e:4c02:0:b0:2ef:206c:37c4 with SMTP id 38308e7fff4ca-2f1a6ce6eacmr11312441fa.33.1723208395913;
        Fri, 09 Aug 2024 05:59:55 -0700 (PDT)
Message-ID: <7f0a7c9e-0cac-48ae-b7aa-5c90a1a5f4ca@suse.com>
Date: Fri, 9 Aug 2024 14:59:55 +0200
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
In-Reply-To: <CACHz=ZgwPunPO771EbX1hKEdmXC1ysBQ7RzYK8K1pakyBS927A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.08.2024 14:48, Frediano Ziglio wrote:
> On Thu, Aug 8, 2024 at 9:25 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
>>> No reason to wait, if Xen image is loaded by EFI (not multiboot
>>> EFI path) these are set in efi_arch_load_addr_check, but
>>> not in the multiboot EFI code path.
>>> This change makes the 2 code paths more similar and allows
>>> the usage of these variables if needed.
>>
>> I'm afraid I'm struggling with any "similarity" argument here. Imo it
>> would be better what, if anything, needs (is going to need) either or
>> both of these set earlier. Which isn't to say it's wrong to do early
>> what can be done early, just that ...
>>
> 
> About similarity is that some part of EFI code expect xen_phys_start
> to be initialized so this change make sure that if in the future these
> paths are called even for this case they won't break.
> 
>>> --- a/xen/arch/x86/boot/head.S
>>> +++ b/xen/arch/x86/boot/head.S
>>> @@ -259,6 +259,11 @@ __efi64_mb2_start:
>>>          jmp     x86_32_switch
>>>
>>>  .Lefi_multiboot2_proto:
>>> +        /* Save Xen image load base address for later use. */
>>> +        lea     __image_base__(%rip),%rsi
>>> +        movq    %rsi, xen_phys_start(%rip)
>>> +        movl    %esi, trampoline_xen_phys_start(%rip)
>>
>> ... this path is EFI only if I'm not mistaken, while ...
>>
>>> @@ -605,10 +610,6 @@ trampoline_setup:
>>>           * Called on legacy BIOS and EFI platforms.
>>>           */
>>>
>>> -        /* Save Xen image load base address for later use. */
>>> -        mov     %esi, sym_esi(xen_phys_start)
>>> -        mov     %esi, sym_esi(trampoline_xen_phys_start)
>>
>> ... the comment in context is pretty clear about this code also being
>> used in the non-EFI case. It is, however, the case that %esi is 0 in
>> that case. Yet surely you want to mention this in the description, to
>> clarify the correctness of the change.
> 
> Restored this code.

Was my analysis wrong then and it's actually needed for some specific
case?

Jan

