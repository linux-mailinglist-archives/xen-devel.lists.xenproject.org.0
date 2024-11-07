Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45F9C015E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831596.1246924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8z5f-0002BU-Bk; Thu, 07 Nov 2024 09:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831596.1246924; Thu, 07 Nov 2024 09:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8z5f-00029L-8b; Thu, 07 Nov 2024 09:46:11 +0000
Received: by outflank-mailman (input) for mailman id 831596;
 Thu, 07 Nov 2024 09:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8z5e-00029F-74
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:46:10 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c024fc7-9ced-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 10:46:06 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d3ecad390so1067485f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 01:46:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9978afsm1213396f8f.52.2024.11.07.01.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 01:46:05 -0800 (PST)
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
X-Inumbo-ID: 1c024fc7-9ced-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzQiLCJoZWxvIjoibWFpbC13cjEteDQzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFjMDI0ZmM3LTljZWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTcyNzY2LjUzMzQzMSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730972766; x=1731577566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4icKvh7bQaT/mFZnzgWTco3Ya5kHOgRa2Lo28+KbHXA=;
        b=cZWv4IVGUn6N4aYxvMyowmwCuJ/wd6Lfef+hyVbLi0M9BKdsp1+K9rdlFTaHoL0mqQ
         M7yrwJRkv8FjMB3OKaEMlpngFig8sJLt0ZbX/VAW7i8ar0amQr09k+BMLkJyQ/Vu+iud
         XDUK18cLu5i20swwSSZyJhtZ2MWl3Grn8klTKZKv7hWdmaHh6SIU2xE0GXh0FsuSqpoL
         aKwwyGZBoGFyPokNA2cAbqDDsjzGxlnRMNtSUl9YDEm/QZb6VUDQUir+pP/WkcddRdes
         IFH3hPDUg0Rwe/Y1pB3I1AkM4pjbeL8ddaJzmdYYgRaNoE7PvDmWBpHvwCL8zdnJQi/P
         ppKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730972766; x=1731577566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4icKvh7bQaT/mFZnzgWTco3Ya5kHOgRa2Lo28+KbHXA=;
        b=csotWhF7YnrlEVqZJtrCaPmAzmOLIG8vog7VG3lGNG1VufW87bUjW5tEU/bK7/7ZW6
         SLJNB7CLjyGeuwa+i3l17Ty/1qMMCipG9QXsBv7VtTRyAvF/I873HQVAJRBBytFtBVPQ
         mYHJIoxhhjNIdpeClAYwTLyHTYXBvwrkAJTfc7pvueUYeewf8h5oa04eAhHrZi0tgdlA
         qYolgfHhO4uBtLkAB6stnAQhW1hD7XBq46YsEGDnQ8w/BZwnZLXLvrkcTXTqbl/8UaVk
         h9Uc5PaTEd7yeE2M07p3e7WeiUwYFo/15YSUfMFdtRXOFQVkHt7LPFrQREFfsEhO6W9Q
         5F6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFK9F9/DfO4X+YHCa4m5pAHTB9sbAZQGy31IPT+DqiAns778Ecp4O4DfT21DOWmfaef6pJDFi+xgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBvfaQVtUwpYO+2b5gHqREz2eTZDTRfdv97pcBHjdiP5ONxKsl
	Est95QZKECIsS6akuhippgSQJ5O48pTQX8Rc40wlYlxoEPBz61ldLSnHjn4Euw==
X-Google-Smtp-Source: AGHT+IG5XOAjpF6L7fiwvCOy1tU9PxqhI1qqmQ3+rOeE+iH+Q2iWe7mnqgZ4ailHXNn3U1Nr9enmRQ==
X-Received: by 2002:a5d:59ae:0:b0:37d:2d6f:3284 with SMTP id ffacd0b85a97d-381ef6d3584mr540981f8f.9.1730972765657;
        Thu, 07 Nov 2024 01:46:05 -0800 (PST)
Message-ID: <9947c21d-b5f7-4197-b6d9-dd4d491a30c2@suse.com>
Date: Thu, 7 Nov 2024 10:46:04 +0100
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
 <cc7802cc-8591-4356-bf7e-3daa912c751c@suse.com>
 <CACHz=ZjZVPSueWjxfWBjbjg8_UhZc7hMwM49BFT0bipqeBOsSA@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjZVPSueWjxfWBjbjg8_UhZc7hMwM49BFT0bipqeBOsSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 12:58, Frediano Ziglio wrote:
> On Wed, Nov 6, 2024 at 11:45 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 06.11.2024 12:34, Frediano Ziglio wrote:
>>> On Wed, Nov 6, 2024 at 10:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 06.11.2024 07:56, Frediano Ziglio wrote:
>>>>> On Tue, Nov 5, 2024 at 5:06 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 05.11.2024 17:35, Frediano Ziglio wrote:
>>>>>>> On Tue, Nov 5, 2024 at 3:32 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>
>>>>>>>> On 05.11.2024 15:55, Frediano Ziglio wrote:
>>>>>>>>> This toolchain generates different object and map files.
>>>>>>>>> Account for these changes.
>>>>>>>>
>>>>>>>> At least briefly mentioning what exactly the differences are would be
>>>>>>>> quite nice, imo.
>>>>>>>>
>>>>>>>
>>>>>>> What about.
>>>>>>>
>>>>>>> Object have 3 additional sections which must be handled by the linker script.
>>>>>>
>>>>>> I expect these sections are there in both cases. The difference, I assume,
>>>>>> is that for the GNU linker they don't need mentioning in the linker script.
>>>>>> Maybe that's what you mean to say, but to me at least the sentence can also
>>>>>> be interpreted differently.
>>>>>
>>>>> Why do you expect such sections? They are used for dynamic symbols in
>>>>> shared objects, we don't use shared objects here. Normal object
>>>>> symbols are not handled by these sections. GNU compiler+linker (we
>>>>> link multiple objects together) do not generate these sections. So the
>>>>> comment looks correct to me.
>>>>
>>>> About every ELF object will have .symtab and .strtab, and many also a
>>>> separate .shstrtab. There's nothing "dynamic" about them. IOW - I'm
>>>> confused by your reply.
>>>
>>> I checked the object files and there are no such sections using GNU toolchain.
>>
>> I think I checked every *.o that's under boot/, and they all have these three
>> sections. Can you clarify which one(s) specifically you checked?
> 
> $ gcc --version
> gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
> Copyright (C) 2021 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> $ ld --version
> GNU ld (GNU Binutils for Ubuntu) 2.38
> Copyright (C) 2022 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public Licence version 3 or (at your option) a later version.
> This program has absolutely no warranty.
> 
> $ find xen/normal/ xen/pvh/ -name \*.o | xargs -ifilename sh -c
> 'objdump -x filename' | grep -e \\.
> shstrtab -e \\.strtab -e \\.symtab
> 
> (xen/normal and xen/pvh are the build directory, with different configurations)
> 
> I'm saying that's possibly why the linker scripts didn't need to
> specify these sections.

Just to mention it here as well - objdump's -x option doesn't include "control"
sections. Considering the help text for -x this feels like a bug. However, as
documentation has it:

"Display all available header information, including the symbol table and
 relocation entries."

the symbol table and possible relocations _are_ being displayed, just not as
part of "Sections:".

Jan

