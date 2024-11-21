Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4549D4AEC
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 11:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841303.1256788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4TH-0003bU-7J; Thu, 21 Nov 2024 10:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841303.1256788; Thu, 21 Nov 2024 10:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4TH-0003ZA-4Y; Thu, 21 Nov 2024 10:31:35 +0000
Received: by outflank-mailman (input) for mailman id 841303;
 Thu, 21 Nov 2024 10:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE4TF-0002rL-2w
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 10:31:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4f3a3d3-a7f3-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 11:31:29 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so6340945e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 02:31:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b463abbfsm53074365e9.32.2024.11.21.02.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 02:31:28 -0800 (PST)
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
X-Inumbo-ID: c4f3a3d3-a7f3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC13bTEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM0ZjNhM2QzLWE3ZjMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg1MDg5LjY5NTYyMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732185089; x=1732789889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4WNq5nSdRGoU4dZQkTnmTjSNjuiFjZFs91toyRlB4FA=;
        b=fuEz0glHEbFBw9Qlbbz/t7CUBf2SJhYOJYBlup/jmsnFuMoFbsI5xQxF8rKop4H7LU
         4y7KBZ+t+QnDYMhaL5SVB0X1WK+hslz5LHlIumTfymWNFWWpOifDsZVxrkY3jwaLbur4
         t1KNSvFX1SN2wSst9ziexfPKA+3LKWWwh5nnEEVvLfCA1eXbM+PAzcRqDc0MQc+ohtJ6
         e0rybIPyTKgnhClmjBoWEfRI25+fbie2h27VjKF2+9ykzfNuxIB7JdEXnfuV63o2VKXJ
         C+pqaX8n57a/qbfxEz+en8+ZwrnKQiizmfTArdIfhO/CrFkUrWBVRl+fI/o6QRPKvV5A
         /waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732185089; x=1732789889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WNq5nSdRGoU4dZQkTnmTjSNjuiFjZFs91toyRlB4FA=;
        b=vKOyC+j1PeaWqJD0+adzg9w6azKqhSoar8NRoXq7qxuLLmS4cELD8mX2WK4/Dq/fFZ
         +4yH1W0/rTUlDgaWjCkzJWQYJrwcNFWkfLacfDtfOnnt3xjjMffHthOtH7VpLlUP6aNP
         2xuZtc1dMr6aNgdjP2m4j8AcQvUIMHCGG6PVUQBjFBixW4FHmdypQvcgjrYzZjWwhRsR
         BlNeWzCUCgC1YdHtURmURTfNeUqvMSHLuWNOeGHKAzhT/xR/I/5D2ri//bCuI2w21Uyp
         Fx0PE8E5cKWNVhjBsIoMnVZO3b08KV6zS6KuaZzO6MZ4AdfEckXgk+Ase4dJN485bYf3
         PHmg==
X-Forwarded-Encrypted: i=1; AJvYcCULullm7AWjQP8HL3eZUeFogxyO6284QMQItTfVfrH/3McDYJiRSbN38+bA0RvAQ4sy8K5aTDB8+iU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYwDX2V4jtfWyHXHQ2cmGOlRNC3g6UvYz6vi0KEs2c2eSvymwk
	YpJs+y4MP1xOV59Yqb8zaBtyr2lp+1X+BxjyPcHAtu/IT/RpNw4H9Keq4B6L2g==
X-Gm-Gg: ASbGncuTcRg7C3P6EGZzio2n29p1Pio1JHkjzuqIFvMMl6s4e0/YdAbAGMGvc189NPI
	4ZsSZmSCXq+KNX+h+MsaYl047HQ6R+yJYLxqX5SV3zhZuXO5hPi6khLkvGvpp4op/P4oh4AWU9T
	YoAg8GtNl2zbCPbNifgBdTd013P9lVhmvkae0KAYl17uQkd/krFyMeluuorMrjkWkjrDd0rLltf
	vbMD1ZeIha0vTN+dPArfwt/wjB+UIrnJ2cV1lGg6M3zRnGDDtKaZtGfP3WFy+qhM4MHa6C03T/c
	iRh+gaQQ5jIOHSiu66vUO3YrM1jktz/pduE=
X-Google-Smtp-Source: AGHT+IFjTCOuqaAtS4ExEVofWtXNHOjNADRBNcS3Y/Et6LfEDIiOiZ0pNwAxgb3tMIiU1a8wA4W5zg==
X-Received: by 2002:a05:600c:3ba6:b0:431:5df7:b337 with SMTP id 5b1f17b1804b1-433489b3414mr51873285e9.8.1732185088403;
        Thu, 21 Nov 2024 02:31:28 -0800 (PST)
Message-ID: <ec976c12-6f7c-4a52-810c-b0f23ef465fd@suse.com>
Date: Thu, 21 Nov 2024 11:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Only rescan features on successful microcode
 load
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241119215827.2891332-1-andrew.cooper3@citrix.com>
 <590cc46e-c4e2-44bc-b339-6ffc609314ce@suse.com>
 <b8776e87-0975-43a6-886c-95ec98d0c357@citrix.com>
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
In-Reply-To: <b8776e87-0975-43a6-886c-95ec98d0c357@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2024 14:50, Andrew Cooper wrote:
> On 20/11/2024 10:50 am, Jan Beulich wrote:
>> On 19.11.2024 22:58, Andrew Cooper wrote:
>>> There's no point rescanning if we didn't load something new.  Take the
>>> opportunity to make the comment a bit more concise.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>>
>>> @@ -911,14 +915,5 @@ int __init early_microcode_init(struct boot_info *bi)
>>>  
>>>      rc = early_microcode_load(bi);
>>>  
>>> -    /*
>>> -     * Some CPUID leaves and MSRs are only present after microcode updates
>>> -     * on some processors. We take the chance here to make sure what little
>>> -     * state we have already probed is re-probed in order to ensure we do
>>> -     * not use stale values. tsx_init() in particular needs to have up to
>>> -     * date MSR_ARCH_CAPS.
>>> -     */
>>> -    early_cpu_init(false);
>>> -
>>>      return rc;
>>>  }
>> In principle with this rc could be dropped from the function.
> 
> Oh, so it can.  I think I did so in an earlier attempt, prior to
> deciding to go down the route that is partially committed.
> 
> I'm happy to fold in the removal.  The incremental diff is:
> 
> @@ -873,7 +873,6 @@ static int __init early_microcode_load(struct
> boot_info *bi)
>  int __init early_microcode_init(struct boot_info *bi)
>  {
>      const struct cpuinfo_x86 *c = &boot_cpu_data;
> -    int rc = 0;
>  
>      switch ( c->x86_vendor )
>      {
> @@ -913,7 +912,5 @@ int __init early_microcode_init(struct boot_info *bi)
>          return -ENODEV;
>      }
>  
> -    rc = early_microcode_load(bi);
> -
> -    return rc;
> +    return early_microcode_load(bi);
>  }

Please do.

>> It's then further
>> unclear why early_microcode_load() needs to be a separate function, rather than
>> simply being inlined here (as I expect the compiler is going to do anyway).
> 
> Both cognitive and code complexity.
> 
> "Probe and install hooks" is separate from "try to load new ucode if we
> can".
> 
> They've now got entirely disjoint local variables, and the latter has
> some non-trivial control flow in it.  It's liable to get even more
> complex if we try to allow CPIO in an explicitly nominated module.
> 
> More generally, a separate function and internal return statements can
> express control flow which can only be done with gotos at the outer
> level, even if we fully intend the compiler to fold the two together.

Fair enough.

Jan

