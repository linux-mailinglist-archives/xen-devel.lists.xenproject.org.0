Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24E986CB1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:42:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804930.1215909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiCY-0002tB-QI; Thu, 26 Sep 2024 06:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804930.1215909; Thu, 26 Sep 2024 06:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiCY-0002qe-Mm; Thu, 26 Sep 2024 06:42:10 +0000
Received: by outflank-mailman (input) for mailman id 804930;
 Thu, 26 Sep 2024 06:42:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stiCX-0002qW-Rk
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:42:09 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c1b11b-7bd2-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 08:42:07 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so88919366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 23:42:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f51e73sm307676766b.72.2024.09.25.23.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 23:42:06 -0700 (PDT)
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
X-Inumbo-ID: 72c1b11b-7bd2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727332926; x=1727937726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HjnpiT0q+VoSKkoAPhc/0tJfAYPPXzdpToP7lI/BkKA=;
        b=Br0ob+VPTUKL1LR4gSF+WvTGU4FZ8C7cpWDNmpxIAlJqlsi9B5H/VWlk/5ZRptSZCF
         F++t3rcoDM39vKsdtn6RDHO3tgJR0Fpg58kG8H8DxXfUepeMogkEXMMJ1R0yGZ6L39BX
         hbtvfZ+OdiNyT9iB+HWtBCKPF0kFH2GwMDUS15OPjHXD9EDws+AI5pmYaxqIyUuTV6T+
         ZtLJX9Vk7sroffiMAhlSErscZ+MxWtDzs+/L/wX4TJBiPIPkj0vZMHPwMzl04NbAs6A8
         50+ogmAa007Fov8ORtKwniSosYbx2aV1Vi0kzYfbFOq4g0RaGDP8EIoaLMwW/cUbO2LK
         UgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727332926; x=1727937726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjnpiT0q+VoSKkoAPhc/0tJfAYPPXzdpToP7lI/BkKA=;
        b=J/wZZpAPRT8gUQqdjRSOsytcu9fnbK01IhileA5WH4kwrPsYmvGBWVDHXhXTp5Bsge
         97j/3nquucultDnkJi4LBNZLQ6+GNmr1lSjtzLIsbdjn5ViCR1U3veERZcLeFPijDlTp
         1D0IjQd+LOlDxDn4a33Y8OENCt1WF+vyYhfxygqUIdN/xd6HlySzhDbZgt+MAm61+W4q
         Uh0eApmvVuQU+i1iUzWD9yC6Dk1ymNX4X06OOwvBZvUgfaLEzzfGN2q0VN1dI3S1P3yD
         dEkEEFnNB4jSbASjiPIUWTZSv4R//WplG3nRTGLtaDdMiGEU8ZibF9flVAhVzdCihTx0
         CocA==
X-Gm-Message-State: AOJu0Yxw3wH+dwHLnfP7uFksPADXBxUceATLldnZYMyX2dkC5dS4NM6z
	lOSjOfEJ3HtXiowvhnztvys5zy1RCQt5UKqjg621oUL99ohmRB/Sp02R1CAbIw==
X-Google-Smtp-Source: AGHT+IEazeijGcaxokxDuJueeECKXeMjE9dvDwRj4GjYCQAEt/iAfUbagVZ92mVKYg4t2Ec6unrjOQ==
X-Received: by 2002:a17:907:7f8d:b0:a8d:11c2:2b4 with SMTP id a640c23a62f3a-a93a06768aamr492299566b.56.1727332926541;
        Wed, 25 Sep 2024 23:42:06 -0700 (PDT)
Message-ID: <fac2cc9d-8841-4fae-b148-2b6933bc2094@suse.com>
Date: Thu, 26 Sep 2024 08:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for
 return address
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-44-ardb+git@google.com>
 <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
 <CAMj1kXH1xqYwhG16XxoBpoedTkBvt72xBjO259174jHirdf47A@mail.gmail.com>
 <bffb4569-af56-4ea0-92e3-a9259c48a58f@citrix.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <bffb4569-af56-4ea0-92e3-a9259c48a58f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 18:51, Andrew Cooper wrote:
> On 25/09/2024 5:45 pm, Ard Biesheuvel wrote:
>> On Wed, 25 Sept 2024 at 18:39, Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>>> And we do have special calling conventions that aren't the regular
>>> ones, so %rdi might actually be used elsewhere. For example,
>>> __get_user_X and __put_user_X all have magical calling conventions:
>>> they don't actually use %rdi, but part of the calling convention is
>>> that the unused registers aren't modified.
>>>
>>> Of course, I'm not actually sure you can probe those and trigger this
>>> issue, but it all makes me think it's broken.
>>>
>>> And it's entirely possible that I'm wrong for some reason, but this
>>> just _looks_ very very wrong to me.
>>>
>>> I think you can do this with a "pushq mem" instead, and put the
>>> relocation into the memory location.
>>>
>> I'll change this into
>>
>>   pushq arch_rethook_trampoline@GOTPCREL(%rip)
>>
>> which I had originally. I was trying to avoid the load from memory,
>> but that obviously only works if the register is not live.
> 
> But does that work?  Won't that will push the 8 bytes from the start of
> arch_rethook_trampoline, when what's wanted is simply the address of
> arch_rethook_trampoline itself.

What you describe is

   pushq arch_rethook_trampoline(%rip)

The @GOTPCREL makes the PUSH access an item from the GOT, and that item
is arch_rethook_trampoline's address.

Jan

