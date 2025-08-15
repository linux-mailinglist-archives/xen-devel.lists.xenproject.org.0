Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEED8B27B3D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083015.1442689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpwe-0007l2-L2; Fri, 15 Aug 2025 08:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083015.1442689; Fri, 15 Aug 2025 08:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpwe-0007jd-Hu; Fri, 15 Aug 2025 08:37:52 +0000
Received: by outflank-mailman (input) for mailman id 1083015;
 Fri, 15 Aug 2025 08:37:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umpwd-0007jX-84
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:37:51 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2034d355-79b3-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:37:49 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7347e09so281049766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:37:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd018a4bsm88028566b.100.2025.08.15.01.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:37:48 -0700 (PDT)
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
X-Inumbo-ID: 2034d355-79b3-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755247069; x=1755851869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=04e9BxANNq7LI1zJx7oHYnVb8rCpd2XDRLkHDJ8sGas=;
        b=dh8X4LlR1MSUAzstXxfGu8i6yWLtQT3S0KnP3ODnVpjE6fHavA8NsNovKdNQJZFNXm
         2Th6l/tVc+E7/tztOIa5ZjzHvZLnHs1+ZjwvlSE8E2gnq7zGktBd7DmUERVUKWa+kdxU
         s6/zGI6Dxyw2uHe0B7WBdJwRYAOzFbS5H+1OsEkiBXGRWhL17cYDji5/SC6JC8VFIJ5M
         iN/1HRWWFzm1ZpVlknac+6kmbbysw3iJNZlW/aS03LAiL11gs3msCZmuEpd1QS3SRQi7
         /ddtMIC9N4/cm8Xbp6V4Npir6yoYC7MqULeI0+JgXZ025LXIy3qi2p4nmfJ2zXioe0zC
         oNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755247069; x=1755851869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04e9BxANNq7LI1zJx7oHYnVb8rCpd2XDRLkHDJ8sGas=;
        b=hDvrv094dcUIhMTit4WmBh8QxHGIiglrWfPC3FGKZSy6WaFfqm3TfqRQm2+ogHKbYH
         /DS1IKPXE/XWlw2ZQB37kcYXqw1oQ7CZ4HV0i+pzbvN3pYCXqvm2QB9dCA/x4FlDeUoY
         G8on6Lffas99vl5rE15bJtRhGJ7VlxnTukJreSkyQckl2h+r8M/wlsaqqTN270zZt5jN
         8EZUqTt99+5QieKP+QjGuKM6LtdPtKS/yq39qRmzXR6/chufnfJp5Q2M1au8YeMsU5Ip
         MUdmFYf5hkgiyVZ4vN3iH48IQPR3FF7St+H8yaXWfDCptQY8IgsDJJNF70lfE3z7xm2H
         wU4w==
X-Gm-Message-State: AOJu0YznfOqoZ2/oSSR4utySi/G/FA3ewcCeCFNVUmqbOfpEOwX4tUmw
	UI948ddyL2u3ZVD0Tq2znHCZW0Sksl75kbdFgiaDgAm+IvtQAmW+4khFcyHzGGZmjg==
X-Gm-Gg: ASbGnctfXKYzH4+cYzg7yNWtPAGw77CcrewF9LMNLLHx4G+bsoWPmEgxYDJL64wZKGD
	y4sSAqHxpAECacP8DbhgRNwq1u8NKJ55m/8hlZrsv5PXMF42Q0Vm81gBuv/QlnVxIzTuo5V1KLh
	lMQuqAq80lXqCRqJD4kGbrxQxezpe+mtkhnN0Aw/yrDc3c9NgFYscV+GZ3Utswq6sr7kwJ+Ggyg
	II0juA0NJNmg6MTq4X1VLtehslPbb9lM5Sm/XWygAoi/PhR7pFPSceHXskHH+BcIJGFcoiCZYsd
	koRnLJ+XSqpvyQYXmFrj+3y0KCMQ0E+oJLNBZpeMqCL7OFu+hCNCLnS2w/EAU2EdJEQrX/UQkdW
	BxjMys1NBKE3HhDhL04vUqJLPxBxqgAXCK/M1bGUllhBFdPZ6TqoW5j3eUZuqFZLytyuKws0V7f
	xLPoHZNow=
X-Google-Smtp-Source: AGHT+IEyPyVNHU15X/9SEv5YwCwUqcMdULbe/+3n/6tSGW3fnVcq2KFtwj46G+RGpOPEHGlnnmeLTQ==
X-Received: by 2002:a17:907:6d29:b0:af9:467d:abc0 with SMTP id a640c23a62f3a-afcdc3349admr104408366b.50.1755247069043;
        Fri, 15 Aug 2025 01:37:49 -0700 (PDT)
Message-ID: <5c608ebc-e9c2-47ea-a98f-246f7a3d4c30@suse.com>
Date: Fri, 15 Aug 2025 10:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/22] x86/traps: Introduce opt_fred
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-16-andrew.cooper3@citrix.com>
 <0a6b6fce-2cc8-4933-8703-399e4a4fdad6@suse.com>
 <8adbd032-9da2-481d-8d98-30c9a605ec46@citrix.com>
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
In-Reply-To: <8adbd032-9da2-481d-8d98-30c9a605ec46@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 21:16, Andrew Cooper wrote:
> On 14/08/2025 2:30 pm, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> ... disabled by default.  There is a lot of work before FRED can be enabled by
>>> default.
>>>
>>> One part of FRED, the LKGS (Load Kernel GS) instruction, is enumerated
>>> separately but is mandatory as FRED disallows the SWAPGS instruction.
>>> Therefore, both CPUID bits must be checked.
>> See my (further) reply to patch 13 - I think FRED simply ought to depend on
>> LKGS.
>>
>>> @@ -20,6 +22,9 @@ unsigned int __ro_after_init ler_msr;
>>>  static bool __initdata opt_ler;
>>>  boolean_param("ler", opt_ler);
>>>  
>>> +int8_t __ro_after_init opt_fred = 0; /* -1 when supported. */
>> I'm a little puzzled by the comment? DYM "once default-enabled"?
> 
> Well, I have this temporary patch
> https://gitlab.com/xen-project/hardware/xen-staging/-/commit/70ef6a1178a411a29b7b1745a1112e267ffb6245
> that will turn into a real patch when we enable FRED by default.
> 
> As much as anything else, it was just a TODO.
> 
> 
>>  Then ...
>>
>>> @@ -305,6 +310,32 @@ void __init traps_init(void)
>>>      /* Replace early pagefault with real pagefault handler. */
>>>      _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
>>>  
>>> +    if ( !cpu_has_fred || !cpu_has_lkgs )
>>> +    {
>>> +        if ( opt_fred )
>> ... this won't work anymore once the initializer is changed.
> 
> Hmm yes.  That wants to be an == 1 check.  Fixed.
> 
>>
>>> +            printk(XENLOG_WARNING "FRED not available, ignoring\n");
>>> +        opt_fred = false;
>> Better use 0 here?
>>
>>> +    }
>>> +
>>> +    if ( opt_fred == -1 )
>>> +        opt_fred = !pv_shim;
>> Imo it would be better to have the initializer be -1 right away, and comment
>> out the "!pv_shim" here, until we mean it to be default-enabled.
> 
> It cannot be -1, or Xen will fail spectacularly on any FRED capable
> hardware.  Setting to -1 is the point at which FRED becomes security
> supported.

I guess I'm not following: If it was -1, and if the code here was

    if ( opt_fred < 0 )
        opt_fred = 0 /* !pv_shim */;

why would things "fail spectacularly" unless someone passed "fred" on
the command line?

Jan

