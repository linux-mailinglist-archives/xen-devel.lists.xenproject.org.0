Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6FA41BFD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 12:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895121.1303722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmWEs-0001FW-L4; Mon, 24 Feb 2025 11:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895121.1303722; Mon, 24 Feb 2025 11:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmWEs-0001Dm-IC; Mon, 24 Feb 2025 11:03:06 +0000
Received: by outflank-mailman (input) for mailman id 895121;
 Mon, 24 Feb 2025 11:03:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmWEq-0001Dg-V8
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 11:03:04 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ead349b3-f29e-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 12:03:03 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e058ca6806so7766745a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 03:03:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5decdfe758asm18181796a12.0.2025.02.24.03.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 03:03:02 -0800 (PST)
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
X-Inumbo-ID: ead349b3-f29e-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740394982; x=1740999782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LUsgrDbGDqz3JT6MJKa0wZY0IymMrnzBUU4h9fcD8Ek=;
        b=EW9ICLlD009vAmX5U3VPpqvodu139K+5a9FF+GRo0OOo5Lc6axuMTALfF4WIsn61Jm
         ARPThr4UR4Ef5BbbV3d2d+EHsNkU/R3EdBQ+bVHXaYjmUX1DzUdlbV0tuTiYOkGlQRAM
         YWT06rVQLymZjFsCC1bzlUG4oiP21turcWEo3hZqmfhcIgOVrR5eK5o3G/srSrJ2z3aX
         ECqJmRxZrlovVhrroWSC/pNTu8hyJXzhS0n0Hf96jzkfKc9Boj0bLF//+EiKsHqpkagp
         bipjflTKDCM/XEPAw6ZjkRou/AZyUsXAKDxTo6r+szGf4UtOXQsYdET+I8scMsiDuOQu
         ilcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394982; x=1740999782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUsgrDbGDqz3JT6MJKa0wZY0IymMrnzBUU4h9fcD8Ek=;
        b=YL1+6UskcoeqoHjMakTerWweAvOsYRZxMxczqfKQanVUfuCkQEOG9WhiH/YJZ0QACt
         fjgKyUtCWBrYQDV+nJjMyxkza/PsXkBUUSNVnqHjgLZb73fSKcqMUmvBEF1V7P6cHcvy
         a0Evgp9GpWY9lFL1dQ+bKwTOn5nf0R5xDuFGCkKntmpL/V2x8cxa7nniIeNEi3zo+wGh
         l+r2f7TBOKRLfzV4tTN03sBoRSDgJO0f9g6K4xpu6wuOEOD5O9n38jvAGNnvwa4eIoy7
         3NLvQC03Amfb/Y6s0xIq0U5BRP57YNTYEFFh8xCZlAqcjSmoyxeSUMsrej/GVKK/vLSE
         RbgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxdISqIGsAnDL8QVjbFhc3Xm4asitduuJlHbgPbGfg79lVsgn9PsHIgTCr3n1yl3p4YXCj7vBOhJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6U8IaJomKjapePer8/+TnUXaBDVMbk6+sXHgt+0llofo3z7iJ
	jx13oNw9s/WYF8G2XGHmh04nxa0XUijopkIbM9Vxo8fhF+KPRjSLuZ/VY7gMog==
X-Gm-Gg: ASbGncu7rfdMP8keNU1Rb5w6bXi1htoydFj0f4RrEEwPCD/exc8JnSx9XiskjWy6puF
	gcflb5WcPuVpB3xgJT3y1kqCMAZ63TNc7TvdiI5k2zK0wagCI31ob/NwdfK3qwxuK1Ech7Av3UV
	2GeudTW0SSdsZn63hR0/iuZDuauV1hb7Ot320BOPboSlP7ytFRNyLJR7+VfdnpBOoqgk6v9krXQ
	CSGEva9moMpq1f9Vj4C7xRHHBRef1VlhIpZm7Bf/N9N3l3b56tH684Y6WXMEJNAq3FaCdm8lRWX
	bUoUh+cTCf80i9RNneBdlFNMsNN61hk6s2cEdKom506+XEYhgEdGekWOMKcMOs9yzWlpQOBAeEt
	YACI7dWaTOkg=
X-Google-Smtp-Source: AGHT+IEXv4XYtlQNviznBNX2xCXD/XyEvRkyNT+Nl3KZ1MHHPM3hEvJCAsPtJ1YRJ6CocO7M0lqMxA==
X-Received: by 2002:a05:6402:2790:b0:5e0:58ca:6706 with SMTP id 4fb4d7f45d1cf-5e0b7253e3fmr14188112a12.30.1740394982460;
        Mon, 24 Feb 2025 03:03:02 -0800 (PST)
Message-ID: <21cbd761-7ba0-4608-9076-75d0412e647e@suse.com>
Date: Mon, 24 Feb 2025 12:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] xen/console: print Xen version via keyhandler
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250221220925.1391144-1-dmukhin@ford.com>
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
In-Reply-To: <20250221220925.1391144-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2025 23:10, dmkhn@proton.me wrote:
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -210,10 +210,29 @@ void __init xen_build_init(void)
>          }
>      }
>  #endif /* CONFIG_X86 */
> -    if ( !rc )
> -        printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
>  }
>  #endif /* BUILD_ID */
> +
> +void print_version(void)
> +{
> +    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> +           xen_major_version(), xen_minor_version(), xen_extra_version(),
> +           xen_compile_by(), xen_compile_domain(), xen_compiler(),
> +           xen_build_info(), xen_compile_date());
> +
> +    printk("Latest ChangeSet: %s\n", xen_changeset());
> +}
> +
> +void print_build_id(void)
> +{
> +    /*
> +     * NB: build_id_len may be 0 if XEN_HAS_BUILD_ID=n.
> +     * Do not print empty build-id.
> +     */
> +    if ( build_id_len )
> +        printk("build-id: %*phN\n", build_id_len, build_id_p);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C

I'm sorry to be picky, but why do you think I said in the v5 reply where
I think the code additions want to go? As it stands, you could as well
have left the editing to me, while committing, as now I will still need
to edit things.

Jan

