Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CB7C8A1AF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172800.1497904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFwY-0002TW-9J; Wed, 26 Nov 2025 13:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172800.1497904; Wed, 26 Nov 2025 13:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFwY-0002Qd-6d; Wed, 26 Nov 2025 13:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1172800;
 Wed, 26 Nov 2025 13:52:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFwW-0002QR-Us
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:52:24 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21e455c6-cacf-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:52:22 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b3720e58eso5105368f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:52:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3a6bsm40371847f8f.28.2025.11.26.05.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:52:21 -0800 (PST)
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
X-Inumbo-ID: 21e455c6-cacf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764165142; x=1764769942; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sgudf3x16De3iis136PETuYIsJFWhzLjvzbyjajOKcg=;
        b=ADr1dUXztbDFHsumAujcLrZE2gq2MBaifZwf16XK8qOSke0iF5QkyNKjCJ38dIs7RI
         7dnuFnH3ZyGtEkc01kjHS0xJvW3eNfJddyTvfVSond4zn7pDLlUbMJUaICAlh/dZ3qeH
         OGwiV3a7/ZcOqMgh+ucuPKC6XVY1RF7TU0dj9p2VGgo5pJtHFnS2h7lBNvkwfvT9Tb3J
         w0x1L8+h8YFphh7WFGmHI9YcZI6FEuiFikOM+Qa3B0Zsiu/+ZSEaGmh1d/70VP3JJxPv
         ju7FGUay1L9lvvyR8yzvwmKixFt+dBM89wocFcFmcSkoLJHg9UJ5Ad1ErcSaQ12kuxXK
         pNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165142; x=1764769942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sgudf3x16De3iis136PETuYIsJFWhzLjvzbyjajOKcg=;
        b=l61zx1P9y638MaMcKQDMNYh4qjfdwDuWirTMbso41Lcf8zPEOIuiPCmV9CxoNZz67g
         GFTAkqGutcTcKYwvjlz033PNnmK4B53O/38MWieo7QUBnZltdgqPBGU1eiKIqNo6vDM/
         YkYrPCd1rsX2F4deVgCn27yZulUc1DHGMR4+Dctf5pXscd+u5KBM3UrkyOgAcTVNGPJ7
         J4mV/MqiMVgY+AgYjvhiAbjWgOZ93/FLdvq2B/xWFvUyqAjscmzGZg3mgroZU6ZOTs3o
         8gYQ1DaMmLcDXGFQELzHfv52EcqnNgJCXvWsQ1HNQVhGjqT7im6PdLO110cktlS4vRBd
         OBcw==
X-Forwarded-Encrypted: i=1; AJvYcCUD6X1Ah8Ib4BfU/j18UKF2/oTYoDJZALGOOJkxepvAXtrm1EPE9P0SpuxOqoSlcc0jcCkTDwZ+auA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza5Hda3kM6EC7TNqc7xrH5zGZeiswpkqrJkV/Zn++QzgY7Do2E
	swIpSxZJLM5/kzq2pvsNR7B7faXP6o2esDlmXCmPORXSSk9SurkxJ9hfFrAQFJNu6A==
X-Gm-Gg: ASbGncv0+fLAb622TLd80qCLlCl4QekYZ1AoBkLArXJPUOj79Jsz9hm3P8hmgrCbvcx
	oXysRsFkMW1hQ5gK2C+j8Dcg8tBE7hghBW6lnS+mOehTxw9NYDRraHQmyrK/Wo4eogQvjDROc8B
	M1udWA0/Y0lc5vKihtDkGFEhvRh/kkvHIDiB8a81DXJrb4oonzHSyrCTN4dbs1U80073p7K823E
	ykVTufmgjr9uQMY2dTrKG7kA4N0R+o3t1aP1RL/Lt5IKyQPOxHO+6VJH0L4Z+MpkssPp0R+egTh
	Zp2LWToWigP7NIr5E7d/znvPEixlbiseYhYeKFc7d3ZYSKMQofsXVT7IXbcba4yL7tkm6uxayRJ
	pgQ0uP72Z6xWY4/pCvuDm2X9mvN4YIvNgCOs6sf5YDLwD79vioalFekNQZWMiZnORjj5b+gECFC
	wt3Y9JiBhpGpvs6sbYTmDHjKHicm7lIWyXbPjsqNK+1q69kPZU3p7fyetd+szPvB7O//gK2Favn
	pY=
X-Google-Smtp-Source: AGHT+IG0E1Fta2QWFylL0vB5+pgcITooT4JdwLyLRw/JJ2tABTL7bN2992zpo6+0Hwi+8ogcnR50IQ==
X-Received: by 2002:a05:6000:288b:b0:425:73c9:7159 with SMTP id ffacd0b85a97d-42e0f344080mr6780613f8f.33.1764165141876;
        Wed, 26 Nov 2025 05:52:21 -0800 (PST)
Message-ID: <861c5e5d-229a-41d3-b6e1-4f42f1cd47ab@suse.com>
Date: Wed, 26 Nov 2025 14:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/viridian: fix calling of
 viridian_time_domain_{freeze,thaw}()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126112942.49031-1-roger.pau@citrix.com>
 <4f3c5cf3-cdba-4162-a9b1-4afe683c864f@suse.com> <aScFZVHdW2ef0tNE@Mac.lan>
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
In-Reply-To: <aScFZVHdW2ef0tNE@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 14:49, Roger Pau Monné wrote:
> On Wed, Nov 26, 2025 at 01:44:25PM +0100, Jan Beulich wrote:
>> On 26.11.2025 12:29, Roger Pau Monne wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1547,8 +1547,7 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
>>>  static void _domain_pause(struct domain *d, bool sync)
>>>  {
>>>      struct vcpu *v;
>>> -
>>> -    atomic_inc(&d->pause_count);
>>> +    bool was_paused = atomic_inc_return(&d->pause_count) - 1;
>>>  
>>>      if ( sync )
>>>          for_each_vcpu ( d, v )
>>
>> Isn't this racy? Another CPU doing the INC above just afterwards (yielding
>> was_paused as false there) might still ...
>>
>>> @@ -1557,7 +1556,8 @@ static void _domain_pause(struct domain *d, bool sync)
>>>          for_each_vcpu ( d, v )
>>>              vcpu_sleep_nosync(v);
>>>  
>>> -    arch_domain_pause(d);
>>> +    if ( !was_paused )
>>> +        arch_domain_pause(d);
>>
>> ... make it here faster, and then the call would occur to late. Whether that's
>> acceptable is a matter of what exactly the arch hook does.
> 
> It's acceptable for what the Viridian code does now, as there are no
> current callers to domain_pause() that rely on the Viridian timers
> being paused.
> 
> TBH the Viridian timers would better use the vPT logic, as that
> avoids having to do this manual housekeeping.  I suspect vPT wasn't
> used in the first place because when using SINTx the same SINTx could
> be used for other purposes apart from the timer signaling.
> 
> As a result the current logic to attempt to account for missed ticks
> is kind of bodged.  It doesn't detect guest EOIs, and hence doesn't
> really know whether the previous interrupt has been processed ahead of
> injecting a new one.
> 
>> Furthermore, is what the arch hook does for x86 actually correct when "sync"
>> is false? The vCPU-s might then still be running while the Viridian time is
>> already frozen.
> 
> I've also wondered about that aspect when using the nosync variant.  I
> think it's fine to stop the timer ahead of the vCPU being paused, the
> only difference would be whether a tick get delivered in that short
> window ahead of the pause or afterwards, but that likely doesn't much
> difference for the purpose here.
> 
> Maybe it's best to attempt to move the Viridian timers to use vPT
> logic, and possibly get rid of the arch_domain_{,un}pause() hooks.

That may be more intrusive a change. I was kind of hoping to confine the
less invasive change here to the Viridian freeze/thaw functions.

Jan

