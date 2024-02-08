Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B22584DAAE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 08:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678001.1054994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXyqO-00058i-EB; Thu, 08 Feb 2024 07:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678001.1054994; Thu, 08 Feb 2024 07:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXyqO-00055x-B7; Thu, 08 Feb 2024 07:29:12 +0000
Received: by outflank-mailman (input) for mailman id 678001;
 Thu, 08 Feb 2024 07:29:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXyqM-00055r-GL
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 07:29:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf134073-c653-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 08:29:09 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3392b12dd21so952276f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 23:29:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bq8-20020a5d5a08000000b0033b55186901sm1243690wrb.94.2024.02.07.23.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 23:29:07 -0800 (PST)
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
X-Inumbo-ID: bf134073-c653-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707377348; x=1707982148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfjQHRPN3metDdrirwzAwxK0e7/WGzBowxCDPw/EbP4=;
        b=INrv8cxze+QA86beOJxOE3yMqSyzWnLQ6OixtF3KTLZicap4hTHDdnN1VzSj0w09+6
         luAlpOkeT9Bf+eTjTfwI2Mdco7YM1q+otKU4AwaYLoZLK9VExno8rRAp76ZvVyzuvny/
         AuLc0MhH7EKL2eW6zn6Mu6ivJFZ7MTwOTwaWiW2pOByEBR+isBkyT/iJiDLFOAM6+5NH
         ettv/wG9M4qFibMCyGZcfcpuOK0ebY2pdegsG0KOeMvnd8Ukz9wqQoOIjgPEMDjHpcXa
         AdSfsF8qwv/xwzNQQzmnf/H9iQwXPNz7matzV3S8nu9C3obM06OZUuudt4ECrfBbG/Hi
         L5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707377348; x=1707982148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfjQHRPN3metDdrirwzAwxK0e7/WGzBowxCDPw/EbP4=;
        b=m9AiAILR9NxXdVRdD3v5/5nctPNsVe5dGzFSsYNEeeREznJHGkQzMC8iDGJJmwpZ9U
         JL5FLHIvXrf2DeHvhhcjPBruLVWlbcmLUt6df29CHaNuuVp0idWxyivSNHkTD8OssiSc
         RsqvKgLD+KeefJHNurzGDSSvNU5WFU898PKmLdp/d5p/u+UIEtMDF4ngBqTviBHmUfCa
         lfKKMRBBgP3NXFSTG9HSB1UdsCtNkq/efjIr9opBImmJ3XpHVOW7MLBnkO6jJfmYq08D
         3yVHgF92UGyYYMXJ8hW4SE/v/qxfl85nw95jE9Izsu9fgXesuE1fxyqTUQWD/Z1eBFEd
         nZsw==
X-Gm-Message-State: AOJu0YyykdmOtkySS7rgd3iIv7iqqmOGSeqqHof4DUzmHGqcrdbTqi5h
	RZ1yld954WLXLDyj8cEI9+ST/1VbHo+oJFX7uYjtdm5FZXswGtnghd8Xfs38hQ==
X-Google-Smtp-Source: AGHT+IEmDUBeQgKKCT9mdpB9+e++W9/X9MZX6yqxefpE0AWm1Z0Hqpp8l4j6aa/GjMLitWWmhs2ApQ==
X-Received: by 2002:a5d:634e:0:b0:33a:edf8:b8e6 with SMTP id b14-20020a5d634e000000b0033aedf8b8e6mr4685967wrw.58.1707377348125;
        Wed, 07 Feb 2024 23:29:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIRcCwDjA+mo7vfknLPuzkGyss9vN4mVn/cDhFs5SOz6q4krvoTTopMqpqEogJzAmGamh3uh/FUiORTI/fD64vKnFaEjPc2NuJCtnAGpNurBajhyvdFZAhA3DJNVGCnOwtc6r7ybQ0xAeV7dMV9icj
Message-ID: <0d776dcc-af14-436a-bf8b-9bfb39b787b8@suse.com>
Date: Thu, 8 Feb 2024 08:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/9] x86/smp: drop x86_cpu_to_apicid, use
 cpu_data[cpu].apicid instead
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <8121d9b472b305be751158aa3af3fed98ff0572e.1699982111.git.krystian.hebel@3mdeb.com>
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
In-Reply-To: <8121d9b472b305be751158aa3af3fed98ff0572e.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 18:50, Krystian Hebel wrote:
> Both fields held the same data.

Supposedly the same data only. They come from different origins, and you're
hiding this quite well by leaving all sites in place where the field is
written. Both items are also used for entirely separate purposes. So you
need to
- explain why both sources of information necessarily provide the same
  data,
- especially if there's remaining concern from the above explanation that
  the two values might end up different in corner cases (running
  virtualized ourselves comes to mind as a possible example), explain why
  nevertheless it is fine (risk free) to use the consolidated item for
  all of the originally separate purposes,
- either explain or do away with the multiple places setting this single
  remaining field.

> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -61,10 +61,8 @@ unsigned int __read_mostly nr_sockets;
>  cpumask_t **__read_mostly socket_cpumask;
>  static cpumask_t *secondary_socket_cpumask;
>  
> -struct cpuinfo_x86 cpu_data[NR_CPUS];
> -
> -u32 x86_cpu_to_apicid[NR_CPUS] __read_mostly =
> -	{ [0 ... NR_CPUS-1] = BAD_APICID };
> +struct cpuinfo_x86 cpu_data[NR_CPUS] =
> +        { [0 ... NR_CPUS-1] .apicid = BAD_APICID };

Nit: Stray blank after closing square bracket.

Jan

