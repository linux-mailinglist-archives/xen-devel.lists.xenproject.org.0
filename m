Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD5A775A1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 09:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933587.1335498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzWPe-0001wv-Ux; Tue, 01 Apr 2025 07:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933587.1335498; Tue, 01 Apr 2025 07:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzWPe-0001vW-SD; Tue, 01 Apr 2025 07:51:58 +0000
Received: by outflank-mailman (input) for mailman id 933587;
 Tue, 01 Apr 2025 07:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzWPd-0001vO-AI
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 07:51:57 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e52d6e9-0ece-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 09:51:55 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so10653235e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 00:51:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a420bsm13190188f8f.82.2025.04.01.00.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 00:51:54 -0700 (PDT)
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
X-Inumbo-ID: 2e52d6e9-0ece-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743493915; x=1744098715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mpvQjVE4nbCDZ2c9KzZCEqNpXJTESDU+FczLteCD6AQ=;
        b=RsU0Hxdw+NLwl6dlUf36wag+Zspre32MK9SdEad4mb3DJfRfezK2oLMu0GDLJ9x9g9
         PZFITM2jbWNz0R2Wmmgv5W3Qp8Pxgsx1VvbOgqvKtHFyPhZrhEraRHgRckhiHHvWQBWu
         QfNGLFl/TsCHVB63o35aHWJNHtyVbzi58/S0B9Z7+Xz5G8B/TUMjD3bmKkiWEjeFFFDI
         xZLDh3orkgT/xMQQIoCkbm/ZNXCT9l0nFDQ0bBrVO5QWdvNwBFnGStrjx+Qmd6zFmypI
         eCbe8yScUq4MUh4u4qeMC0k99KOp7vOyzM22h+h7bOaBJt3P582FR1C4mezaX/pllc+H
         tu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743493915; x=1744098715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpvQjVE4nbCDZ2c9KzZCEqNpXJTESDU+FczLteCD6AQ=;
        b=Nl5Vq1wek3qm5T6Y43FS2EgeHq9pARE8WdpKFBAVLMh9J1KTbxaq47YOoxc5GtKc6p
         AI6xurO2KYmFImdECxAszSz/BXRdluhWkyfQpx5rTzHz/598oWhzHyYNLf2D/Nx9+roR
         VH4sfmXtqAGKVwCLIAQL8GQGUbXJixBi8ZT6ppQ1mhPGsIrgijkIbkmQ3mnSFJTyl7hj
         wOyPJmVLAwi3Ew8m9Fb3ekcLG9bItlM2/w1GMA7IiBrVOYBWRVDfpKKONpwo1n9+LLRE
         NltQ6LKmHBUWcIUqtWcjaPXg0bsw7yjfIZmiVbktUSALYFjcUF2cQZJUHSyKfUzq6BNw
         d0Og==
X-Gm-Message-State: AOJu0YxfH1AI1b+A9ZQ6Pk6DLW7xWu3Xef4KBjvpRnGsovQIrnsASaxc
	lfYIXAhrIfpzAx3+Sx44u2LMuAW3BrCpghMzPHGJ/ThTJeZ2iHZYMRDLCkKL2g==
X-Gm-Gg: ASbGncur36MikPR3Z6mLslCzvkzmeQNOmqhx6WP1l2q3afeBfsYEI4sc8AYho3jkFYg
	vR0IeKLOxdnbAOvfu/gpEdeEtsdRoh9ZCTJsGeq8dDtLdaVp4266Ska+Dmtxt7FE55aU/klaV0i
	eJ+Log1mbH2L3Xkp2R1kH/El5WQsMTiHl+AK4+8cLtqil5KtyaBDkDFZ7ce0mx7sCgZk53nrMNH
	dW0wI+IXRgMCBXDLgu9sdSRWQe4Wbg8MscGOfr1VxdpHQYVxF3ouO16z8L95zgw+4l34kLUK9Dh
	drGBpaGHMnjnsIpa2cZhqDvkS3EtbQGGOUDAXlExlyyFh60n4VtFjQBBLWfxo6J2grddW4PsRKs
	vqXw4n42Goq5XbtHBBvseRJMTFNxn4g==
X-Google-Smtp-Source: AGHT+IFizIHLI6SAMM3YYa5w0n97QKUKvt6ksD+hRGMaMycnpICGSm6JX1DTnnkgT0Rrb3AQkHnN8Q==
X-Received: by 2002:a05:600c:1c11:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-43dbc70a243mr110259475e9.31.1743493914727;
        Tue, 01 Apr 2025 00:51:54 -0700 (PDT)
Message-ID: <e87e77ea-0d5b-4fca-abe9-abbb0688ca28@suse.com>
Date: Tue, 1 Apr 2025 09:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/domain: revisit logging in arch_domain_create()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 sstabellini@kernel.org, dmukhin@ford.com
References: <20250331213406.422725-1-dmukhin@ford.com>
 <Z-uO4X_mk8QycVVe@macbook.local>
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
In-Reply-To: <Z-uO4X_mk8QycVVe@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.04.2025 08:59, Roger Pau Monné wrote:
> On Mon, Mar 31, 2025 at 09:34:24PM +0000, dmkhn@proton.me wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -798,13 +798,12 @@ int arch_domain_create(struct domain *d,
>>      {
>>          if ( !opt_allow_unsafe )
>>          {
>> -            printk(XENLOG_G_ERR "Xen does not allow DomU creation on this CPU"
>> -                   " for security reasons.\n");
>> +            printk(XENLOG_G_ERR "%pd: Xen does not allow DomU creation on this CPU"
>> +                   " for security reasons.\n", d);
> 
> Since you are already touching this, I would switch to gprintk, and
> avoid splitting the lines:
> 
>             gprintk(XENLOG_ERR,
>                     "%pd: Xen does not allow DomU creation on this CPU for security reasons.\n",
>                     d);
> 
> Same for the other messages below.

IOW you see value in also logging current->domain?

What I'd like to ask for when touching these log messages is to get rid of
the full stops.

>>              return -EPERM;
>>          }
>>          printk(XENLOG_G_WARNING
>> -               "Dom%d may compromise security on this CPU.\n",
>> -               d->domain_id);
>> +               "%pd: domain may compromise security on this CPU.\n", d);
>>      }
>>  
>>      emflags = config->arch.emulation_flags;
>> @@ -814,16 +813,19 @@ int arch_domain_create(struct domain *d,
>>  
>>      if ( emflags & ~XEN_X86_EMU_ALL )
>>      {
>> -        printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
>> -               d->domain_id, emflags);
>> +        printk(XENLOG_G_ERR "%pd: Invalid emulation bitmap: %#x\n",
>> +               d, emflags);
>>          return -EINVAL;
>>      }
>>  
>>      if ( !emulation_flags_ok(d, emflags) )
>>      {
>> -        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
>> +        printk(XENLOG_G_ERR "%pd: Xen does not allow %s %sdomain creation "
>>                 "with the current selection of emulators: %#x\n",
>> -               d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
>> +               d,
>> +               is_hvm_domain(d) ? "HVM" : "PV",
>> +               is_hardware_domain(d) ? "(hardware) " : "",
> 
> I wouldn't use parentheses around hardware, but that's just my taste.

+1 (provided we really need this extra property logged here)

Jan

