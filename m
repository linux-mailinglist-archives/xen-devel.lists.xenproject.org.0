Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB58534FD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680030.1057853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZux7-0006WN-98; Tue, 13 Feb 2024 15:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680030.1057853; Tue, 13 Feb 2024 15:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZux7-0006UW-5O; Tue, 13 Feb 2024 15:44:09 +0000
Received: by outflank-mailman (input) for mailman id 680030;
 Tue, 13 Feb 2024 15:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZux6-0006UQ-KA
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:44:08 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b83655a2-ca86-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 16:44:06 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-411d76c9ce3so787055e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 07:44:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hi7-20020a05600c534700b00410be9b8b96sm7509886wmb.37.2024.02.13.07.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:44:05 -0800 (PST)
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
X-Inumbo-ID: b83655a2-ca86-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707839045; x=1708443845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Uyx6HzAtaWMW1Wl2nJI/9FPFKqQgwt7hBFmnn/vgPc=;
        b=SPyfV8Lr2Q6AMchCqv8X0WpNbXGt/kWbFzg64cnnnL2xt/TD9iVBV/71yC2E08oiql
         LiUvAHqGRb9x8ZFU85f3K8RuG9ZuehJ2m409ZvNXesqsflHLp0J/aOwIaiUfBuYkx8aR
         0haILqFOc7HcCCH7E56ET5pkxvwh/podfInvl4PZXrp7EMd7nOenSVJY8eQz3y7uV+0M
         ZrRa9Hv4ymChUnQuiAlYGnp+cwHpsQnOZ9JUjkPz0QYRAtbH55C0PJ4mvrK/XneC0yaZ
         9cM7nc2gSRXb8r66C4pjTaK3seLeE2vSB1+ABCTj8dN+mVLOoWLYAAdx/RwIfP0hDRgm
         vpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707839045; x=1708443845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Uyx6HzAtaWMW1Wl2nJI/9FPFKqQgwt7hBFmnn/vgPc=;
        b=ZY/ygZkOaKbXHkTJvqiF1yME4369dXg0JxIo8Cw1JoQp1MFCyW+xVdSv0e8NMtzULZ
         2jn1PTEX6kLeNBzffnulUHblr2fIw89yEdIeCeI96qk+0X7Et9v8r++Jt9NpCd4wRWCz
         8oCN57ninPKkI2F73Vp0kLjTNyqDqtgRJhjYmLWPDxyJddYhFsHQb5AP7NoExbuG05dC
         m4IvUS0yPeGDBIs/J7KPW4p15mRgH/EUZe7LDKtYXLMJvS8I6a5rzlUWAzdAt2V+/FLg
         y4NgyYE3niGTUQTGULxPgllXdGBzM30P26EhBahHlIWGszpR3O+THHqMizjA+cz7uXmQ
         0uHw==
X-Forwarded-Encrypted: i=1; AJvYcCWU95QvO6/bRu5zFs0N2SbYj6YUtrqoqy5c4hvX91v2UIJ3FACxHEOKu5Oh6dO5cFl5gjnt6OmoCJB8rcZg//N9yzCrOSFsRy6LkhM3w3U=
X-Gm-Message-State: AOJu0Yw5fjFMF8b0DirgmJGLP8BWdCQlr9nD+o4aEelx3qLcWWet0SLS
	aB9AS8PdXOXzoLEBYRftoVQ6zTSxD2pRpZ5PzD3qv/bi9AnaVr92nmCLDU40HQ==
X-Google-Smtp-Source: AGHT+IGrWldOTkLMd59SXhe55YIx6EGkiHqT60aSWXgc7pF4uc5BZOQPWyQM/ESRdL8Pso+OF317iw==
X-Received: by 2002:adf:fa8d:0:b0:33c:e29c:69a1 with SMTP id h13-20020adffa8d000000b0033ce29c69a1mr719272wrr.56.1707839045684;
        Tue, 13 Feb 2024 07:44:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJCGarz7YC7YbtDgciXIE0377vq9J7yc+UHhpLtxjHzkl9b8LtHhtB4R1cUfQ+OQsuHcddnuV/DrR+J1maRanJkUKzSE+c7pnJ7WZBWJuODpgaELbpWUjK7zu2NrI1S5itROl2bcxVWO7q7fA+Jr5YmWKNu1tm715mKmD4wPbhSWFzIfvKv9sqoKa/jEipPqLDrQxLq0eZGT+x05JPy0RVSVo/Tzk4pQ==
Message-ID: <23bcd506-f843-42f7-a541-0d8db7c319ab@suse.com>
Date: Tue, 13 Feb 2024 16:44:04 +0100
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
 <b52fa3fa-4e33-4211-af18-f00aaa0b365b@suse.com> <ZcuGo_vQhiTAQep0@mail-itl>
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
In-Reply-To: <ZcuGo_vQhiTAQep0@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2024 16:11, Marek Marczykowski wrote:
> On Tue, Feb 13, 2024 at 04:00:32PM +0100, Jan Beulich wrote:
>> On 13.02.2024 15:53, Marek Marczykowski wrote:
>>> On Tue, Feb 13, 2024 at 08:45:54AM +0100, Jan Beulich wrote:
>>>> On 13.02.2024 04:43, Marek Marczykowski wrote:
>>>>> On Mon, Feb 12, 2024 at 10:04:38AM +0100, Jan Beulich wrote:
>>>>>> On 08.02.2024 23:00, Julien Grall wrote:
>>>>>>> On 05/02/2024 13:27, Jan Beulich wrote:
>>>>>>>> In preparation of dropping the register parameters from
>>>>>>>> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
>>>>>>>> register state needs making available another way for the few key
>>>>>>>> handlers which need it. Fake IRQ-like state.
>>>>>>>>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>> ---
>>>>>>>> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsistent with
>>>>>>>> other console poll functions we have, and it's unclear whether that's
>>>>>>>> actually generally correct.
>>>>>>>
>>>>>>> Is it? Looking at ns16550_poll() we would pass guest_user_regs() if 
>>>>>>> run_in_exception() doesn't exist. But looking at the caller, no-on seems 
>>>>>>> to care about the 'regs'. So is this just a latent bug?
>>>>>>
>>>>>> What do you mean by "doesn't exist"? ns16550_poll() assumes it exists.
>>>>>> And I can spot any use of guest_user_regs() on the respective generic
>>>>>> or Arm-specific bug.c paths.
>>>>>>
>>>>>>> BTW, do you have an idea why the poll function is not run in an 
>>>>>>> exception handler?
>>>>>>
>>>>>> "The poll function" being which one? If you mean the one in xhci-dbc.c
>>>>>> then that's why I had Cc-ed Marek. Moving him to To: - maybe that
>>>>>> manages to finally catch his attention.
>>>>>
>>>>> TBH, I don't know. That's part of the original xue patch at
>>>>> https://github.com/connojd/xue/blob/master/patches/xen-xue-dbgp.patch
>>>>> and it works for me as it is.
>>>>
>>>> "Works" meaning what? Doesn't crash on you? Or does also provide
>>>> sensible output in _all_ cases (i.e. including when e.g. the poll
>>>> happens to run on an idle vCPU)?
>>>
>>> Generally provides sensible output, for example during boot (it is using
>>> idle vCPU then, right?).
>>
>> Before Dom0 is started: Yes. With the exception of the phase where PV
>> Dom0's page tables are constructed, albeit in that time window
>> guest_cpu_user_regs() shouldn't yield sensible data either. I can only
>> say I'm surprised; since I have no way to properly test with an XHCI
>> debug port, I'd have to see about faking something to convince myself
>> (unless you were to supply example output).
> 
> Would you like me to test this series with xhci console?

The behavior shouldn't really be connected to this series. But yes, 'd'
debug key output (just the part for the CPU the key handling was
actually invoked from) with the xhci debug console would be of
interest, for the case where that CPU at that time runs an idle vCPU.

> Or maybe add
> some extra debug prints and include their output? But note, printk from
> inside console code generally leads to deadlocks. What I did for some
> debugging was to log into some separate buffer and dump it later.

Right, this would be more involved.

Jan

