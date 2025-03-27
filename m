Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F4CA72C2E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928760.1331423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjKO-0003fJ-P5; Thu, 27 Mar 2025 09:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928760.1331423; Thu, 27 Mar 2025 09:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjKO-0003dr-Lw; Thu, 27 Mar 2025 09:15:08 +0000
Received: by outflank-mailman (input) for mailman id 928760;
 Thu, 27 Mar 2025 09:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txjKN-0003dl-H6
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:15:07 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8785dd6-0aeb-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 10:15:05 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso5145995e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:15:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dedeaesm33171285e9.4.2025.03.27.02.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:15:04 -0700 (PDT)
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
X-Inumbo-ID: f8785dd6-0aeb-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743066904; x=1743671704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UpFU0hVE1FrW6ASXlG28jMvykySTG53ROxOxilig8cM=;
        b=HhXDaxI7RdWp9RsV4KdtTSUSnN8SlYWLIU0XyPAlEdKUyozmY6UVi0Fv907V4ucpEX
         TYWGtjLdvtp4zGj3S8Y/+A1wNn1cpGPTT8UJdsbIa/bdMB0cNNlmiN9lnn7oNmm9ncbb
         vpnb40bz47FcYo855RSUB6FIijaVKYgJjct88skSZjkVOEIqKqNqzA7SCdWtYKdHFaRi
         6iCM5lmn/21EY1t6K5K5Ch7LU+aFhjmm816VMoHVgkBnyzHlHAEfPXWGkzhA6D449d4V
         RUaeNR0LpfSBPVyS5xxu5M7k1+vmGztr0ZRRcmDMAgHUZE1tVSrjBBlVP1pJtHvaPy0z
         OhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066904; x=1743671704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpFU0hVE1FrW6ASXlG28jMvykySTG53ROxOxilig8cM=;
        b=cR4/+c9cLL1kstk2h6HY4S6WKmWwv2QvorYlO+vbWuN8pp9hYT9pRveKIDMrx6AY2o
         TybF//miBOzaYFbW7xcrt4RPJZXyHGx/AmUyxkgnsZ0RUKeANKoViRdbJMO+kjeZfj3R
         wUxxbHF8VD01gvkEoeelwVe1MvLZiqHI1NdedbJJ0uHMzy6T9hrMdWwMAJOnBcvB37f8
         92Q3+ehi4RAPudwHp+eu8YD4IshglNb9qM5sBr1xrWtZ/yzkytuO41xx8jk7hvKdBvdZ
         DRnGpsa/u4cp9MMvYqLZD1fN28+rZq2t00a5n9dNkPv6KeG4PPFvBHGYiokMwOtLIhoG
         GQrw==
X-Gm-Message-State: AOJu0Yy35My4E6GcPrJMeEYRY1w1nuVX/hHFXmdNlqbC7jx+g7Yd0K/B
	xtyZ5kEMcBZIzKER8qu+gfB6PA2rg4vGmdRTxYUxvvP0vso4AVhDO1Lw0lSxGQ==
X-Gm-Gg: ASbGncuxfG1U7S3VfQ9mKTGs3X7BxCKmOu9NQyLX7IfjbGqiXmr1NdUc9NPgG9w38nR
	53ciwCbPP/08kdTB3NFVetifmmNnGffSqHsbPCSS9pHiFUy3Lbfq3E2AUPimOLV2vt3jkqOypk/
	tq5SRUHTql/F4TWcX/q3M6dAWWFCjtMUKJjdieN82LuS16ZBVmU+/bJjC/rjD+lZZUeveGyX9nt
	rtzSN0I9SGIds8V1JYJ9BZvgOzw26h1keDh5zl1Yrxo4C+2TWblDP1UEL4w1xECdns7CEQ2JAaa
	Ji8riQQs2396s4y3LLvs48hBhPmtISH9TzsJYOpZOvBbehOAjpY+nOnncuoluIPFqtYlUKwBxsq
	wVAv1c3O+yjOMrHyVMFQUoLnlKNqRyw==
X-Google-Smtp-Source: AGHT+IGRtD/CowL0rztpF7jAU5osH7r4jUhKpipFK+kJa1qDdKWpLGqDUeRJBDPqA+9ikajicS00Mw==
X-Received: by 2002:a05:6000:1446:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39ad1759e02mr1973084f8f.28.1743066904509;
        Thu, 27 Mar 2025 02:15:04 -0700 (PDT)
Message-ID: <eb44921a-f6af-4aa9-9395-18e4e47d440a@suse.com>
Date: Thu, 27 Mar 2025 10:15:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/CPU: don't hard-code MTRR availability
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>
 <Z-UKm6D9pmAEaE_9@macbook.local>
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
In-Reply-To: <Z-UKm6D9pmAEaE_9@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 09:21, Roger Pau Monné wrote:
> On Tue, Mar 25, 2025 at 08:18:11AM +0100, Jan Beulich wrote:
>> In particular if we're running virtualized, the underlying hypervisor
>> (which may be another Xen) may not surface MTRRs, and offer PAT only.
> 
> At least for Xen, I think we offer MTRR uniformly, even on PVH
> guests?

By default we do, but we discussed the option of offering PAT-only environments
beyond leaving it open whether people disabling MTRR support in their guest
config are outside of supported terrain.

>> Fixes: 5a281883cdc3 ("Hardcode many cpu features for x86/64 -- we know 64-bit")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> My main concern is whether the !mtrr path is still functional.  Have
> you tried booting the resulting hypervisor with MTRR masked on CPUID?
> 
> (or alternatively short-circuiting cpu_has_mtrr == 0?)

I didn't think this would be a prereq here. If we boot in an environment truly
lacking MTRR, we'll crash on the first MTRR MSR access - none of those accesses
use the safe accessors. Since you asked, I tried booting with "cpuid=no-mtrr".
As I'm doing this on a system with console, all I can say is that it takes
minutes to reach the point where we'd start setting up Dom0 (which itself then
takes so long that I timed out waiting for it to make progress), due to all
screen output becoming unbelievably slow after AP bringup. Surely something's
screwed somewhere, as VRAM accesses being slow (or fast) shouldn't depend on AP
bringup having completed. I actually suspect it's not just VRAM accesses which
are slow, but that we're left running in uncachable mode altogether for whatever
reason.

What this maybe useful for is to figure out the reason of "Platform timer
appears to have unexpectedly wrapped <N> times", which I saw appear once.

Given this, I'm actually uncertain whether it is legitimate then to take your
ack.

Jan

