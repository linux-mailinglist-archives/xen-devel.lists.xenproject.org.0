Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C146187E9F5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694689.1083701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmCs4-0006QF-Tq; Mon, 18 Mar 2024 13:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694689.1083701; Mon, 18 Mar 2024 13:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmCs4-0006OQ-Q3; Mon, 18 Mar 2024 13:17:44 +0000
Received: by outflank-mailman (input) for mailman id 694689;
 Mon, 18 Mar 2024 13:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmCs3-0006OK-Jw
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:17:43 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6d4ecb4-e529-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 14:17:42 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d4a901e284so20850151fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:17:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 rf22-20020a1709076a1600b00a450b817705sm4858244ejc.154.2024.03.18.06.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:17:41 -0700 (PDT)
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
X-Inumbo-ID: e6d4ecb4-e529-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710767862; x=1711372662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAfHcqOuoyowVDXX5Dlp/ajXlFsU4Lc2t/kbY7CFOAM=;
        b=BtcaHTe1AZ3KUOVU7eQIt2f8dy3aRO+k4ADuyOy0DujD+MFps22q6rYpbLJjZPSi4x
         9VNm4MzrAhWhU65014NVUQ50HLNe6LmEhiv4z6V0zq7HbXHv5yYzIuRq3ykqrFl7oEtU
         ePbi4hFXKWNkJSh6GwCJWRno78JlEOctXelNH0HIJ6gXCzWn/DHALYTig6LrJSeO3uyE
         rw9U69civsJEU2wtz7sdGBLHZBJ0B+Xxeq2DSzyOWqRhmZwzD578/3Gz0Fta1vVBGbfR
         FLPuSnX+GESMHkhifts1F7UVW/S9i+xqqaFnuwcafTdDcCBmVVdseqCpzBJFvxyol02q
         Flmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710767862; x=1711372662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAfHcqOuoyowVDXX5Dlp/ajXlFsU4Lc2t/kbY7CFOAM=;
        b=t5YHQuMprkPlsuBaYj6BXipHc789yqxmyg6JM3ZZIhCiUqrlduN+Af/pQXB+BroyC/
         1czP0dX/F55IhxcAD2ml0n+jMKe1P3DFZkvANENOllILwLzNwRrmCCe5jVOeXF+DcizU
         S+A7blRi21dFNnIjOAgKAAmV9zQIv+c1AM7X2SZfBjJck1oxUFnSANmqu/PDwtpG5fwY
         mIBL1JlYFVppWtDXqepWZO+hYicgJMJU30Uo42Yh2H7OLBj0f5rfiZRQ74L6IPcvDQ84
         VxQ0zzOxGEeb0Xv2fz1tK1gFr5F3gVA/5XLc2/c+L9L0WXS1p/NcxQHMeGoQbh6U5Ir5
         jeIA==
X-Forwarded-Encrypted: i=1; AJvYcCV4pxkCBNgjByQj9aYBxMRJQuflWDY17tbrVHZUN/E6Akp1XP77BPT7tlZYOcxmePDIWdoFgnAUeZzOw7mnr4NhTVv+2z+8eUmLOGeiKSw=
X-Gm-Message-State: AOJu0YxuQOBOwYdh5wzAR2lsSVVdOzUBiwjYXyyDlEqF0j1Sh//8zT9v
	MeKV1vNrYtfMzQZPi6Y++FEg1v1+osNVrFDNVqicmh8qhn/zB2DZiwxBTbgljg==
X-Google-Smtp-Source: AGHT+IGYqghyRcxGiZu8VvpwH11TnJ1be/qORUGKgJzfaLFwolNnEIdNYCh0+VA6LHNI/M2uh5XUzQ==
X-Received: by 2002:a2e:9c18:0:b0:2d4:676b:f591 with SMTP id s24-20020a2e9c18000000b002d4676bf591mr4637667lji.45.1710767861935;
        Mon, 18 Mar 2024 06:17:41 -0700 (PDT)
Message-ID: <47ae2b45-b5da-4c5c-bbea-387f44d21a2f@suse.com>
Date: Mon, 18 Mar 2024 14:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/virtual-region: Rework how bugframe linkage works
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
 <20240318110442.3653997-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240318110442.3653997-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 12:04, Andrew Cooper wrote:
> The start/stop1/etc linkage scheme predates struct virtual_region, and as
> setup_virtual_regions() shows, it's awkward to express in the new scheme.
> 
> Change the linker to provide explicit start/stop symbols for each bugframe
> type, and change virtual_region to have a stop pointer rather than a count.
> 
> This marginly simplifies both do_bug_frame()s and prepare_payload(), but it
> massively simplifies setup_virtual_regions() by allowing the compiler to
> initialise the .frame[] array at build time.
> 
> virtual_region.c is the only user of the linker symbols, and this is unlikely
> to change given the purpose of struct virtual_region, so move their externs
> out of bug.h
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Of course ...

> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -9,12 +9,25 @@
>  #include <xen/spinlock.h>
>  #include <xen/virtual_region.h>
>  
> +extern const struct bug_frame
> +    __start_bug_frames_0[], __stop_bug_frames_0[],
> +    __start_bug_frames_1[], __stop_bug_frames_1[],
> +    __start_bug_frames_2[], __stop_bug_frames_2[],
> +    __start_bug_frames_3[], __stop_bug_frames_3[];
> +
>  static struct virtual_region core = {
>      .list = LIST_HEAD_INIT(core.list),
>      .text_start = _stext,
>      .text_end = _etext,
>      .rodata_start = _srodata,
>      .rodata_end = _erodata,
> +
> +    .frame = {
> +        { __start_bug_frames_0, __stop_bug_frames_0 },
> +        { __start_bug_frames_1, __stop_bug_frames_1 },
> +        { __start_bug_frames_2, __stop_bug_frames_2 },
> +        { __start_bug_frames_3, __stop_bug_frames_3 },
> +    },
>  };
>  
>  /* Becomes irrelevant when __init sections are cleared. */
> @@ -22,6 +35,13 @@ static struct virtual_region core_init __initdata = {
>      .list = LIST_HEAD_INIT(core_init.list),
>      .text_start = _sinittext,
>      .text_end = _einittext,
> +
> +    .frame = {
> +        { __start_bug_frames_0, __stop_bug_frames_0 },
> +        { __start_bug_frames_1, __stop_bug_frames_1 },
> +        { __start_bug_frames_2, __stop_bug_frames_2 },
> +        { __start_bug_frames_3, __stop_bug_frames_3 },
> +    },
>  };

... this is now calling yet louder for splitting runtime from init bug
frame records.

Jan

