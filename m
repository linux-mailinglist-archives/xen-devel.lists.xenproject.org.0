Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81DA9E00BD
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 12:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846567.1261737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI4kN-0003ao-Q9; Mon, 02 Dec 2024 11:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846567.1261737; Mon, 02 Dec 2024 11:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI4kN-0003ZL-M9; Mon, 02 Dec 2024 11:37:47 +0000
Received: by outflank-mailman (input) for mailman id 846567;
 Mon, 02 Dec 2024 11:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI4kM-0003ZF-7z
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 11:37:46 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8153ec3-b0a1-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 12:37:43 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa5b0d8bd41so481542266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 03:37:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c19e4sm498515666b.6.2024.12.02.03.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 03:37:42 -0800 (PST)
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
X-Inumbo-ID: d8153ec3-b0a1-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ4MTUzZWMzLWIwYTEtMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTM5NDYzLjU4MTgwOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733139463; x=1733744263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GjxuSy+YvMaH29RWgfUAV0MhXCaTgb3PMGWtIgTsvVo=;
        b=d3Zf2FmLg8SY2I82i+kkd3fnib2OZuxDYmLGxi+WLCgQm3nX5WzSNScMVtQwxy6tYo
         tBfvtwf4PUStl+8bP9PzLm4D+ms82mDROyfQcJRC96hBxjiZxM7fTZmqblc7F3n5/syN
         HNo6jCwDsm99uhVZdPNy0oSD8IKk2Bot469LQDBzSkQ9vCEfi3GAcZdMTfksgA6ZL6Ir
         C8pPoFB57DstIme0ViO1fsbjCA0wGqngVOfd52QdyMju/UYD2NdJrtV3FjemHReQE16W
         7rUG8NX36y1hRJyTKIueUvH1e5QTdrZVefHB9DMglAhU2EAUU2Yim2ena94mT0XpnQeG
         fTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733139463; x=1733744263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjxuSy+YvMaH29RWgfUAV0MhXCaTgb3PMGWtIgTsvVo=;
        b=JJmjJIxwHHLyDvkHRx7XlvqRyqDMdYChlRvCnFOnOww7mNAbWtSLCMXDXuNu3YLq3F
         74spZJnRPM4DILqvp8zR4M2x+Komm4vV7JuMZsKO/kSHC3c1xuyXfYxoVjXlMdyHos/h
         8P0Ax0Vt1ozKhEVX045vQIzFZh7z47Q6TybF0VFLqagI2h7U7aJmxK+3LGyINRg0Lpdx
         u7WuP9jcdSINd7SDbGispWH2z78qYelYX9paSQkW43hsBB1URkjKDs+7kd89ORmHbBEp
         trvaAYB/Oe9QkYkOZPhyFKFCsIf5WKc3CUI7C754M1/jrRI9JJjQSkalOuzCQtFmwtXq
         gnOg==
X-Forwarded-Encrypted: i=1; AJvYcCXKJx5289pfKyff1OzTHREbDvV2VS0+pQ9+emKHWKN/iXC6591dgAq+LQSreTcByrOO5kpsxmM+PrE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCQK5brQb+hWbCmlONKP5XoSFbob0U14dCc1x+OagP9l9GYnu/
	JhSdYtp4IfLAKsUtdgq2vGY3xYcWcOgEWrSTY5xu2VRMrCHzZwF78AhKX/F7/Q==
X-Gm-Gg: ASbGnct7C2Z65GiOuhntCVI419Od/LaN5duqF6tStI3R7zUXqeyIGyZyBPvGT0p1TEO
	jVehHz+hhkWweK0jtaDU5O0XDnMmWQb00zxfMjSgFmNWEiCMQmzo6ZjIv7l+XLVQWhw3znYutXH
	zGfKp7HoqkF3GYnRp0G7uE0FdlyQ1ZqJ+eAd4drVUg9o/F3O1lk5jrrUC1WAo4w5qsvaJdjjxq/
	pB/Tnx5sfqJz4NY5AojbyH6yFtYR445LCS5mF8uNUoyJiNHML+NC+06xy8XUZjHW33uPT2GMsKz
	nLdunQ55SK/dBFXjvryld0DCdLpSSoEivzc=
X-Google-Smtp-Source: AGHT+IGwWgGP1ISgsJUe3TTbnNTysw/3gMlqVeigeNzAmSS7//7zn0sZqGn+hOz0ou9pTnwmYrX+wg==
X-Received: by 2002:a17:907:7856:b0:aa5:27a8:4cbc with SMTP id a640c23a62f3a-aa580f266c6mr1954870266b.15.1733139462860;
        Mon, 02 Dec 2024 03:37:42 -0800 (PST)
Message-ID: <bf3edc2e-1bef-45c3-9853-a8a208d8888f@suse.com>
Date: Mon, 2 Dec 2024 12:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-8-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> Add the ability to detect both a formal hyperlaunch device tree or a dom0less
> device tree. If the hyperlaunch device tree is found, then count the number of
> domain entries, reporting if more than one is found.

"reporting" reads like informational logging, when comment and printk() in
walk_hyperlaunch_fdt() indicate this is actually an error (for now).

> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c
> @@ -14,14 +14,76 @@
>  
>  #include "fdt.h"
>  
> +static int __init find_hyperlaunch_node(void *fdt)
> +{
> +    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
> +    if ( hv_node >= 0 )

Nit: Blank line between declaration(s) and statement(s) please (also
elsewhere).

> --- a/xen/arch/x86/domain_builder/fdt.h
> +++ b/xen/arch/x86/domain_builder/fdt.h
> @@ -11,11 +11,16 @@
>  
>  #ifdef CONFIG_DOMAIN_BUILDER
>  int has_hyperlaunch_fdt(struct boot_info *bi);
> +int walk_hyperlaunch_fdt(struct boot_info *bi);
>  #else
>  static inline int __init has_hyperlaunch_fdt(struct boot_info *bi)
>  {
>      return -EINVAL;
>  }
> +static int __init walk_hyperlaunch_fdt(struct boot_info *bi)

inline?

Jan

