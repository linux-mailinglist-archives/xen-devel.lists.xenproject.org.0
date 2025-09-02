Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E4B4069C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106625.1457270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRv5-0004zq-M4; Tue, 02 Sep 2025 14:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106625.1457270; Tue, 02 Sep 2025 14:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRv5-0004xX-Io; Tue, 02 Sep 2025 14:23:35 +0000
Received: by outflank-mailman (input) for mailman id 1106625;
 Tue, 02 Sep 2025 14:23:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utRv4-0004xR-OU
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:23:34 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670ed193-8808-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 16:23:33 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b0431c12df3so313417866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 07:23:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0420a16c32sm596088066b.94.2025.09.02.07.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 07:23:29 -0700 (PDT)
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
X-Inumbo-ID: 670ed193-8808-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756823011; x=1757427811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ysU0qV/SJMt5Mw8eex5NgT9TFhTQ5X+hg0T4pDSCLw4=;
        b=AGb3eI8So53hPaA6xJbBCgMq+kfpR1Vx0zkkfaCJhfUa/ODy4wp8RBn0HJuIsMg6VX
         RP29NIzIdSM+C6fxOBfmnPDiYJ00MdTQuQ32gJNdyEruyBXbQzqN2B9sBXs8jDgoOCiy
         FkuZTgFmrc4WsiouBhcLCTESiuw1cdw1vQoD8Tk+GhuSOJMi8TwwZZWP2iPba4m92R87
         G8wTT2FQ4dDoQx0JUS7DFlH9cOsfXWb2A+FzPo/gJO/53lAQhG/qAMgP0/I8rwF3cubc
         Y6URfthJQH8yAUzwPwryu3SUOgqAWCAnpAnD92FufqSHMoP37/4Q2FXDuPFuh5mFHGEn
         +q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756823011; x=1757427811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysU0qV/SJMt5Mw8eex5NgT9TFhTQ5X+hg0T4pDSCLw4=;
        b=aM4Nlne940K7dxbZ+czgl64WZr79ea8wxNB5M3vbHeQBeRcuqXTeKnFQpRG4LnxlEm
         In5L691rakP1f4CDBFVG+tJeqn19TXKfhDQWYkZuD/YtP0tEAoo1kJeqDBjXt/hA93qs
         ynA+k70x3nZvh/uXIIsKIqCWn5VE3U9cqFMhJmEypSu7saPDi6FDNsGkiwYzHWS35PjE
         vXI8cNL22P/u7TJxaSvHzZ5rJJYc7i9KVOnbn7lF9H7LHJRp/x3eR5nyW8AySCHTixrV
         zQ4Gng7uWFsdCS6j5LWvrIGZocddjlQ3wdYdta1roJWwrL1IB6LTk9QCiV4j6vIma6Og
         thUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAV5EyxHo2rJtsI6AMw1o3/Onl/h4EnK7Q29aGm6r/YfTSXpaanIhcuIDjf/xniP2/jSyf5L1SUXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/zIbb5uyYipaDOz8YNR35sGbcQuu5x5qVA+dHO1M/rSvGgN/4
	PODHnYcLi7RxPj4VejgLY5dAB4gUrdIgwv0qtOyahRTrFdLO/FgXIgtJV2B2mhc4DQ==
X-Gm-Gg: ASbGnctTAv8j2vIelSGoNMaZh/XMDX9zZlWt5jsTTaqdjyeNTnTtJ6nWLlvHpTix+h6
	MMvLmFUqSJOE2fvcizxCeBzueEsFv+hoBMnIF1SRMwoLgXaC+n8KS4JGQgDsbb5akW7tPtga3LV
	DitUGNIvosAiWFkAZGaz2SZQZi4AhmLTpIyESNIFxdBB9TcU6dJKV/AhLUrJyw0DuOtsPh4Z6py
	G2FDvj1j2KECxld+9kEE9f8GJaN/djZOgiISoRvbhmXCqw3Ds1FBJmqrLw3jfnwXREWa8q6JsOV
	oZjiCYkWZyeEN6c2GGqrgoQrHz/JiROJsDUA6PpEVdWbrzlep6QZcSTnXbE2Kt8mN2J7/KFj1zy
	vHYyavdkYuyR65df7/SiuwM6B0RuwtCzOQSkqNvO+UcduW2UYhVlB+6pcjIyn7VSc8pel+qYULn
	KQIA7TMgk=
X-Google-Smtp-Source: AGHT+IH/++WGN670wvJiEuTzNp+g5Ph1N3D5WILlno8cbOAJ6o5/Sm3iHE1b2fFpTO7Tf1/TvEVdzw==
X-Received: by 2002:a17:907:1c19:b0:b04:522c:e113 with SMTP id a640c23a62f3a-b04522d1ce2mr233087666b.53.1756823009898;
        Tue, 02 Sep 2025 07:23:29 -0700 (PDT)
Message-ID: <49551fca-5059-4ca4-b551-d282d6099e36@suse.com>
Date: Tue, 2 Sep 2025 16:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
 <2ad255ea-6c5e-4e9a-a821-db7449432399@suse.com>
 <aLb0I01WASpFremM@mail.soc.lip6.fr>
 <5953e9aa-4b56-4112-b952-7b4ff0ca2a62@suse.com>
 <aLb6AcjEer83IrFC@mail.soc.lip6.fr>
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
In-Reply-To: <aLb6AcjEer83IrFC@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 16:06, Manuel Bouyer wrote:
> On Tue, Sep 02, 2025 at 03:55:14PM +0200, Jan Beulich wrote:
>> On 02.09.2025 15:41, Manuel Bouyer wrote:
>>> On Tue, Sep 02, 2025 at 02:28:27PM +0200, Juergen Gross wrote:
>>>>> What puzzles me is that:
>>>>>
>>>>> - %cr2 is 0, so probably the first fault wasn't a page fault
>>>>> - RIP is %ebx + 8, so maybe the code was just clobbered by the loop?
>>>>>
>>>>> Could it be the code has been moved to this location, or is about to
>>>>> be moved away afterwards?
>>>>
>>>> And indeed: from the full boot log I can see:
>>>>
>>>> (XEN)     virt_base        = 0x0
>>>> (XEN)     elf_paddr_offset = 0x0
>>>> (XEN)     virt_offset      = 0x0
>>>> (XEN)     virt_kstart      = 0x200000
>>>> (XEN)     virt_kend        = 0x17bab90
>>>> (XEN)     virt_entry       = 0x20e4d0
>>>>
>>>> So virt_kentry is very near to the RIP.
>>>
>>> thanks to this, I think I found the issue:
>>> with Xen 4.18, the kernel is started with ebx=17bb018; with 4.20 it's
>>> 100018.
>>>
>>> The bootstrap code assumes that the kernel is after the kernel, and the
>>
>> DYM "start info is after the kernel" or some such, seeing that that's what
>> %ebx is about?
> 
> yes, sorry
> 
>>> kernel symbol table. That seems to be no longer true with Xen 4.20 and a
>>> PVH dom0 (but probably still true in all other cases).
>>>
>>> I can deal with that, but with the new layout how do I get the end of the
>>> symbol table ?
>>
>> You'll need to handle that internally, I expect, perhaps from properties of
>> your (ELF) binary.
> 
> But I don't have access to the ELF headers from the kernel binary (nor do I
> know which kernel was booted).
> 
> Hum, maybe a I can hardcode this info in some const of the binary with a
> ld trick ?

For the symbol table to be loaded, it needs to live in some loadable section.
You should be able to mark that section's end (or the end of the symbol
table in the section, in case there's more stuff there) with a symbol in the
linker script (which I assume you use). If you used the GNU toolchain, you
could also consider using the assembler's .startof. / .sizeof. operators
(producing symbols that the linker then recognizes and resolves accordingly).

Or wait - are you perhaps using the thing we call "bsd_symtab" in our libelf?
Then, as per the scheme in elf_load_bsdsyms(), can't you find the start of
the ELF header from the end of your kernel? At least that's how I understand
it's supposed to work.

Jan

