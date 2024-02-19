Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1341C859DCD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 09:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682679.1061771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbyfJ-0002Oa-Ek; Mon, 19 Feb 2024 08:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682679.1061771; Mon, 19 Feb 2024 08:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbyfJ-0002M3-Be; Mon, 19 Feb 2024 08:06:17 +0000
Received: by outflank-mailman (input) for mailman id 682679;
 Mon, 19 Feb 2024 08:06:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rbyfH-0002Lx-Tn
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 08:06:15 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf405c03-cefd-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 09:06:12 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so33469855e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 00:06:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dn23-20020a05600c655700b0040fafd84095sm10449766wmb.41.2024.02.19.00.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 00:06:12 -0800 (PST)
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
X-Inumbo-ID: bf405c03-cefd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708329972; x=1708934772; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k12lEr+9sd7cL8zwVGAmNia+gVMdZzPb0lgTIHsA8ls=;
        b=LLJ4v3MRotltNlpvmgMy+GyV4PWL/mDoExrA/HhFam5VjICRvZkwLSU5xDgcku1K7L
         9QpIvHKzYplpqmmsyu43JKdiRzZ9A5YQPgocxu7p+H3UI1ILWsr55nsWPZCKp3LOREaL
         zuDnC0V3DevV+hkg0o0/oyPrqfzbaCEE0fcoIMrgI2xitrMI3aXqfrEkxjsXIyJfLN0e
         1Fjifdu1ZgTWVcvTda+yIAE+JIC5mufHGoRJyH7H+6QEeRSCxmWmi3kllVhZdVTzOgKQ
         oNAY9c+Un2uShAsQSnJ4FaVjtO7dI0ytiu0p7uiElpWiNSfah+bH3dqAFWID+XgoFhL+
         k9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708329972; x=1708934772;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k12lEr+9sd7cL8zwVGAmNia+gVMdZzPb0lgTIHsA8ls=;
        b=wKcwFNFMuJZT0pJSVmt5TXt19X4TxJIafjxEjWwARi9Z/aVURXqXHAl919OIcNoQe/
         TXg0ykWnLQ36O19pVaiQM4jx0TaWFtBwyK6JxLJFAte9M7Xj8SAp9uvhidUJAXXlSgFA
         Q/C8P5nMUB/c8Sd7N/oVOpwKYcZSfpYTIlldHMRJ3cH/P8fI4D6e+VJ/ToXVuKHT580q
         ZZXdoCHP0Qw1gtXdfXKqy0JcTItwyCtQbhemv3h5VczAOwLJoi2peEaFqGUZSIlV2ZaP
         DAQ/4ufXkkKWEtinR1o3PYXU7rkfN7Tu+mi3fs5ltPPWfIi3Bal8OgHIk3ivZ5hN0YWA
         s6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVKEp0RIA/xOkK2IlP1Tw+fr5tf6VZTgECqneNBkAaV8/L2v9e1oINdPBLgs1zQee3+/ox9AeHwB1ROHqf5nXw/afPpNwLKQoV50B/XUDA=
X-Gm-Message-State: AOJu0YypYqcqtFD3YyraAkH10FKZJ7WGEZYGmqQZvGedd28GIuV1F22w
	Lx59XRWnNUL8idYhbl5t+PyCtAJRQf6mmdTfJuw78nUE8bmoHKStMXLKZ3wPTg==
X-Google-Smtp-Source: AGHT+IFL1vAGJHdMrbZuvYW54iJj+EGbU3OLIGgm4eSYQaJ86l9WrCtHKLbO4y0ABgBEuqgEXCeqwQ==
X-Received: by 2002:a05:600c:3ba5:b0:40f:f069:8d13 with SMTP id n37-20020a05600c3ba500b0040ff0698d13mr8136392wms.9.1708329972651;
        Mon, 19 Feb 2024 00:06:12 -0800 (PST)
Message-ID: <5de8f721-461c-4a0e-a11d-63aa7c93a742@suse.com>
Date: Mon, 19 Feb 2024 09:06:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/30] xen/riscv: add minimal stuff to processor.h to
 build full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <9efbc232f64b6192cf83f865b8987846fe082720.1707146506.git.oleksii.kurochko@gmail.com>
 <6be5102a-624c-463a-9821-c618d110ce7a@suse.com>
 <095b8031eaaa5324cdae9fee75f9521a795feb46.camel@gmail.com>
 <2f1e4d2d-5b33-47ff-912b-c4693744d0e9@suse.com>
 <0bafef389b30251bc9898bb61604aa3efaabe48c.camel@gmail.com>
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
In-Reply-To: <0bafef389b30251bc9898bb61604aa3efaabe48c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.02.2024 12:16, Oleksii wrote:
> On Thu, 2024-02-15 at 17:43 +0100, Jan Beulich wrote:
>> On 15.02.2024 17:38, Oleksii wrote:
>>> On Tue, 2024-02-13 at 14:33 +0100, Jan Beulich wrote:
>>>> On 05.02.2024 16:32, Oleksii Kurochko wrote:
>>>>> +	depends on LLD_VERSION >= 150000 || LD_VERSION >=
>>>>> 23600
>>>>
>>>> What's the linker dependency here? Depending on the answer I
>>>> might
>>>> further
>>>> ask why "TOOLCHAIN" when elsewhere we use CC_HAS_ or HAS_CC_ or
>>>> HAS_AS_.
>>> I missed to introduce {L}LLD_VERSION config. It should output from
>>> the
>>> command:
>>>   riscv64-linux-gnu-ld --version
>>
>> Doesn't answer my question though where the linker version matters
>> here.
> Then I misinterpreted your initial question.
> Could you please provide further clarification or rephrase it for
> better understanding?
> 
> Probably, your question was about why linker dependency is needed here,
> then
> it is not sufficient to check if a toolchain supports a particular  
> extension without checking if the linker supports that extension   
> too.
> For example, Clang 15 supports Zihintpause but GNU bintutils
> 2.35.2 does not, leading build errors like so:
>     
>    riscv64-linux-gnu-ld: -march=rv64i_zihintpause2p0: Invalid or
>    unknown z ISA extension: 'zihintpause'

Hmm, that's certainly "interesting" behavior of the RISC-V linker. Yet
isn't the linker capability expected to be tied to that of gas? I would
find it far more natural if a gas dependency existed here. If such a
connection cannot be taken for granted, I'm pretty sure you'd need to
probe both then anyway.

Jan

