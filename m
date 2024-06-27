Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A491A176
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 10:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749827.1158066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMkUj-0000xH-SQ; Thu, 27 Jun 2024 08:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749827.1158066; Thu, 27 Jun 2024 08:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMkUj-0000up-PN; Thu, 27 Jun 2024 08:28:41 +0000
Received: by outflank-mailman (input) for mailman id 749827;
 Thu, 27 Jun 2024 08:28:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMkUh-0000tl-TK
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 08:28:39 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40a75380-345f-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 10:28:38 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ee4ae13aabso3670961fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 01:28:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1faac9b3a10sm7703645ad.273.2024.06.27.01.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 01:28:37 -0700 (PDT)
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
X-Inumbo-ID: 40a75380-345f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719476918; x=1720081718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7mcsX5hsBFiWNWVknJQAFiRNCEEw56g6tSMZ7MNIfAY=;
        b=W8RGbq1+/HhZr3g1jS/78L+561zHD7p5ZWNHaWA7kjn1FL1HmnNp+TxwrXZ3erjnKD
         L7Fw400i5SSed3XtY4FzZ2GwVQhs9WMJMvwRkR6Vh0maszGh8laiDWwt3Mhpk8fWZ4bC
         gKNpXAHZ8gMyWPuyGpeMQrDkYz6j2Kjg01N7qOjPXkkYcEPa75jjDRzZfXjFFPHia9lY
         JQPIMXDfkJuobIxzf1RDqo3FZOyhT7P+ia/Rtz9ObtknT0U2agRB1wlGKskU40xsiOOk
         Ewr05LcDoWf/XNncxzpHja78RZfvk+xRsp1Dy+hT99okOgCnprt20GmgzulXCFZHmZpb
         XSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719476918; x=1720081718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mcsX5hsBFiWNWVknJQAFiRNCEEw56g6tSMZ7MNIfAY=;
        b=dVn7w+ivvWAoTs3cVSVvreVYxO+y3Tz/KatvMIdzWZHM4Riv8cYSeWt5tK4cUGpE6I
         Q44uN0eDwWvJakqXFy2IXrRu4cXTJarfdPajfX6CeTwDBztuWMdNYsyDYjMqnqcWxKHr
         UcAI+qniP3EjYknJWi7jIfhX9fare9Gfzxi7XswBXkCsBHIxzlQwQlrnsA5+Z0aWuTGl
         N1BcpLCansxri+Ku+uSq1j6DQs85R5mq8nGxPuZ8pFd4vxcaL6jg6FFFywP7lFTupBxX
         jb9UC+kCqmaIj3s+NjWEAQsv8FXbXsCQ+5xwVGmdoAG5tibLMmABriv1yuapdXV4NC9N
         3I3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEXynaenetXRVVfNoa/pSL6V7MG5bIxGcygZOfgKonC+nuIEe9YbLgJZCdRpAYKIkFaIWzaI9+z7mfjNrw3T/LhU8VPMoheB8X688wVwM=
X-Gm-Message-State: AOJu0YzXx7TqUtcez0zcEPKMf/Y1yZ1Qx3pUdpbO3P0qIeCleDJD4VDB
	8TpO0+x88oUJd5EpYG3awxY2NDcyYZUGtT5hxD+sbbm6IK1MhoPxGWEwyF/Gzua83m6auafD8bc
	=
X-Google-Smtp-Source: AGHT+IFlqabrGF5vGH+rKcahRGJb+Z0eVr+QuRkJ9jVRzJP8ux0/qAkVkyi9JqDVJxFUsdeetJKmIQ==
X-Received: by 2002:a2e:96d4:0:b0:2ee:4da5:be67 with SMTP id 38308e7fff4ca-2ee4da5c253mr536801fa.0.1719476917993;
        Thu, 27 Jun 2024 01:28:37 -0700 (PDT)
Message-ID: <c4f0e177-3c2c-47bc-a8a1-e69aff1c3bed@suse.com>
Date: Thu, 27 Jun 2024 10:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] x86/spec-ctrl: Support for SRSO_US_NO and
 SRSO_MSR_FIX
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240619191057.2588693-1-andrew.cooper3@citrix.com>
 <8510895d-70fb-4fce-adfa-ac5638b4ae3c@suse.com>
 <b27d4722-a8d0-4134-bc2e-d2d751a88c10@citrix.com>
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
In-Reply-To: <b27d4722-a8d0-4134-bc2e-d2d751a88c10@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2024 22:20, Andrew Cooper wrote:
> On 20/06/2024 9:39 am, Jan Beulich wrote:
>> On 19.06.2024 21:10, Andrew Cooper wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -2390,7 +2390,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
>>>  >              {ibrs,ibpb,ssbd,psfd,
>>>  >              eager-fpu,l1d-flush,branch-harden,srb-lock,
>>>  >              unpriv-mmio,gds-mit,div-scrub,lock-harden,
>>> ->              bhi-dis-s}=<bool> ]`
>>> +>              bhi-dis-s,bp-spec-reduce}=<bool> ]`
>>>  
>>>  Controls for speculative execution sidechannel mitigations.  By default, Xen
>>>  will pick the most appropriate mitigations based on compiled in support,
>>> @@ -2539,6 +2539,13 @@ boolean can be used to force or prevent Xen from using speculation barriers to
>>>  protect lock critical regions.  This mitigation won't be engaged by default,
>>>  and needs to be explicitly enabled on the command line.
>>>  
>>> +On hardware supporting SRSO_MSR_FIX, the `bp-spec-reduce=` option can be used
>>> +to force or prevent Xen from using MSR_BP_CFG.BP_SPEC_REDUCE to mitigate the
>>> +SRSO (Speculative Return Stack Overflow) vulnerability.
>> Upon my request to add "... against HVM guests" here you replied "Ok.", yet
>> then you didn't make the change? Even a changelog entry says you supposedly
>> added this, so perhaps simply lost in a refresh?
> 
> Yes, and later in the thread you (correctly) pointed out that it's not
> only for HVM guests.
> 
> The PV aspect, discussed in the following sentence, is very relevant and
> makes it not specific to HVM guests.

Hmm, yes, sorry, I apparently lost track of that again.

>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -1009,16 +1009,33 @@ static void cf_check fam17_disable_c6(void *arg)
>>>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>>>  }
>>>  
>>> -static void amd_check_erratum_1485(void)
>>> +static void amd_check_bp_cfg(void)
>>>  {
>>> -	uint64_t val, chickenbit = (1 << 5);
>>> +	uint64_t val, new = 0;
>>>  
>>> -	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x19 || !is_zen4_uarch())
>>> +	/*
>>> +	 * AMD Erratum #1485.  Set bit 5, as instructed.
>>> +	 */
>>> +	if (!cpu_has_hypervisor && boot_cpu_data.x86 == 0x19 && is_zen4_uarch())
>>> +		new |= (1 << 5);
>>> +
>>> +	/*
>>> +	 * On hardware supporting SRSO_MSR_FIX, activate BP_SPEC_REDUCE by
>>> +	 * default.  This lets us do two things:
>>> +         *
>>> +         * 1) Avoid IBPB-on-entry to mitigate SRSO attacks from HVM guests.
>>> +         * 2) Lets us advertise SRSO_US_NO to PV guests.
>>> +	 */
>>> +	if (boot_cpu_has(X86_FEATURE_SRSO_MSR_FIX) && opt_bp_spec_reduce)
>>> +		new |= BP_CFG_SPEC_REDUCE;
>>> +
>>> +	/* Avoid reading BP_CFG if we don't intend to change anything. */
>>> +	if (!new)
>>>  		return;
>>>  
>>>  	rdmsrl(MSR_AMD64_BP_CFG, val);
>>>  
>>> -	if (val & chickenbit)
>>> +	if ((val & new) == new)
>>>  		return;
>> You explained that you want to avoid making this more complex, upon my
>> question towards tweaking this to also deal with us possibly clearing
>> flags. I'm okay with that, but I did ask that you add at least half a
>> sentence to actually clarify this to future readers (which might include
>> myself).
> 
> "I wrote it this way because it is sufficient and simple, but you can
> change it in the future if you really need to" is line noise wherever
> it's written.
> 
> It literally goes without saying, for every line the entire codebase.

Well. Elsewhere we go to the lengths of trying to cover for unexpected
states. So to me this goes beyond "sufficient and simple". But anyway.

>> However, as an unrelated aspect: According to the respective part of the
>> comment you add to  calculate_pv_max_policy(), do we need the IBPB when
>> BP_SPEC_REDUCE is active?
> 
> To what are you referring?

The fact that for HVM the change to ibpb_calculations() results in no
entry-IBPB when we have SRSO_MSR_FIX and opt_bp_spec_reduce is true.
To me the comment you add to calculate_pv_max_policy() suggests a
sufficient similarity. IOW ...

> SRSO is about Return predictions becoming poisoned by other
> predictions.  The best way to mount an SRSO attack is with forged
> near-branch predictions.
> 
> For SRSO safety, we use IBPB to flush the Branch *Type* information from
> the BTB.  Fam17h happened to have this property, but Fam19h needed it
> retrofitting in a microcode update, with the prior "Indirect Branch
> Targets only, explicitly retaining the Branch Type information" being
> retroactively named SBPB.
> 
> This does not interact with the use of IBPB for it's
> architecturally-given purpose.

... why is there an interaction for HVM but not for PV? (Sorry, I'm
apparently lost here to a certain degree.)

Jan

