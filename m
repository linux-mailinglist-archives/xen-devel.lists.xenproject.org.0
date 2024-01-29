Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D4840013
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 09:29:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672905.1047000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUN0M-0002HX-D8; Mon, 29 Jan 2024 08:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672905.1047000; Mon, 29 Jan 2024 08:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUN0M-0002Fr-AR; Mon, 29 Jan 2024 08:28:34 +0000
Received: by outflank-mailman (input) for mailman id 672905;
 Mon, 29 Jan 2024 08:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9RcU=JH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUN0K-0002Fl-L4
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 08:28:32 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6266bd93-be80-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 09:28:31 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cf4a845a76so30613271fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 00:28:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p24-20020a6bce18000000b007bf78513320sm1962250iob.1.2024.01.29.00.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 00:28:30 -0800 (PST)
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
X-Inumbo-ID: 6266bd93-be80-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706516910; x=1707121710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaZ2tcGSaX7VCpnRnCnK1mvXI78HkGLzoJX4dQ4dMZA=;
        b=BcZcyhUBeDQO/GzIooFH/PxJx58tPYMoBu3IRGqShltUhv7qpqIuhDadhYCVKW6i2m
         xk6uKGlkGMoQkx/FnB29B8INegL3BPJHjLl8sCVdryKAYko9EgjdRNvFdQiDAcbKDsXY
         qViGUc3BrLoYX8s6Oz5A3+hBZuL62pQOZ52TNrKaP+OGCii+TUq3V1AoCUtUrNjBjhzH
         nrd2bX7FNTxi8w2TEIcX9mYOOUO35G34kDliyXDQskShPyxjPFStwbFPiFJGuetgpekP
         Z03uaode8smLXePmKK7b2g/zi1MilOk4sJMKRfcRVchaSJvg0TRGAT9wK+o1wLJPLMGQ
         K6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706516910; x=1707121710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaZ2tcGSaX7VCpnRnCnK1mvXI78HkGLzoJX4dQ4dMZA=;
        b=Fl5WBIrJ1cEot0DkabxEZn48bypgaQXyd/TbFZ7kp01KvCXAP6hdrPCXOpQKX/M/xs
         HKhrmt2mtM43QMWN886nln1IMl0ROhxVfPxzhjNQHEOx68aVi6kUXhDaInPDepTpEya/
         ysJD2dKCxzKXu4PHAZTapM2pSRoy0vipv40piphEczQYuK8AebM3UaPQxekBgEpuO+fh
         ++epbZrpFA+myQm/IfaBk7MgL08wMdxRS+T0J7ikIjSyBhVVAvUL1eEoEAYJjM3SDQNN
         4nBGh+xzA4g3850lnVBiW3LEI14hkn9QUyOsbmoyXcchnuDxX1vdTvJ8HMl8/CvNDH4J
         1PQg==
X-Gm-Message-State: AOJu0Yyea+UkvVxMWJ2XY+Sk75Ex7k0SbNqKciukY9s9Vkc9O/hx9paU
	TBcd17yMTGI8dZ7LU95faUB9zyizSF87cfxGdYjsia8KT9J084570YfLJGphyg==
X-Google-Smtp-Source: AGHT+IHUDjym+ewyAmVN7LZNSqI8e+elbMQBD9dvDNgGPIz10SiCJB/Ma5H/yoG1V/bk5Y6JCzeNNg==
X-Received: by 2002:a2e:a405:0:b0:2cf:1535:9307 with SMTP id p5-20020a2ea405000000b002cf15359307mr3136807ljn.52.1706516910633;
        Mon, 29 Jan 2024 00:28:30 -0800 (PST)
Message-ID: <04d113bf-71ab-4eba-a95f-72318c888d1f@suse.com>
Date: Mon, 29 Jan 2024 09:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 00/27] Remove the directmap
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> Elias El Yandouzi (3):
>   xen/x86: Add build assertion for fixmap entries
>   Rename mfn_to_virt() calls
>   Rename maddr_to_virt() calls
> 
> Hongyan Xia (13):
>   acpi: vmap pages in acpi_os_alloc_memory
>   xen/numa: vmap the pages for memnodemap
>   x86/srat: vmap the pages for acpi_slit
>   x86: Map/unmap pages in restore_all_guests
>   x86/pv: Rewrite how building PV dom0 handles domheap mappings
>   x86/pv: Map L4 page table for shim domain
>   x86/mapcache: Initialise the mapcache for the idle domain
>   x86: Add a boot option to enable and disable the direct map
>   x86/domain_page: Remove the fast paths when mfn is not in the
>     directmap
>   xen/page_alloc: Add a path for xenheap when there is no direct map
>   x86/setup: Leave early boot slightly earlier
>   x86/setup: vmap heap nodes when they are outside the direct map
>   x86/setup: Do not create valid mappings when directmap=no
> 
> Julien Grall (8):
>   xen/vmap: Check the page has been mapped in vm_init_type()
>   xen/vmap: Introduce vmap_size() and use it
>   xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention

Btw, if there was clear indication that e.g. this patch (fully ack-ed
afaict) can go in ahead of earlier patches, I probably would have put
it in already. Considering it sits half way through the series, I don't
want to blindly chance it, though.

Jan

>   xen/x86: Add support for the PMAP
>   xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
>   xen/arm64: mm: Use per-pCPU page-tables
>   xen/arm64: Implement a mapcache for arm64
>   xen/arm64: Allow the admin to enable/disable the directmap
> 
> Wei Liu (3):
>   x86/setup: Move vm_init() before acpi calls
>   x86/pv: Domheap pages should be mapped while relocating initrd
>   x86: Lift mapcache variable to the arch level


