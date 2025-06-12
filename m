Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88738AD686B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012393.1390829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPbwY-000624-VZ; Thu, 12 Jun 2025 07:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012393.1390829; Thu, 12 Jun 2025 07:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPbwY-00060Q-Sp; Thu, 12 Jun 2025 07:01:46 +0000
Received: by outflank-mailman (input) for mailman id 1012393;
 Thu, 12 Jun 2025 07:01:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPbwX-0005RB-5m
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:01:45 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18b2a918-475b-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:01:43 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so546638f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:01:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e71a2c7sm6881165ad.238.2025.06.12.00.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 00:01:40 -0700 (PDT)
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
X-Inumbo-ID: 18b2a918-475b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749711702; x=1750316502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3SzzgRwG19cOL5AnREHIrYN7mthTv93pvaXrzSKkzXU=;
        b=dQxSQqyCvJCO2asnaRrSKbpnZuPrqqv2WPWbr4BwWoRwI2bZKoWQOjowbRDpkL54dh
         ju5ick5DRd3wJqJo+Jb4Y07qTPHTe5XDpJPSMVuZ0p4qPVeMTtU1QTk15cGhX4SG/7FO
         F9d83ubF++Kw55XKgMXoNk3AYpg2evP6ArR8gUbOZvWi0AnIeWh6ZM5ahieayCd6rKM7
         Kc/pS2BrqOUtJkA0tnpLVfwXMBa17HHKLnarB3xxVMiK/UvFNSUGRlU5UYvH2YiapzRJ
         nod2Y4SJPx/bSucACCUcSxGhxuPdM8VVyLC4TwIO0ipEMPaSSfvDSJjw9rAEgee3JWAc
         7ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711702; x=1750316502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SzzgRwG19cOL5AnREHIrYN7mthTv93pvaXrzSKkzXU=;
        b=qaRQNQp8n0kspqtTihGg2mjxvOfTLwZke5Aqx/xA97Cs2fvc3XQjUkzG2knfmoZwAm
         nJ5NfGiNlW1kasPUZ1Z+xmazfHx/RMsYqJN3s/USK7ZuXoEDWn/eFbm9LwMzcA2ichjA
         5ZWwCWTOIyxJ5g3lERy0pMbkBn1dBwkFO9/ugawk+LiHwnqHTZEfD4RcQd60B7T5fljd
         nBydXaVBK8YD4EIgF6KRsg5YOR4fJ08Q52bbsyTmzL1teyrDkAXzx0knQoN58TatkI3F
         LcXpR0Qxy/nhwxbDVp2X0Ik9evRC7vqDEpLhEBvIBdO0vbMMqMLODhmEw9iowjPGwKEn
         Mv8A==
X-Forwarded-Encrypted: i=1; AJvYcCUYdyjTxWPK5HeehTx/XD+hUe5THgNIPT6niJUybITH8IpMLTPlsSvD5DHFgW2rISCc4T/tBr8aCqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMzvxw4mTnGdu/uxEWCrQi7UiAowy6e+0iD9tn4EjLKvw6Xnn6
	+muZU2h/GAymmHMu4EO2t5HDJjXYeEH5JPOkfCw+PJ0HjqfLtD5JGktorFu4G7yt6Q==
X-Gm-Gg: ASbGncs7qUVFGDV0C8ho4WKaQeklf3G9DOhMOXHyg+OYcdU9Fs3PDrAXB5GFmQGma7G
	CLiFlnUXB823zcjuJQCydCANN27f0+G2Dyp10tnHCC3mTFCJkDvPM4vr8QLWL3H86X/HS3iCNA0
	NUgJZQS58kiUg/ULgfXH7A5LDJtfnilGY4mcbqh6jXeoILrCRtpaB0m04kWPa+/s2aMM9lFl5GK
	D2EZ7Imv7cwFf7PW4670maTzZwbjXLKqtesr6FmD8Ch0/F0Hl3SfPO+6O8tmc52KIiZxHhBkynu
	7nMuXzkfnTCllF24Ss3/AjSbZ81hi+JkMTMun9I39xWiPq1hE1A4g4VfLrIvGqIXFCpTEorsYrV
	4+U4syDwLXNYgWjPzqWzm1iMYB1rblAbqEtWlU8NORY37EnA=
X-Google-Smtp-Source: AGHT+IFe3iP75njw67ihFIhTDnUtvlZTuG/xmJQXBANevKtMkHsaqli3IV6JYTVzxHGmD/Lj/HGlFg==
X-Received: by 2002:a05:6000:2889:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a5612db2a2mr1208226f8f.32.1749711701967;
        Thu, 12 Jun 2025 00:01:41 -0700 (PDT)
Message-ID: <b692d934-7f0a-427d-99df-2404662333eb@suse.com>
Date: Thu, 12 Jun 2025 09:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-4-Penny.Zheng@amd.com>
 <1a73c720-012a-4795-9f47-f9c23b643de1@suse.com>
 <DM4PR12MB8451B5CBFD6D9DCDDB7040DEE174A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451B5CBFD6D9DCDDB7040DEE174A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 06:09, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, June 10, 2025 9:01 PM
>>
>> On 28.05.2025 11:16, Penny Zheng wrote:
>>> Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
>>> equivalent "if !...") in Kconfig file, since negative dependancy will
>>> badly affect allyesconfig. To make sure unchanging produced config
>>> file based on "pvshim_defconfig", we shall explicitly state according
>>> Kconfig is not set
>>>
>>> Add "default y" for SHADOW_PAGING and TBOOT, otherwise we will have
>>> unset values when running make defconfig based on "x86_64_defconfig".
>>
>> I fear I don't understand this, perhaps related to me also not seeing how ...
> 
> If we just removed "default !PV_SHIM_EXCLUSIVE", .config file generated by "make defconfig"
> will change, having unsetting values for SHADOW_PAGING (# CONFIG_SHADOW_PAGING is not set)
> If changing it to "default y" is too casual, maybe we shall add "CONFIG_ SHADOW_PAGING=y" in x86_64_defconfig,
> to at least retain consistent .config file.
> My fault, Only considering "SHADOW_PAGING" is enough, as TBOOT depends on UNSUPPORTED firstly
> 
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -143,7 +143,7 @@ config XEN_IBT
>>>
>>>  config SHADOW_PAGING
>>>     bool "Shadow Paging"
>>> -   default !PV_SHIM_EXCLUSIVE
>>> +   default y
>>>     depends on PV || HVM
>>>     help
>>>
>>> @@ -175,7 +175,7 @@ config BIGMEM
>>>  config TBOOT
>>>     bool "Xen tboot support (UNSUPPORTED)"
>>>     depends on INTEL && UNSUPPORTED
>>> -   default !PV_SHIM_EXCLUSIVE
>>> +   default y
>>>     select CRYPTO
>>>     help
>>>       Allows support for Trusted Boot using the Intel(R) Trusted
>>> Execution
>>
>> ... these two fit with title and description. The justification for removing
>> the !PV_SHIM_EXCLUSIVE here is not "breaks allyesconfig".
> 
> Hmmm, it is the consequence of "removing the !PV_SHIM_EXCLUSIVE"
> Maybe I shall add more explanation in commit message?

Just to clarify - my questions here were about the changes altogether, i.e.:
Why are these two change - as a whole - needed, given the subject? And just
to try to avoid any misunderstanding: My point is that "depends on ..." and
"default ..." are different things, when the commit message discusses only
the former. So yes, extending the commit message may be one way to address
my remarks. But really I think changes to defaults (if needed at all) would
better be separate from changes to "depends on ...".

>>> --- a/xen/arch/x86/configs/pvshim_defconfig
>>> +++ b/xen/arch/x86/configs/pvshim_defconfig
>>> @@ -26,3 +26,8 @@ CONFIG_EXPERT=y
>>>  # CONFIG_INTEL_IOMMU is not set
>>>  # CONFIG_DEBUG is not set
>>>  # CONFIG_GDBSX is not set
>>> +# CONFIG_SHADOW_PAGING is not set
>>> +# CONFIG_TBOOT is not set
>>> +# HYPERV_HYPERV_GUEST is not set
>>
>> This one doesn't look right, simply by its name.
>>
>>> +# CONFIG_HVM is not set
>>> +# CONFIG_VGA is not set
>>
>> Just to mention it - I'm unsure whether adding such at the end isn't going to cause
>> issues. But maybe I'm paranoid ...
>>
> 
> It could be too casual..
> I will only leave VGA here, as we're sure that with removing "!PV_SHIM_EXCLUSIVE",
> CONFIG_VGA is setting as y in pvshim_defconfig

I don't follow: Why would a shim need VGA support compiled in?

>>> --- a/xen/drivers/video/Kconfig
>>> +++ b/xen/drivers/video/Kconfig
>>> @@ -3,10 +3,10 @@ config VIDEO
>>>     bool
>>>
>>>  config VGA
>>> -   bool "VGA support" if !PV_SHIM_EXCLUSIVE
>>> +   bool "VGA support"
>>>     select VIDEO
>>>     depends on X86
>>> -   default y if !PV_SHIM_EXCLUSIVE
>>> +   default y
>>>     help
>>>       Enable VGA output for the Xen hypervisor.
>>
>> Like above, this change also doesn't really fit with title and description.
> 
> I have added " (also the functionally equivalent "if !...") " in commit message to also
> cover above change

Well. There are multiple uses of "if ...". The one matching "depends on ..." is
covered in the description, yes. But the two uses here don't fall in this same
group. One is a prompt visibility change, and the other is a change to yet
another default. See above for my recommendation (to split things properly).

Jan

