Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18A1D07C04
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 09:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198407.1515377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve7fW-00022V-TP; Fri, 09 Jan 2026 08:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198407.1515377; Fri, 09 Jan 2026 08:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve7fW-00020j-QH; Fri, 09 Jan 2026 08:16:26 +0000
Received: by outflank-mailman (input) for mailman id 1198407;
 Fri, 09 Jan 2026 08:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ve7fV-00020d-Ah
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 08:16:25 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b4512a8-ed33-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 09:16:22 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so43211075e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 00:16:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df8besm20162733f8f.26.2026.01.09.00.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 00:16:20 -0800 (PST)
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
X-Inumbo-ID: 7b4512a8-ed33-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767946581; x=1768551381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gCFlP9fxNsC6ga/seMa0KvAYvbrh+d170swkw77Is9k=;
        b=Ln73PTAKWlLjJEaPtjsbp23J6EbekVa/MLqe/mKUOLWUzWsvfcczgFwUk4+vzZX+AH
         z7ovwi/0B9DXu8p8o7JUYqW5IjGR9mHf9OJr5G6IeqG25O+liJV8ZH0YaTjmZfojBTBH
         eJLTb3jHAWeYN9Yw29xyqgAcO/Tkv/0GAGwX8xtI0b385fEZViFcwSqM5x1Q1G6f6c+8
         jupSmFv8b86ZhcFMQNNkz9wSD5yjNxhTZ6z5ZGHR1aXJXbOLxAVWA2B4LoJzi4vzhTVJ
         kvKnANuumMpelFr99v3QN8GifKkAXmPxtDHoMNYqsItgl4JPwJml4YV9qZDByIjdySkw
         w3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946581; x=1768551381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCFlP9fxNsC6ga/seMa0KvAYvbrh+d170swkw77Is9k=;
        b=Oo8PmGCpQUh53sLZGG6leWmvcvZI3w8+AEFBD9EhjcLuAQADqeBxH1UVIpBPAABqTC
         wtpN820usuO47Foo2YQ6RRcaFtzKsDOQkH+2Kqy+0iqwVKeUzTWWlPP1yvwgA/hHuqNx
         A3aV+3vo1SAu8CSBHiIl+madp9FakRCT4aQmz/btXbCu7HoxVSR/AlQhrW9838uzPJrl
         kamVpuqdJOKkrO8TvIWqKyEfLkww+x/qEYcJ3hDQ3GaAJowtSYXhxC6CoXjvqkNU3AYP
         jM0ord1lVf9A1SR6w/DzppeRPtTCqYtn9tOgqLBbKOmCRcEqY2lEdqD9psUIUpbKI3/6
         RXcA==
X-Forwarded-Encrypted: i=1; AJvYcCXooRmC1biQX58KWgh1JdDFVGpIObWOoVpCvJuzfoOHQD9Dn76iaZoK5sh7tfoksLjAc7XyvMCx0PU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwN/NCCf6S1GJvB8cTyhjujmUZlE9Nx00bQn9hVJLzWDx+p/He0
	JaKobA5zvZ1enrcI1bISKL6crZKsd+DR56bgIz8z4GBdEbgVNSlMFiMboqT7lMH4nA==
X-Gm-Gg: AY/fxX6ixYsRyJUU6B33x56fgDiK9/z9NFmJuWS94ecOU02GRH5j5sqz76FdAWteWkx
	ZbNrXT2M/JQByNIu/uxvWIpw8O7kH+hGRnYkfEyWG49By5I7sKHbCVyk99/m6V943xOG3RcrdoP
	mHE7ls9i5vU9ieXhu2gniuy7tTBMPa9fzjVqDqwEzj2Lc3r+OKt+eX038tHvR6GYG20Pl8vsHmH
	v2t3lio/IwKDlOJ8n6fcbExCnfNPm0RYgdDVVlzLO/lMLcNFYnkqV49k2dIVQFz2cJ5qHzni5gk
	vhpE6g9pnnmKeZYtWpemj6+lT9W+mGomWequD9twMMsetmQLuKNoJmDRENQy1T3PZ4w1y0qed1X
	Cm61XSZivgJrhpRLEAFotM8Mcn+A0WPD2VPIv7qHomAblP0/4tr+J3MA2N0iWdnVDVuKr0enpm1
	BSTCYLp1aOJGzm6md2VOkrYqWqOpYSf78emhBG4n8NNWT15+cjFZVgTBB0eVjRw1gKEvUxCjtUo
	CM=
X-Google-Smtp-Source: AGHT+IEL4L4x7/t3H1GGEhQLBpg2cBvQB+rN2QANV32ZXrdm8ehS8907Eg6MJ1BAzVNOoVyDjy5fCA==
X-Received: by 2002:a05:6000:2891:b0:432:8651:4070 with SMTP id ffacd0b85a97d-432c3760e09mr10702350f8f.10.1767946580945;
        Fri, 09 Jan 2026 00:16:20 -0800 (PST)
Message-ID: <336b1b84-7c03-44a8-b9d4-9652f0797886@suse.com>
Date: Fri, 9 Jan 2026 09:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer
 toolchain baseline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-3-andrew.cooper3@citrix.com>
 <4b051e1f-0d99-4637-b433-bade93e67e0a@suse.com>
 <e34ecbe6-5b74-451f-8540-037966f1be21@citrix.com>
 <6062efac-8285-4062-926f-dc3ece871654@suse.com>
 <91a64181-212b-4515-9e2e-82b3eb4b4364@citrix.com>
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
In-Reply-To: <91a64181-212b-4515-9e2e-82b3eb4b4364@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.01.2026 22:08, Andrew Cooper wrote:
> On 06/01/2026 7:59 am, Jan Beulich wrote:
>>>>> @@ -489,17 +484,17 @@ void xrstor(struct vcpu *v, uint64_t mask)
>>>>>              ptr->xsave_hdr.xcomp_bv = 0;
>>>>>          }
>>>>>          memset(ptr->xsave_hdr.reserved, 0, sizeof(ptr->xsave_hdr.reserved));
>>>>> -        continue;
>>>>> +        goto retry;
>>>>>  
>>>>>      case 2: /* Stage 2: Reset all state. */
>>>>>          ptr->fpu_sse.mxcsr = MXCSR_DEFAULT;
>>>>>          ptr->xsave_hdr.xstate_bv = 0;
>>>>>          ptr->xsave_hdr.xcomp_bv = v->arch.xcr0_accum & XSTATE_XSAVES_ONLY
>>>>>              ? XSTATE_COMPACTION_ENABLED : 0;
>>>>> -        continue;
>>>>> -    }
>>>>> +        goto retry;
>>>>>  
>>>>> -        domain_crash(current->domain);
>>>>> +    default: /* Stage 3: Nothing else to do. */
>>>>> +        domain_crash(v->domain, "Uncorrectable XRSTOR fault\n");
>>>>>          return;
>>>> There's an unexplained change here as to which domain is being crashed.
>>>> You switch to crashing the subject domain, yet if that's not also the
>>>> requester, it isn't "guilty" in causing the observed fault.
>>> So dom0 should be crashed because there bad data in the migration stream?
>> Well, I'm not saying the behavior needs to stay like this, or that's it's
>> the best of all possible options. But in principle Dom0 could sanitize the
>> migration stream before passing it to Xen. So it is still first and foremost
>> Dom0 which is to blame.
> 
> BNDCFGU contains a pointer which, for PV context, needs access_ok(), not
> just a regular canonical check.  Most supervisor states are in a similar
> position.

Yes, so exposing them to PV would require extra care. Note that MPX isn't
exposed to PV.

> Just because Xen has managed to get away without such checks (by not yet
> supporting a state where it matters), I don't agree that its safe to
> trust dom0 to do this.

Yet the guest itself can't have got in place a non-canonical value, can it?
Its attempts to load it into hardware would have faulted. So it's still
not the target domain which is to be blamed for a fault resulting from
XRSTOR encountering bogus pointers.

> For this case, it's v's xstate buffer which cannot be loaded, so it's v
> which cannot be context switched into, and must be crashed.  More below.

Well, yes, as said - that's one possible way of treating things. My main
request is not so much to undo the change, but to properly justify it in
the description. (Or maybe that really wants to be a separate change, in
particular if you wanted the changed behavior to also be backported.)

>>> v is always curr.
>> Not quite - see xstate_set_init().
> 
> Also more below.
> 
>> And for some of the callers of
>> hvm_update_guest_cr() I also don't think they always act on current. In
>> particular hvm_vcpu_reset_state() never does, I suppose (not the least
>> because of the vcpu_pause() in its sole caller).
> 
> We discussed the need to not be remotely poking register state like
> that.  But I don't see where the connection is between
> hvm_update_guest_cr() and xsave()/xrstor().

At the example of svm_update_guest_cr(): It calls svm_fpu_enter(), which
in turn calls vcpu_restore_fpu_lazy(). But yes, that's explicitly only
when v == current. I fear I didn't look closely enough when writing the
earlier reply, sorry.

> Tangent: hvm_vcpu_reset_state() is terribly named as it's attempting to
> put the vCPU into the INIT state, not the #RESET set.
> 
> But it only operates on the xstate header in memory while the target is
> de-scheduled.  It's not using XSAVE/XRSTOR to load the results into
> registers as far as I can tell.

Iirc I mentioned hvm_vcpu_reset_state() because it calls
hvm_update_guest_cr() several times.

>>>   XRSTOR can't be used correctly outside of the subject context,
>> Then are you suggesting e.g. xstate_set_init() is buggy?
> 
> No, but it switches into enough of v's context to function.  Really its
> neither current nor remote context.
> 
> But, it's single caller is adjust_bnd() in the emulator so it's always
> actually current context with a no-op on xcr0.

That's its single present caller. Who knows what else we might need it for.
It would better be operating correctly in the more general case.

> As said on Matrix, I think it's going to be necessary to remove MPX to
> continue the XSAVE cleanup.

Possibly, yes.

Jan

