Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD89C3877
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 07:35:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833336.1248465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAO0N-0008Ph-9K; Mon, 11 Nov 2024 06:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833336.1248465; Mon, 11 Nov 2024 06:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAO0N-0008NI-62; Mon, 11 Nov 2024 06:34:31 +0000
Received: by outflank-mailman (input) for mailman id 833336;
 Mon, 11 Nov 2024 06:34:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAO0L-0008NC-JI
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 06:34:29 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fea02040-9ff6-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 07:34:25 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539e7e73740so3805913e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 10 Nov 2024 22:34:25 -0800 (PST)
Received: from ?IPV6:2003:ca:b721:c835:8cf8:ed41:9b27:a44e?
 (p200300cab721c8358cf8ed419b27a44e.dip0.t-ipconnect.de.
 [2003:ca:b721:c835:8cf8:ed41:9b27:a44e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97c6b6sm11902254f8f.24.2024.11.10.22.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2024 22:34:24 -0800 (PST)
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
X-Inumbo-ID: fea02040-9ff6-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1sZjEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZlYTAyMDQwLTlmZjYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzA2ODY1LjUyNDYwNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731306865; x=1731911665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QoRLhL/8P+vCTgqdLldZ5WcOdrKK/Ll0D6M85RZqnB8=;
        b=Ezc+teud4WYTTEPrPzVQWj4DEi2ndgT0yxA539algomTnGBd/UN1XJi1dO1ZeBBhXA
         ppXL4k/ZvlPI0ZCvG3QnjbmDoxu9b6ok9qmOq0Dh3yp00k/S6Lw/6yRuUjMUiHjKOJ0P
         tjPu7KEk+9Ff6z74RPpBjgZoyqMip0atPYnuWx+vxXWHcw64I3iOOk7EmMSjq6VkQTwN
         SKujAryREl+Gtd0TMXFhXkXAv05Ys9+AB44E9NOAjktjhy3fJdAlv9tW151nnC6fDb2Z
         RA9nLaQ5rM/EmZPFdI1tEPn+VCUIyeQmYdusXNPjzMZgdyahaQ8USzRu9rCdJ/RUvIfq
         EL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731306865; x=1731911665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoRLhL/8P+vCTgqdLldZ5WcOdrKK/Ll0D6M85RZqnB8=;
        b=NAoKnFv7BPYy6/0P8nFUDAEunoMv5mKL+ODa0Sx9fBb620pHBIVEQmcsMhKYmVbA+v
         f+bRTqvXr670l7Imv0Ik7a0C0URcZZflCZDZpKEeke6qNKNMTvdlkyzRJhsQRsCUQw1J
         10zrljvXgln5XoaH0saoaXndvcdYe4BNRIuoNDG5fryhvr1cqvEpSi1Tr0a4aGu4dNMj
         xAClwATljap1HAJ+vfc8ayG8/curtwV+2QTa6UQgvGHLLvik6Zby1lanMITcwon12jSJ
         pvw3s6k4Cj+LKQYkt9H4hnUbhLf2Od+SdWjNy4yDRhgJBlSY1pUp8SbKgb+aPve7jC73
         4T6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5xBVlZi2D+TthY4PBN/ePF4LQRiMGvD59XtNWP/gdzCGf/Fg4Cb/fR75g+O6K3AXy/oh40PQuP2Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5JdDROZR4hQl7C+KZBzlHR08jY9Mlp43a94ALNen2Tpizeso/
	Ch+b9etLtPJf+NKBMVGiKZGA3Wl9dpdhQji5nnafcGuzjVzQvUmFzUbYfPSodw==
X-Google-Smtp-Source: AGHT+IHfP3npFilnSaZ1rx+Myrxkuc/HL+XBjlkcF3QP4zgZWUaEBs4WNSmKGxEL1Cf4sbhUW9pR+Q==
X-Received: by 2002:a05:6512:3994:b0:539:e232:e436 with SMTP id 2adb3069b0e04-53d8623da26mr5228209e87.24.1731306864791;
        Sun, 10 Nov 2024 22:34:24 -0800 (PST)
Message-ID: <57d407cf-3f3a-43f6-9aa4-05cac5b50c46@suse.com>
Date: Mon, 11 Nov 2024 07:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] x86/emul: define pseudo keyword fallthrough
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1730880832.git.federico.serafini@bugseng.com>
 <a0341b50ece1ba1b5b346b54db7d2abdc150cb95.1730880832.git.federico.serafini@bugseng.com>
 <be21f3cf-e7a8-469a-99a6-4098032a4df4@suse.com>
 <alpine.DEB.2.22.394.2411101820430.14721@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2411101820430.14721@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 03:24, Stefano Stabellini wrote:
> On Wed, 6 Nov 2024, Jan Beulich wrote:
>> On 06.11.2024 10:04, Federico Serafini wrote:
>>> The pseudo keyword fallthrough shall be used to make explicit the
>>> fallthrough intention at the end of a case statement (doing this
>>> through comments is deprecated).
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>>  xen/arch/x86/x86_emulate/x86_emulate.h | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>
>> When you had asked my privately on Matrix, I specifically said: "Adding
>> the pseudo-keyword to x86-emulate.h (not x86_emulate.h) is probably best,
>> unless problems with that approach turn up." Even if identical re-
>> definitions are deemed fine, I for one consider such bad practice. Yet
>> by playing with this file (and outside of any relevant #ifdef) means
>> there will be such a re-definition when building Xen itself.
>>
>> In fact the patch subject should also already clarify that the auxiliary
>> definition is only needed for the test and fuzzing harnesses.
> 
> Hi Jan, I don't understand this comment.
> 
> You say "playing with this file (and outside of any relevant #ifdef)"
> but actually the changes are within the #ifndef
> __X86_EMULATE_H__/#endif. What do you mean?

"relevant" was specifically to exclude the guard #ifdef. And the remark
was to avoid the #define to merely be moved into or framed by an
"#ifndef __XEN__".

> You say "Adding the pseudo-keyword to x86-emulate.h (not x86_emulate.h)
> is probably best". I am not very familiar with x86-isms but the only
> x86-emulate.h I can find is ./tools/tests/x86_emulator/x86-emulate.h
> which is not a header that would help define anything for the Xen build?

But that's the whole point: We _have_ "fallthrough" as a pseudo-keyword
already for the Xen build. For it to be usable in the emulator files, it
particularly needs to be made available for the test and fuzzing
harnesses. And that without interfering with what the Xen build has.
Hence why it wants to go into precisely that file, where all other build
compatibility definitions also live.

> I am not understanding your suggestions. From what I can see this patch
> looks OK?

No, it is - first and foremost - the wrong file that is being touched.

Jan

