Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45759329CD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 17:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759663.1169342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTjeb-00081M-TC; Tue, 16 Jul 2024 14:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759663.1169342; Tue, 16 Jul 2024 14:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTjeb-0007yv-Qe; Tue, 16 Jul 2024 14:59:45 +0000
Received: by outflank-mailman (input) for mailman id 759663;
 Tue, 16 Jul 2024 14:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTjea-0007yp-Oh
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 14:59:44 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08b30351-4384-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 16:59:43 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-58e76294858so11304382a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 07:59:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc468b1sm59535355ad.260.2024.07.16.07.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 07:59:42 -0700 (PDT)
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
X-Inumbo-ID: 08b30351-4384-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721141983; x=1721746783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mvgbEvMtU3g6RzBMadlS7owNr7sGYEFMNDPh9YBsZ5U=;
        b=A7jbdb7E4M4bCioZWaCYQ7bEvFL5mpRgX3ZrZTvh9sN/9Ql0LWIINqFhK3DTpttH6U
         74J7ozr4YGFzBXTL/KAkbzzlY3cl1AANycV0JFsnI1R5Yc8kEce812NYzsVthLAM5gfa
         wsPRu+bVd0Q1GdgcYXaJJkI6+MyRa+P7rRcpIeqC5Vn4am9oh3rH/htPEV316Yp1+qq+
         fU8ba79o6M7AFpP2Iqv8p7k0y/EZsQCdB5npdPZQ6mp3yoqSPaDtUaztmT4A0B47MmaI
         Te4gtLMLzZvtRN3OMhdtiC63cms6T3Lz3KfmXA5nCvMRkA4kSyzjqLL+++FsYswpNaXL
         6C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721141983; x=1721746783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvgbEvMtU3g6RzBMadlS7owNr7sGYEFMNDPh9YBsZ5U=;
        b=cgXG55kFN+Gw3UTR1Bt1diFckQKkSAjcSK94qmy0iDI/rcwa1fiCOuYshDM2ZJgerM
         TU+jMJ6Bi5nzODD4EuN4rCq4/8+Ksd0UaKjnPHF61SCEPBLvvL4J1B2iQdAPhQ5YvFCD
         jirjfCiy/xKNEtB1IlL822B4IlWNgJGMD4Kjzr77EQTwUg0nlRzSNtzI1zmIRxcb9xGB
         FJEgsz8U/eJF9RtqTBdilrkZNpTGPpTbpPNcVRZ7AloL8X3l0LkwerU/+5WjQDKefbI+
         x9JhlH2rKmO8FP6U5g++80DPoIoiQ2XQzb4XIbV9BlcgaqsMslKefT+Xz9pbbMADhGSz
         lx9w==
X-Forwarded-Encrypted: i=1; AJvYcCUpfCEUfoWwRAwVxMWYoahkfuEOCNFpOczT8PQO0XaJ7m0Sls/MZff95sUQgaigAO+nqwh5h3Lm3vw6PSZTA9iYU6v+tWueZe1xwWRt1fY=
X-Gm-Message-State: AOJu0Yzq7plQtFEWJN51HGgA1hkqTsBNWv7QEZTo647p8JBU0KvMgxmS
	yN0TcIkIuAU8U9Vzgxa8IBYe8Qmd+gKMPEWNyWj5KtVm9+bEcusWTGsS3z2Oeg==
X-Google-Smtp-Source: AGHT+IEvbsjXgZ6OgidgQyfwFy9h9BBI+4lYVUblqCnFuc/puqosdz1xl73mB4d5+jxx7qQd3Q3+yg==
X-Received: by 2002:a17:906:3d6:b0:a77:cd4f:e4f1 with SMTP id a640c23a62f3a-a79edcf5c09mr174671866b.27.1721141982739;
        Tue, 16 Jul 2024 07:59:42 -0700 (PDT)
Message-ID: <313d214c-3a96-45ad-9f53-8e4f54510e50@suse.com>
Date: Tue, 16 Jul 2024 16:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] x86/ucode: Utilize ucode_force and remove
 opt_ucode_allow_same
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240712130749.1272741-1-fouad.hilly@cloud.com>
 <20240712130749.1272741-5-fouad.hilly@cloud.com>
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
In-Reply-To: <20240712130749.1272741-5-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 15:07, Fouad Hilly wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -90,6 +90,16 @@ struct ucode_mod_blob {
>      size_t size;
>  };
>  
> +struct microcode_patch_with_flags {
> +    unsigned int flags;
> +    struct microcode_patch *patch;
> +};
> +
> +struct microcode_nmi_patch_with_flags {
> +    unsigned int flags;
> +    const struct microcode_patch *patch;
> +};

Why two different structures? I have to admit that I can't spot where the
difference (const or not) would matter?

Also for an internal struct I don't think you need the microcode_ prefixes.

> @@ -284,21 +286,22 @@ static enum microcode_match_result cf_check compare_patch(
>      return compare_revisions(old->rev, new->rev);
>  }
>  
> -static int cf_check apply_microcode(const struct microcode_patch *patch)
> +static int cf_check apply_microcode(const struct microcode_patch *patch,
> +                                    unsigned int flags)
>  {
>      uint64_t msr_content;
>      unsigned int cpu = smp_processor_id();
>      struct cpu_signature *sig = &this_cpu(cpu_sig);
>      uint32_t rev, old_rev = sig->rev;
>      enum microcode_match_result result;
> +    bool ucode_force = flags == XENPF_UCODE_FORCE;

Why == ? The term "flags" usually stands for there being multiple boolean
indicators in a single value. That would demand use of & here.

Jan

