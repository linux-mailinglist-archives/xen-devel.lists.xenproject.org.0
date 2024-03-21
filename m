Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0864885750
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696298.1087127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFVH-0005b3-G4; Thu, 21 Mar 2024 10:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696298.1087127; Thu, 21 Mar 2024 10:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFVH-0005ZP-CW; Thu, 21 Mar 2024 10:18:31 +0000
Received: by outflank-mailman (input) for mailman id 696298;
 Thu, 21 Mar 2024 10:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnFVG-0005Z6-2u
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:18:30 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5be6351a-e76c-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 11:18:28 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso316917966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 03:18:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lg21-20020a170906f89500b00a46cc25b550sm4012866ejb.5.2024.03.21.03.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 03:18:26 -0700 (PDT)
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
X-Inumbo-ID: 5be6351a-e76c-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711016307; x=1711621107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiWCV8tVWxNCerrDRbBLR5n2ELqhTqhTtlciIkOJnzg=;
        b=RZWrbazLFUPzi6rdDrtOVbODtcmERMeb7IHmhEltpfC9JaOQvAEaCM3I6nQoO2dvFi
         +aXhXqMmpoYfGrlDxWV6D+mgw8j7Job5G6bzy5iAq7ewxa+SbmB5vOUihOmy/9BEqHef
         cobzlxFxVnPnTCpaQuRmrJz2GRWfywf6TSpWfUu+swjzaOzUk1sMqu/mfbCgDNgWCyjJ
         +6XD5sd0wdpvbRBWfld4BOMxi6QfPBfzuCzsRew3R2OurmQz63fA81v8SCDYdg9Eh3e5
         SlR3PlIjCO+rQdK3mq88i78ZhgwToYlsNQC5knkeLbIyR0mPePk/PKLOzfvdLvvcEO1J
         pRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016307; x=1711621107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiWCV8tVWxNCerrDRbBLR5n2ELqhTqhTtlciIkOJnzg=;
        b=SzUZSbYvsSYUkDmxP15mG+p4BRe9xnydqmW0fbNuxFqOEy6VkrwliZRF/zCkyp7uJl
         OfGE7CrFFUmdM2qXnRDVQ1WKsz8I5Fd+/qk9HqY+0WInN3H4gV7qqvy5KhBJwmN8W8ZD
         mZsBVRPSHy6Todo6LSe0wDM0szlXeXRhkLxGUU3Y0sjCRpxwXoWXCyvQd3JZHyAN6XX3
         eirrnCNMvxpasZano2oxEmlujtNYVV9WF8s8ZNGGY/XiCRgBEpgS/MuPSK5dKUt1tehW
         Fy2vcIRYV1DxbdXLg/PeBWgO/UYQVobMSbu8MKbseU8opArw+id1fqrXHBhYz2bMTahu
         BJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCV1xcTm7yp77qqIvG8sugw5NoXh22eC7JC4MQOXDT5n+ybtUGuCJn8+ECUrz/myA23wApB5kFzy9m/aS3zwds3OYCOVYI2tMMVMjagFn+k=
X-Gm-Message-State: AOJu0YyzjmqILpKvI0J7uiHU/Lkyt7ySdZ5RhocB7Edh3RM1Z57KbBr0
	qSBJ5V7UKWhxyMUTTVXF/UsVMC7/STBPp95bk7JSJ3kMp9bJnZkpErYpwKGdgPBWoQ9DZRxDwOA
	=
X-Google-Smtp-Source: AGHT+IHURNlhYI9sevEiBZd+FNrKqtyMa+CjSO0pGFlbIFotIgZ1/xjkMMK1BI2UN2JHggsYc8mFnw==
X-Received: by 2002:a17:907:9952:b0:a46:d04b:66e7 with SMTP id kl18-20020a170907995200b00a46d04b66e7mr1880034ejc.25.1711016307549;
        Thu, 21 Mar 2024 03:18:27 -0700 (PDT)
Message-ID: <da5a9f49-90af-43a8-acf9-447c52af75df@suse.com>
Date: Thu, 21 Mar 2024 11:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com> <ZfsPAj-ggY6unQef@macbook>
 <4cc5d746-a50c-4819-a56e-512abf797ef2@suse.com> <Zfv5k8jt0k7QHFxM@macbook>
 <c0aa957a-8a19-4fda-ae04-ce962fde6767@suse.com> <ZfwEmVmNmF-TOdxe@macbook>
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
In-Reply-To: <ZfwEmVmNmF-TOdxe@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2024 10:57, Roger Pau Monné wrote:
> On Thu, Mar 21, 2024 at 10:17:25AM +0100, Jan Beulich wrote:
>> On 21.03.2024 10:10, Roger Pau Monné wrote:
>>> On Thu, Mar 21, 2024 at 09:07:10AM +0100, Jan Beulich wrote:
>>>> On 20.03.2024 17:29, Roger Pau Monné wrote:
>>>>> On Wed, Mar 20, 2024 at 04:09:33PM +0100, Jan Beulich wrote:
>>>>>> On 20.03.2024 14:57, Roger Pau Monne wrote:
>>>>>>> There's no reason to force HVM guests to have a valid vcpu_info area when
>>>>>>> initializing a vCPU, as the vCPU can also be brought online using the local
>>>>>>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
>>>>>>> of the bring up.  Note an HVM vCPU can operate normally without making use of
>>>>>>> vcpu_info.
>>>>>>
>>>>>> While I'd agree if you started with "There's no real need to force ...", I
>>>>>> still think there is a reason: If one wants to use paravirt interfaces (i.e.
>>>>>> hypercalls), they would better do so consistently. After all there's also
>>>>>> no need to use VCPUOP_initialise, yet you're not disabling its use.
>>>>>>
>>>>>> As said in reply to Andrew's reply, besides acting as a sentinel that
>>>>>> structure instance also acts as a sink for Xen accesses to a vCPU's
>>>>>> vcpu_info. By removing the check, you switch that from being a safeguard to
>>>>>> being something that actually has to be expected to be accessed. Unless
>>>>>> you've audited all uses to prove that no such access exists.
>>>>>
>>>>> I'm kind of lost in this last paragraph, how is that different than
>>>>> what currently happens when an HVM vCPU >= 32 is brought up using the
>>>>> lapic and has no vpcu_info mapped?
>>>>
>>>> I think this aspect was simply missed back at the time. And I think it
>>>> wants mentioning explicitly to justify the change.
>>>
>>> OK, I can add to the commit message:
>>>
>>> "Note an HVM vCPU can operate normally without making use of
>>> vcpu_info, and in fact does so when brought up from the local APIC."
>>
>> I'd be fine adding this (or having this added) while committing.
>>
>>>> As said in reply to Andrew, I don't think the dummy structure can be got
>>>> rid of. Nor can the checks here be (easily) removed altogether, i.e. your
>>>> change cannot (easily) be extended to PV as well. Even conditional removal
>>>> of the structure in !PV builds would first require all vcpu_info accesses
>>>> to gain a suitable conditional. Which may be undesirable, as some of these
>>>> may be deemed fast paths.
>>>
>>> I didn't intended to do this here, as replied to Andrew.  If we want
>>> to get rid of the check for PV also it needs to be done in a different
>>> patch, and with a different justification and analysis.
>>>
>>>>> Also, from a quick look it seems like sites do check whether vcpu_info
>>>>> == dummy_vcpu_info, otherwise we would already be in trouble.
>>>>
>>>> Such checks exist in code managing vcpu_info, but not - afaics - in places
>>>> actually accessing it.
> 
> Is there anything else that needs adjusting then, or are you happy to
> pick this up and adjust the commit message?

I'll pick this up and adjust (unless Andrew beats me).

Jan

