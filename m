Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E68CBCA7
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 10:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727320.1131788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9h12-0004QB-BT; Wed, 22 May 2024 08:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727320.1131788; Wed, 22 May 2024 08:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9h12-0004My-8W; Wed, 22 May 2024 08:08:04 +0000
Received: by outflank-mailman (input) for mailman id 727320;
 Wed, 22 May 2024 08:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9h10-0004Ms-H4
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 08:08:02 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67d52215-1812-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 10:08:00 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-523b017a5c6so9206280e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 01:08:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cdd4a2793sm895867266b.0.2024.05.22.01.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 01:07:58 -0700 (PDT)
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
X-Inumbo-ID: 67d52215-1812-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716365280; x=1716970080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPL+Uni1yJqIWR95mE7XmWQsFKJtpoYLHfuEejgmN9w=;
        b=f2qYG7pWiOXltp3vcldX158hMvkoPD8ZpEizv4YNgq2xpKx3uFdXl5LflHclPFNTNG
         RZpU1rpGwVGHhnUhyxQNFyhpy5sq9RnTqOUQyHwqb+1KIr37W0cQTUD279kqJIRD3pXS
         m5gS4lePz31H4g0VQGUC57dbHmDFn74u6haK2blf8LILeZ7NJt9lxrEAe5/47K7e2+WZ
         bXc7dVsDMhZnSyHV0lUaYNQMBM7FTD7egkCOE9ZTW59qQcfbF3yEF8QoAYIcV3qD46RE
         VtC3AvdWFszaPspP3sghC977fw01MapM2rPmh5u4yQDQL6sb5Q223FrOiW1zarY88r4O
         FUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716365280; x=1716970080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPL+Uni1yJqIWR95mE7XmWQsFKJtpoYLHfuEejgmN9w=;
        b=VclO1y/Yo64b/cFfp2l/Httf0kladWEJVvhc3ekXncp56ICrZ8U2GuvoIGPW9d40H7
         Z/nRH10Ssq8Wo9H1SfURLbazkq0mLgBWItE0meFzgogrdECyC/5u91poMv499Tm9phrV
         UEiZAkNW61S8bhoy4WJDdO+gSagfigShLlK4eplzFktt9n9KxEXLkHgJ6y6ieHMTevub
         8psl85eBF3LIpFlut99dYS9HGNAUQ+OwxfONt7EgYM9gA09qTWijSe/GOCP9jQ/Gw/6e
         +Upn0SkBVEVF+eF9nByyGkhsI/38BSgWJvK8tcgLYYLfBxs6IH3E32bZwTzoeNvakNZP
         S6IQ==
X-Gm-Message-State: AOJu0YwpVwWLslFVlMvdk/xR+VyaTC4diQvA7Aole8hcop8HA2rWDGbZ
	8VOzLJGHMzoofvk9bihpeRlks3dUodsiT1ymM8qHPNm1OGcRyvEP5jCFuaAs5gS/vibtANicxP4
	=
X-Google-Smtp-Source: AGHT+IEGOKobW5DaUipjVA/f1L7V7p2phujRxc45B43HOYccZlPgCH9TLh0Izo0/ebSMNSxKDRMafg==
X-Received: by 2002:a05:6512:2011:b0:523:772c:2c1c with SMTP id 2adb3069b0e04-526bf82cc11mr789486e87.38.1716365278742;
        Wed, 22 May 2024 01:07:58 -0700 (PDT)
Message-ID: <7655e401-b927-4250-ae63-05361a5ee71d@suse.com>
Date: Wed, 22 May 2024 10:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.05.2024 04:54, Marek Marczykowski-Górecki wrote:
> On older systems, XHCI xcap had a layout that no other (interesting) registers
> were placed on the same page as the debug capability, so Linux was fine with
> making the whole page R/O. But at least on Tiger Lake and Alder Lake, Linux
> needs to write to some other registers on the same page too.
> 
> Add a generic API for making just parts of an MMIO page R/O and use it to fix
> USB3 console with share=yes or share=hwdom options. More details in commit
> messages.
> 
> Technically it may still qualify for 4.19, since v1 was sent well before
> last posting date. But I realize it's quite late and it isn't top
> priority series, so if it won't hit 4.19, it's okay with me too.
> 
> Marek Marczykowski-Górecki (2):
>   x86/mm: add API for marking only part of a MMIO page read only
>   drivers/char: Use sub-page ro API to make just xhci dbc cap RO
> 
>  xen/arch/x86/hvm/emulate.c      |   2 +-
>  xen/arch/x86/hvm/hvm.c          |   8 +-
>  xen/arch/x86/include/asm/mm.h   |  18 ++-
>  xen/arch/x86/mm.c               | 268 +++++++++++++++++++++++++++++++++-
>  xen/arch/x86/pv/ro-page-fault.c |   1 +-
>  xen/drivers/char/xhci-dbc.c     |  27 +--
>  6 files changed, 309 insertions(+), 15 deletions(-)

Just to mention it here again, with v2 having been quite some time ago:
Like for that other work of yours I'm not really convinced the complexity
is worth the gain. Ultimately this may once again mean that I'll demand
a 2nd maintainer's ack, once technically I may be okay to offer R-b.

Jan

