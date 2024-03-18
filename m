Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE6387EA16
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694702.1083731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmD3C-0001Yv-F1; Mon, 18 Mar 2024 13:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694702.1083731; Mon, 18 Mar 2024 13:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmD3C-0001WP-BF; Mon, 18 Mar 2024 13:29:14 +0000
Received: by outflank-mailman (input) for mailman id 694702;
 Mon, 18 Mar 2024 13:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmD3B-0001WJ-3u
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:29:13 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81cc2a5b-e52b-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 14:29:12 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a46c0b40157so109592266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:29:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p5-20020a170906604500b00a46a2ac0dbasm2824759ejj.197.2024.03.18.06.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:29:11 -0700 (PDT)
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
X-Inumbo-ID: 81cc2a5b-e52b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710768551; x=1711373351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2BEpNTh21JJwZw/ewuLcLG7ijbMcMVNCFoUq0q0tbA=;
        b=Lz3/6S4O447ON3Ycmz/B4/hDCPORuaSs+bpR81KurXk5hm9GloGoCtXEe8BQnoK4qi
         qTDozRIoNPmJljkHGs4KS29o7j2vNv/S+QElOQ1rd/C4fzRHVa++t0SseXamIHaF1uCr
         WKzW3BouOm4Gid0ow9d+KDD0IxrZvk3kr7P0zrBxAvNN5PnIiZ6PN3VUYAe7aMdMazpO
         TTmlncxoUq4Ya/1EcLNFQfdT3eSSBErKr8AAim0mJT7+gPFiX2Dxf9AvF31euiIIG46C
         mog+uOc7zapCUMsvyzeKtqVC5jCeQs+FdRcZX0SiyDFYPg6lRNK7NIqF16DWq+aqGl53
         UvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710768551; x=1711373351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2BEpNTh21JJwZw/ewuLcLG7ijbMcMVNCFoUq0q0tbA=;
        b=mFTIRx0HRrBcWGAU3LAjSv/E5Tr2QGWh0Zwx3x31Hx0KNFeQ8i7JRtmNZScazflATT
         S6NfX1PoIoC15uiReFYnwPaouqJri9Yy5aXmh3SYIRB3JFZM/n4iFhdFA0Dxttk7vAys
         8+uI/vyxfj1DXbYXyCo9WoxPcIhE20BrO/X/Rg/TuGb2D+g60EzjbxTf0KUgHllqfvV1
         EwtRwCpxLYJ9LwbHQhZ5jDyBvfrMko2ZPHlcYdgUiz9Cgy9BTaRTeq2iFs1yIsAhSXBy
         W05G7L87VVFnSRSmY5Suhe5dAevEs60BxpGk2y1AezwJp3EiWcIsQ9IZrdVYyUGe9sh3
         XSBw==
X-Forwarded-Encrypted: i=1; AJvYcCWAMuTESkk49ZQJhZk/GwQD2PUKoLq8BDUZWmk3bDyB7+KWsjOi6gdIUBToa6nd70nD1K5rklIwI/w2RPE3mLteyhoI8sXw4FoHsoJ7yjM=
X-Gm-Message-State: AOJu0YxAeOBZQVS8qH2K8lO0emrK+9l8Y9x/1oH+iB2g1IQzYDBpoI+s
	h6oyiDrY6VbdlEgHwryyAUk1CTldKdFOAQeJjtfpvGL11407gPoCEHxJauw55Q==
X-Google-Smtp-Source: AGHT+IEXss58LoC4IZ9PG45qrLOArpm3b+Oeo0miulVk4zRlj5n9tK/tzrilkHL463IXPS02GhLmCg==
X-Received: by 2002:a17:906:6582:b0:a46:1426:f7c with SMTP id x2-20020a170906658200b00a4614260f7cmr8155044ejn.63.1710768551533;
        Mon, 18 Mar 2024 06:29:11 -0700 (PDT)
Message-ID: <047ecaf2-66c6-4d07-ab14-9c50acfc1f9a@suse.com>
Date: Mon, 18 Mar 2024 14:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xen/virtual-region: Drop setup_virtual_regions()
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
 <20240318110442.3653997-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240318110442.3653997-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 12:04, Andrew Cooper wrote:
> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -39,6 +39,11 @@ static struct virtual_region core = {
>          { __start_bug_frames_2, __stop_bug_frames_2 },
>          { __start_bug_frames_3, __stop_bug_frames_3 },
>      },
> +
> +#ifdef CONFIG_X86
> +    .ex = __start___ex_table,
> +    .ex_end = __stop___ex_table,
> +#endif
>  };
>  
>  /* Becomes irrelevant when __init sections are cleared. */
> @@ -57,6 +62,11 @@ static struct virtual_region core_init __initdata = {
>          { __start_bug_frames_2, __stop_bug_frames_2 },
>          { __start_bug_frames_3, __stop_bug_frames_3 },
>      },
> +
> +#ifdef CONFIG_X86
> +    .ex = __start___ex_table,
> +    .ex_end = __stop___ex_table,
> +#endif
>  };

My main reservation here is this x86-specific code in a common file.
Are we certain both RISC-V and PPC will get away without needing to
touch this? If so, I might consider ack-ing. But really I'd prefer if
this could be minimally abstracted, via e.g. CONFIG_HAS_EXTABLE
(selected by x86 only for now).

Jan

