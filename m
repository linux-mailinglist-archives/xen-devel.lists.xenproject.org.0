Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCC84220D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 11:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673299.1047645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUlnv-00062P-8n; Tue, 30 Jan 2024 10:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673299.1047645; Tue, 30 Jan 2024 10:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUlnv-000603-5i; Tue, 30 Jan 2024 10:57:23 +0000
Received: by outflank-mailman (input) for mailman id 673299;
 Tue, 30 Jan 2024 10:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUlnt-0005zx-RH
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 10:57:21 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5739a727-bf5e-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 11:57:20 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d043160cd1so25894671fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 02:57:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u6-20020a02c046000000b0046e33e82782sm2201812jam.135.2024.01.30.02.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 02:57:19 -0800 (PST)
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
X-Inumbo-ID: 5739a727-bf5e-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706612240; x=1707217040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EILlXkC10ljAeFYKYbS2r2JFygvm/jGCzYzUxI6Xrg=;
        b=L8p7MWWEWnPh2aMos+wZ24nHBJaQ/FFp5RxELzuXu4ydUZvUQObOAeQPhPXcZzxOYl
         JTGqF14F3rv8IUucfRobD6zREqeIUeVA16vHtA8ktv6Ac8ChmoB+BKSrVowILuzEGksq
         i01eh8E8YL1kP/c7VcUOQeyMVTmxIda/4dkXNcDSdXBRyjvQnJnfG8kQ9knJ5wfkjQXT
         StPCCNF84oEBY+qnN5A1uMIiKh8NPF4fw8Wjal4/HhdqOH9qOePWC6YqRDmcCIh/MKGc
         lA+0q+8xOSW1ze/ONcwvdO3Zb4IBND0W4Of1q3hybi+nw0Gws9e80vR7HJWTgWOLLVAN
         1uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706612240; x=1707217040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EILlXkC10ljAeFYKYbS2r2JFygvm/jGCzYzUxI6Xrg=;
        b=pxIdBF4+NZC797Aqm/INdXQEkDBpHeG7CwMNOO1PfGnIZeTPwV3NsBSeQA988yC4lW
         vFHMMGVa0Sr+hqrf7bfXxeMSAKCZqhd9pbzBoYb5NcfFQmVR/4Uge/67c0Eftm7T9Plt
         yvs5fQD/6ORTakLNV8U0pCeRjvzD+wxT85CVbvJ2IHdn94vILwr8OpHijW+avbFK2wOD
         oSNnbX1njeNAl9EONOsnur6bHuse+NzXVr22oK/l5ao8lkmj9OQ6k8HxzPm/5R3bUZop
         I5SCnF+ix5cjux2LnNUM2Q7LYwHWe6jnaIg2c3X+zFvpSZBH3t57seafYjXzH9V7N7zx
         6nUw==
X-Gm-Message-State: AOJu0YzsT7VWqbsZkutSAlbY6zcPaH/N4k7PiON749SX3LcqaTGrkgUJ
	sODbcqKc3cXa/JopRH9srfR7mr+Bwf5M3ju5dvpCa8wdaWO5Yeb10zE7q1Y8cw==
X-Google-Smtp-Source: AGHT+IEPQ0uoAZlSXnmQWXMCImA84RzUI3bY2xKCNB7/k0EsIuuNu+qHMU+/31kUMBEdltudRJHDJg==
X-Received: by 2002:a05:651c:d7:b0:2cd:1ca6:87bf with SMTP id 23-20020a05651c00d700b002cd1ca687bfmr4953787ljr.8.1706612240251;
        Tue, 30 Jan 2024 02:57:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWjsnjOLxK7nPICdwTXiYBJmNilmPs+lXWPqzcr0xfiqoRDRLHteAm7yu2mFQOJgVIpczYCUNswjNWQPMmlSvAcEKwHlc+rdg2+f2Ngd/tnY4m9DQTChMylheI=
Message-ID: <3959f556-6177-473e-a052-bec11b5a8a9b@suse.com>
Date: Tue, 30 Jan 2024 11:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/intel: expose IPRED_CTRL to guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130091400.50622-2-roger.pau@citrix.com>
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
In-Reply-To: <20240130091400.50622-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 10:13, Roger Pau Monne wrote:
> The CPUID feature bit signals the presence of the IPRED_DIS_{U,S} controls in
> SPEC_CTRL MSR.
> 
> Note that those controls are not used by the hypervisor.

Despite this, ...

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -324,6 +324,9 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
>      return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
>              (ssbd       ? SPEC_CTRL_SSBD       : 0) |
>              (psfd       ? SPEC_CTRL_PSFD       : 0) |
> +            (cp->feat.ipred_ctrl ? (SPEC_CTRL_IPRED_DIS_U |
> +                                    SPEC_CTRL_IPRED_DIS_S)
> +                                 : 0) |
>              0);
>  }

... if I'm not mistaken exposing SPEC_CTRL bits to guests is independent
of whether we write SPEC_CTRL on entry to Xen. Therefore I think in the
description it wants clarifying why it is acceptable to run Xen with the
guest chosen settings for at least the DIS_S bit (assuming that it is
okay to do so). Likely (didn't look there yet) also applicable to the
further two patches.

Jan

