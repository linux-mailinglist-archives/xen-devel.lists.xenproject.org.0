Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7393BE1B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 10:45:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764864.1175436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWu5W-0004bf-2E; Thu, 25 Jul 2024 08:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764864.1175436; Thu, 25 Jul 2024 08:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWu5V-0004Z1-VS; Thu, 25 Jul 2024 08:44:37 +0000
Received: by outflank-mailman (input) for mailman id 764864;
 Thu, 25 Jul 2024 08:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1nn=OZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWu5U-0004Ys-Bq
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 08:44:36 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e0244a4-4a62-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 10:44:34 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so52292966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 01:44:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad90e34sm47721866b.164.2024.07.25.01.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 01:44:33 -0700 (PDT)
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
X-Inumbo-ID: 1e0244a4-4a62-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721897074; x=1722501874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+RyqYk1s5dADHCQYvpaZbng6pCvpWh0WeQEqgzEk/sE=;
        b=Y/Ynjmm+hkBynizqrkfiNY6p29j7Wbh1agqzGmMJ1vhatMIxBKd4SaKSVGpKQ3e14R
         55EZGoNyAzG4ysNLKzlKyhml1m6carkwKmJK4ln+YThwjJgzeorb2koC9XbdsRWKmva5
         aWozchzp4ALU+laTqRNdKSD3rqOTuuf/8HE0dUJOohunmJAn7FQcHXSEcvHJIhfOf9cB
         U21sTFcdPGva6XQsmAUsKmkbIoPNUpKef6aYvEDxZnMgCwGIQwHijnJrM4VQVFzuQUSf
         5TZfm4u5q9aMJgrH/UciV5JclFeZuyOxyPnzH2M+9lMq9DEK7G8WEzh5cCUGi/ocpKYd
         hy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721897074; x=1722501874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RyqYk1s5dADHCQYvpaZbng6pCvpWh0WeQEqgzEk/sE=;
        b=MU+mzA5weP0e3o7HhG0ZJLCGvwK2PKMzCMhHaKkeLXXQU1HC8/I6CuF77C2kXilG7g
         qt+n1/bbkCp+yFVqjsmTyyeK+2/eWGvtT7z1tEv4pUVbAySMnFtfamHkK+brQq4/fHsY
         +4m6VrQfVGDRjdh/RjS0cyPQbkidftF9ypVo4+JtOgq+Qm1z0xJGhgDhkopNzGQ3kY6F
         Ghyp6qJYrXJreLYKjhckwJ/JXtYK44bn9Ymtx5W6GK1m0vuXbKq49vNNztVxHkyUVAOH
         Esg8SHIIcV9JvNampJzBAxG9ag35tS5+Sy6gE2aQT5sxu2ufk/aR6pjHPr4Yj7gszEyt
         6Eug==
X-Forwarded-Encrypted: i=1; AJvYcCU8T32vp+CeJ9DI1qLpEqSJnYjFPtfnJHPqKDIJPeJ6ZK7Hykqy144uVaZDPQuZMOV6spgfGQOSb+5cQx51dINhubKMuHret+4SlvpR6cw=
X-Gm-Message-State: AOJu0YyChQbXLch+zkLIIeVhcsSdq8jwDAmRJ2dO+JEYRu4jyDZ7vDPk
	4vGE7yIttCKnN2rHavHWZ5730N1pGeePE6Ap2YXz4QamLk56KvIuIpkKnD+bRg==
X-Google-Smtp-Source: AGHT+IFUMONjJKXJ42LgrHlhWx9iHUWD65l4AQgEdzUm9aLTgNpmvBJWd2Sk3I2jq7vsR39T7ZGZuw==
X-Received: by 2002:a17:907:3d9e:b0:a6f:e03a:99d with SMTP id a640c23a62f3a-a7ab27c1feamr453949966b.0.1721897073826;
        Thu, 25 Jul 2024 01:44:33 -0700 (PDT)
Message-ID: <d26bc29f-3ceb-4fe4-af58-c188f9bbf097@suse.com>
Date: Thu, 25 Jul 2024 10:44:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] x86/ucode: Introduce --force option to xen-ucode
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
 <20240725082725.2685481-4-fouad.hilly@cloud.com>
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
In-Reply-To: <20240725082725.2685481-4-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2024 10:27, Fouad Hilly wrote:
> Introduce --force option to xen-ucode to force skipping microcode version check, which
> allows the user to update x86 microcode even if both versions are the same or downgrade.
> xc_microcode_update() refactored to accept flags and utilize xenpf_microcode_update2.
> 
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> [v6]
> 1- Fix usage() output for -f option to be explicitly wrapped for 80 character width
> [v5]
> 1- Update commit message.
> 2- Re-phrase --force option description.
> [v4]
> 1- Add --force to xen-ucode options.
> 2- Update xc_microcode_update() to accept and handle flags.
> ---
>  tools/include/xenctrl.h   |  3 ++-
>  tools/libs/ctrl/xc_misc.c | 12 +++++++-----
>  tools/misc/xen-ucode.c    | 15 ++++++++++++---
>  3 files changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 9ceca0cffc2f..2c4608c09ab0 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1171,7 +1171,8 @@ typedef uint32_t xc_node_to_node_dist_t;
>  int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
>  int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
>                     xc_cputopo_t *cputopo);
> -int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
> +int xc_microcode_update(xc_interface *xch, const void *buf,
> +                        size_t len, unsigned int flags);
>  int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver);
>  int xc_get_ucode_revision(xc_interface *xch,
>                            struct xenpf_ucode_revision *ucode_rev);
> diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
> index 50282fd60dcc..6a60216bda03 100644
> --- a/tools/libs/ctrl/xc_misc.c
> +++ b/tools/libs/ctrl/xc_misc.c
> @@ -203,11 +203,12 @@ int xc_physinfo(xc_interface *xch,
>      return 0;
>  }
>  
> -int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
> +int xc_microcode_update(xc_interface *xch, const void *buf,
> +                        size_t len, unsigned int flags)
>  {
>      int ret;
>      struct xen_platform_op platform_op = {};
> -    DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update, uc);
> +    DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update2, uc);
>  
>      uc = xc_hypercall_buffer_alloc(xch, uc, len);
>      if ( uc == NULL )
> @@ -215,9 +216,10 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
>  
>      memcpy(uc, buf, len);
>  
> -    platform_op.cmd = XENPF_microcode_update;
> -    platform_op.u.microcode.length = len;
> -    set_xen_guest_handle(platform_op.u.microcode.data, uc);
> +    platform_op.cmd = XENPF_microcode_update2;
> +    platform_op.u.microcode2.length = len;
> +    platform_op.u.microcode2.flags = flags;
> +    set_xen_guest_handle(platform_op.u.microcode2.data, uc);
>  
>      ret = do_platform_op(xch, &platform_op);
>  
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index 2c9f337b86cb..688e540943b1 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -13,6 +13,8 @@
>  #include <xenctrl.h>
>  #include <getopt.h>
>  
> +#include <xen/platform.h>
> +
>  static xc_interface *xch;
>  
>  static const char intel_id[] = "GenuineIntel";
> @@ -79,7 +81,9 @@ static void usage(FILE *stream, const char *name)
>              "options:\n"
>              "  -h, --help            display this help\n"
>              "  -s, --show-cpu-info   show CPU information\n"
> -            "Usage: %s [microcode file | options]\n", name, name);
> +            "  -f, --force           skip certain checks; do not use unless\n"
> +            "you know exactly what you are doing\n"

Did you look at the produced output? Imo you want to have

            "  -f, --force           skip certain checks; do not use unless\n"
            "                        you know exactly what you are doing\n"

> +            "Usage: %s [microcode file [-f,--force] | options]\n", name, name);

At least

            "Usage: %s [microcode file [-f|--force] | options]\n", name, name);

But: "options" now includes -f / --force, yet that on its own makes no sense.
I think this needs further textual clarification to properly indicate what is
valid to use and what is not.

Jan

