Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2A85D0E5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 08:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683818.1063443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgjM-0001Bz-Jk; Wed, 21 Feb 2024 07:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683818.1063443; Wed, 21 Feb 2024 07:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgjM-00019y-Gq; Wed, 21 Feb 2024 07:09:24 +0000
Received: by outflank-mailman (input) for mailman id 683818;
 Wed, 21 Feb 2024 07:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcgjL-00019P-I2
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 07:09:23 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21f17d81-d088-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 08:09:20 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3e891b5e4eso333104166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 23:09:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tz3-20020a170907c78300b00a3e0b7e7217sm4571618ejc.48.2024.02.20.23.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 23:09:19 -0800 (PST)
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
X-Inumbo-ID: 21f17d81-d088-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708499359; x=1709104159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJduH8fD1eLpHOA380mFlZlKNFPfToyyPfK1YmR13nE=;
        b=Kf8PIHnBh3IIx3RCfXKvgtUELvsDeyIv0J7jVcvhxvbfjX5AtnGLlBzE0YDyGKLB+f
         ZBa+QVR9E5UyIg+ZYvhkNCHhrOKHpw9q804iFJtG+/1B8ZMkbG6g4OUBX20PnKvRWARg
         2/GI6uGFhwOK3qwWSLp/g+LnV2jpHBsJz93j0SmGlFG3Z5u4O2bKIw8asHDqey69VlfC
         /rmZ89Ixi2B6kTiZyrGDKs/66QiAGIJtRIiU7/XVe+mZS+xMYhwSwTZcViwTZe/sFvk/
         FriFUKGBhAbk/FMMlaRWJsz6suwtMOGP0cEbOatt1f/5jErn7MrTNg9oT2dOAmu8ErHo
         kfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499359; x=1709104159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJduH8fD1eLpHOA380mFlZlKNFPfToyyPfK1YmR13nE=;
        b=hSHy5CFYPvP17rBVybXcR8BVme9H0ivyOAnnF/1FwG6f4nmGhCjimLCClEq5wxfrST
         73yEk0gcVis8Taq84SoZIfCapB1zcYIfRmPnr90OqBNbYITvNBCFDbAAKZBwocht2TFb
         zbTvplEulrraL9ddl6CFnyovNNkcsSaFES75tiiHZIofolPEsBYMPXNbtB7qBhwRXk1M
         hPiKM466wd81I7VEpow7yTMNirG2YPFrtQrVjkybNQjCdM/oCI/KVogNSC2Qrj26PRng
         /fQUb65DDaO1vLu2Q/AON5hmXTIwXSLByxdeH8gxPduoHF9w13vanxy4MJ3YyFS/Pqd2
         t0ng==
X-Forwarded-Encrypted: i=1; AJvYcCWZUjKLhCuQ0+ce6Ku6EFBg7T8FzqTEp1eX9Vp/O/HzolbA2dWyDkL0Xj7LApiz8f+WJoadKVRrhugxQ/v9xxSwctMj4seWqHCOOGSuJgg=
X-Gm-Message-State: AOJu0YxLy/z8E/8tUIKW2cOHJ5c8Q7D41qcodb5vNFKw0xxZGGVhA5T9
	dz4d37fq5xzKX4U7Uu6DBhUCjXbopfqQHiaL2vmiNcnOOkeKCYN1zJVRdppAQQ==
X-Google-Smtp-Source: AGHT+IE8k2jkPTWX+k0kZM2Xv3gZbFg0kL2x6CD392XXuVLw4m3xphkdDt46CMG5FaeYKs7Uzix0MA==
X-Received: by 2002:a17:906:7d4:b0:a3e:cc03:d40e with SMTP id m20-20020a17090607d400b00a3ecc03d40emr4222580ejc.63.1708499359398;
        Tue, 20 Feb 2024 23:09:19 -0800 (PST)
Message-ID: <e7c4b08f-724a-4419-977a-caa1342c47eb@suse.com>
Date: Wed, 21 Feb 2024 08:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
 <20240220121743.3680715-2-ayan.kumar.halder@amd.com>
 <e3a8ce5d-841e-4ff1-8d23-48de822972ef@suse.com>
 <5f526deb-7376-4c34-85d1-d22b1b14d90e@amd.com>
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
In-Reply-To: <5f526deb-7376-4c34-85d1-d22b1b14d90e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2024 16:22, Ayan Kumar Halder wrote:
> On 20/02/2024 12:33, Jan Beulich wrote:
>> On 20.02.2024 13:17, Ayan Kumar Halder wrote:
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -101,6 +101,18 @@ Extension to the GICv3 interrupt controller to support MSI.
>>>   
>>>       Status: Experimental
>>>   
>>> +### ARM/Partial Emulation
>>> +
>>> +Enable partial emulation of registers, otherwise considered unimplemented,
>>> +that would normally trigger a fault injection.
>>> +
>>> +    Status: Supported, with caveats
>>> +
>>> +Bugs allowing the userspace to attack the guest OS will not be considered
>>> +security vulnerabilities.
>>> +
>>> +Bugs that could compromise Xen will be considered security vulnerabilities.
>> ... the odd statement regarding in-guest vulnerabilities that might be
>> introduced. I see only two ways of treating this as supported: Either
>> you simply refuse emulation when the access is from user space,
> 
> I am wondering how do we enforce that.
> 
> Let me try to understand this with the current implementation of partial 
> emulation for system registers.
> 
> 1. DBGDTRTX_EL0 :- I understand that EL0 access to this register will 
> cause a trap to EL2. The reason being MDCR_EL2.TDA == 1.
> 
> In that case, if we refuse emulation then an undef exception is injected 
> to the guest (this is the behavior as of today even without this patch).
> 
> So, are you saying that the undef exception is to be injected to the 
> user space process. This may be possible for Arm64 guests 
> (inject_undef64_exception() needs to be changed).

No, injection is always to the guest, not to a specific entity within the
guest. That ought to be the same on bare hardware: An exception when
raised has an architecturally defined entry point for handling. That'll
typically be kernel code. The handler then figures out whether the source
of the exception was in user or kernel mode. For user mode code, the
kernel may or may not try to handle the exception and then continue the
user mode process. If it can't or doesn't want to handle it, it'll raise
(in UNIX terms) a signal to the process. That signal, in turn, may or may
not be fatal to the process. But such an exception from user mode should
never be fatal to the guest as a whole.

> However for Arm32 guests, this may not be possible as the mode changes 
> to PSR_MODE_UND.

I'm afraid my Arm foo isn't good enough to understand this. On the surface
it looks to violate above outlined principle.

> Let me know if I understood you correctly.
> 
>> or you
>> support that mode of emulation as much as that of kernel space accesses.
> 
> Do you mean we support partial emulation only for traps from EL1 mode ?

Possibly.

Jan

