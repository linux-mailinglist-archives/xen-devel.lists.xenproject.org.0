Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B7A9BE5DA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830808.1245902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eTV-0001SV-SV; Wed, 06 Nov 2024 11:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830808.1245902; Wed, 06 Nov 2024 11:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eTV-0001QJ-PT; Wed, 06 Nov 2024 11:45:25 +0000
Received: by outflank-mailman (input) for mailman id 830808;
 Wed, 06 Nov 2024 11:45:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8eTU-0001QD-VG
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:45:24 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99fe9401-9c34-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 12:45:20 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so51232215e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:45:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa74abb9sm19696305e9.42.2024.11.06.03.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 03:45:19 -0800 (PST)
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
X-Inumbo-ID: 99fe9401-9c34-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk5ZmU5NDAxLTljMzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODkzNTIwLjk1ODE3OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730893520; x=1731498320; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=//Mb8UKJhZpV72nAkfnHlceW+A8vwbjOFIWGa/PERRI=;
        b=VFTdfouwQvLrI/AQt7//Tl09eoMxaJYdvkXwC46xyiYOda0YheQL5CqC1LFONDOE1j
         8M47jBCK3sz7ssGr+ogV2f5ro37Ir+tE2fap0K6mxddRXONFsyKczRHRYXbmWPCSrZH0
         PomSOSt9Jc/xlGvKmp/0E39k4k4dSUDlhdrunNPLpA0qabWj01JKFgtstes9jA9WxJ45
         q19pMDpygELSL/XyKbgq9wrD0lTAl9Kw9EnCkUwBkAVN16ptEdg+SRc1SqkiDyOWa34f
         gn1qMUQ8TXGzeqw7soRv5KvbCNjhTHBLlEP+wsQkl8GWI/VGrkXzhacC9sLFjrnR5ISF
         Oetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730893520; x=1731498320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//Mb8UKJhZpV72nAkfnHlceW+A8vwbjOFIWGa/PERRI=;
        b=fFf2I8kw/f0IHw5wcEGD0zlSxH2nuAev0qdj81qIrJMJG9Jrkje/Q7HBk4jx3UUFDB
         /pFiA/wSvqwvJKafgTisSGqRyYEtn0/7jxXsF97jVXeeQxE2G34vz69tSejtqvjHBt0B
         kAusLl+cOokgeytYr5KOdC6M/hg271M0DXcdDRAbdyI4IqkscF1n/LGjjzWhF19msCz0
         iSTZO8+LxR1Ld0aBS/LLvNJ27aOv2z8VwYPYtO5bNK4JJtgol4wacmgcuOJSHCPdeMr+
         cdYxV1nL6kXJ0veOS6dLXAiP8mvnajWmX0zb7lazolxn+h7ovigCgSUoYcE64DU2T9UG
         Fizw==
X-Forwarded-Encrypted: i=1; AJvYcCVGrfCL+zshGjxyJPjKI2O0Q9sQz6bEGBY4pPIy4ifY+OleZ2PJ0RktpG/pbERoSmbs0h4v9iBpbu0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7h415GHbUqwZuf5TRVFAqN8VV0g92lk+u3AfG89eGBFxnh837
	Bpo6iOujlzqG9rI6CnzW+3GLKDfaLWToFREFOI6j31os2mLWQMlKlr691z5A+Q==
X-Google-Smtp-Source: AGHT+IE2a+YygcS6vrAUEFnupEvUALPPKee2TLFIBbUhJafXMteukvKmTEADnKUQmkYN6oklt6Iebg==
X-Received: by 2002:a05:600c:354e:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-431bb9de8a9mr246394875e9.30.1730893520309;
        Wed, 06 Nov 2024 03:45:20 -0800 (PST)
Message-ID: <cc7802cc-8591-4356-bf7e-3daa912c751c@suse.com>
Date: Wed, 6 Nov 2024 12:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
 <48a22295-f3ac-496b-bdfb-ee17b0ada994@suse.com>
 <CACHz=ZhrxTSYGyWMQSE0Xi6sW2BZiLDuKkP2508CBRELD-USgQ@mail.gmail.com>
 <816ae079-378b-4bfd-93f2-83c5a281eb01@suse.com>
 <CACHz=ZhzrZO5o8EarXewC6BzrX4acSyAFsAO2hHBvm9xYRecqg@mail.gmail.com>
 <80296824-760a-48c4-9dce-4875fca0ed31@suse.com>
 <CACHz=ZgY_O7siQUQZjxGe=gfiB-C9jw1UQqwK9ffuHUUQmRgiQ@mail.gmail.com>
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
In-Reply-To: <CACHz=ZgY_O7siQUQZjxGe=gfiB-C9jw1UQqwK9ffuHUUQmRgiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 12:34, Frediano Ziglio wrote:
> On Wed, Nov 6, 2024 at 10:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 06.11.2024 07:56, Frediano Ziglio wrote:
>>> On Tue, Nov 5, 2024 at 5:06 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 05.11.2024 17:35, Frediano Ziglio wrote:
>>>>> On Tue, Nov 5, 2024 at 3:32 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 05.11.2024 15:55, Frediano Ziglio wrote:
>>>>>>> This toolchain generates different object and map files.
>>>>>>> Account for these changes.
>>>>>>
>>>>>> At least briefly mentioning what exactly the differences are would be
>>>>>> quite nice, imo.
>>>>>>
>>>>>
>>>>> What about.
>>>>>
>>>>> Object have 3 additional sections which must be handled by the linker script.
>>>>
>>>> I expect these sections are there in both cases. The difference, I assume,
>>>> is that for the GNU linker they don't need mentioning in the linker script.
>>>> Maybe that's what you mean to say, but to me at least the sentence can also
>>>> be interpreted differently.
>>>
>>> Why do you expect such sections? They are used for dynamic symbols in
>>> shared objects, we don't use shared objects here. Normal object
>>> symbols are not handled by these sections. GNU compiler+linker (we
>>> link multiple objects together) do not generate these sections. So the
>>> comment looks correct to me.
>>
>> About every ELF object will have .symtab and .strtab, and many also a
>> separate .shstrtab. There's nothing "dynamic" about them. IOW - I'm
>> confused by your reply.
> 
> I checked the object files and there are no such sections using GNU toolchain.

I think I checked every *.o that's under boot/, and they all have these three
sections. Can you clarify which one(s) specifically you checked?

Jan

