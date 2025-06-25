Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D4DAE8599
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024922.1400679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQlT-0008Sy-2C; Wed, 25 Jun 2025 14:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024922.1400679; Wed, 25 Jun 2025 14:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQlS-0008QU-Vc; Wed, 25 Jun 2025 14:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1024922;
 Wed, 25 Jun 2025 14:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUQlR-0008QK-Ly
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:06:13 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8aa29456-51cd-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 16:06:08 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso1063682f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 07:06:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237f7579cddsm76964365ad.202.2025.06.25.07.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:06:05 -0700 (PDT)
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
X-Inumbo-ID: 8aa29456-51cd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750860368; x=1751465168; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rYYIcFGkg/MhhG4bT0x9A4wvSzFmJN1/HvQlEZtE7Ck=;
        b=UsdKbXeqyefiJ6CQsfsAflD7dKcDGb3MG2wlmBBdeN0srV9bnOgwUy3znLYUmdZ041
         GJPd0/fMF5dYxG5wRzOHVJ9h8LlMnK2hn5/S1u02NP5q/EAtWgPigFDb3UNXPdlJ3/xy
         BoTt1N86KD++65V2bvKJo8w6u8FptejJnBNGDIUdikordpD3hWRwugV398K49NGS+ufh
         PLSAUbMW8fTzZBXHGqwu8gYM5KntAbhIAytOQ1K+ooETWTiuFkBGm4qZM7Kq8cr2y5Rt
         lf64z0acgiJE2lesFTYDN54y0MsLLvIX5zL+F5d5mpVy+im0FJxfVlKOeKeEyXTYfqaU
         SH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860368; x=1751465168;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYYIcFGkg/MhhG4bT0x9A4wvSzFmJN1/HvQlEZtE7Ck=;
        b=g+xRPzUSp2fSZX6Ejj+kfsEIRFiTMhv1lrS50qY94yAKhhCmveWa0ZgaHSFpXCHtsB
         GpSCdpbvFcsEZIsgUBok9neO+IsXJD4zte8NvuDolJrWmVIbdNmJ2+1AVs2f8BaBdfgY
         vlTMHbCvvCbXbeuwPqQMj/eoAYvUW03E4g/eDYDY6RqqMq5N9sdT/pjZY3zNZNOSyweu
         82Or0AnyUolS8iip8hrqobS/q4ckVEeGHJl+iy0eX2YrbRah09YYjFns8HSjmAmFfGAN
         TyLqvU/t8htvvXC1YeIQz3x+DiurmIm80K3lUZUfN5jAy60IKWBWSco+fYql0u4HO+Vq
         ef8A==
X-Forwarded-Encrypted: i=1; AJvYcCVwZ/kcK+9hOazK4EP2RKnIyvZ1jCZOyga87fWXfIgPWe7/VaR29QNpFd5wCpyMQUNo6k8s7u8sI5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVAtXE4rATcjhVUyA5S0pPnNPgThsrM8Eqcu5B9PsqJiBV0KKW
	nlZVcxnvBE751bfroqGwXOZPvVeOL5HIonqHHFlysMCTC9/H9oEG2PAbHiUGWdYjOw==
X-Gm-Gg: ASbGncuIHEXRkMi0ZBISZ94YiEv/qwUoyg8USVbBE0OjXtgmk0JyZ8q/ZCAOSJkGs7z
	ZMZGmA92iGTBqE0Ih8nSoS591Wn0CIFdRh4AwBC7jaNRacShML4Ep7yrSdHrcX6Qr18WbhfKKAd
	FgazaDZhUXRf2g3JBkBPtNhfADVYHE6RRG6Ph/vKC4rGPdm6z7fvaiSc1AFDbIOkGmhMKVrKRVi
	EJis1kayX/lq+J/lsLMAHnzE3QT2OZ+P+Wtz9bJFDIdy+rjmHzxAqDSDyuOuCtE7iZQsrk9hBK+
	GL4zPWOwpO4GvANbvlzAkkNLuVgFU6KYGUigt/NyuZ4gEF7fXoi1fvlEjYh7fj8jvd7wQeQJ0sO
	61NxG3SWrYZWhcVT3iVbgV8I+Kd+gAtnVK3gW339YdiH+mMM=
X-Google-Smtp-Source: AGHT+IFfKF5gudLnWLkRDdHiR4dT8N6OXo5ICBVqzcizTWHzm9+JgUX/YPjLuDTADiPNzV0ZI892qw==
X-Received: by 2002:a05:6000:2084:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3a6ed65e60fmr2364776f8f.29.1750860366278;
        Wed, 25 Jun 2025 07:06:06 -0700 (PDT)
Message-ID: <e2b7de7c-365c-432d-b32d-8c9d9aab31a1@suse.com>
Date: Wed, 25 Jun 2025 16:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Revert part of "x86/mwait-idle: disable IBRS during
 long idle"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
 <20250624163951.301743-4-andrew.cooper3@citrix.com>
 <86841b35-119a-4265-8ff0-9b8549e8ca52@suse.com>
 <026d2b8c-4b3c-4bc3-955c-732d665e38ba@citrix.com>
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
In-Reply-To: <026d2b8c-4b3c-4bc3-955c-732d665e38ba@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2025 15:01, Andrew Cooper wrote:
> On 25/06/2025 10:58 am, Jan Beulich wrote:
>> On 24.06.2025 18:39, Andrew Cooper wrote:
>>> Most of the patch (handling of CPUIDLE_FLAG_IBRS) is fine, but the
>>> adjustements to mwait_idle() are not.
>>>
>>> spec_ctrl_{enter,exit}_idle() do more than just alter MSR_SPEC_CTRL.IBRS.  The
>>> VERW and RSB stuff are **unsafe** to omit.
>>>
>>> The only reason this doesn't need an XSA is because no changes were made to
>>> the lower level mwait_idle_with_hints(), and thus it remained properly
>>> protected.
>>>
>>> I.e. This change only served to double the expensive operations in the case it
>>> was trying to optimise.
>>>
>>> I have an idea of how to plumb this more nicely, but it requires larger
>>> changes to legacy IBRS handling to not make spec_ctrl_enter_idle() vulnerable
>>> in other ways.
>> What are the concerns here? As it looks skipping the MSR write would look
>> to require checking some (per-CPU) conditional. Conditional branches can't
>> really be of concern, or the "if (cx->ibrs_disable)" that you're now
>> removing again would have been of concern, too.
> 
> The conditional branches are what set off alarm bells in the first place.
> 
> A conditional branch in enter should be ok; HLT and MWAIT should be
> serialising enough.
> 
> A conditional branch in exit is not ok without extra safety measures.
> 
> I can expand on this in the commit message if you'd like.  I was trying
> to not be overly critical...

For me, the answer here is sufficient, I guess. Hence I won't insist on you
amending the description. It may help others and/or some time into the
future, though.

Jan

