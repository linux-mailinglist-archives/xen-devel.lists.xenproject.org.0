Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97781C3B94B
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 15:09:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157002.1485935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0gC-0000qG-0o; Thu, 06 Nov 2025 14:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157002.1485935; Thu, 06 Nov 2025 14:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0gB-0000op-UH; Thu, 06 Nov 2025 14:09:35 +0000
Received: by outflank-mailman (input) for mailman id 1157002;
 Thu, 06 Nov 2025 14:09:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vH0gA-0000oj-Up
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 14:09:34 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37cd3204-bb1a-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 15:09:32 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b728a43e410so173495966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 06:09:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7289334264sm218096366b.12.2025.11.06.06.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 06:09:32 -0800 (PST)
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
X-Inumbo-ID: 37cd3204-bb1a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762438172; x=1763042972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3m7r7W+00piqcEHoeftA7E3rCc88l8s7FHXFLVjyRxw=;
        b=ZJ0YDVh3jemU/hkIN9nG7GgOhwqyMavDje68KRtg8o3DoqMQoi0sb8S/S4oTFoXibr
         7uCO/9nK564j6xbI4NDPjGf0JZTkkZ5YlfVYScZP3AJzGatZdWFSbgZxCOOolbSLUIKA
         8kW6cznlGQDKmmF/7Tb7xuR1YTY0GV2szA+Q0aSfMZTkYYTf83s3+LIZhdm1SNNjtYOZ
         URzLgQwNIA/lY4+Ybwecp+vezJDSQJDkUBRHFf+OHVfHyFYqx3bdOloanrqKYdLCnAgO
         vG9DmTS+KPPDvDYrNiyIXAu3XMBuOaas334N1U+TOH3iPg6cQk53OJQWot0seUL/9MZk
         qGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438172; x=1763042972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m7r7W+00piqcEHoeftA7E3rCc88l8s7FHXFLVjyRxw=;
        b=r0JA3mVSjpYr0Gi/rrTQDCFvxGqi7VlFkRXnEXjiE+GmuxZTT0ELth6Y57T6WDYaYa
         lYtbLBgRslarwImZdt0GI3+wxlL9+CL7FG6rdg4bTrANCYKHfauV7UAcKb6HgAm81vXR
         3/tJ4ZsKx2AQzPSL5kYZ+m8YmECCGzwaCNCAl6AxD5RnT9L7CnVE05y8We8jAzq3jGbH
         vI2gu1uPCf3ummOjFMxKaNH9ybLNGbIaO/rXpdYA8EVsPZSBdo/lreMYIQEx2fPiPPBC
         znyVDRkQpShywA8GA88Hn5mrHO7HJcayLbrlMJ/qdkdIXE/LnmiejNqg/xip49vVpydg
         oSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe1ovl1Y+pr5DaV2cnsWrwoDnNVZP2uyCNMITa96cttmx1bfyB/NwQYtyIku3eTPWufY1v8TVCtEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCbBkmbKIWmu1X2301Kaq6L8ydY6d3ng7W5n4scBYQCa+yZ9D0
	1/VzDobkdoDkZOsA+P/rnsaCfrlzrIJZ1FNKCBidTtyZT8zsKhdQ3AcufYrOce6GPg==
X-Gm-Gg: ASbGncvwSvh9ejDItz8pZkbkfmKKJDuA0Ll0PIi4Rrygydfe1D9dC1HpPL/aZ9DlQ/E
	086epq0FKK7lKYnbJKWG545SsSrYupCOaCno7N/nnJfyK2cgm26Vbhtciei4osSy11Y59cBAm30
	utjtmdOwiSqDyhg6DuQAOJaeCYaahPPfoaSi/avDr1C582kTP5d1Spix+ZlBC7kkTW0NL8a3rze
	j62gAXYoBa2GBpXKqPOpivBC6KGENPvVs+9wfeH7jdQX8GcioxnA5uEcpGhLr4xW6Z4OsxxdpRI
	4cGlHHmwtzw9+2RrsH3adMAEEbTI4e+DgQUdn7UZb/DK8Hj0qwF0OUsHTKCOiCQ3VBkpIi/iDn9
	WjLsNpKNt1S10Dqqg6PvtavlF5Y2ciQbDEfNYTb/xJl066YZM6jeLLtPRM+vITooFC59QIkWTOO
	QIM+0ZK2R4xPmV1f9l8O99hhEkOLKk9ETNxP2bhHj2kqMEAnEZ4cNRtjvF1SEBByA2RgDhByCyg
	65l8FGGLw==
X-Google-Smtp-Source: AGHT+IEfTpR471zZPAHEzzJiMTC+fUJMOJF8bhtifyU1LD07AEBTGEEloSAcz5AZ/fhMWf/oABOOHQ==
X-Received: by 2002:a17:907:a0c9:b0:b29:b4ac:d2a8 with SMTP id a640c23a62f3a-b72655ee2e4mr829637966b.57.1762438172291;
        Thu, 06 Nov 2025 06:09:32 -0800 (PST)
Message-ID: <63525e6f-4e17-4155-87b2-47b9ac9ea474@suse.com>
Date: Thu, 6 Nov 2025 15:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen: make VMTRACE support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251031212005.1338212-1-grygorii_strashko@epam.com>
 <b6337cb5-da85-492d-bba9-688e35695c46@suse.com>
 <e55f990a-1781-4651-a899-9d78bbbbdfd0@epam.com>
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
In-Reply-To: <e55f990a-1781-4651-a899-9d78bbbbdfd0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2025 14:50, Grygorii Strashko wrote:
> On 06.11.25 14:00, Jan Beulich wrote:
>> On 31.10.2025 22:20, Grygorii Strashko wrote:
>>> --- a/xen/Kconfig.debug
>>> +++ b/xen/Kconfig.debug
>>> @@ -155,4 +155,19 @@ config DEBUG_INFO
>>>   	  "make install-xen" for installing xen.efi, stripping needs to be
>>>   	  done outside the Xen build environment).
>>>   
>>> +config HAS_VMTRACE
>>> +    bool
>>> +
>>> +config VMTRACE
>>> +    bool "HW VM tracing support"
>>> +    depends on HAS_VMTRACE
>>> +    default y
>>> +    help
>>> +      Enables HW VM tracing support which allows to configure HW processor
>>> +      features (vmtrace_op) to enable capturing information about software
>>> +      execution using dedicated hardware facilities with minimal interference
>>> +      to the software being traced. The trace date can be retrieved using buffer
>>
>> Nit: s/date/data/
>>
>>> +      shared between Xen and domain
>>> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
>>> +
>>
>> I was actually meaning to ask that "VMX only" should somehow be mentioned here,
>> but then I noticed this is an arch-independent location. 
> 
> Right, Arch code advertise VMTRACE support with HAS_VMTRACE.
> In this particular case:
> config INTEL_VMX
> ...
> 	select HAS_VMTRACE
> 
> 
>> I'm not quite sure we want it like this (just yet).
> 
> ?

To rephrase the question: Are we expecting anything other than VMX to support
VMTRACE any time soon?

>>> @@ -738,6 +740,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>>>   bool altp2m_vcpu_emulate_ve(struct vcpu *v);
>>>   #endif /* CONFIG_ALTP2M */
>>>   
>>> +#ifdef CONFIG_VMTRACE
>>>   static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
>>>   {
>>>       if ( hvm_funcs.vmtrace_control )
>>> @@ -780,6 +783,12 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
>>>   
>>>       return -EOPNOTSUPP;
>>>   }
>>> +#else
>>> +static inline int hvm_vmtrace_reset(struct vcpu *v)
>>> +{
>>> +    return 0;
>>> +}
>>> +#endif
>>
>> #ifdef inside the function body please, to reduce redundancy and to reduce the
>> risk of overlooking multiple places which need editing (when e.g. function
>> parameters change).
> 
> All hvm_vmtrace_x() functions are inline - do you mean like below for all of them?
> 
>   static inline int hvm_vmtrace_get_option(
>       struct vcpu *v, uint64_t key, uint64_t *value)
>   {
> +#ifdef CONFIG_VMTRACE
>       if ( hvm_funcs.vmtrace_get_option )
>           return alternative_call(hvm_funcs.vmtrace_get_option, v, key, value);
> +#endif
>   
>       return -EOPNOTSUPP;
>   }

No, the request was for just the single function that you add a 2nd instance of.

Jan

