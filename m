Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P8UFr51/GmdQQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 13:21:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A114E75C6
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 13:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302608.1576478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwmM-0000fu-Rp; Thu, 07 May 2026 11:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302608.1576478; Thu, 07 May 2026 11:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwmM-0000cw-OY; Thu, 07 May 2026 11:20:30 +0000
Received: by outflank-mailman (input) for mailman id 1302608;
 Thu, 07 May 2026 11:20:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKwmK-0000cq-Hc
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 11:20:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKwmJ-00CJLn-U8
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 13:20:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc7578-bab6-0a2a0a5309dd-0a2a4509ae02-12
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 13:20:27 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc757b-2497-0a2a45090019-d155802ebccf-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 13:20:27 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso7246265e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 04:20:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e5314b989sm38720495e9.30.2026.05.07.04.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 04:20:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1778152827; x=1778757627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V0BHC5sWxzOvVV+qVf5zA8Y6rh0cAn2fDw3H5C+c93Q=;
        b=EWbn2lCPIkUVCiaocipmuBVLg6wo/dlJDDtTdughZVv2Dyi0lwRuzuRvhpryPiagFH
         CfSQrKwuACAI3s2CTrEKtnoQiRv1sOZjaS9wmMgPr9hSnpYYCWplnGuPnSkG4y1angrz
         hAwdNnT1eOfWfwaokt5fP9UsN2xaXxK6GYpjbKxT3dH7GW0Lq+3lOirQNroQDlKoabzw
         nJpCAh7V6kdnaoEg/a65R9U99wJFD2gSocU28vfxn45aLRnI7qNnD24yb/1cgIntIHMV
         EcXad6rW+B6sEn5Mj5C7oaw7A/FncqxfltoKK554vuj7xMYPqdKeDoXLoaFgSVhj+9Np
         t3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152827; x=1778757627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0BHC5sWxzOvVV+qVf5zA8Y6rh0cAn2fDw3H5C+c93Q=;
        b=na6kwXETfdEjg9nA4oxJIsXoQk9iZ3Hahm0fK3JT/eeo9UydP4ELotfk79XfuUURhA
         v1JQO4KoqhxZxcLAC2fJhVTWugqCGepV2rgbw6L+9EQbZ/MX3PPpr50PDSznGimcm/97
         V5c4E46JqrZ2/dtyDOCOlCeapIkOU8tqIIMLtm3qu7pyiipRTE3SUFDIzBfbIXFT718j
         uUI9QH7yQne3DqF6RyFYMn+bTwbaExjXCKWKiZOMT1CJQFAvE0Nc+5oBmcK3JtgU7IDR
         u8Rus5HH4UNDuH+DK7hBOJuBQkD1XgGE29JQsKMdMxxwgsSBf0F8EFtT4WNfEkoPW9BI
         kBWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IPT+4GpaWuKVtGPZSp/ONO08FwVuGbeEPEginlPzylDYw5PRdTVGVQ3fAwwsA7tna9feK7K9aCuQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHRSFK4fVaXC5mH/3L0pvzZx+oiqPAgiGmp4aoXAaJOJrUcEVw
	C4RLQCJi5tv7u2hqdEiFNtE3ezANzhOn2Co2aGy55Ng60o2ODb/GouL5RIMVWYd3Nw==
X-Gm-Gg: AeBDietiYeSgUCA2LRkxe127JRy7dmpZprgmXGUEsifqMpQO2qXEIVHzHEW2KOJixLF
	Fg5WrKK+4B191PAELx20QlDV+mYVgNgBYwTswvQXJqfp8x4ZRZnJ5UnvTy+IyC7+YWmVKhR1Oi5
	XrisvLwk3izCjxYF9h25vaOwcVXweuTJCD6Hra8Jd3WhC3FQU4mKe/CvFJlp/Eu8fgZ9rMdIvEK
	xyiPUluxjb/pdOdDXjDWrQxiigzvREK/Jxk44QEqLgIS0/58aUe4rHw7zDNZbzx68r/SHfDhfmu
	y55jwOAxaEfIJcTUbkCJNBIWTRiKKO5tEyfiA5T/kgQyT4nb/Ou+iTNBh9NAmgZYzDYcrc02ABn
	UeS8/ZGqyzoJ7V5XNlC4qTvbzzaCdBy96hTQ3k02FU/DgWJG+Pwlz0Tn0WoFEwgU6XiDKAHio15
	vfKGpCIVt6E3a0WvB0i8pvrDMyXIRnr6K82X4+UlOfXUCe8Ay5LySgHh2/G4ZkkzYltmCAKL5Yn
	fD7Q0q9NgJFBgmwRuL1zG/fLQ==
X-Received: by 2002:a05:600c:4345:b0:489:1fa5:997f with SMTP id 5b1f17b1804b1-48e51e1abcdmr66969605e9.9.1778152827135;
        Thu, 07 May 2026 04:20:27 -0700 (PDT)
Message-ID: <6d6f4862-0e57-47f3-a87b-2180c7f8e895@suse.com>
Date: Thu, 7 May 2026 13:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/amd-vi: do not zero IOMMU MMIO region
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260506165157.68567-1-roger.pau@citrix.com>
 <b5d9ea51-5fef-4bae-b124-f4dbde93dbdc@suse.com>
 <afxRZtm-L1ZA8jF1@macbook.local>
 <b0d460d6-5828-41d5-9168-394fb54f80bf@suse.com>
 <afxnq3kXflTvz4P-@macbook.local>
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
In-Reply-To: <afxnq3kXflTvz4P-@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778152827-41969A53-C27FD102/0/0
X-purgate-type: clean
X-purgate-size: 4901
X-Rspamd-Queue-Id: A3A114E75C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07.05.2026 12:21, Roger Pau Monné wrote:
> On Thu, May 07, 2026 at 10:51:18AM +0200, Jan Beulich wrote:
>> On 07.05.2026 10:46, Roger Pau Monné wrote:
>>> On Thu, May 07, 2026 at 10:03:05AM +0200, Jan Beulich wrote:
>>>> On 06.05.2026 18:51, Roger Pau Monne wrote:
>>>>> Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
>>>>> say the least.  We don't know what registers might be there, nor which
>>>>> values might be safe for those registers.  On a forthcoming platform doing
>>>>> the zeroing of the MMIO region does put the IOMMU in a broken state, which
>>>>> is not recoverable by the IOMMU initialization procedure in Xen.
>>>>>
>>>>> Instead just zero the control register, which mimics the current behavior
>>>>> with regards to how the control register is handled, and ensures the IOMU
>>>>> setup is done with the unit disabled.  This approach will need revisiting
>>>>> in order to support Preboot DMA Protection.
>>>>>
>>>>> Fold map_iommu_mmio_region() into its only caller, as the function body is
>>>>> just an ioremap() call after the removal of the memset().
>>>>>
>>>>> Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> While you got Andrew's R-b, I don't view that as enough to commit it. My
>>>> prior concern towards ...
>>>>
>>>>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>>>>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>>>>> @@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
>>>>>      return iommu->ht_flags & mask;
>>>>>  }
>>>>>  
>>>>> -static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
>>>>> -{
>>>>> -    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
>>>>> -                               IOMMU_MMIO_REGION_LENGTH);
>>>>> -    if ( !iommu->mmio_base )
>>>>> -        return -ENOMEM;
>>>>> -
>>>>> -    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
>>>>> -
>>>>> -    return 0;
>>>>> -}
>>>>
>>>> ... this part of the change wasn't addressed, neither verbally nor by an
>>>> adjustment to the description of what was committed. As previously stated,
>>>> blindly memset()-ing the entire area may not be the best of all options,
>>>> but the downsides of not doing this need to somehow be addressed. As
>>>> indicated, once they run out of bits in the main control register, they
>>>> likely will add a 2nd one. That'll then also need clearing, yet we have
>>>> no code to do so anymore.
>>>
>>> I could introduce an opt-in command line option that forces the
>>> zeroing of the MMIO region (to have the option to resort to the
>>> previous behavior),
>>
>> But we don't want to fully go back to this. We'd need a form that zeroes
>> what may be zeroed, without causing the issue you're trying to address.
> 
> But how do we know what needs to be zeroed?  We are then in the same
> position where the introduction of a new control register would cause
> the zeroing to no longer be accurate.

An option may be to zero everything we don't know about (plus perhaps
everything we know about, but don't otherwise use), on the assumption
that new (writable) registers added are okay to zero.

>>> but I was (wrongly) under the impression that we
>>> have agreement the proposed approach was the least bad of the ones
>>> available, sorry.
>>>
>>> Note how VT-d also doesn't zero the IOMMU registers MMIO page either,
>>> neither does it seems to zero the Global Command Register either,
>>> which I'm not saying it's correct, but is at least a (possibly wrong)
>>> precedent.  I don't think there's much we can do with the handling of
>>> enabled bits in possibly registers not know/handled by Xen.  Like on
>>> VT-d, we possibly need to rely on the firmware to handle the IOMMU in
>>> a half-sane configuration, with no enabled features on registers Xen
>>> doesn't know about.
>>
>> As indicated before, for firmware we can likely rely on that. Pre-boot
>> non-firmware environments and especially Xen being kexec-ed (or being
>> run past something which was kexec-ed) may be of more concern.
> 
> Do we really support booting from such environments?  We would need
> much more careful handling of enabled features IMO, as blindly zeroing
> the whole MMIO register area is likely to not make the IOMMU happy if
> it was in an enabled state.
> 
> Note for example how Xen was zeroing the command and log buffer
> pointers ahead of disabling the features in the control register, just
> because those register are ahead of the control register in the MMIO
> space.

Hmm, yes, such ordering issues could also appear with new registers.
Then again, with the IOMMU as a whole disabled (which we would still
want to do up front), perhaps the order of other stores can be assumed
to not matter?

Jan

