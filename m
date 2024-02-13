Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1FE852A37
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 08:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679767.1057449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZnUN-00014m-8z; Tue, 13 Feb 2024 07:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679767.1057449; Tue, 13 Feb 2024 07:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZnUN-00011x-6F; Tue, 13 Feb 2024 07:45:59 +0000
Received: by outflank-mailman (input) for mailman id 679767;
 Tue, 13 Feb 2024 07:45:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZnUL-00011r-Ce
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 07:45:57 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc14e9a-ca43-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 08:45:56 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d0d799b55cso49989751fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 23:45:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h13-20020a2e9ecd000000b002d0f768a0cesm402971ljk.12.2024.02.12.23.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 23:45:55 -0800 (PST)
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
X-Inumbo-ID: ebc14e9a-ca43-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707810356; x=1708415156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrvzPUVeg3QniT/kEFrnvxAk6x7E45FOL+PUkf3vrpU=;
        b=fbjlcEfEUY/KfkVi1ad57bbF8quY5yjKUEi3p7JrFJPl3B8AQWPr+k096/lbvZQpLi
         pw66TfaP7J0MTmZ2SYF/EqXQqHsC0k5qYCHH9AkVq7bpybcfIcdablkBoceXXqrPsVvz
         6lNpwWpmX+xf4EsC1p+ysioAbQ2npjfDsPXY3j2XWBOh14nweNIkMvqMbTnNjyX8WPTZ
         e8nGZlNWSqBEFfibq3kiwdD1rhq5fFu51KDHtfBcquyB6XiowxoQQwOG74Zsat2j4lik
         V2lQUIjj7lBsIgtJXooyZ9+t6u8Er+4KocfKCYEwc8MWQDbr1kgiuASk53JmD1n16BMV
         CuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707810356; x=1708415156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrvzPUVeg3QniT/kEFrnvxAk6x7E45FOL+PUkf3vrpU=;
        b=J4qXRSEzeUWW/PX1Rd70dDJ7rLqqSDMSuzex60fVUU+YSnI+wvnPO8rCX8sElTc5ns
         9d8zS3GwUrX5D4KWGLb9GHoN8Gf0Ha0xolKEvkLm9OeulwJhhtlPs7DV7B0gZMZzuLwQ
         Tb4m2kYOsngD+2QQL5AKJd+0v34hB5Oy6gdXfwmcd76k/VqUkocqcrilbG1y0vZVWqsM
         M75m4rr9dpkYdflM8B2t3VrbhMKm9y9HugpcTJ4I0/v0s66Vr+Gwg4V1zF4veY7xwC9H
         9cYAzyR6FCtF0PPa135NbdOSA6hYhXVHRyCWeRxsjIaPDTQVcisxaQ+ljj119Qxb56Z2
         JzFA==
X-Forwarded-Encrypted: i=1; AJvYcCVRx9x94uGx8f0b/BySA+/GZndWFCpsHSAxPm1iaXulAnoEM0mS0wupRQZqNBSXl+aJ9Pkc23hDdFRglzQzo/gBu8X1bsPcrJ3lFJVJSxA=
X-Gm-Message-State: AOJu0YzSLIsncGPbDiFUJol9PsJ0XgoofVC4BSmhZ6AvBRh5RfllL119
	0m2JzoDqftwiZcAF/imCjMo6zjvkFvUl6azeCHryoQNi0dj4z1uHFUkpTjtuOA==
X-Google-Smtp-Source: AGHT+IGlLnoaOgo1CgxxXSJc3lxnmZH5xHHHjewhH70rxNqk6dwMkwLyzVt9ae7BVi/Y7bpGCLMYIg==
X-Received: by 2002:a2e:a366:0:b0:2d0:cd6a:ecf7 with SMTP id i6-20020a2ea366000000b002d0cd6aecf7mr5695177ljn.50.1707810355794;
        Mon, 12 Feb 2024 23:45:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9TDiGJ8ZRAt7xOmssENkVCgrV3R2d49NRcaAgS9SpvGf3Rqq/px6eptyrbqTsfdRmezR9KRICUWS9Z3f6JaVIsWbWFRdJGTxRDA84cUSKdwNf1z6HLoagLHoBUk1J3EVVBr8ckj7b4c9t4kU/aMsE/I3etACS87HslQQkzwtlZgoRcrRvPZpZ87QpjJ5jBQrinegX8gUoV9Hfv9UCE4MpV9UqKbCOlw==
Message-ID: <817ceec4-ed12-4360-a6ce-f87732f62251@suse.com>
Date: Tue, 13 Feb 2024 08:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Content-Language: en-US
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
 <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
 <4530606b-1b5e-47a4-aa41-e12e9178b06d@suse.com> <ZcrlcuNU9y8WymiK@mail-itl>
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
In-Reply-To: <ZcrlcuNU9y8WymiK@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2024 04:43, Marek Marczykowski wrote:
> On Mon, Feb 12, 2024 at 10:04:38AM +0100, Jan Beulich wrote:
>> On 08.02.2024 23:00, Julien Grall wrote:
>>> On 05/02/2024 13:27, Jan Beulich wrote:
>>>> In preparation of dropping the register parameters from
>>>> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
>>>> register state needs making available another way for the few key
>>>> handlers which need it. Fake IRQ-like state.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsistent with
>>>> other console poll functions we have, and it's unclear whether that's
>>>> actually generally correct.
>>>
>>> Is it? Looking at ns16550_poll() we would pass guest_user_regs() if 
>>> run_in_exception() doesn't exist. But looking at the caller, no-on seems 
>>> to care about the 'regs'. So is this just a latent bug?
>>
>> What do you mean by "doesn't exist"? ns16550_poll() assumes it exists.
>> And I can spot any use of guest_user_regs() on the respective generic
>> or Arm-specific bug.c paths.
>>
>>> BTW, do you have an idea why the poll function is not run in an 
>>> exception handler?
>>
>> "The poll function" being which one? If you mean the one in xhci-dbc.c
>> then that's why I had Cc-ed Marek. Moving him to To: - maybe that
>> manages to finally catch his attention.
> 
> TBH, I don't know. That's part of the original xue patch at
> https://github.com/connojd/xue/blob/master/patches/xen-xue-dbgp.patch
> and it works for me as it is.

"Works" meaning what? Doesn't crash on you? Or does also provide
sensible output in _all_ cases (i.e. including when e.g. the poll
happens to run on an idle vCPU)?

Jan

