Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0826A9EE7F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970487.1359164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MEv-0006e3-MR; Mon, 28 Apr 2025 11:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970487.1359164; Mon, 28 Apr 2025 11:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MEv-0006bB-JJ; Mon, 28 Apr 2025 11:01:33 +0000
Received: by outflank-mailman (input) for mailman id 970487;
 Mon, 28 Apr 2025 11:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9MEu-0006b5-0V
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:01:32 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23cec534-2420-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 13:01:30 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so44215415e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 04:01:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46a25sm10919704f8f.69.2025.04.28.04.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 04:01:29 -0700 (PDT)
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
X-Inumbo-ID: 23cec534-2420-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745838090; x=1746442890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Au0ncdSq27XtX8N+TtDQODXL7lO7f/qQFMcBhE8ULHg=;
        b=gbDMTss/HHas8fY7iYxXWKG1ZZydP4l7p6W32MAPwqPetbg1H0d83E8S2sJGKDGfHS
         PH0fx2Uzux9Epwq9Ih9MVtJGhyfwiRza7/NJb4Ai8W+z5//TQeVPQbh6JgrzY83yNlw4
         VRsu/zO+hDNUWkEWgz7uq/S2JwsrLzpWDFJwwzM6Q3miVunapJJs0EmgaztNt+SN3kUZ
         ADOYZlUqtxsvvrmXcyJ8TMZTp8ps4+5sZ3sViKk+uqR1flcsfOEq0DwRb9uolyGi1Y1X
         JsuY5yS43AfV+vb8+8vRsb3tQBEByf6t5NGG4nvKl6HEQYuh08d4IuBL4Gxa/7CPP48A
         JqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745838090; x=1746442890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au0ncdSq27XtX8N+TtDQODXL7lO7f/qQFMcBhE8ULHg=;
        b=TNeNPYZ7yVgEovaxBX2OCYCB0oq0aeicbzPRJwZy74TmpfPOgr+JkLc34jjE1/TML0
         wt1A9d6BpgUdLq4e14byTxpDIZAXdwViSwuP1Eo5NGrHhvihOuZXnaDOFgnmWL4nCSBj
         GHc7UEbd1S3KjTdAbhMSzZnsQvx9WxViPLUIbF0UmVapGUcjw41S1d4g+CkbatNQykf3
         mzMXQK6v5TCTgSnOr2x+3zBTxG9oEliuffWMCdG3AQoYsGYQ8PhZJPaeCzKc8QZPDp7K
         Lx80Kw/N+gJcabfO50Z0Nda52UIr96JqCM6Kl2pLMtbKzFRA1Sx4kfqtBwOE4hxZ6xOM
         26Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWjQlgZXT6Xs3sn0MZiHvuYh4OMD6LrKrgd0naJxy/ZhQHGPi2L+xIXMxcKbPq/+gTSzK0z6D9T7qY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2TADLJXyCiuPdhH+xoDCCHAEYx1yo3cDd9a7yM4x5ae8fSU0R
	bCh2AvKQO9Hs5r/9vKoWelbaKEdR7H8QCQobwCxx8LRY7OBkq3JnRYI37xV+zw==
X-Gm-Gg: ASbGncvAXXYYG9l3mmlH/62kE61rxXC046UqXIggHDT5IDTKS2B217jz+dCy6DOzJVx
	pEOolmA/zcGvZnhuYllyLxcyPKb1kUS1vS4kMltVEpCXxRPEb17s9yBt520fLy+GwmQsEmI/JCU
	dMyECqW0oOId2ky/3qvoiCFZSpooAG8SZVam10d62vgq7ux5RyeqbiKSpWkkhaHCwtWc/SF5SOM
	rypzTqYRQcCHqyc5rcXoqY+sUYxIPSB6bqkOrqs8sSFWkv6zrKFCn8zmdQOp7WVoGWazmA48jsn
	KGfn5P2qKhmr5DX+udzI2XvWGRvV5reyTjEJ5HJsKAD/ML6OvYI+Ys2aCd1NIFnmRmKaw3D+JXp
	enHC/cOOASk+rD2qIxUhtBUHJsA==
X-Google-Smtp-Source: AGHT+IG5iXxYJP2rhjGwJOuQzTegx1ReXv8ot9prFkVLlT4qMIMKv8zeJ5a0Q/iJoPiTqgv04Id4Iw==
X-Received: by 2002:a05:6000:1ac9:b0:39e:e438:8e32 with SMTP id ffacd0b85a97d-3a07ab8a919mr6902232f8f.55.1745838090154;
        Mon, 28 Apr 2025 04:01:30 -0700 (PDT)
Message-ID: <78ee3436-706b-45ba-aacb-3c3f5f2a4ac7@suse.com>
Date: Mon, 28 Apr 2025 13:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 04/38] x86/hyperlaunch: convert vcpu0 creation to domain
 builder
To: Alejandro Vallejo <agarciav@amd.com>
Cc: jason.andryuk@amd.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-5-dpsmith@apertussolutions.com>
 <D9FTMDQ501TU.1H73IHNYGWKZH@amd.com>
 <9cad677f-cfcd-4eec-b824-01d281cb7076@apertussolutions.com>
 <D9I7CYQG59BZ.2GZ9CJ27Z7KX7@amd.com>
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
In-Reply-To: <D9I7CYQG59BZ.2GZ9CJ27Z7KX7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.04.2025 12:33, Alejandro Vallejo wrote:
> On Fri Apr 25, 2025 at 11:04 PM BST, Daniel P. Smith wrote:
>> On 4/25/25 11:22, Alejandro Vallejo wrote:
>>> On Sat Apr 19, 2025 at 11:07 PM BST, Daniel P. Smith wrote:
>>>> Convert alloc_dom0_vcpu0() to dom0_set_affinity(), making it only set up the
>>>> node affinity based on command line parameters passed. At the same time,
>>>> introduce alloc_dom_vcpu0() as the replacement for alloc_dom0_vcpu(). Then have
>>>> alloc_dom_vcpu0() call dom0_set_affinity() when the boot domain is the control
>>>> domain, otherwise set the affinity to auto.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>>   xen/arch/x86/dom0_build.c                 |  4 +---
>>>>   xen/arch/x86/domain-builder/domain.c      | 11 +++++++++++
>>>>   xen/arch/x86/include/asm/dom0_build.h     |  2 ++
>>>>   xen/arch/x86/include/asm/domain-builder.h |  1 +
>>>>   xen/arch/x86/setup.c                      |  5 +++--
>>>>   5 files changed, 18 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
>>>> index f2277b9e3cf3..619d36ea0b87 100644
>>>> --- a/xen/arch/x86/domain-builder/domain.c
>>>> +++ b/xen/arch/x86/domain-builder/domain.c
>>>> @@ -9,6 +9,7 @@
>>>>   #include <xen/sched.h>
>>>>   
>>>>   #include <asm/bootinfo.h>
>>>> +#include <asm/dom0_build.h>
>>>>   
>>>>   unsigned int __init dom_max_vcpus(struct boot_domain *bd)
>>>>   {
>>>> @@ -27,6 +28,16 @@ unsigned int __init dom_max_vcpus(struct boot_domain *bd)
>>>>       return bd->max_vcpus;
>>>>   }
>>>>   
>>>> +struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)
>>>> +{
>>>> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
>>>> +        dom0_set_affinity(bd->d);
>>>
>>> Similar as before, this probably wants to be DOMAIN_CAPS_HARDWARE?
>>>
>>> I'll adjust while rebasing.
>>
>> Does it?
>>
>> v/r,
>> dps
> 
> The situation is similar later on when choosing a CPU policy. Why
> mustn't the hardware domain get the same treatment as the control
> domains? Using (DOMAIN_CAPS_CONTROL | DOMAIN_CAPS_HARDWARE) at the
> very least seems warranted.
> 
> All these cases single-out dom0 when dom0 is both a control and a
> hardware domain, but as Jason mentioned how is Xen meant to deal with
> dom0_X arguments when dom0 is disaggregated? Either it applies to all
> its constituents (with the plausible exception of a xenstore domain),

This one-fits-all seems very unlikely to me to make sense, while

> or just one (the hardware domain), or none.

... either of these would. "None" in particular might if all config
information is coming from e.g. DT anyway in such an setup.

> Only applying to control
> domains and not the hardware domain doesn't look right (to me).

+1

Jan

