Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53508533EF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:00:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679993.1057783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuGz-0004Fq-Je; Tue, 13 Feb 2024 15:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679993.1057783; Tue, 13 Feb 2024 15:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuGz-0004ED-Gu; Tue, 13 Feb 2024 15:00:37 +0000
Received: by outflank-mailman (input) for mailman id 679993;
 Tue, 13 Feb 2024 15:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZuGx-0004E6-Lb
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:00:35 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3a09786-ca80-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 16:00:34 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d0e5212559so39193291fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 07:00:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jr6-20020a05600c560600b0041079d336c7sm11993364wmb.39.2024.02.13.07.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:00:33 -0800 (PST)
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
X-Inumbo-ID: a3a09786-ca80-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707836434; x=1708441234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp8gYD7O+QLqEXZHQVoRHvrqAvzQPcT/HD2ZQ9g+l3k=;
        b=TRSUqaB8id5dH3oRFaSzo8n9FHFlJDM8DrZALtOfjPXwj5h/CF6pUxg2v6PShgTsPz
         RGROIi8Ewrhqfq3TWn6isltxupK1fcFyOH0mngAc1Vdg97hCzDnlw+Ij3aj2wZ93PYLX
         uL0qWAvaatP9QBht5+CX6IeqZB2xKrssp3bOd/dv8zpOnc9tLpCWZgOs07CZdcHxwK0s
         GfgGzy1LYhgJ0OMFEYDjSEVEJ2y4GD+25bc13Sj3VkEtChN1UYQmltDSOGoSqXyH6iPV
         FNZ8urMrcVbOpIEX9r1L8yiMK3af6HFflsyrkJ3rBwtuh34U2pvl7z3dl8lu1yeEymro
         Y2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836434; x=1708441234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qp8gYD7O+QLqEXZHQVoRHvrqAvzQPcT/HD2ZQ9g+l3k=;
        b=iHleIL5bvfpjJBJI3/ytB9GVxZBQuEu/hyvnDz0FpsaFSXGNMylLoJT3djsXTJBZ5T
         OL+TVSVNxkSHVnDKyz6ao6LRz1NGi+skeRc1xKGCC+mdqTEDTEbL0Xf/9WZpk4Fg2ANu
         FiTMZm0BHgG9yvXDE2YfqiKGmuErLlwwMdoMgxrDCtY5sbV28NzluLXrcXkTzNq3lgjc
         +sEmWGE832SjQPgxUXZsakoRIdZg9E7HsnGBFv+wQfamWHXsq/c6pu7YhOPE+kVEWQ14
         PjPWOoxXF8aH3mp7s2cRLCOL5vZclpL6NA2RNjdscSa//gRRI4B8Y1qVDRcghS0Tepo3
         /lVA==
X-Forwarded-Encrypted: i=1; AJvYcCW8M2sboR7yofMd294cb325mvZwU1Vu7wt4JNQXQkAtdBYCQ9FABli/75fJsqgkmAy8u/txv/Fn6jPf0u6CUczTdLLynWAkxKmR4zjQR8s=
X-Gm-Message-State: AOJu0YwoUaQ8ehUN3KqvxS19jUA0xjqTMYln0I5sROinwMjlOGCovy9Q
	ZKmKkpM7uv6zHAVEqYHd6Ym8ei2ab3ZL1RXAVkAtdnXL51JWU9JrecVRPgvpig==
X-Google-Smtp-Source: AGHT+IEW0LRyWOugDwmxCAMt1Vz9zfO26lIQSxLT91xCk/TnHmMnxlofgeWTn0TnA2NlTiM4vFTOdw==
X-Received: by 2002:a2e:9216:0:b0:2d0:b70a:a947 with SMTP id k22-20020a2e9216000000b002d0b70aa947mr6130487ljg.23.1707836434072;
        Tue, 13 Feb 2024 07:00:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSM46mWivw5EBZMc0j2OqjvbHCh3R7v4fArnJrmG1gHZeqPhxYfyM7PcDOjHBHENw/Le+WQochRwy6bQFJ1E0z6h26QaUcOI8y4dTUV6LHytPuEu8G09X0K/5VDTbQ0rMv/Rf66/AdjAkcdbyPdxhoZei2WkeYB72+pkvSox71rq43IIzZfL50fZBAsqRn6Y4C0UGM3DJv+ciu7Ma0fWImxDtGozP3Hw==
Message-ID: <b52fa3fa-4e33-4211-af18-f00aaa0b365b@suse.com>
Date: Tue, 13 Feb 2024 16:00:32 +0100
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
 <817ceec4-ed12-4360-a6ce-f87732f62251@suse.com> <ZcuCTnMpFib4ArHW@mail-itl>
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
In-Reply-To: <ZcuCTnMpFib4ArHW@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2024 15:53, Marek Marczykowski wrote:
> On Tue, Feb 13, 2024 at 08:45:54AM +0100, Jan Beulich wrote:
>> On 13.02.2024 04:43, Marek Marczykowski wrote:
>>> On Mon, Feb 12, 2024 at 10:04:38AM +0100, Jan Beulich wrote:
>>>> On 08.02.2024 23:00, Julien Grall wrote:
>>>>> On 05/02/2024 13:27, Jan Beulich wrote:
>>>>>> In preparation of dropping the register parameters from
>>>>>> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
>>>>>> register state needs making available another way for the few key
>>>>>> handlers which need it. Fake IRQ-like state.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsistent with
>>>>>> other console poll functions we have, and it's unclear whether that's
>>>>>> actually generally correct.
>>>>>
>>>>> Is it? Looking at ns16550_poll() we would pass guest_user_regs() if 
>>>>> run_in_exception() doesn't exist. But looking at the caller, no-on seems 
>>>>> to care about the 'regs'. So is this just a latent bug?
>>>>
>>>> What do you mean by "doesn't exist"? ns16550_poll() assumes it exists.
>>>> And I can spot any use of guest_user_regs() on the respective generic
>>>> or Arm-specific bug.c paths.
>>>>
>>>>> BTW, do you have an idea why the poll function is not run in an 
>>>>> exception handler?
>>>>
>>>> "The poll function" being which one? If you mean the one in xhci-dbc.c
>>>> then that's why I had Cc-ed Marek. Moving him to To: - maybe that
>>>> manages to finally catch his attention.
>>>
>>> TBH, I don't know. That's part of the original xue patch at
>>> https://github.com/connojd/xue/blob/master/patches/xen-xue-dbgp.patch
>>> and it works for me as it is.
>>
>> "Works" meaning what? Doesn't crash on you? Or does also provide
>> sensible output in _all_ cases (i.e. including when e.g. the poll
>> happens to run on an idle vCPU)?
> 
> Generally provides sensible output, for example during boot (it is using
> idle vCPU then, right?).

Before Dom0 is started: Yes. With the exception of the phase where PV
Dom0's page tables are constructed, albeit in that time window
guest_cpu_user_regs() shouldn't yield sensible data either. I can only
say I'm surprised; since I have no way to properly test with an XHCI
debug port, I'd have to see about faking something to convince myself
(unless you were to supply example output).

Jan

