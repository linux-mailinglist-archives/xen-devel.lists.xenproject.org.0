Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85009D9643
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 12:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843646.1259277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtpe-0006jl-9f; Tue, 26 Nov 2024 11:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843646.1259277; Tue, 26 Nov 2024 11:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFtpe-0006gc-5r; Tue, 26 Nov 2024 11:34:14 +0000
Received: by outflank-mailman (input) for mailman id 843646;
 Tue, 26 Nov 2024 11:34:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFtpd-00061B-5m
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 11:34:13 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59e29a9e-abea-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 12:34:09 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5cfddb70965so6830658a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 03:34:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3fcf86sm5027755a12.63.2024.11.26.03.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 03:34:08 -0800 (PST)
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
X-Inumbo-ID: 59e29a9e-abea-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU5ZTI5YTllLWFiZWEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjIwODQ5LjIzMDI1NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732620848; x=1733225648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NXEf/dAtJZBLZtMU5kvPCJZklY+UbwtVTARyPY5N0jo=;
        b=L1bLN3k38jRxb/wQFMGHKC1EntlEnH29YEIf6NLSrcLceT5ZlI7OoX9HTBfJANAWTR
         txxuWa1jq4y5lsFTNpPbbyD91Vp6HV4qZzZCsKVNo3ixSun95Sx51wXxU4HvHcr1aA6m
         df93pk13pX+iDTKPIFWMjR60idRBrFCjdRd+ZckKQIs8AWPk8o1lYitz2MP+OJIXLw5A
         JJ8UUQ+jwOFz5nSpDfzPTCqKTeuUIs0m6i5U7Tw2PYQbWIaNp8X00q1JlK4BHfAp5gi5
         2PFFNikgFAIOQPk60ZT/9d3DYxlBmv2tM7CgvSFIHJrAXNjnaytP+w0ZGK9DPhl2E2rH
         uLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732620848; x=1733225648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXEf/dAtJZBLZtMU5kvPCJZklY+UbwtVTARyPY5N0jo=;
        b=t9+BpZ3J42/UGngT4WaQTPZovYQ52CT59MvhxfeCDcBuCs2RN7Zvnin/Nroru7N1Pw
         18x9KnIiHRH5oXsLhHoAgxWmjhZMLXA3Ck7l9qfx2POVcWl8z2sY5ImNsEavrsCzVzE8
         xa46iUav6A2hKtAK7cfl9C/Li/0jnGv7KlIDH+jpzygOCEAXKoqQTOUyuTD+5e1JkBtL
         O+68qs8lBFUcegV7ljlicfv2hhBonz73gEDn9gJAYuCU60TaUF5p/ckplhxf5hQp3AOd
         wnutr4IoAv0kEBMCBbQn7w+BpvivAaZU418VDEDyiEwynQiYZoBVJfqEh+jn8na027K0
         8x6Q==
X-Gm-Message-State: AOJu0YyUx9l+taBUEIko2b39DET8py7FrntiQ/jQsl/aOEx7c3ciybTu
	xpaimiN/2DrXTZtSMazWoE6GZz4PG7Qk9QUPeqdHoirr+fuF7rOgXRwYIy6mhg==
X-Gm-Gg: ASbGncuuoch4+AaCZxxR8ZfHg7/8303jeMCpxrmojJL4U3y9Eic/KrvReAygq4H/mxc
	tQBcFaD6LkF8NFvu1lNUXoBxgYemSrT5ClTFmvkFlkm/0nqlQ6cVdF9ANn+a2TqgaufadlrJRwH
	D3jUG/1MiuYf15oYVnyIbJUc2GmNATjjDCi3c1uR/gIHQeJoCSMBp5kr3xy1Xg9GNadqHUDRu3M
	x7X56HP+GRbVsETXjOErVrvepLKU4S8lM1DK4RyZaGB8DcqQclXJO8iDZOcjb/vjk9wcUgLLe3z
	qaz0CKcMFv4N3ywiNXHH5Icy7uTSV8lAuCY=
X-Google-Smtp-Source: AGHT+IFOuOQoWI0tGQqNUXP6wg+IpkUDCM6h6Fn61fZmqFGJqoAr78iBGoEwNWzigK+2Zt0GgNMsJg==
X-Received: by 2002:a05:6402:26cc:b0:5cf:98d:547b with SMTP id 4fb4d7f45d1cf-5d0205c2684mr14692607a12.5.1732620848607;
        Tue, 26 Nov 2024 03:34:08 -0800 (PST)
Message-ID: <3086afbe-5412-4dc5-bdce-7cd5b90a999d@suse.com>
Date: Tue, 26 Nov 2024 12:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86: Add architectural LBR declarations
To: ngoc-tu.dinh@vates.tech
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
 <20241118084914.22268-3-ngoc-tu.dinh@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20241118084914.22268-3-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 09:49, ngoc-tu.dinh@vates.tech wrote:
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -304,6 +304,17 @@
>  #define MSR_IA32_LASTINTFROMIP		0x000001dd
>  #define MSR_IA32_LASTINTTOIP		0x000001de
>  
> +/* Architectural LBR state MSRs */
> +#define MSR_IA32_LASTBRANCH_CTL		0x000014ce
> +#define  LASTBRANCH_CTL_LBREN		(1<<0) /* Enable LBR recording */
> +#define  LASTBRANCH_CTL_VALID		_AC(0x7f000f, ULL)
> +#define MSR_IA32_LASTBRANCH_DEPTH	0x000014cf
> +#define MSR_IA32_LER_INFO		0x000001e0
> +#define MSR_IA32_LASTBRANCH_0_INFO	0x00001200
> +#define MSR_IA32_LASTBRANCH_0_FROM_IP	0x00001500
> +#define MSR_IA32_LASTBRANCH_0_TO_IP	0x00001600
> +#define MAX_MSR_ARCH_LASTBRANCH_FROM_TO	64

This is rather NUM than MAX; MAX would be 63.

Jan


