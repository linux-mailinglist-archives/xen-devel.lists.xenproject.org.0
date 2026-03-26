Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGCfDmzyxGnv5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:46:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35FF331960
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:46:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263511.1555422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gLc-0001dg-Eo; Thu, 26 Mar 2026 08:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263511.1555422; Thu, 26 Mar 2026 08:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gLc-0001bR-CA; Thu, 26 Mar 2026 08:45:48 +0000
Received: by outflank-mailman (input) for mailman id 1263511;
 Thu, 26 Mar 2026 08:45:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5gLb-0001bL-03
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:45:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5gLa-008fyN-C7
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:45:46 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4f232-e002-0a2a0a5209dd-0a2a450cd698-28
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:45:46 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4f239-f93d-0a2a450c0019-d155dd32e42a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:45:45 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so407007f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 01:45:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919e722dsm5824472f8f.35.2026.03.26.01.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 01:45:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774514745; x=1775119545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OK6kAUOsV5F4+1Xd/60jF2be9L/gHqBtwrdyMSriVKI=;
        b=F9uv4O07gUA+hVQN9sX2s7ndjBmYqUZazXq1/YQjX+mPJmVvq5/ILUvyLJUMmPZez/
         tDtFCAjo24qOp3rDVoxA3U4PWr2aOQkVwfu/z2Y+e9loUuhfSjXJpkYZF9XXPMojqp61
         Lq30de18z30gECOo84va+YGSg4ApXdmoJIlKkP9D/mPscwv6GBHkAAOParlmk7qms3Oc
         x4KK0GN+zKtclNBUXFGifoguXTDYuM9FnLIkoWN9ZMyPowJL5IUTg7REJwkDwR6MDaHp
         WDqsTbLB5Wgd3QrGwXP9fzT7qM+oeaMLM9ZcylPofyaWnbiJn2+lHWMMdJN1MkK7dYoX
         uTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514745; x=1775119545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OK6kAUOsV5F4+1Xd/60jF2be9L/gHqBtwrdyMSriVKI=;
        b=gZzVY04lgDQqOY7E2kJ4zo7cY1d6S9cwAifVkhx3lhpcS1PWw0nc2DK8RjVoqAzVz1
         FVKLaedFuXAod/65mDPaEGvCLcrBnW4cASdx2xGZebqyDAtabqg6/ndUYwW0llPuqAYX
         uHtbJZw4Grv9unez6TUSJRtN8q4D+n2ikVPwqr6ss7nnuWd3ZYcO+9BDkurqLoswSrjr
         OzUxc1h9Ap1Ikr7ppoAR6TTzjELiVZu7r924seXCSL1zjts7udW7B2nNe3ec8BUuuILi
         ZxIXTK7HfAl3po8vUA9I3x1iXZhu7Jlbjwg1fHFIN6nAyMWNgC/m/2DvYL3AFG1wokF7
         jqLw==
X-Forwarded-Encrypted: i=1; AJvYcCWJSpmmjv2Ex4L6y4Ztjmud9MI2vyb13QQ/AY0Eg0AcKw6FoJrJISkvdPwmv+nzWphowhwhcS9kYJo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxmg+4Cry0ZroaPCoW9pPs2ew7954Xb+Od1cYTE14uR4Px7WjQ4
	Rg7Nkm0cjUFwhxd4w4HIK+ALPLRRhM0db7eTk74cJciehxLOTmvQ6dJj2qawtrQybA==
X-Gm-Gg: ATEYQzxsZEA02TIIvyqsD0GsLhNruqXpDml3zRCiSs5+vEvRNpOqoYSYkf2zcLyUz+q
	6ZFHTYQMbJhRwIhxdoXoavMIuezUr6Xx8lUZpyCSR6a1DNUlp2XOy0mn7fjzBr9RvehSQMcUICR
	a7RSCw0AMUfyX5qF09uiYzUlOLEPczw9JhtxtmUjvkCOXnGeHFq4A1Ucm8J/fJ8SZYfeAO3qGmt
	AREX3J5NFztQcvdYqP3DK/FhulaIieXbxndIPIjhuk6Ufqdduop1tq78doltrzE6IEFSpghGLjE
	9LnN7ta9MAuHCho/gS5jFYwkCjZ4fg58IeoJvLEv1SysetAtXANgJSnxnjECLS56K9ibynRu+XS
	vQhmdvQqOQwpIwwi62Lr6qOG0Y0712TYelo7xw/LyWUqw5BkdOq2NwnWGrH+WUP5NdXOY1TVLsO
	gHsmHNKAd0tXIjqsEpU82dPcY9MWMy8XvCokIXhqoK5Ry8MjkpwujATNhNhaagyrJtv9S4JDu/z
	S4llE1jMdvfZ/A=
X-Received: by 2002:a05:6000:220b:b0:43b:43ae:8c25 with SMTP id ffacd0b85a97d-43b88a44842mr10137377f8f.52.1774514744853;
        Thu, 26 Mar 2026 01:45:44 -0700 (PDT)
Message-ID: <11c0a822-afc7-4e3d-b6f5-ef8e32bd2f0f@suse.com>
Date: Thu, 26 Mar 2026 09:45:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status
 reporting
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 sarkarsoumyajyoti23@gmail.com, xen-devel@lists.xenproject.org
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
 <20260324123312.11076-3-soumyajyotisarkar23@gmail.com>
 <751e1d3e-d95a-4129-8baa-450a53d15efa@suse.com> <acQADhcNzkVBm3C3@mail-itl>
 <5e121a98-fcd1-4d20-aa6c-a02af7f7eef4@suse.com> <acQF5Kd4kZzo3BN6@mail-itl>
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
In-Reply-To: <acQF5Kd4kZzo3BN6@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774514745-6D2B9734-953399DA/0/0
X-purgate-type: clean
X-purgate-size: 3564
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,apertussolutions.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A35FF331960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 16:57, Marek Marczykowski-Górecki wrote:
> On Wed, Mar 25, 2026 at 04:44:15PM +0100, Jan Beulich wrote:
>> On 25.03.2026 16:32, Marek Marczykowski-Górecki wrote:
>>> On Wed, Mar 25, 2026 at 04:16:25PM +0100, Jan Beulich wrote:
>>>> On 24.03.2026 13:33, Soumyajyotii Ssarkar wrote:
>>>>> @@ -327,6 +328,11 @@ static int __init cf_check acpi_parse_hpet(struct acpi_table_header *table)
>>>>>  	return 0;
>>>>>  }
>>>>>
>>>>> +/*
>>>>> + * Invalidate BGRT if image is in conventional RAM (preservation failed).
>>>>> + * If preservation succeeded, image is in EfiACPIReclaimMemory, which
>>>>> + * won't match RAM_TYPE_CONVENTIONAL check, so table remains valid.
>>>>> + */
>>>>>  static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_header *table)
>>>>>  {
>>>>>  	struct acpi_table_bgrt *bgrt_tbl =
>>>>> @@ -754,5 +760,7 @@ int __init acpi_boot_init(void)
>>>>>
>>>>>  	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);
>>>>>
>>>>> +	efi_bgrt_status_info();
>>>>> +
>>>>>  	return 0;
>>>>>  }
>>>>
>>>> Does this really need doing from here? If you called it ...
>>>>
>>>>> --- a/xen/common/efi/boot.c
>>>>> +++ b/xen/common/efi/boot.c
>>>>> @@ -1911,6 +1911,22 @@ static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emf
>>>>>      return true;
>>>>>  }
>>>>>
>>>>> +void __init efi_bgrt_status_info(void)
>>>>> +{
>>>>> +    if ( !efi_enabled(EFI_BOOT) )
>>>>> +        return;
>>>>> +
>>>>> +    if ( bgrt_info.preserved )
>>>>> +    {
>>>>> +        printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
>>>>> +               bgrt_info.size / 1024);
>>>>> +        printk(XENLOG_INFO "EFI: BGRT relocated from %p to %p\n",
>>>>> +               bgrt_info.old_addr, bgrt_info.new_addr);
>>>>> +    }
>>>>> +    else if ( bgrt_info.failure_reason[0] )
>>>>> +        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
>>>>> +               bgrt_info.failure_reason);
>>>>> +}
>>>>>
>>>>>  void __init efi_init_memory(void)
>>>>>  {
>>>>
>>>> ... out of this function, it could be static and no stub (misplaced in
>>>> the earlier patch) would be needed either.
>>>
>>> It was here before, and I complained about it, because it printed the
>>> invalidation reason way later than the actual invalidation.
>>
>> Sadly now I complain about this call out of acpi_boot_init(). What's wrong
>> with logging the BGRT stuff together with the memory map?
> 
> If you try to diagnose what went wrong with BGRT, that's not very
> intuitive to find - for example on my system it's 32 messages later.

Simply grep the log for BGRT?

> It's even worse if system happens to crash between those two points.

Hmm, perhaps.

> IMO it makes sense to log reason for BGRT invalidation together with
> the actual invalidation (message). I would be okay with moving it before
> the actual invalidation, but I don't think there is a place like this in
> xen/common/efi/boot.c (at a point where normal printk can be used already).

I guess what you really mean is printk() output actually going out (i.e.
not just to the ring buffer).

While still requiring the function to be extern (and there to be a stub),
how about adding the call much earlier in __start_xen, in here:

    else if ( efi_enabled(EFI_BOOT) )
        memmap_type = "EFI";

? Or alternatively anywhere between setting system_state to SYS_STATE_boot
and the call to acpi_boot_init()? Or re-using the other EFI_BOOT check that
we have in __start_xen()?

Jan

