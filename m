Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E7867525
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685510.1066321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaDk-0008IZ-Pw; Mon, 26 Feb 2024 12:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685510.1066321; Mon, 26 Feb 2024 12:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaDk-0008GX-Mi; Mon, 26 Feb 2024 12:36:36 +0000
Received: by outflank-mailman (input) for mailman id 685510;
 Mon, 26 Feb 2024 12:36:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reaDj-0008GR-Ng
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:36:35 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac88e8e5-d4a3-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 13:36:33 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so3883422a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:36:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f21-20020a056402195500b005648b000e91sm2311515edz.92.2024.02.26.04.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 04:36:32 -0800 (PST)
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
X-Inumbo-ID: ac88e8e5-d4a3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708950993; x=1709555793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zisu0hMuB2wPFsEF8XASd5RZmHjK9uNXa/zjNVFsyZA=;
        b=CRgbLONljPsOgHPMZ6co+8/ozkvBQqc97QLrQbyzE30Oq2Tvcd84S9FEFsMUWl6L8H
         OqoCgrpvulWZ5hIewtBfmkfqv6VV5An8m8tZ+oywbnivtLFehhTSlDCrqnV7XJiVUl1p
         q2D5+wD0PAk5baSSdZbqwGx28VIyE4QHTN2JJtzLwIeuqnSIO4qaXqoJicmYa0+TVeh0
         cZUqYtIseOLZ3XgD/dgDrhvYXOexprTLs2X8Iut2P5amgNlFF6OHvFx7QvRSRFeH1iqe
         luLZsqMq4Px7ey3UwOVeGM++bkEOxIMVniRN16bgudkkDr5lO07BIfA3z76QPkxaq2tD
         WdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950993; x=1709555793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zisu0hMuB2wPFsEF8XASd5RZmHjK9uNXa/zjNVFsyZA=;
        b=TZ8A53XJEEuV4HzUvA/dZATboE2T78ND75CPvtjOwdC8moqKMIwp83knHCjXNeAhnx
         UhC7cs+i1gi3rla15PZz1OQf0s0K+LHcDx9yl48ihXoAdebrBz5OFN9uQkWX8cXJyWme
         tcHEiekkfyIZZiCagASfCtLgsyP0dXB7EaDf+Fov0dlcwboeyzM8YYAKI6UyvQEKsah7
         iasvL+iAmPQdJ2axvjArwSHmidOb87xNzMtlMHV0WPLYcUICy+2/3gBVtANrB1SFN89G
         dUHSx+tsLFuYDa8c6TV53+lyrs9qYvKOokDFSOey0LnD79ecUNSi/KLgWLCJDjnG799d
         plcg==
X-Forwarded-Encrypted: i=1; AJvYcCXkdqAzmWE+r7wttzQsIsD9dtSENwSkGcVf2sA12iQpy4pUT21KNEuEkMJLwjcxkwhbqhCCIaKqhnKXXW5g+6V8xvPbvdZTPli8ycHIUzA=
X-Gm-Message-State: AOJu0Yxn7505KlFmlBZely7oR60OjjwW9yKgm2Uj73y8vBTWZfUa4Pgv
	s8CFCixLp9MQDjvZZI7/gaCw8FAFLi76FFtfk+8+DoSXKsV5BiQLCCqOXvYBRw==
X-Google-Smtp-Source: AGHT+IFsrWDARmjctDxFfbnwHdMd3z1O7W8P6RbJM63IhabM4sntY2fNA/vNJrr5tUQ6McvNJHI1yg==
X-Received: by 2002:aa7:d912:0:b0:565:6c31:9a47 with SMTP id a18-20020aa7d912000000b005656c319a47mr5382340edr.39.1708950993157;
        Mon, 26 Feb 2024 04:36:33 -0800 (PST)
Message-ID: <116a9e07-4a6a-4170-bf0f-3a7ccbd68f0e@suse.com>
Date: Mon, 26 Feb 2024 13:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] xen/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-4-roger.pau@citrix.com>
 <670e4a5e-4eec-4a2c-9ed1-fcc164b1d76c@suse.com> <Zdx26DwTvcB2zcbw@macbook>
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
In-Reply-To: <Zdx26DwTvcB2zcbw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 12:32, Roger Pau Monné wrote:
> On Tue, Feb 13, 2024 at 04:58:38PM +0100, Jan Beulich wrote:
>> On 07.02.2024 15:55, Roger Pau Monne wrote:
>>> The minimal function size requirements for an x86 livepatch are either 5 bytes
>>> (for jmp) or 9 bytes (for endbr + jmp), and always 4 bytes on Arm.  Ensure that
>>> distance between functions entry points is always at least of the minimal
>>> required size for livepatch instruction replacement to be successful.
>>>
>>> Add an additional align directive to the linker scripts, in order to ensure that
>>> the next section placed after the .text.* (per-function sections) is also
>>> aligned to the required boundary, so that the distance of the last function
>>> entry point with the next symbol is also of minimal size.
>>
>> Perhaps "... minimal required size"?
> 
> Yes.
> 
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -395,8 +395,11 @@ config CRYPTO
>>>  config LIVEPATCH
>>>  	bool "Live patching support"
>>>  	default X86
>>> -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
>>> +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && CC_HAS_FUNCTION_ALIGNMENT
>>>  	select CC_SPLIT_SECTIONS
>>> +	select FUNCTION_ALIGNMENT_16B if XEN_IBT
>>> +	select FUNCTION_ALIGNMENT_8B  if X86
>>> +	select FUNCTION_ALIGNMENT_4B  if ARM
>>
>> This isn't strictly needed, is it? Would be nice to avoid re-selection
>> of what the default for an arch is anyway, as otherwise this will start
>> looking clumsy when a couple more architectures are added.
> 
> My worry was that the default per-arch could change, ie: for example
> x86 moving from 16 to 8 and then it would hamper livepatch support if
> IBT is also enabled.  I however think it's very unlikely to reduce the
> default alignment, and in any case we would hit a build time assert if
> that ever happens.
> 
> So yes, I'm fine with dropping those.

Oh, no - not "those", only "that", i.e. only the last (Arm) one.

Jan

