Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F19C88DB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 12:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836311.1252192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXzD-0001aU-Hq; Thu, 14 Nov 2024 11:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836311.1252192; Thu, 14 Nov 2024 11:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXzD-0001Xh-Ej; Thu, 14 Nov 2024 11:26:07 +0000
Received: by outflank-mailman (input) for mailman id 836311;
 Thu, 14 Nov 2024 11:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBXzC-0001Xb-6m
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 11:26:06 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b69db8b-a27b-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 12:26:03 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d6a2aa748so316128f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 03:26:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada2d35sm1217706f8f.18.2024.11.14.03.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 03:26:02 -0800 (PST)
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
X-Inumbo-ID: 3b69db8b-a27b-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNiNjlkYjhiLWEyN2ItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTgzNTYzLjUyNDk5NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731583563; x=1732188363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r5d34F7KUc1m0vzt31kFemyCLBA/1UsPI6/PPXrUlls=;
        b=GaLoMmsxUSpJklrAxynlhbihQJAqRYDaGQN6EWd+t7TzfV87zOjcyfGm2Dhr4p5BE6
         lBDt5Wwz0F5UcAvefJVNGNhE3GxeDQ4bcZFb4uVnZy3osbR3VMyHV8+2qmLrGDawP7lh
         Z7s7DHl4vxsrp5OEA6WA2AxNWP7yOoD4bEkf6T7LaiINMXht+XS+iJJKwZFbKsCa+5r8
         E4lNmvrsOz+DDPkWkUYsqtwAyuy7AVmu3uGNoDNcFrYd75XIZqjZiEmxB7go5ap0hgX+
         brBKEBAcE1z4dI2UexCuIAFsO5gpZm3hV+k3/Fx4Os/u5zA8nVrCDH8v8F4M8FrOV2Cj
         VaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731583563; x=1732188363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5d34F7KUc1m0vzt31kFemyCLBA/1UsPI6/PPXrUlls=;
        b=VCb4eud1tEd+9QkCBqe0Jx+cvtuyRgKVFM+zTGDiAMlVqhAQHWsKvdXmZWm7bWO+Jr
         xBk+3Bga0f0cuZuvox5KtlBk3JqKk3wnV6pU7xsSPSt8/PjXPnd71tDbLmnD5y1mQlWY
         NkXA9r7mdyX79bTcd86D6GSEhNTFQ0NFA2pzZP74rJksiIvS6MtbFXhrP7X1TXv6jAc8
         gHYGSf3AecvYJGavVuj9V/YXWtG9hPFDFrL5QC575PRnJf8iRmAjGdYa4nPHzzPshYmD
         GjVqeOmYHJSAOnnUa5+F/W3EAcME0xaJJs4ud0jQ+mS6e/B7HEb9cP56hCzJXoOx4BqT
         vYbA==
X-Forwarded-Encrypted: i=1; AJvYcCXmuJiaNnf2DYHEoUomAs495fQrFI/mwgkyL8Te0gNXHN8JdUOEbAuUDyYuz6XHwga6vqDGIGe0VKc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRDhCe1aCsweUAPVbXWgqA2/W1qBOwISynSTYRgdJLzhiWKvnY
	LkioruaQIpnGhBCuUNq6MyAd/OZ0i89zfmlB0UDi30VxRU+yR5tqm8ZBxQ+PNA==
X-Google-Smtp-Source: AGHT+IEg0eavXiTdgvVjkcyUm7odtxVwkPgjUj5e/Eipbiwm4KF9m3YgSSTYP0hHJT8B2BAilpDp6g==
X-Received: by 2002:a05:6000:18af:b0:37d:3985:8871 with SMTP id ffacd0b85a97d-382185392fbmr1419344f8f.39.1731583562862;
        Thu, 14 Nov 2024 03:26:02 -0800 (PST)
Message-ID: <c25b7a62-fc47-440f-9521-f11b65e2cb8b@suse.com>
Date: Thu, 14 Nov 2024 12:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/ucode: Fix cache handling in
 microcode_update_helper()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
 <20241112211915.1473121-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241112211915.1473121-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2024 22:19, Andrew Cooper wrote:
> microcode_update_cache() now has a single caller, but inlining it shows how
> unnecessarily complicated the logic really is.
> 
> Outside of error paths, there is always one microcode patch to free.  Its
> either result of parse_blob(), or it's the old cached value.
> 
> In order to fix this, have a local patch pointer (mostly to avoid the
> unnecessary verbosity of patch_with_flags.patch), and always free it at the
> end.  The only error path needing care is the IS_ERR(patch) path, which is
> easy enough to handle.
> 
> Also, widen the scope of result.  We only need to call compare_patch() once,
> and the answer is still good later when updating the cache.  In order to
> update the cache, simply SWAP() the patch and the cache pointers, allowing the
> singular xfree() at the end to cover both cases.
> 
> This also removes all callers microcode_free_patch() which fixes the need to
> cast away const to allow it to compile.

I'm sure you're well aware that this in turn is just because of your opposition
to xfree() and alike taking const void *. Pointers needing to be to non-const
just because of eventual freeing is precisely the scenario why freeing (and
unmapping) functions better wouldn't take mutable pointers. Then ...

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -86,7 +86,7 @@ struct patch_with_flags {
>  static bool ucode_in_nmi = true;
>  
>  /* Protected by microcode_mutex */
> -static const struct microcode_patch *microcode_cache;
> +static struct microcode_patch *microcode_cache;

... this imo pretty undesirable change also wouldn't be needed.

Nevertheless, in the interest of not blocking this change over a long-standing
disagreement we have,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

