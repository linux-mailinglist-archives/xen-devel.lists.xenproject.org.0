Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E0A95EB0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 08:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961709.1353054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u77Z9-0006wu-1e; Tue, 22 Apr 2025 06:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961709.1353054; Tue, 22 Apr 2025 06:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u77Z8-0006vw-Ta; Tue, 22 Apr 2025 06:57:10 +0000
Received: by outflank-mailman (input) for mailman id 961709;
 Tue, 22 Apr 2025 06:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u77Z7-0006v5-Fr
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 06:57:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01979166-1f47-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 08:57:08 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso3293227f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Apr 2025 23:57:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa420683sm14191286f8f.20.2025.04.21.23.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Apr 2025 23:57:07 -0700 (PDT)
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
X-Inumbo-ID: 01979166-1f47-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745305027; x=1745909827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ID17WFPefFDHfGmSoZ97O39hAhlQPH1GxgRm05uwzmw=;
        b=bGxgnItmseTM20ERbtwxBn8mas/Gshps0Ztok7pFc2GjmpAeDlP8xXVaOWKymZyeBO
         t0ejGsGA2eHrz/iJ2bxddIFrhS4VzlE+BvMzoSoW4kmK0u5yx2m/OTb1o974heCtNQ2M
         taYxWfzbDXMwEtTc8iD+rJWuhyGLV3wCYA8Me7bpcMDv7CzBy7KmDk7eqNzL3CbvRdzu
         JHKmmV/SOmCKRzL2v8aeqYcenZ9Kavb7rDRI1qmR8jYVxFq/pm8J3z+zyqn/bsLBZ8UD
         NRnC1yNLvnuP6yrMBovJRk/FKuKZifp2bvYokejRwZoTXyV5YAdwS9tGgtiMaI7zdfjF
         HsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305027; x=1745909827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID17WFPefFDHfGmSoZ97O39hAhlQPH1GxgRm05uwzmw=;
        b=hr6UQe7k9dGrk4shsgGLZhKfyW2ZVaSYTZf5fNrF2daKFBBjjZBIm5TOlJ24KTQPfB
         Kfu7XVAjs2n9rEW0F7IWCeuN3ET5BOTomNmPZMp4wRR5pVpWFNTv6Koc2/UYkGToA1NX
         mkiFii9Fu3uOCcbzr2rxmpXLqoFWdlkhj6NhbiOU3v1VoSdhPZtVpXJvTIWsVro6QOci
         zH1t+own0o63TjqztS0JWxkvDeN1xxXwZbPdWWr8L7NQZx0ncgoL0/tuGMtju5dsSH9T
         PoAbeE8xs4SAcDpu5yYSF/ff40oQj2WdmBCTYWsDBr9X61GmpMqo01uAm3qUQi12bAgB
         khBw==
X-Forwarded-Encrypted: i=1; AJvYcCVXB88iDCSRMQmb9tuM3J8waBM5MVQ0zYbo/PHxUVm1oLuTmPHdb3jOMFc6nEyNMkktHx0yqCL63Bk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywXNAPlkdNLurN12/RCiCFGKVrYKCFWDLFIUuCbDTpeT6c72GD
	RWPxVpG9EIm2iP2qKBKb9fmRXFoB19CBIFXwS41lJ2eSi5zG7GemUncFiEMxng==
X-Gm-Gg: ASbGncvtp4GBL9tpBBUd3aB8eiGPbHGp1JqkLKeRJMfFL6kl8RQhc/3jWkmDI47U/2J
	+k+fcyqhwlpyp/dHFbbyQNVK1IwLX/vm+0B2scvP9dI0t5wqegnXwmI6erZz2IlSgZpMOSlnCOj
	b6kofXIWtlFGY2fXBtss5gkzbGI9hqqL+rSKb0hOsXiPrZJmvrFZyHFDeuxAlueRg8jKXujPRso
	kFDO/BDGBQwF9B/TriUTzh2/R0LRVI0c1lm+w2dPnY0K+DXtqCp55EwnnrAst9xalvszW/HD+GI
	OkcZ6eIgKeEA9psjcxTLIbzf34phKHd8XQXChvbOB5aVa96JL57/geshTAqcU+JNDCzsjReflgs
	dZ4VgnV1+wD+VY/b/zJg5GJ3GYg==
X-Google-Smtp-Source: AGHT+IEh9xe5f8HavrqQuLLpJE56RoTbQtdSPCgDCEjo/2/uQp+SWic4BK+X4HtdEymqKTS1bWVd9w==
X-Received: by 2002:a5d:5f54:0:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-39efba4ad94mr10711981f8f.16.1745305027386;
        Mon, 21 Apr 2025 23:57:07 -0700 (PDT)
Message-ID: <21deb3c2-9c84-4d86-9716-318f4130578f@suse.com>
Date: Tue, 22 Apr 2025 08:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] kconfig: introduce domain builder config options
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-3-agarciav@amd.com>
 <6b7728d0-0464-44ad-8af6-e2816e83a2a6@suse.com>
 <D991SW75LNIE.1QUE1HVLCS7W3@amd.com>
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
In-Reply-To: <D991SW75LNIE.1QUE1HVLCS7W3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 18:18, Alejandro Vallejo wrote:
> On Thu Apr 17, 2025 at 4:00 PM BST, Jan Beulich wrote:
>> On 17.04.2025 14:48, Alejandro Vallejo wrote:
>>> --- /dev/null
>>> +++ b/xen/common/domain-builder/Kconfig
>>> @@ -0,0 +1,18 @@
>>> +
>>> +menu "Domain Builder Features"
>>> +depends on HAS_BOOT_INFO
>>
>> That is, what's going to further be added here will not ...
>>
>>> +config DOMAIN_BUILDER
>>
>> ...depend on this, but just on HAS_BOOT_INFO? Seems not very likely, but
>> I'll be looking forward to learn what the plans are.
> 
> CONFIG_HAS_BOOT_INFO has nothing to do with future plans.  The domain
> builder is tightly integrated with the boot_info infrastructure and
> cannot be used (or linked) unless the arch-specific definitions are
> present. It cannot function without it. And this movement from arch/ to
> common/ forces this new Kconfig to gate core.c on boot_info existing
> (because it's in asm/bootinfo.h atm). I _COULD_ also move the boot_info
> elsewhere, but without a drive to actually use it, that seems a bit
> pointless.
> 
> HAS_BOOT_INFO && !DOMAIN_BUILDER still links core.c, because that
> contains the common initialiser for boot_info.

Which, as voiced earlier, I have reservations against. The entire
domain-builder/ sub-tree would imo better not be recursed into when
DOMAIN_BUILDER=n.

Jan

