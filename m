Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B849B3249
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 14:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826593.1240902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5QEL-0001O4-Hi; Mon, 28 Oct 2024 13:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826593.1240902; Mon, 28 Oct 2024 13:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5QEL-0001Lp-Ef; Mon, 28 Oct 2024 13:56:25 +0000
Received: by outflank-mailman (input) for mailman id 826593;
 Mon, 28 Oct 2024 13:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5QEK-0001Lj-2T
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 13:56:24 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a0b685b-9534-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 14:56:22 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so2932257f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 06:56:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3b57bsm9607178f8f.26.2024.10.28.06.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 06:56:21 -0700 (PDT)
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
X-Inumbo-ID: 6a0b685b-9534-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730123782; x=1730728582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yzc0EUUWaggXx9/0f4DprCAboeZLjPTMGpgoQczsnpw=;
        b=GfNFqrJ8FmLBki7e7hpLGzGlGtdaPvMw4J7flijpBdFNXhe52i+UeXONDJ2PXrbIOh
         MTqPEx5l2gcdaHZvgrZ3zZZcgg9aqVNn8dzcvhAD3NkjP9u3eSohf7T4daa8JgUWoa00
         yieoVLbbXG1NjAwfQInLm2s6gwfFWHefQA5JAkwhPde2iogJxgHghjwCUu3DSx0LQCIn
         5pTA9kDsWpPzkw+Cxv3+W04lBTlMW3eH7n1IllJ/HC/2D1lJKNrK/Kg/WMzfF/upHMTL
         D1yBASuRP1iN08pekGOcM8zopdtDpZdYDhcMDpU8ZCAkPnwFeg2ECkWokKeKCEGsH5WP
         XuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730123782; x=1730728582;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzc0EUUWaggXx9/0f4DprCAboeZLjPTMGpgoQczsnpw=;
        b=j7PMLWzDiheqou3a/UOSIdhr7UWILbjs61fWpMj3pzzzt6eTZxmOp3LaVSVdWVLWX0
         3/R90tJuAHY4a2TPl1eb/5M41Vsi9EI5eiNHoJ0eHn7f5eC1NUzgmo9Nec/q/RglRT2E
         SRAKjFy8ydhbnajFYUg1yGlwfJypu8Lum8Sjj55rvDD2nWlXBzw2qg5sJdqeDLmaYa/e
         /v80SLnCu5ajziTXMkXiQKVDVjqvB/1ixlgaiWQNhVuqY5sBXgea5pSzsS4Iux9lgfxC
         IPmUnHiUiBnWm3gOufw8BNLPbBIPIqyJOjr6+EM4mOKi1dI2z6z8ABn7amLzE0D3Fyv+
         7L5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvByk8npSH4eyNoKJcwG7/EUuZWQ1Kn10ZdSA4b1Zxx5Nr4eUcWCQwxXlsxU47pzOAmsp00WuLgyY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQRvg5xsKgeF/Zx8Hfi3PTewrZehXHmc0BdFaGLdFBga+0dmCB
	K5H93uyJRNAXChVZ0jYtFuK6Z5Rb6I5h9NYx+nc5DdczTcWa4qaCjyKMhjK7Rw==
X-Google-Smtp-Source: AGHT+IE53DHADXU4ZZvm1b0bPAodnD+yQs5rFT7XKbctAZDnGC0hCF3OUxj3f0m8XMlv8xk6Xq2SpQ==
X-Received: by 2002:adf:ebd2:0:b0:37d:3f42:9b59 with SMTP id ffacd0b85a97d-380610f7ea7mr6028208f8f.11.1730123781641;
        Mon, 28 Oct 2024 06:56:21 -0700 (PDT)
Message-ID: <901cfadc-c58e-4154-a5d3-ecf65c2a6336@suse.com>
Date: Mon, 28 Oct 2024 14:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] x86/ucode: Enforce invariant about module selection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241028091856.2151603-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 10:18, Andrew Cooper wrote:
> The work to add the `ucode=nmi` cmdline option left a subtle corner case.
> Both scan and an explicit index could be selected, and we could really find a
> CPIO archive and explicit microcode file.
> 
> Worse, because the if/else chains for processing ucode_{blob,mod} are opposite
> ways around in early_microcode_load() and microcode_init_cache(), we can
> genuinely perform early microcode loading from the CPIO archive, then cache
> from the explicit file.
> 
> Therefore, enforce that only one selection method can be active.

Question is - is this really the best of all possible behaviors? One may want
to use one approach as the fallback for the other, e.g. preferably use what
the CPIO has, but fall back to something pre-installed on the boot or EFI
partition.

> @@ -139,12 +148,16 @@ static int __init cf_check parse_ucode(const char *s)
>          else if ( !ucode_mod_forced ) /* Not forced by EFI */
>          {
>              if ( (val = parse_boolean("scan", s, ss)) >= 0 )
> -                ucode_scan = val;
> +            {
> +                opt_scan = val;
> +                opt_mod_idx = 0;
> +            }
>              else
>              {
>                  const char *q;
>  
> -                ucode_mod_idx = simple_strtol(s, &q, 0);
> +                opt_scan = false;
> +                opt_mod_idx = simple_strtol(s, &q, 0);
>                  if ( q != ss )
>                      rc = -EINVAL;
>              }

I think this latter part rather wants to be

                opt_mod_idx = simple_strtol(s, &q, 0);
                if ( q != ss )
                {
                    opt_mod_idx = 0;
                    rc = -EINVAL;
                }
                else
                    opt_scan = false;

to prevent a malformed ucode= to clobber an earlier wellformed ucode=scan.
(There are limits to this of course, as an out-of-range value would still
invalidate the "scan" request.)

> @@ -817,17 +830,42 @@ static int __init early_microcode_load(struct boot_info *bi)
>      const void *data = NULL;
>      size_t size;
>      struct microcode_patch *patch;
> +    int idx = opt_mod_idx;
> +
> +    /*
> +     * Cmdline parsing ensures this invariant holds, so that we don't end up
> +     * trying to mix multiple ways of finding the microcode.
> +     */
> +    ASSERT(idx == 0 || !opt_scan);
>  
> -    if ( ucode_mod_idx < 0 )
> -        ucode_mod_idx += bi->nr_modules;
> -    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
> -         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
> -        goto scan;
> -    ucode_mod = *bi->mods[ucode_mod_idx].mod;
> - scan:

Oh, the goto and label are going away here anyway. Never mind the comment on
the earlier patch then.

Jan

