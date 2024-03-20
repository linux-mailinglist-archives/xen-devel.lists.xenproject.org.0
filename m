Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7D880CC8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:12:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695783.1085862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmr3P-0000Tt-H9; Wed, 20 Mar 2024 08:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695783.1085862; Wed, 20 Mar 2024 08:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmr3P-0000SK-EH; Wed, 20 Mar 2024 08:12:07 +0000
Received: by outflank-mailman (input) for mailman id 695783;
 Wed, 20 Mar 2024 08:12:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmr3N-0008LY-N0
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:12:05 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89923dd7-e691-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 09:12:04 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56bb5d61c5bso147419a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 01:12:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cn25-20020a0564020cb900b00568c3a2f4f8sm4387488edb.74.2024.03.20.01.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 01:12:04 -0700 (PDT)
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
X-Inumbo-ID: 89923dd7-e691-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710922324; x=1711527124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CGxf3MycNptbTWncpX1giDQU+gSfOXIouCwo19AQUo=;
        b=XCermbZT4SCmbxM6Zi+emZbhhOVr6ZmR2kUNp/N9Cyefr1uhOkSuss4SDo05Prb+mk
         jNAoNRQeoenOZ3WhqL3Jhj/aj3xvsRlEOScFG9jRfxzKM0lEyd7EOreblZdbxi0YYjXd
         //LhzA9DpJOZTBLP65Qh6Bc9gd6paPF1XeuBmI2iu1wzqWXWNnhRFG2OBd8v4J0PJHIV
         rYQTch4LsjWFXVu+Qb+8t346JbT8dFbE6LSdsidTmjk2US3Ad87l3Z1e7K9vYPriyFa7
         JmKgPI8aIhg/WS0fZGXeiLo0gaJtZ8RKjhrESxQp+QdKE7infcjNXHfcaEIuaN9VI/Ft
         wFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710922324; x=1711527124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CGxf3MycNptbTWncpX1giDQU+gSfOXIouCwo19AQUo=;
        b=oxJ4ZRAz1YN9doK99Lrxtk0Fj/3f4Y+PvY/uprZ2q3efjios4xo1umKeiOrx0dnS5l
         ad5iYnNJUTKNQRF0/3wOHQ3oQ0R21gvupk5zBRY67fgz88ouiM7j1vPZkN+P46NFojlF
         ZY36UweljwfuRCqvuRq66kpU2kVz10iNxhDdJFxn3h93N4zLYPSE2/fVYDbfPptq5QdB
         9NNPaM2ueslSE6kwF6WGnUGRde3YiH+ukFKv/PuKThl5d6l3lKDZGaEgc8VF6z1UwGHq
         b3Yi+yIz34SHz/5iQ45mi2SFas3KvsRdzaGL5KXjwH4IYULRjChKn62jpPWJv3gtx1mb
         TKtg==
X-Forwarded-Encrypted: i=1; AJvYcCUDuRtvaCSSsLUfUj0Dm7TxsEXy/ha9TK/XZ5F3l1Tml5bVRQdLPcGuwHXyjmFqSSzf44Jiy1SUi6l+K4xUJtLCHZFbIhFPUr3t03HhQKM=
X-Gm-Message-State: AOJu0Yy4Gizw/TVANUw6y5u8HumTKPH2ABGrj3SQ3ellRc3iuGdhJTJ4
	iUaxBtNYCO5xopj1JrdNvjs0Pns1EjqnJVTIFukmK/mtqlvYOUHOmjY2THC0UQ==
X-Google-Smtp-Source: AGHT+IHkaX6ndr3rADLs8AsbvcWPacZ76T78O6OKZbga7mD21DLVR9sdWIe8mf952tdfcX2Ge5Tfug==
X-Received: by 2002:a05:6402:159a:b0:568:9fc9:ec72 with SMTP id ij26-20020a056402159a00b005689fc9ec72mr780372edb.35.1710922324453;
        Wed, 20 Mar 2024 01:12:04 -0700 (PDT)
Message-ID: <e8898bca-7dd2-4e40-acc0-72c4d7da1d1d@suse.com>
Date: Wed, 20 Mar 2024 09:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/features: More AMD features
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
 <8eb3d0d4-daf2-40a4-83b6-d3726e02814f@citrix.com>
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
In-Reply-To: <8eb3d0d4-daf2-40a4-83b6-d3726e02814f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2024 18:40, Andrew Cooper wrote:
> It occurs to me that I need this hunk too.
> 
> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
> index 25d329ce486f..bf3f9ec01e6e 100755
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -329,6 +329,10 @@ def crunch_numbers(state):
>          # In principle the TSXLDTRK insns could also be considered
> independent.
>          RTM: [TSXLDTRK],
>  
> +        # Enhanced Predictive Store-Forwarding is a informational note
> on top
> +        # of PSF.
> +        PSFD: [EPSF],
> +
>          # The ARCH_CAPS CPUID bit enumerates the availability of the
> whole register.
>          ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
>  
> 
> To cause EPSF to disappear properly when levelling.

What exactly is wrong with exposing EPSF when PSFD is not there? (The PPR
I'm looking at has no mention of what exactly the bit means, and hence
whether e.g. it indicates PSFD can be avoided in certain use cases.) When
leveling across a pool, EPSF may need hiding, yes, but that would need to
be a result of admin activity, not by introducing a fake dependency. Just
consider a pool with PSFD supported everywhere, but not EPSF: The admin
would then still need to take action to make sure EPSF is uniformly
invisible to guests.

Jan

