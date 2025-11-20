Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97119C73C95
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:43:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167070.1493428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM33z-0000AN-Qg; Thu, 20 Nov 2025 11:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167070.1493428; Thu, 20 Nov 2025 11:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM33z-00008E-Nn; Thu, 20 Nov 2025 11:42:59 +0000
Received: by outflank-mailman (input) for mailman id 1167070;
 Thu, 20 Nov 2025 11:42:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM33x-00007d-Ln
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:42:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dc2ca89-c606-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 12:42:55 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b73161849e1so204325966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 03:42:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d7cb3bsm194223966b.27.2025.11.20.03.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 03:42:54 -0800 (PST)
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
X-Inumbo-ID: 0dc2ca89-c606-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763638975; x=1764243775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1A57igL4O38RF4Gnv2kW+vRh9kLGjingSZovSliCfK8=;
        b=VjZ5fPANsnuR719sCxCqdP+ogcaydj7dY9MOIID6WbZRrnj+43O5iNdV7SUUT2pYuB
         1TaPkWbh/RoLL4hK8FrtY0AGGobhNSVMMhtwMISXEle6Y2bWLh9rlYbxo71SKvq53EcN
         B4ngAoEw6CgOu/s9pRFNZ5mvjGrXEqlO1NWnQbAkqq+HZb8fSnT6upo3RBQpkz/Y9n3F
         TSXMqqwZIm53l+On8BSchuJtc5U9hDHpmHcDApZSs8I16OKG9ZaJS3DLLCHqynCea9eF
         OCN7FUZ7lJd0YEM4XRl1Q2R3X25/VozH3yukViYmkPkg0cJfvs42T/YIan/QsqcCWW+S
         XFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638975; x=1764243775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1A57igL4O38RF4Gnv2kW+vRh9kLGjingSZovSliCfK8=;
        b=oGJcLMreArPUOkCtZ+xUTcchfHoqLJ/S5Wji3vkcvjsK6EAFxA6H27WvmUVgfWz9J7
         BrAmtZhi4JDGmXeAZVUOYPyI++d/yOZ+WKa/WlnaTKUnEcHrEoNMbjCzuurR7MlXZcQ7
         EGP2U48sYYPysGgnRBM3lf+j4lD2kTzz2xLwi/w9ehAMo+q2jntGTMwd0zbNOrhohXqv
         p5kxHG+ydL7sgx9+ab4RJFJL1KanKPMfbR/dfFws/ZCub/8pNxm1m6sYq9Mg/uN2w1aq
         YI/k4vknoqWw/VuDHcKXysD0ZmDBs/D/0t1Ed49+AFAGrLUt+xeXzHP0hTuivcaEKqCX
         yZlg==
X-Forwarded-Encrypted: i=1; AJvYcCV18skwJwp1A6lz/toPAr7hduU1FJ7x6ia+R0K3CGxXrO3FzUDclPwjGtUvndbWhk1rMH2FKj8tVqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8sxl9JMpyEvrl3vXPzVgGN026CNz02Vm6X9LAx84vYtwOVxg1
	LNk63Qk4+0uDFoNXdxtYvfNSEQSwCKXif8fewlpS5TccfRPPRrNjAEstHZCbosC5tQ==
X-Gm-Gg: ASbGncvBDgaQy3NjOPvC6M5NzLVr4aLEWlXUq9yu2fo5prVVi8KOCLoy4p/DM0vvJ6w
	XKHwIzN9fMbFyehDU8YU6zg2tX+f/6nSuXvwJlkXbScEKa9Pk4wfoFFj8wzzkgZ4V8pKl2Nk6He
	7xwf7fyD7czyOR8bL8jMwEIV8gV/Ou/OQsbGVQTZx63+VpeoM6/PuD1CaND6LHvOYO5QQuNCDxS
	PeZ1PznTMytmLg2zC8WiZzKWB5V+17rGgrfMbRpc9ri1GK7S14TX+y7EA3Op61cIBL+enPvgJ9n
	S6mxO0Xk9XcSsYYV90xQpWg5SNJOqCPapryYstp0ZL/up48naH48nDD1ND6kGZC9I7UYu7NXeyI
	BTL9LcjFGbVSWDsBlUt4+LZn1Ty6INhap9EMJLkrfibbI5rHxkvP74MUd8bTgTfg3Aff6epWbKe
	EPP2cC+a2gSsqBkp9cMssL6Bz4u4Bm5mI+3kisR0lEv/abqZgMt7WzDJx4R6rQEEjpZotv6eS13
	Kw=
X-Google-Smtp-Source: AGHT+IEOSiVzShk7bcr24H0EOKL7OtQxsVZ5X0aQnfTFEBZzY69CtHeJC9KeMGdEhEDQJtMkhVBYuw==
X-Received: by 2002:a17:907:2d8a:b0:b73:57eb:688 with SMTP id a640c23a62f3a-b7658917b4fmr191201566b.53.1763638974598;
        Thu, 20 Nov 2025 03:42:54 -0800 (PST)
Message-ID: <2de4377e-8746-4fda-b7ed-ca588170c4a1@suse.com>
Date: Thu, 20 Nov 2025 12:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v4] xen: make VMTRACE support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251119193120.1011448-1-grygorii_strashko@epam.com>
 <f354c1cd-c46e-4bd2-98d6-a614029991f7@suse.com>
 <054aaca3-919f-4b9e-bdfe-9bdb40f08388@epam.com>
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
In-Reply-To: <054aaca3-919f-4b9e-bdfe-9bdb40f08388@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2025 11:47, Grygorii Strashko wrote:
> Hi Jan,
> 
> On 20.11.25 10:56, Jan Beulich wrote:
>> On 19.11.2025 20:31, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> The VMTRACE feature is depends on Platform/Arch HW and code support and now
>>> can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
>>> This makes VMTRACE support optional by introducing HVM Kconfig option:
>>> - CONFIG_VMTRACE to enable/disable the feature.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>> changes in v4:
>>> - format changes
>>
>> Just partly, ...
>>
>>> @@ -772,13 +775,24 @@ static inline int hvm_vmtrace_get_option(
>>>   
>>>       return -EOPNOTSUPP;
>>>   }
>>> +#else
>>> +/*
>>> + * Function declaration(s) here are used without definition(s) to make compiler
>>> + * happy when VMTRACE=n, compiler DCE will eliminate unused code.
>>> + */
>>> +int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
>>> +#endif
>>>   
>>>   static inline int hvm_vmtrace_reset(struct vcpu *v)
>>>   {
>>> +#ifdef CONFIG_VMTRACE
>>>       if ( hvm_funcs.vmtrace_reset )
>>>           return alternative_call(hvm_funcs.vmtrace_reset, v);
>>>   
>>>       return -EOPNOTSUPP;
>>> +#else
>>> +    return -EOPNOTSUPP;
>>> +#endif
>>>   }
>>
>> ... the #else wasn't dropped from here. If no need for a v5 arises, I guess
>> I can make the adjustment while committing. But it would be really nice if
>> all earlier comments were taken care of (one way or another) when submitting
>> a new version.
> 
> This is absolutely my miss. Sorry.
> I can resend with fix. Just tell me how will be better for you.

Well, as said above - no need to resend unless another reason for a v5 surfaces.

Jan

